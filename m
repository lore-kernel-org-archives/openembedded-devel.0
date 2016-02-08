Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 448CB760A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:13:30 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 685666926; Mon, 08 Feb 2016 05:58:30 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWX-000Gre-AO; Mon, 08 Feb 2016 10:58:29 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWX-0003i8-9H; Mon, 08 Feb 2016 10:58:29 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 10:57:54 +0000
Message-Id: <1454929083-2966-6-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
References: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-oe][PATCH 05/14] yavta: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Mon, 08 Feb 2016 11:13:30 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to "-e
MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index d4e32de..a192d1a 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -10,6 +10,8 @@ PV = "0.0"
 PR = "r2"
 S = "${WORKDIR}/git"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 # The yavta sources include copies of the headers required to build in the
 # include directory.  The Makefile uses CFLAGS to include these, but since
 # we override the CFLAGS then we need to add this include path back in.
-- 
2.1.4


