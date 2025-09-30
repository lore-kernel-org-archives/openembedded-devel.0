Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A168CAC5BD
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:39 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.21011.1759223975521405834
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KtWP/bc4;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-425715aeccdso28736985ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223974; x=1759828774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTCNJj9C7VBlt4MBPlmena2SOdxpAIt4LGlMsKOvDZ0=;
        b=KtWP/bc43a7CXPfVctlXLBOvpTUga+Cs76a1EKFG6Kh7hqUdjZ+8oVer7hnoJFvUed
         gBHAgE0Ve2emEJwem12M3dFbvbwWE9NNJLERn4ddQUnR0gYpyE+EZnWjE5oqmGA+WxLL
         IIXOepCCRXy/9l73VM2cB8AhN3Fli8Z/nL7v/9x57qnx9npnxi1EvoUY5f271zuzTvye
         +8yiSel3qQ0GfHgl/B5+jeFRk3UcZ11tVqjTBoIYa3gqv1xZ1Gnx3VBy6OHkOIRkbgAl
         7ny8jLpeJchh5Ymp/2rThVoFBEYyl1eqEBzSWKgLwA6PdlQp7ASw7QdC5k4jgF70E59h
         y4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223974; x=1759828774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTCNJj9C7VBlt4MBPlmena2SOdxpAIt4LGlMsKOvDZ0=;
        b=Bc28/XfiDjNkI4FJwpfI6UFQ5JiyjD1XwTrAZEoOHQZvsFSuVrKxI5Z42CE6G1Fbcz
         j3/Uc7JnprYk8mgjCqFaUXwEOwJL4QFDnSF2aJFa7tB2thRski1SEb2bTgJaAnXmUVHx
         S1+PzvmR9jHeH3Qua7j81DqhSQrjupypGKybOFUynrQIIzvCUxmdht6y5fM+3mSMGcNf
         fzUv2PDOHobV+iAW1CZxNDlL/fqemxEMbcHQ0hpA8HKR5LIjU7nVxiJOfPDvjJ2Vosph
         K/fgyu3uVuULAfo71URb91JQTcmsd8xtfcvk3HWHzOr48oV2ikewaijqOPDqWUq6+Hc/
         glJA==
X-Gm-Message-State: AOJu0Yxswz2GcAKNmi6ugWzyREutDV2Ka/pyUfpMvYn/kfACX19cHmDU
	3QJjVLJD/HE/YNpNS7zeLWUvyKoSfVMzN8iSwJjO4fJM57QmcnsgCvS23sx88H0I
X-Gm-Gg: ASbGncukhJ5NnYVOGT02vU9RxK8C+IhEph9rKMqX08X2xzLSYHdTc9aTYRJTGZXpH4K
	FYMlkPYO66x/8/Mc/B6FTLX635VW7fWMynrP5h9KiLWjf/PnF4sqpV+1pwAi/1Oe+u5OMYrKuIu
	k5xFGWhr4aom4RpD88L7r485TPaZuh0UvAc75j1j8gt7Fmk/v0lybJIZKWrggiW+fXuQQwRL1El
	0RVsOtcOPoY8zYfnXd8sKyvoqnHYokKcB3PATLSVkV9cNXYc0Yzjl+VD5qG1MIvZlJ2RhhY07R7
	eRuLSZtfOK0q0jSQIILKOQ59yM6LlS4Iz7hzpySUUoJmObLTDHpNasW4XSmz52P3/uWV0g9AuT3
	ainn8asRoM0arUNkAusPKszzXQEBFTLL0/mmVXiJAHtqKtq/uYHZihzr63FsZQMs8jy9bOcurSu
	qT7Jz3PqlkWA==
X-Google-Smtp-Source: AGHT+IGVpvftTn2eJqUz3epSfq2uV9s+hfHC7sIlR0LxfLcITLJQJMbC5cfw7ZeYss1dJSnsIdo8MA==
X-Received: by 2002:a05:6e02:216d:b0:42d:7e5b:cd6c with SMTP id e9e14a558f8ab-42d7e5bcedemr4538755ab.9.1759223974582;
        Tue, 30 Sep 2025 02:19:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:34 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 18/22] libusbgx: fix example gadget start
Date: Tue, 30 Sep 2025 22:18:37 +1300
Message-ID: <20250930091841.1693131-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120070

From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>

From variables docu:
> Setting it to "0" does not disable inhibition.
> Only the empty string will disable inhibition.

That means in case of examples enabled we need ""
and if not "1" to disable update-rc.d.

Signed-off-by: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0ae908de1a5ea3de90e6051f038b3836c7027b0c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 41c2e8c2e4..8d49bf55ba 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -35,7 +35,7 @@ SYSTEMD_AUTO_ENABLE:${PN}-examples = "${@bb.utils.contains('PACKAGECONFIG', 'exa
 INITSCRIPT_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '${PN}-examples', '', d)}"
 INITSCRIPT_NAME = "usbgx"
 INITSCRIPT_PARAMS = "defaults"
-INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '1', '0', d)}"
+INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '', '1', d)}"
 
 do_install:append() {
     install -Dm 0755 ${UNPACKDIR}/gadget-start ${D}${bindir}/gadget-start

