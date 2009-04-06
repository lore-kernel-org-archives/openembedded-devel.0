Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LqpUP-00053c-7s
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 16:08:10 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LqpRe-0008KK-Fd
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 14:05:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 14:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 14:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 16:01:54 +0200
Message-ID: <grd20i$rdt$2@ger.gmane.org>
References: <1239020324-6909-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1239020324-6909-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] libmng: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 14:08:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 14:18, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>

>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/libmng/libmng/ldflags.patch |   12 ++++++++++++
>   recipes/libmng/libmng_1.0.8.bb      |    9 +++++----
>   2 files changed, 17 insertions(+), 4 deletions(-)
>   create mode 100644 recipes/libmng/libmng/ldflags.patch
>
> diff --git a/recipes/libmng/libmng/ldflags.patch b/recipes/libmng/libmng/ldflags.patch
> new file mode 100644
> index 0000000..078f552
> --- /dev/null
> +++ b/recipes/libmng/libmng/ldflags.patch
> @@ -0,0 +1,12 @@
> +diff -urN libmng-1.0.8.orig/makefiles/makefile.linux libmng-1.0.8/makefiles/makefile.linux
> +--- libmng-1.0.8.orig/makefiles/makefile.linux	2004-08-06 07:17:40.000000000 +0000
> ++++ libmng-1.0.8/makefiles/makefile.linux	2009-04-06 11:49:45.000000000 +0000
> +@@ -105,7 +105,7 @@
> + libmng.so.$(MNGVER): $(OBJSDLL)
> + #	$(CC) -shared -Wl,-soname,libmng.so.$(MNGMAJ) -o libmng.so.$(MNGVER) \
> + #	$(OBJSDLL) -L$(ZLIBLIB) -L$(JPEGLIB) -L$(LCMSLIB) -lz -lm -lc
> +-	$(CC) -shared -Wl,-soname,libmng.so.$(MNGMAJ) -o libmng.so.$(MNGVER) \
> ++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libmng.so.$(MNGMAJ) -o libmng.so.$(MNGVER) \
> + 	$(OBJSDLL) -L$(ZLIBLIB) -L$(JPEGLIB) -ljpeg -L$(LCMSLIB) -llcms \
> +     -lz -lm -lc
> +
> diff --git a/recipes/libmng/libmng_1.0.8.bb b/recipes/libmng/libmng_1.0.8.bb
> index 9619cf4..d737e33 100644
> --- a/recipes/libmng/libmng_1.0.8.bb
> +++ b/recipes/libmng/libmng_1.0.8.bb
> @@ -2,7 +2,10 @@ DESCRIPTION = "MNG Library"
>   SECTION = "libs"
>   DEPENDS = "zlib jpeg lcms"
>   LICENSE = "libmng"
> -SRC_URI = "${SOURCEFORGE_MIRROR}/libmng/libmng-${PV}.tar.gz"
> +PR = "r1"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/libmng/libmng-${PV}.tar.gz \
> +           file://ldflags.patch;patch=1"
>
>   inherit pkgconfig
>
> @@ -10,13 +13,12 @@ EXTRA_OEMAKE_append = " ZLIBINC=${STAGING_INCDIR} ZLIBLIB=${STAGING_LIBDIR} \
>   			JPEGINC= JPEGLIB= LCMSINC= LCMSLIB="
>
>   do_compile() {
> -	unset LDFLAGS
>   	oe_runmake -f makefiles/makefile.linux
>   }
>
>   do_stage() {
>   	oe_libinstall -so libmng ${STAGING_LIBDIR}
> -        install -m 0644 ${S}/libmng.h ${STAGING_INCDIR}/
> +	install -m 0644 ${S}/libmng.h ${STAGING_INCDIR}/
>   	install -m 0644 ${S}/libmng_conf.h ${STAGING_INCDIR}/
>   	install -m 0644 ${S}/libmng_types.h ${STAGING_INCDIR}/
>   }
> @@ -24,7 +26,6 @@ do_stage() {
>   do_install() {
>   	install -d ${D}${bindir} ${D}${mandir} \
>   		   ${D}${libdir} ${D}${includedir}
> -	unset LDFLAGS
>   	oe_runmake -f makefiles/makefile.linux install \
>   	INCPATH="${D}${includedir}" LIBPATH="${D}${libdir}" prefix=${prefix}
>   }




