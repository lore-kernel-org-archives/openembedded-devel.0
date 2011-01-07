Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pb8nb-0007Pz-Ga
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 10:39:55 +0100
Received: by pxi17 with SMTP id 17so3271914pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 01:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8+zcwDBNbwqsFgrgFdYam8aYDWeER7GfLZqY3vQhVD4=;
	b=GV0mXq9GUNCtzndYk+d0o31qlcafGv7Vf0IL9BKCUlMwG6XDFTr8Tz+19dDlG/yJZ6
	6ukyme6WVtANrKa+Ekthbo5CV+ySAvWN2iW2aoLGl9OPjoJiiqFCLCNsZm8ilW4FULsk
	On3Qzt3sxmcyGCehmFreMTxMc3/Ljy6vRMvaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=b0WrxTE4GdN16wXrM0Ft2qcs1GanpCOlIvBK5v1x122Y1tXYSB4dHA0UCjzvtkH+jE
	ycTk7ds8v1WYabViaQw2n7hZkQtPFJRJ7h/3OS7SVaNzCC78ZOVjdGIL1JBsmsGZVImN
	PPPFlvl/+t4/caaSokhAGcoM8yz9WL/w0m9YE=
Received: by 10.142.211.19 with SMTP id j19mr1604946wfg.61.1294393164413;
	Fri, 07 Jan 2011 01:39:24 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w22sm2384455wfd.19.2011.01.07.01.39.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 Jan 2011 01:39:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 01:39:17 -0800
Message-Id: <1294393157-25680-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] slugos: Dont install ldconfig
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
X-List-Received-Date: Fri, 07 Jan 2011 09:39:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/slugos.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index 7fb6d1c..e2e7cc0 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -15,7 +15,8 @@ IPKG_VARIANT ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_opkg ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg-nocurl-slugos"
 IMAGE_INITSCRIPTS ?= "initscripts-slugos"
-
+# Disable installing ldconfig
+USE_LDCONFIG = "0"
 require conf/distro/include/slugos.inc
 require conf/distro/include/sane-toolchain.inc
 require conf/distro/include/arm-thumb.inc
-- 
1.7.2.3



