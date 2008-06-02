Received: from [194.158.229.90] (helo=smtp-auth-be-05.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1K3IIF-0001ub-4X
	for openembedded-devel@openembedded.org; Tue, 03 Jun 2008 00:14:19 +0200
Received: from [192.168.26.12] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140]) (authenticated bits=0)
	by smtp-auth-be-05.sunrise.ch (8.13.1/8.13.5) with ESMTP id
	m52MA7RZ021588; Tue, 3 Jun 2008 00:10:07 +0200
Message-ID: <48446FB3.8000201@vollmann.ch>
Date: Tue, 03 Jun 2008 00:09:55 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.14 (X11/20080502)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <g1jlpn$f7f$1@ger.gmane.org> <4843CCD6.8070601@vollmann.ch>
	<1212404836.5008.16.camel@dax.rpnet.com>
In-Reply-To: <1212404836.5008.16.camel@dax.rpnet.com>
Subject: Re: BB_STAMP_POLICY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 22:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> The correct solution from a bitbake/OE perspective is to have multiple
> providers, one for set of options combination and to switch between them
> using PREFERRED_PROVIDER.
I understand, and that's why I started that way.
But it starts to explode, and I have some uncomfortable feeling about
breaking changes going unnoticed...

> The biggest challenge you find when doing this is lots of recipes use
> ${PN} internally and by creating a new package you then need to hardcode
> that variable.
Another problem is the hardcoded name of packages inside recipes
(glibc-package.bbclass is a prominent example for that).

> Since thats the main barrier to doing this
I wouldn't say that's the main barrier.  It's annoying, but once
you know what to look for it's just some search and replace.

The biggest problem I see are silent breaks, because of changes in
some configuration files that are not tracked by dependency checking.

 > I'd propose trying to remove
> that obstacle. We could do this by having:
> 
> bitbake.conf:
> 
> PKGPN ?= "${PN}"
> 
> and then using PKGPN in recipes instead of PN. If you then create a
> glibc-some-extra-option you can just add a line which says:
> 
> PKGPN = "glibc"
> 
> and it should all work. This would also be useful for -sdk and -native
> recipes for example which currently have nastier workarounds for this
> problem.
> 
> Would this solve the problem?
It would make the the setup of the additional recipes easier, but
it doesn't solve the main problem of breaking changes.
For that maybe something in insane.bbclass could check and complain
about settings like EXTRA_OECONF_xyz in a conig file when
BB_STAMP_POLICY is set.

   Detlef



