Received: from [209.85.210.180] (helo=mail-yx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MlKEf-0006wG-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 12:17:12 +0200
Received: by yxe10 with SMTP id 10so7146579yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 03:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=EMaKePj5yNWFys4Wug1OaBPSHAhIDv5Jb2M9mNxLGeI=;
	b=Gh0EIuXM4rP8DM0FGHv3evtqhSejdb29e3rg5Jgj+6LGl8g1YjJU+ypYJEk5gop9Wc
	QaqOrzq5J0GFHgQElfaRN5C3LVoKnDPkm6Bnzgpvs6tba0p/QxTKU0lTbJub3sZ1fWSM
	PPNoqnxXKGItf+1+ltK36JUC32W7wFqxdHu/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PyEmjffohlt5Ggpgrkyx5DJ5vDW9qllHsJqHTJezMGXehSmMkhbpza3vdgEX30JKNF
	8yywnyEn6FD47VsnoLrufUw6yLrl1v8Rp/Rngj4pDYzY89uQrpS3v0jBRdYJ6RSCV6za
	dqQoWt9SDCJuPfkkhSiIAEiwux2V8GdgnffJ0=
Received: by 10.90.11.30 with SMTP id 30mr11472689agk.42.1252350747313;
	Mon, 07 Sep 2009 12:12:27 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 6sm3378349agd.49.2009.09.07.12.12.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Sep 2009 12:12:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Sep 2009 12:11:44 -0700
Message-Id: <1252350704-9530-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
References: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.180
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
X-List-Received-Date: Wed, 09 Sep 2009 10:17:13 -0000

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



