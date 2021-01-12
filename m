Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.17052.1610488337670380821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LAuMul06;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id c5so12613wrp.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jrEA7zxKcQA7c8a64jrGB6mRXRVxqi9vB0oq1nAizQU=;
        b=LAuMul06kMERvwxxzxgL+Y6j3xcZvDPkV0YIi1Jpf1amIJzh1zv/B60YAIGvG46iiI
         ce/nfgEPDpqYGmvlPIJASwmdx/WgG2smTNBx8WO83NYv7qsywAC40QVqpEm0HMdIServ
         6iu4NrE7N9fKLl2QpZFmwyL5SbQzZHQIX4HBPPqCf/yzocIqbRLT1Wu2ce72dEYHLNEC
         YnkHpVwH5Tkq0KfHxEtDhtfdW3FJGAdUJRzobmVigS42mdSQqtI0xw15WwPCMyxiMtUc
         9ehndseLWKtx6U72P1sH2I9uu+oHw6sPY4e19QlOu46HWMgTL5fVdeXZOlt9R5r/+G2r
         SShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jrEA7zxKcQA7c8a64jrGB6mRXRVxqi9vB0oq1nAizQU=;
        b=Fa7/r1f3e8cEgTFvdPd6A2gAymRcK5gWJTTnGOpxhHs3lvJrwxz289hj/UVvV8X+c8
         bkkjomvCg131iGLvvulweqs6VnB1K8RmIzIsjDuGzk7/ycR4E44qyAJguVB0LZ+ySe1V
         9PEwcT01IYWmoj0X758QAKcSdzEV9AaXwJyd8saRPTKoRrfH9u5nP7JaeUQ4gQfTsne+
         dCbb7GTSIHaoLXm9Oki53DbdUlJuaXXdD6WvdwSAWFI68uHK09Iih39cE8xFOHZ8atoN
         QtIf1Vcv2g8o8gs9Ar01sKlPD4jiJL8NDH1LkSRW12vgunAz28BU44WYJ5hrkB0fzAR7
         iiSA==
X-Gm-Message-State: AOAM530qnk1+HwnMmkcQCp9RmpGz8aA+JYYpxyCj52ZVvK99yRH0A2Ng
	xUvQLmwJ5sgS0Iib8vFD/Lg5bE/M8NP2sw==
X-Google-Smtp-Source: ABdhPJwkavFp9gv3Qfm6F2sNem5ELAfx8IzSmcuhfwHWlHe4vE0FtJcrILcX/CWX9ij6ohOcAkiCBA==
X-Received: by 2002:a5d:6486:: with SMTP id o6mr821851wri.380.1610488336290;
        Tue, 12 Jan 2021 13:52:16 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:15 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/8] xfwm4: upgrade 4.16.0 -> 4.16.1
Date: Tue, 12 Jan 2021 22:52:00 +0100
Message-Id: <20210112215201.3940196-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.1
========================
- Catch more XErrors (#476, #486)
- Untile window before switching to fullscreen (#478)
- Allow interactive resizing with any keyboard modifier (#487)
- Do not prefer Xpresent on AMD/Radeon (#490)
- Use g_info/g_print instead of g_message for some message
- I18n: Update translation:
  ast, be, be@tarask, cs, el, et, eu, fi, he, hr, hu, ie, pl, pt_BR,
  zh_TW.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.16.0.bb => xfwm4_4.16.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.0.bb => xfwm4_4.16.1.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
index 3f64365f0..2cbfdadd5 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
@@ -8,7 +8,7 @@ inherit xfce update-alternatives features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "1e22eae1bbb66cebfd1753b0a5606e76ecbf6b09ce4cdfd732d093c936f1feb3"
+SRC_URI[sha256sum] = "b5b24ca04bd73c642db0a4b4df81d262381d758f01b51108257d48b391b8718c"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.26.2

