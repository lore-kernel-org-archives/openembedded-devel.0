Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBEB78082
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:20:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1184927622"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 12:20:11 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 12:20:01 -0700
Message-Id: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH 0/5] adds Python3 support for python-pylint's and its dependencies
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
X-List-Received-Date: Tue, 20 Jun 2017 19:20:13 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Extends python-pylint's and its dependencies recipes for Python3 support.

Daniela Plascencia (5):
  python-pylint: adds Python3 support
  python-isort: adds Python3 support
  python-lazy-object-proxy: adds Python3 support
  python-astroid: adds Python3 support
  python-wrapt: adds Python3 support

 .../recipes-devtools/python/python-astroid.inc     | 20 ++++++++++
 .../python/python-astroid_1.5.3.bb                 | 22 +++--------
 .../recipes-devtools/python/python-isort.inc       | 10 +++++
 .../recipes-devtools/python/python-isort_4.2.15.bb | 13 +-----
 .../python/python-lazy-object-proxy.inc            | 10 +++++
 .../python/python-lazy-object-proxy_1.3.1.bb       | 12 +-----
 .../recipes-devtools/python/python-pylint.inc      | 31 +++++++++++++++
 .../recipes-devtools/python/python-pylint_1.6.5.bb | 46 ++--------------------
 .../recipes-devtools/python/python-wrapt.inc       | 15 +++++++
 .../python/python-wrapt_1.10.10.bb                 | 17 +-------
 .../python/python3-astroid_1.5.3.bb                |  2 +
 .../python/python3-isort_4.2.15.bb                 |  2 +
 .../python/python3-lazy-object-proxy_1.3.1.bb      |  2 +
 .../python/python3-pylint_1.6.5.bb                 |  2 +
 .../python/python3-wrapt_1.10.10.bb                |  2 +
 15 files changed, 111 insertions(+), 95 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-astroid.inc
 create mode 100644 meta-python/recipes-devtools/python/python-isort.inc
 create mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pylint.inc
 create mode 100644 meta-python/recipes-devtools/python/python-wrapt.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-isort_4.2.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb

-- 
2.12.0


