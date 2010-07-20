Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ob584-0002Fs-Ee
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 07:12:33 +0200
Received: by pvg13 with SMTP id 13so2210026pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 22:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=SgM3dBqby19/wQNnbKOuSmIWHhD5MGeYRJUEikRj3Gw=;
	b=hWIvKszOHCi/QkQ0KD0fFDWzCXzQKRR8JupyTpM8dEEvyEYsCXj5r/WmOsFG4+sSB1
	8w11jN91ybcknrTOavF1HEck7CgeSNO+H79O5ndwbXnLE8oqJzPfQ6q6+7MuMa99WBxY
	XXFpOS7IvpHAEa8PUxhCbTthqgT1x7/5nsai4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gVtP2XXW3mWNM65rHSvIOVP9Knds9wSMVc4a8nSBRkpfk/r17NySzoPBmUFcTGYjnO
	uXOvnUelzmNOO7pQ68fZ9HOCSrn/nE3S5K48PlufihWX3DgcFhGzGTE52fBy5RsA9qNB
	+7WMARlcOtOW6tQCIodV3RRpP+nYfZNfHnZ2s=
Received: by 10.142.212.2 with SMTP id k2mr1953264wfg.35.1279602736810;
	Mon, 19 Jul 2010 22:12:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm7306740wfd.8.2010.07.19.22.12.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Jul 2010 22:12:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Jul 2010 22:12:34 -0700
Message-Id: <1279602754-8620-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain.inc: Check for architectures which dont support EABI
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
X-List-Received-Date: Tue, 20 Jul 2010 05:12:33 -0000

* This patch reverses the check for EABI support. This would mean
  that future processors will not have to be added everytime they
  come out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 08fc077..de73922 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -153,8 +153,7 @@ def detect_arm_abi (d):
 
 def compute_os_portion_of_target_triplet (d):
 	import bb
-	arm_eabi_supporting_arches = "armv6 armv6-novfp \
-	armv5te iwmmxt armv7a armv7 armv5teb armv4t armv4"
+	arm_eabi_unsupported_arches = "armv1 armv2 armv3"
 	ppc_spe_supporting_arches = "ppce500v2 ppce500"
 	gnu_suffix = ""
 	if bb.data.getVar('LIBC', d, 1) == "uclibc":
@@ -175,7 +174,7 @@ def compute_os_portion_of_target_triplet (d):
 	bparch is not None:
 		if 'eabi' in bb.data.getVar('DISTRO_FEATURES',d,1).split() and \
 		bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:
-			if bparch not in arm_eabi_supporting_arches.split():
+			if bparch in arm_eabi_unsupported_arches.split():
 				bb.fatal("DISTRO requested EABI but selected machine does not support EABI")
 				abi_suffix = ""
 			else:
-- 
1.7.0.4



