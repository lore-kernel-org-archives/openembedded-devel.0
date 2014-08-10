Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 18294701F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:14:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2014 09:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="586134154"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 09:14:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:14:40 +0100
Message-Id: <cover.1407687153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-systemd][PATCH 0/5] Clean up meta-systemd
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
X-List-Received-Date: Sun, 10 Aug 2014 16:14:58 -0000

Systemd support has been incorporated within a number of these recipes
in OE-Core, so we shouldn't have it here as well.


The following changes since commit e751af9f900834759e59ad2b46a7118a508069e4:

  mariadb: update to 5.5.38 (2014-08-10 16:07:19 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/systemd-cleanup
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/systemd-cleanup

Paul Eggleton (5):
  dropbear: systemd support now in OE-Core
  busybox: systemd support now in OE-Core
  avahi: systemd support now in OE-Core
  cronie: systemd support now in OE-Core
  libpam: systemd support now in OE-Core

 .../avahi/avahi_0.6.31.bbappend                    |  5 -----
 .../busybox/busybox/busybox-klogd.service.in       |  8 --------
 .../busybox/busybox/busybox-syslog.service.in      | 13 -------------
 .../recipes-core/busybox/busybox_%.bbappend        | 22 ----------------------
 .../recipes-core/dropbear/dropbear/dropbear.socket | 10 ----------
 .../dropbear/dropbear/dropbear@.service            | 11 -----------
 .../dropbear/dropbear/dropbearkey.service          | 10 ----------
 .../recipes-core/dropbear/dropbear_%.bbappend      | 17 -----------------
 .../recipes-extended/cronie/cronie/crond.service   | 10 ----------
 .../recipes-extended/cronie/cronie_1.4.11.bbappend | 13 -------------
 .../recipes-extended/pam/libpam_1.1.6.bbappend     |  4 ----
 11 files changed, 123 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
 delete mode 100644 meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
 delete mode 100644 meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service
 delete mode 100644 meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend

-- 
1.9.3


