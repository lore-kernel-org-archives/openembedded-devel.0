Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 189477325A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:13:35 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 685666938; Mon, 08 Feb 2016 05:58:36 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWc-000Gs8-Ui; Mon, 08 Feb 2016 10:58:34 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWc-0004QJ-Tj; Mon, 08 Feb 2016 10:58:34 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 10:58:01 +0000
Message-Id: <1454929083-2966-13-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
References: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-networking][PATCH 12/14] pptp-linux: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Mon, 08 Feb 2016 11:13:35 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
this explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
index f14d8a5..003361c 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
@@ -21,6 +21,8 @@ SRC_URI[sha256sum] = "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d3
 
 S = "${WORKDIR}/pptp-${PV}"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_install() {
     install -d ${D}${sbindir} ${D}${sysconfdir}/ppp ${D}${mandir}/man8
     install -m 555 pptp ${D}${sbindir}
-- 
2.1.4


