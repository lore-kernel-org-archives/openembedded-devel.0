Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8617E71B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:36:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 72so86490lfh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q0P0RDs2Ir3qZ2b15Q3gSBfqDP6AtRjLdMpfpAhHo2c=;
	b=w0/cMKgJCuFf1q0JzcyuSeQsw2LHPjat9AnQkP/mLO1NPF93/w8JSX1Tv30j5vWmP1
	/N22lCuhtXK/esVxf8NGGgi0ic9mtuuZxQwASJTt1MbthLyVg33hJ4D0gBIZK8gVi2+c
	HvGgFCEu5gHvLFbcKwvuLuYVcMHtjWxQpNsz3Ns6gxHJYyM3D93BssWnNDQa2TNEMJea
	oG9lf59lKxBDxUt8JVwA3qLfgKtoWAuB0bXZcpq0wIaNIOfxdcPBJmVSiWnToE8chmjv
	p23lV8nDLfiUXf6kIWBHbHtiVcVWw7/OopuM/zSgO59GSL6T5LONuKjAx78ZGLCl4ZQL
	ayeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q0P0RDs2Ir3qZ2b15Q3gSBfqDP6AtRjLdMpfpAhHo2c=;
	b=SBmB7njgXuCyCWnz09OIhNe0eTDF4G+SWkn/mRXXVj4vWsF38gX10ExIwBavQ9GlhX
	wbkONtyao74/+oF5Jli4kV/SmzTvWpmvfwd3kH7nB4/ibZAvZ7IpylsjIpGIyYVQQYtj
	3MXtXaGkuOok6+QRu4jLD+NjxIOFRHiKGl7PpqmQQTeu9EF8NA6J5hbrFbotMkqTFsu4
	iw91WDi/RZRglYDYfhNwip0LDkHM1EBUyAOOs3cDZO8GQ2lwjI9RuluyhbuQDfYmb4OU
	VrD2tQkdZ4gYnWiXNTsjATKSYxgbMufxkm3IJygv3Uu/5HS+LVdNwGcjVD6asLsdS0V4
	FRog==
X-Gm-Message-State: APjAAAXcEr6bHMMVMmTo9ZOVN3rPHWb3gjrTvcoOxphxYadtSU1FCDt+
	xmpWIi3EPTcWjVVw/mRpkAIm7SzNJkI=
X-Google-Smtp-Source: APXvYqxCNgemUB6BWPOp00Nlqf/iQTEWFzP0LvS8ws6T69aUeX3qeNJ0kqpJ45UOUxd8d8qrtQguSA==
X-Received: by 2002:ac2:48af:: with SMTP id u15mr75344lfg.75.1569447383383;
	Wed, 25 Sep 2019 14:36:23 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id n3sm47967lfl.62.2019.09.25.14.36.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:36:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:36:19 +0200
Message-Id: <20190925213619.18725-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
References: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 2/2] tesseract-lang: update to 4.0.0
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
X-List-Received-Date: Wed, 25 Sep 2019 21:36:23 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{tesseract-lang_git.bb => tesseract-lang_4.0.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract-lang_git.bb => tesseract-lang_4.0.0.bb} (82%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
similarity index 82%
rename from meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
index ac36a91a3..75c2bc00e 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
@@ -3,16 +3,16 @@ SUMMARY = "tesseract-ocr language files"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9648bd7af63bd3cc4f5ac046d12c49e4"
 
-PV = "3.04.00+git${SRCPV}"
-SRCREV = "3cf1e2df1fe1d1da29295c9ef0983796c7958b7d"
+SRCREV = "590567f20dc044f6948a8e2c61afc714c360ad0e"
 SRC_URI = "git://github.com/tesseract-ocr/tessdata.git"
+
 S = "${WORKDIR}/git"
 
 inherit allarch
 
 do_install() {
     install -d ${D}${datadir}/tessdata
-    cp -R --no-dereference --preserve=mode,links -v ${S}/*.traineddata ${S}/*.cube.* ${S}/*.tesseract_cube.* ${D}${datadir}/tessdata
+    cp -R --no-dereference --preserve=mode,links -v ${S}/*.traineddata ${D}${datadir}/tessdata
 }
 
 python populate_packages_prepend () {
-- 
2.17.1


