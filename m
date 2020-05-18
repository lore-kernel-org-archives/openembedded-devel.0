Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.43727.1589813434813847368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cxOpwe50;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id v63so5060974pfb.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mM95xZdCnqTIi93ZroakTwsF51+ezIGhPoNO25z0vuo=;
        b=cxOpwe50VKg5+LRIBq5ZxhE3za2NZiPGE1dvW+gQFsoi7PSmp3S4Zgh2I/oIcQ/Hi8
         rXrHzbWIimkRNFWcB+msNwvvTWcQqravpeJjJjOGsKj0+rOIt53k/1RB8B776/G810rE
         P5xMB3hiwZV0tmv4mAHB1noibwMGL2bEYqpMJJjMcTVL5aXQpB+MXL9UWxD28rlS3ZK7
         hMjuMc4Nfe9S7fnkjN7U3VKTEruvNd/e2cT5r+lmzJi87GzLluycP7hadVqFg0CcqGYe
         QrUisI7KZXRF5mmhF5ty/ieRIDvisaNrK42ZXlRnuthqgN9s9oyl8YOnD4VYCFaE3UpG
         MH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mM95xZdCnqTIi93ZroakTwsF51+ezIGhPoNO25z0vuo=;
        b=eU99EuIZcc9BrZb+B/fGLoJPCf4b+KXH616dOtCPOpYb4cXK0v+pfeZg92IbcNx/ns
         zur36zlEK6tSzyGdy+FT49XX7os9DpRsdCC3njVSvkUHCaWhQFc/MosRisIFoxhc+x0v
         bxjaQadSmD6m4S1gTSwX54sCeSFsiY3F5lB7xtDk6IThCCfT5aIrzta5jVLqFO11rN+p
         yzgbbl8Ybg1MLnDIlfeskVlpjRQE77DgcyRIemKCziZfWR7TpT2d4vKFAxBSMHwBBFVr
         h/7ImV2G5Yz9orNDyBQXlphxt2utC3www5UU41M/cImbR4gVp/Mvu/00uu59E4utB6BY
         2nzw==
X-Gm-Message-State: AOAM530ZrrCwJ6rYV4fq8996ysRPpzpnsxsMykL39BvRQfZ1bG4ggvMZ
	yMREstEy9c4yJRaCOLHdNfiHOmcG
X-Google-Smtp-Source: ABdhPJwypTqE0xnFlzYY1+uNSeOGvWrFfczuO2BlUG671OAiA14RdK8Eg7ASVFZs0MjAeGcyY5jdKw==
X-Received: by 2002:a63:b904:: with SMTP id z4mr15619925pge.25.1589813434029;
        Mon, 18 May 2020 07:50:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 26/57] xfwm4: upgrade 4.14.1 -> 4.14.2
Date: Mon, 18 May 2020 07:49:31 -0700
Message-Id: <49aad7b70354e8d843262faca5eb4215a6427d4b.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Release notes for 4.14.2

========================
4.14.2
======

- Prefer GLX on AMD (Bug #16716)
- Fix compositor without required X11 extensions (Bug #16713)
- Fix window decorations without XRender extension (Bug #16713)
- Avoid grabbing the keyboard with Alt-Tab to work around a bug in
  Qt with XInput2 valuators (Bug #16708)
- Automatically update window title fonts on scale change
- Fix a regression with title font size at scale 2 (Bug #16711)
- Fix an X error with XShape (Bug #16383)
- I18n:
  Update translations: ar, be, be@tarask, bg, bn, ca, cs, da, de, el,
  en_AU, en_CA, en_GB, es, eu, fi, fr, gl, he, hr, hy_AM, id, ie, is,
  it, ka, ko, lt, lv, nb, nl, nn, oc, pl, pt, pt_BR, ro, sk, sl, sq,
  sv, th, ug, ur, ur_PK, zh_CN, zh_HK

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 278d762738fe23332b38751433e9b5f9c8a1f9a9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
index 617e14f8e1..b6066a5266 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
@@ -9,8 +9,8 @@ inherit xfce update-alternatives features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[md5sum] = "b20bd22bdbe1b17f76a139fd74e072a9"
-SRC_URI[sha256sum] = "100781a18070762e8f34c1d450e767586576753d567f76a8c32818284f511428"
+SRC_URI[md5sum] = "6d61d07b6ea88a429c43e1b9c3293eb8"
+SRC_URI[sha256sum] = "b15b40342596a3b6ab5167a58371262adf5484e165cb25a31fef42f0aa8ffd92"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.17.1

