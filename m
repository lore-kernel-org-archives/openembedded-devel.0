Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6DF60797
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 02:36:15 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id l27so8572984pfk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Apr 2018 19:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cn2HW8f+FVKzEYlH0AdXyImkS6bfJi7Mz8FYCmiICW8=;
	b=Js53aUJhttNDaop1OxMF62YHmWl4JcztIVo9PjjjhZB/rxBq57gPRra6Rmabz6MDgS
	EsL0Z/kl5mCs0JLdj27Xf8yfEYrOUJz7J8HGeeWlRND5II8cQ6CXtf3QSZTjLRQOiv0P
	JqZUjlhU3QUcvs+BclSrbdeqwcssuuMLclKzQmeBGXrqE/tdGvnJAf+W9bdyFlwS19r9
	hnmf96h3LZX24UwUHpXL/oUHgUU6r4lHnsCn2VKtbvvDeqAOhzVKDb7mVWzcV6XnrbDx
	UC51dKC6VGJZh9suXCrSm6ND+kqDbYneOm+Ph860k8FieoyrxfVhrZ+LrN3MnWgPWT50
	i/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cn2HW8f+FVKzEYlH0AdXyImkS6bfJi7Mz8FYCmiICW8=;
	b=Rm2rhr++9F3rpxymPUL/oMyWdOAHxhLYBakzlF7VSRtoapIv2QMbjb7ZpA1uyl4flb
	b8+1bvsc7WZVGxY2y+BsWxfcbEt6fLnb2QP6MGOvLXswPxqagEwiIxXS+lQh5L96v9YK
	6RH4wZuRdfLHQaJvb53at+eEhzoTNU80rFhvnDfk4t6gHbr0X/gzF08arNJA6KaiucxA
	+ozHEla89xDmCd6kZplq78L12jkO8diqA1F5b7Bjlj34TV2YCiC97FmLwjgKmzEXcxJZ
	1CnHH3NOPtp2DTAsBpCekrYrZyMVWeYSrXXhOV30oYPvN4qVqlkYQqqlyx4CWGoJn1xi
	1Kig==
X-Gm-Message-State: AElRT7FmzHGeAhRwdyWeImKZtvmpJ9tKFRqUHEHIyC7zX5P7xvgdHCPD
	X5gHzoMZwLhKUFBEWojwR3M=
X-Google-Smtp-Source: AIpwx4/JPMOezIFZh/0ZXWfeuKVcB/UkVZI856WwT+nkpXRM29AJR8LgoXvalqQPblBD9551UWZd1A==
X-Received: by 10.98.160.92 with SMTP id r89mr5985831pfe.235.1522636577162;
	Sun, 01 Apr 2018 19:36:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:8867:b1c6:143:cb38])
	by smtp.gmail.com with ESMTPSA id
	y19sm12566842pfm.65.2018.04.01.19.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Apr 2018 19:36:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  1 Apr 2018 19:36:15 -0700
Message-Id: <1522636575-23776-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] poppler: fix compile errors
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
X-List-Received-Date: Mon, 02 Apr 2018 02:36:16 -0000

disable glib  via new PACKGAGECONFIG option

glib.so, not found (try using -rpath or -rpath-link)
| ./libpoppler-glib.so: undefined reference to `FormWidgetText::noSpellCheck() const'
| ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::deselectAll()'
| ./libpoppler-glib.so: undefined reference to `StructElement::getTextSpansInternal(MarkedContentOutputDev&) const'
| ./libpoppler-glib.so: undefined reference to `PopplerCache::PopplerCache(int)'
| ./libpoppler-glib.so: undefined reference to `MemStream::MemStream(char*, long long, long long, Object&&)'
| ./libpoppler-glib.so: undefined reference to `StructElement::appendSubTreeText(GooString*, bool) const'
| ./libpoppler-glib.so: undefined reference to `typeinfo for LinkOCGState'
| ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::noSpellCheck() const'
| ./libpoppler-glib.so: undefined reference to `XRef::okToChange(bool)'
| ./libpoppler-glib.so: undefined reference to `globalParams'
| ./libpoppler-glib.so: undefined reference to `MarkedContentOutputDev::MarkedContentOutputDev(int)'
| ./libpoppler-glib.so: undefined reference to `GfxPath::lineTo(double, double)'
| ./libpoppler-glib.so: undefined reference to `FormWidgetButton::getButtonType() const'
| ./libpoppler-glib.so: undefined reference to `GfxPath::close()'
| ./libpoppler-glib.so: undefined reference to `PDFDoc::getID(GooString*, GooString*)'
| ./libpoppler-glib.so: undefined reference to `pdfDocEncoding'
| ./libpoppler-glib.so: undefined reference to `BaseStream::BaseStream(Object&&, long long)'
| ./libpoppler-glib.so: undefined reference to `GfxGouraudTriangleShading::getTriangle(int, double*, double*, double*, double*, double*, double*, double*, double*, double*)'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.62.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
index 6966219..d20751f 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
@@ -21,6 +21,7 @@ PACKAGECONFIG[curl] = "-DENABLE_LIBCURL=ON,-DENABLE_LIBCURL=OFF,curl"
 PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=none,openjpeg"
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
 PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
+PACKAGECONFIG[glib] = "-DENABLE_GLIB=ON,-DENABLE_GLIB=OFF, glib-2.0"
 
 # surprise - did not expect this to work :)
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
-- 
2.7.4


