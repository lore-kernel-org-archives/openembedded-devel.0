Return-Path: <chong.yi.chai@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D362B72F0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:27:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 16:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="60586314"
Received: from chongyic-ilbpg1.png.intel.com ([10.88.227.83])
	by orsmga004.jf.intel.com with ESMTP; 20 Feb 2017 16:27:05 -0800
From: chong.yi.chai@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 08:26:02 +0800
Message-Id: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][morty][PATCH 0/3] backport patch to fix SRC_URI issue on samba.org
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
X-List-Received-Date: Tue, 21 Feb 2017 00:27:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Chai, Chong Yi" <chong.yi.chai@intel.com>

Backport 3 patches from master branch to morty branch for fixing fetch issue
on samba.org. Replacing http with https to solve this issue.

Andreas Müller (2):
  libtdb: fix SRC_URI - http has gone
  libtevent: fix SRC_URI - http has gone

Chai, Chong Yi (1):
  libtalloc: fix SRC_URI to use https instead of http

 meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb  | 2 +-
 meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb       | 2 +-
 meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1


