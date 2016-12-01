Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DF50A71A22
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 21:19:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,726,1477983600"; d="scan'208";a="36305719"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 13:24:45 +0000
Message-Id: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V3 0/7] solves python-pylint runtime dependencies
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
X-List-Received-Date: Thu, 01 Dec 2016 21:19:31 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The python-pylint module is already defined in meta-openembedded,
but runtime dependencies are missing. This series solves all 
dependencies and ensures python-pylint is installed correctly in 
the target.

[YOCTO #10411]

Daniela Plascencia (7):
  python-backports-functools-lru-cache: add new recipe
  python-wrapt: add new recipe
  python-astroid: add new recipe
  python-lazy-object-proxy: add new recipe
  python-setuptools-scm: add native to BBCLASSEXTEND
  python-isort: add new recipe
  python-pylint: modifies package bin to match source and adds
    dependencies

 .../recipes-devtools/python/python-astroid_1.4.8.bb   | 10 ++++++++++
 .../python-backports-functools-lru-cache_1.3.bb       | 14 ++++++++++++++
 .../recipes-devtools/python/python-isort_4.2.5.bb     | 11 +++++++++++
 .../python/python-lazy-object-proxy_1.2.2.bb          | 10 ++++++++++
 .../recipes-devtools/python/python-pylint_1.6.4.bb    | 19 ++++++++++++++++++-
 .../python/python-setuptools-scm_1.15.0.bb            |  6 ++++--
 .../recipes-devtools/python/python-wrapt_1.10.8.bb    | 10 ++++++++++
 7 files changed, 77 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-isort_4.2.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb

-- 
2.6.6


