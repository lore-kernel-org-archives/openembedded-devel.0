Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1UM9Iw-0002LO-2z
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Mar 2013 05:51:41 +0200
Received: by mail-pd0-f174.google.com with SMTP id p12so745672pdj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 20:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=pIj4wfjNNSv0HjKfAKCaPbY7wCd1cXT6ISXGm/ygRKM=;
	b=r7RZYy2vxEQW/BgGrtiQLveOssfuWfpQL/gS0gl8VVNjryBVlJx9lSJySFzSEnh0+4
	KE60Rk8EzJHHET/Sk4KtZntT/nZEqWCw03ipSx9eoUdm+ZYsKq5+brhiGwtbJGBhnNr/
	hahJjUrmrDFfhSk5QpWzqaGCmLGvloSoaNWmhnjdjNu4gnVVk3gTrSlFc3m/ZR8BZZ5V
	2yTTMfGXcriUpR7VoUOi6or7BzW8PEhGQP36CBJ/A3l4Inps8c9sDRPF7L5rCgupcJgd
	xu0k65WKOAbtKx193KCS5zanE5t4DJjAxTR/5X4NNtAK4BM4QtVc445V8X8du0KVuiQO
	lyFA==
X-Received: by 10.68.102.165 with SMTP id fp5mr11342958pbb.82.1364700870917;
	Sat, 30 Mar 2013 20:34:30 -0700 (PDT)
Received: from widex200.islocal (ZC025230.ppp.dion.ne.jp. [221.119.25.230])
	by mx.google.com with ESMTPS id ti8sm8565629pbc.12.2013.03.30.20.34.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 30 Mar 2013 20:34:28 -0700 (PDT)
Sender: Takeshi Hamasaki <takeshi.ken.hamasaki@gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Mar 2013 12:32:53 +0900
Message-Id: <1364700773-32662-1-git-send-email-hmatrjp@users.sourceforge.jp>
X-Mailer: git-send-email 1.7.10.4
Subject: [oe-core][PATCH] pcmciautils: Correct definition of PCMCIAUTILS_VERSION to avoid segmentation fault
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
X-List-Received-Date: Sun, 31 Mar 2013 03:51:48 -0000

This is to fix segmentation fault from pccardctl command.
-DPCMCIAUTILS_VERSION=\'${PV}\' passes PCMCIAUILTS_VERSION to compiler as a 
multi-character constant, not a string.

---
 meta/recipes-bsp/pcmciautils/pcmciautils.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 80271d6..0651236 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -21,7 +21,7 @@ export udevrulesdir = "${nonarch_base_libdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
-CFLAGS =+ "-DPCMCIAUTILS_VERSION=\'${PV}\'"
+CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
-- 
1.7.10.4



