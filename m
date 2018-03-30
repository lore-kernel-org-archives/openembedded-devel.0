Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF3F7476A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 22:39:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 15:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,383,1517904000"; d="scan'208";a="212734797"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga005.jf.intel.com with ESMTP; 30 Mar 2018 15:39:58 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:39:54 -0700
Message-Id: <20180330223954.55841-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] python3-pytest: fix broken fetch (3.4.1 -> 3.4.2)
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
X-List-Received-Date: Fri, 30 Mar 2018 22:39:58 -0000

Fixes: 99d18a6bc1a915ef5f07116e0fe684f56825a165

In above commit, only the python2 recipe was updated, but
python3 recipe also uses the SRC_URI from python-pytest.inc
and is currently broken (do_fetch).

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/{python3-pytest_3.4.1.bb => python3-pytest_3.4.2.bb}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.4.1.bb => python3-pytest_3.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
-- 
2.14.3


