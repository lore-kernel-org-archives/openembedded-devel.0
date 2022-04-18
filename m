Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E299C64E90
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.37044.1650266776491478537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 00:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23I7QEVs023409
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 18 Apr 2022 00:26:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23I7QEH4016077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Apr 2022 00:26:14 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Apr 2022 00:26:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Apr 2022 00:26:13 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 18 Apr 2022 00:26:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] libconfig-general-perl: move from
 meta-openstack
Date: Mon, 18 Apr 2022 15:26:10 +0800
Message-ID: <20220418072610.991233-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418072610.991233-1-mingli.yu@windriver.com>
References: 
 <CAMKF1srNUtTXo2JkX4qF58PdZr1NnF7D3ssutUQ8DyX3A4FtBA@mail.gmail.com>
 <20220418072610.991233-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96682

From: Mingli Yu <mingli.yu@windriver.com>

tgt rdepends on libconfig-general-perl.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../perl/libconfig-general-perl_2.63.bb       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb

diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
new file mode 100644
index 000000000..b12e2e4ba
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Config file parser module"
+HOMEPAGE = "http://search.cpan.org/dist/Config-General/"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=3ba4bbac1e79a08332688196f637d2b2"
+
+SRCNAME = "Config-General"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e3ea2a6dc76931cf638b5227aceabf60"
+SRC_URI[sha256sum] = "0a9bf977b8aabe76343e88095d2296c8a422410fd2a05a1901f2b20e2e1f6fad"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+COMPATIBLE_HOST:libc-musl = "null"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+
+do_compile() {
+    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+    cpan_do_compile
+}
-- 
2.25.1


