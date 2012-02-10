Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvozV-0005IQ-Dl
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 12:50:14 +0100
Received: by wgbdr13 with SMTP id dr13so2413597wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 03:42:07 -0800 (PST)
Received: by 10.180.7.231 with SMTP id m7mr3326872wia.3.1328874127201; Fri, 10
	Feb 2012 03:42:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.113.67 with HTTP; Fri, 10 Feb 2012 03:41:47 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CALbNGRStPPQrjdDjXBHUEWMiwtNE83Ye76y4hLLg2r0ARHUtrA@mail.gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328380249-11697-3-git-send-email-tworaz666@gmail.com>
	<CALbNGRStPPQrjdDjXBHUEWMiwtNE83Ye76y4hLLg2r0ARHUtrA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 10 Feb 2012 13:41:47 +0200
Message-ID: <CAK18fxFyXnwuFj-=caU3e-Dy+tGZVwgTpP7NmsZ4opWB_gJCWA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnZWou+nnfymustjPsk+kQIu1bxI6s+LUObkEe6q6zoC9hZgssVCKGhwQHK/m1I619mbAY/
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-xfce][PATCH 2/3] xfce4-settings: Update to latest stable version 4.8.3.
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
X-List-Received-Date: Fri, 10 Feb 2012 11:50:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 01:52, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> On Sat, Feb 4, 2012 at 7:30 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> > http://git.xfce.org/xfce/xfce4-settings/tag/?id=3Dxfce4-settings-4.8.3
> >
> > Run tested on netbook pro.
> >
> > Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> > ---
> >  .../xfce4-settings/xfce4-settings_4.8.2.bb         |   16
> ----------------
> >  .../xfce4-settings/xfce4-settings_4.8.3.bb         |   14
> ++++++++++++++
> >  2 files changed, 14 insertions(+), 16 deletions(-)
> >  delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.8.2.bb
> >  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.8.3.bb
> >
> > diff --git a/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.8.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.8.2.bb
> > deleted file mode 100644
> > index 258c238..0000000
> > --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -DESCRIPTION =3D "Xfce4 settings"
> > -SECTION =3D "x11/wm"
> > -LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > -DEPENDS =3D "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi
> virtual/libx11 xrandr libnotify libxcursor libxklavier"
> > -
> > -PR =3D "r1"
> > -
> > -inherit xfce
> > -
> > -SRC_URI +=3D
> "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.patch"
> > -
> > -SRC_URI[md5sum] =3D "a45420fea20f29265ab6785cb1d07377"
> > -SRC_URI[sha256sum] =3D
> "3f79865a6a3817f3c868f2412cbf105e73e54810438f62035699ae5fd72c29d0"
> > -
> > -RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
> > diff --git a/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.8.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.8.3.bb
> > new file mode 100644
> > index 0000000..c3dd8fd
> > --- /dev/null
> > +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION =3D "Xfce4 settings"
> > +SECTION =3D "x11/wm"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > +DEPENDS =3D "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi
> virtual/libx11 xrandr libnotify libxcursor libxklavier"
> > +
> > +inherit xfce
> > +
>

No PR?


> > +SRC_URI +=3D
> "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.patch"
> > +
> > +SRC_URI[md5sum] =3D "4669298cc8a4abf0e5a410016b575030"
> > +SRC_URI[sha256sum] =3D
> "d878cc474e1e677e9607279b9a1007cb90ed35ff078de180259a8b2b8d06bc2e"
> > +
> > +RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
> > --
> > 1.7.3.4
> >
> Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

