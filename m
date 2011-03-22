Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1xzR-00089J-SO for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:35:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1xg9-0006gR-Lt for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:15:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:15:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:15:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 22 Mar 2011 10:07:00 +0100
Message-ID: <im9orl$85o$2@dough.gmane.org>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Tue, 22 Mar 2011 09:35:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-03-11 09:01, heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <heinold@inf.fu-berlin.de>
> 
> 
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  recipes/cairo/cairo.inc |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
> index c60d7d9..fad50b3 100644
> --- a/recipes/cairo/cairo.inc
> +++ b/recipes/cairo/cairo.inc
> @@ -1,15 +1,22 @@
>  SECTION = "libs"
>  PRIORITY = "optional"
> -DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
>  DESCRIPTION = "Cairo graphics library"
>  LICENSE = "MPL LGPL"
>  
> +DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
> +
> +DEPENDS_append_arm = " libatomic-ops"
> +DEPENDS_append_mips = " libatomic-ops"
> +DEPENDS_append_mipsel = " libatomic-ops"
> +DEPENDS_append_ppc = " libatomic-ops"
> +

what about the 64bit and eb versions of those? And gnuspe?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNiGa0MkyGM64RGpERAkjBAKCBxAqPrwlM44loiYqNHuDqAGSbcACgmY8x
ZE08FcXVn8I9UsC+hJkWxhY=
=KpPl
-----END PGP SIGNATURE-----



