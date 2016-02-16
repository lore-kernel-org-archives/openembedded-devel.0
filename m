Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8390760124
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:25:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Feb 2016 06:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,455,1449561600"; d="scan'208";a="886037398"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.22.173])
	by orsmga001.jf.intel.com with ESMTP; 16 Feb 2016 06:25:44 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2016 14:25:32 +0000
Message-Id: <cover.1455631402.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/4] Fido pull request
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
X-List-Received-Date: Tue, 16 Feb 2016 14:25:45 -0000

Please consider the following fixes for inclusion in the Fido branch.

- libpcre security fix not required in jethro or master because the newer
  version they carry isn't affected
- backport a fix for some memory leaks in rpmresolve
- backport a fix for kernel.bbclass which already exists in jethro & master
- remove a stray tzdata file, this change isn't required for jethro or master as
  the file isn't present in those branches

The following changes since commit 4dea3e7b9a0041e7359981e68c561e7de8ad3ae5:

  dpkg: Security fix CVE-2015-0860 (2016-02-07 17:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Armin Kuster (1):
  libpcre: Security fixes and package update.

Mariano Lopez (1):
  rpmresolve.c: Fix unfreed pointers that keep DB opened

Markus Lehtonen (1):
  kernel.bbclass: do not mv/link sources when externalsrc enabled

Martin Jansa (1):
  tzdata: remove 2015d version

 meta/classes/kernel.bbclass                                    | 10 +++++++---
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c              | 10 ++++++----
 meta/recipes-extended/tzdata/tzdata_2015d.bb                   |  6 ------
 .../libpcre/{libpcre_8.36.bb => libpcre_8.38.bb}               |  7 +++----
 4 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb
 rename meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.38.bb} (91%)

--
2.5.0

