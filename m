Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Or0R0-0006Ig-SW
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 05:26:09 +0200
Received: by pwj8 with SMTP id 8so81101pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 20:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=lla70w83BLBpFCdQQwsHmCNq2ti78xhg/LrVXMOkHDc=;
	b=TyEEK4Os7d/tjY3XrnR892xiB4KRx0wL1LHbQgXbZQzoMSZUri1GLEZNW4nYiU9yA2
	No32acHW9maSTUSG37XPsgEX7j+ALJFJERDr4GRKTwbxY0OA2dNN30Gm6ktJJKbFe1jt
	1h6jAy38DHYXmw8/UUD1MMnvNpn7Eua+PGVrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Yu2Zyd5LGQT/xA/Zja5p/Kh6+5wIw0C0X64Um6HYj3DBWYD3fjNXXqW5Ros8giQZ9e
	yv76VzB8MV7fp+Y/Z+EJsTsa0jZCxBEiN+osc5Mro9eduUpvuqD0rQVfaGnEU11jRI8m
	sw8/9z/mwRgvTK+7KDiFTpOLKKoYPlMTZUE9E=
Received: by 10.114.76.9 with SMTP id y9mr9820942waa.26.1283397912864;
	Wed, 01 Sep 2010 20:25:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d38sm19809580wam.20.2010.09.01.20.25.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 20:25:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 20:25:07 -0700
Message-Id: <1283397907-28392-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] minimal.conf: Select bluez4 for bluez-utils-dbus and bluez-utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Sep 2010 03:26:09 -0000

* Set bluez-libs for PREFERRED_PROVIDER for bluez-libs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 7216976..2f3a821 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -22,7 +22,11 @@ DISTRO_CHECK := "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('Remove thi
 # FEATURE SELECTION
 #############################################################################
 # Use bluetooth 4.0
-DISTRO_BLUETOOTH_MANAGER = "bluez4"
+DISTRO_BLUETOOTH_MANAGER            = "bluez4"
+PREFERRED_PROVIDER_bluez-utils-dbus = "bluez4"
+PREFERRED_PROVIDER_bluez-libs       = "bluez-libs"
+PREFERRED_PROVIDER_bluez-utils      = "bluez4"
+
 # We want images supporting the following features (for task-base)
 DISTRO_FEATURES = "ipv4 ipv6 nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
 # Following features are for ARM and E500 based machines
-- 
1.7.1



