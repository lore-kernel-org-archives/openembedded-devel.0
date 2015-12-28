Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2704A60589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:16:59 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1aDXfT-0004Nl-Fg for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2015 14:16:55 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 14:16:55 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 14:16:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Dec 2015 14:16:49 +0100
Message-ID: <n5rco1$fn0$1@ger.gmane.org>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
In-Reply-To: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 28 Dec 2015 13:17:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-12-15 om 22:41 schreef Burton, Ross:
> Hi,
> 
> So I've just done an oe-core world build with my latest .la-killer class 
> enabled ( 
> https://github.com/rossburton/meta-ross/blob/master/classes/wipe-la.bbclass)
>
> 
and the results are pretty good.  Basically this class hooks onto
> do_install and simply deletes every *.la file it can find in ${D}, with
> an opt-out if required.  .la files can cause rebuild problems if
> directories move around and are mostly pointless on Linux anyway, so they
> can just be deleted.
> 
> One recipe (opensp-native) needs to opt out of the .la deletion as 
> openjade-native for <redacted> reasons explicitly expects .la files to
> be installed.  Some other desktop distros already strip out .la files so
> I wouldn't be surprised if there's a patch floating around to solve
> this.
> 
> One recipe fails to build (gcc-sanitizers) as it expects to have built
> its own libstdc++ so the recipe just deletes the source and drops in
> symlinks to the libraries in the sysroot.  Works, but is nasty.   I could
> either opt gcc out of la removal, or improve the fixup to make it
> actually link to the installed libraries.  Or, merge the sanitisers into
> the main gcc recipe, as I can't recall why they're separate anyway.
> 
> Apart from that, my world build was successful.
> 
> So in the new year I plan on submitting a renamed version of this class
> to oe-core and adding it to INHERIT_DISTRO.  Any comments?

Go ahead, .la files need to go away in the OE world. I wish your class had
an option to kill them with fire, but alas.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFWgTZAMkyGM64RGpERAph9AJ0Tdmw9r3WW5OrQv6FTUGdh6zOiIwCcCyuu
9CHG+z9GGf7hW4GkdaRchZU=
=l+7i
-----END PGP SIGNATURE-----


