Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMga-0005AH-RP
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 15:02:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 46B1A314A211
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id pYgrLfsz8OXS
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:14 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id A6E60314A20D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:13 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 13:01:13 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 13:01:13 +0000
Message-Id: <1288011673-23904-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lua5.1: install lua5.1.pc properly
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
X-List-Received-Date: Mon, 25 Oct 2010 13:02:03 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/lua/lua5.1_5.1.4.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/lua/lua5.1_5.1.4.bb b/recipes/lua/lua5.1_5.1.4.bb
index e3d56fd..814f83e 100644
--- a/recipes/lua/lua5.1_5.1.4.bb
+++ b/recipes/lua/lua5.1_5.1.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 HOMEPAGE = "http://www.lua.org/"
 
 DEPENDS += "readline"
-PR = "r8"
+PR = "r9"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
            file://lua5.1.pc \
@@ -25,7 +25,6 @@ do_configure_prepend() {
 }
 
 do_compile () {
-	cp ${WORKDIR}/lua5.1.pc ${S}/
 	oe_runmake linux
 }
 
@@ -37,6 +36,8 @@ do_install () {
 		'INSTALL_MAN=${D}${mandir}/man1' \
 		'INSTALL_SHARE=${D}${datadir}/lua' \
 		install
+	install -d ${D}${libdir}/pkgconfig
+	install -m 0644 ${WORKDIR}/lua5.1.pc ${D}${libdir}/pkgconfig/lua5.1.pc
 }
 NATIVE_INSTALL_WORKS = 1
 BBCLASSEXTEND = "native"
-- 
1.7.1



