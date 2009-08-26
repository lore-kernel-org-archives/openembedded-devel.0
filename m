Received: from [209.85.216.197] (helo=mail-px0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MgM3P-00046q-PM
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 19:13:00 +0200
Received: by pxi35 with SMTP id 35so256800pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 09:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=bfRF/7HB5YJS1GAfxeX4hIVzaWdFfWjCGnul6TEz8Rg=;
	b=VFGt5kydd9/YHu1v7aMiLcwihltDIy2PCqjze1Dm5cIlsJpc6CYu7o5IKVbifd8Cr3
	KXmy51QpyzeDlhPH5yqQF+eDNDd719nNyq0LiNz5WSHwPpCKUsWm9bTfh4CW0x2BlCWn
	C03oGlcbzNfYESXEmeQBwLXtiPS1uH9wjTuPk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sls6R2XZ7pDoQris+H7+FtJjs9byGLpDaKBO/Rag0mm380tVoCvYNzxQzhLupZmgv9
	fqhfnINmlo/hEXrsQ8lBdtxW5pH5XtkjGjS284ZxtRBj9PeMTi6pB5P9L199UUrI4vs9
	531oe6MIh4ByzKP0QT0Y4gGMz9l6wKeD/j8Z8=
Received: by 10.115.67.10 with SMTP id u10mr10101691wak.203.1251305699251;
	Wed, 26 Aug 2009 09:54:59 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id n30sm1237689wag.41.2009.08.26.09.54.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 09:54:57 -0700 (PDT)
Date: Wed, 26 Aug 2009 09:54:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826165452.GC31371@gmail.com>
References: <4A94E45F.7030303@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A94E45F.7030303@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] netsurf fixes for GCC-4.4, from netsurf svn.
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
X-List-Received-Date: Wed, 26 Aug 2009 17:13:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/08/09 16:59), Graham Gower wrote:
> Netsurf appears to be statically linked with these libraries, so I
> bumped its PR too.
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
looks ok. 

Acked-by: Khem Raj <raj.khem@gmail.com>

> recipes/netsurf/files/hubbub-uninitialised.patch   |   35 ++++++++
> .../netsurf/files/libnsgif-strict-aliasing.patch   |   82 ++++++++++++++++++++
> recipes/netsurf/hubbub_0.0.1.bb                    |    5 +-
> recipes/netsurf/libnsgif_0.0.1.bb                  |    5 +-
> recipes/netsurf/netsurf_2.1.bb                     |    2 +
> 5 files changed, 127 insertions(+), 2 deletions(-)
> create mode 100644 recipes/netsurf/files/hubbub-uninitialised.patch
> create mode 100644 recipes/netsurf/files/libnsgif-strict-aliasing.patch
> 
> diff --git a/recipes/netsurf/files/hubbub-uninitialised.patch b/recipes/netsurf/files/hubbub-uninitialised.patch
> new file mode 100644
> index 0000000..4f87120
> --- /dev/null
> +++ b/recipes/netsurf/files/hubbub-uninitialised.patch
> @@ -0,0 +1,35 @@
> +http://source.netsurf-browser.org/?view=rev&revision=7398
> +Initialise variables to stop GCC 4.4 complaining (credit: Jeroen Habraken)
> +
> +--- hubbub/src/tokeniser/tokeniser.c	2009/04/06 15:22:16	7052
> ++++ hubbub/src/tokeniser/tokeniser.c	2009/05/05 17:18:41	7398
> +@@ -787,7 +787,7 @@
> + 							+ 1);
> + 		} else {
> + 			parserutils_error error;
> +-			const uint8_t *cptr;
> ++			const uint8_t *cptr = NULL;
> + 			error = parserutils_inputstream_peek(
> + 					tokeniser->input,
> + 					tokeniser->context.pending,
> +@@ -1590,8 +1590,8 @@
> + 					tokeniser->context.match_entity.length
> + 					+ 1;
> + 		} else {
> +-			size_t len;
> +-			const uint8_t *cptr;
> ++			size_t len = 0;
> ++			const uint8_t *cptr = NULL;
> + 			parserutils_error error;
> + + 			error = parserutils_inputstream_peek(
> +@@ -3137,7 +3137,7 @@
> + {
> + 	hubbub_token token;
> + 	size_t len;
> +-	const uint8_t *cptr;
> ++	const uint8_t *cptr = NULL;
> + 	parserutils_error error;
> + + 	/* Calling this with nothing to output is a probable bug */
> +
> diff --git a/recipes/netsurf/files/libnsgif-strict-aliasing.patch b/recipes/netsurf/files/libnsgif-strict-aliasing.patch
> new file mode 100644
> index 0000000..4fe913c
> --- /dev/null
> +++ b/recipes/netsurf/files/libnsgif-strict-aliasing.patch
> @@ -0,0 +1,82 @@
> +http://source.netsurf-browser.org/?view=rev&revision=9027
> +Stop utterly insane palette entry population.
> +Palette entries are always ABGR, regardless of platform endianness.
> +This change probably breaks big-endian platforms which, under the old approach,
> +had palette entries of the form RGBA (assuming I understood the code correctly).
> +
> +http://source.netsurf-browser.org/?view=rev&revision=9138
> +Fix palette entry population some more. Hopefully, it's completely endian
> +agnostic now and still builds with GCC 4.4
> +
> +--- libnsgif/src/libnsgif.c	2009/03/29 01:43:27	6984
> ++++ libnsgif/src/libnsgif.c	2009/08/09 22:24:14	9138
> +@@ -319,19 +319,34 @@
> + 				return GIF_INSUFFICIENT_DATA;
> + 			}
> + 			for (index = 0; index < gif->colour_table_size; index++) {
> +-				char colour[] = {0, 0, 0, (char)0xff};
> +-				colour[0] = gif_data[0];
> +-				colour[1] = gif_data[1];
> +-				colour[2] = gif_data[2];
> +-				gif->global_colour_table[index] = *((int *) (void *) colour);
> ++				/* Gif colour map contents are r,g,b.
> ++				 *
> ++				 * We want to pack them bytewise into the ++				 * colour
> table, such that the red component
> ++				 * is in byte 0 and the alpha component is in
> ++				 * byte 3.
> ++				 */
> ++				unsigned char *entry = (unsigned char *) &gif->
> ++						global_colour_table[index];
> ++
> ++				entry[0] = gif_data[0];	/* r */
> ++				entry[1] = gif_data[1];	/* g */
> ++				entry[2] = gif_data[2];	/* b */
> ++				entry[3] = 0xff;	/* a */
> ++
> + 				gif_data += 3;
> + 			}
> + 			gif->buffer_position = (gif_data - gif->gif_data);
> + 		} else {
> + 			/*	Create a default colour table with the first two colours as black and white
> + 			*/
> +-			gif->global_colour_table[0] = 0xff000000;
> +-			gif->global_colour_table[1] = 0xffffffff;
> ++			unsigned int *entry = gif->global_colour_table;
> ++
> ++			entry[0] = 0x00000000;
> ++			/* Force Alpha channel to opaque */
> ++			((unsigned char *) entry)[3] = 0xff;
> ++
> ++			entry[1] = 0xffffffff;
> + 		}
> + 	}
> + +@@ -844,11 +859,21 @@
> + 		colour_table = gif->local_colour_table;
> + 		if (!clear_image) {
> + 			for (index = 0; index < colour_table_size; index++) {
> +-				char colour[] = {0, 0, 0, (char)0xff};
> +-				colour[0] = gif_data[0];
> +-				colour[1] = gif_data[1];
> +-				colour[2] = gif_data[2];
> +-				colour_table[index] = *((int *) (void *) colour);
> ++				/* Gif colour map contents are r,g,b.
> ++				 *
> ++				 * We want to pack them bytewise into the ++				 * colour
> table, such that the red component
> ++				 * is in byte 0 and the alpha component is in
> ++				 * byte 3.
> ++				 */
> ++				unsigned char *entry = ++					(unsigned char *)
> &colour_table[index];
> ++
> ++				entry[0] = gif_data[0];	/* r */
> ++				entry[1] = gif_data[1];	/* g */
> ++				entry[2] = gif_data[2];	/* b */
> ++				entry[3] = 0xff;	/* a */
> ++
> + 				gif_data += 3;
> + 			}
> + 		} else {
> +
> diff --git a/recipes/netsurf/hubbub_0.0.1.bb b/recipes/netsurf/hubbub_0.0.1.bb
> index 0d70b41..bfbe71f 100644
> --- a/recipes/netsurf/hubbub_0.0.1.bb
> +++ b/recipes/netsurf/hubbub_0.0.1.bb
> @@ -5,7 +5,10 @@ PRIORITY = "optional"
> LICENSE = "MIT"
> DEPENDS = "libparserutils"
> 
> -SRC_URI = "http://www.netsurf-browser.org/projects/releases/hubbub-${PV}-src.tar.gz"
> +SRC_URI = "http://www.netsurf-browser.org/projects/releases/hubbub-${PV}-src.tar.gz \
> +           file://hubbub-uninitialised.patch;patch=1"
> +
> +PR = "r1"
> 
> inherit pkgconfig
> 
> diff --git a/recipes/netsurf/libnsgif_0.0.1.bb b/recipes/netsurf/libnsgif_0.0.1.bb
> index 3b9cfc2..f2b1138 100644
> --- a/recipes/netsurf/libnsgif_0.0.1.bb
> +++ b/recipes/netsurf/libnsgif_0.0.1.bb
> @@ -4,7 +4,10 @@ SECTION = "libs"
> PRIORITY = "optional"
> LICENSE = "MIT"
> 
> -SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsgif-${PV}-src.tar.gz"
> +SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsgif-${PV}-src.tar.gz \
> +           file://libnsgif-strict-aliasing.patch;patch=1"
> +
> +PR = "r1"
> 
> inherit pkgconfig
> 
> diff --git a/recipes/netsurf/netsurf_2.1.bb b/recipes/netsurf/netsurf_2.1.bb
> index 073f17f..849a8e5 100644
> --- a/recipes/netsurf/netsurf_2.1.bb
> +++ b/recipes/netsurf/netsurf_2.1.bb
> @@ -11,6 +11,8 @@ SRC_URI = "http://www.netsurf-browser.org/downloads/releases/netsurf-${PV}-src.t
> 	   file://netsurf.desktop \
> 	   file://Makefile.config"
> 
> +PR = "r1"
> +
> # Workaround for 2.1 tarball (unpacks into netsurf/, not netsurf-2.1/ )
> S = "${WORKDIR}/netsurf"
> 
> -- 
> 1.6.0.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


