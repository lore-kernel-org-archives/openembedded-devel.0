Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9A2677B14
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t138so4726969wmt.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MKRnZYOtf8QTald/NlviHOS93hQy2jtOC9Z29gbYbAE=;
	b=QbeAyxeVnWANtlNQPBSYaKpYqWJ4qtWEGcCZJ8Jn8irV1H5kVQn72pm5a1+llpYkgP
	O2hodKf/C8sPNdaLHWwoSxYnW7j0hS/WFCAtHieYgZJLA/EzAlJul6WsBSCuPFvgjnca
	jksKUlDKMGTpj7GtR0i3Win+RBZCmADpM3lmd5bKvnPIgZ0DRr28oXlhUaH37GFy7sSE
	dv+a5c7ywsJKU+mhHWunWUCS4nCtxIVTPpDAGtFjrSQaSFLkc6G+yBx7KMRbyqdwQdO2
	76lVy8D4XOHjf0GQl4hrT6C+EZM/kEuwS8FmPygnwDvKM5d3RfuLyI2RYWBDPUfXutDs
	HQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MKRnZYOtf8QTald/NlviHOS93hQy2jtOC9Z29gbYbAE=;
	b=odEgrKVeD1klDfSGweQn0eIIN15h1r9pKuUML/D1if+R391gr2SSnp+CZDNFnOfbvU
	fE7uDZMm49QqZK7nA4cst/r/4i0jb/jihrCZako2TvjSEEGX6+/c4vEnSa5+CnvSEkn5
	qSF60cEZaAcZqBSyEP5Ly7KYUZdNq5kgEpsikLGc6HhJZxd2FyKC6nEeSWzjHCvxFesx
	QZQ34bwmBC8YiPBiyqXyW/Ubv2RixAmJ+EBbWJjZJoMsWer4spTYBnxthc6+dU09ajxW
	JbPl7aeBmzsGIyYwG36HwtZkLc6DmWKyEzUQiNdXEjkH3XlDZoBM3HRuMDnlIHmENEsw
	8TMg==
X-Gm-Message-State: AHYfb5hjGpoR78EL4LI4q+gaBf3RgWIuS43B5gpdmLtqxyK21LjotKb8
	NgIarKtxomVjLzYt
X-Received: by 10.28.151.19 with SMTP id z19mr4219079wmd.161.1502228321835;
	Tue, 08 Aug 2017 14:38:41 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:21 +0200
Message-Id: <20170808213821.17561-9-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] poppler: update 0.53.0 -> 0.57.0
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../poppler/{poppler_0.53.0.bb => poppler_0.57.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.53.0.bb => poppler_0.57.0.bb} (90%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.53.0.bb b/meta-oe/recipes-support/poppler/poppler_0.57.0.bb
similarity index 90%
rename from meta-oe/recipes-support/poppler/poppler_0.53.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.57.0.bb
index c1bfb31..63b77aa 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.53.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.57.0.bb
@@ -7,15 +7,15 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "943679f1030b9bc19a989f24121a282a"
-SRC_URI[sha256sum] = "592bf72960c6b5948b67657594b05e72d9a278daf7613c9f3cdff9a5b73096a8"
+SRC_URI[md5sum] = "bc5a191741604552c90d484103229374"
+SRC_URI[sha256sum] = "0ea37de71b7db78212ebc79df59f99b66409a29c2eac4d882dae9f2397fe44d8"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
 PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
-PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
+PACKAGECONFIG[jpeg] = "--enable-dctdecoder=libjpeg,--enable-dctdecoder=none,jpeg"
 PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
 PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
-- 
2.9.4


