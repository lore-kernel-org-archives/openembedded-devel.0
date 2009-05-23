Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M7yLf-0004mc-3w
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 23:01:51 +0200
Received: (qmail 5690 invoked from network); 23 May 2009 20:53:53 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 23 May 2009 13:53:53 -0700
Date: Sat, 23 May 2009 13:53:53 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090523205352.GN23842@smtp.west.cox.net>
References: <1243110920-18111-1-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-2-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-3-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-4-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-5-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-6-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1243110920-18111-6-git-send-email-mad_soft@inbox.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] hubbub: add recipe for version 0.0.1
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
X-List-Received-Date: Sat, 23 May 2009 21:02:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2009 at 12:35:19AM +0400, Dmitry Artamonow wrote:

> Hubbub is an HTML5 compliant parsing library, written in C.
> Currently only Netsurf browser is using it, so we build just static library.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/netsurf/hubbub_0.0.1.bb |   28 ++++++++++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/netsurf/hubbub_0.0.1.bb
> 
> diff --git a/recipes/netsurf/hubbub_0.0.1.bb b/recipes/netsurf/hubbub_0.0.1.bb
> new file mode 100644
> index 0000000..0d70b41
> --- /dev/null
> +++ b/recipes/netsurf/hubbub_0.0.1.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Hubbub is an HTML5 compliant parsing library"
> +HOMEPAGE = "http://www.netsurf-browser.org/projects/hubbub/"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "MIT"
> +DEPENDS = "libparserutils"
> +
> +SRC_URI = "http://www.netsurf-browser.org/projects/releases/hubbub-${PV}-src.tar.gz"
> +
> +inherit pkgconfig
> +
> +EXTRA_OEMAKE = "CURDIR=${S} DESTDIR=${D} PREFIX=${prefix} BUILDDIR=build-OE"
> +
> +# NOTE: we're using default buildmode here, which results in building only
> +# static libraries (.a) Not a problem as hubbub is only used by Netsurf
> +# at the moment
> +
> +do_stage() {
> +        oe_libinstall -a -C build-OE/ libhubbub ${STAGING_LIBDIR}
> +
> +        install -d ${STAGING_INCDIR}/hubbub
> +        install -m 0644 include/hubbub/*.h ${STAGING_INCDIR}/hubbub
> +}
> +
> +
> +do_install() {
> +	oe_runmake install
> +}
> -- 
> 1.6.0.6
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


