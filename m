Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Rny9w-0001aX-Nb
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 21:00:32 +0100
Received: from localhost (85.229.138.125) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.213.0; Thu, 19 Jan 2012
	20:52:52 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 20:52:53 +0100
Message-ID: <cover.1327002701.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH v4 0/2] systemd: package split
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
X-List-Received-Date: Thu, 19 Jan 2012 20:00:32 -0000
Content-Type: text/plain


At least while using rpm-packaging, the systemd package (rpm) got a dependency
on python, as systemd-analyze needs this (in the shebang). When trying to
create a small image using systemd, this isn't always desirable. Thus the
splitting of systemd-analyze to a separate package.


Conditionally RRECOMMENDS kbd and kbd-consolefonts: if the machine in
question do not have keyboards, there is no need for kbd and
kbd-consolefonts. To not make systemd machine dependent, we introduce a
DISTRO_FEATURE keyboard for systems that want kbd* installed.

The first patch should be fine for pulling. 

The 2nd patch needs coordination with other layers, e.g. angstrom, to not
remove the RRECOMMENDS on kbd* from their packages. However, using a positive
DISTRO_FEATURE is more natural, than a negative one, i.e. nokeyboard.

All patches has been verified on a few internal arm-based machines, with a
custom distro.


------------------------------------
v4: * Remove patch for cairo, as cairo is now a bbappend to oe-core version.
      The oe-core version already had the desired functionality.
    * Change the conditionally RRECOMMENDS on kbd* in systemd, to depend 
      on DISTRO_FEATURES instead of MACHINE_FEATURES.

v3: * Set PACKAGE_ARCH for systemd, as its RRECOMMENDS now depends on
    MACHINE_FEATURES. 

v2: * The SRC_URI update has been applied to master.

    * Let systemd-analyze RDEPENDS on python-dbus, and RRECOMMENDS
      python-pycairo. 

    * Add a patch to conditionally enable/disable x11 support when buildling
      cairo. 
    
    * Add patch which makes the systemd's RRECOMMENDS on kbd and
      kbd-consolefonts conditional on the keyboard MACHINE_FEATURES.

The following changes since commit 3767262f9e626c49638dc886adbdf58b167de61c:

  In LICENSE "&&" should be replaced with "&" (2012-01-16 22:29:22 +0100)

are available in the git repository at:
  git://github.com/darander/meta-oe systemd-move
  https://github.com/darander/meta-oe/tree/systemd-move

Anders Darander (2):
  systemd: split out systemd-analyze
  systemd: conditionally RRECOMMENDS kbd*

 meta-oe/recipes-core/systemd/systemd_git.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.8.3



