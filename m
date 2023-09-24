Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC21CE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 07:01:49 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.35945.1695538907067882764
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 00:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id E79B926B58;
	Sun, 24 Sep 2023 09:01:44 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.4]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkJ7e-2Iq56u0; Sun, 24 Sep 2023 09:01:42 +0200
Date: Sun, 24 Sep 2023 09:01:36 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv3] gedit: Upgrade 44.2 -> 46.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <O6AH1S.IQR4ZJFE0XKX1@t-online.de>
In-Reply-To: <CAMKF1sqvnG7y4AbNC3ZyNY+a+Ob1FhQCkv0fa_XXsztozG1HAQ@mail.gmail.com>
References: <20230923151033.902586-1-f_l_k@t-online.de>
	<CAMKF1sqvnG7y4AbNC3ZyNY+a+Ob1FhQCkv0fa_XXsztozG1HAQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/D3kC+jnHwbBrKfhLdDd"
X-TOI-EXPURGATEID: 150726::1695538902-64F2CF57-C65B1C56/0/0 CLEAN NORMAL
X-TOI-MSGID: 49bb15d3-52de-45f5-ba0e-2de31ebf06a2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 07:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105103

--=-/D3kC+jnHwbBrKfhLdDd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

LIC_FILES_CHKSUM points to an invalid file
It is really strange that this did not fail for me.

On Sat, Sep 23 2023 at 07:52:24 PM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> something is still amiss.
>=20
> <https://errors.yoctoproject.org/Errors/Build/171993/>
>=20
> On Sat, Sep 23, 2023 at 8:10=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  - add recipes for libedit-amtk and libgedit-gtksourceview
>>  - drop deprecated amtk recipe
>>  - update dependencies
>>  - fix reproducibility issue
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb   | 22=20
>> -------------------
>>   .../gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}    | 13 ++++++++---
>>   .../gedit/libgedit-amtk_5.8.0.bb              | 17 ++++++++++++++
>>   .../gedit/libgedit-gtksourceview_299.0.4.bb   | 19 ++++++++++++++++
>>   4 files changed, 46 insertions(+), 25 deletions(-)
>>   delete mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
>>   rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D>=20
>> gedit_46.1.bb} (67%)
>>   create mode 100644=20
>> meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
>>   create mode 100644=20
>> meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
>>=20
>>  diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb=20
>> b/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
>>  deleted file mode 100644
>>  index fbc8f3845..000000000
>>  --- a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
>>  +++ /dev/null
>>  @@ -1,22 +0,0 @@
>>  -SUMMARY =3D "Actions, Menus and Toolbars Kit"
>>  -LICENSE =3D "LGPL-3.0-or-later"
>>  -LIC_FILES_CHKSUM =3D=20
>> "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3eef3be114124d11349ca0d=
7e117"=20
>> <file://licenses/LGPL-3.0-or-later.txt;md5=3Dc51d3eef3be114124d11349ca0d=
7e117>
>>  -
>>  -DEPENDS =3D " \
>>  -    glib-2.0-native \
>>  -    gtk+3 \
>>  -    gtk-doc-native \
>>  -    libxslt-native \
>>  -    docbook-xsl-stylesheets-native \
>>  -    python3-pygments-native \
>>  -"
>>  -
>>  -GNOMEBASEBUILDCLASS =3D "meson"
>>  -
>>  -GIR_MESON_OPTION =3D ""
>>  -
>>  -inherit gnomebase gettext features_check gobject-introspection
>>  -
>>  -ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>  -
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "d50115b85c872aac296934b5ee726a3fa156c6f5ad96d27e0edd0aa5ad173228"
>>  diff --git a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb=20
>> b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
>>  similarity index 67%
>>  rename from meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
>>  rename to meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
>>  index 34c782297..0538221f4 100644
>>  --- a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
>>  +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
>>  @@ -6,27 +6,34 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D75859989545e37968a99b631ef42722e"
>>   GNOMEBASEBUILDCLASS =3D "meson"
>>=20
>>   DEPENDS =3D " \
>>  +    appstream-glib-native \
>>  +    desktop-file-utils-native \
>>  +    libgedit-amtk \
>>  +    libgedit-gtksourceview \
>>       gdk-pixbuf-native \
>>       gtk+3 \
>>       gsettings-desktop-schemas \
>>       libpeas \
>>       libsoup \
>>       gspell \
>>  -    gtksourceview4 \
>>       tepl \
>>   "
>>=20
>>  -inherit gnomebase gsettings itstool gnome-help=20
>> gobject-introspection gtk-doc vala gettext features_check mime-xdg=20
>> python3targetconfig
>>  +inherit gnomebase gsettings itstool gnome-help=20
>> gobject-introspection gtk-doc vala gettext features_check mime-xdg=20
>> gtk-icon-cache python3targetconfig
>>=20
>>   def gnome_verdir(v):
>>       return oe.utils.trim_version(v, 1)
>>=20
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f09f0391800041c9e56893ec11"
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "a1a6e37f041765dff7227a1f5578b6f49faaf016b1e17e869caf5bfb94c6aa4e"
>>=20
>>   # gobject-introspection is mandatory and cannot be configured
>>   REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>>   ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>=20
>>  +do_install:prepend() {
>>  +    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g'=20
>> ${B}/plugins/filebrowser/gedit-file-browser-enum-types.c
>>  +}
>>  +
>>   GIR_MESON_OPTION =3D ""
>>=20
>>   GTKDOC_MESON_OPTION =3D "gtk_doc"
>>  diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb=20
>> b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
>>  new file mode 100644
>>  index 000000000..8067407e4
>>  --- /dev/null
>>  +++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
>>  @@ -0,0 +1,17 @@
>>  +SUMMARY =3D "libgedit-amtk - Actions, Menus and Toolbars Kit for GTK=20
>> applications"
>>  +SECTION =3D "gnome"
>>  +LICENSE =3D "LGPL-3.0-or-later"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSES;md5=3D75859989545e37968a99b631ef42722e"=20
>> <file://licenses;md5=3D75859989545e37968a99b631ef42722e/>
>>  +
>>  +DEPENDS =3D "glib-2.0 gtk+3"
>>  +
>>  +inherit meson pkgconfig gobject-introspection gtk-doc
>>  +
>>  +SRC_URI =3D=20
>> "git://github.com/gedit-technology/libgedit-amtk.git;protocol=3Dhttps;br=
anch=3Dmain"
>>  +S =3D "${WORKDIR}/git"
>>  +SRCREV =3D "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
>>  +
>>  +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>  +
>>  +GIR_MESON_OPTION =3D "gobject_introspection"
>>  +GTKDOC_MESON_OPTION =3D "gtk_doc"
>>  diff --git=20
>> a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb=20
>> b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
>>  new file mode 100644
>>  index 000000000..3f7ac9623
>>  --- /dev/null
>>  +++=20
>> b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
>>  @@ -0,0 +1,19 @@
>>  +SUMMARY =3D "Gedit Technology - Source code editing widget"
>>  +SECTION =3D "gnome"
>>  +LICENSE =3D "LGPL-2.1-only"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"=20
>> <file://copying;md5=3Dfbc093901857fcd118f065f900982c24/>
>>  +
>>  +DEPENDS =3D "glib-2.0 gtk+3 libxml2"
>>  +
>>  +inherit meson pkgconfig gobject-introspection gtk-doc
>>  +
>>  +SRC_URI =3D=20
>> "git://github.com/gedit-technology/libgedit-gtksourceview.git;protocol=
=3Dhttps;branch=3Dmain"
>>  +S =3D "${WORKDIR}/git"
>>  +SRCREV =3D "7062264d635f6efe04d88217a893a97ff385b873"
>>  +
>>  +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>  +
>>  +GIR_MESON_OPTION =3D "gobject_introspection"
>>  +GTKDOC_MESON_OPTION =3D "gtk_doc"
>>  +
>>  +FILES:${PN} +=3D "${datadir}"
>>  --
>>  2.42.0
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105102):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/105102>
> Mute This Topic: <https://lists.openembedded.org/mt/101541175/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-/D3kC+jnHwbBrKfhLdDd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><pre style=3D"padding: 9.5px; font=
-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-=
size: 13px; color: rgb(51, 51, 51); border-radius: 4px; margin-bottom: 10px=
; line-height: 20px; word-break: break-all; overflow-wrap: break-word; whit=
e-space-collapse: preserve; background-color: rgb(245, 245, 245); border: 1=
px solid rgba(0, 0, 0, 0.15); font-variant-ligatures: normal; orphans: 2; w=
idows: 2; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial;">LIC_FILES_CHKSUM points to an invalid f=
ile</pre></div><div>It is really strange that this did not fail for me.</di=
v></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sat, Sep 23 2023 at 07:=
52:24 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquo=
te type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-space=
s;">something is still amiss.

<a href=3D"https://errors.yoctoproject.org/Errors/Build/171993/">https://er=
rors.yoctoproject.org/Errors/Build/171993/</a>

On Sat, Sep 23, 2023 at 8:10=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f=
_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 - add recipes for libedit-amtk and libgedit-gtksourceview
 - drop deprecated amtk recipe
 - update dependencies
 - fix reproducibility issue

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb   | 22 -------------------
  .../gedit/{gedit_44.2.bb =3D&gt; gedit_46.1.bb}    | 13 ++++++++---
  .../gedit/libgedit-amtk_5.8.0.bb              | 17 ++++++++++++++
  .../gedit/libgedit-gtksourceview_299.0.4.bb   | 19 ++++++++++++++++
  4 files changed, 46 insertions(+), 25 deletions(-)
  delete mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
  rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D&gt; gedit_46.1.b=
b} (67%)
  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_=
299.0.4.bb

 diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb b/meta-gnome/reci=
pes-gnome/amtk/amtk_5.6.1.bb
 deleted file mode 100644
 index fbc8f3845..000000000
 --- a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
 +++ /dev/null
 @@ -1,22 +0,0 @@
 -SUMMARY =3D "Actions, Menus and Toolbars Kit"
 -LICENSE =3D "LGPL-3.0-or-later"
 -LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSES/LGPL-3.0-or-later.txt;md=
5=3Dc51d3eef3be114124d11349ca0d7e117" "=3D"">file://LICENSES/LGPL-3.0-or-la=
ter.txt;md5=3Dc51d3eef3be114124d11349ca0d7e117"</a>
 -
 -DEPENDS =3D " \
 -    glib-2.0-native \
 -    gtk+3 \
 -    gtk-doc-native \
 -    libxslt-native \
 -    docbook-xsl-stylesheets-native \
 -    python3-pygments-native \
 -"
 -
 -GNOMEBASEBUILDCLASS =3D "meson"
 -
 -GIR_MESON_OPTION =3D ""
 -
 -inherit gnomebase gettext features_check gobject-introspection
 -
 -ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 -
 -SRC_URI[archive.sha256sum] =3D "d50115b85c872aac296934b5ee726a3fa156c6f5a=
d96d27e0edd0aa5ad173228"
 diff --git a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb b/meta-gnome/rec=
ipes-gnome/gedit/gedit_46.1.bb
 similarity index 67%
 rename from meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
 rename to meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
 index 34c782297..0538221f4 100644
 --- a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
 +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
 @@ -6,27 +6,34 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e3=
7968a99b631ef42722e"
  GNOMEBASEBUILDCLASS =3D "meson"

  DEPENDS =3D " \
 +    appstream-glib-native \
 +    desktop-file-utils-native \
 +    libgedit-amtk \
 +    libgedit-gtksourceview \
      gdk-pixbuf-native \
      gtk+3 \
      gsettings-desktop-schemas \
      libpeas \
      libsoup \
      gspell \
 -    gtksourceview4 \
      tepl \
  "

 -inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-=
doc vala gettext features_check mime-xdg python3targetconfig
 +inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-=
doc vala gettext features_check mime-xdg gtk-icon-cache python3targetconfig

  def gnome_verdir(v):
      return oe.utils.trim_version(v, 1)

 -SRC_URI[archive.sha256sum] =3D "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f09=
f0391800041c9e56893ec11"
 +SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016b=
1e17e869caf5bfb94c6aa4e"

  # gobject-introspection is mandatory and cannot be configured
  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"

 +do_install:prepend() {
 +    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/pl=
ugins/filebrowser/gedit-file-browser-enum-types.c
 +}
 +
  GIR_MESON_OPTION =3D ""

  GTKDOC_MESON_OPTION =3D "gtk_doc"
 diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta-=
gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
 new file mode 100644
 index 000000000..8067407e4
 --- /dev/null
 +++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
 @@ -0,0 +1,17 @@
 +SUMMARY =3D "libgedit-amtk - Actions, Menus and Toolbars Kit for GTK appl=
ications"
 +SECTION =3D "gnome"
 +LICENSE =3D "LGPL-3.0-or-later"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSES;md5=3D75859989545e37968a=
99b631ef42722e" "=3D"">file://LICENSES;md5=3D75859989545e37968a99b631ef4272=
2e"</a>
 +
 +DEPENDS =3D "glib-2.0 gtk+3"
 +
 +inherit meson pkgconfig gobject-introspection gtk-doc
 +
 +SRC_URI =3D "git://github.com/gedit-technology/libgedit-amtk.git;protocol=
=3Dhttps;branch=3Dmain"
 +S =3D "${WORKDIR}/git"
 +SRCREV =3D "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
 +
 +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 +
 +GIR_MESON_OPTION =3D "gobject_introspection"
 +GTKDOC_MESON_OPTION =3D "gtk_doc"
 diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4=
.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
 new file mode 100644
 index 000000000..3f7ac9623
 --- /dev/null
 +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
 @@ -0,0 +1,19 @@
 +SUMMARY =3D "Gedit Technology - Source code editing widget"
 +SECTION =3D "gnome"
 +LICENSE =3D "LGPL-2.1-only"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Dfbc093901857fcd118f=
065f900982c24" "=3D"">file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24=
"</a>
 +
 +DEPENDS =3D "glib-2.0 gtk+3 libxml2"
 +
 +inherit meson pkgconfig gobject-introspection gtk-doc
 +
 +SRC_URI =3D "git://github.com/gedit-technology/libgedit-gtksourceview.git=
;protocol=3Dhttps;branch=3Dmain"
 +S =3D "${WORKDIR}/git"
 +SRCREV =3D "7062264d635f6efe04d88217a893a97ff385b873"
 +
 +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 +
 +GIR_MESON_OPTION =3D "gobject_introspection"
 +GTKDOC_MESON_OPTION =3D "gtk_doc"
 +
 +FILES:${PN} +=3D "${datadir}"
 --
 2.42.0


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#105102): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105102">https://lists.openembedded.org/g/openembed=
ded-devel/message/105102</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101541175/361=
8223">https://lists.openembedded.org/mt/101541175/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-/D3kC+jnHwbBrKfhLdDd--


