Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 784 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Nov 2016 11:07:04 UTC
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id BC5E160116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:07:04 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161116105400503_0684;
	Wed, 16 Nov 2016 10:54:00 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=46236 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c6xqf-0005RK-Fs; Wed, 16 Nov 2016 05:53:49 -0500
Date: Wed, 16 Nov 2016 05:52:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <9D035763-8338-45EA-85A0-20F7CD6329DD@gmail.com>
Message-ID: <alpine.LFD.2.20.1611160548290.1284@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611141643001.32623@localhost.localdomain>
	<9D035763-8338-45EA-85A0-20F7CD6329DD@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: curious about "superfluous" meta-cpan recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2016 11:07:05 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Nov 2016, Jens Rehsack wrote:

> Hi Robert,
>
> > Am 14.11.2016 um 22:45 schrieb Robert P. J. Day <rpjday@crashcourse.ca>:
> >
> >
> >  to follow up on a point i made earlier, it seems that a number of
> > recipes in meta-cpan are, these days, unnecessary as they are
> > available in the standard OE or meta-oe layers. i took a quick
> > look and found the following examples:
> >
> > meta-cpan			OE/meta-oe equivalent		type
> >
> >
> > uri-perl			liburi-perl			oe-core
> > encode-locale-perl		libencode-locale-perl		meta-perl
> > io-socket-ssl-perl		libio-socket-ssl-perl		meta-perl

... snip ...

> >  so you can see that a number of meta-cpan recipes appear to be
> > effectively available in basic OE. does that make them
> > unnecessary? is there any reason to have meta-cpan recipes that
> > basically reproduce what is already available? (other than version
> > numbers, of course.)
>
> you're slightly too fast...

  that's what *she* said. :-) but seriously ...

> There is a clear reason for that what you identified as superfluous:
> reliability.
>
> Experienced users expected, one can easily add an
> liburi-perl_%.bbappend or an uri-perl_%.bbappend containing a
> PROVIDES+="...". But noone is enforced to remove such a PROVIDES...
>
> What drives me to package cpan distributions which are already in
> meta-oe? The way they're packaged. meta-cpan containes recipes in a
> way as they're meant by CPAN authors, not by Debian or
> oe-contributors.

  is there anywhere a guide for writing perl recipes? i've already
noticed the subtle differences in packaging, and someone earlier
mentioned to avoid the meta-debian recipes as they have their own
standard, and so on.

  is there a HOWTO for this? thanks muchly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


