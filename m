Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkaMr-0005Vd-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 12:59:53 +0100
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.213.0; Tue, 10 Jan 2012
	12:52:24 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jan 2012 12:52:14 +0100
Message-ID: <cover.1326196151.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH v3 0/3] systemd: package split
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
X-List-Received-Date: Tue, 10 Jan 2012 11:59:53 -0000
Content-Type: text/plain


At least while using rpm-packaging, the systemd package (rpm) got a dependency
on python, as systemd-analyze needs this (in the shebang). When trying to
create a small image using systemd, this isn't always desirable. Thus the
splitting of systemd-analyze to a separate package.

As an RRECOMMENDS for python-pycairo is added for systemd-analyze, we also add
new patch to conditionally build cairo with x11-support. This is desired for
x11-less systems, to reduce build time and size. The actual patch is similar
to how it is solved in oe-core.

Conditionally RRECOMMENDS kbd and kbd-consolefonts: if the machine in
question do not have keyboards, there is no need for kbd and
kbd-consolefonts. 

The first patch should be fine for pulling. The 2nd patch should also be
relativly non-controversial. 

The 3rd patch is new for v2, and can be omitted if more discussions is needed.

All patches has been verified on a few internal arm-based machines, with a
custom distro.


------------------------------------
v3: * Set PACKAGE_ARCH for systemd, as its RRECOMMENDS now depends on
    MACHINE_FEATURES. 

v2: * The SRC_URI update has been applied to master.

    * Let systemd-analyze RDEPENDS on python-dbus, and RRECOMMENDS
      python-pycairo. 

    * Add a patch to conditionally enable/disable x11 support when buildling
      cairo. 
    
    * Add patch which makes the systemd's RRECOMMENDS on kbd and
      kbd-consolefonts conditional on the keyboard MACHINE_FEATURES.

The following changes since commit d3a451bbd08f7bb0ddea1aa0b314a72d65c660d4:

  systemd: git repo moved (2012-01-10 08:25:55 +0100)

are available in the git repository at:
  git://github.com/darander/meta-oe systemd-move
  https://github.com/darander/meta-oe/tree/systemd-move

Anders Darander (3):
  systemd: split out systemd-analyze
  cairo: conditionally enable x11 dependencies
  systemd: conditionally RRECOMMENDS kbd*

 meta-oe/recipes-core/systemd/systemd_git.bb      |   13 ++++++++++---
 meta-oe/recipes-graphics/cairo/cairo.inc         |    7 ++++++-
 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb   |    2 ++
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb |    2 ++
 4 files changed, 20 insertions(+), 4 deletions(-)

-- 
1.7.8.3



