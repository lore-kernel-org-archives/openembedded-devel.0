Received: from [209.85.134.187] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KUkWR-00025d-G7
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Aug 2008 17:50:27 +0200
Received: by mu-out-0910.google.com with SMTP id w1so2461680mue.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2008 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=vR7lJZSGfQL3L5XAjL/FoyndJSOca2TYMrpxXPWKxg8=;
	b=ChII6PKmUEm3Ivl+YjbvGJS2Fh+cJ6k1k2COOXod7tIZHVSO25+ai0NcV+LBWoZuZS
	EYEkyF67CwlM3VUaJbqYQ5rH6pVGP9qgzLpGhLdhk8570gjXzzqspCo8NJEaGatfc9S/
	AwJiR03K8oahH56emnsvoO/ESGVGg8VxEdXGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=iSuNawPeAW+vIVGRmBASzDNqj2AT/wNtev2LQWb7VAJDmndUtBs9ZfkbMuybyPYy7f
	50VdAxFeTJp131p9RI9PM298qzXlxf3O+PWfa6AZB6+D2lZw7rneEJN2u5Dv4a6ewxPD
	+JTo2keT5jybDXd+FNKHAoFDJGwyoafzwQ5aw=
Received: by 10.103.222.1 with SMTP id z1mr3327113muq.71.1218988174191;
	Sun, 17 Aug 2008 08:49:34 -0700 (PDT)
Received: from doriath.ww600.siemens.net ( [212.248.25.26])
	by mx.google.com with ESMTPS id n10sm513911mue.0.2008.08.17.08.49.32
	(version=SSLv3 cipher=RC4-MD5); Sun, 17 Aug 2008 08:49:33 -0700 (PDT)
Date: Sun, 17 Aug 2008 19:48:06 +0400
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, rpurdie@rpsys.net
Message-ID: <20080817154806.GA15553@doriath.ww600.siemens.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [RFC] Please test spitz changes
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
X-List-Received-Date: Sun, 17 Aug 2008 15:50:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've put some results of spitz scoop and akita ioexp rework
to the repository on the git.infradead.org. Please check it
and test on the hw.

The following changes since commit b09c3e3f1710b554348c98e78fbf4a661918779a:
  Huang Weiyi (1):
        removed unused #include <version.h>

are available in the git repository at:

  git://git.infradead.org/users/dbaryshkov/zaurus-2.6.git scoop

Dmitry Baryshkov (21):
      generic-bl: add startup and shutdown hooks
      Akita: use pca953x instead of akita-ioexp
      Scoop: provide setup/teardown and suspend/resume hooks
      Tosa: use new scoop hooks for gpio setup
      Spitz: register scoop2 devices as gpiolib chip
      Spitz: use leds-gpio for led driving
      Drop leds-spitz as they are now handled by leds-gpio
      Corgi: register scoop2 device as gpiolib chip
      Corgi: use leds-gpio for led driving
      Drop leds-corgi as they are now handled by leds-gpio
      Spitz: IrDA scoop to gpio conversion
      Spitz: use gpio interface for backlight manipulation
      Spitz: convert ASoC driver to use gpio api
      Akita: merge ficp and bl functions with spitz ones
      sharpsl_pm: permit init to fail
      spitz: use generic GPIO API instead of set_scoop_gpio in pm code
      Spitz: convert power regulator to use GPIO API instead of scoop_gpio
      Spitz: as scoop devices are now unreferenced, unexport them
      Spitz: register pm device from the proper place
      spitz: cleanup several references
      Scoop: compile-out obsolete parts if they aren't selected

 arch/arm/common/Kconfig                    |    7 +
 arch/arm/common/scoop.c                    |   36 +++-
 arch/arm/common/sharpsl_pm.c               |   11 +-
 arch/arm/include/asm/hardware/scoop.h      |   11 +
 arch/arm/include/asm/hardware/sharpsl_pm.h |    2 +-
 arch/arm/mach-pxa/Kconfig                  |    4 +
 arch/arm/mach-pxa/Makefile                 |    1 -
 arch/arm/mach-pxa/akita-ioexp.c            |  222 ------------------
 arch/arm/mach-pxa/corgi.c                  |   32 +++-
 arch/arm/mach-pxa/corgi_pm.c               |    4 +-
 arch/arm/mach-pxa/include/mach/akita.h     |   22 +-
 arch/arm/mach-pxa/include/mach/corgi.h     |    5 +-
 arch/arm/mach-pxa/include/mach/spitz.h     |   58 ++---
 arch/arm/mach-pxa/include/mach/tosa.h      |   17 +-
 arch/arm/mach-pxa/spitz.c                  |  348 +++++++++++++++++++++-------
 arch/arm/mach-pxa/spitz_pm.c               |  116 +++++----
 arch/arm/mach-pxa/tosa.c                   |   75 ++++++-
 arch/arm/mach-sa1100/Kconfig               |    1 +
 arch/arm/mach-sa1100/collie_pm.c           |    8 +-
 drivers/leds/Kconfig                       |   14 --
 drivers/leds/Makefile                      |    2 -
 drivers/leds/leds-corgi.c                  |  124 ----------
 drivers/leds/leds-spitz.c                  |  131 -----------
 drivers/video/backlight/corgi_bl.c         |   16 ++-
 include/linux/backlight.h                  |    2 +
 sound/soc/pxa/spitz.c                      |  112 +++++++---
 26 files changed, 634 insertions(+), 747 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/akita-ioexp.c
 delete mode 100644 drivers/leds/leds-corgi.c
 delete mode 100644 drivers/leds/leds-spitz.c

-- 
With best wishes
Dmitry



