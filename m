Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mxbls-00049f-18
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 09:26:15 +0200
Received: by qw-out-1920.google.com with SMTP id 4so3208968qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=xgQK8PVEhOOFdYLTjt168YQZyjkg6sVIkLQCX7gEap4=;
	b=CpARJfIW6XOYvmDC8hDKiKThZs7Yjl+p2axyB3AvM6aatG7wkNsgOPrcFIL5ZR/kqd
	fSbnOTJWuRpLL0RUNbagMDzB3bX2Q7M+sV1Saf1qUkClCj/hM0LXiJtJ2dCqRwrW2YzJ
	lvcwgwt3eAe1IYQyiyBJZmJosmA7gGWUwRk2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=P7dc4nOn1IpIuwkyp7S0yfMwOxI7PBWfAqeqZkxSHN/bws0Q4H38XufocTrQigyAvl
	Yc9Iifj4YkZUTxXRcZHiWrR03CXBKX2oanJFDa+VU4UU56WGjx9w9zvzk17+oE0DbG6T
	aYrXD5CsglRlv7oGtrcO6ZkrDMQbaF8qRUWug=
Received: by 10.224.100.134 with SMTP id y6mr5437134qan.283.1255418719542;
	Tue, 13 Oct 2009 00:25:19 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 7sm2397081qwf.58.2009.10.13.00.25.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Oct 2009 00:25:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Oct 2009 00:24:57 -0700
Message-Id: <1255418697-27833-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.92.144
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] sane-toolchain.inc: Compute uclibc based triplets correctly.
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
X-List-Received-Date: Tue, 13 Oct 2009 07:26:15 -0000

* Currently for uclibc it does not do the right job it generates
  e.g. for SPE it generates linux-uclibcgnuspe which is not right.
  This patch fixed it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 5c326d7..af7c607 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -159,8 +159,8 @@ def compute_os_portion_of_target_triplet (d):
 	arm_eabi_supporting_arches = "armv6 armv6-novfp \
 	armv5te iwmmxt armv7a armv7 armv5teb armv4t"
 	ppc_spe_supporting_arches = "ppce500v2 ppce500"
-
-  	if bb.data.getVar("LIBC", d, 1) == "uclibc":
+	gnu_suffix = ""
+  	if bb.data.getVar('LIBC', d, 1) == "uclibc":
     		libc_suffix = "uclibc"
 	else:
 		libc_suffix = ""
@@ -182,16 +182,20 @@ def compute_os_portion_of_target_triplet (d):
 				bb.fatal("DISTRO requested EABI but selected machine does not support EABI")
 				abi_suffix = ""
 			else:
-				abi_suffix = "gnueabi"
+				if libc_suffix is not "uclibc":
+					gnu_suffix = "gnu"
+				abi_suffix = "eabi"
 		elif bparch in ppc_spe_supporting_arches.split():
-			abi_suffix = "gnuspe"
+			if libc_suffix is not "uclibc":
+				gnu_suffix = "gnu"
+			abi_suffix = "spe"
 		else:
 			abi_suffix = ""
 	else:
 		bb.note("DISTRO_FEATURES is not set abi suffix not set")
 		abi_suffix = ""
 	if libc_suffix is not "" or abi_suffix is not "":
-		return os_suffix + "-" + libc_suffix + abi_suffix
+		return os_suffix + "-" + libc_suffix + gnu_suffix + abi_suffix
 	else:
 		return os_suffix
 
-- 
1.6.3.3



