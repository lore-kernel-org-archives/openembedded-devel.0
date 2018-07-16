Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58B27746A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:22:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6GHMhKd011095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 10:22:44 -0700 (PDT)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 16 Jul 2018 10:22:43 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jul 2018 20:12:50 +0300
Message-ID: <1531761170-23709-1-git-send-email-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] nativesdk-lvm2: Fix installed-vs-shipped errors
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
X-List-Received-Date: Mon, 16 Jul 2018 17:22:43 -0000
Content-Type: text/plain

Fix the following build errors:
$ bitbake nativesdk-lvm2
ERROR: nativesdk-lvm2-2.02.177-r0 do_package: QA Issue: nativesdk-lvm2: Files/directories were installed but not shipped in any package:
  /etc
  /etc/lvm
  /etc/lvm/lvmlocal.conf
  /etc/lvm/lvm.conf
  /etc/lvm/profile
  /etc/lvm/profile/metadata_profile_template.profile
  /etc/lvm/profile/cache-smq.profile
  /etc/lvm/profile/thin-generic.profile
  /etc/lvm/profile/command_profile_template.profile
  /etc/lvm/profile/cache-mq.profile
  /etc/lvm/profile/thin-performance.profile
  /etc/lvm/profile/lvmdbusd.profile
...
nativesdk-lvm2: 12 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
index 390970fcb..34b2e99f2 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
@@ -34,6 +34,8 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+EXTRA_OECONF_append_class-nativesdk = " --with-confdir=${sysconfdir}"
+
 FILES_${PN} += "${libdir}/device-mapper/*.so"
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
@@ -45,6 +47,7 @@ FILES_${PN}-scripts = " \
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
+RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
 RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
-- 
2.17.1


