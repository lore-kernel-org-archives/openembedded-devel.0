Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PZqpj-0005k3-6D for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:16:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PZqpN-0001VO-9l for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:16:25 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 21:16:25 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 21:16:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 03 Jan 2011 21:16:13 +0100
Message-ID: <iftaqd$6m4$1@dough.gmane.org>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 01/12] gstd: fix type in RRECOMENDS
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
X-List-Received-Date: Mon, 03 Jan 2011 20:16:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-01-11 21:01, Bernhard Reutner-Fischer wrote:
> /RRECOMENDS/s/COM/COMM/
> 
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/gstd/gstd_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gstd/gstd_git.bb b/recipes/gstd/gstd_git.bb
> index 5e73662..4617b85 100644
> --- a/recipes/gstd/gstd_git.bb
> +++ b/recipes/gstd/gstd_git.bb
> @@ -25,7 +25,7 @@ do_configure() {
>  }
>  
>  RDEPENDS_${PN} = "dbus dbus-glib gstreamer gst-plugins-base"
> -RRECOMENDS_${PN} = "gstreamer-ti"
> +RRECOMMENDS_${PN} = "gstreamer-ti"

Such changes require a PR bump
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNIi6NMkyGM64RGpERAtRuAJ9gDfwcyVvBpqU1nuKonGb/6I8fyQCfXOEd
BO/iH4J7dGPQdTChKgNWT3o=
=0DBK
-----END PGP SIGNATURE-----



