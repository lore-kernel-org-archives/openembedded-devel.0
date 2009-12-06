Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsH-0000ZB-J7
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:44 +0100
Received: by ewy24 with SMTP id 24so4866221ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=wAi27FujBhqscsvjHPwNh/PumzKeOK3fgzD/LfSTiBs=;
	b=ujC3IEnNDZ21oUdW2l7Nfc5Vvty1RqQCgaoWdUgyZPROEPe4QqmUufWs6a3aAjjaw3
	2EiCOp0byQzCNkG0nIRIZEXxDW2jkALMcU7ctOh1BKsbIImdW/GQmfBp04C91vPIICom
	Dh4QcHjW8+9Z/5HC1kvC835z2tKSO8JxYTHRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sANbcZsVo1p91oEwt9+yVZVqyg1AuFek9iOcLjEYSL9M5h7sQHI8sgUQaMYg81Lriy
	A6aJFmKVPZHYpozsNfraroV3hGLZcPI8XKJ7tSwtLqdiVBaeAmwgY8LjnDXzXG1fDZRC
	r1cV+ePKpnRTUHftLpQFrOAXwW6ETHvnONpjI=
Received: by 10.213.24.9 with SMTP id t9mr6342740ebb.4.1260139502758;
	Sun, 06 Dec 2009 14:45:02 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:02 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:36 +0100
Message-Id: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>,
	Walter Goossens <walter.goossens@axon.tv>
Subject: [PATCH] {insane, kernel-arch, site-info}.bbclass: New architecture nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:44 -0000

From: Walter Goossens <walter.goossens@axon.tv>

These adds nios2 to the hard-coded architecture bits we have in
the BitBake classes.

Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 classes/insane.bbclass      |    4 ++--
 classes/kernel-arch.bbclass |    2 +-
 classes/siteinfo.bbclass    |    1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 495c3a5..4ab16ae 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -63,8 +63,8 @@ def package_qa_get_machine_dict():
                         "i686":       (   3,     0,    0,          True,          True),
                         "mipsel":     (   8,     0,    0,          True,          True),
                         "avr32":      (6317,     0,    0,          False,         True),
-			"sh4":        (42,	 0,    0,          True,          True),
-
+                        "sh4":        (42,       0,    0,          True,          True),
+                        "nios2":      (113,      0,    0,          True,          True),
                       },
             "uclinux-uclibc" : {
                         "bfin":       ( 106,     0,    0,          True,         True),
diff --git a/classes/kernel-arch.bbclass b/classes/kernel-arch.bbclass
index 8894fa5..648f50d 100644
--- a/classes/kernel-arch.bbclass
+++ b/classes/kernel-arch.bbclass
@@ -12,7 +12,7 @@ valid_archs = "alpha cris ia64 \
                m32r mips \
 	       sh sh64 um h8300   \
 	       parisc s390  v850 \
-	       avr32 blackfin"
+	       avr32 blackfin nios2"
 
 def map_kernel_arch(a, d):
 	import re
diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index 93cee4f..7e7b9e9 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -52,6 +52,7 @@ def get_siteinfo_list(d):
                "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc mips-common",\
                "mips-linux":              "endian-big bit-32 common-linux common-glibc mips-common",\
                "mips-linux-uclibc":       "endian-big bit-32 common-linux common-uclibc mips-common",\
+               "nios2-linux-uclibc":      "endian-little bit-32 common-linux common-uclibc",\
                "powerpc-darwin":          "endian-big bit-32 common-darwin",\
                "ppc-linux":               "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
                "ppc64-linux":             "endian-big bit-64 common-linux common-glibc powerpc-common powerpc64-linux",\
-- 
1.6.0.4



