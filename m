Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id A6CB36BD86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:57 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so340750ead.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TM7iFZrt6i5R0H5bDE6JFfmXwS1T9Phl6DfXvg9lvYU=;
	b=k2U6Ec/zLvxuqo/C8o5KzVP0LsrctMeXVyBJUgIt52Ur7dL+bdtZKShkZb/778Yyeu
	oM3J5yORt3aIrjR9j9IuzdHRqJJY4zRCTeW9IbZ9Uf0fZtImr0FyIADrBECpCgoweoJC
	fZzrgQxfqz62T4se6ps/fnmIWEOhN1a7twzj+dM0S5AtV+wvGP6g9g+2VGFxo1Q11jWH
	1kQPvcK7DXIkGKLhOyLfGkiqmpgPs5JKLPD4Ea2XHjlcUT1tZIQBf4UBTzKESsS1UbkB
	fw5SlN67HOITYeU8mOe5Ej9XgOKjpyaXRrDp2mYs9Oq+f8+Tfh4OdGKEByfX0rVEx3j1
	a27A==
X-Received: by 10.15.35.1 with SMTP id f1mr3672003eev.79.1377791458025;
	Thu, 29 Aug 2013 08:50:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm47155751eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:00 +0200
Message-Id: <3e24b1a42f10363cca3594b0467ccca8782fdb5b.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 07/66] imagemagick: Add PACKAGECONFIG for jp2
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
index 4ebcde5..9963990 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
@@ -20,6 +20,9 @@ inherit autotools binconfig pkgconfig
 # if someone needs xml support then fix it first
 EXTRA_OECONF = "--program-prefix= --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jp2] = "--with-jp2,--without-jp2,jasper"
+
 FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/filters \
-- 
1.8.3.2


