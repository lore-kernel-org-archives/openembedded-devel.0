Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMg-00058c-Ed
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:26:54 +0100
Received: by pxi17 with SMTP id 17so939967pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=L7c3sQvu+b2ACxGKfGI87Zjd9rMo8r18FTZVNOwCutw=;
	b=OK7ig9qYqnfhCKTywd+cNujn70Dnz0Bz7+t8EyN6VJfmbCbnKYj1WKwAqyKMhjzTdu
	pocUYK4uKJDqYfVea8rWHQSIwcgh22Vg8yx4tE6xnQ4ZWkP8I45PeVAQ0CadPuH9S5fO
	O5XpcNGLWKwSMUS+cn2sORLbkkp1tiAK5vVrM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VPYbPAxOSvlLKjJyg4/L+nqYz/Sx05wtQFC+efEoryIYo+P1DJRXlVOsxOCfbhyMqu
	pRcxa5IIOThGSB5wKjjf+W14MxRFi7pGq7ctlvru82R3bG+/EgABHHpHp0kZWorUJFGz
	Kjh5vnDpExv9BhfTxS3Aev321+k5+MT9QM108=
Received: by 10.142.177.14 with SMTP id z14mr1585771wfe.338.1295936766939;
	Mon, 24 Jan 2011 22:26:06 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.26.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:26:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:42 -0800
Message-Id: <1295936745-718-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 6/9] bitbake.conf, nylon.conf, openwrt-sdk.conf: Use opkg-build instead of ipkg-build
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
X-List-Received-Date: Tue, 25 Jan 2011 06:26:54 -0000

* Rename IPKGBUILDCMD to OPKGBUILDCMD

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/bitbake.conf            |    2 +-
 conf/distro/nylon.conf       |    2 +-
 conf/distro/openwrt-sdk.conf |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 042a06c..ad2e721 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -663,7 +663,7 @@ export PATCH_GET="0"
 
 # Program to be used to build ipkg packages
 
-IPKGBUILDCMD = "ipkg-build -o 0 -g 0"
+OPKGBUILDCMD = "opkg-build -o 0 -g 0"
 
 ##################################################################
 # Not sure about the rest of this yet.
diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
index ae8d064..6b9d3d9 100644
--- a/conf/distro/nylon.conf
+++ b/conf/distro/nylon.conf
@@ -52,7 +52,7 @@ CXXFLAGS := ${fixedCxxflags}
 DISTRO_FEATURES = "nfs smbfs wifi pcmcia ppp ext2 vfat usbhost pci"
 
 # FIXME: cannot build linux-libc-headers unless this is set.
-IPKGBUILDCMD = "stage-manager-ipkg-build -o 0 -g 0"
+OPKGBUILDCMD = "stage-manager-opkg-build -o 0 -g 0"
 
 #############################################################################
 # PREFERRED VERSIONS
diff --git a/conf/distro/openwrt-sdk.conf b/conf/distro/openwrt-sdk.conf
index 0646b17..0c96b12 100644
--- a/conf/distro/openwrt-sdk.conf
+++ b/conf/distro/openwrt-sdk.conf
@@ -21,7 +21,7 @@ DISTRO_NAME = "OpenWRT"
 DISTRO_REVISION = "2"
 
 # Build ipk's wrapped with tar.gz instead of ar, like OpenWRT has them
-IPKGBUILDCMD = "ipkg-build -c -o 0 -g 0"
+OPKGBUILDCMD = "opkg-build -c -o 0 -g 0"
 
 # This is what lives in SDK
 ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc virtual/libc"
-- 
1.7.0.4



