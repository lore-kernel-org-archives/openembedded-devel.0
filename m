Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QnorY-0001in-Iv for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 11:32:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QnonL-0004YG-0w for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 11:28:19 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 11:28:18 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 11:28:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 01 Aug 2011 11:28:07 +0200
Message-ID: <j15rj7$ng1$1@dough.gmane.org>
References: <4E364EB1.8050800@dresearch-fe.de>
	<1312189251.30326.498.camel@phil-desktop>
	<4E367018.7020709@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <4E367018.7020709@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: unnecessary dependencies?
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
X-List-Received-Date: Mon, 01 Aug 2011 09:32:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-08-11 11:21, Steffen Sledz schreef:
> On 01.08.2011 11:00, Phil Blundell wrote:
>> On Mon, 2011-08-01 at 08:58 +0200, Steffen Sledz wrote:
>>> We are working on an application which requires libgssdp.
>>> 
>>> libgssdp requires libsoup, libsoup inherits gnome, gnome inherits gtk-icon-cache, gtk-icon-cache rdepends hicolor-icon-theme. So this icon theme (probably a lot more gnome stuff) unnecessarily allocates place in our image (we do not have a GUI). :(
>>> 
>>> Are these deps really necessary?
>> 
>> It sounds as though libsoup possibly shouldn't be inheriting gnome.  Can you figure out whether gtk-icon-cache is actually doing anything useful in this case?
> 
> "libsoup is an HTTP client/server library" only. I can't really see any need for GUI componenets.

And if you look at the source, you'll see it links against libgnome-keyring, libgconf and and other GNOME, but non-GUI components. Libsoup is heavy, we all know that. So please send a patch for gtk-icon-cache to only conditionally add the RDEPENDS as I said earlier in this thread.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFONnGnMkyGM64RGpERAjPPAJ4wZYUAnfB4vyy8GF28FrkTvseHhgCfbhw4
iTv4QcQI2EnqO/pLou5itmk=
=rvYI
-----END PGP SIGNATURE-----



