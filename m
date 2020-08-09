Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.23040.1596976520715581178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b3O3NhgK;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id m22so6688915eje.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bQVP1DuW4Do4bwwVydfOm1WGpmoVseWN/97OmkzPDuY=;
        b=b3O3NhgKC1AcrE6ca798C0ws77EvNwxdPV5teVF1l3Z6BXkotWJjP1pjgJAjLKMLvU
         LBjZ2yw/L2LdKLxCNPnYcFW9kaHwz73th5Rg5RmkxOD/ngtq16LIgGyMN1pBLyrDa1A2
         zT8ZTDWf4bn7CD+gLaRzxu0uKsBOAs9Pt9ly229ZOMRH4yNthbw0gYkr6DsD4EHijDQv
         9Y80tCuQT4eQhZJOSoOFXDFoyZxHQOw1clJ0+kjHlb416Lg6dVMJ2CK8LIsT/JI5B581
         E7M96p1WQtp62WO83GLI4SA/w7rDWBYoAtVQhIZlcNuiiAZGSma/zvmbOgrUXD190sm+
         CrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQVP1DuW4Do4bwwVydfOm1WGpmoVseWN/97OmkzPDuY=;
        b=SDt2gxLHI2qOMKmflHBlHyH8pQrGQxm/Q4IU+e8W3g1LY+GI37g6xXt6Af2bZGNS9s
         UDnCtBY67aUiBcegN3tFdMgs5zFPOmm7K80TzDPlryYFX5yYq44YOx6ZdLRKiGJWaOP/
         MsMZR964/BM3MtbArwFQcUpUOpkZfvuobXWSuGhlO/tU+Vu4qJdskfIXie9+I1RyX+/f
         +D6+E1l9Q0pFT/2XkL4qWL4BlwlRlgDmSQJKWPDTJX97EayqcGoJTXrxc2bweE1auV/z
         C4Rk61ACSVNO5D1Yk0+4Z+6YFwdSy/u9kiAlhr4lmniY67MEBB/ThbJyO3xqVvAhhTU0
         BQnA==
X-Gm-Message-State: AOAM531KC4IBrU3BUn2Td5tm7C5UZhn31Cb6SLApcrliLLsHxpTmCtjC
	qRqM0T8qjTdKRyx9MxufCFDhNmOS
X-Google-Smtp-Source: ABdhPJwXB6I6hh2LFnxjx0ybefrDW/BmYgYVo/sGyqvfr8pCZs8S0GWSYUtVneMUfSkFrNxHGAQZMA==
X-Received: by 2002:a17:906:cc4a:: with SMTP id mm10mr16934921ejb.451.1596976518973;
        Sun, 09 Aug 2020 05:35:18 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102180f54bc478636fc7f8.dip0.t-ipconnect.de. [2003:f0:7f10:2180:f54b:c478:636f:c7f8])
        by smtp.gmail.com with ESMTPSA id b24sm10070260edn.33.2020.08.09.05.35.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:35:18 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/6] xfwm4: upgrade 4.14.3 -> 4.14.4
Date: Sun,  9 Aug 2020 14:35:03 +0200
Message-Id: <20200809123507.267616-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200809123507.267616-1-schnitzeltony@gmail.com>
References: <20200809123507.267616-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.4
========================
4.14.4
======

- Fix a crash on FreeBSD (xfce/xfwm4#411)
- Fix compilation warning due to g_type_class_add_private deprecation

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.14.3.bb => xfwm4_4.14.4.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.3.bb => xfwm4_4.14.4.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.4.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.3.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.4.bb
index ab8b34cfb..d68e00864 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.4.bb
@@ -9,8 +9,7 @@ inherit xfce update-alternatives features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[md5sum] = "66b25adc9db8a3d829ba171bed478724"
-SRC_URI[sha256sum] = "829bec5a9e35a9f11c54a546c0112f5ad36e0f747be1156856d4abcce37283bf"
+SRC_URI[sha256sum] = "b2a4e6acc3e6eb5503f247f2664c2b1a25240050d75ca93299955aa6b5e62a7e"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.26.2

