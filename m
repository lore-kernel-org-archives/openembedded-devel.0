Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 94FCB60144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 14:44:00 +0000 (UTC)
Received: by qcxm20 with SMTP id m20so37409178qcx.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 06:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=OvPdvwlFyovpsAcHzEl39sb0KlQGbCiEH69dBj2l6KE=;
	b=uFAvaPyrOTtxtN6741Ax9OWi3qhZrD+vQjEuxj5TpYjxkNuqhQPAQcNo+ZCiZCpk5w
	EZx9YHfBPUM6/WZZwZmId9KtRJ8jP4sAk1CPo38jEGtca+P4whtKyIN+ChpX1YokWHFl
	WNczCL4S07QKxD4msLSciYAlmt026Tv1g+LWASg5zmfx0ZhUqOyHpNGIuX8vs8jw46sS
	7pR33FOVqZLbg9IRGk9atrYId/HJHvDIInkS4cPctRAS19OVtl1wXZuRewV1sj9oRv3Z
	hZsQe+p7jnhrSryNNQ7Uo8yw/M21MlQZLZtQdkVgEHRl0ruIVbEuGdQ1w4HLnAmJBqvo
	zgHg==
X-Received: by 10.140.40.203 with SMTP id x69mr5935562qgx.15.1425480241723;
	Wed, 04 Mar 2015 06:44:01 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.175.83])
	by mx.google.com with ESMTPSA id 59sm2307565qgf.37.2015.03.04.06.43.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 06:44:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed,  4 Mar 2015 11:42:20 -0300
Message-Id: <1425480141-18610-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] v4l-utils: Fix media-ctl support
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
X-List-Received-Date: Wed, 04 Mar 2015 14:44:02 -0000

The media-ctl package is generated with same name, but from a
different source. To offer an upgrade path the only change necessary
is to add 'media-ctl' in the PROVIDES so dependencies for build can be
satisfied.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index ba6e692..f533bff 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -2,18 +2,15 @@ SUMMARY = "v4l2 and IR applications"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+PROVIDES = "libv4l media-ctl"
 
 DEPENDS = "jpeg \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 
 inherit autotools gettext pkgconfig
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[mediactl] = "--enable-v4l-utils,--disable-v4l-utils,,"
-# libv4l was absorbed into this, let OE know that
-PROVIDES = "libv4l media-ctl"
-PROVIDES += "${@base_contains('PACKAGECONFIG', 'mediactl', 'media-ctl', '', d)}"
-RPROVIDES_${PN} += "${@base_contains('PACKAGECONFIG', 'mediactl', 'media-ctl', '', d)}"
+PACKAGECONFIG ??= "media-ctl"
+PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
 
 SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-- 
2.1.4


