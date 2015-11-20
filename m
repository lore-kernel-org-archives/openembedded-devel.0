Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF96C6072B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:33:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK9XvFW016615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:33:57 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 01:32:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 01:32:44 -0800
Message-ID: <38e43117d054d710c263514f45aaa69c14b53d51.1448011904.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448011904.git.liezhi.yang@windriver.com>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] cim-schema-exper: fix host-user-contaminated
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
X-List-Received-Date: Fri, 20 Nov 2015 09:33:56 -0000
Content-Type: text/plain

Issue: LIN8-1632

Fixed:
cim-schema-exper-2.39.0: cim-schema-exper: /cim-schema-exper/usr/share/mof/cimv2.39.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
cim-schema-final-2.40.0: cim-schema-final: /cim-schema-final/usr/share/mof/cimv2.40.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
lib32-cim-schema-exper-2.39.0: lib32-cim-schema-exper: /lib32-cim-schema-exper/usr/share/mof/cimv2.39.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
lib32-cim-schema-final-2.40.0: lib32-cim-schema-final: /lib32-cim-schema-final/usr/share/mof/cimv2.40.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

It uses cp -a to install the files, so fix the owner to root:root

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../cim-schema/cim-schema-exper_2.39.0.bb          |    1 +
 .../cim-schema/cim-schema-final_2.40.0.bb          |    1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
index 62e50df..e4ed7b3 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
@@ -17,6 +17,7 @@ do_install() {
         install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
         cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+        chown -R root:root ${D}${datadir}/mof/cimv${PV}
         for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
                 sed -i -e 's/\r//g' $i
         done
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index 1694f31..7ab9c4d 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -22,6 +22,7 @@ do_install() {
         install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
         cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+        chown -R root:root ${D}${datadir}/mof/cimv${PV}/
         for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
                 sed -i -e 's/\r//g' $i
         done
-- 
1.7.9.5


