Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I7R6E-0006fh-LW
	for openembedded-devel@openembedded.org; Sun, 08 Jul 2007 09:22:30 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I7R0w-0008Mr-Rj
	for openembedded-devel@openembedded.org; Sun, 08 Jul 2007 09:17:02 +0200
Received: from host86-131-239-9.range86-131.btcentralplus.com ([86.131.239.9])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 08 Jul 2007 09:17:02 +0200
Received: from koen by host86-131-239-9.range86-131.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 08 Jul 2007 09:17:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 08 Jul 2007 08:16:46 +0100
Message-ID: <f6q30v$s2$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: host86-131-239-9.range86-131.btcentralplus.com
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
In-Reply-To: <513012886.20070708041151@gmail.com>
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Sun, 08 Jul 2007 07:22:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello openembedded-devel,
> 
>   We already discussed issue of providing more exact device screen
> properties info than currently available screen classes "smallscreen"
> and "bigscreen". I for one was proponent of staying with those classes
> instead of hasting with introducing too many screen parameters without
> proper way of handling them in OE. However, it's just the matter of
> fact that at least the most basic of them, like screen dimensions are
> already in use by more than one package (I can point to opie and
> fbreader out of top of mind), and so far in adhoc manner, so
> standardizing them would be beneficial.
> 
>   When discussing this on IRC, Marcin Juszkiewicz pointed me to Poky's
> formfactor package, designed to query various device properties at
> runtime (including current screen resolution).
> http://svn.o-hand.com/view/poky/trunk/meta/packages/formfactor/

Formfactor is a hack that does nothing what our Xserver scripts and HAL+OHM can't do. And
we were explicitly asked *not* to merge it into OE by someone from o-hand.

>   I think that it is great tool, and we should merge and leverage it
> in OE by all means. But it handles only runtime configuration,

And we already have sufficient tools inplace to handle that, formfactor just muddies the
waters. And if you take a closer look at formfactor, you'll notice it's internally
inconsistent (e.g. dpi = resolution/size, but you need to specify all 3 in formfactor)


>    Now with formfactor around, I guess it would be nice to use
> consistent variable names for the same info. Marcin still suggested to
> use MACHINE_ prefix for build-time (i.e. machine config) variables.
> So, the exact topic of this RFC is adding
> 
> MACHINE_DISPLAY_WIDTH_PIXELS=
> MACHINE_DISPLAY_HEIGHT_PIXELS=
> 
> to machine configs.

We can add those without adding formfactor. But what will those setting be for e.g. an
nslu2 or efika board?

regards,

Koen





-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGkI9eMkyGM64RGpERAlDQAJ0WTX9BbRKn7/3/X054Vl2iYUeVZgCbBLkn
ado8odEDSAko1n1+LyCj9+E=
=00Rv
-----END PGP SIGNATURE-----



