Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6139D72F9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 01:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3C1hkI3004153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Apr 2017 18:43:47 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 18:43:46 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 12 Apr 2017 09:42:00 +0800
Message-ID: <20170412014201.23476-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170412014201.23476-1-kai.kang@windriver.com>
References: <20170412014201.23476-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] gflags: correct S and update library install directory
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
X-List-Received-Date: Wed, 12 Apr 2017 01:43:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The current setting of S is not right for multilib. Remove the setting
and use the default value.

And library install directory is not right for multilib either. It fails
with [installed-vs-shipped] QA error:

| ERROR: gflags-2.2.0-r0 do_package: QA Issue: gflags: Files/directories
| were installed but not shipped in any package:
|   /usr/lib/libgflags.so
|   /usr/lib/libgflags_nothreads.so.2.2

Set cmake variable LIB_INSTALL_DIR with ${baselib} to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index b9188c3..f2092a3 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
 SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
-S = "${WORKDIR}/${PN}-${PV}/"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 
 inherit cmake
 
-EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF"
+EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
 
 PACKAGES =+ "${PN}-bash-completion"
 FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
-- 
2.10.1


