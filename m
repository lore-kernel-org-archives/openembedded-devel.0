Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F68478190
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 03:31:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M3VliF003161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Aug 2017 20:31:47 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 20:31:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 20:31:46 -0700
Message-ID: <20170822033146.11680-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] glibmm: fix perl path
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
X-List-Received-Date: Tue, 22 Aug 2017 03:31:47 -0000
Content-Type: text/plain

Fixed:
ERROR: QA Issue: /usr/lib/glibmm-2.4/proc/gmmproc contained in package glibmm-dev requires /path/to/tmp/hosttools/perl, but no providers found in RDEPENDS_glibmm-dev? [file-rdeps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
index 401b3b2..9cc558f 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
@@ -23,6 +23,10 @@ do_install_append() {
 
     install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
     install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/ || true
+
+    for i in generate_wrap_init.pl gmmproc; do
+        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.4/proc/$i
+    done
 }
 
 FILES_${PN} = "${libdir}/lib*.so.*"
-- 
2.10.2


