Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF5FCAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:29 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.21065.1759223960163553062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B01MxUtu;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-92c4adc8bfeso130687339f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223959; x=1759828759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L97+zHaS2pgSDqaYOtzRGGzSjhCfhKG1ihdqIejS4Q0=;
        b=B01MxUtu3H/kxwu3YkzQjmtDSJmfaD1hRJDPnfP+WNJaXqZ2XS55QMGwwHw+jKnMYh
         0FblfTxfGJPzHIlMJ1mTeORTEbRoRdDMfULvAniLuS1/WetB/h26ztpBmD5BTImodt8z
         bvkW+18eo7a6qFBJ6x85KOcazOnHrCqzFDn1XZs0/EoMaPNTPLYUw53h4+kI0GshT3j2
         lIcd0PYNLav7qRLwo3/KBF8Pe3ShA480QW/OueaGGSoUZWUhMrEj9pYR+U5quEqpa3FV
         2azm/udcHnYrU2pVlXsRWJ5EDjStzIMQqhQNuGueX5WhjMcFP61QRSfSWPKn2uUhuuv/
         0msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223959; x=1759828759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L97+zHaS2pgSDqaYOtzRGGzSjhCfhKG1ihdqIejS4Q0=;
        b=ijzopG76ciz1jmxeLsZohpmQm8H8tG0kWee51xf2PkEWpHXn2LJbSLm+m3JT6XhkuI
         TSt9VGEaJ/uAiEaGyturj0cQpz5SZEFbBRm3SaZFIQajEtrv3tI5aEsMKB1CXeBf1M+z
         sQvtcwotpGm4/dMkQlOKjkf8GiARVu/NL2KY37AUeywxy9ZzcoRChhuao1uQCBYMYqh8
         mtk7tCW6igf6/bc1IZ/B3K/TiIVmPGdyKJZc9zXjQi3Tw+Zfgub7FgmUHsvXgUm0aJTc
         wrYtlUlQodNeG/qUTL5bPENTc/GyW28cOpLSoXqWqtbTpR6W02sR7JvXhyLMAQ2wtJiE
         khYA==
X-Gm-Message-State: AOJu0YzNnuwJRifBVsGLY9StsXTMOoTEIhQychV6eHVUvPYCstUd3Si9
	CM8RNK9ZxObo2bt0Pm7eNGD44/u3Zj4lPE6oL2ngizbz5u6c3WwqeYheDe9COgD7
X-Gm-Gg: ASbGncsXgmDdQJTwMmuXfHfM5kiGYD0/L+y552iy6uY2lRGsRkllWm+QF+VO4x5fLHP
	6Ec1RaATo/didKwzKOdZlVOUgwgY/sp2IEGdpjqMDnmLu65i31vKODf0CpXn+Mao1N1Mf6tqOKq
	TSpa8ULVriDSwhGh56WeqACSzXiFE2cIVru5gp9qtpM6q9nkf9atl8EkOzW09o8IekEEeDmx+/4
	NDqvDGP3qgLfWw1i5pr00z85kdMP08kbvK888m3BRQwu9v+eux3Z1WsfoNhylJyhR4/V9adVfTd
	TaFhbTio44KAMeiTVm3YttHYk2DHZOZY/JoZeELyMB8eDNBx5YGbQgIf1eEcnjT6dOFlZKCfNLg
	FpivPlYrvsDI8vrl6AMxo53uiKoaskwxIJGxl0EDTGeCXjZduSq3/fEaHuY5YFeKODUe7yWgVII
	rZ6ymA7KdMEg==
X-Google-Smtp-Source: AGHT+IGc5QHVQEVPmEQyXthEwI5rg9ahgaVJn/iEbeRnkZtmChxGWsIfmr8kunk+s07POXHSnGGnAA==
X-Received: by 2002:a05:6602:140d:b0:92a:29fd:e9c0 with SMTP id ca18e2360f4ac-92c80aa8498mr750887439f.15.1759223959166;
        Tue, 30 Sep 2025 02:19:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:18 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nylon Chen <nylon.chen@sifive.com>,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 12/22] kernel-selftest: handle missing -64.h headers
Date: Tue, 30 Sep 2025 22:18:31 +1300
Message-ID: <20250930091841.1693131-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120064

From: Nylon Chen <nylon.chen@sifive.com>

Some toolchains ship only bits/*.h without the -64.h suffix,
causing the recipe to fail. Add a fallback to use *.h if
*-64.h is not found, and warn if neither exists.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9472f4a728b4ec228605e387de32697312e8e549)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-kernel/kernel-selftest/kernel-selftest.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index fed3fa81ad..432ca5c383 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -89,7 +89,16 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
     install -Dm 0644 ${STAGING_KERNEL_BUILDDIR}/.config ${S}/include/config/auto.conf
     if [ "${SITEINFO_BITS}" != "32" ]; then
         for f in long-double endianness floatn struct_rwlock; do
-            cp ${RECIPE_SYSROOT}${includedir}/bits/$f-64.h ${S}/bits/$f-32.h
+            src_base="${RECIPE_SYSROOT}${includedir}/bits/${f}"
+            if [ -f "${src_base}-64.h" ]; then
+                src="${src_base}-64.h"
+            elif [ -f "${src_base}.h" ]; then
+                src="${src_base}.h"
+            else
+                bbwarn "Missing header for bits/${f}{-64,.h} under ${RECIPE_SYSROOT}${includedir}/bits skipped"
+                continue
+            fi
+            install -m 0644 "${src}" "${S}/bits/${f}-32.h"
         done
     fi
     oe_runmake -C ${S} headers

