Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIsd3-0005e7-AB for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 03:17:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIsaQ-0004wY-Lo for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 03:15:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 03:15:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 03:15:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 May 2011 03:02:26 +0200
Message-ID: <iq4q32$e40$3@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 6/8] p910nd: add 0.95 version
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
X-List-Received-Date: Sun, 08 May 2011 01:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-05-11 00:11, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/p910nd/files/avahi       |    9 ++++
>  meta-oe/recipes-support/p910nd/files/p910nd.init |   38 ++++++++++++++++
>  meta-oe/recipes-support/p910nd/p910nd_0.95.bb    |   51 ++++++++++++++++++++++
>  3 files changed, 98 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/p910nd/files/avahi
>  create mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init
>  create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb
> 
> diff --git a/meta-oe/recipes-support/p910nd/files/avahi b/meta-oe/recipes-support/p910nd/files/avahi

> +    <txt-record>product=foonas network printer</txt-record>

That's oddly distro specific


> +DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer."
> +SECTION = "console/utils"
> +HOMEPAGE = "http://p910nd.sourceforge.net/"
> +SECTION = "console/utils"
> +RDEPENDS_${PN}-avahi = "avahi"

Again, RDEPENDS go below do_install


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxeuiMkyGM64RGpERAsmWAJ4/sQ2RMlCqucl+Ree3zoMFyEaH3gCgtjqw
KvtbwgJ2qcFQNJOtKhWZnK4=
=fzFo
-----END PGP SIGNATURE-----



