Return-Path: <eduardo@monkey.io>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 841E4738B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 16:50:26 +0000 (UTC)
Received: by yhaf10 with SMTP id f10so22689048yha.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 08:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SL6VtBj7mL/Ox3HqEZ0MARJ4xaUCAgg2vTZuaEdivYc=;
	b=ljheRfi9peaOcCEen7QEbuMXwptUGv9vmtgBScWHVW6jga+GRcVzQwVb9o5MeuxktO
	z20Y06qoqcfTlzgDZHDKteAIspRGsh2Mkv092uuKPcAXEy6W1UrRCEEOmhVceyQ0ln5r
	VBqu+oFQXGoOkSIbBfq71WFrVRi4xno4fAtUdv89nLiY2A3SVb8IfLj+FBPuVg3f+Hlo
	otksAtwQG0KcrwHhIh39U5p9RgMUBndEaASco2ABtrl9B8d8V0pWXcnhCmsBMbcUlU5B
	EIB+iWBoI4FZuFych9/GGhEH1gh+su2VkD7CKh5ipO7H4DjsBzTDi8Sgedja2ELihIn6
	g1WQ==
X-Gm-Message-State: ALoCoQkUIt4IbBq70XF+w9cPRf91hzKG6mBzY4p0eHC7lHD7KHoUJJce6ZJRhactvno8JtPUo4mI
X-Received: by 10.170.60.17 with SMTP id c17mr3936460ykc.128.1425487827670;
	Wed, 04 Mar 2015 08:50:27 -0800 (PST)
Received: from monotop.cabletica.com (ip95-195-15-186.ct.co.cr.
	[186.15.195.95])
	by mx.google.com with ESMTPSA id 30sm3488257yhf.8.2015.03.04.08.50.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 08:50:27 -0800 (PST)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2015 10:50:08 -0600
Message-Id: <1425487808-22201-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 2.1.0
Subject: [meta-webserver][PATCH] Monkey: new v1.5.6 release.
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
X-List-Received-Date: Wed, 04 Mar 2015 16:50:27 -0000

This patch add the new Monkey HTTP Server v1.5.6.

For more details about software changes please visit:

    http://monkey-project.com/Announcements/v1.5.6

=== Build Tests ==

 This version have been tested on Yocto/Daisy based on RPM.

 monkey-yocto/5aee7684cd66f78fb51f78138603a4dde4ef2484

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/{monkey_1.5.4.bb => monkey_1.5.6.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.4.bb => monkey_1.5.6.bb} (93%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
similarity index 93%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
index a4963af..d7330a1 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[md5sum] = "b794724ac38cfedee2a5d27c175bc87e"
-SRC_URI[sha256sum] = "662bbafc614d32f645059e6e00258fed640665594f5b7f11cf4c4763cf09ddcf"
+SRC_URI[md5sum] = "9699e4c9ea6ce6b989907c252ae80254"
+SRC_URI[sha256sum] = "7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22"
 
 EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --logdir=${localstatedir}/log/monkey/ \
@@ -21,7 +21,7 @@ EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --datadir=${localstatedir}/www/monkey/ \
                 --sysconfdir=${sysconfdir}/monkey/ \
                 --enable-plugins=* \
-                --disable-plugins=polarssl \
+                --disable-plugins=mbedtls \
                 --debug \
                 --malloc-libc"
 
-- 
2.1.0


