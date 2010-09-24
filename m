Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Oz7cc-0002KO-Nm
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 14:43:37 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C07391660839; Fri, 24 Sep 2010 06:43:17 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 57AF31660833;
	Fri, 24 Sep 2010 06:43:17 -0600 (MDT)
Message-ID: <4C9C9CE5.80404@mlbassoc.com>
Date: Fri, 24 Sep 2010 06:43:17 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: Poky <poky@o-hand.com>, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: pkg-config confusion
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
X-List-Received-Date: Fri, 24 Sep 2010 12:44:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to update the gstreamer plugin recipes to use the
latest released packages.  This is causing some problems though
as with the newest code, the wrong version of ORCC is being used.

I've traced this down to the fact that previous releases just
inferred ORCC=orcc which worked correctly and picked up the
cross-tool compiler (in sysroots/i686-linux/... etc)

However, the new releases have a fancy M4 macro plus some command
line magic for using ORCC.  This falls apart because of these
lines:
       ORCC=`$PKG_CONFIG --variable=orcc orc-0.4`

Looking into this at configure time, I see that there is some confusion

ORCC=/usr/bin/orcc, PKG_CONFIG=/home/local/p69_poky/tmp/sysroots/i686-linux/usr/bin/pkg-config => /home/local/p69_poky/tmp/sysroots/i686-linux/usr/bin/pkg-config
PKG_CONFIG_DISABLE_UNINSTALLED=yes
PKG_CONFIG_SYSROOT_DIR=/home/local/p69_poky/tmp/sysroots/armv7a-poky-linux-gnueabi
PKG_CONFIG_DIR=/home/local/p69_poky/tmp/sysroots/armv7a-poky-linux-gnueabi/usr/lib/pkgconfig
PKG_CONFIG_LIBDIR=/home/local/p69_poky/tmp/sysroots/armv7a-poky-linux-gnueabi/usr/lib/pkgconfig
PKG_CONFIG_PATH=/home/local/p69_poky/tmp/sysroots/armv7a-poky-linux-gnueabi/usr/lib/pkgconfig:/home/local/p69_poky/tmp/sysroots/armv7a-poky-linux-gnueabi/usr/share/pkgconfig

So, it looks like bitbake is trying to run pkg-config using the
native version, but with the installed target databases.  This
in turn has it pick up the target version of ORCC, not the cross
version.

How can I convince it otherwise?

n.b. I think this same problem exists elsewhere as I've seen it
try to use the wrong version of the pygobject compiler which is
handled similarly.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


