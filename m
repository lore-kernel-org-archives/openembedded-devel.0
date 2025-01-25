Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2217C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.15096.1737828191677247194
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjUMrL3M;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2164b662090so60838955ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828191; x=1738432991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEEgCAq3rbQEylSjYH8ijyq7pudTmM/HQ8IC2CnPO0U=;
        b=JjUMrL3M+WmbA/MtX9+dqE/v+OZCVPTO69OJL/WkNjfZRAN5uf4mIPHSoSWOBi9VeZ
         rUrRm7uNZWS94kMJCHoJtu09tLdOYSdEx2Kxtz3MKtU4KzSm5+FUe+2Lz3+ow4Bzg4WP
         FHTOVTyIQd7TC4a3vLrG7mQMVotf+Hh2oZH08KJUgafLWIoKbktd3Ozad2TWWqKvjBKU
         Iwpys+f4rIInAOcP4o4amQ6QxdDVilc6Ziuqd9GLsfTK8oUnEGD1cd63zL3nTDovr6V0
         QFWHFuscPOEDSwCQxCbiZcsbuyIlb92FcNMyTLA7dtZy05XZYWewSFuvwWb/ypsfuhHg
         I2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828191; x=1738432991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEEgCAq3rbQEylSjYH8ijyq7pudTmM/HQ8IC2CnPO0U=;
        b=cNDIQgySdLqDjvGHub/3rW359tx2LdM5cIq2XGwTmPbjnE69AwV7P+RDnk01kUVlZ6
         4N6mvktCFewQ0iDepizrgsCZGqZ8quPJsd8L55aaq7OWBdMvYtrqFw1nVSurw954IBER
         Ew7e66WBMeyGfr0MlGf8UU/yOl6I/aFpUuCc12JSJoOc1FY2Rdh0Za3QfnT2gbicDI5P
         smrRDVVltsjtaKQD03gIQp5jOGDcH4x2uJAGm0Ua++je53C0QixfQtSjftSTs+i15tDq
         mRevnLT9qU3WcyzJfvk3Kr0HYiEOOk1GKv1MIoFCjvaz5ZK1uGD6jC73b4fJdhYtqteW
         WnVQ==
X-Gm-Message-State: AOJu0YwWplK16eTdDeAm22Vmy3UfOJ7mclhgWg+UABKYnVKIkzQkZeaz
	ow3TqlnZUy9O+TlhTkG3uFHHDs3/T79Q8La1MXzSDhSGV7C4sYZhsM14AA==
X-Gm-Gg: ASbGncvQX4XhQC0B3q23yKGLB5xPlf9reRdp6fZhrGkle8Kscd43FwEwnC/kVYP1S8c
	Vyixi8I7G50MLYSE1ReQLvdKfXHmzBuF14MTZJSL7PJVQwYGcu/k1WvXyx9kYPgvPhAyTF9pRic
	NKSmLB0FKSgL/lwn7WsdzjiFNVP8pT3VkBPVGAJUw8d3NCq6GCY9G8i4Lylsd1ElUl8hmiyyMK2
	x6ccjqQw1EPa9dimC8BhKvlwMiEDdVj5jZlCphlmXhIpP+w9lG865O1+m0KByRCkvspG7677uWe
	7m8GyPRZZylFvFfw3/zsK6KX4d8=
X-Google-Smtp-Source: AGHT+IGrHXEDCyWvx4gJixPkCuJGnjGieeImC3v/HK29myf2N+Je7HGoz/DDlAR7pC15VDu4SsFgBA==
X-Received: by 2002:a05:6a00:1813:b0:729:cc5:fa42 with SMTP id d2e1a72fcca58-72dafbaa1c1mr51448663b3a.20.1737828190867;
        Sat, 25 Jan 2025 10:03:10 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hieu Van Nguyen <hieu2.nguyen@lge.com>
Subject: [meta-oe][styhead][PATCH 01/14] gphoto2: Fix /usr/bin/gphoto2 runtime error
Date: Sat, 25 Jan 2025 10:02:55 -0800
Message-ID: <20250125180308.7856-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115084

From: Hieu Van Nguyen <hieu2.nguyen@lge.com>

After fixing the TMPDIR [buildpaths] warning, a segmentation fault while
running gphoto2 command.

It seems 'sed' is primarily designed for text processing. When running
'sed' on a binary, it may overwrite or corrupt critical parts of the
binary.
> root@qemux86-64:~# gphoto2 -v
> Segmentation fault

Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index aba590aa02..1dc2a1fc34 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -19,8 +19,6 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
 
-INSANE_SKIP:${PN} = "already-stripped"
-
-do_install:append() {
-	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${bindir}/gphoto2
+do_configure:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
 }
-- 
2.43.0


