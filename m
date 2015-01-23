Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1040665C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 02:24:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0N2OxsZ020532
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 18:24:59 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 22 Jan 2015 18:24:59 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jan 2015 10:24:58 +0800
Message-ID: <1421979898-21558-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking][v2] traceroute: give high priority when update-alternatives
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
X-List-Received-Date: Fri, 23 Jan 2015 02:25:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

busybox provides traceroute command and uses the default priority to
update-alternatives, if traceroute is not defined the priority, the
traceroute maybe link to busybox's

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
index 9eb667d..7bdbe16 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
@@ -40,5 +40,6 @@ do_install() {
 
 }
 
+ALTERNATIVE_PRIORITY = "60"
 ALTERNATIVE_${PN} = "traceroute"
 ALTERNATIVE_LINK_NAME[traceroute] = "${bindir}/traceroute"
-- 
2.1.0


