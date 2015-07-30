Return-Path: <ashcharles@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E90827648B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 19:57:21 +0000 (UTC)
Received: by ioii16 with SMTP id i16so64734444ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6ID86DoQv+5IdOPaSsjjFszWr902tu/h9xU0kL+0xu4=;
	b=akidzkEwaGthNpJfjdFSJ4SJp7Mg3k/MvTnIj/IgMtSfK1zTAacvW5ia4qlge/eZeH
	rb4t6XMGQ44XY+87yLmGPoDfP2j84sQGT+x0IZwOPnC7mQuq6U4Qh+8v+hoPIWkOw7yK
	ZNdfB3S6r59RRprUtLdPVMSfKHWJqdqADBilPRM87eU3s55hu0Aw8YKLumr4bSg+4fK2
	YvAPzT8QOjIPtT+EcZOyevp0arPwuhoz2AskyRnVU6vDm4VwXYzblHiYbjN/f1CVoTq8
	pkLOmjgZiRwiTtNaIFPNpZSM+htuPIBY5CXVcCPplw8N2FtZjKolYDeWNE9kgEJORLkY
	wMsA==
X-Received: by 10.107.3.139 with SMTP id e11mr13948490ioi.18.1438286241505;
	Thu, 30 Jul 2015 12:57:21 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by smtp.gmail.com with ESMTPSA id uw5sm378438igb.21.2015.07.30.12.57.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 12:57:21 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jul 2015 12:57:19 -0700
Message-Id: <1438286239-18361-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] bluez4: Allow systemd to activate bluetooth
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
X-List-Received-Date: Thu, 30 Jul 2015 19:57:25 -0000

The bluetooth.service runs bluetoothd to manage bluetooth devices, if
present, in the system.  By design, it should be running in either of
two cases:
1. A userspace utility (e.g. networkmanager) has made a dbus request
   for bluetooth services provided by org.bluez.  Even without this
   patch, the bluetooth.service gets run via dbus activation under the
   systmed aliased name 'dbus-org-bluez.service'. Perfect!
2. A bluetooth device is added to the system.  When a bluetooth device
   is added, udev triggers the special systemd target, bluetooth.target
   intended to pull in any services needed for bluetooth linked under
   bluetooth.target.wants.

Enable bluetooth.service so it gets linked under bluetooth.target.wants
and bluetoothd gets started when a user adds a bluetooth device to the
system.

To be clear, this isn't forcing bluetooth to be running all the time---
only when either of #1 or #2 are true.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
index e97b22e..7719d05 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -49,4 +49,3 @@ FILES_${PN}-dbg += "\
 "
 
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.1.4


