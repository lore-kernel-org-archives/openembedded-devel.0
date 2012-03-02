Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S3VJg-00085G-Oh
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 17:26:49 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BD4F7F81240; Fri,  2 Mar 2012 09:18:18 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9FA52F8123E;
	Fri,  2 Mar 2012 09:18:17 -0700 (MST)
Message-ID: <4F50F2C9.5000407@mlbassoc.com>
Date: Fri, 02 Mar 2012 09:18:17 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Why can't I build firefox?
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
X-List-Received-Date: Fri, 02 Mar 2012 16:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'd like to test firefox on my BeagleBone using my latest Angstrom
setup, so I added the meta-mozilla layer to my layers & now have this

OE Build Configuration:
BB_VERSION        = "1.15.1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.03-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:2129eed920364abcc4f3f72d395333a041634e26"
meta-oe
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    = "master:fdff8697ea2db6254d26510adb7d11e6352d950f"
meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         = "master:d430de31c167cd264be74a1d82af4b732bb915dd"
meta-ti           = "master:2dbb7f09bf1c54d505d2e84a3a614bc5ca9b89aa"
meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         = "master:cda19686a2a3573ce50c86733c3469d926124995"
meta-handheld     = "master:fa1e6dcb524eb7ed29a6cd971a150d35c31e96e7"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-jasperforest
meta-n450         = "master:df18b721f86f0737c0f302e49b27ea232c70e683"
meta-mozilla      = "master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
meta              = "master:d94cb18f7f17a492c7a948337d7d2d1d0785573f"

Sadly, I get this error:
   ERROR: Nothing PROVIDES 'firefox'

But there is a recipe for this in the new layer:
   $ grep mozilla conf/local.conf
   EXTRALAYERS = "/local/poky-multi/meta-mozilla"
   $ ls /local/poky-multi/meta-mozilla/recipes-mozilla/firefox
   firefox  firefox_10.0.2.bb

So, why can't I build firefox?  I don't see anything special in the recipe
(like COMPATIBLE_MACHINE, etc), so I'm confused why it's not available.

I'm not sure if this is an Angstrom specific issue, but the same basic
process _does_ work when I added the meta-mozilla layer to my Poky
setup (hence the paths above)

Ideas?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


