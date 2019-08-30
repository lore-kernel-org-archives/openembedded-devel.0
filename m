Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id CC9887BFB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:14:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k1so6701326wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VKddmE4PHnJhWMEvu8CATHtt4AKYDbAA5m9+BV2NEx0=;
	b=rGuLkiG3+aZCHC6wIJR5Gg/Y6oWY+Il4cmq3AVSYDcf6ixUgkVfrnd61jLEMe+ze89
	RNeGF8mGgLJeWf4m6QdzUvXI9bn0CKu0dEuCvbYeZzhvlyH5eOK2gS4Y2GOr/KabvkFG
	PtG3DkZqwN2IhnUph6ZGKkB4x9YOVH9AFhSrCpHa2RUbqyKQ3DexGxASWYApbGoNBnnn
	ZW0yvYg/mztNa56ggjvWo3wzAq9nXNtK+ui9JBaFygdGkN7gD4RqKt2cqVy28HDyVoy6
	K5DvQFQWG5d8AQ6qGDmkCw2zDVR3zvKDP7UwGhmsX1ZvXjVZFPxeAWPzHck489HhYmeF
	zCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VKddmE4PHnJhWMEvu8CATHtt4AKYDbAA5m9+BV2NEx0=;
	b=hzUo12ynE7KJnZK3iCu1ptyIN97o3Vm0b/OH06K+nHde+x1ezksyv3GSoqZHZMkMLG
	H7SfP6iLcPEc+DbkPM84X6Hcmlouh7zDaGKgVnVj5j9QiLFffDemMfKb+t6zNvbadjch
	qCrR0AeAold0GO63JPTWIAlZwh/bjiu3hwdZMAMPfeg4THxUPpIZrTN+8GDXvoUY5lyT
	M8cDebPK8LTM5dpWYiDFfauLkMEI+aRpzPKje79drS4yVpuJ+UFXXqi8wV5k3SRJp81a
	FNhhgeG8mIrfmfNzD3BpbYKHqobQxjIlfPoi1+jr4SGV1ruCiQZRxZOXJpW+f0pP0UMF
	FAqw==
X-Gm-Message-State: APjAAAUoMO/CtlY5ID15U98Y+VP4HNEF3xHWLy/16uBG4CKm0RoBZmR4
	xONXEGGOnD4tmNe0s8N5BE1UH+xy
X-Google-Smtp-Source: APXvYqxCYfTuABblMGCegxMcShH66VMad4sGOsCL3jzB9eAry+VdMpsTAC+Bo6zWtwQzwo6k1jT07g==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr18380812wmk.9.1567160076163;
	Fri, 30 Aug 2019 03:14:36 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02915607EC4D6226D2CD7F.dip0.t-ipconnect.de.
	[2003:f0:7f02:9156:7ec:4d62:26d2:cd7f])
	by smtp.gmail.com with ESMTPSA id w5sm3866864wmm.43.2019.08.30.03.14.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 03:14:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Fri, 30 Aug 2019 12:14:24 +0200
Message-Id: <20190830101427.14200-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [mexta-xfce][PATCH 1/3] imsettings: upgrade 1.7.3 -> 1.8.1 and rework recipe
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
X-List-Received-Date: Fri, 30 Aug 2019 10:14:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is more or less a recipe rewrite:

* stylize recipe
* Use gtk3 instead of gtk
* Drop gconf backend - we should get rid of orphaned gconf
* Add PACKAGECONFIGs for 'xim' and 'xfce' - xfce is set by default
* Drop intltool-native from depends - they moved to gettext
* Remove entries from FILES - gobject-introspection.bbclass takes care

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...msettings_1.7.3.bb => imsettings_1.8.1.bb} | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.3.bb => imsettings_1.8.1.bb} (64%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
similarity index 64%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
index 8f622bf6f..36cd7ad72 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
@@ -7,25 +7,27 @@ This package contains the core DBus services and some utilities."
 HOMEPAGE = "http://code.google.com/p/imsettings/"
 SECTION = "Applications/System"
 
-inherit autotools gtk-doc gobject-introspection distro_features_check
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit autotools gtk-doc gobject-introspection gettext distro_features_check
 
-SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
-           "
+DEPENDS = "gtk+3 libnotify dbus-glib"
 
-SRC_URI[md5sum] = "c6c65a2b2654fe9dfe9ab2e8b80c079a"
-SRC_URI[sha256sum] = "196d3a74cef254ff812c32682d1818d740e36a68b976fef9e99748d23a71a71a"
+REQUIRED_DISTRO_FEATURES = "x11"
 
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "c04341a008d8c60e1532f033f4020f44"
+SRC_URI[sha256sum] = "ebf578299a10c6a1fea9047be6577df6d2b6470d3cc9d40f8a6589a3c13c4c8b"
 
 EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
                 --disable-static \
                "
 
-DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf intltool-native"
+PACKAGECONFIG ??= "xfce"
+PACKAGECONFIG[xfce] = ",,xfconf"
+PACKAGECONFIG[xim] = ",,libgxim"
 
 RDEPENDS_${PN} += "bash"
 
-FILES_${PN} += "${datadir}/dbus-1/* ${datadir}/gir-1.0/* ${libdir}/girepository-1.0/*"
+FILES_${PN} += "${datadir}/dbus-1/*"
-- 
2.21.0


