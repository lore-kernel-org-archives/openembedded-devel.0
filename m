Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgU-0001VZ-CW
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:06 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENwe5009655
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:58 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENwgx030232
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:58 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:58 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAon008382;
	Mon, 21 May 2012 09:23:56 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:16 -0500
Message-ID: <1337610609-1173-18-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 17/70] libcap2: Update LICENSE field version to GPLv2 or BSD
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
X-List-Received-Date: Mon, 21 May 2012 14:34:07 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to BSD or GPLv2
  to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libcap/libcap2_2.20.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libcap/libcap2_2.20.bb b/recipes/libcap/libcap2_2.20.bb
index 8f7dc3b..e3a18ec 100644
--- a/recipes/libcap/libcap2_2.20.bb
+++ b/recipes/libcap/libcap2_2.20.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly POSIX 6) draft 15 capabilities."
 PRIORITY = "optional"
 SECTION = "libs"
-LICENSE = "GPL"
+LICENSE = "BSD | GPLv2"
 DEPENDS = "bison-native flex-native attr ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r0"
+PR = "r1"
 
 BUILD_CFLAGS += "-I${S}/libcap/include"
 CFLAGS += "-I${S}/libcap/include"
-- 
1.7.0.4



