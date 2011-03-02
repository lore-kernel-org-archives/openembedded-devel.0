Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PuuU3-0006Yu-NU for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:25:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PuuSe-0000Y5-1F for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:24:00 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 23:24:00 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 23:24:00 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 02 Mar 2011 23:23:49 +0100
Message-ID: <ikmg1l$gh4$1@dough.gmane.org>
References: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
	<1299103214-30434-3-git-send-email-tom_rini@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1299103214-30434-3-git-send-email-tom_rini@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/3] angstrom-2008-preferred-versions.inc: Lock policykit
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
X-List-Received-Date: Wed, 02 Mar 2011 22:25:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-03-11 23:00, Tom Rini wrote:
> glib-2.0 is locked to a version that will not work with policykit
> newer than 0.97.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Koen Kooi <koen@openembedded.org>

But keep the following in mind:
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-March/004372.html

> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index feaa2a7..d79f64b 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -46,6 +46,8 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
>  #PREFERRED_VERSION_pixman	= "0.13.2"
>  PREFERRED_VERSION_pkgconfig	= "0.23"
>  PREFERRED_VERSION_pkgconfig-native = "0.23"
> +PREFERRED_VERSION_policykit     = "0.96"
> +PREFERRED_VERSION_policykit-gnome = "0.96"
>  PREFERRED_VERSION_pulseaudio 	= "0.9.15"
>  PREFERRED_VERSION_python-pycairo = "1.8.0"
>  PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNbsN0MkyGM64RGpERAhTkAKCB43gqB9SAlei3qLpM/Gowpqa1fwCeLjlA
3g74JEGqz8MFmGoE31munGU=
=XV0P
-----END PGP SIGNATURE-----



