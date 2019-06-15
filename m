Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B621A605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a186so3334347pfa.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bi3vORrScoWI2LXYof30FL04KSL4NhLYemC4AGwSoug=;
	b=jrGPUtzbx9w5lEugci2h4Kk+8vTps7vEBRpPnKMt46gpwX6tBCh25+BLqRis9f/sfy
	/C4fN9GW0LQ6GKusVFY4CQxR5lY7f6TZnjN2+H0YeQO0/2DMXUkKJPwhRMMa+MXVMqRk
	wLwLu5i6V64xJVKht5JHStt6XhJ6GBM/+OtXyLMKfdTVIXGa164Qthd2Rwc478Fxsniy
	Pv8gpEXBwdsxLzfaPxKh1tfLxha8TnuM0E0inH+D0UQCCfOfd2nmzkVgn7+OW2050Dfx
	9fi49WZOD0hYMrtCiqoDyGha8mvtEHS3KkZ8OatjKdw3k63dqmlVl8F0KGYmnElMMv4K
	TjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bi3vORrScoWI2LXYof30FL04KSL4NhLYemC4AGwSoug=;
	b=CDSw72+fZUPdKZnojQCwaV2RHO+Ajb5gJGcsqoQtlL4JiJ6g6SIfmPvJe5Jnm28Sle
	T8ZXC9HHt9lTZQBPyRaePYfKSNtsxWJmPk8/PAePkvxWrBFAB6WWfJ77u+u8DenfjxId
	437GHtRNm4nodwLxa9OMgCB8BX1tV7RRlmKGAY/FtnpqXnZ0aJ9lx+/VNs1lQQHcSg5C
	OpdEzcKdCV9iJfDE8jwxGVmX8LzqDP0kyZEMREQPpiK25HLqnrR7NiOZ8FOSFB0D5+k5
	EUK9I/hxHiNCDRoNj6PVLQLW2BsTCW3R3Jx0jUWAQGn/nbFYqewm12beeq4IiHDZ4Tun
	+BbQ==
X-Gm-Message-State: APjAAAWkLllk0ZgRZIVKtj6xNjCrFuoXqlWZ+N+r2NbQEy7rE7mGW8Ul
	T4fYH4sLnXFdtSeEq4UgjwClrdnt
X-Google-Smtp-Source: APXvYqySkmRiK5vpdOBgjI20sdyZNBFqb0goTznfTsm2nfOvFbsWIdEuHvnWTKXw+7Bppz4iv8Hk7A==
X-Received: by 2002:a17:90a:32ed:: with SMTP id
	l100mr17170012pjb.11.1560621460695; 
	Sat, 15 Jun 2019 10:57:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:13 -0700
Message-Id: <b5276e52e10bb87ba38872f0bd0cf9b9214fc8bf.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 09/23] igmpproxy: remove 0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch and _GNU_SOURCE
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:39 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...xy.h-Include-sys-types.h-for-u_short-u_in.patch | 25 ----------------------
 .../recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb   |  6 +-----
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch b/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
deleted file mode 100644
index 82cdc36..0000000
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
index c99ebe0..db96d48 100644
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
2.7.4


