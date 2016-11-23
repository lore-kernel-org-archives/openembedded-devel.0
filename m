Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0886571A8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:13:48 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a197so79695108wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 06:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yY/xvKmwgawUoCsGByKUHig7BjeOJ5DhifahU316IhQ=;
	b=sgY3T0kJVSghG+3aiVQn2WGHCi2n3UFo5Lmacz8wU7NRLKDMfXcvv3r1WC+XFOQ10a
	uYkVuISrQoWB3SXMvE+ZS+6lEALP+vMTym1kPtgM2jTuyIZ8gqxkvJOVfEeOEsVLbe4F
	ToUb2wSox30hp8VepzSjRN6hQGcXXJweMobUE+dxWKWoCRWikK4el8q/wwHj9n49tce+
	3VFp3vxkP/z3W4b9saFD6Hez54sY0rCuwR1tJelR1WkAHFjjq/RRxgYQCyUvlTC1te7R
	mAgjat4s5+UbI0hqrVC6UJwVAiR7lTTOKv4g2Hir2Lgulr26bb56dKig4zQyPYYVexKj
	SrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yY/xvKmwgawUoCsGByKUHig7BjeOJ5DhifahU316IhQ=;
	b=QsPkPsZbHfmnSeR+3BITaGwQ41gSOtUROau2FU4bPtbazkcTvT7KHZv8vPavNeKEjJ
	/7V2zyWHqzisinW4LQdfXoHhxdesvP75CaybDEWIu6tTth5tjKETiRp97+dJ0IDRQABs
	ECqn7q79j740GeVe4FKrZRRwOrMzcNTVIQPQ+nkH8vWHZZyo4L479KnpesC4DKiqo4RG
	AzL3bv1hGHUeUCHJ72idjef4fbXQq3wNIivrGHy62lAWd8ioaSNL61S0/LQUsXOn5ZYn
	dUQgq+UIPz2684/oTqzNy5zZemnC+IV1XCTGiyF5MrUSt8jeu4NtGSCtgjFUehzp1vB1
	x1IQ==
X-Gm-Message-State: AKaTC02FzdHRZ6NHH6I7fm2LHKlBPuJU0V1+BD7XkU/YMCEajIPeU9eNPTwyOFXBp9JOa7f0
X-Received: by 10.194.231.8 with SMTP id tc8mr3369223wjc.193.1479910429619;
	Wed, 23 Nov 2016 06:13:49 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	cl10sm36665099wjb.4.2016.11.23.06.13.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 06:13:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 14:13:40 +0000
Message-Id: <1479910421-28750-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
References: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] meta-gnome: remove redundant gnome-common dependencies
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
X-List-Received-Date: Wed, 23 Nov 2016 14:13:49 -0000

These recipes don't actually use gnome-common macros, so don't depend on it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb          | 2 +-
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
index a90e5cd..5e902a1 100644
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
 
-DEPENDS = "gnome-common glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0 librsvg"
+DEPENDS = "glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0 librsvg"
 
 inherit autotools gettext pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index c31de0c..aecf6a7 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://libedataserver/e-data-server-util.h;endline=20;md5=934502f03c84523aa059d4825887b380 \
                     file://calendar/libecal/e-cal.h;endline=24;md5=5d496b9b6fd2a4fdbbfc31ef9455c9d0"
 
-DEPENDS = "intltool-native glib-2.0 gtk+3 gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical libgnome-keyring gperf-native libgdata nss"
+DEPENDS = "intltool-native glib-2.0 gtk+3 gconf dbus db virtual/libiconv zlib libsoup-2.4 libglade libical libgnome-keyring gperf-native libgdata nss"
 
 SRCREV = "a9e4e74ec4473a4fd09e56b690bd4fa72f686687"
 
@@ -114,4 +114,3 @@ FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution
 FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
                               ${libdir}/pkgconfig/libedataserverui-*.pc \
                               ${includedir}/evolution-data-server-*/libedataserverui/*.h"
-
-- 
2.8.1


