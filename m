Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D37D74948
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 22:13:38 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1147.1730240016380179515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 15:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Hb3qLqO7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024102922133413dc181df26d0edcf0-jovzpv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024102922133413dc181df26d0edcf0
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 29 Oct 2024 23:13:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eMhOJ24GDWMUsJBENcQ5qcJBF/K42Pv7bhVlR6TCLYE=;
 b=Hb3qLqO73y8NzLlVvTY2iGpSZ2pId3g6tQ6zONduJTfw7vTX7XOgbEXWcTtPKsA5Ie1nqM
 0LcovKrqBg/wn0J9QmFQaUDlRedbBNgFQvDYgCLPX18k1SKHopPjlQEUvui6nxuljVVx3k7L
 Jp7bI/DyQgfncgARTdEWTwfSXeCD24veeMrZiZ/5sz/KDsGBNvNRnO5Sc2dgd9sYGtbMhp3g
 CcZ8a4dgQPc945Anjy/iDWrP9cpm0Uh681y8HVkRNnEOHU06cXqgmPIZ5s6mOM0IzI82X/1i
 lX5QTRNLHhgfhJmrJWHG81ZNRSlk2kXFAhydDKLCa4NzMT6XOiZBgE0Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] nss: patch CVE-2024-6609
Date: Tue, 29 Oct 2024 23:12:39 +0100
Message-Id: <20241029221239.198121-2-peter.marko@siemens.com>
In-Reply-To: <20241029221239.198121-1-peter.marko@siemens.com>
References: <20241029221239.198121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 22:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113337

From: Peter Marko <peter.marko@siemens.com>

Pick the same patch as Debian took for bullseye.

There is no direct backport to version prior 3.102 because
commit NSS_3_101_BETA2-12-g8d94c529b [1] rewrote this code.

Applied patch was proposed for old versions in [2] and already
applied in Debian bullseye.

I could not find suitable upstream status, inappropriate is the best
I could pick from offered possibilities.

[1] https://github.com/nss-dev/nss/commit/8d94c529b333194d080c4885ddd3a40e6c296ae9<
[2] https://groups.google.com/a/mozilla.org/g/dev-tech-crypto/c/t9JmsYkujWM/m/HjKuk-ngBAAJ

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-6609.patch               | 30 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch
new file mode 100644
index 0000000000..38932cc237
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch
@@ -0,0 +1,30 @@
+From 41550b24b92c4a5971da9842e5e9f2b452aceca8 Tue Oct 29 22:44:57 2024
+From: Peter Marko <peter.marko@siemens.com>
+Date: Tue, 29 Oct 2024 22:44:57 +0100
+Subject: [PATCH] fix CVE-2024-6609
+
+CVE: CVE-2024-6609
+Upstream-Status: Inappropriate [upstream ticket: https://groups.google.com/a/mozilla.org/g/dev-tech-crypto/c/t9JmsYkujWM/m/HjKuk-ngBAAJ]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/lib/freebl/ec.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/nss/lib/freebl/ec.c b/nss/lib/freebl/ec.c
+index 73a625a..c9490da 100644
+--- a/nss/lib/freebl/ec.c
++++ b/nss/lib/freebl/ec.c
+@@ -302,6 +302,10 @@ done:
+ 
+ cleanup:
+     mp_clear(&k);
++    if (err < MP_OKAY) {
++        MP_TO_SEC_ERROR(err);
++        rv = SECFailure;
++    }
+     if (rv) {
+         PORT_FreeArena(arena, PR_TRUE);
+     }
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index b3ad6133b6..9218b4d30b 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://CVE-2024-6602.patch \
+           file://CVE-2024-6609.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
-- 
2.30.2


