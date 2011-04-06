Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1Q7PxC-00074W-Nc
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 12:27:14 +0200
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.88.13])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1Q7Pv4-0005bs-Bh
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 11:25:02 +0100
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 06 Apr 2011 12:24:54 +0200
Message-ID: <1302085494.2267.20.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: fennec fonts too small
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
X-List-Received-Date: Wed, 06 Apr 2011 10:27:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

It tried out fennec on htcleo machine (4,2" wvga, 217 ppi specified) and
noticed the fonts are itsy. Maybe it would be good to install a modified
configuration in order to make it more usable. It's possible to set font
minima via about:config .

Should a configuration be added?

If so, how?

There is MACHINE_DISPLAY_{WIDTH,HEIGHT}_PIXELS. E.g. from
conf/machine/htcleo.conf :
MACHINE_DISPLAY_WIDTH_PIXELS = "480"
MACHINE_DISPLAY_HEIGHT_PIXELS = "800"

But it doesn't include screen size.. (dpi).

There's also smallscreen GUI_MACHINE_CLASS = "smallscreen"

Maybe we could make the fennec recipe read such parameters and write a
fitting configuration file into the package if a suitable is present.


Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "c3265b1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "htcleo"
DISTRO            = "shr"
DISTRO_VERSION    = "-20110406"
TARGET_FPU        = "hard"


Best,
Lukas



