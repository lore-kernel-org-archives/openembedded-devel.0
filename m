Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 49521731CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:00:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so406722wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n6mdZFjuk1JR5QixaOE/TlhJPfauBhx7VCjFj/IrsrU=;
	b=v+CcjvZctNeG0bZYdhKgUcnPxqjw4WaH61z44CIIdnEb8sVuDaceBlSJiMvjXNsuFr
	s5t5Vxd9hdm4lYGRXAmgW7cn4KgZA7IC8cuBZLrDdKBUVT2Wp6hN2XGIWF6qw6T0n1DZ
	OZhBoXkJ24ZpIOgaXY8X9nOTjABSqLhF6dznusuxdKG6QW3NrGo0jF3/yiB0Y0a8Gm1D
	kEIyFhTo7gpQ+17u7OFcgctngpjMn51zJqTw7gLZluZ3vz9MmPNtzNGyKTx2lQO3yjyN
	pB4mb+NDUWGqaCfFhEa7OxibxjkYvheZaN5RTMHSziRBgY0igwkoOYTlUpOkwWhCD3vH
	TZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n6mdZFjuk1JR5QixaOE/TlhJPfauBhx7VCjFj/IrsrU=;
	b=Rr3qZIDCojRS79UeLfksArn1Kf9hjzSV3OjigvXQYJiD4T+XPGBPTLraa6oEGzKlLI
	x4NULcSkyTv3hTEHSYIvu+JoQ1EkwdzSS4tgduEmED/S4Y3QCC3If995VZAzeo2lpbQo
	cCjZFzlKXFESGtnBbBApC/Utx+31+T+2KHPq0sasJyt6GCvVkfgR/TDbnkn8IhWlYn+V
	fhkj+oYyOgaJXb5quFvQW5QBtptI7yyWI6V1ar3HieplzdbSGFUip01Ga5DTtwVrNvZB
	kiE1nCaFImGvwf6NUgm2ribXHZnGEcQV5WFm7xjxncNx/sLiEzA+wb5ggdW2MJARvwcH
	rmDA==
X-Gm-Message-State: AEkoousKs/SRR05loYCMIZyPTrb0W425s7iNTMuGIKd7Li9SpSvY9Mxj0mxgwceq6s4zIw==
X-Received: by 10.28.193.10 with SMTP id r10mr445566wmf.49.1471539618617;
	Thu, 18 Aug 2016 10:00:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id a9sm3086832wjf.16.2016.08.18.10.00.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 10:00:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 19:00:11 +0200
Message-Id: <20160818170012.5819-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160818170012.5819-1-Martin.Jansa@gmail.com>
References: <20160818170012.5819-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] meta-oe: remove PR = "r0"
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
X-List-Received-Date: Thu, 18 Aug 2016 17:00:23 -0000

* this is default value

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/usleep/usleep_1.0.bb                    | 2 --
 meta-oe/recipes-devtools/lua/lua_5.3.2.bb                    | 2 --
 meta-oe/recipes-extended/haveged/haveged_1.9.1.bb            | 2 --
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb  | 1 -
 meta-oe/recipes-support/libnih/libnih_1.0.3.bb               | 2 --
 meta-python/recipes-devtools/python/python-dateutil.inc      | 1 -
 meta-python/recipes-devtools/python/python-feedformatter.inc | 1 -
 meta-python/recipes-devtools/python/python-jinja2.inc        | 1 -
 meta-python/recipes-devtools/python/python-markupsafe.inc    | 2 --
 meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb  | 2 --
 meta-python/recipes-devtools/python/python-passlib.inc       | 1 -
 meta-python/recipes-devtools/python/python-pymisp.inc        | 1 -
 meta-python/recipes-devtools/python/python-redis.inc         | 1 -
 13 files changed, 19 deletions(-)

diff --git a/meta-oe/recipes-core/usleep/usleep_1.0.bb b/meta-oe/recipes-core/usleep/usleep_1.0.bb
index 403c6b7..9e9c7ed 100644
--- a/meta-oe/recipes-core/usleep/usleep_1.0.bb
+++ b/meta-oe/recipes-core/usleep/usleep_1.0.bb
@@ -3,8 +3,6 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r0"
-
 S = "${WORKDIR}"
 DEPENDS = "popt"
 
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
index 07a1a43..a9aa0f8 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
@@ -4,8 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=68fc2aa2b751a37ff265524ddf026d7f"
 HOMEPAGE = "http://www.lua.org/"
 
-PR = "r0"
-
 DEPENDS = "readline"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
index 0fc6289..92776fd 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
@@ -12,8 +12,6 @@ SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
 SRC_URI[md5sum] = "015ff58cd10607db0e0de60aeca2f5f8"
 SRC_URI[sha256sum] = "9c2363ed9542a6784ff08e247182137e71f2ddb79e8e6c1ac4ad50d21ced3715"
 
-PR = "r0"
-
 inherit autotools systemd
 
 EXTRA_OECONF = "\
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
index edf84c1..c64bd92 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
@@ -7,7 +7,6 @@ DESCRIPTION = "scsirastools were designed to add to the Serviceability of \
 HOMEPAGE = "http://scsirastools.sourceforge.net/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=687ea108478d26152ae46eb29d9d1545"
-PR = "r0"
 
 SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz"
 SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
diff --git a/meta-oe/recipes-support/libnih/libnih_1.0.3.bb b/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
index 97385a1..40aa896 100644
--- a/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
+++ b/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
@@ -22,8 +22,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "dbus libnih-native"
 DEPENDS_class-native = "dbus-native"
 
-PR = "r0"
-
 SRC_URI = "https://launchpad.net/${BPN}/1.0/${PV}/+download/${BP}.tar.gz \
     file://libnih_1.0.3-4ubuntu16.patch \
 "
diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index b754bb7..464e2e0 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -3,7 +3,6 @@ DESCRIPTION = "The dateutil module provides powerful extensions to the datetime
 HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
-PR = "r0"
 
 SRC_URI[md5sum] = "05ffc6d2cc85a7fd93bb245807f715ef"
 SRC_URI[sha256sum] = "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed"
diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b/meta-python/recipes-devtools/python/python-feedformatter.inc
index 499bed2..a333ef4 100644
--- a/meta-python/recipes-devtools/python/python-feedformatter.inc
+++ b/meta-python/recipes-devtools/python/python-feedformatter.inc
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
 SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
-PR = "r0"
 
 SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
 
diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index f6ee79b..c3ed6de 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone templ
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
-PR = "r0"
 PYPI_PACKAGE = "Jinja2"
 
 SRC_URI[md5sum] = "edb51693fe22c53cee5403775c71a99e"
diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index fd7d9bd..de61944 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -3,8 +3,6 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
 
-PR = "r0"
-
 SRC_URI[md5sum] = "f5ab3deee4c37cd6a922fb81e730da6e"
 SRC_URI[sha256sum] = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
 
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
index 3b7853e..a3f73fb 100644
--- a/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
@@ -2,8 +2,6 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-PR = "r0"
-
 SRC_URI[md5sum] = "eb2aad1081534ef3a9f32a0ecd350b9b"
 SRC_URI[sha256sum] = "5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b"
 
diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
index 843e8e0..3cd2c0a 100644
--- a/meta-python/recipes-devtools/python/python-passlib.inc
+++ b/meta-python/recipes-devtools/python/python-passlib.inc
@@ -8,7 +8,6 @@ hashing for multi-user applications."
 HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bae8faa3e2689ee0df3f2127fc4517f5"
-PR = "r0"
 
 SRC_URI[md5sum] = "d2edd6c42cde136a538b48d90a06ad67"
 SRC_URI[sha256sum] = "a83d34f53dc9b17aa42c9a35c3fbcc5120f3fcb07f7f8721ec45e6a27be347fc"
diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index f80858e..abeed93 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=67a9496dcf5cf97af38edc77834fb4b9"
-PR = "r0"
 
 SRC_URI[md5sum] = "7cd8279f658899aabc606567b094896d"
 SRC_URI[sha256sum] = "45527078d48efc493f30c27d0dedc4143670b0cf85ecb8f2118c9c6463b1c86c"
diff --git a/meta-python/recipes-devtools/python/python-redis.inc b/meta-python/recipes-devtools/python/python-redis.inc
index e64f041..17ff231 100644
--- a/meta-python/recipes-devtools/python/python-redis.inc
+++ b/meta-python/recipes-devtools/python/python-redis.inc
@@ -3,7 +3,6 @@ DESCRIPTION = "The Python interface to the Redis key-value store."
 HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
-PR = "r0"
 
 SRC_URI[md5sum] = "3b26c2b9703b4b56b30a1ad508e31083"
 SRC_URI[sha256sum] = "5dfbae6acfc54edf0a7a415b99e0b21c0a3c27a7f787b292eea727b1facc5533"
-- 
2.9.2


