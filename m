Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39A4571A03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:16:47 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36973380"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:22:04 +0000
Message-Id: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V2 0/6] solves python-pylint runtime dependencies
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
X-List-Received-Date: Tue, 29 Nov 2016 17:16:48 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The python-pylint module is already defined in meta-openembedded,
but runtime dependencies are missing. This series solves all 
dependencies and ensures python-pylint is installed correctly in 
the target.

[YOCTO #10411]

Daniela Plascencia (6):
  python-backports-functools-lru-cache: add new recipe
  python-wrapt: add new recipe
  python-astroid: add new recipe
  python-lazy-object-proxy: add new recipe
  python-setuptools-scm: add native to BBCLASSEXTEND
  python-pylint: modifies package bin to match source and adds
    dependencies

 .../recipes-devtools/python/python-astroid_1.4.8.bb    | 10 ++++++++++
 .../python/python-backports-functools-lru-cache_1.3.bb | 14 ++++++++++++++
 .../python/python-lazy-object-proxy_1.2.2.bb           | 10 ++++++++++
 .../recipes-devtools/python/python-pylint_1.6.4.bb     | 18 +++++++++++++++++-
 .../python/python-setuptools-scm_1.15.0.bb             |  6 ++++--
 .../recipes-devtools/python/python-wrapt_1.10.8.bb     | 10 ++++++++++
 6 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb

-- 
2.6.6


