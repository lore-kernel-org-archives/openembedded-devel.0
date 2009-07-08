Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1MOQiA-0002cy-1Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 08:32:58 +0200
Received: from [192.168.0.20] (unknown [92.116.61.182])
	by drlauer-research.com (Postfix) with ESMTP id 5D31A584A91
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2009 08:55:31 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200907021504.13248.holger+oe@freyther.de>
References: <200907021504.13248.holger+oe@freyther.de>
Organization: Vanille-Media
Date: Wed, 08 Jul 2009 08:20:15 +0200
Message-Id: <1247034015.4669.25.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
Subject: Re: Questions regarding DISTRO = "minimal"
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
X-List-Received-Date: Wed, 08 Jul 2009 06:32:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Holger,

> I'm currently toying with creating a "minimal" uclibc image and while using 
> minimal-uclibc I got several questions in #oe along the line claiming 
> "minimal" is current unmaintained.

Not really, it's just falling under my temporary (until we have a TSC in
place) org.oe.dev boycott.

> I have some questions to help me building a opinion regarding "minimal". What 
> is the differentiation between minimal and micro, minimal and angstrom. What 
> niche is minimal trying to solve? And is minimal the right name for it?

Here's the story:

First, there was the "generic" distro -- an attempt to create a simple
distro config that builds for a few very common targets without
including too many policies, so that people could understand it and use
it as a starting point when they felt the need to create an own distro
config.

Alas, people misunderstood that, thinking that 'generic' meant it would
build for all targets and complained. To make it more clear that it was
about a minimal amount of distro policies, it had been renamed to
'minimal' (sic!).

A bit later, when Angstrom started to become the best maintained distro
in OE, I was worrying about the quality of our metadata. Angstrom
included many configurations that hided actual bugs in our metadata
(such as inconsistent versioning and bogus default providers etc.)
At some point of time, before Angstrom would be the _only_ distro that
built in OE (thus compromising an important distinction), I took the
plunge and refactored many (good) settings from Angstrom into generic
include and configuration files, so that all distros would benefit from
the toolchain knowledge that went into Angstrom.

There was the hope that eventually the Angstrom folks would realize the
benefit of that and would also move to more reusable config files. Alas,
due to the social problems in our community this didn't happend and will
probably never.

The question now is how do we move from here? We could rename minimal
back to generic -- in fact that's what it was for right from the start.

Whatever we decide on, it's important that we do not rely on one distro
to rule them all -- this will inevitably lower the metadata quality
hence the usability of OE.

Cheers,

:M:



