Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1989865CFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 07:26:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3N7QTRv010475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 00:26:30 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 00:26:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Apr 2014 03:26:27 -0400
Message-ID: <1398237987-23458-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] gd: split the binaries to package gd-tools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Apr 2014 07:26:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

As most linux distribution do, gd only includes the library,
and split all the command line tools into gd-tools, and add
the perl dependcy since one of the tools is a perl script.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/gd/gd_2.1.0.bb |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index a260cd6..d92e639 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -30,3 +30,12 @@ EXTRA_OECONF += " --disable-rpath \
                   --without-x"
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
+
+PACKAGES += "${PN}-tools"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-tools = "${bindir}/*"
+
+PROVIDES += "${PN}-tools"
+RPROVIDES_${PN}-tools = "${PN}-tools"
+RDEPENDS_${PN}-tools = "perl perl-module-strict"
-- 
1.7.9.5


