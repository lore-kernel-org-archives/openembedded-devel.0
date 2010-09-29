Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V1-0001kA-2d
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 090203148E48
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id rueFRUnIe+-d; Wed, 29 Sep 2010 22:37:17 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id DEA723148E30;
	Wed, 29 Sep 2010 22:37:09 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:09 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:29 +0000
Message-Id: <1285792594-10032-14-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 13/18] libcddb-1.3.2: initial recipe
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:47 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libcddb/libcddb_1.3.2.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libcddb/libcddb_1.3.2.bb

diff --git a/recipes/libcddb/libcddb_1.3.2.bb b/recipes/libcddb/libcddb_1.3.2.bb
new file mode 100644
index 0000000..8539569
--- /dev/null
+++ b/recipes/libcddb/libcddb_1.3.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A library for accessing a CDDB server"
+HOMEPAGE = "http://libcddb.sourceforge.net"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+MAINTAINER = "Andreas Frisch <andreas.frisch@multimedia-labs.de>"
+
+SRC_URI = "http://downloads.sourceforge.net/${PN}/${P}.tar.bz2"
+
+SRC_URI[md5sum] = "8bb4a6f542197e8e9648ae597cd6bc8a"
+SRC_URI[sha256sum] = "35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b"
+
+inherit autotools pkgconfig
+
-- 
1.7.1



