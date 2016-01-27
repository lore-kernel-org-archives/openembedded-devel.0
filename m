Return-Path: <mbc@koumoul.net>
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E9C6C731DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 21:06:30 +0000 (UTC)
Received: by mail-yk0-f194.google.com with SMTP id k129so1536473yke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 13:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=I6njhUxOCBK1fICyWruvP9S1djvpfJcwffBYWQnHd7o=;
	b=WtqhgKSLZTmlucFVTgrMa58FTmBLDH34PLVYS0BThFrTBT7QaZgFAlN8EB+KONhr39
	Lo1UHnRG9ATXGUbyoKUvjwSMiMQTBkkKfvBUKGsHDSptRfyCCIqCwl+ZRAJ76PB5BaoK
	ISS11YcgbDuLHVKLjl6lkyt5N5927XOF0Nnh8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=I6njhUxOCBK1fICyWruvP9S1djvpfJcwffBYWQnHd7o=;
	b=oSIryZkN5GZstwAEVh5bssRxshYHtZjZkJ9eNjOggGILxFF60ERRtja0SMrw8hrGi1
	xNCQjsBO3LJBtka8AhHxuPAqDTfJQzBu47UV4nLEiZapiZsYfwIpM84BfARszzy+FMgY
	LveKDrrxwl3RQSOLOEeiHA6SjKcs4Qxu2ksLXDjADA4oqSiC4vvlwTgVLOGPY7e1AFhe
	UHlftRa+xtoQXe5CErQPkdjQh94gBJojnbXbrn8AArLTRs4w3KhqRTk4Mj5P0pb/IXLN
	WSPw/rrXnUrgXMFhrte6telM2bX4MOrxxQwjLmd57ej+7/PkfriOKBn5onSzwYCxOlYT
	ukAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=I6njhUxOCBK1fICyWruvP9S1djvpfJcwffBYWQnHd7o=;
	b=iUknhf0tvXoF9Dy+2R/SnECW/P04OdkOLTfJoOub70plW97xIZSclYwzWaf0jOOjnN
	2NUii9N9GKhxb3q3+DpF5tay8iGhh01SS2mkUSEIHXy3RAmWL+JO6s3b9QDD0/1nave/
	DrtJZy9N6kn6UxecZngQYQlFLL7IxeU/ouXdc78wen1AQp+76tIfJccyP25wiq1I8VsI
	+7av9xmnT6RY5zZ1nu9B3jMtbK3mllid+jP2vW9rEcfyPtI4izfc4ywdZ6TzWrLVO+s6
	rWAIdE5lQOYKfGUZ5KspwMneZ1ixvahB8EVKC2YNitxQ/CGCAXgg8Ody2tDJuxjjVOIS
	p8zQ==
X-Gm-Message-State: AG10YORv5xq2UwcM2U0oqejk7obAxsdsqVyFnf4dzHkJ6ze6IlvpiBdjkJcmZRJ8G49qwJG/nar16RCfszNxEg==
MIME-Version: 1.0
X-Received: by 10.37.81.200 with SMTP id f191mr6962278ybb.1.1453928791083;
	Wed, 27 Jan 2016 13:06:31 -0800 (PST)
Reply-To: manuel.bachmann@iot.bzh
Sender: mbc@koumoul.net
Received: by 10.13.207.131 with HTTP; Wed, 27 Jan 2016 13:06:31 -0800 (PST)
X-Originating-IP: [92.139.132.157]
In-Reply-To: <20160127141453.GF2574@jama>
References: <1453474301-26578-1-git-send-email-manuel.bachmann@iot.bzh>
	<20160127141453.GF2574@jama>
Date: Wed, 27 Jan 2016 22:06:31 +0100
X-Google-Sender-Auth: 6bo64hFhgXXCeP9sFVoyjPBxRYA
Message-ID: <CANTDXNdUwALq_foJyWb5ETejx6G0jm333gJQ0+k+DM3Dioch0w@mail.gmail.com>
From: "Manuel Bachmann [ IoT.bzh ]" <mbc@iot.bzh>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2][meta-multimedia] rygel: Update to 0.28.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 21:06:31 -0000
Content-Type: text/plain; charset=UTF-8

Good catch, and sorry for the bad formatting. Resending both patches.

2016-01-27 15:14 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:

> On Fri, Jan 22, 2016 at 03:51:41PM +0100, Manuel Bachmann wrote:
> > From: Manuel Bachmann <mbc@iot.bzh>
> >
> > Update to latest version. This mainly fixes file uploading,
> > which did not work in previous version (see upstream commit
> > "1d45866a3fd7ca47bdbea60156bd18b994710662" among others).
> >
> > Rygel will not keep running anymore when its "plugins"
> > folder is absent or empty. Thus, to avoid disappointments,
> > we now RRECOMMEND at least the "media-export" plugin.
>
> Please resend with -M and libunistring dependency or PACKAGECONFIG.
>
> rygel: rygel-plugin-media-export rdepends on libunistring, but it isn't a
> build dependency? [build-deps]
>
> >
> > Signed-off-by: Manuel Bachmann <mbc@iot.bzh>
> > ---
> >  .../recipes-connectivity/rygel/rygel_0.26.1.bb     |   58
> -------------------
> >  .../recipes-connectivity/rygel/rygel_0.28.2.bb     |   59
> ++++++++++++++++++++
> >  2 files changed, 59 insertions(+), 58 deletions(-)
> >  delete mode 100644 meta-multimedia/recipes-connectivity/rygel/
> rygel_0.26.1.bb
> >  create mode 100644 meta-multimedia/recipes-connectivity/rygel/
> rygel_0.28.2.bb
> >
> > diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> > deleted file mode 100644
> > index af3f2be..0000000
> > --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
> > +++ /dev/null
> > @@ -1,58 +0,0 @@
> > -SUMMARY = "A UPnP AV media server and renderer"
> > -DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer)
> that \
> > -allow you to easily share audio, video and pictures to other devices. \
> > -Additionally, media player software may use Rygel to become a
> MediaRenderer \
> > -that may be controlled remotely by a UPnP or DLNA Controller."
> > -HOMEPAGE = "http://live.gnome.org/Rygel"
> > -
> > -LICENSE = "LGPLv2+"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2
> \
> > -
> file://src/rygel/rygel-main.vala;endline=25;md5=a4cce4d389da1c1638fe68d07ae9d811"
> > -
> > -DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna
> gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4
> libmediaart-2.0"
> > -RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
> > -
> > -GNOME_COMPRESS_TYPE = "xz"
> > -SRC_URI[archive.md5sum] = "f182d54913a528bb5b4fb2f291aca0fc"
> > -SRC_URI[archive.sha256sum] =
> "390740609e34399b886ddb9a8f7eca25055ad72048dfdd869edf02999b1e1d8f"
> > -
> > -inherit gnomebase vala
> > -
> > -EXTRA_OECONF = "--disable-introspection --disable-tracker-plugin
> --with-media-engine=gstreamer"
> > -
> > -PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch
> gtk+3"
> > -PACKAGECONFIG[external] =
> "--enable-external-plugin,--disable-external-plugin"
> > -PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
> > -PACKAGECONFIG[mediathek] =
> "--enable-mediathek-plugin,--disable-mediathek-plugin"
> > -PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
> > -PACKAGECONFIG[media-export] =
> "--enable-media-export-plugin,--disable-media-export-plugin,sqlite3"
> > -PACKAGECONFIG[gst-launch] =
> "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
> > -PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
> > -
> > -LIBV = "2.6"
> > -
> > -do_install_append() {
> > -       # Remove .la files for loadable modules
> > -       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
> > -       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> > -}
> > -
> > -FILES_${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1
> ${datadir}/icons"
> > -FILES_${PN}-dbg += "${libdir}/rygel-${LIBV}/engines/.debug
> ${libdir}/rygel-${LIBV}/plugins/.debug"
> > -
> > -PACKAGES += "${PN}-meta"
> > -ALLOW_EMPTY_${PN}-meta = "1"
> > -
> > -PACKAGES_DYNAMIC = "${PN}-plugin-*"
> > -
> > -python populate_packages_prepend () {
> > -    rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
> > -    postinst = d.getVar('plugin_postinst', True)
> > -    pkgs = []
> > -
> > -    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"),
> 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',
> postinst=postinst, extra_depends=d.expand('${PN}'))
> > -    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"),
> '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',
> postinst=postinst, extra_depends=d.expand('${PN}'))
> > -
> > -    metapkg = d.getVar('PN', True) + '-meta'
> > -    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
> > -}
> > diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> > new file mode 100644
> > index 0000000..f1c47a0
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> > @@ -0,0 +1,59 @@
> > +SUMMARY = "A UPnP AV media server and renderer"
> > +DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer)
> that \
> > +allow you to easily share audio, video and pictures to other devices. \
> > +Additionally, media player software may use Rygel to become a
> MediaRenderer \
> > +that may be controlled remotely by a UPnP or DLNA Controller."
> > +HOMEPAGE = "http://live.gnome.org/Rygel"
> > +
> > +LICENSE = "LGPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2
> \
> > +
> file://src/rygel/rygel-main.vala;endline=27;md5=99324118da4c012d25edae2f779ae9b3"
> > +
> > +DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna
> gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4
> libmediaart-2.0"
> > +RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
> > +RRECOMMENDS_${PN} = "rygel-plugin-media-export"
> > +
> > +GNOME_COMPRESS_TYPE = "xz"
> > +SRC_URI[archive.md5sum] = "9fbe4fb53b6cfa2f3f3723b7649a2215"
> > +SRC_URI[archive.sha256sum] =
> "9ea23df7186caac5f1aad3137edf6d507d339b9a469fc3133df4043fa66b61f5"
> > +
> > +inherit gnomebase vala
> > +
> > +EXTRA_OECONF = "--disable-introspection --disable-tracker-plugin
> --with-media-engine=gstreamer"
> > +
> > +PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch
> gtk+3"
> > +PACKAGECONFIG[external] =
> "--enable-external-plugin,--disable-external-plugin"
> > +PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
> > +PACKAGECONFIG[mediathek] =
> "--enable-mediathek-plugin,--disable-mediathek-plugin"
> > +PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
> > +PACKAGECONFIG[media-export] =
> "--enable-media-export-plugin,--disable-media-export-plugin,sqlite3"
> > +PACKAGECONFIG[gst-launch] =
> "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
> > +PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
> > +
> > +LIBV = "2.6"
> > +
> > +do_install_append() {
> > +       # Remove .la files for loadable modules
> > +       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
> > +       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> > +}
> > +
> > +FILES_${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1
> ${datadir}/icons"
> > +FILES_${PN}-dbg += "${libdir}/rygel-${LIBV}/engines/.debug
> ${libdir}/rygel-${LIBV}/plugins/.debug"
> > +
> > +PACKAGES += "${PN}-meta"
> > +ALLOW_EMPTY_${PN}-meta = "1"
> > +
> > +PACKAGES_DYNAMIC = "${PN}-plugin-*"
> > +
> > +python populate_packages_prepend () {
> > +    rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
> > +    postinst = d.getVar('plugin_postinst', True)
> > +    pkgs = []
> > +
> > +    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"),
> 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',
> postinst=postinst, extra_depends=d.expand('${PN}'))
> > +    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"),
> '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s',
> postinst=postinst, extra_depends=d.expand('${PN}'))
> > +
> > +    metapkg = d.getVar('PN', True) + '-meta'
> > +    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
> > +}
> > --
> > 1.7.10.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

