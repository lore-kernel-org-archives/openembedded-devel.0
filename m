Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A78B71A95
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 05:45:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH5jCAo017667
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:45:12 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 21:45:11 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Nov 2016 13:37:37 +0800
Message-ID: <20161117053737.309-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161117053737.309-1-kai.kang@windriver.com>
References: <20161117053737.309-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] curlpp: fix qa issue of do_configure
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
X-List-Received-Date: Thu, 17 Nov 2016 05:45:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

curlpp is configured with boost by default. And it searches boost
directory on build machine. If boost is installed on build machine, then
causes qa issue:

| ERROR: curlpp-0.7.3-r0 do_configure: This autoconf log indicates
| errors, it looked at host include and/or library paths while
| determining system capabilities.

Pass the boost directory in ${STAGING_DIR_HOST} to configure script to
disable search on build machine to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 1848aa6..c3a242a 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a
 
 inherit autotools-brokensep pkgconfig binconfig
 
+EXTRA_OECONF = "--with-boost=${STAGING_DIR_HOST}${prefix}"
 # Upstream is currently working on porting the code to use std::unique_ptr instead of the
 # deprecated auto_ptr.  For now, ignore the issue.
 CXXFLAGS += "-Wno-error=deprecated-declarations"
-- 
2.10.1


