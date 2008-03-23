Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JdEEQ-0005ME-RB
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Mar 2008 01:38:39 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JdEEP-0002io-7T
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Mar 2008 19:38:37 -0500
Message-ID: <47E5A67B.5030809@dls.net>
Date: Sat, 22 Mar 2008 19:38:19 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>	<1205858910.7500.39.camel@dax.rpnet.com>
	<frosov$c0b$1@ger.gmane.org>
In-Reply-To: <frosov$c0b$1@ger.gmane.org>
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Sun, 23 Mar 2008 00:38:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> | On Tue, 2008-03-18 at 15:32 +0100, Koen Kooi wrote:
> |> Geoffrey Wossum schreef:
> |> | I understand that opkg is a fork of ipkg, since ipkg was unmaintained.
> |>   But
> |> | could someone explain what, if anything, this means to me as someone
> |> | currently building a product using OpenEmbedded for the underpinning?
> |>
> |> It means that after this gets applied you login to your product:
> |>
> |> ssh user@mytarget
> |> $ su -
> |> Password:
> |> # ipkg update
> |> sh: ipkg: : command not found
> |> # opkg update
> |> <output of opkg downloading stuff from feeds>
> |>
> |> So from a device user POV you need to type 'opkg' instead of 'ipkg'.
> |> ~From a developer POV you gain PGP signed packages.
> |
> | That isn't the full story since the config files moved
> | from /usr/lib/ipkg to /usr/lib/opkg and distro maintainers need to be
> | wary of the transition.

!!  There's the understatement of the year!!

  I think Angstrom has something to help with this
> | but I'm not sure?
> 
> There is opkg-ipkg-compat.bb and angstrom-feed-configs.bb to help with a
> dual system, and opkg-r10.patch moves angstrom over to opkg completely.

I don't know what this means.  What do I do with these recipes?  I just 
want to get ipkg working again.

The latest builds of SlugOS seem to have ended up with a broken mix of 
ipkg and opkg stuff.  The feeds config files are in /etc/opkg; but 
/lib/ipkg still exists.  The ipkg command is very much still present, so 
I assume that Koen's example above requires that the distro maintainer 
(that would be me) has to do something.  The opkg utility is also 
present, and seems to work better than ipkg -- opkg downloads stuff, and 
dies when it runs the post-configure scripts.

> | While I think about this, would now be a good time to move the config
> | files to /var instead of /usr?
> 
> I have no strong opinion on that.
> 
> regards,
> 
> Koen
> 
> | Poky can't do that yet since we don't have the var changes in OE but I
> | think most of /var in OE is persistent now?
> |
> | Cheers,
> |
> | Richard
> 

Sorry for the late email on this thread.  I saw this, and made a note 
that we'd like to switch to opkg at some point.  I just didn't expect 
that it would end up pushed into the distro without some type of action 
on my part to enable this (disruptive) change.

On which mailing list was the technical discussion on how opkg worked, 
why opkg, and what distro maintainers should do to ensure that ipkg 
continued to work, or that the opkg transition went smoothly?  I can't 
find such a discussion on the various archives.

Regards
Mike (mwester)


