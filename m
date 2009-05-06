Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M1nJZ-0007PB-Cx
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 22:02:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 965D548E3CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2009 15:55:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08601-07 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  6 May 2009 15:55:59 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 56F7C4A27B3; Wed,  6 May 2009 15:55:58 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 84C8148E3CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2009 15:55:57 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 7E27541732; Wed,  6 May 2009 15:55:57 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2009 15:55:57 -0400
Message-Id: <84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
In-Reply-To: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/2] grub: allow menu.lst to be overridden using GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Wed, 06 May 2009 20:02:01 -0000

If GRUB_CONFIG_PACKAGE is set, don't ship menu.lst with grub. Instead,
RRECOMMEND the config package. This allows overlays to override menu.lst
in a separate package, rather than copying the whole grub package into
the overlay.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/grub/grub_0.97.bb |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/recipes/grub/grub_0.97.bb b/recipes/grub/grub_0.97.bb
index ef37af1..8b68868 100644
--- a/recipes/grub/grub_0.97.bb
+++ b/recipes/grub/grub_0.97.bb
@@ -6,8 +6,16 @@ RDEPENDS = "diffutils"
 PR = "r4"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-           file://automake-1.10.patch;patch=1 \
-           file://menu.lst"
+           file://automake-1.10.patch;patch=1"
+
+# Set to the name of a package containing menu.lst to override the one
+# shipped with this package.
+GRUB_CONFIG_PACKAGE ?= ""
+
+SRC_URI += "${@base_conditional('GRUB_CONFIG_PACKAGE', '', \
+				'file://menu.lst', '', d)}"
+
+RRECOMMENDS += "${GRUB_CONFIG_PACKAGE}"
 
 inherit autotools
 
@@ -22,8 +30,11 @@ do_install_append() {
         install -d ${D}/boot/
 	ln -sf ../usr/lib/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
 
-	# TODO: better use grub-set-default script here?
-	install -m 0644  ${WORKDIR}/menu.lst ${D}/boot/grub
+	if [ -z "${GRUB_CONFIG_PACKAGE}" ]
+	then
+		# TODO: better use grub-set-default script here?
+		install -m 0644  ${WORKDIR}/menu.lst ${D}/boot/grub
+	fi
 }
 
 FILES_${PN}-doc = "${datadir}"
-- 
1.5.6.5



