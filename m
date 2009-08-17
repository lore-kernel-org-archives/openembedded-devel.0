Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Md2XQ-0006US-Nt
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 15:46:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 486A23C386E;
	Mon, 17 Aug 2009 09:29:19 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22092-03; Mon, 17 Aug 2009 09:29:19 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 2957F53783C; Mon, 17 Aug 2009 09:29:19 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 08AD11B9B25;
	Mon, 17 Aug 2009 09:29:18 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 02717A0C0D3; Mon, 17 Aug 2009 09:29:17 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 09:29:02 -0400
Message-Id: <1250515743-10823-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/3] mtools: don't install-info; fixes build on non-Debian hosts
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
X-List-Received-Date: Mon, 17 Aug 2009 13:46:35 -0000

The install-info installed into staging by dpkg-native looks for
/var/backups/infodir.bak and /usr/share/base-files/info.dir on
the build system. On Debian/Ubuntu this is benign, but on other
distros these files don't exist and the install fails.

The info file is still installed, we just don't try to rebuild the
nonexistent directory.

There are cleaner ways to solve this in the long run:

http://dev.openbossa.org/trac/mamona/ticket/139

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/mtools/mtools_4.0.10.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/mtools/mtools_4.0.10.bb b/recipes/mtools/mtools_4.0.10.bb
index b53306a..18fbb7d 100644
--- a/recipes/mtools/mtools_4.0.10.bb
+++ b/recipes/mtools/mtools_4.0.10.bb
@@ -13,12 +13,15 @@ SRC_URI="http://ftp.gnu.org/gnu/mtools/mtools-${PV}.tar.bz2 \
 	file://plainio.patch;patch=1 \
 	file://use-sg_io.patch;patch=1"
 
-S = "${WORKDIR}/mtools-${PV}"
+PR = "r1"
 
 inherit autotools
 
 EXTRA_OECONF = "--without-x"
 
+# Don't try to run install-info -- it'll fail on non-Debian build systems.
+EXTRA_OEMAKE = "INSTALL_INFO="
+
 do_fix_perms() {
 	chmod 644 ${S}/*.c ${S}/*.h
 }
-- 
1.6.3



