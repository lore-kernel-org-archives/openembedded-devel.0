Return-Path: <luca@lucaceresoli.net>
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
	[89.40.174.40])
	by mail.openembedded.org (Postfix) with ESMTP id 52B667ED8E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 15:33:27 +0000 (UTC)
Received: from [109.168.11.45] (port=55732 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1hn2Hu-005I7b-Qu; Mon, 15 Jul 2019 16:49:10 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2019 16:49:00 +0200
Message-Id: <20190715144901.25305-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715144901.25305-1-luca@lucaceresoli.net>
References: <20190715144901.25305-1-luca@lucaceresoli.net>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Richard Weinberger <richard@nod.at>
Subject: [meta-filesystems][PATCH 3/4] fuse-exfat: update 1.2.3 -> 1.3.0
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
X-List-Received-Date: Mon, 15 Jul 2019 15:33:27 -0000
Content-Transfer-Encoding: 8bit

1.2.3 is >3 years old now, and several bugfixes have been applied
in the meanwhile.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 .../fuse-exfat/{fuse-exfat_1.2.3.bb => fuse-exfat_1.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.2.3.bb => fuse-exfat_1.3.0.bb} (81%)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
similarity index 81%
rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
index a70653f607f6..572043079911 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
@@ -14,7 +14,7 @@ RRECOMMENDS_${PN} = "util-linux-mount"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
-SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
+SRC_URI[md5sum] = "846b8c36bfa4684719f9e08e9d3a6bff"
+SRC_URI[sha256sum] = "07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3"
 
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.22.0


