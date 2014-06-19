Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 799F96FE9E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:10:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jun 2014 07:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,507,1400050800"; d="scan'208";a="447523681"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.96])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2014 07:10:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 15:09:55 +0100
Message-Id: <cover.1403186612.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [meta-filesystems][PATCH v2 0/1] Add aufs-util
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
X-List-Received-Date: Thu, 19 Jun 2014 14:10:07 -0000

Since v1, fix the following issues:
 * Use 3.9 as the version since that is materially the same as
   3.x-rcN upstream
 * Use class overrides instead of context checks within the functions
 * Remove trailing slash on S value which led to debugedit failure (!)
 * Add RRECOMMENDS in case aufs is built as a module
 * Drop paths within SRC_URI
 * Fix HOMEPAGE
 * Spaces instead of tabs

(Sorry, this was a long time coming.)


The following changes since commit 8a9d356a9202350766a68aa07f97ea97e9ed0a51:

  webmin: split out webmin themes (2014-06-18 17:55:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/aufs-util
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/aufs-util

Paul Eggleton (1):
  aufs-util: add new recipe

 ...dd-tool-concept-to-Makefile-for-cross-com.patch |  29 +++
 .../aufs-util-don-t-strip-executables.patch        |  37 ++++
 .../recipes-utils/aufs-util/aufs-util/aufs_type.h  | 210 +++++++++++++++++++++
 .../recipes-utils/aufs-util/aufs-util_git.bb       |  53 ++++++
 4 files changed, 329 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb

-- 
1.9.3


