Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE3F260053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 06:57:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G6vaqE008433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 23:57:36 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 15 Sep 2015 23:57:36 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Sep 2015 14:57:46 +0800
Message-ID: <1442386666-16807-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: add PACKAGECONFIG for x11
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
X-List-Received-Date: Wed, 16 Sep 2015 06:57:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for x11 and enable it when x11 is
included in DISTRO_FEATURES, and specify the correct
path for x-includes and x-libraries to avoid
searching the host libraries.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 6621a70..bb71707 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -39,6 +39,9 @@ EXTRA_OECONF_append_armv4 += " \
     --disable-methodjit \
 "
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
+
 # mozjs requires autoreconf 2.13
 do_configure() {
     ( cd ${S} 
-- 
1.9.1


