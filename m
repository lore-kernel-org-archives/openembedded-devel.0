Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA2471C30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r16so1418092pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vHiUmawCBOuFYH6aaNJPZvEGJkDUrGIas9dnOwtZeRk=;
	b=VzVXaTRrCLX7JDXjz1BuCPS5+WBX3gZGzj0nC75DBZS6gbFc6+hIOP9uh8ZAS2PAAl
	Sa9PMVcaYDJJYOSl/93VOG1dHlwlGN3ZUvdrWei2EasCr4GoDQdk0T+jeqLtul3AgGLO
	ffBQM5XIaPd23OODhiRzurYj8bHTxVnc5eCS0mgdZaEjQbWruIcZnG9lUaSadrO4Djgz
	LtuFRnIUS7kuCo31NBBue0nY0OkzO4xRR1n3NE5ogOD0PrhtnSJv5jOkWXSkjCAbeRCa
	6ZT4k6hZ8rXi675eyNBhndOVfeRs9dEiQ+YPnqLSDT9Bf1PyZlXYWY6P4P1DL7Slzkpd
	esEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vHiUmawCBOuFYH6aaNJPZvEGJkDUrGIas9dnOwtZeRk=;
	b=ZF+6OPNbEIW+RSnDSENO96oqH658keFbUj+K09t/kW4yKWmUefB0mWJ1p5nVW7I0XQ
	T62Lm8xVpL9/vgA/y2icmtHbWzqB1TUxSJ/0qTn9IgHv5RiUmpmQy5Cf1ilFj0uLZTX6
	zdqoMAqZ77sm8fLuza6WAyYGLenv92IiQd7SedxUuvU+4D3Emvq74e4vu9z7d5FiOANk
	irDzckhEI/UTe2prewWoSHYQXV9lrjNi/EJg/ELoWDVbt7PP5aaV4s8BdMURSTjzOUsB
	4BX5dMlejtuYS5od0oV7R0tqsY4sDqY0JaSKJJrSXMPh8ULVFG9SCnB6a+fn2/g0PP1j
	aIiw==
X-Gm-Message-State: AA6/9RklEAdETCaCVY+vE4R/xd/aT6hUiwnnSZUx9pRmthPi08P7pLg83wHlhLCJHTOJfA==
X-Received: by 10.98.196.17 with SMTP id y17mr7760811pff.172.1476855525865;
	Tue, 18 Oct 2016 22:38:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:23 -0700
Message-Id: <20161019053834.11523-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/16] frame: Fix build with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../frame/pessimizing-move.patch                   | 27 ++++++++++++++++++++++
 .../canonical-multitouch/frame_2.5.0.bb            |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/frame/pessimizing-move.patch

diff --git a/meta-oe/recipes-support/canonical-multitouch/frame/pessimizing-move.patch b/meta-oe/recipes-support/canonical-multitouch/frame/pessimizing-move.patch
new file mode 100644
index 0000000..aa5a56a
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/frame/pessimizing-move.patch
@@ -0,0 +1,27 @@
+let compiler decide on copy elision
+Fixes compiler errors with clang
+| ../../frame-2.5.0/src/x11/device_x11.cpp:126:13: error: moving a temporary object prevents copy elision [-Werror,-Wpessimizing-move]
+|             std::move(UniqueUFAxis(static_cast<oif::frame::UFAxis*>(axis)));
+|             ^
+| ../../frame-2.5.0/src/x11/device_x11.cpp:126:13: note: remove std::move call here
+|             std::move(UniqueUFAxis(static_cast<oif::frame::UFAxis*>(axis)));
+|             ^~~~~~~~~~                                                    ~
+| 1 error generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: frame-2.5.0/src/x11/device_x11.cpp
+===================================================================
+--- frame-2.5.0.orig/src/x11/device_x11.cpp
++++ frame-2.5.0/src/x11/device_x11.cpp
+@@ -122,8 +122,7 @@ UFDeviceX11::UFDeviceX11(Display* displa
+         UFAxis_* axis = new UFAxis(type, valuator_info->min, valuator_info->max,
+                                    valuator_info->resolution);
+ 
+-        axes_[type] =
+-            std::move(UniqueUFAxis(static_cast<oif::frame::UFAxis*>(axis)));
++        axes_[type] = UniqueUFAxis(static_cast<oif::frame::UFAxis*>(axis));
+ 
+         axis_map_[valuator_info->number] = type;
+ 
diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index ecc9524..0ad10a4 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = " \
 
 inherit autotools pkgconfig
 
-SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.gz \
+           file://pessimizing-move.patch"
 SRC_URI[md5sum] = "02baa941091c5d198cd1623b3ad36e68"
 SRC_URI[sha256sum] = "cfb9ab52cdccd926f1822a457264d0014c7eb9f4600a72626063dd073b26256f"
 
-- 
2.10.0


