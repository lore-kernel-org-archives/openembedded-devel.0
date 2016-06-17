Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8D9E75D22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:09:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a186so12921178qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 11:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tVQhCg3+HHZZ4sNypGL7sEsxbsKWkSxL/CoagtVw/EM=;
	b=NCoE/0VIwHskHeBRrhzzP42I2rf1phBqIVbAXNwXHeQkzejEnmonfsS2PslMlYE0Av
	2isOy0Lfc3NpLttsrcmkVW8RMfPSGtvg4bdqVacy+aOmmTPTvVVE0y8lZNoe9+8D0pFZ
	0XFSclqoaj5fzv8JjxL3zzS5HD/tRcFUQffOkGrnvKBRWH9oJgmR0W9tivHmj51s835M
	iHuHxoc7uKSLJiXfjV5ZmkTvsFPnnZ4fXc95cY8IDVqDqIChzP3B/wfbtGa0eRqD6oz6
	HbcXYif8/f3UiiTOUav/vCseH6p8Ff2E1O6TGnIlMqpXExcfxTPq1Ke2oZtPRU8PyPXx
	/LCA==
X-Gm-Message-State: ALyK8tJeZgLrsWq8vFAaVd0FNkHqf1AZ7+ab5mKqtQVKlsVR0KBZ1a5LtRBUG0cReMNPsw==
X-Received: by 10.237.44.165 with SMTP id g34mr3939956qtd.17.1466186942275;
	Fri, 17 Jun 2016 11:09:02 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id
	y190sm13427136qke.23.2016.06.17.11.09.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 11:09:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 14:08:47 -0400
Message-Id: <1466186927-18355-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-multimedia][PATCH] faac: address gcc-6 narrowing errors via an explicit cast
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
X-List-Received-Date: Fri, 17 Jun 2016 18:09:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-multimedia/faac/faac_1.28.bb           |  7 ++--
 .../files/address-gcc-6-narrowing-errors.patch     | 47 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
index e87ddb1..2f048af 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
-           file://build-fix.patch"
+           file://build-fix.patch \
+           file://address-gcc-6-narrowing-errors.patch \
+"
 
 SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
 SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
@@ -18,6 +20,3 @@ FILES_${PN} = " ${bindir}/faac "
 FILES_lib${PN} = " ${libdir}/libfaac.so.*"
 FILES_lib${PN}-dev = "${includedir}/faac.h ${includedir}/faaccfg.h ${libdir}/libfaac.so ${libdir}/libfaac.la"
 FILES_lib${PN}-staticdev = "${libdir}/libfaac.a"
-
-# http://errors.yoctoproject.org/Errors/Details/68660/
-PNBLACKLIST[faac] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch b/meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch
new file mode 100644
index 0000000..92fdd9b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch
@@ -0,0 +1,47 @@
+--- faac-1.28/common/mp4v2/atom_standard.cpp.orig	2016-06-16 07:59:21.657040761 -0400
++++ faac-1.28/common/mp4v2/atom_standard.cpp	2016-06-16 08:01:50.613036724 -0400
+@@ -22,15 +22,15 @@
+ #include "mp4common.h"
+ #include "atoms.h"
+ 
+-static const char name[5]={0251,'n', 'a', 'm', '\0'};
+-static const char art[5]={0251,'A', 'R', 'T', '\0'};
+-static const char wrt[5]={0251,'w', 'r', 't', '\0'};
+-static const char alb[5]={0251,'a', 'l', 'b', '\0'};
+-static const char day[5]={0251,'d', 'a', 'y', '\0'};
+-static const char too[5]={0251,'t', 'o', 'o', '\0'};
+-static const char cmt[5]={0251,'c', 'm', 't', '\0'};
+-static const char gen[5]={0251,'g', 'e', 'n', '\0'};
+-static const char grp[5]={0251,'g', 'r', 'p', '\0'};
++static const char name[5]={(char)0251,'n', 'a', 'm', '\0'};
++static const char art[5]={(char)0251,'A', 'R', 'T', '\0'};
++static const char wrt[5]={(char)0251,'w', 'r', 't', '\0'};
++static const char alb[5]={(char)0251,'a', 'l', 'b', '\0'};
++static const char day[5]={(char)0251,'d', 'a', 'y', '\0'};
++static const char too[5]={(char)0251,'t', 'o', 'o', '\0'};
++static const char cmt[5]={(char)0251,'c', 'm', 't', '\0'};
++static const char gen[5]={(char)0251,'g', 'e', 'n', '\0'};
++static const char grp[5]={(char)0251,'g', 'r', 'p', '\0'};
+ 
+ MP4StandardAtom::MP4StandardAtom (const char *type) : MP4Atom(type)
+ {
+--- faac-1.28/common/mp4v2/mp4atom.cpp.orig	2016-06-16 08:03:07.777034633 -0400
++++ faac-1.28/common/mp4v2/mp4atom.cpp	2016-06-16 08:03:54.629033363 -0400
+@@ -264,11 +264,11 @@
+       }
+       break;
+     case 0251:
+-      static const char name[5]={0251,'n', 'a', 'm', '\0'};
+-      static const char cmt[5]={0251,'c', 'm', 't', '\0'};
+-      static const char cpy[5]={0251,'c', 'p', 'y', '\0'};
+-      static const char des[5]={0251,'d', 'e', 's','\0'};
+-      static const char prd[5]={0251, 'p', 'r', 'd', '\0'};
++      static const char name[5]={(char)0251,'n', 'a', 'm', '\0'};
++      static const char cmt[5]={(char)0251,'c', 'm', 't', '\0'};
++      static const char cpy[5]={(char)0251,'c', 'p', 'y', '\0'};
++      static const char des[5]={(char)0251,'d', 'e', 's','\0'};
++      static const char prd[5]={(char)0251, 'p', 'r', 'd', '\0'};
+       if (ATOMID(type) == ATOMID(name) ||
+ 	  ATOMID(type) == ATOMID(cmt) ||
+ 	  ATOMID(type) == ATOMID(cpy) ||
+
-- 
1.9.1


