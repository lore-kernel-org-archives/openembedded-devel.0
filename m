Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nxbc5-0003pO-Ko for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 09:48:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NxbYt-0004Vt-U9 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 09:45:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 09:45:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 09:45:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 02 Apr 2010 09:44:01 +0200
Message-ID: <hp4781$59h$2@dough.gmane.org>
References: <1270152215-17642-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1270152215-17642-1-git-send-email-khimov@altell.ru>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] gd: add gd-ft recipe
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
X-List-Received-Date: Fri, 02 Apr 2010 07:48:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-04-10 22:03, Roman I Khimov wrote:
> GD with Freetype support, this kind of setup is needed for some
> packages like sarg. If needed, choose with
> 
> PREFERRED_PROVIDER_gd = "gd-ft"

Looking thru git log it seems that is more due to the build failing in
the past than a conscious decision. I vote for adding it to the main gd
recipe.

regards,

Koen

> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
>  recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
> 
> diff --git a/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb b/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
> new file mode 100644
> index 0000000..174bbe6
> --- /dev/null
> +++ b/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
> @@ -0,0 +1,8 @@
> +include gd_${PV}.bb
> +
> +DEPENDS += "freetype"
> +
> +PROVIDES = "gd"
> +RPROVIDES_${PN} = "gd"
> +
> +EXTRA_OECONF += "--with-freetype"
> \ No newline at end of file

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLtaBBMkyGM64RGpERAlvwAKCo6DY8plmxaPTKytLpfjnA15WKuQCeJjJ8
94PMNj9J2B6SaxcLeQEaNkg=
=Jxf0
-----END PGP SIGNATURE-----



