Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D60E7718D
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:53 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.154127.1734709069390603271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XUGim9GB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2024122015374780db5ac4a63d306adf-d3dvno@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024122015374780db5ac4a63d306adf
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7WxTsMMXTnf1ueSinhKlN5bc/X/5cgMl/1kYesSo/q0=;
 b=XUGim9GB7TU1v99JgSepZDAbr/TZTJzSTJ9ck2S0xn3VsKCpA36Zvd0XDzcS/glvg9xo8i
 YkWM22HqwTtSoMYnh3LKN1A0acS01M9DE218GumyKj6JgTQICoMW0QE7MMSwH0NXark3JPBT
 9fGgA7NEyX4GMu2+7GMXn3IFO/MGtZ0mFzSEPIwyk+6H9aqD8MJzT9/16ryNeog0TQpCp/1c
 GS5gqVn5HwxGiZBOCR7yrHNM0mciaIRM8v7rsMCJexaG5laMqT7NkIW1ZZ2ghqmfiw72u1yA
 IwbT/L+0l3SGS3mXLxzpIweJ4KYIQ9PlDAR5JvgyzZLjKY3zUwoNZBbw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 07/11] libmemcached: merge inc into bb
Date: Fri, 20 Dec 2024 16:36:25 +0100
Message-Id: <20241220153629.2499631-8-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114443

From: Peter Marko <peter.marko@siemens.com>

After removing old libmemcached recipe version, these is no reasons
anymore to have this split.
The memcached resurrected project uses cmake and different urls.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libmemcached/libmemcached.inc             | 17 -----------------
 .../libmemcached/libmemcached_1.0.18.bb       | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 19 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libmemcached/libmemcached.inc

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
deleted file mode 100644
index 319ab29ce7..0000000000
--- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "open source C/C++ client library and tools for the memcached server"
-DEPENDS = "libevent util-linux"
-SECTION = "libdevel"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=865490941c91ba790f0ea78dec93bd60"
-
-SRC_URI = "http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemcached-${PV}.tar.gz"
-
-UPSTREAM_CHECK_URI = "https://launchpad.net/libmemcached"
-
-TARGET_LDFLAGS += "-luuid"
-TARGET_CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[sasl] = "--enable-sasl,--disable-sasl,cyrus-sasl"
-
-inherit autotools gettext pkgconfig
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
index 56778c0483..7d18d0217d 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
@@ -1,6 +1,11 @@
-require libmemcached.inc
+DESCRIPTION = "open source C/C++ client library and tools for the memcached server"
+DEPENDS = "libevent util-linux"
+SECTION = "libdevel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=865490941c91ba790f0ea78dec93bd60"
 
-SRC_URI += "\
+SRC_URI = "\
+           http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemcached-${PV}.tar.gz \
            file://crosscompile.patch \
            file://0001-configure.ac-Do-not-configure-build-aux.patch \
            file://0001-Fix-comparison-types.patch \
@@ -8,3 +13,13 @@ SRC_URI += "\
            "
 SRC_URI[md5sum] = "b3958716b4e53ddc5992e6c49d97e819"
 SRC_URI[sha256sum] = "e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82"
+
+UPSTREAM_CHECK_URI = "https://launchpad.net/libmemcached"
+
+TARGET_LDFLAGS += "-luuid"
+TARGET_CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[sasl] = "--enable-sasl,--disable-sasl,cyrus-sasl"
+
+inherit autotools gettext pkgconfig
-- 
2.30.2


