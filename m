Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D7EC47077
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 06:42:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.11224.1704609778719607541
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jan 2024 22:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PakCjJZ4;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cca5d81826so9913161fa.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 22:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704609776; x=1705214576; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vSjZkCxS+AfRQrLKIJvHNmiGzD4moTSnVXnV+iOkuXw=;
        b=PakCjJZ4y3mt08OrqMmoja0rIHA8fEG1M+98F8UHJkvZMTPQE/zjmjLSjWoQCMdRKd
         dwsk0tSLG1bW+q1K+c7ZrBwdEWAuCCp9VbR9X5U+iKfS78oLFfb99QvAJwdNe1aw9fOj
         RlW3m+aWiVMwdtbPSIu5wXhjZ88qQRjCv3SNWr0pOXqs30d90qJjeRCo0NKoNGWai54M
         xPIInSVt1znyXPloAppledqqCWVc4ZgVdPyYhkUuNeZSO2hMNIhvamETuafutZdqXEvO
         0yPBW23vWfzspnY9Fn4Y5gltks3nXVwnOOqKiGE0+DAmGdta87lDXjAXDyV2XH5h3kS1
         RmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704609776; x=1705214576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSjZkCxS+AfRQrLKIJvHNmiGzD4moTSnVXnV+iOkuXw=;
        b=rjwnm7jLk5Qi150+fOfCmgKVC/vgdCfYTKHb2bjGwXNqCgaegIzXAVGpxNeLIDyVP5
         lxjLUPpUljsmst7b7sahOStB6uaChvSJvaAx+MmXt/zNthEX/kVQk1AZshv8EsFStnY1
         uhSy+a5VIZC4cGuWcWDgy6Vvsz2LmTec8nPPsMlNEpYYVsCzBhnI/iPNZt2QagbdgK4J
         okEvjIF00r/N3om+g/9WOGgHrNNTKIChN7pNxKYqJvV3C5xv7n4hYd74RHBC5exQFJRt
         Gj6i2CcELYfhyOUyMJ1dWiJf0I6mSaZdXR39aUE4a6aXWbarCeCMSeJ0OHFItidacSwO
         yAxQ==
X-Gm-Message-State: AOJu0YxY/5V2Ys5NIZA9vtSzF0FJk6ol265ktZiIHQH9u1HK2QJqwDF7
	lrZOi664KugfaEfwA9xYrBLtENUjHu4Nl5O8wW0=
X-Google-Smtp-Source: AGHT+IFHIKhhQMF9ysrE4BTVqqFab1TjSf/b9cJ9/EoDCnwy7vHdiTYvBoSVpKyh3vKwIkFu4WEA6CtK57+n34M43eE=
X-Received: by 2002:a05:6512:39d0:b0:50e:6b45:c915 with SMTP id
 k16-20020a05651239d000b0050e6b45c915mr857488lfu.7.1704609776122; Sat, 06 Jan
 2024 22:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20240106223305.337182-1-f_l_k@t-online.de>
In-Reply-To: <20240106223305.337182-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 7 Jan 2024 07:42:45 +0100
Message-ID: <CANNYZj-Eg0wmLYt_32Z_S4UiCFUeEc9b_7EZ3FHCJrph02WnxQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-terminal: fix search_provider build
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002fc0ed060e556400"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 06:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108068

--0000000000002fc0ed060e556400
Content-Type: text/plain; charset="UTF-8"

Upstream-status is missing.

Alex

On Sat 6. Jan 2024 at 23.33, Markus Volk <f_l_k@t-online.de> wrote:

> currently org.gnome.ShellSearchProvider2.xml is read from host machine and
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
>  ...-add-option-to-set-dbus_interfacedir.patch | 45 +++++++++++++++++++
>  .../gnome-terminal/gnome-terminal_3.50.1.bb   | 10 +++--
>  2 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
> new file mode 100644
> index 000000000..86f6d6f01
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
> @@ -0,0 +1,45 @@
> +From 0ca761ee244a649c7420f15407439928addf6737 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sat, 6 Jan 2024 23:05:25 +0100
> +Subject: [PATCH] meson: add option to set dbus_interfacedir
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson_options.txt | 7 +++++++
> + src/meson.build   | 2 +-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +index b555ab663..aea66a3dd 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -13,6 +13,13 @@
> + # You should have received a copy of the GNU General Public License
> + # along with this programme.  If not, see <https://www.gnu.org/licenses/
> >.
> +
> ++option(
> ++  'dbus_interfacedir',
> ++  type: 'string',
> ++  value: '',
> ++  description: 'Set searchprovider interface dir',
> ++)
> ++
> + option(
> +   'dbg',
> +   type: 'boolean',
> +diff --git a/src/meson.build b/src/meson.build
> +index 86e287403..cb707a85d 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -231,7 +231,7 @@ if get_option('search_provider')
> +
> +   server_sources += gnome.gdbus_codegen(
> +     'terminal-search-provider-gdbus-generated',
> +-    gt_prefix / gt_dbusinterfacedir /
> 'org.gnome.ShellSearchProvider2.xml',
> ++    get_option('dbus_interfacedir') /
> 'org.gnome.ShellSearchProvider2.xml',
> +     autocleanup: 'none',
> +     install_header: false,
> +     interface_prefix: 'org.gnome.Shell',
> +--
> +2.43.0
> +
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/
> gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/
> gnome-terminal_3.50.1.bb
> index 8616f2c9b..6fd816c8c 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> @@ -19,15 +19,17 @@ DEPENDS = " \
>      libpcre2 \
>  "
>
> -SRC_URI = "git://
> gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=https;nobranch=1 \
> -           file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
> -           "
> +SRC_URI = " \
> +       git://
> gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=https;nobranch=1 \
> +       file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
> +       file://0001-meson-add-option-to-set-dbus_interfacedir.patch \
> +"
>  SRCREV = "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
>  S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[nautilus] =
> "-Dnautilus_extension=true,-Dnautilus_extension=false,nautilus,nautilus"
> -PACKAGECONFIG[search_provider] =
> "-Dsearch_provider=true,-Dsearch_provider=false,,gnome-shell"
> +PACKAGECONFIG[search_provider] = "-Dsearch_provider=true
> -Ddbus_interfacedir=${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=false,gnome-shell"
>
>  FILES:${PN} += " \
>      ${datadir} \
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108066):
> https://lists.openembedded.org/g/openembedded-devel/message/108066
> Mute This Topic: https://lists.openembedded.org/mt/103569702/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002fc0ed060e556400
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Upstream-status is missing.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat 6. Jan 2024 at 23.33, Markus Volk &lt=
;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">currently org.gnome.ShellSearchProvider2.xml is read =
from host machine and<br>
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
=C2=A0...-add-option-to-set-dbus_interfacedir.patch | 45 ++++++++++++++++++=
+<br>
=C2=A0.../gnome-terminal/<a href=3D"http://gnome-terminal_3.50.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gnome-terminal_3.50.1.bb</a>=C2=A0 =C2=A0| 1=
0 +++--<br>
=C2=A02 files changed, 51 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-term=
inal/0001-meson-add-option-to-set-dbus_interfacedir.patch<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-me=
son-add-option-to-set-dbus_interfacedir.patch b/meta-gnome/recipes-gnome/gn=
ome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.=
patch<br>
new file mode 100644<br>
index 000000000..86f6d6f01<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add=
-option-to-set-dbus_interfacedir.patch<br>
@@ -0,0 +1,45 @@<br>
+From 0ca761ee244a649c7420f15407439928addf6737 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Sat, 6 Jan 2024 23:05:25 +0100<br>
+Subject: [PATCH] meson: add option to set dbus_interfacedir<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+---<br>
+ meson_options.txt | 7 +++++++<br>
+ src/meson.build=C2=A0 =C2=A0| 2 +-<br>
+ 2 files changed, 8 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson_options.txt b/meson_options.txt<br>
+index b555ab663..aea66a3dd 100644<br>
+--- a/meson_options.txt<br>
++++ b/meson_options.txt<br>
+@@ -13,6 +13,13 @@<br>
+ # You should have received a copy of the GNU General Public License<br>
+ # along with this programme.=C2=A0 If not, see &lt;<a href=3D"https://www=
.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.or=
g/licenses/</a>&gt;.<br>
+ <br>
++option(<br>
++=C2=A0 &#39;dbus_interfacedir&#39;,<br>
++=C2=A0 type: &#39;string&#39;,<br>
++=C2=A0 value: &#39;&#39;,<br>
++=C2=A0 description: &#39;Set searchprovider interface dir&#39;,<br>
++)<br>
++<br>
+ option(<br>
+=C2=A0 =C2=A0&#39;dbg&#39;,<br>
+=C2=A0 =C2=A0type: &#39;boolean&#39;,<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index 86e287403..cb707a85d 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -231,7 +231,7 @@ if get_option(&#39;search_provider&#39;)<br>
+ <br>
+=C2=A0 =C2=A0server_sources +=3D gnome.gdbus_codegen(<br>
+=C2=A0 =C2=A0 =C2=A0&#39;terminal-search-provider-gdbus-generated&#39;,<br=
>
+-=C2=A0 =C2=A0 gt_prefix / gt_dbusinterfacedir / &#39;org.gnome.ShellSearc=
hProvider2.xml&#39;,<br>
++=C2=A0 =C2=A0 get_option(&#39;dbus_interfacedir&#39;) / &#39;org.gnome.Sh=
ellSearchProvider2.xml&#39;,<br>
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
index 8616f2c9b..6fd816c8c 100644<br>
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
nterfacedir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfals=
e,gnome-shell&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir} \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108066): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108066" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108066</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103569702/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103569702/1686489</a><br>
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

--0000000000002fc0ed060e556400--

