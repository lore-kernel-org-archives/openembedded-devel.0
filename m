Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1ODDgs-00019W-Pr
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 11:29:52 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id ED2094B00D3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 11:25:53 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 11:25:52 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 May 2010 11:23:33 +0200
Message-Id: <1273915414-3417-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] sed: add gettext dependency
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
X-List-Received-Date: Sat, 15 May 2010 09:29:53 -0000

bitbake meta-toolchain with task-sdk-basae fails without this when
runned from scratch

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/sed/sed_4.1.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/sed/sed_4.1.2.bb b/recipes/sed/sed_4.1.2.bb
index 5cfa531..4838063 100644
--- a/recipes/sed/sed_4.1.2.bb
+++ b/recipes/sed/sed_4.1.2.bb
@@ -6,7 +6,7 @@ PR = "r1"
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 S = "${WORKDIR}/sed-${PV}"
 
-inherit autotools
+inherit autotools gettext
 
 do_install () {
 	autotools_do_install
-- 
1.6.3.3



