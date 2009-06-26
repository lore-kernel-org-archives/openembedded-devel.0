Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MKB7i-0006iK-Gu
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 15:05:46 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MKAwg-0001H3-Ex
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 13:54:23 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MKAwg-000197-1O
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 13:54:22 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1246018604-24648-1-git-send-email-msmith@cbnco.com>
References: <1246018567-24513-1-git-send-email-msmith@cbnco.com>
	<1246018604-24648-1-git-send-email-msmith@cbnco.com>
Date: Fri, 26 Jun 2009 13:54:21 +0100
Message-Id: <1246020861.6690.268.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH 2/2][resend] tcpdump 4.0.0-r2: remove extra ${sbindir}/tcpdump.4.0.0
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
X-List-Received-Date: Fri, 26 Jun 2009 13:05:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks for the patch.  I checked this in.

p.

On Fri, 2009-06-26 at 08:16 -0400, Michael Smith wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/tcpdump/tcpdump_4.0.0.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/tcpdump/tcpdump_4.0.0.bb b/recipes/tcpdump/tcpdump_4.0.0.bb
> index 7f99220..f36cc0a 100644
> --- a/recipes/tcpdump/tcpdump_4.0.0.bb
> +++ b/recipes/tcpdump/tcpdump_4.0.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>  SECTION = "console/network"
>  PRIORITY = "optional"
>  DEPENDS = "libpcap"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = " \
>  	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> @@ -25,3 +25,8 @@ do_configure() {
>  	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
>  	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
>  }
> +
> +do_install_append() {
> +	# tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
> +	rm -f ${D}${sbindir}/tcpdump.${PV}
> +}



