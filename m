Return-Path: <just.another.mariano@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id C3D367DE82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 01:01:53 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id j5so81763256ioj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OGy/ab+jOMaYeoB0dPfMMJ3lWWg7b/QESqGKXsNnL0M=;
	b=se8Ar9OyxpZMYLOQfA+QNGCQY2snnykD54NT9PsdNv9CcwGKFITB1LJ4dSCzjbeoi5
	PUjIMeb/76nj6TypfGTgCS0i/GExwF23swDF2AX1wbx91599aKCeYe9tFlVdeLZtsKDV
	iny9Ta+PrM4+3kLgkT7m/jOQ2R8+Cwna/USMk7K54wYWiMYuNrPSV6mEfosgwqZCz6t0
	bNExZEuWnZFWt2f1i+xSKfOLaxrxLv1T8aXqC8RQ+RNQpP4GeNKDYaNdXsGJAa2wyNXF
	IYyC6jjOfBzAP19/Kg8QbtQ5gfUP/0WXtREqkBM75Uez24tPTOW+d0WwTa+YMOOA59mI
	CNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OGy/ab+jOMaYeoB0dPfMMJ3lWWg7b/QESqGKXsNnL0M=;
	b=nlbP0NxNCs+OhiZN4vJXBCjK4Ugeb5sxjpY9T8QDnxGnfLPJFjQcouXdIzzSF4x3Sc
	s+IgYGWNbzyEy0zm71VrKxvDaxm8Kb+662egqQh5sH3UVRBMOgTTWSsVa/NJJcgPpra4
	tDF+Xc26uNK/qA46E15S4Nf7yug4fqWWNHylvD31PD4KT43jCoptILi6z9jcnYstVUbI
	jpk4Jp/OQvmbSdFSqpiuYFMhlRZveOtQIuf9I6F1q3l/tf7e8j428KjPO0VCdkRsjAgX
	XWv0/+xvXvgYF4huNIXzkD6YoXdpWm0epEGaHyDufmw5zskWfyjisqcc/AofGy0BNYst
	0tfw==
X-Gm-Message-State: APjAAAUOq0jDScdG35u75BDFnc1zEnMtykUv2hA2h7pJeWzVEdfTsqx0
	C7/BNdNrMiM5IMdQZ0JJ9DXCQ+n4
X-Google-Smtp-Source: APXvYqwJUyJkBEPFTJCJ5gHtP0rOCD0NoO55O3TKTuP1XlshbbkQFYD40I/bZjxafhyp13FmJ7+X/Q==
X-Received: by 2002:a02:528a:: with SMTP id d132mr77950335jab.68.1563930114636;
	Tue, 23 Jul 2019 18:01:54 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:4350:1a54:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	p3sm66327162iom.7.2019.07.23.18.01.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jul 2019 18:01:54 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jul 2019 20:01:46 -0500
Message-Id: <ee3d674dd0facf57ae533e258304da560a512028.1563929956.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563929956.git.just.another.mariano@gmail.com>
References: <cover.1563929956.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] nftables: 0.9.0 > 0.9.1
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
X-List-Received-Date: Wed, 24 Jul 2019 01:01:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The upgrade includes a new python library, therefore added the
{PN}-python package.

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
---
 .../{nftables_0.9.0.bb => nftables_0.9.1.bb}     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.0.bb => nftables_0.9.1.bb} (51%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
similarity index 51%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
index 3ff9583fc..9d0da33e3 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
@@ -7,16 +7,22 @@ DEPENDS = "libmnl libnftnl readline gmp bison-native"
 
 UPSTREAM_CHECK_URI = "https://www.netfilter.org/projects/nftables/files/"
 
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
-           "
-SRC_URI[md5sum] = "d4dcb61df80aa544b2e142e91d937635"
-SRC_URI[sha256sum] = "ad8181b5fcb9ca572f444bed54018749588522ee97e4c21922648bb78d7e7e91"
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
+SRC_URI[md5sum] = "e2facbcad6c5d9bd87a0bf5081a31522"
+SRC_URI[sha256sum] = "ead3bb68ed540bfbb87a96f2b69c3d65ab0c2a0c3f6e739a395c09377d1b4fce"
 
 inherit autotools manpages pkgconfig
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "python"
 PACKAGECONFIG[man] = "--enable--man-doc, --disable-man-doc"
+PACKAGECONFIG[python] = "--with-python-bin=${PYTHON}, --with-python-bin="", python3"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
 ASNEEDED = ""
 
 RRECOMMENDS_${PN} += "kernel-module-nf-tables"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir_native}/${PYTHON_DIR}"
+RDEPENDS_${PN}-python = "python3-core python3-json"
-- 
2.21.0


