Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6AE7C892
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:49:46 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id s22so3301792pfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H67qYDHHHTI8l0DfPxMJxtHYWN3vZKKBsYCqHOOjMgU=;
	b=IltLUxASrOHkKCjIQ8sQPdI2u3wP+gj54I7btNirCoZumqF/UznN8vjNQAbdcejlwr
	qd8cEl9SyYZRFPpjR5z1CNWSDlPE5OBPegNxmPokoGNF1UHS2GflDSmp7jUKh73CHGzz
	/WGDO5YtKUN78KEOfUk9fbjv6ZEEeDc6NJ9x6zWgTKRziuGnhd6SZIfVa8rJ0UR5c7i+
	uA5/nPknen+M5+EpVdSqIqlUu11QXM7s11MXEvbk3AiTewqzPNMkhJpfgOp7YuFfl3+n
	oJj/I8WSi2d9PQTZpgL48zIsS/Xibj3V6zC3wlWehUgJlDkFdmWt+P+ZEI4baD7OWTHx
	H2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H67qYDHHHTI8l0DfPxMJxtHYWN3vZKKBsYCqHOOjMgU=;
	b=DcREigISlS89BEEZ/dEuUD4wd+Vra3PGKH1emCj8PJPwtBkGz4ERKOZNUds3hm5FHd
	6dwhOro7TfrwZneV6o9kNdTxktejjCCk6E18ggGF8PyYx4FRBn2tqy13128HHG5kpwhy
	j1Tfwt5+hhtD+aq+A8bObmsMepd3S17HAmCtoxCW3PfJ1jc7qVKEgSoTWSNI5NWvd4+v
	sgLjc/YK+zWAD4FRm4vzysLVRuxmmGf5xjGC4nHjqBdHcamkgbOMsckNNSGErPYv2L48
	GmoXhiwlh0EiUIK0DIUD4VznPRp60vgrxHpCFNj1gzF5L06FRtklDt1aMLwNe/Fi8mZz
	xoCA==
X-Gm-Message-State: APjAAAXjR74ivTpQs+Tb+Eh6tMtC9i+X6m/6ApLlKeIy6WKdjTdCa0rD
	htyBYFYB+2UpxBLzS7w2wamUqLZq
X-Google-Smtp-Source: APXvYqwy1GykFyBJHvfCFzu5Jshr2z20135gf1ENSht3Lx2ge9hXyebP8KTtpnnl4U4qRyglsuxvkQ==
X-Received: by 2002:a63:94:: with SMTP id 142mr429846pga.277.1551714587652;
	Mon, 04 Mar 2019 07:49:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::caa9])
	by smtp.gmail.com with ESMTPSA id
	f193sm9826781pgc.3.2019.03.04.07.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:49:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Mar 2019 07:49:37 -0800
Message-Id: <20190304154937.30548-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] octave: Exclude from world builds
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
X-List-Received-Date: Mon, 04 Mar 2019 15:49:47 -0000
Content-Transfer-Encoding: 8bit

it needs lapack which inturn needs libgfortran
and fortran support in compiler is not on by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/octave/octave_4.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
index c91556c760..1ec32ce89a 100644
--- a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
+++ b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
@@ -37,3 +37,4 @@ FILES_liboctave-dbg = "${libdir}/${PN}/${PV}/.debug"
 
 FILES_${PN}-dbg = "${bindir}/.debug ${libdir}/${PN}/${PV}/oct/${TARGET_SYS}/.debug"
 
+EXCLUDE_FROM_WORLD = "1"
-- 
2.21.0


