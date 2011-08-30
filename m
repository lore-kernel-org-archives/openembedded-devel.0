Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QyOfQ-0005Gc-JJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 15:47:52 +0200
Received: by gxk3 with SMTP id 3so987501gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=SAMK0mt+xgi+MORixWxclStvWwcQaHT1dqa7/8Lg5RA=;
	b=dyOqitagGsGJHLqqNSF1OaMM6oOk4yLc5mO7v8qvV0XBp7aHhdntUoPQullvxvoAmJ
	V77Yn4u+iXij7d2CMi/AIfzpiqF1yFO8PX03xtyfFqgQ8+bpsWeldN3gQmuuldhHzRWH
	VV+KWElxYIldOfUev9bMUu3G1nTkJRKCcq8h4=
Received: by 10.236.191.101 with SMTP id f65mr33430183yhn.61.1314711778008;
	Tue, 30 Aug 2011 06:42:58 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id a29sm5020072yhj.3.2011.08.30.06.42.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 06:42:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 13:42:43 +0000
Message-Id: <cover.1314710525.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/2] Remove recipes from meta-oe
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
X-List-Received-Date: Tue, 30 Aug 2011 13:47:52 -0000

The following changes since commit 3ebc55d38c82430d7275d457107dd3490b6c967d:

  connman: update to 0.77 (2011-08-26 13:19:40 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  json-glib: drop specific recipe to use OpenEmbedded-Core
  binutils: drop specific recipe to use OpenEmbedded-Core

 .../binutils-2.20.1/110-arm-eabi-conf.patch        |   22 -
 .../152_arm_branches_to_weak_symbols.patch         |  240 -
 .../binutils-2.20.1/200_elflink_%B_fixes.patch     |   65 -
 .../201_elflink_improve_noaddneeded_errors.patch   |   70 -
 .../202_elflink_noaddneeded_vs_weak.patch          |   87 -
 .../binutils-2.20.1/binutils-2.16.1-e300c2c3.patch |   18 -
 .../binutils-2.19.1-ld-sysroot.patch               |   37 -
 .../binutils-2.20.1/binutils-mips-pie.patch        |   29 -
 .../binutils/binutils-2.20.1/binutils-poison.patch |  253 -
 .../binutils-uclibc-100-uclibc-conf.patch          |   34 -
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   50 -
 ...binutils-uclibc-300-006_better_file_error.patch |   43 -
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   47 -
 .../binutils-uclibc-gas-needs-libm.patch           |   38 -
 .../binutils-x86_64_i386_biarch.patch              |   26 -
 .../binutils-2.20.1/libiberty_path_fix.patch       |   20 -
 .../binutils-2.20.1/libtool-2.4-update.patch       |31174 --------------------
 .../binutils-2.20.1/libtool-rpath-fix.patch        |   36 -
 .../binutils/binutils-cross-canadian.inc           |   22 -
 .../binutils/binutils-cross-canadian_2.20.1.bb     |    3 -
 .../recipes-devtools/binutils/binutils-cross.inc   |   26 -
 .../binutils/binutils-cross_2.20.1.bb              |    3 -
 .../binutils/binutils-crosssdk_2.20.1.bb           |   12 -
 meta-oe/recipes-devtools/binutils/binutils.inc     |  149 -
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |   42 -
 .../recipes-devtools/json-glib/json-glib_0.10.4.bb |   14 -
 26 files changed, 0 insertions(+), 32560 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-cross-canadian.inc
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-cross.inc
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils.inc
 delete mode 100644 meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
 delete mode 100644 meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb

-- 
1.7.2.5



