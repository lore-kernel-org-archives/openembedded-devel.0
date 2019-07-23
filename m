Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AA10A7D1F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 16:46:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tPW82PWWz23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 18:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563900372;
	bh=zoSqa+WW5YiXFPV33q8tqztqND/Rlgy/E1i2tB5MW0s=;
	h=From:To:Subject:Date:From;
	b=GKw7ikA4pI7Sb8JpeHGcMApLkv+G6qakHsRLouPzqmBqpJxPz/lQpuxEev/ZCKi4h
	neNmqVthLpwF+2eUMw33jBpTiWrqi7/jq3Q3//QzMl0zQ3CGKpn1v9ZGJpAuk693L3
	+rk3PtP+ZawwFdU0e0cFhQe6e22pFQeYBYjj9AfqJ5htXOOmvTJRJtQCl+ae/OnF/j
	8Sj55k5aoGasmqBg5MjUFDMpJBhbeHWzrpW3RLeT0MyUU4miO/dDRDDc8P8+kXQkdq
	YeKpm+T1Z9J9ifgBa4lrnvPuHSJBDOgMPM4ZeAtMBpqdJ9EoZSI+Eh3C2F01QhpdVQ
	M+lHP/6jO8Cml+7IvB8fd0o7ngbyw+anh7wb1GUy3uDYicSiXccklleTPKaEXmp/FX
	QbauHCJ1Th9peAb5OcZUj5erm4v467nWcMPZyz43DnVOyAxXpTTfNFoUG3wBPSZdJY
	8nH5wX5IhFUJQvXDBuZZUsJzCFkKGnzHvdij3eGen3E7FpcHQl8Qbug0BIx6RmNkvD
	6t5yddJxenDZO6Jvaq6JTKGUN6XVVk30JOs3TP1lIIg3yODXJPUItfcFUmb0nj05e1
	EBuDhQ2D2X0Bpd3gRM5SitFbnoT6zhIJUETcINL7/wWLl6TshFc5sfG+VK3p3XqJl0
	Wxb1W5rSTfzWGFGNeZgmFGaQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jul 2019 19:46:07 +0300
Message-Id: <20190723164607.14935-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Switch from python-scons-native to python3-scons-native
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
X-List-Received-Date: Tue, 23 Jul 2019 16:46:12 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index 558b7c1d5..7b7f33520 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -2,13 +2,9 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01764c35ae34d9521944bb6ab312af53"
-DEPENDS = "dbus ncurses python libusb1 chrpath-replacement-native pps-tools"
+DEPENDS = "dbus ncurses python python3 libusb1 chrpath-replacement-native pps-tools"
 PROVIDES = "virtual/gpsd"
 
-# SConstruct in gpsd does not yet support Python 3
-DEPENDS += "python-scons-native"
-DEPENDS_remove = "python3-scons-native"
-
 EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-- 
2.17.1


