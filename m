Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0AC60068
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:44:09 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2016 03:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,494,1473145200"; d="scan'208";a="31159274"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 15 Nov 2016 03:44:11 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 005046A4006
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 03:43:31 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2016 13:44:05 +0200
Message-Id: <1479210247-9859-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH 0/2] X initialization refactoring
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
X-List-Received-Date: Tue, 15 Nov 2016 11:44:11 -0000

This set has a companion set on oe-core, neither set makes much sense
without the other. Cover letters are identical. Please CC both lists
if needed.


Current state:
 * meta-oe and oe-core both provide xserver-nodm-init: the oe-core
   version should already do everything the meta-oe version does, but
   the meta-oe version gets selected by default because of layer
   priority.
 * meta-oe and oe-core provide xserver-common and x11-common:
   x11-common files are essentially a subset of xserver-common files.


Goals:
 * Adding meta-oe to bblayers alone should not modify X initialization
 * meta-oe and oe-core should not duplicate content without reason
 * xserver startup should still be modifiable from other layers
   (just not implicitly)


What was done to achieve those goals:
 * (oe-core) Removed old cruft from x11-common. What was left is
   Xsession and a few Xsession scripts.
 * (oe-core) Merged what's left of x11-common into xserver-nodm-init
 * (meta-oe) Removed xserver-nodm-init-2.0 as unneeded
 * (meta-oe) No longer install files in xserver-common that oe-core
   xserver-nodm-init installs


xserver-common now has to be explicitly installed if it is wanted.

There are multiple ways to solve these issues: I'm prepared to try
alternative approaches if needed. Testing results are appreciated
as well.


Cheers,
 Jussi


