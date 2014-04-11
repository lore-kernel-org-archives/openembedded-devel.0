Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAA365DF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 08:34:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3B8YYPn018216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 01:34:34 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Apr 2014 01:34:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Apr 2014 16:35:25 +0800
Message-ID: <1397205325-22201-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libedit: update version to 20130712-3.1
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
X-List-Received-Date: Fri, 11 Apr 2014 08:34:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- Add DESCRIPTION.
- Include the complete version number in the bb file name.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...libedit_20121213.bb => libedit_20130712-3.1.bb} |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20121213.bb => libedit_20130712-3.1.bb} (47%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb b/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
similarity index 47%
rename from meta-oe/recipes-devtools/libedit/libedit_20121213.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
index bd02d86..1f76bb2 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "BSD replacement for libreadline"
+DESCRIPTION = "Command line editor library providing generic line editing, \
+history, and tokenization functions"
 HOMEPAGE = "http://www.thrysoee.dk/editline/"
 SECTION = "libs"
 LICENSE = "BSD"
@@ -10,9 +12,9 @@ inherit autotools
 
 # upstream site does not allow wget's User-Agent
 FETCHCMD_wget += "-U bitbake"
-SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}-3.0.tar.gz"
+SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz"
 
-S = "${WORKDIR}/${BPN}-${PV}-3.0"
+S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "f475f50fe7467c1074c0fbae8b5bca1a"
-SRC_URI[sha256sum] = "0379e4a73c219f260e6d16adbc2e87635532ebb4c5a83a7399f231dc40108d1f"
+SRC_URI[md5sum] = "0891336c697362727a1fa7e60c5cb96c"
+SRC_URI[sha256sum] = "5d9b1a9dd66f1fe28bbd98e4d8ed1a22d8da0d08d902407dcc4a0702c8d88a37"
-- 
1.7.9.5


