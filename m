Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A5DCA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:11 +0000 (UTC)
Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7589.1790849224798649077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f9m90mgO;
 spf=pass (domain: gmail.com, ip: 74.125.227.166, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2e688de2eso13284875ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849224; x=1791454024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXGNO48ocKTk2VYP2Yjoi4vMDbzTiuPMMpWLbE+wtZU=;
        b=f9m90mgOsNGSFayGAbvEurpqSbV6cxHrhA5BAu/RBJorjTqAKISeKcGNIF908rKHg4
         1vdtyvMAjunHPMTeBPbjyjHpvtd+Ees/+uI9u95C3SPKpXP3k1GMKCjsLV1D1R6O2w1Z
         QfcLusgoQlEhWXHM84HlVDnGxUnowtX3BBGB8/YOTZhFKfnaahUMfrGH+maYqe/bFKnG
         VboJMNOhj8UxtWLQpkiwhhPhLy459x/whGXXkkvQdI6GIxIr/dGnUeR3uy4Yi//EdNVc
         0puqbFNifgzPy4rbPcFhrKbrUd4v3GqWQms85eFC1+lqBu6FWNycKRU1x3V7GtVOP72a
         qTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849224; x=1791454024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXGNO48ocKTk2VYP2Yjoi4vMDbzTiuPMMpWLbE+wtZU=;
        b=k3dfetyv1BMTAlwYLR2d/nGYNpcTbQt3Q2P0QVAB5qm8MmSqwxtxvNo+ZbcolybK0v
         EaUsse8bJcB8GdWaVDaOI6tmu4vmM6G4o+QdRy5hOItF7j0znFvo2EFf+Io1HpwW76pj
         TnRgcfcfn7BAEIMi2Fv09IrhqvIfH5g+9egBnl/RWKX8o6yx2vLuQcZWbIVnC83CRPP7
         XUrEzH7uK4FDg/h8gPicPRLAlrazpyq3RKdDeHlDOzroC/2+c2Cv8dmQRZrbnwddRsWl
         ZRFSBkaJrbvpD7qraegIG7hO7JE+BYXyfZfCBkOniJmuhviSL/68AbQ1IJZ2lLRRR3kZ
         4TDg==
X-Gm-Message-State: AFq9FYLKr1eJNKRbjnU/LyIMXOPFJi63rSc8hWJSMCFA34ShneeDsCLj
	w53zJPHXM/z4ZBdq06Atwihq7fZIxiu7AOItuBTOI1kFzmcQkPGbWAE/mEFpXQ==
X-Gm-Gg: AYBFou2lyQFUicwwVts9YAFFkAiv+9+u95O68ELWRC9204KwM8oVMYTL4ONgVcZhINA
	hb3kracb/ngB5/aQCXrRvHmnLAbUKrPdPQE5yKLyVXY/Ujht+Vbt7pI/pExQYnNhhAe5t/uIXNw
	a+ifjVVTj5gvqu+L46xe+4+DMeeaccYkGnAtRaHJW+bdNJAelSCBCKHGWu1boFEpCPuaF1+6Rnk
	yVeqDQJ9TAnimDD1+TwutwkqcY1sEAIS5IfHzb/gQMGF/L8L0/2WLoI+wwZ3nHOAb3TWfCDRwrY
	3/5oLgzaaxCawfHKWwKj6TbXXF5h74Lsm3mKyFLvUofvvZw9zpWved2rsHgl6qqMMxwhek8jKtk
	Im4QypiNGpomOeuAfbu/0nlMf72yaMsEyEh9EH9kM2OxVBGcoF9cd39QfW0Vidc2mKznhwrIy2V
	whKwWoPU0WjUvoZG2RZarKAjW+EcISLtThb/hT0UxkM54TFJi2RiZm/CjDx+55rZkoTnO5/wzOH
	U7Y8GUd3UAmQSTwo6AIuxrjSniNc03Elw==
X-Received: by 2002:a17:902:f546:b0:2dd:c100:3134 with SMTP id d9443c01a7336-2e2e4b89c9emr38203395ad.48.1790849224170;
        Thu, 01 Oct 2026 03:07:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:07:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/11] libssh: upgrade 0.11.4 -> 0.11.5
Date: Thu,  1 Oct 2026 23:06:34 +1300
Message-ID: <20261001100634.1992725-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130577

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.11.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libssh/{libssh_0.11.4.bb => libssh_0.11.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.4.bb => libssh_0.11.5.bb} (96%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
similarity index 96%
rename from meta-oe/recipes-support/libssh/libssh_0.11.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index a8e74dc59a..d2f5072d1e 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
+SRCREV = "a09fdd00416e53b6ed436df6ff14339a4f884601"
 
 CVE_PRODUCT = "libssh:libssh"
 

