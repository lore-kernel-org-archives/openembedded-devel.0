Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B2BB473555
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 09:55:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 01:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,593,1418112000"; d="scan'208";a="653157401"
Received: from choran1-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.31])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2015 01:55:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 09:55:23 +0000
Message-Id: <cd55798dd83dcb02fae5b5d0c158630ccbc1c896.1424166886.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424166886.git.paul.eggleton@linux.intel.com>
References: <cover.1424166886.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424166886.git.paul.eggleton@linux.intel.com>
References: <cover.1424166886.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 1/2] python-django: extend to nativesdk
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
X-List-Received-Date: Tue, 17 Feb 2015 09:55:41 -0000

Allow this to be built for the SDK / buildtools if desired.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-django_1.6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-django_1.6.10.bb b/meta-python/recipes-devtools/python/python-django_1.6.10.bb
index 8623002..a7ca803 100644
--- a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.6.10.bb
@@ -17,3 +17,4 @@ inherit distutils
 
 FILES_${PN} += "${datadir}/django"
 
+BBCLASSEXTEND = "nativesdk"
-- 
1.9.3


