Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RDOfk-0000de-Ex
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 00:50:12 +0200
Received: (qmail invoked by alias); 10 Oct 2011 22:44:31 -0000
Received: from p4FDF1933.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.51]
	by mail.gmx.net (mp050) with SMTP; 11 Oct 2011 00:44:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1//mhNKuhz/RqWyf7aetG8kAC4Uejt+4h1fh3Ik+M
	gwTbFqgsOSgpWK
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 00:48:58 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201110110048.58769.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe] bitbake udev fails at parse ( util-linux-blkid missing )
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
X-List-Received-Date: Mon, 10 Oct 2011 22:50:12 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

with latest pulls I get after pseudo pre run:

OE Build Configuration:
BB_VERSION        = "1.13.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "overo"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.10-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:4f06c3f0376e0704210a2e61005748f168369d07"
meta-oe           
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         = "master:9278fe715d5eebd16af1a2d20a92255744913dbb"
meta-texasinstruments = "master:7a45605f91536519a53e6f18dedee5f1f62d88e0"
meta-efikamx      = "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        = "master:9080394ae0a040dd7b05ac49f9480e4d71631b55"
meta-htc          
meta-nokia        
meta-openmoko     
meta-palm         = "master:7d12d5c09a5303952c2ffa22aa2f0274025f9fc2"
meta-sugarbay     
meta-crownbay     
meta-emenlow      
meta-fishriver    
meta-jasperforest 
meta-n450         = "master:e0e52850cf5f84fb4ee1bfa15571aaf61e068450"
meta              = "master:4732222c46652951e66aae377631f4a361179d8f"
meta-freescale    = "master:8716233e1c13e8c49096c4606f836275ee22009a"
meta-gumstix      = "master:d721d7815c7f4706401f4cef9c1f0a535e056d08"

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'util-linux-blkid' (but /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_173.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'util-linux-blkid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['util-linux-blkid']
ERROR: Required build target 'udev' has no buildable providers.
Missing or unbuildable dependency chain was: ['udev', 'util-linux-blkid']

Could somebody take care please?

Andreas


