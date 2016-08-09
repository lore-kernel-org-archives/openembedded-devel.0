Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 791D376E70
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 22:42:43 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o1so2120684qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 15:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lo1V10g7TCvPmTT7Plx0fdzs+9T/xRJd+053X3KWWpg=;
	b=Ub4/oPJn8fAHWGm5WzcAKkLL+GQ4e2Sm62Fh8nw8wZFH4OOMmTFkh55bGRCRvRziHC
	fcbPYL2+NEEIUOv1XSrWMZ42dtncDYz6Lput5KlklRGkfqjNvNsUm68A4Jaht8AHQHkN
	BgQSiWBVr17qtmG5X6QvuYKiG2kLIo20t2beShoCZwiilnc8sURsVbPqHIP5ry4jVhqA
	6H70fuVxE4qNcw/oEoVvWu+15A/dqG9WyV4miPaXSUgygnWNVuoLpAZW7KyJ++1yEi/B
	3VcqPa8raH7T96izR+j7h1DF9ljoUWiTVg/ExpLtGlONu4vWT+pL7mA/AG6BxjFPIOgp
	PK7w==
X-Gm-Message-State: AEkoousoNCDzSkdGE/MPvH6utG4RmIZyYsDloqSd8U16GVezTEG3FfoDLbSsoJKxT5utAA==
X-Received: by 10.55.79.139 with SMTP id d133mr860317qkb.99.1470782564273;
	Tue, 09 Aug 2016 15:42:44 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	m10sm21663492qta.31.2016.08.09.15.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 15:42:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 18:42:32 -0400
Message-Id: <1470782552-5625-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470782552-5625-1-git-send-email-derek@asterius.io>
References: <1470782552-5625-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 2/2] upower: update to version 0.99.4
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
X-List-Received-Date: Tue, 09 Aug 2016 22:42:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-support/upower/{upower_0.9.14.bb => upower_0.99.4.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/upower/{upower_0.9.14.bb => upower_0.99.4.bb} (84%)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.99.4.bb
similarity index 84%
rename from meta-oe/recipes-support/upower/upower_0.9.14.bb
rename to meta-oe/recipes-support/upower/upower_0.99.4.bb
index d2c5943..861f17c 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
@@ -2,13 +2,11 @@ DESCRIPTION = "UPower is an abstraction for enumerating power devices, listening
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
-PR = "r2"
-
 DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
-SRC_URI[sha256sum] = "81eb44c0453b264a737d32f763a31d5b1776f050a47d5be85fc5e9caf874a4c5"
+SRC_URI[md5sum] = "78800e1ac7f92b24aabdf433e38f75d2"
+SRC_URI[sha256sum] = "9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b17648037b0"
 
 inherit autotools pkgconfig gettext gobject-introspection
 
@@ -22,7 +20,7 @@ do_configure_prepend() {
     sed -i -e 's: doc : :g' ${S}/Makefile.am
 }    
 
-
+RDEPENDS_${PN} += "dbus"
 RRECOMMENDS_${PN} += "pm-utils"
 FILES_${PN} += "${datadir}/dbus-1/ \
                 ${datadir}/polkit-1/ \
-- 
1.9.1


