Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7068.1795733438388487803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 14:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mciJjXi1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261126225036be7020e6e90002075e-o2wao2@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261126225036be7020e6e90002075e
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 26 Nov 2026 23:50:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SxWV/xxUUQF2XKyGwNUD+xnCK94D+Qurpp75d2nLwNA=;
 b=mciJjXi1NjI4lCGMszr/qXa6wJOt305AWpHbQa9YCiDeP6IlQrQ5Lpjwk3s2OPqvciWVO1
 klgpyIXR7W6dWAtt9YEvq4jinxltL3VlH37+SKwZymFKCYe2faDgzCYgi7Pgyi7efKMIo5NK
 1rQ1gvw6ibPwK80egNGR+9M38eR+AymJ9T8f51AW82jW/NA1qzgWSYKV0IL5nm+N92l68wlN
 l6ahswS/VETGyNH8ha9ngcmhMT6ghlKQPJh0f/0r9g1ZoAfpLFZDdsudQB2KwY05hyhB7Rxs
 EUwo2uLwyXTBRCqrwqz7TO14cI1XWr6Ooy4D4xfaGDjGu6T404v6Y9Fw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 3/4] nss: patch CVE-2024-11706
Date: Thu, 26 Nov 2026 23:50:09 +0100
Message-ID: <20261126225010.31859-3-peter.marko@siemens.com>
In-Reply-To: <20261126225010.31859-1-peter.marko@siemens.com>
References: <20261126225010.31859-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 22:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133096
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing [1].

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=1923767

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-11706.patch              | 35 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11706.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-11706.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-11706.patch
new file mode 100644
index 0000000000..6ec92052ad
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-11706.patch
@@ -0,0 +1,35 @@
+From aa9e1c7cd91cc1d4c205bc73bfc40855ec0af2f9 Mon Sep 17 00:00:00 2001
+From: John Schanck <jschanck@mozilla.com>
+Date: Mon, 21 Oct 2024 21:22:36 +0000
+Subject: [PATCH] Bug 1923767 - pk12util: improve error handling in
+ p12U_ReadPKCS12File. r=nss-reviewers,nkulatova
+
+Differential Revision: https://phabricator.services.mozilla.com/D225165
+
+--HG--
+extra : moz-landing-system : lando
+
+CVE: CVE-2024-11706
+Upstream-Status: Backport [https://github.com/mozilla/nss/commit/aa9e1c7cd91cc1d4c205bc73bfc40855ec0af2f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/cmd/pk12util/pk12util.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/cmd/pk12util/pk12util.c b/nss/cmd/pk12util/pk12util.c
+index f84002ca0..2baab969f 100644
+--- a/nss/cmd/pk12util/pk12util.c
++++ b/nss/cmd/pk12util/pk12util.c
+@@ -449,10 +449,10 @@ p12U_ReadPKCS12File(SECItem *uniPwp, char *in_file, PK11SlotInfo *slot,
+ 
+     /* revert the option setting */
+     if (forceUnicode != pk12uForceUnicode) {
+-        rv = NSS_OptionSet(__NSS_PKCS12_DECODE_FORCE_UNICODE, pk12uForceUnicode);
+-        if (rv != SECSuccess) {
++        if (SECSuccess != NSS_OptionSet(__NSS_PKCS12_DECODE_FORCE_UNICODE, pk12uForceUnicode)) {
+             SECU_PrintError(progName, "PKCS12 decoding failed to set option");
+             pk12uErrno = PK12UERR_DECODEVERIFY;
++            rv = SECFailure;
+         }
+     }
+     /* rv has been set at this point */
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index 8be7072ee5..9bebd1c6c4 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch \
            file://CVE-2024-11704.patch \
            file://CVE-2024-11705.patch \
+           file://CVE-2024-11706.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
