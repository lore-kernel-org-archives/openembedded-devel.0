Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <fabian-buettner@gmx.de>) id 1Qu2RP-00026s-Qo
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 15:15:23 +0200
Received: (qmail invoked by alias); 18 Aug 2011 13:10:43 -0000
Received: from lak-31-116.wohnheime.ruhr-uni-bochum.de (EHLO localhost)
	[134.147.31.116]
	by mail.gmx.net (mp004) with SMTP; 18 Aug 2011 15:10:43 +0200
X-Authenticated: #4787129
X-Provags-ID: V01U2FsdGVkX19H1tRqjvFHlpiXgnG2S11EwVna24JxzVc/GRVKSH
	E4pP4tr52ZT9+J
Date: Thu, 18 Aug 2011 15:10:43 +0200
From: fabian =?iso-8859-15?Q?b=FCttner?= <fabian-buettner@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110818131043.GC26690@golden>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Y-GMX-Trusted: 0
Subject: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Thu, 18 Aug 2011 13:15:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am having troubles compiling the Angstrom SDK.

I used the angstrom-setup-scripts to configure OE, sourced the
environment settings and built the base-image/console-image with bitbake.

While trying to compile the meta-toolchain, just when bitmake finishes
downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an error 
output like this:

http://pastie.org/2390409

After that, I tried building the meta-toolchain(i did a bitmake clean
meta-toolchain) without '-j2' but the error I receive is ultimately the same:
* satisfy_dependencies_for: Cannot satisfy the following dependencies
* for task-sdk-bare:
*   libstdc++-dev * 
* opkg_install_cmd: Cannot install package task-sdk-bare.

Unfortunately I am too unexperienced with OE/Angstrom to fix bugs like that.
Maybe someone could give me a hint how to get around this show-stopper?

regards,
fabian


