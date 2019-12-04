Return-Path: <pespin@sysmocom.de>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9710A7C326
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 11:37:43 +0000 (UTC)
Received: from public-mail (mail.sysmocom.de [144.76.43.93])
	by mail.sysmocom.de (Postfix) with ESMTP id 6281D59C5FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 11:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at sysmocom.de
Received: from mail.sysmocom.de ([144.76.43.93])
	by public-mail (mail.sysmocom.de [144.76.43.93]) (amavisd-new,
	port 10024)
	with ESMTP id Y0FtmE70iLE1; Wed,  4 Dec 2019 11:37:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [93.176.190.147])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 32B6559C5F6;
	Wed,  4 Dec 2019 11:37:43 +0000 (UTC)
From: Pau Espin Pedrol <pespin@sysmocom.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2019 12:37:29 +0100
Message-Id: <20191204113729.3317-1-pespin@sysmocom.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203134454.320616-1-pespin@sysmocom.de>
References: <20191203134454.320616-1-pespin@sysmocom.de>
MIME-Version: 1.0
Cc: Pau Espin Pedrol <pespin@sysmocom.de>
Subject: [meta-networking][PATCH v2] lksctp-tools: Add RRECOMENDS kernel-module-sctp for pkg lksctp-tools
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
X-List-Received-Date: Wed, 04 Dec 2019 11:37:43 -0000
Content-Transfer-Encoding: 8bit

Previously the kernel module was only pulled in for ${PN}-utils and
${PN}-ptest, but not for the library itself. As a result, appsexternal
to this recipe  using only the library fail because kernel module is
not installed in the image.
---
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
index 70cea6c7b..3cabc4ff8 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
@@ -65,5 +65,6 @@ FILES_${PN}-dev += " \
 
 FILES_${PN}-utils = "${bindir}/*"
 
+RRECOMMENDS_${PN} += "kernel-module-sctp"
 RRECOMMENDS_${PN}-utils += "kernel-module-sctp"
 RRECOMMENDS_${PN}-ptest += "kernel-module-sctp"
-- 
2.24.0


