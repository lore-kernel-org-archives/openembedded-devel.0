Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKp0e-0007mp-IR
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 13:27:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2012 04:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="230911604"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2012 04:13:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 12:13:48 +0100
Message-Id: <cover.1349608252.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH 0/3] meta-webserver improvements
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
X-List-Received-Date: Sun, 07 Oct 2012 11:27:00 -0000

Fixes for some bugs in the apache2 & modphp recipes, along with
phpmyadmin which I used to discover and fix them.


The following changes since commit 68f05443333afa527e3b24e4caae6115dfb6b6b6:

  opencv: bump PR due libav update (2012-10-05 11:27:25 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/meta-webserver-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-webserver-fixes

Paul Eggleton (3):
  apache2: fix configuration
  modphp: fix default php.ini & add PACKAGECONFIG
  phpmyadmin: add new recipe

 .../recipes-httpd/apache2/apache2_2.4.2.bb         |   10 +++--
 meta-webserver/recipes-httpd/apache2/files/init    |    6 +--
 meta-webserver/recipes-php/modphp/modphp5.inc      |   34 ++++++++--------
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    2 +-
 .../recipes-php/phpmyadmin/phpmyadmin/apache.conf  |   42 ++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb   |   30 ++++++++++++++
 6 files changed, 100 insertions(+), 24 deletions(-)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/apache.conf
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb

-- 
1.7.9.5



