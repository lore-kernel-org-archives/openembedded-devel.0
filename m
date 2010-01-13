Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV9Zf-0000vp-Js for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:12:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV9XZ-0004rv-TZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:10:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 21:10:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 21:10:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 20:53:01 +0100
Message-ID: <hil8at$835$4@ger.gmane.org>
References: <1263314629-15492-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263314629-15492-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] matchbox-session: simple provider of Matchbox session for X11 startup
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
X-List-Received-Date: Wed, 13 Jan 2010 20:12:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-01-10 17:43, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <hrw@koansoftware.com>

Acked-by: Koen Kooi <koen@openembedded.org>


> In GPE images we use gpe-session-scripts to provide Xsession init
> scripts for launching Matchbox components. But what if someone do not
> want GPE but want Matchbox?
> 
> Poky has it cleaned in other way.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/matchbox-session/matchbox-session.bb |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/matchbox-session/matchbox-session.bb
> 
> diff --git a/recipes/matchbox-session/matchbox-session.bb b/recipes/matchbox-session/matchbox-session.bb
> new file mode 100644
> index 0000000..c9014f9
> --- /dev/null
> +++ b/recipes/matchbox-session/matchbox-session.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Matchbox session support"
> +RDEPENDS = "matchbox-common"
> +# they do the same in other way
> +RCONFLICTS = "gpe-session-scripts"
> +
> +do_install() {
> +        install -d ${D}${sysconfdir}/X11/Xsession.d/
> +        ln -sf ${bindir}/matchbox-session ${D}${sysconfdir}/X11/Xsession.d/90matchbox-session
> +}
> +
> +PACKAGE_ARCH = "all"
> +PACKAGES = "${PN}"
> +
> +FILES_${PN} = "${sysconfdir}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTiSdMkyGM64RGpERAs3OAJ9KCftUBcdgmjvh3nIKGE9FXGC15wCfSiwN
4pY8wWTwcZVW7Zba23whThE=
=E1uW
-----END PGP SIGNATURE-----



