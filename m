Return-Path: <jonathan.yong@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 449A477A2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491468094; x=1523004094;
	h=from:to:cc:subject:date:message-id;
	bh=3oiQaNMkC+hDXOykL+zBQdAplYxjIeSe1F44gVdqbWM=;
	b=q6Khe6KLzJRCE+ZdKZfiTYV2EPs9e/T7jmd0FKAM9jnV9HOU8bzrcN7I
	nqrIVARYPxWTFbeHczJZj2lAeTLViw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 01:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="952517254"
Received: from vanguard-01.png.intel.com ([10.221.118.162])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 01:41:30 -0700
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Apr 2017 08:41:28 +0000
Message-Id: <20170406084129.20466-1-jonathan.yong@intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH v2] f2f2-tools 1.4.0 -> 1.8.0
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
X-List-Received-Date: Thu, 06 Apr 2017 08:41:32 -0000

Upgrade f2fs-tools, now supports encryption.
Patch is now tagged.

Yong, Jonathan (1):
  f2fs-tools: Update to Version 1.8.0

 .../0002-Fix-mkfs-out-of-tree-builds.patch         | 37 ++++++++++++++++++++++
 .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb} (81%)

-- 
2.10.2


