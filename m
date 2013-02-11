Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U4ulZ-0001QF-Iy
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 15:53:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Feb 2013 06:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="285711335"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.60])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2013 06:37:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 14:37:53 +0000
Message-Id: <cover.1360593325.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-webserver][PATCH 0/2] Add recipe for ajenti
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
X-List-Received-Date: Mon, 11 Feb 2013 14:53:59 -0000

This recipe was originally created for integration with the Baryon NAS
project, however functionality isn't quite there for that yet. In the
mean time it may be useful as a generic web admin application.

Note that this also requires the meta-oe python library additions series
I sent recently.



The following changes since commit 61911b23099c2658186179504ded318c987b5276:

  ttf: introduce update-fonts bbclass and change all ttf recipes to use it (2013-02-06 15:16:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/ajenti
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/ajenti

Paul Eggleton (2):
  ajenti: add new recipe
  README: extend for meta-webadmin addition

 meta-webserver/README                              |   17 +++
 .../0001-setup.py-remove-extra-data-files.patch    |   33 ++++++
 ...stat-fix-disk-usage-check-to-work-with-bu.patch |   29 +++++
 ...-plugins-sysload-fix-to-work-with-busybox.patch |   47 ++++++++
 .../ajenti/0005-plugins-power-fix-shutdown.patch   |   31 +++++
 ...ervices-add-basic-sysvinit-implementation.patch |  119 ++++++++++++++++++++
 ...vices-replace-s_upstart-with-s_init-in-MO.patch |   23 ++++
 .../ajenti/distributor-logo-openembedded.png       |  Bin 0 -> 2165 bytes
 .../ajenti/distro-detection-openembedded.patch     |   42 +++++++
 .../recipes-webadmin/ajenti/ajenti_git.bb          |   80 +++++++++++++
 10 files changed, 421 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0001-setup.py-remove-extra-data-files.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0003-plugins-sysload-fix-to-work-with-busybox.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0005-plugins-power-fix-shutdown.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0006-plugins-services-add-basic-sysvinit-implementation.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0007-plugins-services-replace-s_upstart-with-s_init-in-MO.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/distributor-logo-openembedded.png
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/distro-detection-openembedded.patch
 create mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb

-- 
1.7.10.4



