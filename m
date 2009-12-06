Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsO-0000ZS-On
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:53 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866261ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=IB41koHP2LiJTqp1193LZvmCOcJSNcymubyRUIDh0UU=;
	b=Z8Rdl4Movie97i2QADyCVroSKBzBJeWpWTJ3YZVHzwFKrR2QgfePeXcvEJF706dejQ
	wrpbZWk+YAm6o8q5UFSFswwKONmLbeZMRoLCLM4FUG+c2vFFXDlIayAilJMq0MgogbKr
	J/yeyv9E34JoyNpeW+7z2qzi8jEV+B+wU+AUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Aw8+VGSUj19C+YfrXR/sXGnX3DsYhwLulzpwx7ngsbKEaut3R64Kd3J3gUrU0drncJ
	MHZK/yrIeMDfwYYM4HrfEyOjoUqKnBCsGDj/1B+szHPWvn2IefJC76YPyOi8jxbBL31X
	tDLvQfoK6UMv4OclI+39TMIYzHkVXim2/dfuc=
Received: by 10.213.0.196 with SMTP id 4mr6356628ebc.41.1260139512066;
	Sun, 06 Dec 2009 14:45:12 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:11 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:49 +0100
Message-Id: <1260139496-21442-14-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-13-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] angstrom-uclibc.inc: Exempt nios2 architecture from GNU hash style.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:53 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/distro/include/angstrom-uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
index 004d904..e49d078 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -27,7 +27,7 @@ BUILD_OPTIMIZATION = "-O2 -ggdb3"
 #Note that this testing was done without the gcc-pr32889.patch.
 FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'avr32']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'avr32', 'nios2']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-- 
1.6.0.4



