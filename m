Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440BBC47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 10:52:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.13171.1704624742998084236
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 02:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oo4IGmzY;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50ea98440a7so819779e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 02:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704624741; x=1705229541; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z4/Pb6mp9i75GACKoD5d/bTHQwSNaPzlN/+xuJiHsMY=;
        b=Oo4IGmzY88/GBRSCbh6mzPVx5YETqooGidda/mQO8kl9GP1zvzxg8BJtfmzWxt5fD3
         aJ8jiE6VWev+oDTB1ZA5yL4jbXTcm273SxOxo+mPdsuNoNKEbvEGwOskHEUmAmhjsTf6
         0xK7uybaAaYwbZgHGCj+00WpZTEglS7H4SzTnCSf1ewMimSPWqkfwcVMATIu9H0CW+yU
         Fn0OtC6HUSYH0hxAokWqDocaIa0YmD4D+vbAUGaGkKdofMSt8N5H6BT5LyBvlRcb7+bX
         dGuFvLghGQ4cuEylbZ9XvmERVwrDCckrOkRso2n7nRhF/nFksimJFQTGrHBmQnVrTu3/
         N8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704624741; x=1705229541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4/Pb6mp9i75GACKoD5d/bTHQwSNaPzlN/+xuJiHsMY=;
        b=un1y+y1+kL+i21dTA5IDUkF9ZZxOXzpLFFzDs30ezvM+ZfUgFv4PpXA9tnVnxQNshC
         JauyRlkxucJuCiSsl/A1mLYX59bK2PXa5/sxBHFgBVkzgFkEjCxUgTCzniC5Y8oaZFZn
         oTxoTnpyA3tjekDyvYtWtGuw0iXHUrDpSNnxdA9sNNn578GT7Tch6KitKNJXvqKkZocn
         ejeyFqLVh+97UaFovDB48gjx+NOX3KPi33Gz6Cy9y30zVgL4FFioJzyY6SgZUJdWhDIX
         3iq2synUjUIDkV0pRo2zUTLqLGm/PXYRabYWpuZhTOTYqRRX7O4tTKdUSxUw35MFvKA+
         AfVw==
X-Gm-Message-State: AOJu0YyXvZAFpgG0a5OmkSVxra9WJRzyxigWyQ6qUI7RwWWcZ40O0VoR
	5kXqEnKtXA4Qd3UHBu0H7b6wUWIkWdk2GnCbuzk=
X-Google-Smtp-Source: AGHT+IHkz1kUm+ggoDzGdbVE3Lo+4+CrMg6u+MTjS/ZPRDqt2dpCCqXh2TIzm8rqVMu3mZnRXHZTHc8afgXboi8HgrQ=
X-Received: by 2002:ac2:5f73:0:b0:50e:7d4f:a31a with SMTP id
 c19-20020ac25f73000000b0050e7d4fa31amr495578lfc.53.1704624740747; Sun, 07 Jan
 2024 02:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20240107102723.47876-1-f_l_k@t-online.de>
In-Reply-To: <20240107102723.47876-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 7 Jan 2024 11:52:09 +0100
Message-ID: <CANNYZj9jG6FizQKCQRhXZJJa2aX0cD+s2NSjXTJxN3DkzDmidg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-terminal: fix search_provider build
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000025cc42060e58e09c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 10:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108071

--00000000000025cc42060e58e09c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pending is strongly discouraged and disliked. Please submit even if it=E2=
=80=99s
not perfect yet.

Alex

On Sun 7. Jan 2024 at 11.27, Markus Volk <f_l_k@t-online.de> wrote:

> currently org.gnome.ShellSearchProvider2.xml is read from host machine an=
d
> thus gnome-terminal with search_provider enabled can only be build from a
> host
> system that has gnome-shell installed.
>
> Add an option and set it to STAGING_DATADIR to avoid:
>
> | DEBUG: Executing shell function do_compile
> | ninja: error:
> '/usr/share/dbus-1/interfaces/org.gnome.ShellSearchProvider2.xml', needed
> by 'src/terminal-search-provider-gdbus-generated.c', missing and no known
> rule to make it
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-add-option-to-set-dbus_interfacedir.patch | 66 +++++++++++++++++++
>  .../gnome-terminal/gnome-terminal_3.50.1.bb   | 10 +--
>  2 files changed, 72 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-opt=
ion-to-set-dbus_interfacedir.patch
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-o=
ption-to-set-dbus_interfacedir.patch
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-o=
ption-to-set-dbus_interfacedir.patch
> new file mode 100644
> index 000000000..b9d5fd5ec
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-o=
ption-to-set-dbus_interfacedir.patch
> @@ -0,0 +1,66 @@
> +From 5212e85699b59819262165740d3c7a10b6a5c46b Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sun, 7 Jan 2024 10:40:31 +0100
> +Subject: [PATCH] meson: add an option to set dbus_interface_dir
> +
> +currently org.gnome.ShellSearchProvider2.xml is read from host machine a=
nd
> +thus gnome-terminal with search_provider enabled can only be built from =
a
> host
> +system that has gnome-shell installed.
> +
> +Add an option that allows to set the path manually. This will help to
> cross-compile
> +gnome-terminal on host systems that don't have gnome-shell installed.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson_options.txt | 7 +++++++
> + src/meson.build   | 7 ++++++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +index b555ab663..8fece058c 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -13,6 +13,13 @@
> + # You should have received a copy of the GNU General Public License
> + # along with this programme.  If not, see <https://www.gnu.org/licenses=
/
> >.
> +
> ++option(
> ++  'dbus_interface_dir',
> ++  type: 'string',
> ++  value: '',
> ++  description: 'directory for D-Bus session interface files
> [$datadir/dbus-1/interfaces]',
> ++)
> ++
> + option(
> +   'dbg',
> +   type: 'boolean',
> +diff --git a/src/meson.build b/src/meson.build
> +index 86e287403..1543572cf 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -224,6 +224,11 @@ server_sources =3D app_sources + client_util_source=
s +
> debug_sources + dbus_source
> +
> + if get_option('search_provider')
> +
> ++  dbus_interface_dir =3D get_option('dbus_interface_dir')
> ++  if dbus_interface_dir =3D=3D ''
> ++    dbus_interface_dir =3D gt_prefix / gt_dbusinterfacedir
> ++  endif
> ++
> +   server_sources +=3D files(
> +     'terminal-search-provider.cc',
> +     'terminal-search-provider.hh',
> +@@ -231,7 +236,7 @@ if get_option('search_provider')
> +
> +   server_sources +=3D gnome.gdbus_codegen(
> +     'terminal-search-provider-gdbus-generated',
> +-    gt_prefix / gt_dbusinterfacedir /
> 'org.gnome.ShellSearchProvider2.xml',
> ++    dbus_interface_dir / 'org.gnome.ShellSearchProvider2.xml',
> +     autocleanup: 'none',
> +     install_header: false,
> +     interface_prefix: 'org.gnome.Shell',
> +--
> +2.43.0
> +
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/
> gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/
> gnome-terminal_3.50.1.bb
> index 8616f2c9b..53f11e95f 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> @@ -19,15 +19,17 @@ DEPENDS =3D " \
>      libpcre2 \
>  "
>
> -SRC_URI =3D "git://
> gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobranch=3D1 \
> -           file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch =
\
> -           "
> +SRC_URI =3D " \
> +       git://
> gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobranch=3D1 \
> +       file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
> +       file://0001-meson-add-option-to-set-dbus_interfacedir.patch \
> +"
>  SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[nautilus] =3D
> "-Dnautilus_extension=3Dtrue,-Dnautilus_extension=3Dfalse,nautilus,nautil=
us"
> -PACKAGECONFIG[search_provider] =3D
> "-Dsearch_provider=3Dtrue,-Dsearch_provider=3Dfalse,,gnome-shell"
> +PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue
> -Ddbus_interface_dir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_prov=
ider=3Dfalse,gnome-shell"
>
>  FILES:${PN} +=3D " \
>      ${datadir} \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108069):
> https://lists.openembedded.org/g/openembedded-devel/message/108069
> Mute This Topic: https://lists.openembedded.org/mt/103575871/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000025cc42060e58e09c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Pending is strongly discouraged and disliked. Please subm=
it even if it=E2=80=99s not perfect yet.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun 7. Jan 2024 at 11.27, Markus Volk &lt;<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">currently org.gnome.ShellSearchProvider2.xml is read from =
host machine and<br>
thus gnome-terminal with search_provider enabled can only be build from a h=
ost<br>
system that has gnome-shell installed.<br>
<br>
Add an option and set it to STAGING_DATADIR to avoid:<br>
<br>
| DEBUG: Executing shell function do_compile<br>
| ninja: error: &#39;/usr/share/dbus-1/interfaces/org.gnome.ShellSearchProv=
ider2.xml&#39;, needed by &#39;src/terminal-search-provider-gdbus-generated=
.c&#39;, missing and no known rule to make it<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...-add-option-to-set-dbus_interfacedir.patch | 66 ++++++++++++++++++=
+<br>
=C2=A0.../gnome-terminal/<a href=3D"http://gnome-terminal_3.50.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gnome-terminal_3.50.1.bb</a>=C2=A0 =C2=A0| 1=
0 +--<br>
=C2=A02 files changed, 72 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-term=
inal/0001-meson-add-option-to-set-dbus_interfacedir.patch<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-me=
son-add-option-to-set-dbus_interfacedir.patch b/meta-gnome/recipes-gnome/gn=
ome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.=
patch<br>
new file mode 100644<br>
index 000000000..b9d5fd5ec<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add=
-option-to-set-dbus_interfacedir.patch<br>
@@ -0,0 +1,66 @@<br>
+From 5212e85699b59819262165740d3c7a10b6a5c46b Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Sun, 7 Jan 2024 10:40:31 +0100<br>
+Subject: [PATCH] meson: add an option to set dbus_interface_dir<br>
+<br>
+currently org.gnome.ShellSearchProvider2.xml is read from host machine and=
<br>
+thus gnome-terminal with search_provider enabled can only be built from a =
host<br>
+system that has gnome-shell installed.<br>
+<br>
+Add an option that allows to set the path manually. This will help to cros=
s-compile<br>
+gnome-terminal on host systems that don&#39;t have gnome-shell installed.<=
br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+---<br>
+ meson_options.txt | 7 +++++++<br>
+ src/meson.build=C2=A0 =C2=A0| 7 ++++++-<br>
+ 2 files changed, 13 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson_options.txt b/meson_options.txt<br>
+index b555ab663..8fece058c 100644<br>
+--- a/meson_options.txt<br>
++++ b/meson_options.txt<br>
+@@ -13,6 +13,13 @@<br>
+ # You should have received a copy of the GNU General Public License<br>
+ # along with this programme.=C2=A0 If not, see &lt;<a href=3D"https://www=
.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.or=
g/licenses/</a>&gt;.<br>
+ <br>
++option(<br>
++=C2=A0 &#39;dbus_interface_dir&#39;,<br>
++=C2=A0 type: &#39;string&#39;,<br>
++=C2=A0 value: &#39;&#39;,<br>
++=C2=A0 description: &#39;directory for D-Bus session interface files [$da=
tadir/dbus-1/interfaces]&#39;,<br>
++)<br>
++<br>
+ option(<br>
+=C2=A0 =C2=A0&#39;dbg&#39;,<br>
+=C2=A0 =C2=A0type: &#39;boolean&#39;,<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index 86e287403..1543572cf 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -224,6 +224,11 @@ server_sources =3D app_sources + client_util_sources =
+ debug_sources + dbus_source<br>
+ <br>
+ if get_option(&#39;search_provider&#39;)<br>
+ <br>
++=C2=A0 dbus_interface_dir =3D get_option(&#39;dbus_interface_dir&#39;)<br=
>
++=C2=A0 if dbus_interface_dir =3D=3D &#39;&#39;<br>
++=C2=A0 =C2=A0 dbus_interface_dir =3D gt_prefix / gt_dbusinterfacedir<br>
++=C2=A0 endif<br>
++<br>
+=C2=A0 =C2=A0server_sources +=3D files(<br>
+=C2=A0 =C2=A0 =C2=A0&#39;terminal-search-provider.cc&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;terminal-search-provider.hh&#39;,<br>
+@@ -231,7 +236,7 @@ if get_option(&#39;search_provider&#39;)<br>
+ <br>
+=C2=A0 =C2=A0server_sources +=3D gnome.gdbus_codegen(<br>
+=C2=A0 =C2=A0 =C2=A0&#39;terminal-search-provider-gdbus-generated&#39;,<br=
>
+-=C2=A0 =C2=A0 gt_prefix / gt_dbusinterfacedir / &#39;org.gnome.ShellSearc=
hProvider2.xml&#39;,<br>
++=C2=A0 =C2=A0 dbus_interface_dir / &#39;org.gnome.ShellSearchProvider2.xm=
l&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0autocleanup: &#39;none&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0install_header: false,<br>
+=C2=A0 =C2=A0 =C2=A0interface_prefix: &#39;org.gnome.Shell&#39;,<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/<a href=3D"http://gnom=
e-terminal_3.50.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-terminal_3=
.50.1.bb</a> b/meta-gnome/recipes-gnome/gnome-terminal/<a href=3D"http://gn=
ome-terminal_3.50.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-terminal=
_3.50.1.bb</a><br>
index 8616f2c9b..53f11e95f 100644<br>
--- a/meta-gnome/recipes-gnome/gnome-terminal/<a href=3D"http://gnome-termi=
nal_3.50.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-terminal_3.50.1.b=
b</a><br>
+++ b/meta-gnome/recipes-gnome/gnome-terminal/<a href=3D"http://gnome-termi=
nal_3.50.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-terminal_3.50.1.b=
b</a><br>
@@ -19,15 +19,17 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libpcre2 \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://gitlab.gnome.org/GNOME/gnome-ter=
minal.git;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blan=
k">gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobranch=3D1<=
/a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-W_EXITCODE-macro-=
for-non-glibc-systems.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gitlab.gnome.org/GNOME/=
gnome-terminal.git;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=
=3D"_blank">gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobr=
anch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-W_EXITCODE-macro-for-non-glibc-=
systems.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-add-option-to-set-dbus_interf=
acedir.patch \<br>
+&quot;<br>
=C2=A0SRCREV =3D &quot;5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[nautilus] =3D &quot;-Dnautilus_extension=3Dtrue,-Dnauti=
lus_extension=3Dfalse,nautilus,nautilus&quot;<br>
-PACKAGECONFIG[search_provider] =3D &quot;-Dsearch_provider=3Dtrue,-Dsearch=
_provider=3Dfalse,,gnome-shell&quot;<br>
+PACKAGECONFIG[search_provider] =3D &quot;-Dsearch_provider=3Dtrue -Ddbus_i=
nterface_dir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfal=
se,gnome-shell&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir} \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108069): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108069" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108069</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103575871/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103575871/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000025cc42060e58e09c--

