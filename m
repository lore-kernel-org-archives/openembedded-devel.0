Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PhqQX-0005Lf-TC
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 22:27:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0PLR56f009440
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 21:27:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09139-05 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 21:27:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0PLQxc7009434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 21:27:00 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=ABs-jwjo=q5xGrKxvmYaLe05ePEtOez57E7ms@mail.gmail.com>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
	<ihmaqm$eho$1@dough.gmane.org>
	<AANLkTi=hWbJ_Y_m6kxMfCMdQti+xvAZZ-snK1UuqKLxY@mail.gmail.com>
	<4D3F0E15.7050904@mentor.com>
	<AANLkTi=ABs-jwjo=q5xGrKxvmYaLe05ePEtOez57E7ms@mail.gmail.com>
Date: Tue, 25 Jan 2011 21:26:43 +0000
Message-ID: <1295990803.27814.36.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 21:27:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-01-25 at 11:19 -0700, Chris Larson wrote:
> On Tue, Jan 25, 2011 at 10:53 AM, Tom Rini <tom_rini@mentor.com> wrote:
> >>> * start an integration branch
> >>>  o remove bitbake
> >>
> >> Not sure what you mean with that. Which BB do you propose to use?
> >
> > Chris Larson has been doing a lot of work (and Richard has been confirming,
> > testing, etc, etc) to try and keep poky's bitbake changes in sync with
> > master when at all possible (the delta has gotten very very small, iirc).
> 
> I would personally like to see yocto use upstream bitbake with git
> submodules or similar, rather than maintaining its own bitbake
> directory.  I'd also like to see the bitbake sync completed, but it
> seems like it's a low priority for Richard at this time.  As you say,
> though, the delta is fairly small, considering.

I don't consider it a low priority and fully agree it needs to be fixed,
there needs to be no delta. I doubt I'd go for submodules but making it
match 1:1 commits with upstream bitbake is the intent and to script it.

The Yocto development window is closing which has influenced my priority
list. I'm also very conscious that we want to sort out a number of the
fetcher problems and we're not there with that yet so I'm having to make
some difficult choices over what I work on and in what order.

On the plus side two features have just landed in Poky/Yocto:

* Improved toolchain bootstrap process (no file overwriting)
* A sysroot per machine

which are both things we've wanted in OE for years and help in various
ways (e.g. making sstate/pstage easier and reliable).

We also merged libtool 2.4 and found a security hole that OE hadn't
spotted. Those problems have been reported to libtool upstream.

Cheers,

Richard



