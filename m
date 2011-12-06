Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXoiq-0005kd-Bm
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 07:41:48 +0100
Received: by yenq1 with SMTP id q1so1535146yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 22:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gWRbZNu+h3it3o6g3flagMR30eeAHrWE/ukEgaxUl5U=;
	b=CAVpPjwAsQYPIU6MJZtLxLIzgwg8YMCklYEn19QuKADhDo6wXU/e6AtWVRTDeGc9vM
	kcA0p9NorEpaL8TGLWw00y+kmiPsxIwQqzhmKFvgq3pV55sOQJ134CQH2vx7E9UqSyCe
	CJHmNsV3a28BkM0JPZ+vRdnSjxMystmpWTKNs=
Received: by 10.236.170.1 with SMTP id o1mr16827409yhl.16.1323153301055;
	Mon, 05 Dec 2011 22:35:01 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id c44sm35733261yhm.5.2011.12.05.22.34.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 22:35:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2011 22:34:56 -0800
Message-Id: <1323153296-6790-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] eglibc-2.12: Fix build on powerpc
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
X-List-Received-Date: Tue, 06 Dec 2011 06:41:48 -0000

After tune file rework this patch needed an update
so here we come. Fixes the build for powerpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |   12 ++++++------
 meta-oe/recipes-core/eglibc/eglibc_2.12.bb         |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch b/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
index 5c90e5b..70d3aed 100644
--- a/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
+++ b/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
@@ -12,15 +12,15 @@ Upstream-Status: Inappropriate [OE config related]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: libc/ports/sysdeps/powerpc/powerpc32/603e/Implies
+Index: libc/ports/sysdeps/powerpc/powerpc32/603e/fpu/Implies
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/ports/sysdeps/powerpc/powerpc32/603e/Implies	2011-09-17 19:18:57.593292084 -0700
++++ libc/ports/sysdeps/powerpc/powerpc32/603e/fpu/Implies	2011-12-05 22:18:14.151326027 -0800
 @@ -0,0 +1 @@
-+powerpc/powerpc32
-Index: libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/Implies
++powerpc/powerpc32/fpu
+Index: libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/Implies	2011-09-17 19:17:48.613292100 -0700
++++ libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	2011-12-05 22:16:11.751326040 -0800
 @@ -0,0 +1 @@
-+powerpc/powerpc32
++powerpc/powerpc32/603e/fpu
diff --git a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb b/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
index 7ab8033..3509e8d 100644
--- a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require recipes-core/eglibc/eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r27"
+PR = "r28"
 
 SRCREV = "15872"
 
-- 
1.7.5.4



