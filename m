Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web09.251.1617899783144082074
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D0SCbWdb;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so2914179otn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lFBtxGWDPRhXlpGQFf0Ya7+nsC+glqZNO7YnbS+kI8Y=;
        b=D0SCbWdbieDTRZahY/PGNnDJX5RX/Qjfu2iPZLILJ9JE5kxG5pznSs1QdbWIzXwvvo
         X5lpBhunsUkPwy0kBhJPlaoAcsHCwHEF23pfKo4sc+g2JL7magJtrSbYHAfkOu5GXw1c
         jehmBi+z0VvdYeAe6aS5aGO1rGy20/Pvzutyn0X4LnZkYViVi3CarVITOwnifUhcIoZa
         yuHLcMiCLZksX1vSvEVNmJreE2d30jcWfgSAICtyQDDLvh7rMkirGfLxyBlnaAU+86Uf
         34MO7HeijLdiKLdO+MlqecuPKEDaVPP15VROkEAbAJ1kl7Ndc9FFn2t71vEZ9sjRJtci
         nDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lFBtxGWDPRhXlpGQFf0Ya7+nsC+glqZNO7YnbS+kI8Y=;
        b=cFbFjUtg4aKFavuBUezyDZ23jPD/SjKZpun//vPmQoWR6EXtwoxSHuYpk3/9i8KUaZ
         BAs8W1t/nuZVa5yN9/zfuHrhNlDoW1HDEz/4sn0fe/WKK0fMS+a4vCHC8X4Yy10og1ft
         sSxLWKEQRz1zeGerIctqQnaNCrdfPICH1dOq5b0OBmNp4RLcUn7dnl613PeXDf8t5IC2
         LGPaZYqFaxDwc+EcHFLewNSNNxG2GxV4vMSFnyzQvTSGZjgeP9tpXjB+ydKi/k/6hikG
         CLfrXU6lk49JY7kt5rsIANQW3QVrF3jJ+uGFC5MnXio28pewLFiVqTvecY3lH3Shkf9+
         mTxw==
X-Gm-Message-State: AOAM532FAyh4YnBSNL4w7CFiNL7zUwqs7t8hj/JFjrRVo5Qycv55IkEb
	5vHbSSzPIC/Zj/DV/LpozfWEpLJO04U=
X-Google-Smtp-Source: ABdhPJzebIrbIPLXBr2unRx6hql8/iZ/IaL7uThupv1k4//dfS6mUp3cZFo87d8ugXBmSqgMiWRrwg==
X-Received: by 2002:a05:6830:1506:: with SMTP id k6mr8819954otp.26.1617899782389;
        Thu, 08 Apr 2021 09:36:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/64] mpv: remove explicit LICENSE_FLAGS
Date: Thu,  8 Apr 2021 09:35:15 -0700
Message-Id: <d0c4661d78cac6a1db75fdb2f99d55516d20cb47.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Yann Dirson <yann@blade-group.com>

This flag does not describe the mpv package, but ffmpeg instead.
It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.

It is above all not needed, the real problem is even more clear without it:

 ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted i  LICENSE_FLAGS_WHITELIST
 ERROR: Required build target 'mpv' has no buildable providers.
 Missing or unbuildable dependency chain was: ['mpv', 'ffmpeg']

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bba49e9edb4642e3cbe239ab13597484602330f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index e04925d0f1d..6a3fd97157b 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -12,9 +12,6 @@ DEPENDS += " \
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=91f1cb870c1cc2d31351a4d2595441cb"
 
-# While this item does not require it, it depends on ffmpeg which does
-LICENSE_FLAGS = "commercial"
-
 SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
 SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv \
-- 
2.17.1

