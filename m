Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36EFC4167B
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 17:34:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.46430.1672508062109473946
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 09:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FgBUb1fi;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id p4so25479281pjk.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzlqVBI+ijs2Y32WVp7+Ledec/iz32kQvVGpQE9gmcY=;
        b=FgBUb1fiAMqhW7fCFdIHuggU/V5KjrwMHsHBdUOiNp6P7IdOCfxCnXVtUuTTf5Sj+X
         KYeYhWy3p5O/xVcfxFc7Rtz55Cv78EdcRe3yzCRRKE4kRSRvY0a+vpH4M3gg2eYFKyTz
         RfTlSXFy+lO8HvQj7k7I4Rdiz81Fuc12rjVoyN1tkbQh9LzeWNp64yloXtykt5ahe1Eo
         Fl2HiMb9TZa+4kOgE5sqrM92O8mFR8ls1EN5fLvTESMwXpDeIl/1MMFZnqJMkhPp/7N+
         VPFQDTwh5f0Chym7m/eSBaWrAri1h/TZV1NixrAAO99u1+zvBiPF88UZQJ2nrh0MbD6B
         MglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzlqVBI+ijs2Y32WVp7+Ledec/iz32kQvVGpQE9gmcY=;
        b=xt15fHPifaCWQpUd+6YcFHxzrJs/oMfmW87KNJwUCLR3MDLigeQgd4Z5lcn9Cv5i6n
         IvRLsUEFVMcnPBJ1auIYQGZUQoYAOtX76QfC91WM0RxPBFNzLJaA+ml/fPmzktV44HT/
         z8qBLnHaWSr3iQhKD90feaxAq9zfxejbED/muXYTFfSpdFZXYrKiWnqt7bI2sO5zqhWT
         eGZgg9dN2wtGRnAjC0qfOn0LPvlc3GX/VS7puJ0BQVVVnZ1phX4nQ6y8nFSyZ5tcZpii
         JAojszMdvc0l8rTatMIAz21YUvLN4lwL6j1bWgORHW65fv/P1vHmRnuhG0Ne1ZzPmZgA
         5jog==
X-Gm-Message-State: AFqh2kok4nwu/oMN5oWTqCoZ6o3s2voQp7kL7SaTiB5SgTeW/sHjL4/6
	tgNolBfhyWPXfC13mIFmvLlsp2jAmho=
X-Google-Smtp-Source: AMrXdXtTK4xojRjQ9DrsChRrIMKk2+ypAE2GEARWhOF7m85OcT3kaGh75tWPrUgYXunWm6iE26jD7A==
X-Received: by 2002:a17:902:e88e:b0:189:8a45:8e31 with SMTP id w14-20020a170902e88e00b001898a458e31mr81111879plg.15.1672508061204;
        Sat, 31 Dec 2022 09:34:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902e74400b00178b9c997e5sm17112458plf.138.2022.12.31.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 09:34:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] imagemagick: Do not set ac_cv_sys_file_offset_bits
Date: Sat, 31 Dec 2022 09:34:17 -0800
Message-Id: <20221231173417.3502417-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231173417.3502417-1-raj.khem@gmail.com>
References: <20221231173417.3502417-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 17:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100323

This is detected during configure due to AC_SYS_LARGEFILE autoconf macro
which is set to 64 if off_t is 64bit and then assigned to
-D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits} and system expects it
to be a number not a string.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 010288b0d6..b6344a381f 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -22,7 +22,6 @@ inherit autotools pkgconfig update-alternatives
 # if someone needs xml support then fix it first
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --disable-openmp --without-xml --disable-opencl"
 
-CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[cxx] = "--with-magick-plus-plus,--without-magick-plus-plus"
 PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
-- 
2.39.0


