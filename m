Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF157EC5D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 00:52:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id d17so338821lfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 17:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q0P0RDs2Ir3qZ2b15Q3gSBfqDP6AtRjLdMpfpAhHo2c=;
	b=U1z2gAba+75+NROz9LTpFmH58gRKRpTw+kPVRXTngnxKMieQmIweJDzrF3KoGOdZgg
	oVqT2MC4SvkBBiC5doWSwznDtwQ+XVjTmH/d9eNL98vMe80/80jHdMbXZEGJXWme92en
	C0YD9j6NjP8O4HSRECda1vosSbxP/1bMb0FPbMzhlXEYZmsNeZ1alLR+Plp4CYl1rfh3
	gNY2AF7nvROtPl7z95LfKyjsly8a2OrcUWJfIBQBVTpoMFjrwTkXK5xCtyyCcz4Zys+V
	CJlhV1xDKvfHvCFoiBV/SrkPSp0c/h7d9rZpdvNLNwz4Ibujkc8JHGxeiOOSNkPhmXCo
	9Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q0P0RDs2Ir3qZ2b15Q3gSBfqDP6AtRjLdMpfpAhHo2c=;
	b=OZfjxe+vFXvnqqRVlGEFJmt/3bHHwZD51KU1GFZfOnnseD2Z/yEmfQeoMI51mCOZQK
	goAzADQnnRyOwGDLjDWZpSG8BFDNIXSp6dEFUe3IBXOXqbXO4INZ+oABU4JyYtd/KoLt
	r0plFD7PMxVhGOmI6+d5Le3q5UYD75T8sTqYX8hSTpSlr7VXcAJRisJdtjMhRCao9DFb
	sFuVTRHjr1XGDdVR4R+6ZBkF3/LJfY2F4KPsKItLLfhEd7p4nvV+cXeeSGzkjSnqCUZW
	Frx7blcMSUuSnhyrBkXitTwOn+TxGqgq28aOmQv7F34xdNJ6vAdOOGrIn7vX66cEALBl
	iQWg==
X-Gm-Message-State: APjAAAW4tJ77XofzudNTIkqU3UN4+UJdaQXqkF+ZUhBonW7KPr/oPT/r
	arOgjC7HrBNnM7s8HlWicJE7uMMxTCI=
X-Google-Smtp-Source: APXvYqwSiU08/zksHjiLvrQlWV01T7ZY63MusKVqvSL/GIFP11cdBdIhGv06bJXCA0Ht8XaNlzcp4w==
X-Received: by 2002:a19:6a09:: with SMTP id u9mr399794lfu.91.1569459147858;
	Wed, 25 Sep 2019 17:52:27 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id b25sm112925ljj.36.2019.09.25.17.52.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 17:52:27 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Sep 2019 02:52:23 +0200
Message-Id: <20190926005223.12612-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926005223.12612-1-open.source@oleksandr-kravchuk.com>
References: <20190926005223.12612-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 2/2] tesseract-lang: update to 4.0.0
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
X-List-Received-Date: Thu, 26 Sep 2019 00:52:28 -0000

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


