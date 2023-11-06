Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82583C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 04:53:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.47469.1699246426732720919
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 20:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAgQNWho;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-565334377d0so3109337a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 20:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699246426; x=1699851226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7rLettgE0px/Q6zVzoEIEdATwr8Itu1cm9aaLzxYhU=;
        b=fAgQNWhop+daJtklWuwRizvUhzGGTn/+HAxfYsMfT6Z7HXUNPzMGr2G1Wj04Ft+ITM
         dBwTaTtWF4e0xovuFVnMvhjrrY29mUPgPBxFMpd26YhsyQEfo9HfTly6mo5CHEnV8Uvp
         M5LUzm5r3TN+mdY2d+NRUTNTTTOmxa/ftTp7B56iQJtHjf53cfba0mna/Yf1FZYktN7s
         Hi4HU3MrulRd9owoDlD8ZVR3sOtKpVzOosuetdwSa7N5IBl5/g0dsHZGbYjGNZbUMc3A
         Ug5orKbWBU/iSp3usfDCzsJhQIqjMyKmHHatCXdJv966aOmeQ8KdWjtkFtlZWGQ+P+ok
         Q40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699246426; x=1699851226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7rLettgE0px/Q6zVzoEIEdATwr8Itu1cm9aaLzxYhU=;
        b=wJbPBvkBqf/dfG33LWVWIGlmjfS9+/7aFQ+diyClnwEe/YCLRGrQcR3jAUErxQcTGo
         GAuUDRsyK6Y2PB8Yd9QWMeZbDFdVJ42qfeECegqUV9Y+pb3mjmf5n3gWu4sb1iVlfkSV
         tzFoqtdD25d1Skby0VQVpyx1NwbnGwho/L4gs0xfMud0lP4h6ObtUtC1nry+XhD1kBUu
         zJq6qcI32KrAVut3eu3RhWr/ZiMSnP4YGB0I245c+c9v9az/oBChintZA0NfeBHKZqCI
         IAGCQLh1bP6X0PhG+YjYZg316ojC1tMdr3IXnR+iIzzcYFd3vqkPXSAjvGhVniuGxk6G
         jbfA==
X-Gm-Message-State: AOJu0YzThoufAh2OgN9twR7y5egKCL1/AXqM//YM60S9ybwSn4tojrN1
	kw1JdwASy3k/dt7dzYWPSnY/GwREnNa/uA==
X-Google-Smtp-Source: AGHT+IGONdIgHwFZ5ZiguXz0Oit7vdz3tRGdzhjFX3HHtpruR4A16o22vTNGdgbtjuuNaXp7xdANGQ==
X-Received: by 2002:a05:6a21:7784:b0:181:731:89b7 with SMTP id bd4-20020a056a21778400b00181073189b7mr8863095pzc.41.1699246425610;
        Sun, 05 Nov 2023 20:53:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902bd4200b001c62c9d7289sm4882192plx.104.2023.11.05.20.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 20:53:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] aom: Disable neon when building on arm
Date: Sun,  5 Nov 2023 20:53:42 -0800
Message-ID: <20231106045342.1324868-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 04:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106393

The code fails to compile.
/mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/aom/3.7.0/git/aom_dsp/arm/highbd_subpel_variance_neon.c:257:1: error: call to undeclared function 'aom_highbd_8_variance16x16_neon'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
index 7e5af5039a..4d69b03987 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
@@ -20,7 +20,7 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
                 "
 CMAKE_VERBOSE = "VERBOSE=1"
 CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
-EXTRA_OECMAKE:append:arm = " ${@bb.utils.contains("TUNE_FEATURES","neon","-DENABLE_NEON=ON","-DENABLE_NEON=OFF",d)}"
+EXTRA_OECMAKE:append:arm = " -DENABLE_NEON=OFF"
 
 do_generate_toolchain_file:append() {
     echo "set(AOM_AS_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
-- 
2.42.1


