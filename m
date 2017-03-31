Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD0DD77E98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o123so18543533pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zcj1dCc4sKIgHmE/DtBiStdmudFBnDIUNNm8hLZH+V0=;
	b=ob85bCBjKuxJToL5RTrnfXOSawv7lKmcgvA0BE8cq2TsNe4s+DulZX3aMBekutJVnH
	GhRL14ENbZF0+pYBSkXy8U+PCbl9A6ohhQY2hlIy7eufHqhBH5VCGiiGSo+2CVA7VCSH
	LM9D836UDl2UMDUjjxZSfLi+vYQ64JVxau8j6RKxR8WjeQI1h13ssZcMVIJ0P0EjTTvG
	NhAFPLIm5A8J+h45GEKlJYNFme+VHRkGYu1b8bEbCQGCKkqKMn8ib20MP0rNXSHPp/Ld
	hNuuhklG65cSnTALAvWUBuSiYEDDNSUQYGjSwAKBP8u/ZkZB6Rc4oX13HtI3lGegZmVM
	rQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zcj1dCc4sKIgHmE/DtBiStdmudFBnDIUNNm8hLZH+V0=;
	b=jn8Ac22d9pAVwjfhNT3A7dfYqRA1jpbHiXPiG8liFK9f+7lRLFOyrr3L0YHQhSgla5
	tC6G3hd325crDxgKKshNlXzRwacNv++qhqfZh7sU3ryGLw09ryb9jI9oEFPuWXmERsFw
	QbsQNpM3Vc+EpfXEXPlWFI6o6z82Z124NYETEpHgme3Qsjy3GYPPwAn4MUI1kwamL38G
	7qimAiMj03bt9frPTEV8wpQmtHyqZ5J6IEZ1FwWIGpNwyHLQZjmoeEp06fLQ4I6L36lI
	Cy3byrsj0OyY1zfOU0nlXAy1tWbyB20C+vOW8CGwl79s8g5y/LOXX7ochdPMx/Xq4TRY
	x7UQ==
X-Gm-Message-State: AFeK/H024R7mmbSmolmc4Lk0iw+7Yem209yFeEKoP1nDV3oegyBU611WtEeWTkKMA2FruA==
X-Received: by 10.98.208.65 with SMTP id p62mr3652477pfg.239.1490978622180;
	Fri, 31 Mar 2017 09:43:42 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:36 -0700
Message-Id: <20170331164247.5052-32-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 32/43] daq: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:41 -0000

unistd.h is not in sys/ on all platforms
use standard location in /usr/include to look for it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/daq/daq_2.0.6.bb          |  4 ++-
 .../0001-correct-the-location-of-unistd.h.patch    | 29 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index 952d7a42d..47cb163e6 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -9,7 +9,9 @@ PARALLEL_MAKE = ""
 DEPENDS = "libpcap libpcre libdnet"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
-            file://disable-run-test-program-while-cross-compiling.patch "
+           file://disable-run-test-program-while-cross-compiling.patch \
+           file://0001-correct-the-location-of-unistd.h.patch \
+           "
 
 # these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
 # this error from test-dependencies script:
diff --git a/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch b/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
new file mode 100644
index 000000000..4798a77f5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
@@ -0,0 +1,29 @@
+From 10e7d4e4bfcb70344d18f0d4ce36068475747f25 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 15:59:43 -0700
+Subject: [PATCH] correct the location of unistd.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ os-daq-modules/daq_ipfw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os-daq-modules/daq_ipfw.c b/os-daq-modules/daq_ipfw.c
+index 016beb0..c2a4175 100644
+--- a/os-daq-modules/daq_ipfw.c
++++ b/os-daq-modules/daq_ipfw.c
+@@ -23,10 +23,10 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
++#include <unistd.h>
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
+ 
+ #include <netinet/in.h>
+ #include <sys/socket.h>
+-- 
+2.12.1
+
-- 
2.12.1


