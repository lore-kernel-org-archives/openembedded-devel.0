Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A10F77D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:50:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5U6oUq5008124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Jun 2017 23:50:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 29 Jun 2017 23:50:30 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Fri, 30 Jun 2017 14:43:10 +0800
Message-ID: <20170630064310.2061-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] gflags: update SRC_URI with git fetcher
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
X-List-Received-Date: Fri, 30 Jun 2017 06:50:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Because github archives can be regenerated from time to time, update
SRC_URI with git fetcher for gflags.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 5fc28f6..89caa37 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
-SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
+SRC_URI = "git://github.com/gflags/gflags.git"
+SRCREV = "f8a0efe03aa69b3336d8e228b37d4ccb17324b88"
+
+S = "${WORKDIR}/git"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 
-- 
2.10.1


