Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDE2D148A0
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 05:24:08 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.300.1767849847644146370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 21:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h/ApDJ63;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64472c71fc0so2892200d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 21:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767849847; x=1768454647; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNDyfdQMPVOYrNQFACmRwuQuTVZ4VD27S+U3ZFivcT4=;
        b=h/ApDJ63e7S/T5pNLSKOgH3v9G53ilOMxafJRySVO/8eUVzsrLXjhorkIGTLywe5+g
         NBX0wW2uR9aRLSzMSqClnRU9JfVAwh1nUHHs2NX0K+yCviqmrPbsf9YY2PhPrpOqjyBp
         vmgzWjtupEJNytNFC2Vk8607ofMB16HNkENFayPUaWHwFpVUAPSqJcab0m5kySP1/IH/
         bfJmjKwmCWXAyhQdV+gpOgovv6B8zbO3g/AOQGrDuyzaQF84cXQGFVx/+is2ps7TpOJJ
         aGRd7FbFB2r8/dch87lt2SpKnSxbrywZ1DCi6WMtlRIAGZ4fG5DZPEsKgqqRw9LkPvvo
         KKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767849847; x=1768454647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNDyfdQMPVOYrNQFACmRwuQuTVZ4VD27S+U3ZFivcT4=;
        b=dsRx9BzbgwHSQF74Cfd6fCJWrF+U8tgWYGZcxP7+pz4+t8F3FJoSxRkrJK5gMW3prU
         vVB5cLvTadOXqQfYk3r4QNAAy2wCJqbVKwa+PFzRWWHBlo7sM9i4v+SimYAikDbJ4wFl
         KskMw1OepoKfHcwkMrtGxfBI0RDN316Yk8h8g4+Vt/p7Bxno4lmAUYpZ0vIA5Q4RTZeY
         R2Wx/RAzJolGXRzwRiGAWw+4lXpymFUo7Szb3Gw7ltVY/qXi+71xrnRZhEUo2g2qgiFL
         4hlmhgQl7tfNfqfpnc4d3ggKLcvyRbtzleGrBik5BNDOQvZ7qkAmdLso55/zXxPPuvKe
         +x8g==
X-Gm-Message-State: AOJu0Yx+hswsR5Lcj6N+pmFHwJiDyByH8qkL1xNBk7d4UI9oeDs4cDF6
	HuubS/PNHk2YvQ/DzJClVY4gKE7LuwQ2dT9gZNu0oKWHksjNfV+W07QRY3yP5pKkNPZpG/IZCjD
	FAztBN0qlr2nUhexFycg/xx/Est6233Q=
X-Gm-Gg: AY/fxX77VlRqXLBv1KUFgJsAlp0hmtmFU2rdv0X3AAOE6qxgJUCY377q3Yz33fpLJDS
	/7Iu6kaI7RpoV07iUU+15QoEFb1q5x2g85IKW6B8jT3KTT+DTIrvUwcUjlFMwsyzhWppe0qF+IW
	CGM9DbtuMx9zwiDLjLP4Tq2SJegv1UWAYQAiUw/M1RGJ8zjaklNOWXx4ddykHcW8hXY7siPQ3Ta
	dxi2sx/BCLkV0xRB5vLQXd7VS2HxbS6wSgu9AhoWWOvVLQfuNJpwbLnjJDqZuvFu2A7VSzbx/IW
	KLNm0zglpikFGNhQR1plJeMiW5wxS3V5hGXU7LGuuYJRyXoe7r+KtGsxXh/DDlSq5V3pxz1ODy7
	3jdfHcJgj1Qz/WDppdnDatiDYCbBkS0hstZFSb82U+AiWrA==
X-Google-Smtp-Source: AGHT+IHjrj4bzxqXxIiYi7wxLJ/SkXeCMJnUuZclzDvd30aSM/SWoi8Gv28hmadk2zZLwAslJYGTMeeinPMbpEVhCVA=
X-Received: by 2002:a05:690e:1449:b0:644:6f3c:11fc with SMTP id
 956f58d0204a3-64716b742b9mr4237133d50.21.1767849846641; Wed, 07 Jan 2026
 21:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20260107173104.211861-1-f_l_k@t-online.de>
In-Reply-To: <20260107173104.211861-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 21:23:40 -0800
X-Gm-Features: AQt7F2pimXvdL450wVxszQI_xG8DdWQUL9OqH_Exq7hHQIkNChpo_i41yk5PdSA
Message-ID: <CAMKF1so9F3aB_r=F78ZqY4JFkn3-3oDEHBMFyW=fi7kTvrU9ow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pavucontrol: update 5.0 -> 6.2
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000201b310647d99e42"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 05:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123245

--000000000000201b310647d99e42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 9:31=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> - switch to meson buildsystem
> - pavucontrol now requires gtk4 and thus requires gpu acceleration
> - remove patch. Meanwhile libcanberra is optional and build doesn't
>   fail without anymore
> - pavucontrol was migrated from intltool to gettext
> - add packageconfigs for libcanberra and lynx to have both disabled
>   by default
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ucontrol-remove-canberra-gtk-support.patch | 112 ------------------
>  .../pulseaudio/pavucontrol_5.0.bb             |  27 -----
>  .../pulseaudio/pavucontrol_6.2.bb             |  22 ++++
>  3 files changed, 22 insertions(+), 139 deletions(-)
>  delete mode 100644
> meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remove=
-canberra-gtk-support.patch
>  delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/
> pavucontrol_5.0.bb
>  create mode 100644 meta-oe/recipes-multimedia/pulseaudio/
> pavucontrol_6.2.bb
>
> diff --git
> a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remo=
ve-canberra-gtk-support.patch
> b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remo=
ve-canberra-gtk-support.patch
> deleted file mode 100644
> index 44169240c5..0000000000
> ---
> a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-remo=
ve-canberra-gtk-support.patch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From 87992a57e5f517d5ceb5dfabaea662ac64983720 Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Fri, 27 May 2022 18:37:53 +0200
> -Subject: [PATCH] pavucontrol: remove canberra-gtk support
> -
> -libcanberra-gtk3 module isn't buildable for wayland.
> -Remove its dpendency.
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> -
> -Upstream-Status: Inappropriate
> ----
> - configure.ac           |  2 +-
> - src/pavuapplication.cc |  2 --
> - src/pavucontrol.cc     |  4 ----
> - src/sinkwidget.cc      | 17 -----------------
> - 4 files changed, 1 insertion(+), 24 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 056ba5e..e857563 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -41,7 +41,7 @@ AC_TYPE_SIGNAL
> - AC_HEADER_STDC
> - AX_CXX_COMPILE_STDCXX_11
> -
> --PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0
> libcanberra-gtk3 >=3D 0.16 json-glib-1.0 ])
> -+PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 json-glib-1=
.0
> ])
> - AC_SUBST(GUILIBS_CFLAGS)
> - AC_SUBST(GUILIBS_LIBS)
> -
> -diff --git a/src/pavuapplication.cc b/src/pavuapplication.cc
> -index 6773b53..60c016c 100644
> ---- a/src/pavuapplication.cc
> -+++ b/src/pavuapplication.cc
> -@@ -24,8 +24,6 @@
> -
> - #include "i18n.h"
> -
> --#include <canberra-gtk.h>
> --
> - #include "pavuapplication.h"
> - #include "pavucontrol.h"
> - #include "mainwindow.h"
> -diff --git a/src/pavucontrol.cc b/src/pavucontrol.cc
> -index 18d5400..10ab646 100644
> ---- a/src/pavucontrol.cc
> -+++ b/src/pavucontrol.cc
> -@@ -29,8 +29,6 @@
> - #include <json-glib/json-glib.h>
> - #endif
> -
> --#include <canberra-gtk.h>
> --
> - #include "pavucontrol.h"
> - #include "i18n.h"
> - #include "minimalstreamwidget.h"
> -@@ -916,8 +914,6 @@ MainWindow* pavucontrol_get_window(pa_glib_mainloop
> *m, bool maximize, bool _ret
> -     tab_number =3D _tab_number;
> -     retry =3D _retry;
> -
> --    ca_context_set_driver(ca_gtk_context_get(), "pulse");
> --
> -     mainWindow =3D MainWindow::create(maximize);
> -
> -     api =3D pa_glib_mainloop_get_api(m);
> -diff --git a/src/sinkwidget.cc b/src/sinkwidget.cc
> -index f30bd37..482fd1f 100644
> ---- a/src/sinkwidget.cc
> -+++ b/src/sinkwidget.cc
> -@@ -24,7 +24,6 @@
> -
> - #include "sinkwidget.h"
> -
> --#include <canberra-gtk.h>
> - #if HAVE_EXT_DEVICE_RESTORE_API
> - #  include <pulse/format.h>
> - #  include <pulse/ext-device-restore.h>
> -@@ -111,7 +110,6 @@ SinkWidget* SinkWidget::create(MainWindow*
> mainWindow) {
> - void SinkWidget::executeVolumeUpdate() {
> -     pa_operation* o;
> -     char dev[64];
> --    int playing =3D 0;
> -
> -     if (!(o =3D pa_context_set_sink_volume_by_index(get_context(), inde=
x,
> &volume, NULL, NULL))) {
> -         show_error(_("pa_context_set_sink_volume_by_index() failed"));
> -@@ -120,22 +118,7 @@ void SinkWidget::executeVolumeUpdate() {
> -
> -     pa_operation_unref(o);
> -
> --    ca_context_playing(ca_gtk_context_get(), 2, &playing);
> --    if (playing)
> --        return;
> --
> -     snprintf(dev, sizeof(dev), "%lu", (unsigned long) index);
> --    ca_context_change_device(ca_gtk_context_get(), dev);
> --
> --    ca_gtk_play_for_widget(GTK_WIDGET(gobj()),
> --                           2,
> --                           CA_PROP_EVENT_DESCRIPTION, _("Volume Control
> Feedback Sound"),
> --                           CA_PROP_EVENT_ID, "audio-volume-change",
> --                           CA_PROP_CANBERRA_CACHE_CONTROL, "permanent",
> --                           CA_PROP_CANBERRA_ENABLE, "1",
> --                           NULL);
> --
> --    ca_context_change_device(ca_gtk_context_get(), NULL);
> - }
> -
> - void SinkWidget::onMuteToggleButton() {
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
> b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
> deleted file mode 100644
> index 29500bdb94..0000000000
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION =3D "PulseAudio Volume Control (pavucontrol) is a simple GTK
> based volume control tool ("mixer") for the PulseAudio sound server."
> -HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/pavucontrol/"
> -SECTION =3D "x11/multimedia"
> -LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -# glib-2.0-native is required for glib-gettextize, which is used by the
> -# AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated,
> so the
> -# glib-2.0-native dependency may go away at some point (something to kee=
p
> in
> -# mind when doing version upgrades).
> -DEPENDS =3D "libxml-parser-perl-native intltool-native glib-2.0-native
> gtkmm3 pulseaudio json-glib"
> -
> -inherit autotools features_check perlnative pkgconfig
> -
> -ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -
> -SRC_URI =3D "
> http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
> -SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'file://0001-pavucontrol-remove-canberra-gtk-support.patch', '', d)}"
> -
> -SRC_URI[sha256sum] =3D
> "ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3a36d20536af2e8f4e7a"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -PACKAGECONFIG[x11] =3D ",,libcanberra"
> -
> -EXTRA_OECONF =3D "--disable-lynx "
> -
> -RDEPENDS:${PN} +=3D "pulseaudio-server"
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> new file mode 100644
> index 0000000000..b6b9a068a9
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "PulseAudio Volume Control is a simple GTK based volume cont=
rol
> tool for the PulseAudio sound server"
> +HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/pavucontrol/"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "gtkmm4 pulseaudio json-glib"
> +
> +inherit meson features_check pkgconfig gettext
> +
> +ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
>

I am seeing this on world build

stdio: ERROR: Nothing RPROVIDES 'pavucontrol' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-xfce/recip=
es-panel-plugins/pulseaudio/
xfce4-pulseaudio-plugin_0.5.1.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.

I guess distro features should match between these two recipes or perhaps
the rrecommends
should be removed.


> +
> +SRC_URI =3D "
> http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
> +SRC_URI[sha256sum] =3D
> "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32"
> +
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG[audio-feedback] =3D
> "-Daudio-feedback=3Denabled,-Daudio-feedback=3Ddisabled,libcanberra"
> +PACKAGECONFIG[lynx] =3D "-Dlynx=3Denabled,-Dlynx=3Ddisabled,lynx"
> +
> +FILES:${PN} +=3D "${datadir}"
> +
> +RDEPENDS:${PN} +=3D "pulseaudio-server"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123226):
> https://lists.openembedded.org/g/openembedded-devel/message/123226
> Mute This Topic: https://lists.openembedded.org/mt/117138237/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000201b310647d99e42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, =
2026 at 9:31=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de=
@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">- switch to meso=
n buildsystem<br>
- pavucontrol now requires gtk4 and thus requires gpu acceleration<br>
- remove patch. Meanwhile libcanberra is optional and build doesn&#39;t<br>
=C2=A0 fail without anymore<br>
- pavucontrol was migrated from intltool to gettext<br>
- add packageconfigs for libcanberra and lynx to have both disabled<br>
=C2=A0 by default<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...ucontrol-remove-canberra-gtk-support.patch | 112 -----------------=
-<br>
=C2=A0.../pulseaudio/<a href=3D"http://pavucontrol_5.0.bb" rel=3D"noreferre=
r" target=3D"_blank">pavucontrol_5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 27 -----<br>
=C2=A0.../pulseaudio/<a href=3D"http://pavucontrol_6.2.bb" rel=3D"noreferre=
r" target=3D"_blank">pavucontrol_6.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 22 ++++<br>
=C2=A03 files changed, 22 insertions(+), 139 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/=
0001-pavucontrol-remove-canberra-gtk-support.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/<a href=3D"h=
ttp://pavucontrol_5.0.bb" rel=3D"noreferrer" target=3D"_blank">pavucontrol_=
5.0.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/pulseaudio/<a href=3D"h=
ttp://pavucontrol_6.2.bb" rel=3D"noreferrer" target=3D"_blank">pavucontrol_=
6.2.bb</a><br>
<br>
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucon=
trol-remove-canberra-gtk-support.patch b/meta-oe/recipes-multimedia/pulseau=
dio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch<br>
deleted file mode 100644<br>
index 44169240c5..0000000000<br>
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-re=
move-canberra-gtk-support.patch<br>
+++ /dev/null<br>
@@ -1,112 +0,0 @@<br>
-From 87992a57e5f517d5ceb5dfabaea662ac64983720 Mon Sep 17 00:00:00 2001<br>
-From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
-Date: Fri, 27 May 2022 18:37:53 +0200<br>
-Subject: [PATCH] pavucontrol: remove canberra-gtk support<br>
-<br>
-libcanberra-gtk3 module isn&#39;t buildable for wayland.<br>
-Remove its dpendency.<br>
-<br>
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
-<br>
-Upstream-Status: Inappropriate<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- src/pavuapplication.cc |=C2=A0 2 --<br>
- src/pavucontrol.cc=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ----<br>
- src/sinkwidget.cc=C2=A0 =C2=A0 =C2=A0 | 17 -----------------<br>
- 4 files changed, 1 insertion(+), 24 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 056ba5e..e857563 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -41,7 +41,7 @@ AC_TYPE_SIGNAL<br>
- AC_HEADER_STDC<br>
- AX_CXX_COMPILE_STDCXX_11<br>
- <br>
--PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 &gt;=3D 3.22 sigc++-2.0 libcanberr=
a-gtk3 &gt;=3D 0.16 json-glib-1.0 ])<br>
-+PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 &gt;=3D 3.22 sigc++-2.0 json-glib-=
1.0 ])<br>
- AC_SUBST(GUILIBS_CFLAGS)<br>
- AC_SUBST(GUILIBS_LIBS)<br>
- <br>
-diff --git a/src/pavuapplication.cc b/src/pavuapplication.cc<br>
-index 6773b53..60c016c 100644<br>
---- a/src/pavuapplication.cc<br>
-+++ b/src/pavuapplication.cc<br>
-@@ -24,8 +24,6 @@<br>
- <br>
- #include &quot;i18n.h&quot;<br>
- <br>
--#include &lt;canberra-gtk.h&gt;<br>
--<br>
- #include &quot;pavuapplication.h&quot;<br>
- #include &quot;pavucontrol.h&quot;<br>
- #include &quot;mainwindow.h&quot;<br>
-diff --git a/src/pavucontrol.cc b/src/pavucontrol.cc<br>
-index 18d5400..10ab646 100644<br>
---- a/src/pavucontrol.cc<br>
-+++ b/src/pavucontrol.cc<br>
-@@ -29,8 +29,6 @@<br>
- #include &lt;json-glib/json-glib.h&gt;<br>
- #endif<br>
- <br>
--#include &lt;canberra-gtk.h&gt;<br>
--<br>
- #include &quot;pavucontrol.h&quot;<br>
- #include &quot;i18n.h&quot;<br>
- #include &quot;minimalstreamwidget.h&quot;<br>
-@@ -916,8 +914,6 @@ MainWindow* pavucontrol_get_window(pa_glib_mainloop *m=
, bool maximize, bool _ret<br>
-=C2=A0 =C2=A0 =C2=A0tab_number =3D _tab_number;<br>
-=C2=A0 =C2=A0 =C2=A0retry =3D _retry;<br>
- <br>
--=C2=A0 =C2=A0 ca_context_set_driver(ca_gtk_context_get(), &quot;pulse&quo=
t;);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0mainWindow =3D MainWindow::create(maximize);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0api =3D pa_glib_mainloop_get_api(m);<br>
-diff --git a/src/sinkwidget.cc b/src/sinkwidget.cc<br>
-index f30bd37..482fd1f 100644<br>
---- a/src/sinkwidget.cc<br>
-+++ b/src/sinkwidget.cc<br>
-@@ -24,7 +24,6 @@<br>
- <br>
- #include &quot;sinkwidget.h&quot;<br>
- <br>
--#include &lt;canberra-gtk.h&gt;<br>
- #if HAVE_EXT_DEVICE_RESTORE_API<br>
- #=C2=A0 include &lt;pulse/format.h&gt;<br>
- #=C2=A0 include &lt;pulse/ext-device-restore.h&gt;<br>
-@@ -111,7 +110,6 @@ SinkWidget* SinkWidget::create(MainWindow* mainWindow)=
 {<br>
- void SinkWidget::executeVolumeUpdate() {<br>
-=C2=A0 =C2=A0 =C2=A0pa_operation* o;<br>
-=C2=A0 =C2=A0 =C2=A0char dev[64];<br>
--=C2=A0 =C2=A0 int playing =3D 0;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!(o =3D pa_context_set_sink_volume_by_index(get_co=
ntext(), index, &amp;volume, NULL, NULL))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0show_error(_(&quot;pa_context_set_sink_v=
olume_by_index() failed&quot;));<br>
-@@ -120,22 +118,7 @@ void SinkWidget::executeVolumeUpdate() {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0pa_operation_unref(o);<br>
- <br>
--=C2=A0 =C2=A0 ca_context_playing(ca_gtk_context_get(), 2, &amp;playing);<=
br>
--=C2=A0 =C2=A0 if (playing)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0snprintf(dev, sizeof(dev), &quot;%lu&quot;, (unsigned =
long) index);<br>
--=C2=A0 =C2=A0 ca_context_change_device(ca_gtk_context_get(), dev);<br>
--<br>
--=C2=A0 =C2=A0 ca_gtk_play_for_widget(GTK_WIDGET(gobj()),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A02,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0CA_PROP_EVENT_DESCRIPTION, _(&quot;Volume Control F=
eedback Sound&quot;),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0CA_PROP_EVENT_ID, &quot;audio-volume-change&quot;,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0CA_PROP_CANBERRA_CACHE_CONTROL, &quot;permanent&quo=
t;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0CA_PROP_CANBERRA_ENABLE, &quot;1&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
--<br>
--=C2=A0 =C2=A0 ca_context_change_device(ca_gtk_context_get(), NULL);<br>
- }<br>
- <br>
- void SinkWidget::onMuteToggleButton() {<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://pavuco=
ntrol_5.0.bb" rel=3D"noreferrer" target=3D"_blank">pavucontrol_5.0.bb</a> b=
/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://pavucontrol_5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">pavucontrol_5.0.bb</a><br>
deleted file mode 100644<br>
index 29500bdb94..0000000000<br>
--- a/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://pavucontrol_5=
.0.bb" rel=3D"noreferrer" target=3D"_blank">pavucontrol_5.0.bb</a><br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-DESCRIPTION =3D &quot;PulseAudio Volume Control (pavucontrol) is a simple =
GTK based volume control tool (&quot;mixer&quot;) for the PulseAudio sound =
server.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://freedesktop.org/software/pulseaudio/=
pavucontrol/" rel=3D"noreferrer" target=3D"_blank">https://freedesktop.org/=
software/pulseaudio/pavucontrol/</a>&quot;<br>
-SECTION =3D &quot;x11/multimedia&quot;<br>
-LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
-<br>
-# glib-2.0-native is required for glib-gettextize, which is used by the<br=
>
-# AM_GLIB_GNU_GETTEXT macro in <a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a>. That macro is deprecated, so th=
e<br>
-# glib-2.0-native dependency may go away at some point (something to keep =
in<br>
-# mind when doing version upgrades).<br>
-DEPENDS =3D &quot;libxml-parser-perl-native intltool-native glib-2.0-nativ=
e gtkmm3 pulseaudio json-glib&quot;<br>
-<br>
-inherit autotools features_check perlnative pkgconfig<br>
-<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/pulseaudi=
o/$%7BBPN%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://=
www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz</a>&quot;<br>
-SRC_URI:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;wayland&#39;, &#39;file://0001-pavucontrol-remove-canberra-gtk-support=
.patch&#39;, &#39;&#39;, d)}&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3=
a36d20536af2e8f4e7a&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;x11&#39;, d)}&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;,,libcanberra&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-lynx &quot;<br>
-<br>
-RDEPENDS:${PN} +=3D &quot;pulseaudio-server&quot;<br>
diff --git a/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://pavuco=
ntrol_6.2.bb" rel=3D"noreferrer" target=3D"_blank">pavucontrol_6.2.bb</a> b=
/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://pavucontrol_6.2.bb=
" rel=3D"noreferrer" target=3D"_blank">pavucontrol_6.2.bb</a><br>
new file mode 100644<br>
index 0000000000..b6b9a068a9<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://pavucontrol_6=
.2.bb" rel=3D"noreferrer" target=3D"_blank">pavucontrol_6.2.bb</a><br>
@@ -0,0 +1,22 @@<br>
+SUMMARY =3D &quot;PulseAudio Volume Control is a simple GTK based volume c=
ontrol tool for the PulseAudio sound server&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://freedesktop.org/software/pulseaudio/=
pavucontrol/" rel=3D"noreferrer" target=3D"_blank">https://freedesktop.org/=
software/pulseaudio/pavucontrol/</a>&quot;<br>
+SECTION =3D &quot;multimedia&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
+<br>
+DEPENDS =3D &quot;gtkmm4 pulseaudio json-glib&quot;<br>
+<br>
+inherit meson features_check pkgconfig gettext<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;opengl vulkan&quot;<br></blockquote><div>=
<br></div><div>I am seeing this on world build</div><div><br></div><div>std=
io: ERROR: Nothing RPROVIDES &#39;pavucontrol&#39; (but /srv/pokybuild/yoct=
o-worker/meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/pu=
lseaudio/<a href=3D"http://xfce4-pulseaudio-plugin_0.5.1.bb">xfce4-pulseaud=
io-plugin_0.5.1.bb</a> RDEPENDS on or otherwise requires it)<br>stdio: ERRO=
R: Required build target &#39;meta-world-pkgdata&#39; has no buildable prov=
iders.<br></div><div><br></div><div>I guess distro features should match be=
tween these two recipes or perhaps the rrecommends</div><div>should be remo=
ved.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+<br>
+SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/pulseaudi=
o/$%7BBPN%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://=
www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e93a7836c7307dcbc989e95fc7ec0878322514c475fab=
d90e89ed52fd4f15d32&quot;<br>
+<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
+PACKAGECONFIG[audio-feedback] =3D &quot;-Daudio-feedback=3Denabled,-Daudio=
-feedback=3Ddisabled,libcanberra&quot;<br>
+PACKAGECONFIG[lynx] =3D &quot;-Dlynx=3Denabled,-Dlynx=3Ddisabled,lynx&quot=
;<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;pulseaudio-server&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123226): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123226" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123226</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117138237/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117138237/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000201b310647d99e42--

