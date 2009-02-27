Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ld8Y3-0003Ah-4a
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 20:39:03 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090227193531.ZEPI13097.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Feb 2009 14:35:31 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id M7bS1b00G4dMFYL047bSdE; Fri, 27 Feb 2009 14:35:30 -0500
X-Authority-Analysis: v=1.0 c=1 a=w2fQQtqhE8cA:10 a=fsJ8Y90igy4A:10
	a=wMNdZWldAAAA:8 a=pGLkceISAAAA:8 a=WYgH820HcEPcielabJUA:9
	a=DD7dPURCETyCgX-nMRxcNNB2NDUA:4 a=LY0hPdMaydYA:10 a=urZjyxqrpwUA:10
	a=MSl-tDqOz04A:10
X-CM-Score: 0.00
Date: Fri, 27 Feb 2009 12:35:26 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090227193526.GE5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
	<ac9c93b10902270956k501e0316y7820f047b4755f0c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10902270956k501e0316y7820f047b4755f0c@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Fri, 27 Feb 2009 19:39:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2009 at 06:56:16PM +0100, Frans Meulenbroeks wrote:
> 2009/2/27 Tom Rini <trini@kernel.crashing.org>:
> > On Fri, Feb 27, 2009 at 05:06:25PM +0100, Leon Woestenberg wrote:
> >> Hello,
> >>
> >> On Thu, Feb 26, 2009 at 6:20 PM, Frans Meulenbroeks
> >> <fransmeulenbroeks@gmail.com> wrote:
> >> >> On 25-02-09 16:14, Mike (mwester) wrote:
> >> >
> >> > The problem I am facing is somewhat different.
> >> > I've added packages which build and test fine in my environment but
> >> > for some reason they do not build properly on tinderbox.
> >> >
> >> That often indicates a leak to the host and/or missing DEPENDS.
> >>
> >> The build machines that run test builds, should do so with the minimal
> >> amount of host requirements.
> >>
> >> Easily testable using virtual machines with freshly installed Linux,
> >> as most machines grow their installed package base during their
> >> lifecycle.
> >
> > Also, chroots work for this.
> >
> 
> True but that is not what we have at the moment. E.g the mpd problem I
> mentioned earlier in this thread is probably caused by some docbook
> residue.
> 
> (and I agree that it is easy to miss a DEPENDS because of accumulated
> installed packages).

If you start with a very minimal chroot and an empty build output dir,
yes, you would catch these things.  I think scratchbox would help to
automate this kind of thing, but for my needs I simply unpack my chroot
base and go.

-- 
Tom Rini


