Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 60501719B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 05:42:19 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so12506124pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Nov 2016 22:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mLa3/PgZWlE6xv2WoAjL236GeD1WWf2H2zE6f6hECes=;
	b=t49p04IE6mjpwtCLXYom47H5wS3Put5BI0xyiAlweLzhYNE1NQ7nHXXKYS1ZGWEzvP
	gRuxaWrG2jjEMOIHdfXcmyyHDXJVyOHzGl1FcgwvblpyV3oOxJ47iuU7lnIQyCv3I9HX
	axPEn/dtJu1LnuuBwunxLZMIoW9rwrzc3zsF+Xkd0YhzTiE8IaBaqNNmj/Ic2hKgXl+7
	AhcOREy5YCPdWrTJWQ4EFNDx1ym54LuODQAWiCIcUIFO/LqBnRmuwSdD1Wy/nwLAEob8
	hKKMcliJijjUkhsOmCmd0rSs0xTF4dGvK3Ty1I349w3LL9I6yGlT4Cz8c5D8hg3Hz+PH
	0b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mLa3/PgZWlE6xv2WoAjL236GeD1WWf2H2zE6f6hECes=;
	b=QQMY1iOPjYILaT3e8WbxLpvW2L2Ne6/JaYMSFmelBoXVYphz1+WTmGCE8ruBsMmUTP
	AafGi6akOLlbZcG6NBbgMEO5LQaZsuTpGXX4x6MVsyE5iq/mgFOGOYI1Lyuay2J2m4fl
	GpNtsdY3d0B4xxxJsCbrVvY31H0HhBtjfzsoYabtvTaU7l+qTteZl+Ta0FGRY4EFes4P
	Aid//Gn6ZH4vqWTT8UU4knSSHBNmPpsC+uD5JRWcvmkeYUY+NXKKDoppOWBp55apQIc+
	2pYYZSADFX4JzeqYa+Z8kmMPe0KoiUwH+jTeLxmp/d5eB431JKMKrbeGZ5Q9O58fSltZ
	QteA==
X-Gm-Message-State: ABUngvcRhbgz38fvdOjizMMgbVN37ALTrRCtNdx5O82nIGN3vH01ziL9b2+ByD6LS7Pyag==
X-Received: by 10.98.74.18 with SMTP id x18mr2190567pfa.58.1478410940951;
	Sat, 05 Nov 2016 22:42:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	j68sm30869664pfk.95.2016.11.05.22.42.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Nov 2016 22:42:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Nov 2016 22:42:14 -0700
Message-Id: <20161106054214.16950-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH V2 3/7] libplist: Remove rpaths surgically
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
X-List-Received-Date: Sun, 06 Nov 2016 05:42:22 -0000

Check for files first before operating on it

Fixes QA errors like below

  /usr/lib/python2.7/site-packages/plist/__init__.py
  /usr/lib/python2.7/site-packages/plist/_plist.so
  /usr/lib/python2.7/site-packages/plist/plist.py
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libplist: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes V1->V2
- Check for _plist.so before chrpathing it

 meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
index 10d40fb..f789796 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
@@ -16,8 +16,16 @@ SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
 SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
 
-PACKAGES =+ "${PN}-utils ${PN}++"
+do_install_append () {
+    if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
+        chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
+    fi
+}
+
+PACKAGES =+ "${PN}-utils ${PN}++ ${PN}-python"
 FILES_${PN} = "${libdir}/libplist${SOLIBS}"
 FILES_${PN}++ = "${libdir}/libplist++${SOLIBS}"
 FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-python = "${libdir}/python*/site-packages/*"
+
 
-- 
2.10.2


