Return-Path: <gizero@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id CF7D47423D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:41:23 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so64723092wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hab42sIOnLFldQZ4dwrUm32qTzk1s3c116OqeCcaDIk=;
	b=0bvBHSx9TbtS0itn1EVjMRwVmUjMf+67U85O9vk2uoyMN9Vc8LzMGFuDtgJkdZqO0h
	/nDW6jMHo7UOoUrQL+sR4t0h96qX0v4yH792zAeiPyYAWr9DQxEnpFLGbn8LUOHWTed1
	xOOkTJ5myO2tDqIf0v9a//ghpilPbuds9UEtwzS83x4qOm0Uc1AQj4kXby1kQkEocVLe
	JF40mYdy2+00qjpLJPByn5E+HNvs0vTfAXgc7nrm7v94/EXSse4VKIEztQ67m4ry+Hn9
	xTBbUTEF8rrFWdt9fAhT+MEHL1Z+hLTDFd0SHdZmwiqIKTfwauzTsVAB2YWwGlOO1b7M
	1ySA==
X-Received: by 10.194.21.98 with SMTP id u2mr85330581wje.141.1441978883444;
	Fri, 11 Sep 2015 06:41:23 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	nb10sm621368wic.11.2015.09.11.06.41.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Sep 2015 06:41:22 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Sep 2015 15:41:07 +0200
Message-Id: <1441978867-24237-4-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441978867-24237-1-git-send-email-gizero@gmail.com>
References: <1441978867-24237-1-git-send-email-gizero@gmail.com>
Subject: [meta-oe][PATCH 3/3] redis: stylize
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
X-List-Received-Date: Fri, 11 Sep 2015 13:41:25 -0000

* remove trailing whitespaces
* run through oe-stylize

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_3.0.2.bb | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
index 4ed6879..55f2c96 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM="file://COPYING;md5=3c01b49fed4df1a79843688fa3f7b9d6"
-
+LIC_FILES_CHKSUM = "file://COPYING;md5=3c01b49fed4df1a79843688fa3f7b9d6"
 DEPENDS = ""
+
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
@@ -13,26 +13,22 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
            file://init-redis-server \
 "
-
-inherit autotools-brokensep update-rc.d
-
-INITSCRIPT_NAME = "redis-server"
-INITSCRIPT_PARAMS = "defaults 87"
-
 SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
 SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
 
+inherit autotools-brokensep update-rc.d
+
 do_install() {
     export PREFIX=${D}/${prefix}
     oe_runmake install
-
     install -d ${D}/${sysconfdir}/redis
     install -m 0644 ${WORKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
-
-    install -d ${D}/${sysconfdir}/init.d 
+    install -d ${D}/${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
-
     install -d ${D}/var/lib/redis/
 }
 
 CONFFILES_${PN} = "${sysconfdir}/redis/redis.conf"
+
+INITSCRIPT_NAME = "redis-server"
+INITSCRIPT_PARAMS = "defaults 87"
-- 
1.9.1


