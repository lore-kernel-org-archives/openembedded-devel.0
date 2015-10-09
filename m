Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B60627680D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:18:37 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so78836997pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2015 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=F1dfoX1YGx5H57Gq7nOoHsuYH1qgUpWd7wKLoD+qGkU=;
	b=qYtusdJsIR+VD/JYc1xxOZncyGEIushxJkHhfCJv/p5PeCL+EbOpbIS6j5hhY2/jc5
	aDSrZ6NoehDdLrAZpW/MlVVsH/yQ3n/vcJMv1kAXfbcLVyRm/LC0Z1KiA4MhT60u4iJK
	6iZmZ6tZoYKmrvrknE/KS6I+i//vvu58NMQhsrNMjBGfRjNNvZkw0AqWwvirGXZHtZBn
	h1zj92PkaG/wjvNxYV5tf6/shgMIT82kIg98H0DwVw8lWPGh0VnA9sXcde89jupStGPr
	GX4DTezgnw47UHpOg+LIncqwc1EIv/f4BEmpNT8VeRG/XU2+fwPvDZKibkbUaMAXQFIE
	5PHQ==
X-Received: by 10.68.216.193 with SMTP id os1mr13317829pbc.110.1444375116516; 
	Fri, 09 Oct 2015 00:18:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:24ad:a72d:669c:5092?
	([2601:646:8601:4580:24ad:a72d:669c:5092])
	by smtp.gmail.com with ESMTPSA id we9sm452389pab.3.2015.10.09.00.18.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Oct 2015 00:18:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444291853-5397-1-git-send-email-manuel.bachmann@iot.bzh>
Date: Fri, 9 Oct 2015 00:18:34 -0700
Message-Id: <51293558-9B41-4D74-87D1-CF3A118866EB@gmail.com>
References: <1444291853-5397-1-git-send-email-manuel.bachmann@iot.bzh>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.1)
Subject: Re: [PATCH 3/3 v2][meta-multimedia] rygel: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 07:18:38 -0000
X-Groupsio-MsgNum: 57747
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3318DFD9-BD2E-4B06-BA1E-67DFD28888C0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3318DFD9-BD2E-4B06-BA1E-67DFD28888C0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 8, 2015, at 1:10 AM, Manuel Bachmann <manuel.bachmann@iot.bzh> =
wrote:
>=20
> Rygel is a UPnP Audio-Video media server, that allows to
> share media files to other devices. It can also become a
> MediaRenderer controlled by UPnP or DLNA Controllers.
>=20
> Rygel makes use of the GStreamer library to recognize and
> index media files. UPnp clients will then be able to browse
> through them with the aid of metadata (artist, date...).
>=20
> We do not propose to build without GStreamer support
> (because then if cannot parse any actual media file, and
> this is pointless), and for the same reason always include
> the GStreamer engine in the main package ; but allow
> separate packages for plugins.
>=20
> (disable tracker plugin for now, because it pulls 3 layers
> and needs us to have a PREFERRED udev provider, which is a
> bit extreme for a first version)
>=20
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> Author: Manuel Bachmann <manuel.bachmann@iot.bzh>
> Author: Ross Burton <ross.burton@intel.com>
> ---
> .../recipes-connectivity/rygel/rygel_0.26.1.bb     | 59 =
++++++++++++++++++++++
> 1 file changed, 59 insertions(+)
> create mode 100644 =
meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
>=20
> diff --git =
a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb =
b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> new file mode 100644
> index 0000000..3862b1e
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "A UPnP AV media server and renderer"
> +DESCRIPTION =3D "Rygel is a home media solution (UPnP AV MediaServer) =
that \
> +allow you to easily share audio, video and pictures to other devices. =
\
> +Additionally, media player software may use Rygel to become a =
MediaRenderer \
> +that may be controlled remotely by a UPnP or DLNA Controller."
> +HOMEPAGE =3D "http://live.gnome.org/Rygel"
> +
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \
> +                    =
file://src/rygel/rygel-main.vala;endline=3D25;md5=3Da4cce4d389da1c1638fe68=
d07ae9d811"
> +
> +DEPENDS =3D "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna =
gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 =
libmediaart-2.0"
> +RDEPENDS_${PN} =3D "gstreamer1.0-plugins-base-playback =
shared-mime-info"
> +
> +GNOME_COMPRESS_TYPE =3D =E2=80=9Cxz"

isn=E2=80=99t this default ?

> +SRC_URI[archive.md5sum] =3D "f182d54913a528bb5b4fb2f291aca0fc"
> +SRC_URI[archive.sha256sum] =3D =
"390740609e34399b886ddb9a8f7eca25055ad72048dfdd869edf02999b1e1d8f"
> +
> +inherit gnomebase
> +
> +EXTRA_OECONF =3D "--disable-introspection --disable-tracker-plugin =
--with-media-engine=3Dgstreamer"
> +
> +PACKAGECONFIG ?=3D "external mpris mediathek ruih media-export =
gst-launch gtk+3"
> +PACKAGECONFIG[external] =3D =
"--enable-external-plugin,--disable-external-plugin"
> +PACKAGECONFIG[mpris] =3D =
"--enable-mpris-plugin,--disable-mpris-plugin"
> +PACKAGECONFIG[mediathek] =3D =
"--enable-mediathek-plugin,--disable-mediathek-plugin"
> +PACKAGECONFIG[ruih] =3D "--enable-ruih-plugin,--disable-ruih-plugin"
> +PACKAGECONFIG[media-export] =3D =
"--enable-media-export-plugin,--disable-media-export-plugin,sqlite3"
> +PACKAGECONFIG[gst-launch] =3D =
"--enable-gst-launch-plugin,--disable-gst-launch-plugin"
> +PACKAGECONFIG[gtk+3] =3D ",--without-ui,gtk+3"
> +
> +LIBV =3D "2.6"
> +
> +do_install_append() {
> +       # Remove .la files for loadable modules
> +       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
> +       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> +}
> +
> +FILES_${PN} +=3D "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 =
${datadir}/icons"
> +FILES_${PN}-dev +=3D "${datadir}/vala=E2=80=9D

did you miss to add vala in DEPENDS ?

> +FILES_${PN}-dbg +=3D "${libdir}/rygel-${LIBV}/engines/.debug =
${libdir}/rygel-${LIBV}/plugins/.debug"
> +
> +PACKAGES +=3D "${PN}-meta"
> +ALLOW_EMPTY_${PN}-meta =3D "1"
> +
> +PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
> +
> +python populate_packages_prepend () {
> +    rygel_libdir =3D d.expand('${libdir}/rygel-${LIBV}')
> +    postinst =3D d.getVar('plugin_postinst', True)
> +    pkgs =3D []
> +
> +    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, =
"plugins"), 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel =
plugin for %s', postinst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> +    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, =
"plugins"), '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin =
for %s', postinst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> +
> +    metapkg =3D d.getVar('PN', True) + '-meta'
> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
> +}
> --
> 1.8.3.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3318DFD9-BD2E-4B06-BA1E-67DFD28888C0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYXaksACgkQuwUzVZGdMxQaRACfXUY/48RMQ8Eb+edNfVyk1j1F
HQ0AnR1xeAnqNca8Mw5YEnnDgxegVXiM
=qghm
-----END PGP SIGNATURE-----

--Apple-Mail=_3318DFD9-BD2E-4B06-BA1E-67DFD28888C0--
