Return-Path: <pespin@sysmocom.de>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id A2E2160116
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 13:45:01 +0000 (UTC)
Received: from public-mail (mail.sysmocom.de [144.76.43.93])
	by mail.sysmocom.de (Postfix) with ESMTP id 5645F590850
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 13:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at sysmocom.de
Received: from mail.sysmocom.de ([144.76.43.93])
	by public-mail (mail.sysmocom.de [144.76.43.93]) (amavisd-new,
	port 10024)
	with ESMTP id PG9tQorKTwng; Tue,  3 Dec 2019 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [93.176.190.147])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 5197D590848;
	Tue,  3 Dec 2019 13:45:01 +0000 (UTC)
From: Pau Espin Pedrol <pespin@sysmocom.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Dec 2019 14:44:54 +0100
Message-Id: <20191203134454.320616-1-pespin@sysmocom.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: Pau Espin Pedrol <pespin@sysmocom.de>
Subject: [meta-networking][PATCH] lksctp-tools: Add RRECOMENDS kernel-module-sctp for pkg lksctp-tools
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
X-List-Received-Date: Tue, 03 Dec 2019 13:45:01 -0000
Content-Transfer-Encoding: 8bit

Previously the kernel module was only pulled in for ${PN}-utils and
${PN}-ptest, but not for the library itself. As a result, appsexternal
to this recipe  using only the library fail because kernel module is
not installed in the image.
---
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
index 70cea6c7b..25270016d 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
@@ -12,6 +12,7 @@ SRCREV = "1b077af62d83d53c34b1bde8bad6648149d5edf9"
 
 PV .= "+git${SRCPV}"
 LK_REL = "1.0.18"
+PR = "r1"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git \
@@ -65,5 +66,6 @@ FILES_${PN}-dev += " \
 
 FILES_${PN}-utils = "${bindir}/*"
 
+RRECOMMENDS_${PN} += "kernel-module-sctp"
 RRECOMMENDS_${PN}-utils += "kernel-module-sctp"
 RRECOMMENDS_${PN}-ptest += "kernel-module-sctp"
-- 
2.24.0


