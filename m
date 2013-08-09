Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C2A6E6B5CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:59 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1965617eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bLx87fmv3/GPEoIGjOPT8rZ30NAtPjQunAEMU5w/qbQ=;
	b=WdEBoOpnK43otZBZ4FTfzALfoJtN3mJm+fPPA3T1f3LXubdT6wcmOYy8rAtpSzwMgs
	Aal8LfrVu7J6LDXl7l3YwUUdp4YNHb96W9annLRqQKwLqZO0jxXVE1WXpStZZ/z8nfHm
	1eoxGTaROgrzCRUPxq7AkO14X/Lk9RhfYw6aQv7TvMOE0y94PXmshI+Yg1GsMD7iDJQf
	RpStQQrYXsACYOxfmj0sphpL9nfYW+7+UATfilNhZBss4JMxGjbddtmgX/jB3L3zScU1
	EgNHZv19bOQkGs4uZkmYjd+a20qwbh2TDT2DsXzbB7PWgD6KVwqiFX94U8frc080bkkW
	UTWg==
X-Received: by 10.14.200.132 with SMTP id z4mr12182885een.14.1376038439902;
	Fri, 09 Aug 2013 01:53:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm26807244eex.2.2013.08.09.01.53.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:29 +0200
Message-Id: <1376038471-32202-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/12] uhd: add dependency on ncurses
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2013 08:54:00 -0000

* when it's not found in target sysroots it's trying to use native one
  | cd uhd/1_3.5.3-r3.0/git/host/build/examples && sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_script CMakeFiles/rx_ascii_art_dft.dir/link.txt --verbose=1
  | sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++    -march=armv5te -marm -mthumb-interwork  --sysroot=sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fpermissive -O2 -pipe -g -feliminate-unused-debug-types  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -DNDEBUG  -march=armv5te -marm -mthumb-interwork  --sysroot=sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed CMakeFiles/rx_ascii_art_dft.dir/rx_ascii_art_dft.cpp.o  -o rx_ascii_art_dft
  -Lsysroots/x86_64-linux/usr/lib -rdynamic ../lib/libuhd.so.003.005 -lcurses sysroots/x86_64-linux/usr/lib/libform.so -lboost_date_time-mt -lboost_filesystem-mt -lboost_program_options-mt -lboost_regex-mt -lboost_system-mt -lboost_thread-mt -lboost_unit_test_framework -lrt -lusb-1.0 -lpthread -ldl -Wl,-rpath,uhd/1_3.5.3-r3.0/git/host/build/lib:sysroots/x86_64-linux/usr/lib:
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: sysroots/x86_64-linux/usr/lib/libform.so: incompatible target
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: warning: skipping incompatible sysroots/x86_64-linux/usr/lib/libncurses.so.5 while searching for libncurses.so.5
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: warning: skipping incompatible sysroots/x86_64-linux/usr/lib/libncurses.so.5 while searching for libncurses.so.5
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: cannot find libncurses.so.5
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: warning: skipping incompatible sysroots/x86_64-linux/usr/lib/libtinfo.so while searching for tinfo
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: cannot find -ltinfo
  | uhd/1_3.5.3-r3.0/git/host/examples/rx_ascii_art_dft.cpp:149: error: undefined reference to 'initscr'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index d3cc4c8..476b763 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.ettus.com"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=51b35d652c070d136bf20244494be2d3"
 
-DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native"
+DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native ncurses"
 RDEPENDS_${PN} += "uhd-firmware"
 
 PE = "1"
-- 
1.8.3.2


