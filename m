Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DED9C4345F
	for <webhook@archiver.kernel.org>; Sat,  4 May 2024 21:00:30 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.6328.1714856429458354147
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 May 2024 14:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PwgK4Wqt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240504210026cd4b99be1a7924bf78-o_kepu@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240504210026cd4b99be1a7924bf78
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 04 May 2024 23:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MrwbqR1a5KUepyPA/A4E7oDjzuRMsoyyY0w3f3G/SMk=;
 b=PwgK4Wqt12XPqZQLjRKaRe9iWynrSbpLUovECsqiLzA8SjiG6y28wDXRdLPqCyIOuwicAt
 Egt4xz6wBuqX3tNw35vJdlWD5B/kjLS3NYs5co80Vy/M2E+mkJxWcIMR8b3VAkaqF+hLtj2H
 6oQX1CWSVUw7Zu4DLReLKnAL3r7xQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] nss: patch CVE-2024-0743
Date: Sat,  4 May 2024 22:59:27 +0200
Message-Id: <20240504205927.3399327-2-peter.marko@siemens.com>
In-Reply-To: <20240504205927.3399327-1-peter.marko@siemens.com>
References: <20240504205927.3399327-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 May 2024 21:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110255

From: Peter Marko <peter.marko@siemens.com>

https://nvd.nist.gov/vuln/detail/CVE-2024-0743
mentions bug 1867408 as tracking fix for this issue.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...a-defensive-check-for-large-ssl_DefS.patch | 40 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.74.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch
new file mode 100644
index 0000000000..af32c42aec
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch
@@ -0,0 +1,40 @@
+From 2e75513a13e3cf4a16626ef654242b3b07cc8f29 Mon Sep 17 00:00:00 2001
+From: John Schanck <jschanck@mozilla.com>
+Date: Mon, 11 Dec 2023 19:24:14 +0000
+Subject: [PATCH] Bug 1867408 - add a defensive check for large ssl_DefSend
+ return values. r=nkulatova
+
+Differential Revision: https://phabricator.services.mozilla.com/D195054
+
+--HG--
+extra : moz-landing-system : lando
+
+CVE: CVE-2024-0743
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/2e75513a13e3cf4a16626ef654242b3b07cc8f29]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/ssl/sslsecur.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ssl/sslsecur.c b/lib/ssl/sslsecur.c
+index 59ef064c9..9e994f4b5 100644
+--- a/lib/ssl/sslsecur.c
++++ b/lib/ssl/sslsecur.c
+@@ -453,7 +453,12 @@ ssl_SendSavedWriteData(sslSocket *ss)
+         if (rv < 0) {
+             return rv;
+         }
+-        ss->pendingBuf.len -= rv;
++        if (rv > ss->pendingBuf.len) {
++            PORT_Assert(0); /* This shouldn't happen */
++            ss->pendingBuf.len = 0;
++        } else {
++            ss->pendingBuf.len -= rv;
++        }
+         if (ss->pendingBuf.len > 0 && rv > 0) {
+             /* UGH !! This shifts the whole buffer down by copying it */
+             PORT_Memmove(ss->pendingBuf.buf, ss->pendingBuf.buf + rv,
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index c394c82e69..26baf669d1 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://0001-Bug-1780432-CVE-2023-5388-Timing-attack-against-RSA-.patch;patchdir=nss \
+           file://0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch;patchdir=nss \
            "
 SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
 
-- 
2.30.2


