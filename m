Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 41615731C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:20:44 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 686380844; Tue, 09 Feb 2016 10:20:46 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aTA5s-0009KQ-TD; Tue, 09 Feb 2016 15:20:44 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aTA5s-00014s-SG; Tue, 09 Feb 2016 15:20:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2016 15:20:29 +0000
Message-Id: <1455031231-4096-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455031231-4096-1-git-send-email-mac@mcrowe.com>
References: <1455031231-4096-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/3] libmatroska: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Tue, 09 Feb 2016 15:20:45 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
this explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
index 95ea93d..19a7edb 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "f61b2e5086f4bb9d24a43cc8af43a719"
 SRC_URI[sha256sum] = "086f21873e925679babdabf793c3bb85c353d0cd79423543a3355e08e8a4efb7"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_compile() {
     cd ${S}/make/linux
     oe_runmake CROSS="${TARGET_PREFIX}"
-- 
2.1.4


