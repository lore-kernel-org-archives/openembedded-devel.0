Return-Path: <Chunguang.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1550D60111
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 09:44:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v059iSkN018830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jan 2017 01:44:28 -0800 (PST)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 5 Jan 2017 01:44:27 -0800
From: <chunguang.yang@windriver.com>
To: <ting.liu@freescale.com>, <Martin.Jansa@gmail.com>
Date: Thu, 5 Jan 2017 04:44:26 -0500
Message-ID: <20170105094426.138799-1-chunguang.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/1] lcov: fix env command argument pass issue
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
X-List-Received-Date: Thu, 05 Jan 2017 09:44:33 -0000
Content-Type: text/plain

From: chunguang yang <chunguang.yang@windriver.com>

when exec lcov in bash, the following error will appear:

/usr/bin/env: 'perl -w': No such file or directory

perl uses the -w option to enable many warnings. But the
env command can't pass the argument to perl, instead it
treate perl -w as a file. To fix this issue, just keep
the origin perl path and not use env command.

Signed-off-by: chunguang yang <chunguang.yang@windriver.com>
---
 meta-oe/recipes-support/lcov/lcov_1.11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.11.bb b/meta-oe/recipes-support/lcov/lcov_1.11.bb
index 114bd84cd..2f9ac336e 100644
--- a/meta-oe/recipes-support/lcov/lcov_1.11.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.11.bb
@@ -23,6 +23,5 @@ SRC_URI[sha256sum] = "c282de8d678ecbfda32ce4b5c85fc02f77c2a39a062f068bd8e774d29d
 
 do_install() {
     oe_runmake install PREFIX=${D}
-    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/*
 }
 
-- 
2.11.0


