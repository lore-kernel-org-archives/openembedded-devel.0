Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3A0478DA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:50:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6VAoFUn004155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:50:15 -0700
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 31 Jul 2018 03:50:14 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Jul 2018 13:40:27 +0300
Message-ID: <1533033627-32108-1-git-send-email-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2-udevrules: Add ALLOW_EMPTY
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
X-List-Received-Date: Tue, 31 Jul 2018 10:50:14 -0000
Content-Type: text/plain

When lvm2 is configured without udev feature, the lvm2-udevrules package
is empty, so do_rootfs will fail to install any other packages that
rdepend on it. (e.g. cryptsetup with meta-secure-core layer since commit
https://github.com/jiazhang0/meta-secure-core/commit/afc3939):

..
Problem: conflicting requests
 - nothing provides lvm2-udevrules needed by cryptsetup
..

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
index 1d9de3d94..388e89117 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
@@ -46,6 +46,7 @@ FILES_${PN}-scripts = " \
 # Specified explicitly for the udev rules, just in case that it does not get picked
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
+ALLOW_EMPTY_${PN}-udevrules = "1"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
-- 
2.17.1


