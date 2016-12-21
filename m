Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 671D771BE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:03:13 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b1so14973826pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7CZarxtrE0Z01cdb3yrHpGWqoPqrc/13j+7rcGjyHOg=;
	b=fbroo8CqKC1aYaFOg0OT22DER/mmhWYtGOhIYftN0cOskpi3iIeY5D0VOEv7HGncL/
	dy8bf65e6lDwOZksBpOa6KhyWJrJgdJeBs9vD9aqvR49b9PXquunte//6iPPimhaDjRP
	ZXiT2urXLD4K3+ENAK0TSDK9Wtosb6pw/BD/On+Io12XR+WtS69k6HF50E6GQQt5RZnt
	BwEWhGkcUs3t5CX6VFze70nB27s0aNmIjHmR47VuWi0G74SCwCtYa2fXVp5omoQ5KW//
	FP5gno7uk+k8dkDDtJTBDPyWAwqwP5S0WhajTHsSr7HxZ4vqXd74BFu7AHPiH91MumHP
	UGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7CZarxtrE0Z01cdb3yrHpGWqoPqrc/13j+7rcGjyHOg=;
	b=q69DSM2bj7nOVHryYscR9SqPOhmZmIgqb7tzr8M85yS/v51qCh+WAwOzmnH0ebbHc2
	wXKdMvP5JDnbcqPzBgmg8Z8Awi4pvSpEcFtN4yTWHeP8PyZt35XLHBigYHv1U8rB+rh5
	NWMdq3XLYQkndYzQqaToLEnJjcnBNywOP9YjOeGa18QSNgxkEt2bE9SaFS8MyTPa/EA0
	GcttLFam9er+3QnEIxSzb6LMX7YZnTtUvxBHwIb0hS6k1ChUcAjaJOi+uFY/9uvfaBkq
	m0Jem9OA+R18XO/zEzKcikn+/GmwjHstuSuN0nrWosWgOQBaPlCV0XK5aKRKpmjI8u1x
	cc+g==
X-Gm-Message-State: AIkVDXL6gJCsEl8NPv7zGJ4mxx8HrYTturSIUIyHTiXOvRkmwH/U+5V+Qd9A6BBS0nXvIw==
X-Received: by 10.99.1.132 with SMTP id 126mr4953376pgb.129.1482300195136;
	Tue, 20 Dec 2016 22:03:15 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s197sm43526435pgc.38.2016.12.20.22.03.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 22:03:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2016 22:03:06 -0800
Message-Id: <20161221060306.19798-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161221060306.19798-1-raj.khem@gmail.com>
References: <20161221060306.19798-1-raj.khem@gmail.com>
Subject: [meta-networking[PATCH V2 2/3] usrsctp: Add recipe
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
X-List-Received-Date: Wed, 21 Dec 2016 06:03:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-foreign-switch-for-automake.patch     | 28 ++++++++++++++++++++++
 .../recipes-protocols/usrsctp/usrsctp_git.bb       | 26 ++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch
 create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch b/meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch
new file mode 100644
index 000000000..b932ebbb4
--- /dev/null
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp/0001-Use-foreign-switch-for-automake.patch
@@ -0,0 +1,28 @@
+From 748bc693cf24baf42e459e12f152349e392b6737 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Dec 2016 21:32:11 -0800
+Subject: [PATCH] Use foreign switch for automake
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 64cc9994..19ccd4a3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,7 +29,7 @@ dnl SUCH DAMAGE.
+ dnl
+ 
+ AC_INIT([libusrsctp], [0.9.3.0])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AC_PROG_CC
+ AC_PROG_LIBTOOL
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
new file mode 100644
index 000000000..99a261ec7
--- /dev/null
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X and Windows."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
+
+SRCREV = "dbfc1b8c4cf1a46a4d8987ba542d5ff06bdaf14c"
+SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
+           file://0001-Use-foreign-switch-for-automake.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS += "openssl"
+
+CFLAGS  += "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
+LDFLAGS += "-lssl -lcrypto"
+
+PACKAGECONFIG ?= "disablewarnings"
+PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
+
+EXTRA_OECONF += "--disable-inet \
+                 --disable-inet6 \
+                 --disable-shared \
+                 --disable-debug \
+               "
-- 
2.11.0


