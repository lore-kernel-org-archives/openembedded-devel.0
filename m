Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9203.1793921113518837701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 15:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=malViW6Y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026110523251020d48e00cc000207da-cvkshr@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026110523251020d48e00cc000207da
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Nov 2026 00:25:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=O4ECox6IMVEV7jcgo6x4jdIYDn4+n9zk2MftXKgJlxQ=;
 b=malViW6YaDFNFRNPBR3nW4oWqY6hUzmus7uFTeZyZKBJ8U4kZ5U0wTEUygm67CvUoRZBIq
 TLoFDPYDFcx+5h5k4A17mlzekDJo0uLa6islF6dbXNuFM6NSmAWSmKWwwVr09mdgYVsYjPpk
 Qu0muEL9uL3x+B8gwps/KzEysZ7s23eug6axCuxBfl7jGAgNtHQ+n2IoemjZie8E5Q3n1BE0
 1FuMUpdglXu/E9rz8gAQRJ6EgnnFmFVqPLcWC4HvuCHyEra4xe7ugrXCx3l8iqeotRQRXyrd
 4wR7o88bbQk2hIBsvAslCm3KGxezn8eTas4wVlo6QqYhIQi+/YgmAZZQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 2/4] nss: patch CVE-2024-11705
Date: Fri,  6 Nov 2026 00:23:12 +0100
Message-ID: <20261105232314.3699451-2-peter.marko@siemens.com>
In-Reply-To: <20261105232314.3699451-1-peter.marko@siemens.com>
References: <20261105232314.3699451-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 23:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131955
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing [1].
It was modified because hunk 1 was only introduced in [2] not et
available in version 3.98.

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=1921768
[2] https://github.com/mozilla/nss/commit/9adf6e998915668f86d38436ed494ec7a468a9de

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-11705.patch              | 43 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11705.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-11705.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-11705.patch
new file mode 100644
index 00000000000..707f4b08dd2
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-11705.patch
@@ -0,0 +1,43 @@
+From c59fad13330727ff65ce015055bc28cece4e38f7 Mon Sep 17 00:00:00 2001
+From: John Schanck <jschanck@mozilla.com>
+Date: Mon, 30 Sep 2024 17:01:39 +0000
+Subject: [PATCH] Bug 1921768 - allow null phKey in NSC_DeriveKey. r=rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D224134
+
+--HG--
+extra : moz-landing-system : lando
+
+CVE: CVE-2024-11705
+Upstream-Status: Backport [https://github.com/mozilla/nss/commit/c59fad13330727ff65ce015055bc28cece4e38f7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/lib/softoken/pkcs11c.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/softoken/pkcs11c.c b/nss/lib/softoken/pkcs11c.c
+index f06c2b43c..76665e5a4 100644
+--- a/nss/lib/softoken/pkcs11c.c
++++ b/nss/lib/softoken/pkcs11c.c
+@@ -7273,8 +7273,9 @@ NSC_DeriveKey(CK_SESSION_HANDLE hSession,
+     /*
+      * now lets create an object to hang the attributes off of
+      */
+-    if (phKey)
++    if (phKey) {
+         *phKey = CK_INVALID_HANDLE;
++    }
+ 
+     key = sftk_NewObject(slot); /* fill in the handle later */
+     if (key == NULL) {
+@@ -8820,7 +8821,9 @@ NSC_DeriveKey(CK_SESSION_HANDLE hSession,
+         crv = sftk_handleObject(key, session);
+         session->lastOpWasFIPS = key->isFIPS;
+         sftk_FreeSession(session);
+-        *phKey = key->handle;
++        if (phKey) {
++            *phKey = key->handle;
++        }
+         sftk_FreeObject(key);
+     }
+     return crv;
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index d180346b396..8be7072ee50 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0008-Bug-2083709-Remove-eMudhra-emSign-Root-CA-C1-and-emS.patch \
            file://0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch \
            file://CVE-2024-11704.patch \
+           file://CVE-2024-11705.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
