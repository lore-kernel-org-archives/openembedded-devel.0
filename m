Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcB2C-0008PR-Lt
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 07:15:16 +0100
Received: by pxi17 with SMTP id 17so3598137pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Jan 2011 22:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ByZg+Y6d/5ESuJeSCkLhqt6gLjZDblM0mOydpL7jVN4=;
	b=ljcNuLbMIcgVgmJkzI52kmx333dzATXief8TGCLUVATnoYn+pJNykg2weXvD6a6L3A
	n4elARC1TLRbYmKubfZM/IhpylOeOADUnQdOEydbzfRH4zRwN/PFyK7S2k9JYRAK1np9
	TgHSpSE2v8Qnrzz2VoZmO3EmU1qhxEOD/f/JQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EdPqI7ingN6X/K9Wa+kXt/ek8UTDE+R//VtFdXg30tXsXqlzSir234t0m+J0OlyS+N
	re2J1Pr6ZJTlVz0QM2Q1In+0B15x1OORypGg2Av79dyxTw4gXBItA+cQaVXOldq5d/Xh
	FUi0YK3wBDmj3+/xhdbuYrq7hOx+shFOoh89E=
Received: by 10.142.200.6 with SMTP id x6mr4067046wff.249.1294640082621;
	Sun, 09 Jan 2011 22:14:42 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y42sm7202436wfd.10.2011.01.09.22.14.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 09 Jan 2011 22:14:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jan 2011 22:14:56 -0800
Message-Id: <1294640096-21868-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] slugos.conf: Use thumb mode to save some more space
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
X-List-Received-Date: Mon, 10 Jan 2011 06:15:16 -0000

I have successfully nfs booted nslu box with the console-image generated
with thumb enabled gcc. This should help in reducing the code size a bit
more. I will build the image in all arm mode and compare how much we really
save

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/slugos.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index e2e7cc0..853a58e 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -10,7 +10,7 @@ DISTRO_NAME = "SlugOS"
 # DISTRO_FEED = "unstable"
 DISTRO_TYPE = "alpha"
 TARGET_ARCH ?= "armeb"
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET = "thumb"
 IPKG_VARIANT ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_opkg ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg-nocurl-slugos"
-- 
1.7.0.4



