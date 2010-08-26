Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oods1-0003Tm-Ni
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 16:56:02 +0200
Received: by eyb7 with SMTP id 7so1366771eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=yRCEBObuFrqj2dgb0MknN1+rz/V3My5+0Jq5rowJoVc=;
	b=e77aZz8+Iw099iZ4/Jye6z3rMooYBmP8KGRPwGKrmn+tf3tlwmPhKKDUKs89/tYXnf
	93X6OiS6lAtJB3+0Ny3cuIBtj7UmDTk/Orx4kSp2aTAXKa2zNH0e8qXaltzfKZB+eu8X
	L1r7QcfNUJnX5SMM3c6cLY57m7uqyFiti2IEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IIHhPp/eAciqo9taCsJBVnG/bOz3pZ+T/ceoxQFiGyfhSQmLhTwH1q6yeh1cyVLELr
	O7RSBSvodzcH6CQLIEdrK9XvvuVmJO1ciaX4a1H4DmHOSuRUwgVlMEjpiW83q5PXQ7Oh
	zKUwso/H9jwXCQQ2gvSnzxFc9UfsW6vJ7/scs=
Received: by 10.213.109.9 with SMTP id h9mr7336367ebp.33.1282834536119;
	Thu, 26 Aug 2010 07:55:36 -0700 (PDT)
Received: from localhost.localdomain (atwork-193.r-212.178.107.atwork.nl
	[212.178.107.193])
	by mx.google.com with ESMTPS id a48sm4176380eei.13.2010.08.26.07.55.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Aug 2010 07:55:35 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 16:55:54 +0200
Message-Id: <1282834554-16358-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] minimal.conf: added ivp4 and ipv6 as distro features
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
X-List-Received-Date: Thu, 26 Aug 2010 14:56:02 -0000

minimal.conf has nfs as distro feature but not ip4 or ipv6.
This makes that busybox does not generate networking applets

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 conf/distro/minimal.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index d0d2341..7216976 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -24,7 +24,7 @@ DISTRO_CHECK := "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('Remove thi
 # Use bluetooth 4.0
 DISTRO_BLUETOOTH_MANAGER = "bluez4"
 # We want images supporting the following features (for task-base)
-DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
+DISTRO_FEATURES = "ipv4 ipv6 nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
 # Following features are for ARM and E500 based machines
 DISTRO_FEATURES += "eabi"
 
-- 
1.7.0.4



