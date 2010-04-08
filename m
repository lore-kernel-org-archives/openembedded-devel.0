Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nzrx4-0004Jm-0s for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 15:39:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nzrto-0004g3-MK for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 15:36:00 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 15:36:00 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 15:36:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 Apr 2010 15:35:46 +0200
Message-ID: <hpkm3i$730$1@dough.gmane.org>
References: <1270726465-1273-1-git-send-email-stefan@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100329 Shredder/3.0.5pre
In-Reply-To: <1270726465-1273-1-git-send-email-stefan@datenfreihafen.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008-preferred-versions.inc: Bump python version to 2.6.4
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
X-List-Received-Date: Thu, 08 Apr 2010 13:39:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 08-04-10 13:34, Stefan Schmidt wrote:
> This is done to match the python-native version. Without this we seem to get
> trouble with some header mismatch or similar:
> 
>  ./libpython2.6.so: undefined reference to `_PyParser_Grammar'
> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index dcab24b..79d1fd1 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -36,7 +36,7 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
>  PREFERRED_VERSION_pkgconfig	= "0.23"
>  PREFERRED_VERSION_pkgconfig-native = "0.23"
>  PREFERRED_VERSION_pulseaudio 	= "0.9.15"
> -PREFERRED_VERSION_python = "2.6.2"
> +PREFERRED_VERSION_python = "2.6.4"
>  PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-embedded = "${ANGSTROM_QT_VERSION}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLvduyMkyGM64RGpERAmZiAKC8afJat3rpG0pGlW2mUovtKG+YWwCfbsC3
xwGntmgCIFKIpODhOc3o19Y=
=eWTJ
-----END PGP SIGNATURE-----



