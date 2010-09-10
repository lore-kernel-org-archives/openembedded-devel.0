Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1OuAdb-00054P-2X
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:56:10 +0200
Received: by ewy7 with SMTP id 7so2138104ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=EWuEsgSmzUgTbghSYYPf1kgpi60PLbUTFor61S2bZ68=;
	b=NZEsWLfHxmlJjngGBA8nkMpmMb3Qis2KAKvNLdbdz1qqd0R0clTITTc/XsgPsEz9eg
	uTxzt+my1DI+GeNyQWill3Uda6T96T/dJ+o+9Zz3a1sh+x7oQBXTteJfq90UTP5mSVjX
	uU8Um99u272Jcd9Qhpsy1OjS7/DWzUQLruODo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=R/5is0hR+rtCGl9w2XcpTFYMM4UBJn0aCWzH2/wDAITdHQG13ymghcXDseBQKGS1px
	WP9GJrq4Nq7JjQmwV7nnN4VeScgdDOxzchhXHXi9fgBL1P9w+r5L+SOPCqj+oKZ1m6CF
	rQ+Vo1unEGRyA5t+sJEuAR9ow3Jd/99U4rdBc=
Received: by 10.213.17.199 with SMTP id t7mr956112eba.41.1284152116940;
	Fri, 10 Sep 2010 13:55:16 -0700 (PDT)
Received: from localhost.localdomain ([80.249.95.150])
	by mx.google.com with ESMTPS id z55sm4525469eeh.3.2010.09.10.13.55.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 13:55:16 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	anarsoul@gmail.com
Date: Fri, 10 Sep 2010 23:54:14 +0300
Message-Id: <1284152054-27447-3-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.2.2
In-Reply-To: <1284152054-27447-1-git-send-email-anarsoul@gmail.com>
References: <1284152054-27447-1-git-send-email-anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] rx1950: change default kernel to linux-2.6.35
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
X-List-Received-Date: Fri, 10 Sep 2010 20:56:14 -0000

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 conf/machine/rx1950.conf |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index fb70437..d43a2dc 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -20,17 +20,9 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda wifi usbgadget screen vfa
 #
 # Software/packages selection
 #
-PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.35"
 PCMCIA_MANAGER = "pcmciautils"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
-
-#
-# Modules autoload and other boot properties
-#
-module_autoload_snd-pcm-oss = "snd-pcm-oss"
-module_autoload_g_ether = "g_ether"
 
 SERIAL_CONSOLE = "115200 ttyS0 vt100"
 USE_VT = "0"
-
-require conf/machine/include/LAB-settings.inc
-- 
1.7.2.2



