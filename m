Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9296C149
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2019 05:56:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2D5uh7I026995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 22:56:44 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 12 Mar 2019 22:56:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 13 Mar 2019 13:56:41 +0800
Message-ID: <1552456601-5383-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hdf5: fix installed-vs-shipped QA WARNING
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
X-List-Received-Date: Wed, 13 Mar 2019 05:56:44 -0000
Content-Type: text/plain

While baselib = 'lib64', there is a installed-vs-shipped QA WARNING
...
WARNING: QA Issue: hdf5: Files/directories were installed but not shipped in any package:
  /usr/lib/libhdf5_hl_cpp.so.1.8.19
  /usr/lib/libhdf5.so
...

Set variable HDF5_INSTALL_LIB_DIR to replace hardcode `lib'.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
index 7ea6f64..cec3432 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
@@ -37,6 +37,7 @@ EXTRA_OECMAKE = " \
     -DH5_NO_ALIGNMENT_RESTRICTIONS_RUN=0 \
     -DH5_NO_ALIGNMENT_RESTRICTIONS_RUN__TRYRUN_OUTPUT= \
     -DCMAKE_INSTALL_PREFIX='${prefix}' \
+    -DHDF5_INSTALL_LIB_DIR='${baselib}' \
 "
 
 do_unpack[postfuncs] += "gen_hd5file"
-- 
2.7.4


