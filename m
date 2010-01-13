Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUyaR-0007y0-C0 for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 09:28:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUyYJ-0004dk-17
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 09:26:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 09:26:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 09:26:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 09:25:45 +0100
Message-ID: <hik028$l2q$1@ger.gmane.org>
References: <1263337290.13906.27.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100110 Shredder/3.0.1pre
In-Reply-To: <1263337290.13906.27.camel@utx.utx.cz>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: GTK+, disabled XKB a.k.a. why keymaps/ModeSwitch don't work well in GPE or XFCE
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
X-List-Received-Date: Wed, 13 Jan 2010 08:28:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-01-10 00:01, Stanislav Brabec wrote:
> Hallo.
> 
> We just spent some time by debugging of an annoying bug - broken
> Mode_Switch key in GPE and XFCE.
> 
> Surprisingly, the problem affects only GTK+ applications and it is
> caused by --disable-xkb configure options in OE gtk+ recipes(*).
> 
> It
> - made impossible to upgrade to the new version of kdrive on Zaurus
> - now makes impossible to upgrade to Xorg on Zaurus
> - causes keyboard breakage on Always Innovating Touch Book.
>   http://bugzilla.alwaysinnovating.com/show_bug.cgi?id=41
> 
> So there is a question: Why XKB is disabled in OE GTK+? Does it have any
> reason or it is a relict from the ancient age of kdrive based
> systems(**)? If it is true, I propose a patch to remove --disable-xkb
> not only from gtk+, but also all xorg-app and xorg-lib,

I vote for this option.

> or at least move
> this option to distribution configuration.

I think we can put that burden on xkb haters (if they exist).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTYOJMkyGM64RGpERAij5AKCiFh6ugEWa2s9OuaJTQok9EDg6IwCeK6aW
OuAdysqxQeP0SZxLFcbDMxw=
=Sqtj
-----END PGP SIGNATURE-----



