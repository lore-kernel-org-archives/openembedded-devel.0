Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtEhX-0000gr-FB for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:08:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtEd6-0004GX-9p for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:04:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 10:04:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 10:04:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Aug 2011 10:03:54 +0200
Message-ID: <j2d89a$5qf$1@dough.gmane.org>
References: <cover.1313478102.git.anders@chargestorm.se>
	<2acdd12f7e62c4cb1f392cc2f5ed21d48f71c481.1313478102.git.anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <2acdd12f7e62c4cb1f392cc2f5ed21d48f71c481.1313478102.git.anders@chargestorm.se>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH 1/1] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 16 Aug 2011 08:08:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-08-11 09:12, Anders Darander schreef:
> This stops (most) x11 packages leaking into a non-x11 distro by mistake.

Thanks, applied

> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> 
> The patch was imported from the oe-core git server (git://git.openembedded.org/openembedded-core) as of commit id 2f94ff4fdb66755ba2448794baea19315ff96273.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se> --- meta-oe/recipes-graphics/xorg-lib/libx11.inc |    5 +++++ 1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11.inc b/meta-oe/recipes-graphics/xorg-lib/libx11.inc index 2aa9700..9f7e990 100644 --- a/meta-oe/recipes-graphics/xorg-lib/libx11.inc +++ b/meta-oe/recipes-graphics/xorg-lib/libx11.inc @@ -45,3 +45,8 @@ do_compile_prepend() { cd ../../ ) || exit
> 1 } + +python () { +       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d): +       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO") +}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSiRqMkyGM64RGpERAnL8AJ0TOx00BOuGrgc8tOTyG7DRC6iKQQCgkemv
jur8/elTsckY0AojZuWEvWc=
=lrZE
-----END PGP SIGNATURE-----



