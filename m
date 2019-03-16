Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0B37C607A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 17:23:05 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id n18so8621670ljg.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=deonSZxV1QUiGwIwLr9oW7KAsEduIfhvYBbNXu07QIs=;
	b=aMoblrILo5QkUJ+2/wn32UXeHGHifA5/zqOS3g7/EN+T9iXG58ojIriM9J8r13sqtU
	+n/ksZyDnpdiyBCZUHRvUKFdAULLwNsjMIUz+E2r31dH46wOay7JNZQUPbCr+FjKfZ6t
	AXFbSum0/0RaOEBVObIywTZVG+8juPoWl9iisayIim0O2Hau39hWTPeNzIGTIJ+5FMoU
	CHhsc5FGLg5nOZcDs++c1DzcBxU+4LX2+EzcPRRZ+nKGYz40DB/UMS1r3JWTVCKwc2YM
	KnE0ImsSeeMfUU6S/cJCvx95Mo+xXb2yidkct6m8Um5kWqeg3ON4EBZLymNpTKMewpUa
	oWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=deonSZxV1QUiGwIwLr9oW7KAsEduIfhvYBbNXu07QIs=;
	b=lzfj0xVAVvNJYsUGthCxiX3GluZq7qBPdmIN0GYva1QK4TwjbbdAqbiX/2u9M+Iux6
	X/dd9AN6DRnj8NC7oixKvmhztYyHtVZ+ESXE2c0jd26U8q1ZiNWjZoOYoJrvMAT2dOxi
	X7zDhSadTU41YhY9yBa+ILZZl2YlIjMXFrmdevqmfZaJAionLC5tIgukMdtJ/EFdl9ja
	XbQEZWrW5PHG4wZ7Oy+iXdeZ0+PB7k4VA6kB3ZOZjiEumM05xw8JKnXT0qbtiWRIIyNN
	ghieWdpYVt3s/FndSX0bs5RIAloyQaYbwR/WlLs88G++DgB79iMsiJIBiFzQ7X9m8YIx
	6ekw==
X-Gm-Message-State: APjAAAXYpxLzx3/RoKDFLdOEFBkd/EMcUWpqg6pUuf0R0DtdHVKDvmfn
	Ffs8DEUWJY2SJuELEIM+lzJUYnSJ8Q4=
X-Google-Smtp-Source: APXvYqwMxdfE+ArQHF/PM674InemM3em9E4MbI/GBnWitinRYeEhIeBaC3jUUXITcOdNR+9uZ5iwXA==
X-Received: by 2002:a2e:8844:: with SMTP id z4mr5523210ljj.187.1552756986216; 
	Sat, 16 Mar 2019 10:23:06 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a29sm1063685lfi.19.2019.03.16.10.23.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 10:23:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 18:22:59 +0100
Message-Id: <20190316172259.10822-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] igmpproxy: update to 0.2.1
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
X-List-Received-Date: Sat, 16 Mar 2019 17:23:06 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-daemons/igmpproxy/igmpproxy_0.1.bb   | 16 ----------------
 .../recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 16 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
 create mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
deleted file mode 100644
index 5424dc455..000000000
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "simple dynamic multicast routing daemon that only uses IGMP signalling"
-HOMEPAGE = "http://sourceforge.net/projects/igmpproxy/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1e995e2799bb0d27d63069b97f805420"
-
-SRC_URI = "http://sourceforge.net/projects/igmpproxy/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-           file://0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch \
-           "
-
-SRC_URI[md5sum] = "c56f41ec195bc1fe016369bf74efc5a1"
-SRC_URI[sha256sum] = "ee18ff3d8c3ae3a29dccb7e5eedf332337330020168bd95a11cece8d7d7ee6ae"
-
-inherit autotools pkgconfig
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
new file mode 100644
index 000000000..c99ebe0e9
--- /dev/null
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "simple dynamic multicast routing daemon that only uses IGMP signalling"
+HOMEPAGE = "http://sourceforge.net/projects/igmpproxy/"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=432040ff3a55670c1dec0c32b209ad69"
+
+SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/igmpproxy-${PV}.tar.gz \
+           file://0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch \
+"
+SRC_URI[md5sum] = "3a9c2cb42c1f5ee0cb769a4884545641"
+SRC_URI[sha256sum] = "d351e623037390f575c1203d9cbb7ba33a8bdef85a3c5e1d2901c5a2a38449a1"
+
+inherit autotools pkgconfig
+
+CFLAGS += "-D_GNU_SOURCE"
-- 
2.17.1


