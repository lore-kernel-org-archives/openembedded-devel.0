Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 675CC77683
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:40:48 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id u25so104973277qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CpWcmgEj3IkOoLmRaYOLKCHDV5hjtXamDgoDxRZSVF8=;
	b=TmgJ210o5ycxIbMbrRvsx4dtaDeq21AuYfVE6p1fa3hNqjoIEY9vjG18G6Xa7GgibJ
	svTltb0iyqe37xYYaNOtZvT/5siLv1tti/PC4OOQk8dM863gtOJX6CaVZlLjH4vFdpdW
	kkERqdjU1DrpJWtyF8LyVzpql/eVQ828MEbJUIQXTIvXGS3SEVxSFdHvOJXx1F3aEnLW
	htlRRUXjYA806oidANTT/3puM924b5iwyGIzu6dacmqlsBVVLS0wqUNlUSF7RdWJGbaN
	h8nfrv2kjmfFiDR3zUlBgJPYi5qWhAg6GRhr67tOox3mcFJlMsrrSNrEyfssqykoVnEy
	9rtQ==
X-Gm-Message-State: AIkVDXLmf4X3OjEYkYBzBGlJCZiz+dJCFr6GprIJGPGa8g5uyjIMjEu3m3rzwzK0OqAZBw==
X-Received: by 10.55.198.129 with SMTP id s1mr11274701qkl.268.1482417650135;
	Thu, 22 Dec 2016 06:40:50 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	y17sm18095001qkb.24.2016.12.22.06.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 06:40:49 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 09:40:39 -0500
Message-Id: <1482417639-20969-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bcrypt: update to version 3.1.2
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
X-List-Received-Date: Thu, 22 Dec 2016 14:40:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-bcrypt_3.1.1.bb => python-bcrypt_3.1.2.bb}  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bcrypt_3.1.1.bb => python-bcrypt_3.1.2.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.1.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.2.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-bcrypt_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-bcrypt_3.1.2.bb
index aae037f..d7adc0e 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-bcrypt_3.1.2.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 DEPENDS = "python-cffi-native"
 
-SRC_URI[md5sum] = "7348b2c361e23cf205701bba7652d789"
-SRC_URI[sha256sum] = "0309a4a72bd1dc314279cf1ee14e277227732f14c9b63ab96715654e13fe9321"
+SRC_URI[md5sum] = "c5a79004fc4ad589615e96a6fe45b664"
+SRC_URI[sha256sum] = "346e175c820a111c17d4c2def181a96e1826652edb0bb16e565085ed542785aa"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
-    python-cffi \
-    python-six \
+RDEPENDS_${PN}_class-target = "\
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-six \
 "
-- 
2.7.4


