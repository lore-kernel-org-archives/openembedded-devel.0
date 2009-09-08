Received: from [209.85.221.190] (helo=mail-qy0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MlAmM-0007LS-45
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:11:21 +0200
Received: by qyk28 with SMTP id 28so3252335qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2009 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=EMaKePj5yNWFys4Wug1OaBPSHAhIDv5Jb2M9mNxLGeI=;
	b=ZnnVQkNw/lyyeKCX6EmZ7HPGv4eWhl/6u7+0QAxvnxP16IcaAKv4MZgBoAiOkZ5pBJ
	upInZ7J9kuMIDPRz3/b3ZNOQzocPKqCwWzuIr0Jvf0wDnQvQ1gHRq+4Oali7I7KneW1U
	bnShkW5V9T6wPLCJgBVQjbhry/RmaX8K+VdvY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Jft56ljwpW4FR5IgLDJ4S9/dXttaEv7QkhDKlCkfaOw45AMPkBxECbWigTd3ab2zBH
	tZaFouxVSp/n3CQXci0ZYKy81RbnDiuwvCgedurpUc/pDxGbcyRPUMTg6V7JvdYwU42m
	P+uyAaCMfv8nK1ilAZKGt9vjpzWgEOOjxevh4=
Received: by 10.224.112.72 with SMTP id v8mr10516906qap.106.1252447089777;
	Tue, 08 Sep 2009 14:58:09 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 26sm13553qwa.2.2009.09.08.14.58.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Sep 2009 14:58:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2009 14:58:05 -0700
Message-Id: <1252447085-13013-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.221.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] tune-xscale.inc: Use TARGET_ARCH to find endianness
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
X-List-Received-Date: Wed, 09 Sep 2009 00:11:21 -0000

* Use TARGET_ARCH to find endianness instead of
  SITEINFO_ENDIANNESS which is not yet evaluated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/include/tune-xscale.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/tune-xscale.inc b/conf/machine/include/tune-xscale.inc
index 7fa6447..3a6bd0e 100644
--- a/conf/machine/include/tune-xscale.inc
+++ b/conf/machine/include/tune-xscale.inc
@@ -1,9 +1,12 @@
-FEED_ARCH =  "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+# this depends on fact that for ARM the TARGET_ARCH is 'arm' for little endian and 'armeb' for bigendian
+# this is the case as of now for all arm machines in OE.
+
+FEED_ARCH =  "${@['armv5teb', 'armv5te'][bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
 
 TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
-PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
-BASE_PACKAGE_ARCH := "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][ bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
+BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
-- 
1.6.3.3



