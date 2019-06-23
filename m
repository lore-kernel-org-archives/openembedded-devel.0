Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D5B2F605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 19:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45X2gS2gCDz4X
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 21:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561318484;
	bh=Q6t+3Q/avgqu4kIzBIaJCBzMBlMvSJn+N4RTM18zJUA=;
	h=From:To:Subject:Date:From;
	b=Z6GbBjnN1vxD4zNYNQNX3soi4ozAvlxTZ9XuBoKFtT8+qABf3OfyvJ2Ql0qd3v+6V
	/ne1LbTED6Qe5m2xEfRIVMeaLjA5Uj+NVQZqq+3ab4YIdTYqpgvJ3YYzga/OlLN13f
	J8M8Oqjn8iHq/gxu/axbGEzG8/+jtEsvEx1/Q/5+RqP6nZlehcdWsWBPdW8vNpTKQ2
	k4GSo4dAGGFlt8F1fRGEujgcwjbjw1bRlFgqBU94EoBpKbPsyais4hCLV4snyK2whc
	bDrVqofnuP/CNrEMgJ0dKcOCs4I/TX0s3qe4miRMHcdgdvspeqm26s+bFjnRBpKWjv
	RdJ7JcmggwvcQ/sz+bUlCixFkHiBmdgVau4wm6sXKW2/RHwZQypJg5gT/POXNQ3alW
	rne0EKycmIGuKwAeuhwMOuYabyEwcfuSNADqnQeqSMOE2HODC+1UXc1OV3AVXaHLd+
	itc2NMH7Kvfi+ksTiEwjnCFGzKV1BLYGxJkt7UYeHoVbLKNUjWFfEtV9Pak5gnalNV
	S6VBhHT++BP9jewUCTIbN18pVqeBnRsRC/os/4uhobmTCA306i8vUn4rD7kXThRrCj
	1jkTwKtobXdvwQZSpP+75pZucDlkyhtWi4l0jawETiCoxwRq3qFHanVdNLW3uchcZo
	hQi4+T/SoL+kM+VkPxo133Is=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2019 22:34:42 +0300
Message-Id: <20190623193443.16840-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Remove the obsolete dependency on dbus-glib
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
X-List-Received-Date: Sun, 23 Jun 2019 19:34:44 -0000

Upstream stopped using it in 2011.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index 7752e76b5..7e1122457 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -2,7 +2,7 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-replacement-native pps-tools"
+DEPENDS = "dbus ncurses python libusb1 chrpath-replacement-native pps-tools"
 PROVIDES = "virtual/gpsd"
 
 # SConstruct in gpsd does not yet support Python 3
-- 
2.17.1


