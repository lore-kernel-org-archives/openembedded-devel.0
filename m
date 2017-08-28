Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8B1278151
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 06:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7S66GUF027130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 23:06:16 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 27 Aug 2017 23:06:15 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 14:05:31 +0800
Message-ID: <20170828060531.13717-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] enscript: set the correct path for perl
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
X-List-Received-Date: Mon, 28 Aug 2017 06:06:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Set the correct path for perl and avoid
searching the one in hosttools that cause
QA issue:

| ERROR: enscript-1.6.6-r0 do_package_qa: QA Issue: /usr/bin/diffpp
  contained in package enscript requires
  /builddir/tmp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rdeps]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 96129880a..65f1ccfa0 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -19,4 +19,6 @@ inherit autotools gettext
 SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
 SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${bindir}/perl"
+
 RDEPENDS_${PN} = "perl"
-- 
2.11.0


