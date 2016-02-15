Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFBC6E682
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 21:17:59 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so131667340wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=vEELwjUYYu6nCchNZxDyLFi2Fgnq8FLLuJ6QuasrW98=;
	b=TpUmNHNYZMYLMn2nXoU2zxConmZHv7dsuReLpK3P1Mn6TkRuqT9VCI8rk5LH3CTjCf
	8Hbs+eElSU2ESI2H+xbmdV1Tle6OQdXQ8yOEgidCrafsGkziVaMlDFPN/Vh5VrHMiM4j
	p2wT0cm3Kb45APA0ScxUeu9X8ymQ7tVjM/e7G1plsF3XP273YPtjG0W9nhG9EPZMs7lO
	+/oqgHW6OqPb7YvyEiy5x5C4keQZtHenbNhxxd1RV2VsQA16/Q8sFxLqLziOoDa70Ht3
	G6MEJOadCxtzUrJfHgZJ7LSIuy1aADILuZJLvcL/2HyuiNarSOmcdjdsBMt05vzAIH3+
	sgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=vEELwjUYYu6nCchNZxDyLFi2Fgnq8FLLuJ6QuasrW98=;
	b=Ei1h2e20HKs484ZMytQFt5AbLmbRJLbBjcHEh3tO6L67W/nDuU9I13XVa8DMSY1jRQ
	wtF5fSyob7KZC0rZR2E7MLukBEeZkgt1sdHxwGmCAMt5LoptQGfiQWT7oHs8eQWKifM4
	sg6g9VslPGQrR7oz6w3EfMku3bOQAeEjUGtxq6BI9nOifwLFs+8CNpjeOKLakZ28c14c
	KQA9O+KtWIghLB1Dj1CdXeQIm0+0HP61L89VCuDspUU5DLYOibigAc6iknTZomMRzJsg
	21U7rsfzRSBxngq3yvrNrwzfgDvt4SmNbbQPTl3P/Ko43GVT/fv+g2I/fwZT/JYLftGT
	Tdwg==
X-Gm-Message-State: AG10YOQR2e9U3qvl5rKyJa2Svltbplt4HVRC3qMLakSVx7jPtDoArN94p5CbGNnmaE0onA==
X-Received: by 10.28.21.14 with SMTP id 14mr14266977wmv.39.1455571080085;
	Mon, 15 Feb 2016 13:18:00 -0800 (PST)
Received: from localhost.localdomain (p5B0A09DF.dip0.t-ipconnect.de.
	[91.10.9.223]) by smtp.googlemail.com with ESMTPSA id
	t8sm25773276wjy.41.2016.02.15.13.17.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 13:17:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2016 22:17:48 +0100
Message-Id: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/4] libsdl2-image: update to 2.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Feb 2016 21:18:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Licence checksum was changed by change of copyright year.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libsdl-image/{libsdl2-image_2.0.0.bb => libsdl2-image_2.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/libsdl-image/{libsdl2-image_2.0.0.bb => libsdl2-image_2.0.1.bb} (80%)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.1.bb
similarity index 80%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb
rename to meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.1.bb
index a6885da..1f9c794 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.0.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Simple DirectMedia Layer image library v2"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8f66a2e45aa301ea73b5ab275aeb0702"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ec65b9778f5584a0bd8dfc17d6340ba0"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[md5sum] = "fb399c8386fb3248f1b33cfe81bdf92b"
-SRC_URI[sha256sum] = "b29815c73b17633baca9f07113e8ac476ae66412dec0d29a5045825c27a47234"
+SRC_URI[md5sum] = "d94b94555ba022fa249a53a021dc3606"
+SRC_URI[sha256sum] = "3a3eafbceea5125c04be585373bfd8b3a18f259bd7eae3efc4e6d8e60e0d7f64"
 
 S = "${WORKDIR}/SDL2_image-${PV}"
 
-- 
2.5.0


