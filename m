Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIsTK-0005DL-OF for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 03:07:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIsQj-0002DS-8y for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 03:05:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 03:05:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 03:05:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 May 2011 03:00:38 +0200
Message-ID: <iq4pvm$e40$2@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 4/8] freerdp: add recipe based on GIT from 2009-03-29
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
X-List-Received-Date: Sun, 08 May 2011 01:07:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-05-11 00:11, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/freerdp/freerdp.inc    |   23 +++++++++++++++++++++++
>  meta-oe/recipes-support/freerdp/freerdp_git.bb |   15 +++++++++++++++
>  2 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
> new file mode 100644
> index 0000000..094f9c6
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp.inc
> @@ -0,0 +1,23 @@
> +# Copyright (C) 2010, 2011 O.S. Systems Software Ltda. All Rights Reserved
> +# Released under the MIT license
> +
> +DESCRIPTION = "FreeRDP RDP client"
> +HOMEPAGE = "http://freerdp.sourceforge.net"
> +DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
> +RDEPENDS_${PN} += "xprop"

Same comment as before, RDEPENDS are in the package section, so below
do_install
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxes2MkyGM64RGpERApaEAJ9um0v6zRdLsqitkxeHYEj8rEs3WACglTVP
7i85waMzo9JielLgiH2/ABg=
=5Fai
-----END PGP SIGNATURE-----



