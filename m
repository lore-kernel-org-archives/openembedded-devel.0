Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DF15E6BA72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:45:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 03:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649018"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:22 +0100
Message-Id: <cover.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe, meta-gnome][PATCH 0/6] Removals of recipes/classes now in OE-Core
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
X-List-Received-Date: Wed, 28 Aug 2013 10:45:06 -0000

The following changes since commit 72e23c12296fbc77193898c38426add58d0c2d71:

  mysql5: replace with mariadb 5.1.67 and tweak (2013-08-27 16:39:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/oecore-moves2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/oecore-moves2

Paul Eggleton (6):
  midori: remove
  vala: remove
  classes/vala: remove
  python-docutils: remove
  libnotify: remove
  ca-certificates: remove

 .../recipes-connectivity/midori/midori_0.5.2.bb    | 42 ----------------
 .../recipes-gnome/libnotify/libnotify_0.6.0.bb     | 17 -------
 meta-oe/classes/vala.bbclass                       | 18 -------
 .../recipes-devtools/python/python-docutils_0.5.bb | 19 --------
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch | 53 --------------------
 meta-oe/recipes-devtools/vala/vala.inc             | 20 --------
 meta-oe/recipes-devtools/vala/vala_0.16.0.bb       |  8 ----
 .../ca-certificates/ca-certificates-20130119.inc   | 15 ------
 .../ca-certificates-cross_20130119.bb              | 12 -----
 ...01-update-ca-certificates-remove-c-rehash.patch | 45 -----------------
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 56 ----------------------
 .../ca-certificates/ca-certificates_20130119.bb    | 30 ------------
 12 files changed, 335 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
 delete mode 100644 meta-oe/classes/vala.bbclass
 delete mode 100644 meta-oe/recipes-devtools/python/python-docutils_0.5.bb
 delete mode 100644 meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
 delete mode 100644 meta-oe/recipes-devtools/vala/vala.inc
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.16.0.bb
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb

-- 
1.8.1.2


