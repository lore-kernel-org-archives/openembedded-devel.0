Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BAA967F96B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:19:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471Yj25pvqz4H
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 00:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572218390;
	bh=5o95SHeB8XWlakX4OHRKaluA1GKTq3jpNPrLZ6J3FE8=;
	h=From:To:Subject:Date:From;
	b=JDqdUHuQui346QQ3jlxdmYki2hglattfn09VhkU8mkCKzh2xc9sT3qDI1R56RiebZ
	iCVnEjMTKIspQyOlcs0MT7aEFoq98qRboJNHpkrVadCEBFhw3fJOeSeisuYx2/Emqf
	L183Q2/GDWh2GaGalb9sFRnpzYRX3iCBzVO7CREJz6YukjsVCadN5BuXn/VWui9qQN
	/arqK5HfQPrdZ8x2XqDG87+JwXGmoyedv3q8KTRkjkO2wTJfWcSmJf7YnQYyg8lRBm
	OuQD8wBhduBZsY9IdZE9kGHHdJBiFkNvOJfwqr8qnoJq0ZlXugewTQYmjbS9TOHAUp
	lWmW4MApf8KkwmqhpiNS2jZQn9N0mNzRlfQP6NRqNBRnOsV5XJybA35W7KNjU6nl+Q
	Yyt0ERumdoszD9aMa0RjPcF20BWwNM6k638G4SqpxOBCAAjm/pyVoK1gEZWQ6/vGRI
	PnGXut9HsLaFoFvdzJtz9rcAbr3FMCzo7L+Wm7BK8QQW1QHsLYQiy/286YXtEy7njJ
	c77xkn/TYgESr2z8AT/4GAq02gd4h6LJCtvV4L3K6pGVnAoeBtOqmudH42H3YP8cZN
	4JVQoFq4sC1kC7DLT1gVQJcCLl42lser2QG62AfzT5pb8etfz+DN1CEMHrf9SUnImc
	0z88FcW6oLQMKLXEw5+/GsXU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 01:19:50 +0200
Message-Id: <20191027231950.22344-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Stop depending on chrpath-native
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
X-List-Received-Date: Sun, 27 Oct 2019 23:19:52 -0000

chrpath is no longer used since 3.15.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index 054af4082..6834bd45a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -2,11 +2,9 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01764c35ae34d9521944bb6ab312af53"
-DEPENDS = "dbus ncurses python python3 libusb1 chrpath-replacement-native pps-tools"
+DEPENDS = "dbus ncurses python python3 libusb1 pps-tools"
 PROVIDES = "virtual/gpsd"
 
-EXTRANATIVEPATH += "chrpath-native"
-
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0001-gps_shm_close-Free-privdata.patch \
@@ -33,7 +31,6 @@ EXTRA_OESCONS = " \
     libQgpsmm='false' \
     debug='false' \
     nostrip='true' \
-    chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
     libdir='${libdir}' \
     manbuild='false' \
-- 
2.17.1


