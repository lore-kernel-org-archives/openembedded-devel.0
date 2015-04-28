Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B715716CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 06:05:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3S653nK025554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 23:05:03 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 23:05:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 14:04:59 +0800
Message-ID: <1430201100-15248-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1430201100-15248-1-git-send-email-rongqing.li@windriver.com>
References: <1430201100-15248-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3][meta-networking] opensaf: RDEPENDS on python and bash
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
X-List-Received-Date: Tue, 28 Apr 2015 06:05:02 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

python:
opensaf/usr/share/opensaf/samples/immsv/immom_python/immom.py

bash:
opensaf/usr/share/opensaf/immxml/verify.sh
opensaf/usr/share/opensaf/immxml/immxml-modify-config
opensaf/usr/share/opensaf/immxml/immxml-configure
opensaf/usr/share/opensaf/immxml/immxml-clustersize
opensaf/usr/share/opensaf/immxml/immxml-nodegen
opensaf/usr/share/opensaf/samples/INSTALL
opensaf/usr/share/opensaf/samples/smfsv/campaigns/smf-verify
opensaf/usr/lib/opensaf/configure_tipc

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index 5fe929c..6d31b1c 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -33,6 +33,8 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 FILES_${PN} += "${localstatedir}/run"
 
+RDEPENDS_${PN} += "bash python"
+
 INSANE_SKIP_${PN} = "dev-so"
 
 do_install_append() {
-- 
2.1.0


