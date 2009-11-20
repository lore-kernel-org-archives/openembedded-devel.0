Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBVBu-0004Y8-2n
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 16:14:33 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBVAX-0000f8-2V for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:13:05 -0500
Date: Fri, 20 Nov 2009 10:13:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258729646.8426.2.camel@conroy-linux>
Message-ID: <alpine.LFD.2.00.0911201012020.21364@localhost>
References: <alpine.LFD.2.00.0911192050230.11568@localhost>
	<1258729646.8426.2.camel@conroy-linux>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: adding an updated package, and when it's safe to do so?
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
X-List-Received-Date: Fri, 20 Nov 2009 15:14:34 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 20 Nov 2009, Chris Conroy wrote:

> On Thu, 2009-11-19 at 20:54 -0500, Robert P. J. Day wrote:
> > a couple silly questions while i prep a guile package update.
> >
> > 1) if a newer package is added under recipes, i'm assuming that
> > it's the newest version of the package that will be used for a
> > build, unless a PREFERRED_VERSION directive is used, correct?
> >
> > 2) at what point can i start to add that new package info so that
> > a current build doesn't pick it up?  once all the .bb files are
> > parsed and the package builds are underway, is that it for any
> > further consultation of the .bb files?
>
> I'm not sure if I'm understanding your problem correctly, but to me
> it sounds like you just want to set DEFAULT_PREFERENCE="-1" in the
> recipe you're concerned about.

  not really, i was simply asking what *would* happen upon the
addition of a newer version of a package, that's all.

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


