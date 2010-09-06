Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVcD-00060h-Qg for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:55:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVbc-0003XA-2H for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:55:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:55:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Sep 2010 08:47:32 +0200
Message-ID: <i622q4$jp9$4@dough.gmane.org>
References: <201009030248.28858.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <201009030248.28858.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/5] libchamplain(-gtk): Bumped to 0.7.1 to meat actual clutter
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
X-List-Received-Date: Mon, 06 Sep 2010 06:55:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-09-10 02:48, Andreas Mueller wrote:
> 
> * builds separate packages for libchamplain and libchamplain-gtk
> * libchamplain_0.2.8 removed because it tries to configure against
>   clutter-cairo which is no more available
> * libchamplain-gtk_0.2.8 removed because it configures against
>   very old clutter revision which do not build for GLES environments
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  recipes/gnome/libchamplain-gtk_0.2.8.bb |   12 ------------
>  recipes/gnome/libchamplain_0.2.8.bb     |   13 -------------
>  recipes/gnome/libchamplain_0.7.1.bb     |   15 +++++++++++++++
>  3 files changed, 15 insertions(+), 25 deletions(-)
>  delete mode 100644 recipes/gnome/libchamplain-gtk_0.2.8.bb
>  delete mode 100644 recipes/gnome/libchamplain_0.2.8.bb
>  create mode 100644 recipes/gnome/libchamplain_0.7.1.bb
> 
> diff --git a/recipes/gnome/libchamplain-gtk_0.2.8.bb b/recipes/gnome/libchamplain-gtk_0.2.8.bb
> deleted file mode 100644
> index e403da6..0000000
> --- a/recipes/gnome/libchamplain-gtk_0.2.8.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
> -LICENSE = "LGPL"
> -DEPENDS = "libchamplain clutter-gtk-0.8"
> -
> -inherit gnome autotools
> -
> -SRC_URI = "http://libchamplain.pierlux.com/release/${PV}/libchamplain-gtk-${PV}.tar.gz"
> -
> -
> -
> -SRC_URI[md5sum] = "c3e62c1912c0dba013c8f3df28fc809d"
> -SRC_URI[sha256sum] = "03d751bd836174e2d6766d8036fc72e130dd090b13256d40a58ba6ab659475ef"
> diff --git a/recipes/gnome/libchamplain_0.2.8.bb b/recipes/gnome/libchamplain_0.2.8.bb
> deleted file mode 100644
> index 4e2b6b4..0000000
> --- a/recipes/gnome/libchamplain_0.2.8.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
> -LICENSE = "LGPL"
> -DEPENDS = "clutter-cairo libsoup-2.4 clutter gtk+"
> -
> -inherit gnome autotools
> -
> -SRC_URI = "http://libchamplain.pierlux.com/release/${PV}/libchamplain-${PV}.tar.gz"
> -
> -FILES_${PN} += "${datadir}/champlain/error.svg"
> -
> -
> -SRC_URI[md5sum] = "fa4a620efa1a1c1036b6701b7d4dafe1"
> -SRC_URI[sha256sum] = "01e17811a85e93e5158f5d721b9b1b249db44683735a172fa0debd9759d3175c"
> diff --git a/recipes/gnome/libchamplain_0.7.1.bb b/recipes/gnome/libchamplain_0.7.1.bb
> new file mode 100644
> index 0000000..da67636
> --- /dev/null
> +++ b/recipes/gnome/libchamplain_0.7.1.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to display rasterized maps. "
> +LICENSE = "LGPLv2.1"
> +DEPENDS = "cairo libsoup-2.4 clutter gtk+"
> +PR = "r1"
> +
> +inherit gnome autotools
> +
> +FILES_${PN} += "${datadir}/champlain/error.svg"
> +
> +PACKAGES =+ "${PN}-gtk"
> +RDEPENDS_${PN}-gtk = "clutter-gtk"
> +FILES_${PN}-gtk = "${libdir}/libchamplain-gtk*so.*"
> +
> +SRC_URI[archive.md5sum] = "48bbaa2ab5b9b74c7dbffb81381e3020"
> +SRC_URI[archive.sha256sum] = "c1669cbfc0d1b01950d9740fd5d3f9f57cdfaf37df855392bdd214210d2f4601"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMhI6EMkyGM64RGpERAtnxAKCnJeQ38qwuhpngp53NG/cvORxZyQCfQfAS
rK29v/cWkZ3FiKvicxi437A=
=Kmod
-----END PGP SIGNATURE-----



