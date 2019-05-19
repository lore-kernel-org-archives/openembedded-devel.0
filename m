Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2CB7DADF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 15:06:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so11597229wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PaKLBeKTWRhvOJIn9mWc8uI/Ext5YeWZFsqiNRg1EKg=;
	b=JNN7Gw0PzP1/opQOVpxhaYM53qGDzYkzwh3+cBoPvBnaGttNqNK/fdyxMfBnz+RAtU
	DgZFyZrXU2z/4ry+i/Wpbv+FQ6vQRatcR7WgnMZJ4qpI92i2EFcxRHLfyUjYIN5fJ2RF
	K0nGeDEvinVZImYvjFmS++zeIA+2MA8dsmBwNdEbtBGk8LH0X07a5H7q30lDkErqhSio
	vY9Id9A9wpdsRv5p2ibCyXUas7eeM0rzdK4SXUGHaqd6QOTPa3FeX2HCvU0Pr5CzT+Jr
	HEOd3WvmRtMxjg0S7OJOamQNXV56Dbd37TSXEZSH+8ZaEJW6yYRJE4jzLXzXwT88o2E3
	DROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PaKLBeKTWRhvOJIn9mWc8uI/Ext5YeWZFsqiNRg1EKg=;
	b=HXAm5aD5V0hTmzMfj6MH0u7SBLGKpzgfkAcCvmLgH2EhiKbwbad+c4GANtWZS0Ns7U
	mARYJhsbSSrw1bcJVMf8aGRfnbJtMstnNrCKEDUNkoYhed//XYnmlaE9myqUppQ2xnF+
	2jh0YJlAWmp1ZWv0RPpO07WP/kmutLRGjqXv4ur1CBfesV/KxSpoQjohYi9JWO87XEp7
	tpW8PQyfS+RC3KAXmSYQU504pTePDQToJuPO95Ks8Rh/FHVBp6SCZ/vVPR56JTwnf45X
	sfpyOh6fG0EsYk+P1CP7AcpgfgMep8FMGVahFZmABWVvHTdhvWDmRvPjQm7YkMx91b1s
	AH5g==
X-Gm-Message-State: APjAAAVSPhgge1K3zeVTxAg9U97RaVmTF7wgOONkZ7BBxZbftAMQ9B7c
	lubqrd+Sw9VDGMlCo5SEyS+Ve0VJ
X-Google-Smtp-Source: APXvYqy6HxhzxfI2BGoYrKPiOsWyKvZzWYBdU15xMtpn4ORmium7B38DIZpnvLzRftOK8p4hfq9lzQ==
X-Received: by 2002:a5d:6145:: with SMTP id y5mr31598994wrt.96.1558278368626; 
	Sun, 19 May 2019 08:06:08 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t194sm2134890wmt.3.2019.05.19.08.06.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 May 2019 08:06:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2019 15:06:11 +0000
Message-Id: <20190519150611.1346-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] igmpproxy: remove 0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch and _GNU_SOURCE
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
X-List-Received-Date: Sun, 19 May 2019 15:06:08 -0000

* it was upgraded to 0.2.1 in:
  commit 50979151e69e5707580b2f3d263a9b36b6a190d5
  Author: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
  Date:   Sat Mar 16 18:22:59 2019 +0100

    igmpproxy: update to 0.2.1

* which includes _GNU_SOURCE:
  https://github.com/pali/igmpproxy/commit/7d790aa2f16afad63418e573db13ea39d76ed141
* and includes sys/types.h in os-linux.h:
  https://github.com/pali/igmpproxy/commit/6f92242b23178e979f4a806abe4ac9652b51c593
* and the patch doesn't apply cleanly:
  ERROR: Fuzz detected:

  checking file src/igmpproxy.h
  Hunk #1 succeeded at 51 with fuzz 2 (offset 5 lines).

  patching file src/igmpproxy.h
  Hunk #1 succeeded at 51 with fuzz 2 (offset 5 lines).

  The context lines in the patches can be updated with devtool:

      devtool modify lib32-igmpproxy
      devtool finish --force-patch-refresh lib32-igmpproxy <layer_path>

  Don't forget to review changes done by devtool!

  ERROR: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Include-sys-types.h-for-u_short-u_in.patch | 25 -------------------
 .../igmpproxy/igmpproxy_0.2.1.bb              |  6 +----
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch b/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
deleted file mode 100644
index 82cdc36ac4..0000000000
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a557651a08e21e3c7c7f5eca9f5405f86624903f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 22:42:51 -0700
-Subject: [PATCH] src/igmpproxy.h: Include sys/types.h for u_short/u_init
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/igmpproxy.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/igmpproxy.h b/src/igmpproxy.h
-index 4dabd1c..4454729 100644
---- a/src/igmpproxy.h
-+++ b/src/igmpproxy.h
-@@ -46,6 +46,7 @@
- #include <stdbool.h>
- 
- #include <sys/socket.h>
-+#include <sys/types.h>
- #include <sys/un.h>
- #include <sys/time.h>
- #include <sys/ioctl.h>
--- 
-2.13.3
-
diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
index c99ebe0e9c..db96d487bf 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
@@ -4,12 +4,8 @@ HOMEPAGE = "http://sourceforge.net/projects/igmpproxy/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=432040ff3a55670c1dec0c32b209ad69"
 
-SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/igmpproxy-${PV}.tar.gz \
-           file://0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch \
-"
+SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "3a9c2cb42c1f5ee0cb769a4884545641"
 SRC_URI[sha256sum] = "d351e623037390f575c1203d9cbb7ba33a8bdef85a3c5e1d2901c5a2a38449a1"
 
 inherit autotools pkgconfig
-
-CFLAGS += "-D_GNU_SOURCE"
-- 
2.17.1


