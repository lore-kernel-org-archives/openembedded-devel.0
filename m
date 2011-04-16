Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QB49f-0003Mm-7i
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:59:11 +0200
Received: by fxm19 with SMTP id 19so2693953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=N4zbaa70rB5JSuTBqFj9F4BwZcMP+lWOOeS2RFWXgVo=;
	b=W/nGcUsGPJlpPElRXpxKkVGwb1+oqvW2Mn07tU9U1B+IpIHVtamrDYO3zsSa4kBk6U
	/58rjJFGf+E58xx7zEEWd2oIqBcxmYcY7wLBeqYe06sbn0M0t5s6ZhTXrvqMsgZok5cp
	OJdruJrF+ZyjbupyIz3lSQeY3Byp662+VpAbw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sQgNoZdz27o3dvBso48wFizFWxRXgF0kowRc9+pA/KPC5D+GQrqAGezytyXPiloTOH
	1vGcP6YeoPOnR5ZvlVVUSz7juC48m8rU8ToxAaZEUbrV0ZjQ8D/pAxxgse/dylDeLNng
	W4UnxILHLPiR9nvaV/KLGVdz5iYGnozX0dGqo=
Received: by 10.223.24.213 with SMTP id w21mr3065721fab.113.1302955012499;
	Sat, 16 Apr 2011 04:56:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n7sm1067863fam.11.2011.04.16.04.56.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 04:56:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 13:56:50 +0200
Message-Id: <cover.1302954782.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [meta-oe][PATCH 0/4] Pull request #7
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
X-List-Received-Date: Sat, 16 Apr 2011 11:59:11 -0000

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-oe
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (4):
  xserver-xorg: upgrade to 1.10.0.902
  vala.bbclass: move from meta-efl to meta-oe as libcanberra_0.26.bb is
    also using it
  bluez4: merge .inc file to .bb file itself
  bluez-hcidump: add 2.0 version and patch to build with newer bluez

 {meta-efl => meta-oe}/classes/vala.bbclass         |    0
 .../remove.ntoh64.definition.patch                 |   42 ++++++++++++
 .../bluez/bluez-hcidump_2.0.bb                     |   21 ++++++
 meta-oe/recipes-connectivity/bluez/bluez4.inc      |   71 --------------------
 .../bluez/bluez4/bluetooth.conf                    |   16 -----
 .../fix-dfutool-usb-declaration-mismatch.patch     |   13 ----
 .../bluez/bluez4/hid2hci_usb_init.patch            |   33 ---------
 .../bluez/bluez4/sbc-thumb.patch                   |   11 ---
 meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb  |   71 +++++++++++++++++--
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 ...rg_1.10.0.901.bb => xserver-xorg_1.10.0.902.bb} |    5 +-
 .../xorg-xserver/xserver-xorg_git.bb               |    6 +-
 13 files changed, 132 insertions(+), 157 deletions(-)
 rename {meta-efl => meta-oe}/classes/vala.bbclass (100%)
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.901 => xserver-xorg-1.10.0.902}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.901 => xserver-xorg-1.10.0.902}/hack-fbdev-ignore-return-mode.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.0.901.bb => xserver-xorg_1.10.0.902.bb} (82%)

-- 
1.7.5.rc1



