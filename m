Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9204.1793921116595203196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 15:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AJ6vIxJp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261105232514c546e42c5d0002073e-dwz4xj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261105232514c546e42c5d0002073e
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Nov 2026 00:25:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=E0/scWT579WFAIqBrz+uhEfBIZCmPvI09IqsFkV6NS8=;
 b=AJ6vIxJpxBiRMjlZ5IaplMemoJvGv2UVWZpLCzpqAkFH5oipo+sb7zrZYv2oJAFWR/LJUZ
 BxhscSiI8fXj1MtJ/1hWKB/yFo9/0t4A67imPIIKH+tDoAZ6FpnxncQEfk/SrX7iF6ef9dbg
 tCwtKguJJaye6VcULFVK8tyvLYTmKCmhfVttQkDARpEe06yZUav1gpYiMQLztk7hQ8xN8DGM
 1O27LNLKkHCRZG7nNbyoC/AhBI+agzGmsjTp9Ca8CdppJYp4GDnn/ah+m6ucuADITc2vkXDG
 GTyc90zM9kbyr4mNCc4mv+U4YOtUm6RW0/fZm98/ZbyJGpm4NlhlTXnw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 3/4] nss: patch CVE-2024-11706
Date: Fri,  6 Nov 2026 00:23:13 +0100
Message-ID: <20261105232314.3699451-3-peter.marko@siemens.com>
In-Reply-To: <20261105232314.3699451-1-peter.marko@siemens.com>
References: <20261105232314.3699451-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 23:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131956
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
index 00000000000..6ec92052adf
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
index 8be7072ee50..9bebd1c6c4d 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch \
            file://CVE-2024-11704.patch \
            file://CVE-2024-11705.patch \
+           file://CVE-2024-11706.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
