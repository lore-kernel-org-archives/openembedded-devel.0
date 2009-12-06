Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsM-0000hP-Hl
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:49 +0100
Received: by ewy24 with SMTP id 24so4866301ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=u48hbLgXqCFbqMnN2e+k22Gakg5XiaV3Ukcom3DOtZI=;
	b=AOJsk8Y2kkkG9udYs/oWFqQSdq0xyKATQcLqiGx8p/JElke/W2SeIudrWOpro74cuT
	+Oh3UK4YF5YxE86rfpZcEvCgwqOhl/if9R71jymwAVe+ExvPCdPci0E9V43zkON2ivTG
	s4ALT73LpWXTueIgcDZGnAHfJuOZhIsUCReDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TAXn+oYYtZjm0EfgMxPQKoOz+sbsYnOqVZKUVbujZD3j8Gke2FEtlNhlFH4bdBlGgI
	ot7v/r2NXvmVsuVvVEK/gF80YANETHax5Exu1gh75eSZnP/bNNFe3En3G6EyH66HjZjj
	E+2oovL+3SBfyvPyJ0z+V+rb1uzdfWKf9/JcQ=
Received: by 10.213.102.72 with SMTP id f8mr6314858ebo.26.1260139507565;
	Sun, 06 Dec 2009 14:45:07 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:06 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:43 +0100
Message-Id: <1260139496-21442-8-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-7-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] gcc-configure-common.inc: Introduce SHARED_LIBRARIES.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:51 -0000

--disable-shared iff SHARED_LIBRARIES is set to "no".

By default, SHARED_LIBRARIES ?= "yes" in this file,
thus this should NOT affect behaviour.

--disable-shared is needed for initial support for the
newly introduced nios2 architecture in OpenEmbedded.

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/gcc/gcc-configure-common.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index 8a96326..6031834 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -14,6 +14,7 @@ OBJC_linux-uclibc ?= ""
 OBJC_avr ?= ""
 OBJC_nylon ?= ""
 OBJC ?= ",objc"
+SHARED_LIBRARIES ?= "yes"
 
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
@@ -24,7 +25,7 @@ EXTRA_OECONF_PATHS ?= ""
 
 EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
                 --with-gnu-ld \
-                --enable-shared \
+                ${@['--enable-shared', '--disable-shared'][ "$SHARED_LIBRARIES" != "no" ]} \
                 --enable-target-optspace \
                 --enable-languages=${LANGUAGES} \
                 --enable-threads=posix \
-- 
1.6.0.4



