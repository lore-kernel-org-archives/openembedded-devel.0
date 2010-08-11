Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Oj5cQ-0002zo-B4
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 09:21:03 +0200
Received: (qmail 21552 invoked from network); 11 Aug 2010 09:20:45 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 11 Aug 2010 09:20:45 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id L4Tfk0mdOL90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 09:20:31 +0200 (CEST)
Received: (Qmail 21524 invoked from network); 11 Aug 2010 09:20:31 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 11 Aug 2010 07:20:31 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1Oj5bz-000203-Dm; Wed, 11 Aug 2010 09:20:31 +0200
Date: Wed, 11 Aug 2010 09:20:31 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100811072031.GA7282@mi.fu-berlin.de>
References: <4C607E6C.2030104@mlbassoc.com>
	<AANLkTi=zp9r7hoym3kFEx9hpCgoQ8iOBVNZ6FhN7F4q6@mail.gmail.com>
	<4C6130EC.9030602@mlbassoc.com> <4C614AB7.2050709@mlbassoc.com>
	<20100810192710.GE7189@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100810192710.GE7189@denix.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Can't build gstreamer-ti
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
X-List-Received-Date: Wed, 11 Aug 2010 07:21:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2010 at 03:27:10PM -0400, Denys Dmytriyenko wrote:
> On Tue, Aug 10, 2010 at 06:48:55AM -0600, Gary Thomas wrote:
> > On 08/10/2010 04:58 AM, Gary Thomas wrote:
> >> But I've downloaded those tools and was able to build this recipe just
> >> a few weeks ago. I think something in the staged packaging has broken it.
> >
> > I worked past this problem by installing a symlink by hand to my DVSDK 
> > installed tools.
> >
> > Next problem :-(
> >
> > | Engine.c:(.text+0x19d4): undefined reference to `__aeabi_uidiv'
> >
> > How were these packages built to be put on the Angstrom package feed?
> > Am I doing something wrong?
> 
> As Henning already said, Codec Engine only builds and works with binutils 2.18 
> (which IS Angstrom's default, btw) on TI OMAP3/DaVinci processors.

Hm,

that is not 100% correct, but at the moment I dont have the time to make the patches for oe.

Bye Henning


