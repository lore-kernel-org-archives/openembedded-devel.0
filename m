Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Opegi-0002Pq-Nl for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 12:00:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpegG-0002ly-2r for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 12:00:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 12:00:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 12:00:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 29 Aug 2010 11:56:19 +0200
Message-ID: <i5das3$v2$3@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-12-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1283027073-12308-12-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Sun, 29 Aug 2010 10:00:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-08-10 22:24, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/udev/udev-compat141_141.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compat141_141.bb
> index 2411fc6..c39d4cb 100644
> --- a/recipes/udev/udev-compat141_141.bb
> +++ b/recipes/udev/udev-compat141_141.bb
> @@ -15,7 +15,11 @@ PACKAGES = "${PN} ${PN}-dbg"
>  PROVIDES = "udev-compat"
>  
>  # Need udev with udev-compat-wrapper support and nothing else.
> -RDEPENDS_${PN} = "udev-compat-wrapper"
> +RDEPENDS_${PN}_spitz = "udev-compat-wrapper"
> +RDEPENDS_${PN}_akita = "udev-compat-wrapper"
> +RDEPENDS_${PN}_c7x0 = "udev-compat-wrapper"
> +RDEPENDS_${PN}_poodle = "udev-compat-wrapper"
> +
>  # Remove hotplug RPROVIDES
>  RPROVIDES_${PN} = "udev-compat"

NAK, this is a generic wrapper to use recent udev on older kernels, not
specific to zaurus.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMei7DMkyGM64RGpERAlCJAKCmAKGCSfycd7te59U6LXjh2uB16wCeKAtv
BwH22cNlpYQZPS2ohlGp7tc=
=VWjc
-----END PGP SIGNATURE-----



