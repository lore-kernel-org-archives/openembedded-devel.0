Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <fabian-buettner@gmx.de>) id 1Qu8b6-0004jv-HQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 21:49:48 +0200
Received: (qmail invoked by alias); 18 Aug 2011 19:45:08 -0000
Received: from lak-31-116.wohnheime.ruhr-uni-bochum.de (EHLO localhost)
	[134.147.31.116]
	by mail.gmx.net (mp072) with SMTP; 18 Aug 2011 21:45:08 +0200
X-Authenticated: #4787129
X-Provags-ID: V01U2FsdGVkX1+Z5Uk2c0mZfQkoCYIPtx2o1hg5+DuNw6tKa/rx/d
	jzpFYvdX2PMp7m
Date: Thu, 18 Aug 2011 21:45:08 +0200
From: fabian =?iso-8859-15?Q?b=FCttner?= <fabian-buettner@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110818194508.GG26690@golden>
References: <20110818131043.GC26690@golden>
	<1313689684.7918.2.camel@eng-phousel-ubuntu>
MIME-Version: 1.0
In-Reply-To: <1313689684.7918.2.camel@eng-phousel-ubuntu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Y-GMX-Trusted: 0
Subject: Re: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Thu, 18 Aug 2011 19:49:48 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 10:48 Thu 18 Aug     , Peter Housel wrote:
> On Thu, 2011-08-18 at 15:10 +0200, fabian büttner wrote:
> > Hi,
> > 
> > I am having troubles compiling the Angstrom SDK.
> > 
> > I used the angstrom-setup-scripts to configure OE, sourced the
> > environment settings and built the base-image/console-image with bitbake.
> > 
> > While trying to compile the meta-toolchain, just when bitmake finishes
> > downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an error 
> > output like this:
> > 
> > http://pastie.org/2390409
> > 
> > After that, I tried building the meta-toolchain(i did a bitmake clean
> > meta-toolchain) without '-j2' but the error I receive is ultimately the same:
> > * satisfy_dependencies_for: Cannot satisfy the following dependencies
> > * for task-sdk-bare:
> > *   libstdc++-dev * 
> > * opkg_install_cmd: Cannot install package task-sdk-bare.
> > 
> > Unfortunately I am too unexperienced with OE/Angstrom to fix bugs like that.
> > Maybe someone could give me a hint how to get around this show-stopper?
> 
> I can confirm that I've been seeing this as well on recent
> 2011.03-maintenance, but haven't had a chance to troubleshoot the root
> cause yet.
> 
> -Peter-

Hi Peter,
thank you for your answer!

In the meantime I am going to use one of those
toolchains: http://www.angstrom-distribution.org/toolchains/

I'd be glad to help you with finding the root cause!

regards,
fabian


