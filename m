Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 790D76FF78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 09:05:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4N95pQV026913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 May 2017 02:05:51 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 23 May 2017 02:05:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Tue, 23 May 2017 17:05:49 +0800
Message-ID: <20170523090549.19700-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] open-isns: fix QA issue
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
X-List-Received-Date: Tue, 23 May 2017 09:05:52 -0000
Content-Type: text/plain

Fix the following QA issue.

ERROR: open-isns-0.97-r0 do_package: QA Issue: open-isns: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/isnsd.socket
  /usr/lib/systemd/system/isnsd.service

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/open-isns/open-isns_0.97.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
index 828d1166d..420ef5be0 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
@@ -26,10 +26,11 @@ inherit systemd autotools-brokensep distro_features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 EXTRA_OECONF = " --prefix=${prefix} --enable-shared"
+EXTRA_OEMAKE += "SYSTEMDDIR=${D}${systemd_unitdir}/system"
 
 do_install_append () {
     oe_runmake INCDIR=${D}${includedir}/libisns/ install_hdrs
     oe_runmake LIBDIR=${D}${libdir} install_lib
 }
 
-FILES_${PN} += "${libdir}"
+FILES_${PN} += "${libdir} ${systemd_unitdir}"
-- 
2.11.0


