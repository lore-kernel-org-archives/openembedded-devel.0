Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB25C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:39:30 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web08.12772.1641929969098493894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cz9uQ7Ru;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id v12so559434uar.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N5pjnH6x8AdfmO6umaE3dD7DsmFHgDMop9HXA0fTkWs=;
        b=cz9uQ7RuGFb4jXHxyPfqT+9Kiv3oCijuN2vXC7BW/FPMtpzsLpSpRB2P2H8FIoHvHJ
         dhbdhFegg1ynVGfUBsW89G558MN6u/MxW1ad5KQirYfE/7pHX31xTbatSxu/MyLQoOw4
         h9gPvQ0Fm6v3C5wCh7+GD1FHiIg8UKJrbIxZod0CD7NaQ1eT4/hxNzPY1QbHOzgrmgw6
         lknEQxGJx/swphMWTm5XFe7LNh09umGCL4RQ17sqItD4eYvxaT/GB9wzbnS6L0Wp1Vuy
         yx5myg8fhs6HWk+nKTJfsXxNMBFqCzvz+Kz9Bhibu5/ZCMlJmaepD33aVGZzH2qsxdGm
         Nd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N5pjnH6x8AdfmO6umaE3dD7DsmFHgDMop9HXA0fTkWs=;
        b=QOxJlOwt5xoYp08XDM1RtqlHUIkwaUes7IikQpUf73oWN38wcn+lkSP9IkiQXm43VS
         94Y8OCWuFNgj+7RRrF7yfA0gvSkfWE5poUfWHNfoO5UWG6Ax7O7S6WuexAU6ukWDaIg/
         4vdlyfR2RDuHVd4jYg98CxTxMG4MQg8qK3lH5ib5JyMLMVcesh85qnyCqpTycHooG/qj
         +7nvbkqa/dZTJrtgWXi5uiWw1UFpI160Q0Ps2zm1iBYOxyY4MgKBO1rcccRkucCf+d5E
         ZEu9O0Sx2ObCExuwY+wgPixTVMJzrTVhfQtOaWNC5mEW/fS65WogU+smgGHaJtTznfCH
         uSew==
X-Gm-Message-State: AOAM532d3uxoy3IgihKtpfZC9LlE0vFRprjNiaUmtGhQf80n3Wdr8CXu
	Rtd/aAcVylHjYdLiKxXRMoygkeyWBmamAtABvpf6UhWb
X-Google-Smtp-Source: 
 ABdhPJwperkEK/8IZrEkL0lNTBHe4PKgbhvc/kGDz7Bw8Tfk7BKNKI0Ewin+FFdBL9hfNF6igFvCk11V/wCTtYBqBy4=
X-Received: by 2002:ab0:22c5:: with SMTP id z5mr2884592uam.100.1641929968300;
 Tue, 11 Jan 2022 11:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20220111193807.1482752-1-raj.khem@gmail.com>
In-Reply-To: <20220111193807.1482752-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jan 2022 20:39:17 +0100
Message-ID: 
 <CANNYZj8jwSmDuiYjyETg3r70YTNphNvY0qjK_0YMEBaqeBQVFg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] nautilus: Fix build with libportal >=
 0.5
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000081b74b05d5539c12"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 19:39:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94756

--00000000000081b74b05d5539c12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You really should make this optional Khem, there's no reason to build with
it by default.

Alex

On Tue, 11 Jan 2022 at 20:38, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../nautilus/nautilus/liportal-0.5-fix.patch  | 28 +++++++++++++++++++
>  .../recipes-gnome/nautilus/nautilus_41.1.bb   |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644
> meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
>
> diff --git
> a/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
> b/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
> new file mode 100644
> index 0000000000..708595a7f1
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
> @@ -0,0 +1,28 @@
> +Fix an issue building Nautilus with libportal-0.5+
> +where expected header is moved to different directory
> +in staging sysroot
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -123,7 +123,7 @@ gtk =3D dependency('gtk+-3.0', version: '>
> + libhandy =3D dependency('libhandy-1', version: '>=3D 1.1.90')
> + libportal =3D []
> + if get_option('libportal')
> +-  libportal =3D dependency('libportal', version: '>=3D 0.3')
> ++  libportal =3D dependency('libportal-gtk3', version: '>=3D 0.3')
> + endif
> + selinux =3D []
> + if get_option('selinux')
> +--- a/src/nautilus-files-view.c
> ++++ b/src/nautilus-files-view.c
> +@@ -92,7 +92,7 @@
> +
> + #ifdef HAVE_LIBPORTAL
> + #include <libportal/portal.h>
> +-#include <libportal/portal-gtk3.h>
> ++#include <libportal-gtk3/portal-gtk3.h>
> + #endif
> +
> + /* Minimum starting update inverval */
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb
> b/meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb
> index c64d49b0ba..330c361806 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb
> @@ -22,6 +22,7 @@ inherit gnomebase gsettings gobject-introspection
> gtk-doc gettext features_check
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>
> +SRC_URI +=3D "file://liportal-0.5-fix.patch"
>  SRC_URI[archive.sha256sum] =3D
> "3e633098853711a3e96b12fe9228b3201816e554b2823f161e7d901a8880582f"
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94755):
> https://lists.openembedded.org/g/openembedded-devel/message/94755
> Mute This Topic: https://lists.openembedded.org/mt/88357284/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000081b74b05d5539c12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You really should make this optional Khem, there&#39;=
s no reason to build with it by default.</div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 11 Jan 2022 at 20:38, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_=
blank">alex@linutronix.de</a>&gt;<br>
Cc: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com" targ=
et=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../nautilus/nautilus/liportal-0.5-fix.patch=C2=A0 | 28 +++++++++++++=
++++++<br>
=C2=A0.../recipes-gnome/nautilus/<a href=3D"http://nautilus_41.1.bb" rel=3D=
"noreferrer" target=3D"_blank">nautilus_41.1.bb</a>=C2=A0 =C2=A0|=C2=A0 1 +=
<br>
=C2=A02 files changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/liporta=
l-0.5-fix.patch<br>
<br>
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.pa=
tch b/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch<br>
new file mode 100644<br>
index 0000000000..708595a7f1<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch<br>
@@ -0,0 +1,28 @@<br>
+Fix an issue building Nautilus with libportal-0.5+<br>
+where expected header is moved to different directory<br>
+in staging sysroot<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -123,7 +123,7 @@ gtk =3D dependency(&#39;gtk+-3.0&#39;, version: &#39;&=
gt;<br>
+ libhandy =3D dependency(&#39;libhandy-1&#39;, version: &#39;&gt;=3D 1.1.9=
0&#39;)<br>
+ libportal =3D []<br>
+ if get_option(&#39;libportal&#39;)<br>
+-=C2=A0 libportal =3D dependency(&#39;libportal&#39;, version: &#39;&gt;=
=3D 0.3&#39;)<br>
++=C2=A0 libportal =3D dependency(&#39;libportal-gtk3&#39;, version: &#39;&=
gt;=3D 0.3&#39;)<br>
+ endif<br>
+ selinux =3D []<br>
+ if get_option(&#39;selinux&#39;)<br>
+--- a/src/nautilus-files-view.c<br>
++++ b/src/nautilus-files-view.c<br>
+@@ -92,7 +92,7 @@<br>
+ <br>
+ #ifdef HAVE_LIBPORTAL<br>
+ #include &lt;libportal/portal.h&gt;<br>
+-#include &lt;libportal/portal-gtk3.h&gt;<br>
++#include &lt;libportal-gtk3/portal-gtk3.h&gt;<br>
+ #endif<br>
+ <br>
+ /* Minimum starting update inverval */<br>
diff --git a/meta-gnome/recipes-gnome/nautilus/<a href=3D"http://nautilus_4=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">nautilus_41.1.bb</a> b/meta-gn=
ome/recipes-gnome/nautilus/<a href=3D"http://nautilus_41.1.bb" rel=3D"noref=
errer" target=3D"_blank">nautilus_41.1.bb</a><br>
index c64d49b0ba..330c361806 100644<br>
--- a/meta-gnome/recipes-gnome/nautilus/<a href=3D"http://nautilus_41.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">nautilus_41.1.bb</a><br>
+++ b/meta-gnome/recipes-gnome/nautilus/<a href=3D"http://nautilus_41.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">nautilus_41.1.bb</a><br>
@@ -22,6 +22,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc=
 gettext features_check<br>
=C2=A0def gnome_verdir(v):<br>
=C2=A0 =C2=A0 =C2=A0return oe.utils.trim_version(v, 1)<br>
<br>
+SRC_URI +=3D &quot;file://liportal-0.5-fix.patch&quot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;3e633098853711a3e96b12fe9228b320=
1816e554b2823f161e7d901a8880582f&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94755): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94755" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94755</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88357284/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88357284/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000081b74b05d5539c12--

