Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01F2D6E8C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 21:17:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2KLHLiH023285
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:17:21 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 20 Mar 2014 14:17:21 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe.macdonald@windriver.com>
Date: Thu, 20 Mar 2014 14:17:20 -0700
Message-ID: <1395350240-29372-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] traceroute: fix alternate name
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
X-List-Received-Date: Thu, 20 Mar 2014 21:17:24 -0000
Content-Type: text/plain

traceroute6 for the name is misleading and will interfere
with traceroute6 in iputils making an alternate link to
the traceroute6 binary, so we change the name to traceroute.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-support/traceroute/traceroute_2.0.18.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/traceroute/traceroute_2.0.18.bb b/recipes-support/traceroute/traceroute_2.0.18.bb
index e6718db..83ac5a7 100644
--- a/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -39,5 +39,5 @@ do_install() {
 
 }
 
-ALTERNATIVE_${PN} = "traceroute6"
-ALTERNATIVE_LINK_NAME[traceroute6] = "${bindir}/traceroute"
+ALTERNATIVE_${PN} = "traceroute"
+ALTERNATIVE_LINK_NAME[traceroute] = "${bindir}/traceroute"
-- 
1.7.3.4


