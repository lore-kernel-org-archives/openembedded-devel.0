Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 987AB70178
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 06:33:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2G6XOVL019408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 23:33:24 -0700 (PDT)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 23:33:23 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Mar 2016 14:31:50 +0800
Message-ID: <1458109910-14277-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libsmi: set the SH to the target path
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
X-List-Received-Date: Wed, 16 Mar 2016 06:33:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Set the SH to the target path to avoid host contamination,
which causes the following issue on some hosts:
| WARNING: QA Issue: /usr/bin/smicache_libsmi contained in
  package libsmi requires /usr/bin/sh, but no providers
  found in its RDEPENDS [file-rdeps]
| Computing transaction...error: Can't install
  libsmi-0.4.8-r0.0@corei7_64: no package provides /usr/bin/sh

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 2b35c59..b049067 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c72
 
 inherit autotools
 
+EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh"
+
 do_install_append () {
     install -d ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
-- 
1.9.1


