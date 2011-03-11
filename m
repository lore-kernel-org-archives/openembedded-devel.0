Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PyBfo-0000w8-KA for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:23:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PyBeE-0002Dv-3G for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:21:30 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 00:21:30 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 00:21:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 12 Mar 2011 00:21:17 +0100
Message-ID: <ileapd$gdk$1@dough.gmane.org>
References: <1299882034-23172-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1299882034-23172-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] nodejs: update to 0.4.2
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
X-List-Received-Date: Fri, 11 Mar 2011 23:23:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-03-11 23:20, Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Does this one actually build? 0.4.0 doesn't :(

> ---
>  ...s-cc_0.4.0.patch => libev-cross-cc_0.4.2.patch} |    0
>  .../nodejs/{nodejs_0.4.0.bb => nodejs_0.4.2.bb}    |    4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes/nodejs/files/{libev-cross-cc_0.4.0.patch => libev-cross-cc_0.4.2.patch} (100%)
>  rename recipes/nodejs/{nodejs_0.4.0.bb => nodejs_0.4.2.bb} (77%)
> 
> diff --git a/recipes/nodejs/files/libev-cross-cc_0.4.0.patch b/recipes/nodejs/files/libev-cross-cc_0.4.2.patch
> similarity index 100%
> rename from recipes/nodejs/files/libev-cross-cc_0.4.0.patch
> rename to recipes/nodejs/files/libev-cross-cc_0.4.2.patch
> diff --git a/recipes/nodejs/nodejs_0.4.0.bb b/recipes/nodejs/nodejs_0.4.2.bb
> similarity index 77%
> rename from recipes/nodejs/nodejs_0.4.0.bb
> rename to recipes/nodejs/nodejs_0.4.2.bb
> index be3d23e..912eb5d 100644
> --- a/recipes/nodejs/nodejs_0.4.0.bb
> +++ b/recipes/nodejs/nodejs_0.4.2.bb
> @@ -9,8 +9,8 @@ SRC_URI = " \
>    file://libev-cross-cc_${PV}.patch \
>  "
>  
> -SRC_URI[md5sum] = "18f89256751f9b8e27dee8494f508171"
> -SRC_URI[sha256sum] = "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
> +SRC_URI[md5sum] = "9e9e791e125f6a601ebc663dc99c72a8"
> +SRC_URI[sha256sum] = "09b1100ca6828eedbe52418fbeb3352d71c0b1ff3344c44a5af3efb80c5b908c"
>  
>  S = "${WORKDIR}/node-v${PV}"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNeq5tMkyGM64RGpERArrqAKCgQTAc+nyejLxjd5TS2uzVyHhxOgCgqZDa
Gwvp7HdUl9v9cjE7QaZ16aQ=
=Ud6v
-----END PGP SIGNATURE-----



