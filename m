Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E64267869E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:01:07 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o77so1982371qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vaWWUYWUmAHwALpc8f48wDtjxR8dXC46GkZq8p6NIvE=;
	b=IVLDIjozfjn668jECJDTSV7b5hir4JkTHMN7o2XSL6VeRn5bnaSYd+kx/OKby2A3lC
	YhVWiO1vgsEhQ+UgeNLpSh1JAsstchxWW2oSMvEOKtkMnO70gXExAXXsvM5H+MdwRzy0
	gCYfpyOlEd34eH+b5EV32V7MTYr9E+jD5GjNGqBZVKlrdLmouIwaC93+SDLmWWjR9zTG
	S0FJcBXmLhNSRa0u5VrVkba6PX1+C/rT603RA2pBV7RNVSefmSJd14JMjf6Ea5f79BMj
	w6/au70/tKzZ/N+ykVooeOghEA8EbvC6ofNgDy3LPSj6lDoQY2BEnUQcBnqNJOT6yvY8
	XoYg==
X-Gm-Message-State: AHPjjUi/1Un34434PIrpvRu9V2dI46Sw9/5caJREiZ8MUxBKKbuhZahZ
	XCxmZrJQWI6xHp1+dck=
X-Google-Smtp-Source: AOwi7QCEstBfYKrCmz5HJ4LD01RaGAk7KmKNlr4TmurKpTKZ3Jsm+KJZ7cn1MexdKev0pQabXY698A==
X-Received: by 10.55.79.71 with SMTP id d68mr9330005qkb.247.1505502068401;
	Fri, 15 Sep 2017 12:01:08 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id k20sm981232qtj.2.2017.09.15.12.01.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:01:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:00:59 -0400
Message-Id: <1505502059-22261-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.14
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
X-List-Received-Date: Fri, 15 Sep 2017 19:01:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc             | 4 ++--
 .../{python-sqlalchemy_1.1.13.bb => python-sqlalchemy_1.1.14.bb}      | 0
 .../{python3-sqlalchemy_1.1.13.bb => python3-sqlalchemy_1.1.14.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.13.bb => python-sqlalchemy_1.1.14.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.13.bb => python3-sqlalchemy_1.1.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 12f16c3..cc8e82f 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "6353eb8223b8476bb0399c28adff5850"
-SRC_URI[sha256sum] = "2a98ac87b30eaa2bee1f1044848b9590e476e7f93d033c6542e60b993a5cf898"
+SRC_URI[md5sum] = "b32669d53e903b3512065026552f3bff"
+SRC_URI[sha256sum] = "f1191e29e35b6fe1aef7175a09b1707ebb7bd08d0b17cb0feada76c49e5a2d1e"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.13.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.13.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.13.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.13.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.14.bb
-- 
2.7.4


