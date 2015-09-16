Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 436C760053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:34:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 16 Sep 2015 07:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="770276685"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2015 07:34:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 17:35:53 +0300
Message-Id: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: Update recipes that refer to gnome-icon-theme
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
X-List-Received-Date: Wed, 16 Sep 2015 14:34:13 -0000

Following patches remove references to gnome-icon-theme which has
been removed from oe-core. In some cases they've been replaced with
"adwaita-icon-theme", but in others some additional changes were
required (mostly when the build system unnecessarily checks for the
theme).

Cheers, Jussi

 [meta-oe][PATCH 1/5] gupnp-tools: Upgrade 0.8.1 -> 0.8.10
 [meta-oe][PATCH 2/5] evince: Remove pkg-config check for specific
 [meta-oe][PATCH 3/5] gnome-system-monitor: Remove pkg-config check
 [meta-oe][PATCH 4/5] gnome-themes: Depend on adwaita, not
 [meta-oe][PATCH 5/5] xfce4-settings: recommend adwaita, not

