Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US6Ul-0007Fu-62
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 16:04:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2013 06:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="227802250"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Apr 2013 06:46:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 14:46:48 +0100
Message-Id: <cover.1366119759.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome][PATCH 0/2] Remove some recipes that are in OE-Core (cover letter only)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 14:04:51 -0000

In case you're wondering why I've only sent the cover letter for just two
patches, I tried sending them as normal and what I got was:

fatal: pull-29844/0001-hicolor-icon-theme-remove.patch: 29: patch contains a line longer than 998 characters
warning: no patches were sent

They are just deletes though so they don't contain much in the way of
substance.


The following changes since commit a45830a39bb47a9eab27980d52966226c9504ea4:

  recipes: Unify indentation (2013-04-15 16:23:17 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/meta-gnome
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-gnome

Paul Eggleton (2):
  hicolor-icon-theme: remove
  libical: remove

 .../hicolor-icon-theme/files/index.theme           | 1731 --------------------
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |   23 -
 .../libical/files/pthread-fix.patch                |   52 -
 meta-gnome/recipes-support/libical/libical_0.48.bb |   17 -
 4 files changed, 1823 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/hicolor-icon-theme/files/index.theme
 delete mode 100644 meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
 delete mode 100644 meta-gnome/recipes-support/libical/files/pthread-fix.patch
 delete mode 100644 meta-gnome/recipes-support/libical/libical_0.48.bb

-- 
1.7.10.4



