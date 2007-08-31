Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IR6cL-0004vI-Bh
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Aug 2007 15:32:58 +0200
Received: by wx-out-0506.google.com with SMTP id h27so761664wxd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2007 06:30:59 -0700 (PDT)
Received: by 10.90.120.13 with SMTP id s13mr1888048agc.1188567058107;
	Fri, 31 Aug 2007 06:30:58 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Fri, 31 Aug 2007 06:30:58 -0700 (PDT)
Message-ID: <c384c5ea0708310630o72f8b8d5p7200976f86da9afa@mail.gmail.com>
Date: Fri, 31 Aug 2007 15:30:58 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46D739F5.1090304@klever.net>
MIME-Version: 1.0
References: <1187692103.6234.7.camel@localhost.localdomain>
	<46CC3773.8010707@dominion.kabel.utwente.nl>
	<109919.20070822152350@vanille-media.de>
	<c384c5ea0708291421p418dc698vdda76fa4deabcbbf@mail.gmail.com>
	<1188425104.6238.51.camel@localhost.localdomain>
	<c384c5ea0708301347j29cbd93cu2cc1c27e012c09a0@mail.gmail.com>
	<46D739F5.1090304@klever.net>
Subject: Re: RFC: Upgrade OE.dev to bitbake 1.8.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2007 13:32:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Michael,

On 8/30/07, Michael Krelin <hacker@klever.net> wrote:
> >>> If not yet, I would propose to tag the OE repository with a tag like
> >>> "PRE-BITBAKE-1_8_8" or whatever is supported/desired for mtn/oe.
> >> $ cat conf/sanity.conf | grep VER
> >> BB_MIN_VERSION = "1.8.5"
> >>
> > This describes that, given a OE checkout, which bitbake I need minimally.
> >
> > Now, suppose I have a given bitbake version, how do I find out which
> > OE revision should work with it?
>
> mtn log? ;-)
>
> > My proposal is to tag the OE tree on 2007-09-03.
>
> It's not that I object the tag, but what's the use of it? I mean, I
> don't think OE is something you may possibly want to stick to old
> revision of?
>

I found it too hard to combine
1) tracking OE changes
2) develop against OE.

time-wise in an environment where reproducability and deterministic
builds are top-priority. My current practice is to have both a frozen
and a current project for each target.

So yes, I would like to be able to freeze against something.  No
biggie though. Never mind my request,


-- 
Leon


