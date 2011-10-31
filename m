Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKgDv-0005sA-5W
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 01:59:35 +0100
Received: (qmail invoked by alias); 31 Oct 2011 00:53:30 -0000
Received: from p4FDF1C25.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.37]
	by mail.gmx.net (mp042) with SMTP; 31 Oct 2011 01:53:30 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/DVUcmcUbD9Xlx1eCGLF1I5kYYhwf55kbrZWsxU/
	4NBOqMIQ1uu0rU
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2011 01:58:13 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1320003224-12913-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1320003224-12913-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201110310158.13431.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-gnome] evince: initial add 2.32.0
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
X-List-Received-Date: Mon, 31 Oct 2011 00:59:35 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday, October 30, 2011 08:33:44 PM Andreas M=C3=BCller wrote:
> * recipe based on oe-classic: evince_2.30.0.bb
>   commit 5dba154457691d2096f2b1a7ef24bdc6f1b51859
> * run tested on overo
> * TODO further doctype support
>   configure option  ->    current configure result
>   ------------------------------------------------
>   --enable-ps       ->    PostScript Backend.:  no
>   --enable-djvu     ->    DJVU Backend.......:  no
>   --enable-impress  ->    Impress Backend....:  no
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
> ---
>  meta-gnome/recipes-gnome/evince/evince_2.32.0.bb |   39
> ++++++++++++++++++++++ 1 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
> b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb new file mode 100644
> index 0000000..899d416
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "Evince is a document viewer for document formats like p=
df,
> ps, djvu." +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576a2163977938ea36f=
a7b"
> +SECTION =3D "x11/office"
> +DEPENDS =3D "gnome-icon-theme gnome-doc-utils-native libgnome-keyring
> nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade" +
> +inherit gnome pkgconfig gtk-icon-cache
> +
> +SRC_URI[archive.md5sum] =3D "ebc3ce6df8dcbf29cb9492f8dd031319"
> +SRC_URI[archive.sha256sum] =3D
> "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7" +
> +EXTRA_OECONF =3D " --enable-thumbnailer \
> +                 --enable-nautilus \
> +                 --disable-scrollkeeper \
> +                 --enable-pixbuf \
> +               "
> +
> +do_install_append() {
> +	install -d install -d ${D}${datadir}/pixmaps
> +	install -m 0755 ${S}/data/icons/48x48/apps/evince.png
> ${D}${datadir}/pixmaps/ +}
> +
> +RDEPENDS_${PN} +=3D "glib-2.0-utils"
> +
> +PACKAGES =3D+ "${PN}-nautilus-extension"
> +FILES_${PN} +=3D "${datadir}/dbus-1"
> +FILES_${PN}-dbg +=3D "${libdir}/*/*/.debug \
> +                    ${libdir}/*/*/*/.debug"
> +FILES_${PN}-dev +=3D "${libdir}/nautilus/extensions-2.0/*.la"
> +FILES_${PN}-staticdev +=3D "${libdir}/nautilus/extensions-2.0/*.a"
> +FILES_${PN}-nautilus-extension =3D "${libdir}/nautilus/*/*so"
> +
> +pkg_postinst_${PN} () {
> +if [ -n "$D" ]; then
> +    exit 1
> +fi
> +
> +glib-compile-schemas ${datadir}/glib-2.0/schemas
> +}
Be prepared that your system might feel different when installing evince an=
d=20
starting *glib-compile-schemas* on pkg_postinst. It seems that now the file=
s in=20
/usr/share/glib-2.0/schedule rise from dead by being compiled and thereby=20
causing new behaviours. E.g. When starting thunar for the first time in ses=
sion I=20
now have to wait for very long and see

Out of memory: Kill process 1458 (gvfsd-smb-brows) score 742 or sacrifice c=
hild
Killed process 1458 (gvfsd-smb-brows) total-vm:403384kB, anon-rss:185676kB,=
 file-
rss:108kB
gvfsd-smb-brows invoked oom-killer: gfp_mask=3D0x201da, order=3D0, oom_adj=
=3D0,=20
oom_score_adj=3D0
[<c003f9bc>] (unwind_backtrace+0x0/0xe0) from [<c00a3020>]=20
(dump_header.clone.13+0x4c/0x11c)
[<c00a3020>] (dump_header.clone.13+0x4c/0x11c) from [<c00a31f0>]=20
(oom_kill_process.clone.16+0x3c/0x1e4)
[<c00a31f0>] (oom_kill_process.clone.16+0x3c/0x1e4) from [<c00a36f0>]=20
(out_of_memory+0x250/0x2d8)
[<c00a36f0>] (out_of_memory+0x250/0x2d8) from [<c00a658c>]=20
(__alloc_pages_nodemask+0x49c/0x614)
[<c00a658c>] (__alloc_pages_nodemask+0x49c/0x614) from [<c00a7e84>]=20
(__do_page_cache_readahead+0xa0/0x1e4)
[<c00a7e84>] (__do_page_cache_readahead+0xa0/0x1e4) from [<c00a8224>]=20
(ra_submit+0x20/0x24)
[<c00a8224>] (ra_submit+0x20/0x24) from [<c00a2704>] (filemap_fault+0x164/0=
x39c)
[<c00a2704>] (filemap_fault+0x164/0x39c) from [<c00b3e0c>]=20
(__do_fault+0x50/0x3a8)
[<c00b3e0c>] (__do_fault+0x50/0x3a8) from [<c00b68e4>]=20
(handle_pte_fault+0x23c/0x550)
[<c00b68e4>] (handle_pte_fault+0x23c/0x550) from [<c00b6c90>]=20
(handle_mm_fault+0x98/0xa8)
[<c00b6c90>] (handle_mm_fault+0x98/0xa8) from [<c00418f8>]=20
(do_page_fault+0xe0/0x268)
[<c00418f8>] (do_page_fault+0xe0/0x268) from [<c0036278>]=20
(do_PrefetchAbort+0x34/0x98)
[<c0036278>] (do_PrefetchAbort+0x34/0x98) from [<c003b460>]=20
(ret_from_exception+0x0/0x10)
Exception stack(0xcefb7fb0 to 0xcefb7ff8)

After a while a second thunar opens with contents at Network. This was empt=
y=20
before!

Right now it again seems to me that opening one door causes entering a room=
 with=20
many new doors...

Andreas


