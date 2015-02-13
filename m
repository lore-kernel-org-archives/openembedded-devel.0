Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA392733C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 13:30:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1DDUOYe028012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 05:30:24 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 05:30:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Feb 2015 05:30:23 -0800
Message-ID: <1423834223-25626-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423834223-25626-1-git-send-email-liezhi.yang@windriver.com>
References: <1423834223-25626-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] opensaf: RDEPENDS on python and bash
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
X-List-Received-Date: Fri, 13 Feb 2015 13:30:24 -0000
Content-Type: text/plain

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
 .../recipes-daemons/opensaf/opensaf_4.5.0.bb       |    2 ++
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
1.7.9.5


