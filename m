Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UGFc1-0001Tc-Av
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 22:23:00 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so2788345pbc.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=9O4RDDmD9LP+r09bwp3LlaTx5dS6zb7kyF1rUPEEq/g=;
	b=dcacjLkUrcKZEjnx9uCN6YMpHJsr18WHf8KiiSTYHL+cWLX5P2uJ0hmpekZdG5T0Uz
	N051y6z6bfXQFUiR6R+DopdSrghLedmHTRjaZq5rwWKCCO93jaRQ0IhXSS8VqsoR6BIf
	/Z0KK1G5rfFhaT5lonuuI2mP162zYUQ5VfCLQJZftR4mgG7EDoi9wzA3raAsaUMibREt
	2beBqZml7cRFxG0BDQ45J4K+u38aGbO5slKOr60YQVoOZgc/dvPlgRoHxmqsg1b5h8rd
	Nk1MTHruWOCPA7Zssk4ror6udQ/56nk+oxHRyFMY10u06qiwGmn35jGPwF4X19axkgLI
	tRog==
X-Received: by 10.68.88.67 with SMTP id be3mr9092828pbb.187.1363295173668;
	Thu, 14 Mar 2013 14:06:13 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ti8sm4927246pbc.12.2013.03.14.14.06.12
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Mar 2013 14:06:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Mar 2013 14:05:58 -0700
Message-Id: <1363295158-21771-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] luajit: Fix build with SSTATE enabled
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
X-List-Received-Date: Thu, 14 Mar 2013 21:23:05 -0000

luajit does not honor standard CC variables
so when its built from shared state it does
not compile because --sysroot is wrong.

This patch fixes the problem by passing
the TOOLCHAIN_OPTONS to appropriate flags
so that it gets the correct sysroot value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
index 70cefa8..a7f96f8 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9511885992e4900014e3b13ca6372b7d"
 HOMEPAGE = "http://luajit.org"
 
 DEPENDS += "lua5.1"
-PR = "r1"
+PR = "r2"
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
            file://disable_lj_vm_foldarith_for_spe.patch \
           "
@@ -20,7 +20,7 @@ do_configure_prepend() {
 	sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
 }
 
-EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX}'
+EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} TARGET_CFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
 EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
 EXTRA_OEMAKE_append_i586 = ' HOST_CC="${BUILD_CC} -m32"'
-- 
1.7.9.5



