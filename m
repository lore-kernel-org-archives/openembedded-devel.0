Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7246E71D82
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so15745228wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pM9ZmSCct4CQbJXPODh9NRCpS31QDnTHCzRRRBUIZvM=;
	b=ZDO3CFE/e5pyv/BFA4Mzu94ItsgaoMiAlzCaTFz1kTlcJZzOezVzIQQ6840jKQzpQv
	YCF1VTIbG4rW1ckf5GnslSiDhvWaIeek3v8WPGVvT/wgIiXIZElyVmH0dcqQ3o9KSfzi
	Bn9nJV8Hke1yX1+poh7Tmm9DhpMTEL1F94NuoxCD1jRkBMWzZ6jUDm4VvrwViUdrF3zE
	ugzkB6GSRleMKpZ6BhCw7hmvlMh/uSHgLv3hxp8IZ0StDuY5tTE2D3X8kjfuR3uo6HvJ
	nzFBQh7rucGlJULMm3E0niiXZYT+2UH0y9NgyR3C3VlYnmLIEw1urnuSEWtHZgywpvBe
	g3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pM9ZmSCct4CQbJXPODh9NRCpS31QDnTHCzRRRBUIZvM=;
	b=OHybFu3WSRJYtfUGNlL3EeTGis6BI/cCqeV5NbEVhP5b6nmfZ5HR/sDnGbTPW/1+8b
	KH58kT4Xxh3QtDJhwJFg3hoiw8KbwoQs/NkBfdxvzGGcM3Nnan6/CeEaOxUy7arBZWMN
	CYXzuZXUTCH9W022pcGM2daNWqnIF6Ac8dd+cRhLvPMCPppDwVz/EOf6Fw4Rg0zH1VLD
	M32eDs4npOE3yHBdkdLanRynnPe9l6g2etqbURWADNZmIcwy3RlUOaIy0Ch249U8rdMW
	pyfq9XeAnLKdsIGxmVBTpqmAK0m1ztjLtUgOOaUu+gWYTiursr/7lnwkURrTQMvFbAYe
	QFsg==
X-Gm-Message-State: AMke39lkIGoTwDOs0uWN3BtUiyDwj4a9I/CdIMtPKaTTv91iJCa928SpCBB0TbV7S3EHuQ==
X-Received: by 10.28.63.15 with SMTP id m15mr21654791wma.119.1487614065533;
	Mon, 20 Feb 2017 10:07:45 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:46 +0100
Message-Id: <20170220180700.29836-31-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 30/44] xdg-user-dirs: fix build by disabling building of man pages and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have tried adding several native dependenciesbut gut no successful build.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...disable-man-generation-disable-documentat.patch | 31 ++++++++++++++++++++++
 .../xdg-user-dirs/xdg-user-dirs_0.15.bb            |  5 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch

diff --git a/meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch b/meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
new file mode 100644
index 0000000..b2b0e49
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
@@ -0,0 +1,31 @@
+From 41093d9634bfeddcaec866745d8d4022f4c6f8c1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 19 Feb 2017 21:01:39 +0100
+Subject: [PATCH] explicitly disable man generation --disable-documentation is
+ not enough
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c01c54f..dcdf7a2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ NULL =
+ 
+-SUBDIRS=po man
++SUBDIRS=po
+ 
+ INCLUDES =					\
+ 	-I$(top_srcdir)				\
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
index 22b4bb6..c056759 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = " \
     http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
+    file://0001-explicitly-disable-man-generation-disable-documentat.patch \
     file://xdg-user-dirs.desktop \
 "
 SRC_URI[md5sum] = "f5aaf5686ad7d8809a664bfb4566a54d"
@@ -11,6 +12,8 @@ SRC_URI[sha256sum] = "20b4a751f41d0554bce3e0ce5e8d934be98cc62d48f0b90a894c3e1916
 
 inherit autotools gettext
 
+EXTRA_OECONF = "--disable-documentation"
+
 do_install_append () {
     install -d ${D}${sysconfdir}/xdg/autostart
     install -m 644 ${WORKDIR}/xdg-user-dirs.desktop ${D}${sysconfdir}/xdg/autostart
@@ -20,5 +23,3 @@ CONFFILES_${PN} += " \
     ${sysconfdir}/xdg/user-dirs.conf \
     ${sysconfdir}/xdg/user-dirs.defaults \
 "
-
-PNBLACKLIST[xdg-user-dirs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130635/"
-- 
2.9.3


