Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9A26BFF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 13:32:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,638,1389740400"; d="scan'208";a="42563053"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 12 Mar 2014 14:33:00 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Wed, 12 Mar 2014 14:33:00 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 12 Mar 2014 14:32:59 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Mar 2014 14:25:46 +0100
Message-ID: <1394630746-10597-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bash-completion: update to version 2.1
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
X-List-Received-Date: Wed, 12 Mar 2014 13:33:05 -0000
Content-Type: text/plain

Notes:
- PARALLEL_MAKE is still required
- inherit allarch is not present because of runtime dependency with bash (TUNE_PKGARCH)

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../bash-completion/bash-completion_2.0.bb         | 37 ----------------------
 .../bash-completion/bash-completion_2.1.bb         | 36 +++++++++++++++++++++
 2 files changed, 36 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
 create mode 100644 meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
deleted file mode 100644
index ad7fd28..0000000
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Programmable Completion for Bash 4"
-HOMEPAGE = "http://bash-completion.alioth.debian.org/"
-BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-PR = "r1"
-
-SECTION = "console/utils"
-
-SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8"
-SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804"
-
-PARALLEL_MAKE = ""
-
-inherit allarch autotools
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/bash_completion.d/
-	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
-
-	# Delete files already provided by util-linux
-	local i
-	for i in cal dmesg hwclock ionice look renice rtcwake; do
-		rm ${D}${datadir}/${BPN}/completions/$i
-	done
-}
-
-RDEPENDS_${PN} = "bash"
-
-# Some recipes are providing ${PN}-bash-completion packages
-PACKAGES =+ "${PN}-extra"
-FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
-    ${datadir}/${BPN}/helpers/"
diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
new file mode 100644
index 0000000..9a0ff35
--- /dev/null
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Programmable Completion for Bash 4"
+HOMEPAGE = "http://bash-completion.alioth.debian.org/"
+BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SECTION = "console/utils"
+
+SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
+SRC_URI[sha256sum] = "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
+
+PARALLEL_MAKE = ""
+
+inherit autotools
+
+do_install_append() {
+	# compatdir
+	install -d ${D}${sysconfdir}/bash_completion.d/
+	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
+
+	# Delete files already provided by util-linux
+	local i
+	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake; do
+		rm ${D}${datadir}/${BPN}/completions/$i
+	done
+}
+
+RDEPENDS_${PN} = "bash"
+
+# Some recipes are providing ${PN}-bash-completion packages
+PACKAGES =+ "${PN}-extra"
+FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
+    ${datadir}/${BPN}/helpers/"
-- 
1.8.5.4


