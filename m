Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A70065DEF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:01:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3961JSh025482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 23:01:25 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 8 Apr 2014 23:00:25 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 13:58:33 +0800
Message-ID: <1397023113-29936-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
References: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/3] yajl: update to 2.1.0
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
X-List-Received-Date: Wed, 09 Apr 2014 06:01:28 -0000
Content-Type: text/plain

Update yajl to version 2.1.0:
* Correct license
* Update SRCREV
* Drop PR

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../yajl/{yajl_2.0.4.bb => yajl_2.1.0.bb}               | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/yajl/{yajl_2.0.4.bb => yajl_2.1.0.bb} (24%)

diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
similarity index 24%
rename from meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
rename to meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index 9d67e2d..1bf5389 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -1,10 +1,15 @@
-DESCRIPTION = "Yet Another JSON Library - A Portable JSON parsing and serialization library in ANSI C"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74f541bd9a2b6c8e5d0714bcdc327f32"
-PR = "r1"
+SUMMARY = "Yet Another JSON Library."
 
-SRCREV = "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
-SRC_URI = "git://github.com/lloyd/yajl.git"
+DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
+written in ANSI C, and a small validating JSON generator."
+
+HOMEPAGE = "http://lloyd.github.com/yajl/"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=39af6eb42999852bdd3ea00ad120a36d"
+
+SRC_URI = "git://github.com/lloyd/yajl"
+SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4


