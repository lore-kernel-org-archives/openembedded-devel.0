Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 839A56E488
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 08:46:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,493,1384297200"; d="scan'208";a="38154203"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 16 Dec 2013 09:46:39 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	id 14.2.318.1; Mon, 16 Dec 2013 09:46:38 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Mon, 16 Dec 2013 09:46:38 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2013 09:41:39 +0100
Message-ID: <1387183299-7468-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 16 Dec 2013 08:46:38.0700 (UTC)
	FILETIME=[55A1BAC0:01CEFA3B]
MIME-Version: 1.0
Subject: [RFC PATCHv2] bash-completion: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 08:46:44 -0000
Content-Type: text/plain

This new recipe discards the old recipe in OE-Classic:
http://layers.openembedded.org/layerindex/oe-classic/recipe/16369/

When building ready-to-use images (like .vmdk), it is sometimes convenient to have a fancy shell environment.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../bash-completion/bash-completion_2.0.bb         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
new file mode 100644
index 0000000..c70d988
--- /dev/null
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Programmable Completion for Bash 4"
+HOMEPAGE = "http://bash-completion.alioth.debian.org/"
+BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SECTION = "console/utils"
+RDEPENDS_${PN} = "bash"
+PE = "1"
+
+SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8"
+SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804"
+
+inherit allarch autotools
+
+do_configure() {
+	oe_runconf
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/bash_completion.d/
+	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
+}
+
+# Some recipes are providing ${PN}-bash-completion packages
+PACKAGES_prepend += "${PN}-extra "
+FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
+    ${datadir}/${BPN}/helpers/"
-- 
1.8.2.1


