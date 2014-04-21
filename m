Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3B09A65D06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 20:39:07 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3952941eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=myDWNq55e4qNBmzoafZgkf7mkkr+rVGDUaeSi/MWC08=;
	b=Mw/DU9mZNNdmw6Z90yH0Lhg7u21yWImqVNGbJ2fEf1dYWk+dGW3Ukmn4r8wX4Z9a9U
	3+XzALMfx+DddmajFTZ0BAQkSJ02HujfC+EACJxvgX1T8xc+YTERBqaq3iP2wB0cpY3M
	NhoOq43WlFugyT2GtipuiprfdgvnACvX0xfJ9DOmWpo7lgv4KqwOTp+/l/f6RVgfTdBV
	OgkUzMo9wZeLxjYQjLO49VdsvrLbn0maRdj3iz80ZGrBfmAStp0JnuiQkvAWloauI3jV
	MWZ8zO5JfD0Mj83D2322zlMtOJZBHrSWRSOoXKRw6V8kxLVzVKuXZ6sTb1dednP9+ttp
	w+Uw==
X-Received: by 10.15.102.74 with SMTP id bq50mr50502077eeb.21.1398112748212;
	Mon, 21 Apr 2014 13:39:08 -0700 (PDT)
Received: from localhost.localdomain (p4FDF19CD.dip0.t-ipconnect.de.
	[79.223.25.205]) by mx.google.com with ESMTPSA id
	a4sm106613146eep.12.2014.04.21.13.39.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 13:39:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Apr 2014 22:38:56 +0200
Message-Id: <1398112736-7015-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-gnome] devilspie2: update to 0.33
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
X-List-Received-Date: Mon, 21 Apr 2014 20:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: 0.24 failed if lua >= 5.2 was build before devilspie (e.g world build) with

| src/script.c: In function 'init_script':
| src/script.c:65:2: warning: implicit declaration of function 'lua_open' [-Wimplicit-function-declaration]
|   lua_State *lua=lua_open();
|   ^
| src/script.c:65:17: warning: initialization makes pointer from integer without a cast [enabled by default]
|   lua_State *lua=lua_open();
|                  ^
| arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=neon --sysroot=/home/superandy/tmp/oe-core-eglibc/sysroots/overo -ldl -lm -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  obj/devilspie2.o obj/xutils.o obj/script.o obj/script_functions.o -o bin/devilspie2 -lX11 `pkg-config --libs gtk+-2.0 libwnck-1.0 lua5.1`
| src/script.c:65: error: undefined reference to 'lua_open'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../devilspie/{devilspie2_0.24.bb => devilspie2_0.33.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/devilspie/{devilspie2_0.24.bb => devilspie2_0.33.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
index 9e6ba90..b00a449 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
@@ -4,15 +4,15 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
                     file://GPL3.txt;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "gtk+ glib-2.0 libwnck lua5.1 virtual/libx11"
+DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11"
 
 SRC_URI = " \
     http://www.gusnan.se/devilspie2/download/devilspie2_${PV}-src.tar.gz \
     file://default.lua \
     file://devilspie2.desktop \
 "
-SRC_URI[md5sum] = "90b354662659e2922bd051fdde3b0971"
-SRC_URI[sha256sum] = "9c94fa13ed8c0bf6914fdda513e21a4bd527821b97a53d8004168a8d465a646a"
+SRC_URI[md5sum] = "99c88f702e134d2b2f2f8caad4b1ef03"
+SRC_URI[sha256sum] = "01a2ebcece14065c9a2e47decd81341e2a6f63e3bf43ff446103686718748356"
 
 inherit pkgconfig
 
-- 
1.8.3.1


