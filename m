Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id BF55975E2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 00:07:12 +0000 (UTC)
Received: by lbblt2 with SMTP id lt2so27952448lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 16:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Obc0BWHkkpQF2R3CWLDblGYSyYW7WIijzmNHLptLwRs=;
	b=iQ3Ikm91GuxglVG+6zyscBTUdwE9JsjmHGnSJRvvhLyfvir79JwyqmrCuN9nhu6xpr
	QE9HGRdiDLi6XfhjHyBVlj3ix3zhVKVm6TEq9cXN3vnxW7pkyDneFvgy5QIBfpqMZu6m
	ZX6KmJoe4FQYeArB4xGQkgDyWYaL7odifbZzBYWgJxDId60RdnQtcC2zbPP0yAvRGbeS
	qLESvLhqaf3LNqC8Cg1e+MAvkFxmVQYProM5uvU8oFdPMh4y48aAtvf6dShwGDx1ONXG
	g5FTqtBkK8UIo78WeyfVoKKB2ViQsMlEalii6qlc6ucVlAU0kVtNiDyHhgtrhJ4oMTxl
	1tyg==
MIME-Version: 1.0
X-Received: by 10.112.205.99 with SMTP id lf3mr4255652lbc.80.1446768431761;
	Thu, 05 Nov 2015 16:07:11 -0800 (PST)
Received: by 10.25.34.202 with HTTP; Thu, 5 Nov 2015 16:07:11 -0800 (PST)
In-Reply-To: <20151105205707.GH2556@jama>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-2-git-send-email-funman@videolan.org>
	<20151105201759.GG2556@jama> <563BBF43.5010309@videolan.org>
	<20151105205707.GH2556@jama>
Date: Thu, 5 Nov 2015 16:07:11 -0800
Message-ID: <CANx9H-AznEWHvGH9PHb1tjT03h4rPo=F_XAZARmyDDiUZZwncg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH 2/3] VLC: make libnotify a configurable dependency
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
X-List-Received-Date: Fri, 06 Nov 2015 00:07:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2015 at 12:57 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Nov 05, 2015 at 09:42:43PM +0100, Rafa=C3=ABl Carr=C3=A9 wrote:
> > On 05/11/2015 21:17, Martin Jansa wrote:
> > > On Wed, Nov 04, 2015 at 05:03:18PM +0100, Rafa=C3=ABl Carr=C3=A9 wrot=
e:
> > >> ---
> > >>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > >> index b989849..ad5c81d 100644
> > >> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > >> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > >>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
> > >>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
> > >>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib =
\
> > >> -   libdvdcss libdvdread lua-native lua libidn libnotify gtk+
> gnome-vfs \
> > >> +   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
> > >>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec =
\
> > >>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
> > >>     tiff xcb-util-keysyms samba"
> > >> @@ -58,6 +58,7 @@ PACKAGECONFIG[gstreamer] =3D
> "--enable-gst-decode,--disable-gst-decode,gstreamer1.
> > >>  PACKAGECONFIG[vpx] =3D "--enable-vpx,--disable-vpx, libvpx"
> > >>  PACKAGECONFIG[qt4] =3D "--enable-qt,--disable-qt, qt4-x11-free"
> > >>  PACKAGECONFIG[freerdp] =3D "--enable-freerdp,--disable-freerdp,
> freerdp"
> > >> +PACKAGECONFIG[notify] =3D "--enable-notify,--disable-notify, libnot=
ify
> gtk+"
> > >
> > > Removing gtk+ from DEPENDS causes even more undeterministic
> > > dependencies:
> >
> > I would guess those real dependencies were hidden by gtk+ which depends
> on
> > every single one of them.
> >
> > Except maybe vorbis which was hidden by gstreamer plugins?
> >
> > I agree that although depending on gtk+ is not fully nice neither
> > correct, it makes
> > things deterministic.
> >
> >
> > So I guess I should rather add all the PACKAGECONFIG for these modules
> > first and then move
> > those dependencies to their respective PACKAGECONFIG ?
>
> yes
>
> There are 112 AC_ARG_ENABLE clauses in configure.ac
<https://github.com/videolan/vlc/blob/master/configure.ac>... but adding
PACKAGECONFIG for those that make sense has been on my list of TODO for a
long time. Not all of them apply to our usage (winstore_app for instance).
Testing all those options is one of the things that has held me back...so
the approach of fixing what becomes broken has been the easier route.

At least there aren't a large amount of PKG_CHECK_MODULES which leads to
endless patches to make it deterministic which other upstreams have zero
interest in applying.

--Tim

