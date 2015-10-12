Return-Path: <mbc@koumoul.net>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id BCB4C766DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 11:38:41 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so70402710igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 04:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=/M7VFVLsyRuzTPYlPTM43S9/ek/2r1E7kr4OwuBJ3no=;
	b=BVq7q9T+QlZKm8qaRsw2MuYggeTuAqDn2+ogIEqVImeIbSSmQ3rBReMuwUaB0acEby
	Qe1nT/XEWsUgVfRRb/v/3E397MOc7QM6aHjWf6cOthdTj5FjIr6yg7X+JZUTNUgPMcND
	ZYZuNxOHmKAV4c7w8r3MCP7G9gXON3SCo4rvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/M7VFVLsyRuzTPYlPTM43S9/ek/2r1E7kr4OwuBJ3no=;
	b=Cvfq3hoVWvIKqStJ3SYBCN/F57Bnr+2apcB85kzawSgEOkc6Th6ej4qVFXnewujHJj
	PTSWPMYS++GnDrYLFFYC/Bfh3EOn3OCz4t8jsGFI9b4WkPh3UMAK1+FSHpep7lTQu7tG
	NXNrcqrRKLN/2S0gFh5MzSesnOarfoeeELfYS+NbXvPd0lFB8PgJCc0QHWA5RCj3QIRU
	TftCAph5XXjA5KE5CmtmqKaeK4rfQ/0tHmRD+WVG4QlLwWnY/hE3zsw3BVaH127kr7UK
	JDQ+OzY6j/r+zn+xKPVOX37+BmhDjFyR5ah82cV4xNcrHGyeGfMe7TdSJmaagGVKdQcd
	Pnnw==
X-Gm-Message-State: ALoCoQkKYvIJ6G3BmtNDF16c1VKTvZEOodY4S3TWqCvP9oyc4DyU8HFObfGbmoNUqz7rR6YmL1ib
MIME-Version: 1.0
X-Received: by 10.50.4.65 with SMTP id i1mr12521731igi.0.1444649921425; Mon,
	12 Oct 2015 04:38:41 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.38.193 with HTTP; Mon, 12 Oct 2015 04:38:41 -0700 (PDT)
X-Originating-IP: [46.18.96.42]
In-Reply-To: <51293558-9B41-4D74-87D1-CF3A118866EB@gmail.com>
References: <1444291853-5397-1-git-send-email-manuel.bachmann@iot.bzh>
	<51293558-9B41-4D74-87D1-CF3A118866EB@gmail.com>
Date: Mon, 12 Oct 2015 13:38:41 +0200
X-Google-Sender-Auth: r9KtwGLHjZR6Hw8orVJsoOoUDUQ
Message-ID: <CANTDXNfX2zU2Z=6owH0Xyr3rTg7r=gcNipWW_qx6R5MHkYVw9Q@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 12 Oct 2015 11:38:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Good remark, thanks, I wasn't inheriting vala !

For this and for the "media-service-upnp" build problem noticed by Martin,
sending a whole new series right now.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-09 9:18 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

>
> > On Oct 8, 2015, at 1:10 AM, Manuel Bachmann <manuel.bachmann@iot.bzh>
> wrote:
> >
> > Rygel is a UPnP Audio-Video media server, that allows to
> > share media files to other devices. It can also become a
> > MediaRenderer controlled by UPnP or DLNA Controllers.
> >
> > Rygel makes use of the GStreamer library to recognize and
> > index media files. UPnp clients will then be able to browse
> > through them with the aid of metadata (artist, date...).
> >
> > We do not propose to build without GStreamer support
> > (because then if cannot parse any actual media file, and
> > this is pointless), and for the same reason always include
> > the GStreamer engine in the main package ; but allow
> > separate packages for plugins.
> >
> > (disable tracker plugin for now, because it pulls 3 layers
> > and needs us to have a PREFERRED udev provider, which is a
> > bit extreme for a first version)
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > Author: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > Author: Ross Burton <ross.burton@intel.com>
> > ---
> > .../recipes-connectivity/rygel/rygel_0.26.1.bb     | 59
> ++++++++++++++++++++++
> > 1 file changed, 59 insertions(+)
> > create mode 100644 meta-multimedia/recipes-connectivity/rygel/
> rygel_0.26.1.bb
> >
> > diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> > new file mode 100644
> > index 0000000..3862b1e
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> > @@ -0,0 +1,59 @@
> > +SUMMARY =3D "A UPnP AV media server and renderer"
> > +DESCRIPTION =3D "Rygel is a home media solution (UPnP AV MediaServer)
> that \
> > +allow you to easily share audio, video and pictures to other devices. =
\
> > +Additionally, media player software may use Rygel to become a
> MediaRenderer \
> > +that may be controlled remotely by a UPnP or DLNA Controller."
> > +HOMEPAGE =3D "http://live.gnome.org/Rygel"
> > +
> > +LICENSE =3D "LGPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec5=
22ec2
> \
> > +
> file://src/rygel/rygel-main.vala;endline=3D25;md5=3Da4cce4d389da1c1638fe6=
8d07ae9d811"
> > +
> > +DEPENDS =3D "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna
> gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4
> libmediaart-2.0"
> > +RDEPENDS_${PN} =3D "gstreamer1.0-plugins-base-playback shared-mime-inf=
o"
> > +
> > +GNOME_COMPRESS_TYPE =3D =E2=80=9Cxz"
>
> isn=E2=80=99t this default ?
>
> > +SRC_URI[archive.md5sum] =3D "f182d54913a528bb5b4fb2f291aca0fc"
> > +SRC_URI[archive.sha256sum] =3D
> "390740609e34399b886ddb9a8f7eca25055ad72048dfdd869edf02999b1e1d8f"
> > +
> > +inherit gnomebase
> > +
> > +EXTRA_OECONF =3D "--disable-introspection --disable-tracker-plugin
> --with-media-engine=3Dgstreamer"
> > +
> > +PACKAGECONFIG ?=3D "external mpris mediathek ruih media-export gst-lau=
nch
> gtk+3"
> > +PACKAGECONFIG[external] =3D
> "--enable-external-plugin,--disable-external-plugin"
> > +PACKAGECONFIG[mpris] =3D "--enable-mpris-plugin,--disable-mpris-plugin=
"
> > +PACKAGECONFIG[mediathek] =3D
> "--enable-mediathek-plugin,--disable-mediathek-plugin"
> > +PACKAGECONFIG[ruih] =3D "--enable-ruih-plugin,--disable-ruih-plugin"
> > +PACKAGECONFIG[media-export] =3D
> "--enable-media-export-plugin,--disable-media-export-plugin,sqlite3"
> > +PACKAGECONFIG[gst-launch] =3D
> "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
> > +PACKAGECONFIG[gtk+3] =3D ",--without-ui,gtk+3"
> > +
> > +LIBV =3D "2.6"
> > +
> > +do_install_append() {
> > +       # Remove .la files for loadable modules
> > +       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
> > +       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> > +}
> > +
> > +FILES_${PN} +=3D "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1
> ${datadir}/icons"
> > +FILES_${PN}-dev +=3D "${datadir}/vala=E2=80=9D
>
> did you miss to add vala in DEPENDS ?
>
> > +FILES_${PN}-dbg +=3D "${libdir}/rygel-${LIBV}/engines/.debug
> ${libdir}/rygel-${LIBV}/plugins/.debug"
> > +
> > +PACKAGES +=3D "${PN}-meta"
> > +ALLOW_EMPTY_${PN}-meta =3D "1"
> > +
> > +PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
> > +
> > +python populate_packages_prepend () {
> > +    rygel_libdir =3D d.expand('${libdir}/rygel-${LIBV}')
> > +    postinst =3D d.getVar('plugin_postinst', True)
> > +    pkgs =3D []
> > +
> > +    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, "plugins=
"),
> 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',
> postinst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> > +    pkgs +=3D do_split_packages(d, oe.path.join(rygel_libdir, "plugins=
"),
> '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',
> postinst=3Dpostinst, extra_depends=3Dd.expand('${PN}'))
> > +
> > +    metapkg =3D d.getVar('PN', True) + '-meta'
> > +    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
> > +}
> > --
> > 1.8.3.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

