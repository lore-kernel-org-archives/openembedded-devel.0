Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4F17F22D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 06:46:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b16so16083943wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1xP2wiOXA9X06q/TslA+mmIw0AzmW1xUuRKX6bsH7T4=;
	b=Tbcg7HtNh2szU/u9xwCL2tBsQEW9z4hLDZmbPlHArY/QYUskLw28GhobxdyogswUdI
	exyObGC57raawtUkgGO+1h/Ovf52soDMlWSFUeSmFlpCvuOz51ZEj6eHJ2Gc55P3RJCf
	gHuVH+GKlvAPK363PG72vAT4bCcPQZMEj4nFXURFtQSPASXEcKkWqLvFl6hoLNxIfhW7
	6Qh1hd7kyKyG5D4xq36RxEBUkx+140dkk/bCQuvD16iMNjTcqkdaYJYgBpyn83Q/GiIs
	zZmlnDCE0i3jmbJFLrvOeLY+U7d7YIWrM6NlIq9MLtl9M+8N07U0rBFO3nm9D7nRrwgQ
	Cnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1xP2wiOXA9X06q/TslA+mmIw0AzmW1xUuRKX6bsH7T4=;
	b=TlxgIAb2CWhWk/hpPt663TtwQEy6eJjJZZa+RiSJz/rEkxQAatHLXaNST9nICSZhMO
	tAXdGIod1ekf6Yrm6rmIjgekEhM5TR+qOfMcwhDfJO2RHcpR1Ql0m+gIXlSnxqIrUsUt
	bzssjZx3NnRgo++cWU6aGw4bxxKNAxY2VLsgkkYsEw78pktjY7GmCNxJD4v/FqW6OPsF
	ReCmpPAbrW4R9MQmiR0b3g2Q6Prc6KLXsWo3nzWa6SrhJoWqNXZroj8x8HxxYcmizK6O
	8KRTlf9FtLzLQlrbguijR+Y7ZFSbOrAnqd7Dxw0yZ1s3QJ8IA84Uze8JcpXEDsB5MCxS
	5c3A==
X-Gm-Message-State: APjAAAXRp0OkRYy07N3SSTqf98Z6ndp23DHQ3TR4qoLNYBF4NYTi4YGL
	RoguA8jRoIj6tvnkfYLrn2qdMw0u
X-Google-Smtp-Source: APXvYqysvGEY+AesObTv0so13V17BYoISAwg3jLFVPZzFJKVtWiy0X1RS1EDaF0HYDWIZt7BznJE4w==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr32056449wrm.112.1567493174394;
	Mon, 02 Sep 2019 23:46:14 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02A21973D945F5DCDB0D0E.dip0.t-ipconnect.de.
	[2003:f0:7f02:a219:73d9:45f5:dcdb:d0e])
	by smtp.gmail.com with ESMTPSA id
	f143sm9121245wme.40.2019.09.02.23.46.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 23:46:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 08:46:01 +0200
Message-Id: <20190903064603.17637-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903064603.17637-1-schnitzeltony@gmail.com>
References: <20190903064603.17637-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH V2 1/3] imsettings: upgrade 1.7.3 -> 1.8.1 and rework recipe
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
X-List-Received-Date: Tue, 03 Sep 2019 06:46:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is more or less a recipe rewrite:

* stylize recipe
* Use gtk3 instead of gtk.
* Drop gconf backend - we should get rid of orphanded gconf
* Add PACKAGECONFIGs for 'xim' and 'xfce' - xfce is set by default
* Drop intltool-native from depends - they moved to gettext
* Remove entries from FILES - gobject-introspection.bbclass takes care
* Remove dbus-glib from depends - they moved to gdbus long time ago (Thanks Kai)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...msettings_1.7.3.bb => imsettings_1.8.1.bb} | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.3.bb => imsettings_1.8.1.bb} (64%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
similarity index 64%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
index 8f622bf6f..5c94cb6bc 100644
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
+DEPENDS = "gtk+3 libnotify"
 
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


