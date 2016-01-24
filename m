Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6EB76E2E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:05 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id o11so8407545qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XyoqeLGaOzw+GsSbiCZoPACmk+gEj5Y8ZjVYK58Ql9E=;
	b=WKZGBNTLeKNOKsLSHiF/WZhzckAH2sRCBYoHIdYEgMsK3qTatVLZyz9I7Lh1yc/r3R
	8WAQ0B8qvWAUcRJE5QNp6E6EGu2Ts1iN8JqnBBY3hU4fuTqZxXx8KiJgk8HYFsjC27tD
	luNZ9j0ZLeAHLZdkfdXtwv4ch8DY2ZwCIIFujNObJuC42ApeeaPmY/r+R4Yyzowt+kDZ
	PWdC/RyzXOCfWHdL2C63EttKBcJEGsi7QvwBCelX52B2Mm1Fl9iiC9Oy/d3MEeDLV1jy
	/WNj0EDqbui55rPn5eUQPEaQjTtkcgoAoDV8pfQz56iXVCcjNvsamxJguTaOGqE1OGff
	9/Kw==
X-Gm-Message-State: AG10YORnQcRfTKOqEsoCaooNCf003SAJTkr63CnWOeM3bNHxDEMRywIu+6qkZEmeL/9hQQ==
X-Received: by 10.140.39.179 with SMTP id v48mr15134680qgv.98.1453641486062;
	Sun, 24 Jan 2016 05:18:06 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:43 -0500
Message-Id: <8478bbd6a16a5f7e25514a2a5da4fba77e5d57a0.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 10/13] python-cmd2: update to 0.6.8
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:06 -0000

---
 .../python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
index 0ae5c43..f4962d6 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
 
-SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
-SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
+SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
+SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
 
 inherit pypi setuptools
 
-- 
1.9.1


