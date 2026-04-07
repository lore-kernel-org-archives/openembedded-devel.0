Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA52DEDB7F6
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 10:51:33 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78432.1775559087510862673
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=T6H2mpDT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202604071051233075a415500002073b-odmts9@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202604071051233075a415500002073b
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 07 Apr 2026 12:51:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Rti9gOsscbmIjeNfS2gRPHpG4j6zFlkeFPPrCS4r07w=;
 b=T6H2mpDTnw+QLsWxRjYPn6aZ7jedWzEMgkbg5F8ruRAfNL0yOIMxyj1czBD/j9snssMWve
 3k6CpBS2Flic/h2lEx/otwwCMhM5uu57pMfWSZL+FmwHtsTMjRiQb5WZZzdTFqCAQvzo0vdw
 AcuFqmYKMf+Ve0SunOTKg8J92OaAaadoUZfasqcl5etwK191CDx1MYErv27uVr6RolWYed+2
 Qp4MfDYkjPBOLsSRjni1ILomaqpep+RojgmDWLqflhgd8FbjEAr6tNJgozM96kV//lsewh3I
 ZPOnt3WAw2LNe/M9iJQScaCE93P6lzJoUqc2KyI9nMsjL/xw/LjSgBwA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] spdm-emu: use SkipRecipe instead of fatal error for unsupported architectures
Date: Tue,  7 Apr 2026 12:50:35 +0200
Message-ID: <20260407105035.4745-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 10:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126088

From: Peter Marko <peter.marko@siemens.com>

Current code fails to parse meta-oe layer for machine with unsupported
architecture.
This is too restrictive as it requires downstream layers to play tricks
with masking the recipe. Usual way is to skip the recipe instead.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
index ae196946d9..662519d5b2 100644
--- a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -34,7 +34,7 @@ def get_spdm_multiarch(d):
     if target_arch in multiarch_options:
         return multiarch_options[target_arch]
 
-    bb.fatal("unsupported architecture '%s'" % target_arch)
+    bb.parse.SkipRecipe("unsupported architecture '%s'" % target_arch)
 
 EXTRA_OECMAKE += "\
     -DARCH=${@get_spdm_multiarch(d)} \

