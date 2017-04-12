Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A35077C87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 05:38:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C5cpdI014497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 22:38:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 22:38:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Apr 2017 13:40:28 +0800
Message-ID: <1491975628-5873-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: set ac_cv_path_PERL to '/usr/bin/env perl'
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
X-List-Received-Date: Wed, 12 Apr 2017 05:38:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Set ac_cv_path_PERL to '/usr/bin/env perl' to fix problem when
/path/to/hosttools/perl is longer than 128.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 13dc4dd..4fb6723 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -70,6 +70,8 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 ap_cv_cc_pie=no \
                 ${SNMP_CONF}"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+
 do_install () {
     # Install init script and default settings
     install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d \
-- 
1.9.1


