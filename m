Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03D3377811
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 07:05:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5Q751sN029518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 00:05:01 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Jun 2017 00:05:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jun 2017 15:04:59 +0800
Message-ID: <20170626070459.3973-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] snort: fix for snort.conf
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
X-List-Received-Date: Mon, 26 Jun 2017 07:05:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The /etc/snort/snort.conf doesn't work since
there are hardcoded paths and lib names, and
it tries to include many rules that are not
provided.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index 57a04f2e7..dfd6ba971 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -57,6 +57,17 @@ do_install_append() {
     for i in map config conf dtd; do
         cp ${S}/etc/*.$i ${D}${sysconfdir}/snort/
     done
+
+    # fix the hardcoded path and lib name
+    # comment out the rules that are not provided
+    sed -i -e 's#/usr/local/lib#${libdir}#' \
+           -e 's#\.\./\(.*rules\)#${sysconfdir}/snort/\1#' \
+           -e 's#\(libsf_engine.so\)#\1.0#' \
+           -e 's/^\(include $RULE_PATH\)/#\1/' \
+           -e 's/^\(dynamicdetection\)/#\1/' \
+           -e '/preprocessor reputation/,/blacklist/ s/^/#/' \
+           ${D}${sysconfdir}/snort/snort.conf
+
     cp ${S}/preproc_rules/*.rules ${D}${sysconfdir}/snort/preproc_rules/
     install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
     mkdir -p ${D}${localstatedir}/log/snort
-- 
2.11.0


