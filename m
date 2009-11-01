Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1N4TkS-0002BO-5X
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Nov 2009 07:17:11 +0100
Received: by ywh7 with SMTP id 7so3801813ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2009 23:15:58 -0700 (PDT)
Received: by 10.91.19.15 with SMTP id w15mr7555197agi.12.1257056156333;
	Sat, 31 Oct 2009 23:15:56 -0700 (PDT)
Received: from localhost.localdomain ([189.115.166.231])
	by mx.google.com with ESMTPS id 23sm2065320yxe.18.2009.10.31.23.15.54
	(version=SSLv3 cipher=RC4-MD5); Sat, 31 Oct 2009 23:15:55 -0700 (PDT)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Nov 2009 03:10:02 -0300
Message-Id: <1257055802-7391-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] groff-1.19.2: avoid running install-info when installing the package
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
X-List-Received-Date: Sun, 01 Nov 2009 06:17:11 -0000

Otherwise the package will add the usr/share/info/dir file and can
conflict with other problematically packages.

Solution based on debian rules provided by the debian package.

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 recipes/groff/groff_1.19.2.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/groff/groff_1.19.2.bb b/recipes/groff/groff_1.19.2.bb
index 5598263..03752fa 100644
--- a/recipes/groff/groff_1.19.2.bb
+++ b/recipes/groff/groff_1.19.2.bb
@@ -1,18 +1,20 @@
 DESCRIPTION = "GNU roff"
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz \
 	           file://Makefile.in.patch;patch=1 \
 	           file://Makefile.sub.patch;patch=1 \
 	           file://groff.patch;patch=1"
 
+inherit autotools
+
 PARALLEL_MAKE = ""
 # prefix and exec-prefix are broken and the .in file is broken too
 # and can't be autoreconf'ed, so specify every dir
 EXTRA_OECONF="--without-x --prefix=${D} --exec-prefix=${D} --bindir=${D}${bindir} --datadir=${D}${datadir} --mandir=${D}${datadir}/man --infodir=${D}${datadir}/info --with-appresdir=${D}${datadir}"
-inherit autotools
+EXTRA_OEMAKE = "INSTALL_INFO=:"
 
 do_configure() {
 	oe_runconf
-- 
1.6.5



