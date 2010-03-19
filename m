Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NseWu-00052b-KV for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 16:54:42 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NseTs-0005q1-M4 for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 16:51:24 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 16:51:24 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 16:51:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 19 Mar 2010 16:51:08 +0100
Message-ID: <ho06hc$59d$1@dough.gmane.org>
References: <1268757942.4111.25.camel@mattotaupa>	<1268784521.3893.15.camel@mattotaupa>
	<1269012425.6119.5.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1269012425.6119.5.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] libvalhalla: Add recipe for libvalhalla 1.0.1.
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
X-List-Received-Date: Fri, 19 Mar 2010 15:54:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

All your geexbox patches look ok, feel free to commit them.

regards,

Koen

On 19-03-10 16:27, Paul Menzel wrote:
> 1. `--enable-pic` is needed for non-x86 architectures.
> 2. Put test programs in separate package `${PN}-bin`. Manual pages are in `${PN}-doc` though.
> 3. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE = "beagleboard"`.
> 4. Depend on `libnfo` since it is recommended on upstream’s Web site.
> 
> `do_configure()` is based on the recipe of `ushare`.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/libvalhalla/libvalhalla.inc      |   30 ++++++++++++++++++++++++++++++
>  recipes/libvalhalla/libvalhalla_1.0.1.bb |    5 +++++
>  2 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libvalhalla/libvalhalla.inc
>  create mode 100644 recipes/libvalhalla/libvalhalla_1.0.1.bb
> 
> diff --git a/recipes/libvalhalla/libvalhalla.inc b/recipes/libvalhalla/libvalhalla.inc
> new file mode 100644
> index 0000000..03b7cfd
> --- /dev/null
> +++ b/recipes/libvalhalla/libvalhalla.inc
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "libvalhalla is a library written in C. It is a media scanner, that stores various information in an SQLite database and relies on FFmpeg (libavformat and libavutil) and libcurl. It features many Internet grabbers that allows automatic download of covers, lyrics, informations on media files, tags retrival in video and music files and so on."
> +HOMEPAGE = "http://libvalhalla.geexbox.org/"
> +SECTION = "libs/multimedia"
> +LICENSE = "LGPLv2.1"
> +DEPENDS = "sqlite3 curl ffmpeg libnfo"
> +
> +INC_PR = "r0"
> +
> +SRC_URI = "http://libvalhalla.geexbox.org/releases/${P}.tar.bz2;name=${PN}"
> +
> +inherit autotools pkgconfig
> +
> +# the configure script is hand-crafted, it rejects some of the usual
> +# configure arguments
> +do_configure() {
> +	${S}/configure \
> +			--prefix=${prefix} \
> +			--disable-strip \
> +		--with-lavf-inc=${STAGING_INCDIR} \
> +		--with-lavf-lib=${STAGING_LIBDIR} \
> +		--with-lavc-inc=${STAGING_INCDIR} \
> +		--with-lavc-lib=${STAGING_LIBDIR} \
> +		--cross-compile \
> +		--enable-pic \
> +                --enable-doc
> +}
> +
> +PACKAGES =+ "${PN}-bin"
> +
> +FILES_${PN}-bin = "${bindir}/*"
> diff --git a/recipes/libvalhalla/libvalhalla_1.0.1.bb b/recipes/libvalhalla/libvalhalla_1.0.1.bb
> new file mode 100644
> index 0000000..9fe1f5e
> --- /dev/null
> +++ b/recipes/libvalhalla/libvalhalla_1.0.1.bb
> @@ -0,0 +1,5 @@
> +require libvalhalla.inc
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[libvalhalla.md5sum] = "75d4a3383887c4c341eeba9ebe60d626"
> +SRC_URI[libvalhalla.sha256sum] = "df78015e118c784e3ff3e8562bc96d287ac11997d3b9e45e2d8b67568b0600d3"
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLo51sMkyGM64RGpERAnX4AJ9iaRsLIE3qaNUJTsglOivn6pkI6ACfQFZK
mo8MrU9wPwaVwjc0DB0e7ZM=
=3P6a
-----END PGP SIGNATURE-----



