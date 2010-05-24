Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OGhJQ-0002cB-PB
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 01:44:01 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2Y00MV071VO9S6@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 May 2010 18:39:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4758014AF60; Mon,
	24 May 2010 19:39:31 -0400 (EDT)
Date: Mon, 24 May 2010 19:39:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100524233931.GL25484@denix.org>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
MIME-version: 1.0
In-reply-to: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 1/3] freetype: updated to 2.3.12
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
X-List-Received-Date: Mon, 24 May 2010 23:44:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, May 23, 2010 at 09:20:01PM +0200, Enrico Scholz wrote:
> That's (nearly) a copy of the old 2.3.11 recipe.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

I'm going to ack the first 2 patches, but skip the 3rd one for now, as I need 
to talk to our legal department first...

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  .../freetype/freetype-2.3.12/fix-configure.patch   |   13 ++++++
>  recipes/freetype/freetype-2.3.12/libtool-tag.patch |   20 ++++++++++
>  recipes/freetype/freetype_2.3.12.bb                |   40 ++++++++++++++++++++
>  3 files changed, 73 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/freetype/freetype-2.3.12/fix-configure.patch
>  create mode 100644 recipes/freetype/freetype-2.3.12/libtool-tag.patch
>  create mode 100644 recipes/freetype/freetype_2.3.12.bb
> 
> diff --git a/recipes/freetype/freetype-2.3.12/fix-configure.patch b/recipes/freetype/freetype-2.3.12/fix-configure.patch
> new file mode 100644
> index 0000000..ecd9673
> --- /dev/null
> +++ b/recipes/freetype/freetype-2.3.12/fix-configure.patch
> @@ -0,0 +1,13 @@
> +Index: freetype-2.3.6/builds/unix/configure.ac
> +===================================================================
> +--- freetype-2.3.6.orig/builds/unix/configure.ac
> ++++ freetype-2.3.6/builds/unix/configure.ac
> +@@ -506,8 +506,6 @@ AC_SUBST([FT2_EXTRA_LIBS])
> + AC_SUBST([SYSTEM_ZLIB])
> + 
> + 
> +-LT_INIT(win32-dll)
> +-
> + AC_SUBST([hardcode_libdir_flag_spec])
> + AC_SUBST([wl])
> + AC_SUBST([build_libtool_libs])
> diff --git a/recipes/freetype/freetype-2.3.12/libtool-tag.patch b/recipes/freetype/freetype-2.3.12/libtool-tag.patch
> new file mode 100644
> index 0000000..2f096cd
> --- /dev/null
> +++ b/recipes/freetype/freetype-2.3.12/libtool-tag.patch
> @@ -0,0 +1,20 @@
> +--- freetype-2.3.6/builds/unix/unix-cc.in	
> ++++ freetype-2.3.6/builds/unix/unix-cc.in	
> +@@ -88,7 +88,7 @@ 
> + #
> + #
> + CCraw := $(CC)
> +-CC    := $(LIBTOOL) --mode=compile $(CCraw)
> ++CC    := $(LIBTOOL) --tag=CC --mode=compile $(CCraw)
> + 
> + # Linker flags.
> + #
> +@@ -105,7 +105,7 @@ 
> + 
> + # Library linking
> + #
> +-LINK_LIBRARY = $(LIBTOOL) --mode=link $(CCraw) -o $@ $(OBJECTS_LIST) \
> ++LINK_LIBRARY = $(LIBTOOL) --tag=CC --mode=link $(CCraw) -o $@ $(OBJECTS_LIST) \
> +                           -rpath $(libdir) -version-info $(version_info) \
> +                           $(LDFLAGS) -no-undefined \
> +                           # -export-symbols $(EXPORTS_LIST)
> diff --git a/recipes/freetype/freetype_2.3.12.bb b/recipes/freetype/freetype_2.3.12.bb
> new file mode 100644
> index 0000000..de9ff29
> --- /dev/null
> +++ b/recipes/freetype/freetype_2.3.12.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "Freetype font rendering library"
> +SECTION = "libs"
> +LICENSE = "freetype"
> +PR = "r0"
> +
> +SRC_URI = "\
> +  ${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
> +  file://no-hardcode.patch;patch=1 \
> +  file://fix-configure.patch;patch=1 \
> +  file://libtool-tag.patch;patch=1 \
> +"
> +S = "${WORKDIR}/freetype-${PV}"
> +
> +SRC_URI[md5sum] = "e974a82e5939be8e05ee65f07275d7c5"
> +SRC_URI[sha256sum] = "3b96438f016a62b676c1d2089c00ca777f710d19f6aefa66ccf068d360db3e92"
> +
> +inherit autotools pkgconfig binconfig
> +
> +LIBTOOL = "${HOST_SYS}-libtool"
> +EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
> +EXTRA_OECONF = "--without-zlib"
> +
> +do_configure() {
> +	cd builds/unix
> +	libtoolize --force --copy
> +	gnu-configize --force
> +	aclocal -I .
> +	autoconf
> +	cd ${S}
> +	oe_runconf
> +}
> +
> +do_compile_prepend() {
> +	${BUILD_CC} -o objs/apinames src/tools/apinames.c
> +}
> +
> +BBCLASSEXTEND = "native"
> +
> +FILES_${PN} = "${libdir}/lib*.so.*"
> +FILES_${PN}-dev += "${bindir}"
> -- 
> 1.7.0.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


