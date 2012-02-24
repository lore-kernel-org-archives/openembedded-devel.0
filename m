Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S0xV2-00043M-VE
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 16:56:01 +0100
Received: by localhost (Postfix, from userid 1000)
	id C5F52C2CBC; Fri, 24 Feb 2012 16:47:37 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 16:47:23 +0100
Message-Id: <d82e988dbc2e27158a95ed67e17d80a4cb1781b6.1330097955.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
References: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1330097955.git.sledz@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 6/7] liblockfile: fix SRC_URI for version 1.06
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
X-List-Received-Date: Fri, 24 Feb 2012 15:56:01 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/liblockfile/liblockfile_1.06.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/liblockfile/liblockfile_1.06.bb b/recipes/liblockfile/liblockfile_1.06.bb
index 0235dbd..5d540cb 100644
--- a/recipes/liblockfile/liblockfile_1.06.bb
+++ b/recipes/liblockfile/liblockfile_1.06.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPL"
 PR ="r1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
+SRC_URI = "http://archive.debian.org/debian/pool/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
 	   file://install.patch \
 	   file://configure.patch \
 	   file://ldflags.patch \
-- 
1.7.7



