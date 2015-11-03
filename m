Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A73CE73D46
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 08:18:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA38I6JY024537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Nov 2015 00:18:10 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 Nov 2015 00:18:05 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Nov 2015 16:18:29 +0800
Message-ID: <1446538709-7917-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] libtevent: add missing dependency on libcap
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
X-List-Received-Date: Tue, 03 Nov 2015 08:18:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The built-in library libreplace requires it,
or it fails with:
../lib/replace/system/capability.h:40:28: fatal error: sys/capability.h: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
index 5c7c560..f297f30 100644
--- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPLv3+"
 
-DEPENDS += "talloc"
+DEPENDS += "talloc libcap"
 RDEPENDS_${PN} += "libtalloc"
 RDEPENDS_python-tevent = "python"
 
-- 
1.9.1


