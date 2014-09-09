Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A01826B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:27:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89GRx3a005014
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:27:59 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:27:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:47 -0700
Message-ID: <a0e304f7da3a2a6244291767042fdad27304936f.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410279874.git.liezhi.yang@windriver.com>
References: <cover.1410279874.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/14] arptables: add bash to RDEPENDS_arptables
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
X-List-Received-Date: Tue, 09 Sep 2014 16:28:01 -0000
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


