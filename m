Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4948C54EB4
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 15:34:53 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.20000.1674401686453504738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 07:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5wZi9Mv;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1442977d77dso11528902fac.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqwQkUgigdYRIQwRI66MstTqMNH1yQCuoOyOB7pdAvE=;
        b=o5wZi9MvwSRvJw9k1TL92hulQb6Mw4VP8Qd8q403fVl6XABUAgUUs0ymr9wNFM92Xm
         S53IcHUon0DMx4E86LG1zA34Dx56/a51lxRv9jLUEBpFDbzii89Tf9Tva6/GrImNipTz
         zCZaEzIoC0EbFNBiWrF7uTqkYGAw9mYPixutReJHAKj8BiIdxIS9pOLiCJVvhvNJz0Ho
         GnRE8xRJTBAraPiH0WrRbWpVGlpPueWL+VnfcN8H91w4wHZrfzLV8vkrRAnscEuQb31d
         gJsyT5UMBkXSOtV2bE7nqFAApgLqHpuRisMC7dtI4ExzUxJDRaoOVj9wFbXx+oBWwLgk
         Tw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqwQkUgigdYRIQwRI66MstTqMNH1yQCuoOyOB7pdAvE=;
        b=GcSpdwwEDa82XrqcYhbTqjcJ9Uqqr7NmvmtmTcLIKf2eiXAUxtJ7CKBiJ9Z412nZVm
         Ek1I/gjoV3owj6lmimbQ5gyJMDOTxIzC5GG6p+NGT5ndwKebOpI0nuMVMTmaSagrek+U
         X5tdFSd9igmbWXW9YpAk3+yx0sK/S03lDqB4p9YBNVbRGvOSGofvCOZoO5T2eIVAWVaj
         8y40ebvgxpvo3ajrPp+o218y3vgBrzCb39/OCXG2qcUwlZGiYz3g/1dvjM08BshApoQm
         alvVwH2HAAkFGIxRwKC+i51ni+v7f4hXO+qapAJdZDvmvQ1d7GpxyWb7l/ayKMOXBtN3
         ddpg==
X-Gm-Message-State: AFqh2kp0AzDZF0hl/JEgm5IiPJmXrRfunBBGf9SM8k/sTMwT3xcqOpdk
	sREPuRRH92Y8i6FH49QqkKvl86Z8bfY=
X-Google-Smtp-Source: AMrXdXtutY+Ek79FJ9Fk3Hkl2eyytUk22wMOd22oOxjPY9Y7wEdDPDEyNUKiBWr6VMLxOphe97IXOw==
X-Received: by 2002:a05:6870:bf0d:b0:15e:da16:48ec with SMTP id qh13-20020a056870bf0d00b0015eda1648ecmr10535800oab.28.1674401685723;
        Sun, 22 Jan 2023 07:34:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:97e4:131:65d9:88d9])
        by smtp.gmail.com with ESMTPSA id fo42-20020a0568709a2a00b0014f9cc82421sm9228112oab.33.2023.01.22.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:34:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Preeti Sachan <preeti.sachan@intel.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 3/6] fluidsynth: update SRC_URI to remove non-existing 2.2.x branch
Date: Sun, 22 Jan 2023 10:34:39 -0500
Message-Id: <20230122153442.213094-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122153442.213094-1-akuster808@gmail.com>
References: <20230122153442.213094-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100704

From: Preeti Sachan <preeti.sachan@intel.com>

Remove branch 2.2.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 534d04af483d5f3d4fc73162c110449f169677a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 14d09e5f0b..a4590d61a9 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.2.x;protocol=https"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
 SRCREV = "8b00644751578ba67b709a827cbe5133d849d339"
 S = "${WORKDIR}/git"
 PV = "2.2.6"
-- 
2.25.1


