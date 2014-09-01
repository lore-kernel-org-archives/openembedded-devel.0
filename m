Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3767712F7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIbLL029611
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:38 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:25 -0700
Message-ID: <1ab2a6a84a7ad1e930aadb138a807a58ee65d065.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] arptables: add bash to RDEPENDS_arptables
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:37 -0000
Content-Type: text/plain

Bashism:
possible bashism in arptables/etc/init.d/arptables line 14 (should be '.', not 'source'):
source /etc/init.d/functions
possible bashism in arptables/etc/init.d/arptables line 96 ($"foo" should be eval_gettext "foo"):
        echo $"Usage $0 {start|stop|restart|condrestart|save|status}"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
index 74f81b5..94920f9 100644
--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 PR = "r2"
 
-RDEPENDS_${PN} += "perl"
+RDEPENDS_${PN} += "perl bash"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 SRC_URI = " \
-- 
1.7.9.5


