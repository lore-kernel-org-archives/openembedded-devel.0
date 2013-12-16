Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6E39E6E208
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 10:05:36 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VsV3N-0000Wb-Si for openembedded-devel@lists.openembedded.org;
	Mon, 16 Dec 2013 11:05:33 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 11:05:33 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 11:05:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 Dec 2013 11:07:37 +0100
Message-ID: <l8mj8n$bv2$1@ger.gmane.org>
References: <1387183299-7468-1-git-send-email-Matthieu.Crapet@ingenico.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1387183299-7468-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Enigmail-Version: 1.6
Subject: Re: [RFC PATCHv2] bash-completion: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 10:05:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthieu Crapet schreef op 16-12-13 09:41:
> This new recipe discards the old recipe in OE-Classic: 
> http://layers.openembedded.org/layerindex/oe-classic/recipe/16369/
> 
> When building ready-to-use images (like .vmdk), it is sometimes
> convenient to have a fancy shell environment.
> 
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com> --- 
> .../bash-completion/bash-completion_2.0.bb         | 31
> ++++++++++++++++++++++ 1 file changed, 31 insertions(+) create mode
> 100644 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> 
> diff --git
> a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb new file
> mode 100644 index 0000000..c70d988 --- /dev/null +++
> b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb @@ -0,0
> +1,31 @@ +DESCRIPTION = "Programmable Completion for Bash 4" +HOMEPAGE =
> "http://bash-completion.alioth.debian.org/" +BUGTRACKER =
> "https://alioth.debian.org/projects/bash-completion/" + +LICENSE =
> "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" + +SECTION =
> "console/utils" +RDEPENDS_${PN} = "bash"

R* vars go below do_install

> +PE = "1"

New recipe, so drop PE

> + 
> +SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
>
> 
+
> +SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8" +SRC_URI[sha256sum]
> = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804" + 
> +inherit allarch autotools + +do_configure() { +	oe_runconf +}

Can you add a comment why autotools_do_configure fails?

> + +do_install_append() { +	install -d
> ${D}${sysconfdir}/bash_completion.d/ +	echo '.
> ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion +} 
> + +# Some recipes are providing ${PN}-bash-completion packages 
> +PACKAGES_prepend += "${PN}-extra "

PACKAGES =+ "${PN}-extra"

> +FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \ +
> ${datadir}/${BPN}/helpers/"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSrtDpMkyGM64RGpERAoQpAJ4vfbU5Q0laNx8W61aMEEfao8gtfwCggn2l
mJXDKKcx/uPPjhiEDZhc7LE=
=IlfI
-----END PGP SIGNATURE-----


