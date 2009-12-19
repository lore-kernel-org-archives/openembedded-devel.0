Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NM7ms-0006H7-As
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 23:28:37 +0100
Received: by yxe1 with SMTP id 1so4031013yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2009 14:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=A069A8bt9RTKPvDFN7iYX5TmHCTZVYRhsnDO8SEFywM=;
	b=Z4M8ZGtYLH5XWi93WG803Vw6AC6DH9ZSdEKCGUYt512h8IZ+upUseZifV/uMnNpQW5
	dxazgTUb0dVEnbZtfhd5SzEbH6Km8Ql2+zvFXa0OgpA6Riee2Kdy85G4lSi9B6Ku03Jh
	PtsGgFnMwmB4YMiisSXNetZsCaumSDYQpal6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IoGW2UNY8hbA9v1/gWlM9eGNy19NfLtk/cGMe3T8ok/Rsk9kIGVrVn+Enlq/R+loeW
	Gc3kdna+LqyoMDPJvhyHYDmmXeONSsFLMJjOLAchg32QY0Z0/HUZQqA6s2HhLrE6xhEc
	Bm4QDhDok2OFj9/QTaWIy5d90JBZr4Uke1USk=
Received: by 10.150.118.21 with SMTP id q21mr8583729ybc.279.1261261604129;
	Sat, 19 Dec 2009 14:26:44 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm3341573iwn.0.2009.12.19.14.26.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 19 Dec 2009 14:26:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Dec 2009 14:26:36 -0800
Message-Id: <1261261596-19241-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] minimal: Add 'mplt' to DISTRO_FEATURES.
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
X-List-Received-Date: Sat, 19 Dec 2009 22:28:37 -0000

* As minimal-uclibc includes minimal conf the
  distro features get inherited. mplt is not
  supported on uclibc yet. So we should disable
  it for uclibc/mips based distros.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal-uclibc.conf |    8 ++++++++
 conf/distro/minimal.conf        |    6 ++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index 9594622..62855ee 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -19,3 +19,11 @@ TARGET_FPU_armeb = "soft"
 LIBC = "uclibc"
 
 require conf/distro/minimal.conf
+
+# FEATURE SELECTION
+#############################################################################
+# We want images supporting the following features (for task-base)
+DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
+# Following features are for ARM and E500 based machines
+DISTRO_FEATURES += "eabi"
+
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 1e9eec2..00397db 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -28,6 +28,12 @@ DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pc
 # Following features are for ARM and E500 based machines
 DISTRO_FEATURES += "eabi"
 
+# The following feature enables the MIPS ABI PLT extensions
+# This feature needs GCC 4.4 binutils 2.19 or glibc/eglibc 2.9
+# or higher
+
+DISTRO_FEATURES += "mplt"
+
 #############################################################################
 # LIBRARY NAMES
 #############################################################################
-- 
1.6.3.3



