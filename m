Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MKB7M-0006h2-U6
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 15:05:25 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MKAwM-0001Gy-CW
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 13:54:02 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MKAwM-00018z-1L
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 13:54:02 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1246018567-24513-1-git-send-email-msmith@cbnco.com>
References: <1246018567-24513-1-git-send-email-msmith@cbnco.com>
Date: Fri, 26 Jun 2009 13:54:01 +0100
Message-Id: <1246020841.6690.267.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH 1/2][resend] tcpdump: fix mix of tabs and spaces
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
X-List-Received-Date: Fri, 26 Jun 2009 13:05:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks for the patch.  I checked this in.

p.

On Fri, 2009-06-26 at 08:16 -0400, Michael Smith wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/tcpdump/tcpdump_3.9.7.bb |   10 ++++++----
>  recipes/tcpdump/tcpdump_4.0.0.bb |   16 +++++++++-------
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes/tcpdump/tcpdump_3.9.7.bb b/recipes/tcpdump/tcpdump_3.9.7.bb
> index ba9710d..163d74f 100644
> --- a/recipes/tcpdump/tcpdump_3.9.7.bb
> +++ b/recipes/tcpdump/tcpdump_3.9.7.bb
> @@ -5,8 +5,10 @@ SECTION = "console/network"
>  PRIORITY = "optional"
>  DEPENDS = "libpcap"
>  
> -SRC_URI = "http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> -           file://tcpdump_configure_no_-O2.patch;patch=1"
> +SRC_URI = " \
> +	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> +	file://tcpdump_configure_no_-O2.patch;patch=1 \
> +"
>  
>  inherit autotools
>  
> @@ -15,6 +17,6 @@ EXTRA_OECONF = "--without-crypto"
>  do_configure() {
>  	gnu-configize
>  	oe_runconf
> -        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> -        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
> +	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> +	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
>  }
> diff --git a/recipes/tcpdump/tcpdump_4.0.0.bb b/recipes/tcpdump/tcpdump_4.0.0.bb
> index 537cb36..7f99220 100644
> --- a/recipes/tcpdump/tcpdump_4.0.0.bb
> +++ b/recipes/tcpdump/tcpdump_4.0.0.bb
> @@ -6,10 +6,12 @@ PRIORITY = "optional"
>  DEPENDS = "libpcap"
>  PR = "r1"
>  
> -SRC_URI = "http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> -           file://tcpdump_configure_no_-O2.patch;patch=1 \
> -           file://no-ipv6-tcpdump4.patch;patch=1 \
> -           file://0001-minimal-IEEE802.15.4-allowed.patch;patch=1"
> +SRC_URI = " \
> +	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> +	file://tcpdump_configure_no_-O2.patch;patch=1 \
> +	file://no-ipv6-tcpdump4.patch;patch=1 \
> +	file://0001-minimal-IEEE802.15.4-allowed.patch;patch=1 \
> +"
>  
>  inherit autotools
>  # ac_cv_linux_vers=${ac_cv_linux_vers=2}
> @@ -18,8 +20,8 @@ EXTRA_OECONF = "--without-crypto"
>  
>  do_configure() {
>  	gnu-configize
> -    autoconf
> +	autoconf
>  	oe_runconf
> -        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> -        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
> +	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> +	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
>  }



