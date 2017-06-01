Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 29B6077D52
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:10 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 9so31958081pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q/k9kGfBpGRnucKGztZ4rQHXKy1AQct688+tZGNCeIM=;
	b=fPxy+4p/jzNgTP+gmiwDCBsTlvLbIgo7snV8hiU6PrFDMkDhwPuR64ZbJRdrEFw57F
	0s8TYSR2epfcC9Z3ofNtOABcGH7m51RZpkeuVZfxi30iXA95qkYETyBaKGuZEjYCb/lR
	Y4BAi3kzovzjao643X0xJNgeIjk9bxq/doDLSDhb9yPOQaWdCAccb0ZX7IG5dhfcFSlQ
	F2FOb1AhbpTUw0LVfHa0dQTv75nGriqk3jiNrrne6vN4LH8X/n1uGgBev5raISAdeagU
	lgjhsc6AzVwAjOaFPAmrIcNmE+BHwsT7Kzj5YELdm5pItS7pRhbZJbM/mO2YYSO5WXBk
	wdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q/k9kGfBpGRnucKGztZ4rQHXKy1AQct688+tZGNCeIM=;
	b=mDUeU+O1lTKqS77/vPFdVdVvap9M9IL1YCJIKfxzsA82e8vr79P0M7eXrpkX617tcJ
	+SK2m5BhisCKgxfbAwW+o7TLPlr/cGkdX40gvF098eLK1Pnu2aklpDaTiRiZUJDzIvIE
	67en50PG4/nmq5twXBnjycIy3UfhhGs7LLbi3hrhIowYt3ZPBx8QphaF00QJbcjC3qQe
	sQN4RpBa+dtRTJNxb9MRUwu5YCiEm2NNaGsHLRvhwxoW9KeEl44mSjH7x5w1ETt5fDKK
	PMtgKJIfK2e6L9heu4swPEGSk5yypYzqOBQAypspMYlIuu5OSWMdKxaHGTtJbb/cttqS
	0k7A==
X-Gm-Message-State: AODbwcByWxYgPGqoZqMW5F/g6eLGHhLvYy2a34iYCNhriT1gCw3fxu7d
	u9bEFg6/zIynQCOh
X-Received: by 10.84.217.21 with SMTP id o21mr9183055pli.50.1496335392132;
	Thu, 01 Jun 2017 09:43:12 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:11 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:50 -0700
Message-Id: <1496335374-25575-4-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 4/8] python-gevent: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:11 -0000

Extends recipe to support python3

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../recipes-devtools/python/python-gevent.inc      | 34 ++++++++++++++++++++++
 .../recipes-devtools/python/python-gevent_1.2.1.bb | 29 ++----------------
 .../python/python3-gevent_1.2.1.bb                 |  3 ++
 3 files changed, 39 insertions(+), 27 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-gevent.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-gevent_1.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
new file mode 100644
index 0000000..deeceae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-gevent.inc
@@ -0,0 +1,34 @@
+SUMMARY = "A coroutine-based Python networking library"
+DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
+a high-level synchronous API on top of the libevent event loop."
+HOMEPAGE = "http://www.gevent.org"
+LICENSE = "MIT & Python-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
+                    file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
+                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+DEPENDS += "libevent"
+DEPENDS += "${PYTHON_PN}-greenlet"
+RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
+		  ${PYTHON_PN}-mime \
+		  ${PYTHON_PN}-pprint \
+		  ${PYTHON_PN}-re \
+		 "
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
+
+SRC_URI_append = " \
+    file://libev-conf.patch;patch=1;pnum=1 \
+"
+
+SRC_URI[md5sum] = "6700a2433c8e0635425e6798760efc81"
+SRC_URI[sha256sum] = "3de300d0e32c31311e426e4d5d73b36777ed99c2bac3f8fbad939eeb2c29fa7c"
+
+# The python-gevent has no autoreconf ability
+# and the logic for detecting a cross compile is flawed
+# so always force a cross compile
+do_configure_append() {
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
+}
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb b/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb
index 953f48f..f357c95 100644
--- a/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb
@@ -1,28 +1,3 @@
-SUMMARY = "A coroutine-based Python networking library"
-DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
-a high-level synchronous API on top of the libevent event loop."
-HOMEPAGE = "http://www.gevent.org"
-LICENSE = "MIT & Python-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
-                    file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
-                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
-DEPENDS += "python-greenlet libevent"
-RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
-
-SRC_URI_append = " \
-    file://libev-conf.patch;patch=1;pnum=1 \
-"
-
-SRC_URI[md5sum] = "6700a2433c8e0635425e6798760efc81"
-SRC_URI[sha256sum] = "3de300d0e32c31311e426e4d5d73b36777ed99c2bac3f8fbad939eeb2c29fa7c"
-
-# The python-gevent has no autoreconf ability
-# and the logic for detecting a cross compile is flawed
-# so always force a cross compile
-do_configure_append() {
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
-}
-
-inherit pypi setuptools
+require python-gevent.inc
+inherit setuptools
 
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_1.2.1.bb
new file mode 100644
index 0000000..1f172e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gevent_1.2.1.bb
@@ -0,0 +1,3 @@
+require python-gevent.inc
+inherit setuptools3
+
-- 
2.7.4


