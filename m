Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 01A5071C14
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 21:22:51 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so8898025pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kr+Fuq1CxWDFdlyuLNV1LpcJAD/2+BmSZ8saKYvkXUo=;
	b=KHf4v6LO+DEj4tLS4ZlRhhrrFzGzQuoNMleCvepLhYFK0mT4sedJ+bhKnXRb6wdL8Q
	sIuhgsTUYRGOTztlBHE+u7TT0BRumDHCitI7hb27lATJ0zifoOISskbm5wjRSYn0a8g4
	0sdEkTyBTAs4cuFTDvBh+uxRAg/hZMSpzSybalXp0LH56EZ4+IeWAPRe8DhfcrBv/S8m
	kov/yRPawNsXWbIhRWfg2QPgVTFta4REmf22LX7uSzGoTpMIbZfQTCdvvrBW/Rur47+C
	tZF5k61pbls4QEV183nMgSAFXsBeDvW9bP2RDwES5pwRh54ULSSO4JOQZtdylFCenN4X
	aMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kr+Fuq1CxWDFdlyuLNV1LpcJAD/2+BmSZ8saKYvkXUo=;
	b=StcjRMYi/UUl+CZR/0ByK9qoGyDQqt9PyB/AJZiTe3ZpGDPL5BuBAyclnOXaqF4EiN
	yW2CvRTPOKrndEbypWjbEQLSD6vNnFC/deto2buzR+PdW2kPE7nJyk1qeK4rr8GK3b6U
	fyTpYG9b+CFXkwzpNw8lvpY3MGp+zCP3o7prvlwC39Vo1XUfvxadIqLRoqDv5Qhg706u
	/e/94CC3NyA03DtrzLeRGw1iDnhOLYeaTRjtx4sPX+jvYF5PdrdgXmmptAHFIbQnUFGy
	DRNRVssZ0v9R+vkHJOKVWShSekPUgyg6IYZAXohoo3jyKrO/Zc/IQ6H3E406um6M+7Qt
	GXEA==
X-Gm-Message-State: AKaTC01eu9oGvk/AIavWsFTFykM4d+AMcgN1Bew/uKsgUyiXnZT6TdYO4YLrsBuI+4CDug==
X-Received: by 10.99.123.87 with SMTP id k23mr83948300pgn.101.1480713773562;
	Fri, 02 Dec 2016 13:22:53 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w16sm9843174pgc.30.2016.12.02.13.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 13:22:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 13:22:47 -0800
Message-Id: <20161202212247.3416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] libvncserver: Fix build with security flags on and disable libva
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
X-List-Received-Date: Fri, 02 Dec 2016 21:22:53 -0000

When libva is present it detects it and then fails to build
until the support is fixed, lets disable it

Add a patch to fix issue found when compiling with
security flags turned on

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libvncserver/0002-format_string.patch           | 21 +++++++++++++++++++++
 .../libvncserver/libvncserver_0.9.10.bb             |  3 +++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch
new file mode 100644
index 0000000..566a208
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-format_string.patch
@@ -0,0 +1,21 @@
+From: Luca Falavigna <dktrkranz@debian.org>
+Date: Tue, 27 Jan 2015 01:26:04 +0000
+Subject: format_string
+
+---
+ client_examples/gtkvncviewer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client_examples/gtkvncviewer.c b/client_examples/gtkvncviewer.c
+index 261b2da..861e4e3 100644
+--- a/client_examples/gtkvncviewer.c
++++ b/client_examples/gtkvncviewer.c
+@@ -588,7 +588,7 @@ static void GtkDefaultLog (const char *format, ...)
+ 
+ 	time (&log_clock);
+ 	strftime (buf, 255, "%d/%m/%Y %X ", localtime (&log_clock));
+-	fprintf (stdout, buf);
++	fprintf (stdout, "%s", buf);
+ 
+ 	vfprintf (stdout, format, args);
+ 	fflush (stdout);
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
index 387202b..0eba87c 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
@@ -14,6 +14,7 @@ SRC_URI  = "\
     ${DEBIAN_MIRROR}/main/libv/libvncserver/libvncserver_0.9.10+dfsg.orig.tar.xz \
     file://0001-remove-webclients-build.patch \
     file://0002-common-add-sha1.patch \
+    file://0002-format_string.patch \
 "
 
 SRC_URI[md5sum] = "e883b6c7bd339a5e1c48645051abe5c4"
@@ -21,4 +22,6 @@ SRC_URI[sha256sum] = "583f28869b82aec57768d7d18cd7ff81bf092ecbbc1209b587c2c2cd68
 
 S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
 
+EXTRA_OECONF += "--without-libva"
+
 TARGET_LDFLAGS += "-lgcrypt"
-- 
2.10.2


