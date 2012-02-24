Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S0xV3-00044s-T0
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 16:56:02 +0100
Received: by localhost (Postfix, from userid 1000)
	id B3428C2CBD; Fri, 24 Feb 2012 16:47:38 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 16:47:24 +0100
Message-Id: <cec64cfd68283964f8b8310a09c98479f9df1aab.1330097955.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
References: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1330097955.git.sledz@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 7/7] ltrace: switch from 0.5.3-2 to 0.5.3-2.1
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
X-List-Received-Date: Fri, 24 Feb 2012 15:56:02 -0000

Version 0.5.3-2 is no longer fetchable.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/ltrace/ltrace_0.5.3.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index 53f4892..c9ff0ab 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -11,7 +11,7 @@ COMPATIBLE_TARGET_SYS = (?!sh[34])
 
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
-  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;name=patch \
+  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.1.diff.gz;name=patch \
   file://add-sysdep.patch \
   file://ltrace-compile.patch \
   file://ltrace-mips-remove-CP.patch \
@@ -76,5 +76,5 @@ do_install() {
 
 SRC_URI[archive.md5sum] = "3fa7fe715ab879db08bd06d1d59fd90f"
 SRC_URI[archive.sha256sum] = "5c6627d6d5a98a92ca4661cfc16378b182cc46a9ec479ebf7e6121ee3fe2be32"
-SRC_URI[patch.md5sum] = "969baa0900646c0262b2d505b9fef154"
-SRC_URI[patch.sha256sum] = "f647d7c2f2b0d1dbddd632f3a17fef670aed3ebf5fbe6c1633337acac1eba8e3"
+SRC_URI[patch.md5sum] = "38bc944c53ab602a7854aa4fa71c1f46"
+SRC_URI[patch.sha256sum] = "4c57df94020f2bed90d948f757ca7786796ca9218274764b24f61c502d9ef4f6"
-- 
1.7.7



