Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P2jbx-0006Ks-IA for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 13:53:42 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P2jbf-0004dZ-DF for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 13:53:23 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 13:53:23 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 13:53:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 04 Oct 2010 13:53:14 +0200
Message-ID: <i8cf7a$k9i$1@dough.gmane.org>
References: <1286176217-20316-1-git-send-email-sledz@dresearch.de>
	<1286189412-21563-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <1286189412-21563-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] epiphany-2.30.2: unbreak build by adding ca-certificates dependencies
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
X-List-Received-Date: Mon, 04 Oct 2010 11:53:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-10-10 12:50, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/gnome/epiphany_2.30.2.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
> index 426d468..f0d4f5d 100644
> --- a/recipes/gnome/epiphany_2.30.2.bb
> +++ b/recipes/gnome/epiphany_2.30.2.bb
> @@ -1,7 +1,8 @@
>  DESCRIPTION = "GNOME default webbrowser"
> -DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
> +DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification ca-certificates"
>  RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
> -PR = "r2"
> +RRECOMMENDS = "ca-certificates"

NAK, that should be RRECOMMENDS_${PN}, you can catch such errors by doing:

bitbake -b foo.bb -c recipe_sanity -D

Provided you either use angstrom or inherit recipe_sanity. Kudos to
Chris for creating that class.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMqcAqMkyGM64RGpERAjwgAJ0e3s+cAf85EfPL+jBupqrKEjmWsACfeYfC
ZTXF7OZEGctDPRKqMARYj1E=
=0QSX
-----END PGP SIGNATURE-----



