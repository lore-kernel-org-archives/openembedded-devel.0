Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A2D0B78372
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:22:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j186so10554714pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DByymthtvthqDS5Qs7cFtJ+qhviif1+GSeNdl8HDJvA=;
	b=PegNzir3kwpzBGIDUjv9I5t1/a6u00xIK75vM3CtiEmA1Xa6bGr67ueKOFMRsaUl/w
	BUV/vywG99j2tBCWScNK4Qw6zlS2vU58k6kbqMZsWJmrH2CJhb7E9vRWL1Z9gdtaDsRO
	I1vfhjwSHHUNx61pzLWel8q7/Hp8lveQcEASA/QfS9zUKd6/sXj9sHtiP3kRzngtju9O
	Ffh1aThvJKX3FH/SdZ5xp/AuXOssDrWNfe/o/E0Fr/3quiM2o4EUPa4CzrNP6ZU2rFx2
	vYI1QejoL6m2g97a4ZaDBrFEHy1ZTpRmCbwxcXFrDiJ+0n3w6qXwS6P13VPmybPV5jBa
	iVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DByymthtvthqDS5Qs7cFtJ+qhviif1+GSeNdl8HDJvA=;
	b=jHjmxNpUyu1xKaSMgzce1i8mq+469g/6uyzbfBWf9n+sq8R3PH7wHDA3+4jRcp2LEj
	gtCBjiCafswz2cOxn29a6ckUir90VLoV7Otro5VXz6dp2nyfuKV78zh5f9WhEWFqd+Oq
	UyhdRio93ZbBGqss76eXyCkPRHeoARkcl7dMUe4JeK2TH3mV/whH6PZT3/WVx9LpzmOa
	i9ORzq6tyy5tZSYhqIbo4U4ptlaVCuS2CO6pkB57vd5fM7JWix2UU7i+uBBV1cbNhT3o
	7YeyZ3Fos12HCPzXdxDrwP5VrGsvuUIZK3zXCTxoL7T7wy+t5QbImuVH2tJfjt+ysuLs
	e/uQ==
X-Gm-Message-State: AKS2vOwq3zG5+r/qJWZrAKhwx/nphU3ngEIRkDCOIBx3AEv07hJIBi3x
	eyakK1CGcszEtyk6
X-Received: by 10.84.137.129 with SMTP id 1mr19676856pln.37.1497720122694;
	Sat, 17 Jun 2017 10:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.22.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:22:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:41 -0700
Message-Id: <20170617172142.1311-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 8/9] relayd: Fix build with hardening flags and glibc
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
X-List-Received-Date: Sat, 17 Jun 2017 17:22:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-rtnl_flush-Error-on-failed-write.patch    | 34 ++++++++++++++++++++++
 .../recipes-connectivity/relayd/relayd_git.bb      |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch

diff --git a/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch b/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
new file mode 100644
index 000000000..eaaf30460
--- /dev/null
+++ b/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
@@ -0,0 +1,34 @@
+From 2fa326b26dc479942367dc4283e2f87372403988 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 09:32:04 -0700
+Subject: [PATCH] rtnl_flush: Error on failed write()
+
+Fixes
+route.c:45:2: error: ignoring return value of 'write', declared with attribute warn_unused_result [-Werror=unused-result]
+|   write(fd, "-1", 2);
+|   ^~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ route.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/route.c b/route.c
+index c552d1f..fc5c31e 100644
+--- a/route.c
++++ b/route.c
+@@ -42,7 +42,8 @@ static void rtnl_flush(void)
+ 	if (fd < 0)
+ 		return;
+ 
+-	write(fd, "-1", 2);
++	if (write(fd, "-1", 2) < 0 )
++		perror("write");
+ 	close(fd);
+ }
+ 
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index ef28d2c42..98dc41a09 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab
 
 DEPENDS = "libubox"
 
-SRC_URI = "git://git.openwrt.org/project/relayd.git"
+SRC_URI = "git://git.openwrt.org/project/relayd.git \
+           file://0001-rtnl_flush-Error-on-failed-write.patch \
+"
 
 SRCREV = "ad0b25ad74345d367c62311e14b279f5ccb8ef13"
 PV = "0.0.1+git${SRCPV}"
-- 
2.13.1


