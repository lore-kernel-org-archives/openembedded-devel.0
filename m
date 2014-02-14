Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C9A796EF8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:38:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,845,1384297200"; d="scan'208";a="41186103"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 14 Feb 2014 14:37:52 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 14 Feb 2014 14:37:52 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Fri, 14 Feb 2014 14:37:52 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Feb 2014 14:32:43 +0100
Message-ID: <1392384763-2300-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
X-OriginalArrivalTime: 14 Feb 2014 13:37:52.0549 (UTC)
	FILETIME=[F5A47D50:01CF2989]
MIME-Version: 1.0
Subject: [PATCH] bash-completion: fix 'files already exist' WARNING message
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
X-List-Received-Date: Fri, 14 Feb 2014 13:38:06 -0000
Content-Type: text/plain

Some bash completion commands are already provided by util-linux recipe.
Also disable parallel build because "symlinks" rule is buggy (see completions/Makefile.am).
---
 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
index 411b9b7..014d122 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -5,6 +5,8 @@ BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+PR = "r1"
+
 SECTION = "console/utils"
 
 SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
@@ -12,11 +14,19 @@ SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8"
 SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804"
 
+PARALLEL_MAKE = ""
+
 inherit allarch autotools
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/bash_completion.d/
 	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
+
+	# Delete files already provided by util-linux
+	local i
+	for i in cal dmesg hwclock ionice look renice rtcwake; do
+		rm ${D}${datadir}/${BPN}/completions/$i
+	done
 }
 
 RDEPENDS_${PN} = "bash"
-- 
1.8.5.4


