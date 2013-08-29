Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 44A416BE2C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:53 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so342104eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=dNL+aVnN5teG5k6IUWPNFSDVfZWpJtxRhVLn6XF5B+s=;
	b=ZpqQr+JVka098ID31JdoGz8ISyRG7j6Fo9q48TZjfj+v2DY4qXZ/PMK/epkIVdJUHv
	AtrV3wfRHS9DDIvd5pGCd2XaYTjyPMZO+EbocbGPP2VCJsp85y5n+g9TQaq2OfsxitMH
	FluVH7HkGYwc7ybcfaDBwCJI/zSRUFTMD9TvZb90nFJafKtgkPRm2piQs1+Bx5BuGbpT
	6bz7TtbONy0kaUN6c2HuzGTDKe7quo+h/AGKBiXRNdgF5CdNxlLqcUOPDnuP9I8jl9Zt
	/ZO3Qq3t0fgicbe4W0snRtv64YeQzKWzPrORAT6EyEXIw6kVQWOLa6dVaixQhH36RY6n
	RKmg==
X-Received: by 10.14.174.8 with SMTP id w8mr40604eel.84.1377791513730;
	Thu, 29 Aug 2013 08:51:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm47160124eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:41 +0200
Message-Id: <713e8a9dfe48b40bcbc816e5d7e5d7623222eef4.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 48/66] gegl: Add PACKAGECONFIG for jasper, avformat
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:51:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
index a68dc20..e5fc066 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
@@ -7,6 +7,10 @@ inherit gnome
 
 EXTRA_OECONF = "--disable-docs "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
+PACKAGECONFIG[avformat] = "--with-libavformat,--without-libavformat,libav"
+
 SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "32b00002f1f1e316115c4ed922e1dec8"
 SRC_URI[sha256sum] = "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9b1d9a6480dd8d426"
-- 
1.8.3.2


