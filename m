Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 65F5260088
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:55:04 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r129so43169068wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PpfaX+YEf99fk9S1PwZhnLdlPQ693VjF2W9WNPk7M64=;
	b=RnTrD+nVe1eLuE6B2MyWk0GPsFxTvrJ7UhQKvesZlbXHDceoInt2SHZtXjsvIA0ROz
	bwyi/8DkFYJCCh1RAMDruFmW11YjdENG9A7MSA13xxdiaRdwHFr3lP+vVW36aBfSm5Ah
	Bh0w3m5bNZfR0x5AuBlawwJhKmD2IU0sfZsQ9lzyx3rWv2qBRUrMCYfAXEkdxG6eQcVO
	Nwzja5rIL/gg4Z7zTf5M7FygdSUjUz6oJObRT5fkXlOgFtOagYPIFC+rHRSZN8O4VaOg
	qhTWFz8JNmYci80BlAjztrzZ0tlojqSIFGLLPCU5RIWNInw2b3exqLTm+6Yp8qSpEz8F
	1uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PpfaX+YEf99fk9S1PwZhnLdlPQ693VjF2W9WNPk7M64=;
	b=BniGr47gOb2x5DUJYI9+FpmgoVbkmPpcv6TQtHaUUwS6RIrFbjtf9CyBo1+q5gNQjP
	/1Dk34bnavnfZDfYhZjeQI4N1UCcildnZUWYJoHA/2aQDcfP7IiZUuWdqQkSfinocNn8
	02mZUFfeTF6mZoog5YrGKA85N5rSBpTqIxIeJwE3gBKE1n6WDAEAUSVOe813SO1wST6k
	cFtRl3fw178Uefis+feNegeT46kKf0pMEWAxb0J8T4fheHjrL0wNHTUxPt3T73q36Usp
	iMCBbbywVGmCXSHf3A7mqgH4zP3QctG2JzLzMf7HYFBh6Ox5sdmHjbkFPMPxd5pD7MiG
	Dz1Q==
X-Gm-Message-State: AG10YORDl158jSo3+o0zb/E+aEyo9xDunB8N9IehKfWf1vlFXgZwVUHwZshDSfMudCLgn+8G
X-Received: by 10.28.131.134 with SMTP id f128mr19031672wmd.41.1454705704988; 
	Fri, 05 Feb 2016 12:55:04 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	av3sm17447774wjc.44.2016.02.05.12.55.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 12:55:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Feb 2016 20:55:02 +0000
Message-Id: <1454705702-23456-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gnome-mime-data: add (from oe-core)
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
X-List-Received-Date: Fri, 05 Feb 2016 20:55:06 -0000

Add this recipe as it's being removed from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome-mime-data/gnome-mime-data/pkgconfig.patch   | 14 ++++++++++++++
 .../gnome-mime-data/gnome-mime-data_2.18.0.bb         | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
new file mode 100644
index 0000000..0903425
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: gnome-mime-data-2.18.0/Makefile.am
+===================================================================
+--- gnome-mime-data-2.18.0.orig/Makefile.am	2009-06-11 17:27:48.000000000 +0100
++++ gnome-mime-data-2.18.0/Makefile.am	2009-06-11 17:27:59.000000000 +0100
+@@ -1,6 +1,6 @@
+ SUBDIRS = man po
+ 
+-pkgconfigdir = $(datadir)/pkgconfig
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = gnome-mime-data-2.0.pc
+ 
+ NULL=
diff --git a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
new file mode 100644
index 0000000..a31eb55
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Base MIME and Application database for GNOME"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://check-mime.pl;endline=26;md5=a95b63c92c33d4ca1af61a315888f450"
+
+inherit gnomebase mime
+PR = "r4"
+
+SRC_URI += "file://pkgconfig.patch"
+
+SRC_URI[archive.md5sum] = "541858188f80090d12a33b5a7c34d42c"
+SRC_URI[archive.sha256sum] = "37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7"
+GNOME_COMPRESS_TYPE="bz2"
+
+DEPENDS += "shared-mime-info intltool-native"
+RDEPENDS_${PN} = "shared-mime-info"
-- 
2.7.0


