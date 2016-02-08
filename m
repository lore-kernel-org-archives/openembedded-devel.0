Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1431075C51
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:13:33 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 685666945; Mon, 08 Feb 2016 05:58:34 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWb-000Gru-9q; Mon, 08 Feb 2016 10:58:33 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWb-0004Bv-8K; Mon, 08 Feb 2016 10:58:33 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 10:57:58 +0000
Message-Id: <1454929083-2966-10-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
References: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-multimedia][PATCH 09/14] libebml: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Mon, 08 Feb 2016 11:13:33 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
this explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index 877e176..7cc0ec7 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -6,6 +6,8 @@ SRC_URI = "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2"
 SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
 SRC_URI[sha256sum] = "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_compile() {
     cd ${S}/make/linux
     oe_runmake CROSS="${TARGET_PREFIX}"
-- 
2.1.4


