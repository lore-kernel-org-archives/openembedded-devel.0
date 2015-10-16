Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62E1077167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 23:07:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9GN7CiB023895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 16:07:12 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 16 Oct 2015 16:07:11 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Fri, 16 Oct 2015 16:07:11 -0700
Message-ID: <1445036831-32015-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] lldpad: depends on readline
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
X-List-Received-Date: Fri, 16 Oct 2015 23:07:15 -0000
Content-Type: text/plain

Add a dependency on readline because the header
files are required by configure.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-daemons/lldpad/lldpad_0.9.46.bb        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
index 0c8c5d8..b191df5 100644
--- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
+++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
@@ -5,7 +5,7 @@ Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
-DEPENDS = "libconfig libnl"
+DEPENDS = "libconfig libnl readline"
 SRCREV = "48a5f38778b18d6659a672ccb4640f25c6720827"
 
 SRC_URI = "git://github.com/jrfastab/lldpad.git;protocol=http \
-- 
1.7.9.5


