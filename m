Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E754D6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 10:59:17 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3v4d4h6fH2z3hjTn;
	Fri, 20 Jan 2017 11:59:16 +0100 (CET)
X-Auth-Info: gBbehnXi01SxDUKSw5uhzu5mxlXMuoB/J4Cw6opZzq0=
Received: from kurokawa.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3v4d4h5VVPzvdWV;
	Fri, 20 Jan 2017 11:59:16 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:59:08 +0100
Message-Id: <20170120105908.857-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] picocom: Fix build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2017 10:59:18 -0000

The picocom complains about missing GNU_HASH from the binary during
QA stage, this is because the picocom Makefile overrides CPPFLAGS,
CFLAGS and LDFLAGS. Fix this by passing those as an argument to make.
Moreover, since picocom 1.7 now accepts VERSION variable and the
UUCP_LOCK_DIR is set to /var/lock by default, drop the CPPFLAGS
override altogether and replace it simply with passing VERSION
argument to make to precisely retain the original intention.

Signed-off-by: Marek Vasut <marex@denx.de>
---
V2: Use EXTRA_OEMAKE instead of custom do_configure
V3: Use EXTRA_OEMAKE instead of EXTRA_OEMAKE_append
---
 meta-oe/recipes-support/picocom/picocom_1.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb b/meta-oe/recipes-support/picocom/picocom_1.7.bb
index dbee65609..d2a76c0a9 100644
--- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
+++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
@@ -9,7 +9,8 @@ SRC_URI = "http://picocom.googlecode.com/files/picocom-${PV}.tar.gz"
 SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
 SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e"
 
-CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\" -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
+EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'VERSION=${PV}' \
+		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
 
 do_install () {
     install -d ${D}${bindir}
-- 
2.11.0


