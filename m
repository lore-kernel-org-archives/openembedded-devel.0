Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1I0xxQ-0002Kb-BU
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 13:02:42 +0200
Received: from pd9538177.dip0.t-ipconnect.de ([217.83.129.119]
	helo=olympus.klever.net)
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1I0xhh-0004iR-J7 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 12:46:25 +0200
Message-ID: <4679053B.4060606@klever.net>
Date: Wed, 20 Jun 2007 12:45:15 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
In-Reply-To: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
Subject: Re: [RFC] locales
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
X-List-Received-Date: Wed, 20 Jun 2007 11:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I do not see why do we want to get rid of non-utf locales. Wouldn't an 
attempt to make utf-locales work more productive? And I believe making 
things work should be of higher priority than making packaging friendlier.

At the moment, we have troubles entering non-latin utf8 in x11. That 
should be fixed before going any further. And before you can fix it you 
need to find out what exactly the problem is. This is where I'd suggest 
that we start at.

Love,
H

Sergey Lapin wrote:
> Hi, all!
> 
> Note: I could be fundamentally wrong here, so, please feel free to
> point me to right direction in this case.
> 
> As it was discussed on #oe, locale infrastructure lacks implementation
> on oe.dev, and, in particular, in Angstrom.
> 
> With a bit of research I done on this subject made me to come up with
> a few ideas, which I'd like to know your opinion about.
> 
> Present status:
> *-locale* packages are generated, but not put on image. These packages
> contain message translations.
> * Only glibc locale which is put on image (if any) is en_GB.
> 
> Infrastructure problem:
> * We need a way to set up automatic locale package installation during
> image build
> according to some subset of languages/locales.
> * We need a way to install "language" in simple user-friendly way. I
> mean here not only locale packages, but also various
> language-dependent files (docs, keymap settings, various configuration
> files, etc.).
> 
> Various random problems encountered:
> * GPE locale.alias for gpe-dm needs cleanup (get rid of non-UTF8 locales?)
> * libx11 locale.alias needs cleanup (setup for UTF8-only system).
> 
> So, if we go utf8-only, we need to do a great cleanup/testing job here
> to settle things up.
> 
> As for infrastructure, I see several questionable methods of solving this:
> 
> 1. each package RRECOMMENDS its locale packages for locales mentioned
> in local.conf variable, and additional ones, which are related.
> 
> 2. image RRECOMMENDS locale packages blindly for all normal packages
> for languages which are in a var mentioned in 1.
> 
> 3. all -locale packages generated during builds are written to some
> special lists, for each language. Then meta-packages are generated
> from these lists.
> 
> ...
> 
> So, any ideas?
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


