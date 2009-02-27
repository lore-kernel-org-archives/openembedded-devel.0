Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ld5bB-0004qd-Di
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 17:30:09 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090227162635.MDTW13097.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Feb 2009 11:26:35 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id M4Sa1b0034dMFYL034SarX; Fri, 27 Feb 2009 11:26:34 -0500
X-Authority-Analysis: v=1.0 c=1 a=w2fQQtqhE8cA:10 a=fsJ8Y90igy4A:10
	a=pGLkceISAAAA:8 a=7wARo0XX_BAKuCx9ISwA:9
	a=gI8vDLzSwSBHOeRqE6uSBmKMvRUA:4
	a=LY0hPdMaydYA:10 a=urZjyxqrpwUA:10 a=MSl-tDqOz04A:10
X-CM-Score: 0.00
Date: Fri, 27 Feb 2009 09:26:34 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090227162633.GD5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Feb 2009 16:30:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2009 at 05:06:25PM +0100, Leon Woestenberg wrote:
> Hello,
> 
> On Thu, Feb 26, 2009 at 6:20 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> >> On 25-02-09 16:14, Mike (mwester) wrote:
> >
> > The problem I am facing is somewhat different.
> > I've added packages which build and test fine in my environment but
> > for some reason they do not build properly on tinderbox.
> >
> That often indicates a leak to the host and/or missing DEPENDS.
> 
> The build machines that run test builds, should do so with the minimal
> amount of host requirements.
> 
> Easily testable using virtual machines with freshly installed Linux,
> as most machines grow their installed package base during their
> lifecycle.

Also, chroots work for this.

-- 
Tom Rini


