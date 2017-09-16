Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 444177833C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 22:49:34 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d70so3512737qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jPDELZxQJutPOqnCoNv5KFr6u5GG+Sk8BMQ3vg5iL0k=;
	b=H5kDjR15K65fdQFARbbHcdIc+ggCnM6e8aepggS+jGe0jVDfjD/tToE4Me+4kPGPdT
	zNQ4pIGq2enHIQb8YF44kHeDhRpimAcEWicTQe9+GUs08eZAfrX0hobNQaGq7tuCY0nW
	TPsYt/TR/SIqVVzxTvEdui4Um+H7c5OvrrcSVYz5Ozt0MBxTEUxGYXGMla9jMLd274Jv
	n5R1TrkftAUQ9gNod0w3SyfOfgUGdgqa7FcwR4l4nuouKSnmWsQ34kbwg/BPfrFNh3So
	pKySzybmQgmDq8h0ocHpPIALqzz0gUtCBcSxND+nDoGy5q0Q7u7zgEnPeNwZjtR7uXEw
	9AlA==
X-Gm-Message-State: AHPjjUiRZeA2nYrb6CNDtaHeNE1R9ssLf9iZXxHpKkXAfvd/IUZsNzIW
	DOH0WO7Igv9Qba01uog=
X-Google-Smtp-Source: AOwi7QCZ7IZfZqJlSSSBJnG1oenE3qDjpTwftvtRrsoYJJ269/jjLdfntKK1HvRbmdWT/lhVf595LA==
X-Received: by 10.55.54.140 with SMTP id d134mr3172911qka.285.1505602175772;
	Sat, 16 Sep 2017 15:49:35 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	p67sm2682770qkb.97.2017.09.16.15.49.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Sep 2017 15:49:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Sep 2017 18:49:28 -0400
Message-Id: <1505602168-17862-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: update to version 2.5.0
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
X-List-Received-Date: Sat, 16 Sep 2017 22:49:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc                  | 4 ++--
 .../python/{python-babel_2.4.0.bb => python-babel_2.5.0.bb}           | 0
 .../python/{python3-babel_2.4.0.bb => python3-babel_2.5.0.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-babel_2.4.0.bb => python-babel_2.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-babel_2.4.0.bb => python3-babel_2.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index 3789863..f671969 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
 
-SRC_URI[md5sum] = "90e7a0add19b2036a9b415630a0d9388"
-SRC_URI[sha256sum] = "8c98f5e5f8f5f088571f2c6bd88d530e331cbbcb95a7311a0db69d3dca7ec563"
+SRC_URI[md5sum] = "03da8249c2684abcbd208a8d0f979939"
+SRC_URI[sha256sum] = "754177ee7481b6fac1bf84edeeb6338ab51640984e97e4083657d384b1c8830d"
 
 PYPI_PACKAGE = "Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-babel_2.4.0.bb b/meta-python/recipes-devtools/python/python-babel_2.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-babel_2.4.0.bb
rename to meta-python/recipes-devtools/python/python-babel_2.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.4.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-babel_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.5.0.bb
-- 
2.7.4


