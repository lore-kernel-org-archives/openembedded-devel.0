Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 224C973189
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 05:52:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5S5qt3s010754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2016 22:52:56 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 27 Jun 2016 22:52:55 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jun 2016 01:52:54 -0400
Message-ID: <1467093174-75463-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libtevent: Add back the dependency on libcap
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
X-List-Received-Date: Tue, 28 Jun 2016 05:52:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The dependency on libcap was removed by:
418d59459148621d593054dc397335d24165a655
"libtevent: rework dependencies for deterministic build"

but in fact there was not a patch to properly avoid
dependency on libcap then we got error:
|In file included from ../lib/replace/test/testsuite.c:34:0:
|../lib/replace/system/capability.h:40:28: fatal error: sys/capability.h: No such file or directory
|compilation terminated.

so add the dependency back.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
index 3f5d7f4..28759ec 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPLv3+"
 
-DEPENDS += "libaio libbsd libtalloc"
+DEPENDS += "libaio libbsd libtalloc libcap"
 RDEPENDS_python-tevent = "python"
 
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
-- 
2.8.1


