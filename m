Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1660.1794503800637168826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 09:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Em/GYEM7;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d427836e9so600734666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 09:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794503799; cv=none;
        d=google.com; s=arc-20260327;
        b=EAzI0inLcpT9jVpHrfeJVtnpkn5rKLTpT4ZclcpOkqgKuKfg32mQxrxFxZ4aXNvMKw
         8E2nKwWcyGqyvXVxiynoZ13Kym0jBfvg/JqYdChhqQV3hQjsgxusT5bHm4539vYHJaBU
         qynh9Uw882Ne5QIc2HqXoausfVzA4yLOpYSUX/UCu0gGFD2T/vuoXcaB/erAtot2qaxU
         qJXUX97o/nVYuOLFmix7ag33BOrv+lm7jsnGQTB3QixDQ+T4inYEI0NdRfnCeqLtaaQR
         t/t6Xf9XCP6DCSnmfiki4YKu3+Kd2x2Jn6VAY13cDoNnTN4TQ7UUTYXgMuCbpcqqsU2b
         y8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3OL/RgawpIpY7R/YNY+yIqfv795o+UJTCXwMYq9k0R8=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=Myjm06mf7TTjsoM+h033rLYXFfURFp5w/0roOA3RYXM8ekkMEEqbghQ6c8puZ4xORe
         GNEJlDU8CRIxNsVzR/hq+kNtAmyWDkyWcPZ15giVKtFBflv6XBjhNTzbfMfI04yhO2AJ
         9xIafB24vKes9pAVCc7G2dkcfgPNwW4lxZC20ZutPr9ANr5Vnb8wHxqncbpmmGh08NqH
         idV8v0Q6vvDo5dW4lwlDEIti81Q3okVM7QAEKW8fN52DXGsuODKBZfYafZKTKLg2GTsJ
         Jr33h+5gybdnQxQ3+AYwWFirOzocHdWrOT64lP3WL4+s8dif07Pyxq8ZMsRmeAXxEDRB
         qtKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794503799; x=1795108599; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OL/RgawpIpY7R/YNY+yIqfv795o+UJTCXwMYq9k0R8=;
        b=Em/GYEM7J+2/aEfRvH4cBzXccsxLfZFZi4WsBFEeNB1ywLGNUqXg9/Wg4ByeMHu0V5
         zg2FP4Yl4qfYdr3csxIA6t+EcMdnfCL6Mix746Cq4OVvhooVdg2buNcjsvh5PsnTvmHh
         b8HcXTfg7qgkVMn8S3lA9aVOGC2g4CZaIV5tlsvoeASCTgPtRg0d4E19nW24NHmgYycV
         IOs+iavUzA2jJ5WN1N+7sJIz5/DYDZLHNsWqwncVJzUstUsifXm4kAlri4/lExj6YFfh
         0Xq5l3IinUICldU1UGAXFAMTylb4w6BwNIqDtAqpO0ug95TizW7h7Y6J3/g2V4ji8V8A
         IEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503799; x=1795108599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3OL/RgawpIpY7R/YNY+yIqfv795o+UJTCXwMYq9k0R8=;
        b=bO2e955fVmCnc411e324N1BAtWdB1CmCN/kZx04UdCl21eQaFKRs0uxY781cD23vGe
         UemK9TBBnwSjK1020DxAlng2zUfcZUbj7/r5XCXmCS6sc5iex5vR3uGHVTiJASOmXlCp
         F7dzY+JMpcVD7E5XfpFBTa4lZGeBH5nDmnp3HRzJhcI0yNEX+lcGtsX38WD5cXsTHWC2
         XaJUmVfWXjttSzyTXT4nvmeTDujJ6TSXm5tWBYkmyWdmY6IHCDIpjrjy713/WAt0BtJO
         2UV5D7TopOuqVoSMn8zqMeB4pjCnrRZ0oODGIBAFwDwnVH7vnN2hf/aKJvc4NzcEOc5W
         Ylgg==
X-Gm-Message-State: APuU4Z+ng68KrGJeuWUfmQhP4u6ku4X36k8k4Uqpu7ybluQJAAzo3Icz
	REttnbrc31C8THJ2cd0E6vv/FIaUpt0LXbYwJ32MYnLf1YdrU3whVfR1KPynvOfY9zssmR2K33n
	to8/oC1A+hRSZruKxI9zi1dwHspfgjAY=
X-Gm-Gg: AYBFou1CQNySXhKwpVq0OZ6XZNs4iso/miyqVrCFcbTNKgKU0JKPkzwkMcEBN73qZDI
	8I1JJ42aRbpTOX6lPSyApAXKIxJV0nIrpgFufuT01m8P5Aq5swSUpdmi9H+K/pmIaWYehdeP7Lh
	ywJe9CFgIbu4HZHHGMN8KWu2cPOzn+vlAwTSQHK/4w2tq84+M5NQwFtk6u8doYnc7k44mjORQEO
	4w+kfTi/9JymuXZJ6uOZM+G89CNgSvOgihCQfmlyVVEKAmgTIiDFErEKy2/Aeh2X0U1dCeJyQL2
	aV38sBQlka65ljDEljA9TEictOwIt04RV/zvxqDsBK5qLP115neL6kq/SVamhIAscug6ZWMueAv
	vBsV/ZiaK5E+95QNKAytj1bLPazh6aFK3chSdTHkOKy0sEyatz39hEmk8yu44GrZ3HlvmEEYxBG
	JkuiCsQizs0fXXwU7/5NfXhS39tEGEFaKzisM4+fBVcU98XkJseXYbymJzv9rY7jNsKm18sCsKl
	jgUzRanOTgZ+sbH6xn/2MueyXaBtSmmeEsSu8FJhnRfyoQYdAx9arT9Z2TJwd9gGBt5GPOrs9OG
	Uu7YRRLEQRgeHJIm+WDMU8aM/JFPI3TwVI+RN029F48QpkdIE9M9PkMl2OTOh+2piNZ4PyY5jLC
	qCeYgX5EVHRC5G7VDHGAqPw==
X-Received: by 2002:a17:907:6095:b0:c40:19dc:a24d with SMTP id
 a640c23a62f3a-c5066af4f36mr557350266b.9.1794503798582; Thu, 12 Nov 2026
 09:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20261112071348.4144113-1-ankur.tyagi85@gmail.com> <20261112071348.4144113-6-ankur.tyagi85@gmail.com>
In-Reply-To: <20261112071348.4144113-6-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Nov 2026 09:16:08 -0800
X-Gm-Features: AclHuK8fHPFbBPLsDItPLZSWuevWeRLXacag_YoYHIaNa0s1PuqGik31rQs-jdk
Message-ID: <CAMKF1spMZz7+F2jODDRxMtTuc8zakjgzwtUk49O_2iVaZaAOUg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 6/6] mpv: patch CVE-2026-123095
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007671f1066017795f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 17:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132211

--0000000000007671f1066017795f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is upgrade to 0.42 patch staged where this is already included. I
will drop this one.

On Wed, Nov 11, 2026 at 11:14=E2=80=AFPM Ankur Tyagi via openembedded-devel
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details:
> https://nvd.nist.gov/vuln/detail/cve-2026-123095
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../mplayer/mpv/CVE-2026-123095.patch         | 37 +++++++++++++++++++
>  .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644
> meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
> b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
> new file mode 100644
> index 0000000000..1efa0fdee6
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
> @@ -0,0 +1,37 @@
> +From 2c6599aa7d16efd29ae49865757eb449d9306742 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Kacper=3D20Michaj=3DC5=3D82ow?=3D <kasper93@gmail.com>
> +Date: Wed, 4 Nov 2026 20:28:57 +0100
> +Subject: [PATCH] ytdl_hook: reject playlist entry URLs with control
> characters
> +
> +The entries are joined into a memory:// M3U playlist, one URL per line.
> +A URL with a line break became several entries, and only the first line
> +went through url_is_safe(). The other lines were loaded with the origin
> +of the opened URL, so any protocol was allowed. Skip any URLs with
> +control characters.
> +
> +Fixes: e6e6b0dcc7
> +Fixes: GHSA-p99g-m25w-x8xv
> +(cherry picked from commit c3096515dcd26c14004f985538b5aa41db613856)
> +
> +CVE: CVE-2026-123095
> +Upstream-Status: Backport [
> https://github.com/mpv-player/mpv/commit/c3096515dcd26c14004f985538b5aa41=
db613856
> ]
> +
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + player/lua/ytdl_hook.lua | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/player/lua/ytdl_hook.lua b/player/lua/ytdl_hook.lua
> +index 65ef859595..2b0edb193a 100644
> +--- a/player/lua/ytdl_hook.lua
> ++++ b/player/lua/ytdl_hook.lua
> +@@ -1111,6 +1111,9 @@ local function run_ytdl_hook(url)
> +                 -- links without protocol as returned by --flat-playlis=
t
> +                 if not site then
> +                     msg.error("Playlist entry does not have unique URL,
> can't add it.")
> ++                elseif site:find("%c") then
> ++                    -- a line break would add entries to the playlist
> ++                    msg.error("Playlist entry URL contains control
> characters, can't add it.")
> +                 elseif not site:find("://") then
> +                     -- youtube extractor provides only IDs,
> +                     -- others come prefixed with the extractor name and
> ":"
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> index f37ae4ac50..0c99e354e7 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D " \
>      git://
> github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/${@oe.utils.trim_ve=
rsion('${PV}
> <http://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/$%7B@oe.uti=
ls.trim_version('$%7BPV%7D>',
> 2)};protocol=3Dhttps;tag=3Dv${PV} \
>
>  file://0001-opengl-context-require-swap_buffers-param-for-FenceS.patch \
>
>  file://0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.=
patch
> \
> +    file://CVE-2026-123095.patch \
>  "
>
>  inherit meson pkgconfig mime-xdg
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132205):
> https://lists.openembedded.org/g/openembedded-devel/message/132205
> Mute This Topic: https://lists.openembedded.org/mt/122226695/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007671f1066017795f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is upgrade to 0.42 patch staged where this is alread=
y included. I will drop this one.</div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 11, 2026=
 at 11:14=E2=80=AFPM Ankur Tyagi via openembedded-devel &lt;ankur.tyagi85=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com=
" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Details:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-123095" rel=3D"norefer=
rer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/cve-2026-123095</a>=
<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../mplayer/mpv/CVE-2026-123095.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 37 +++++++++++++++++++<br>
=C2=A0.../recipes-multimedia/mplayer/<a href=3D"http://mpv_0.41.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mpv_0.41.0.bb</a>=C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-12=
3095.patch<br>
<br>
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch b=
/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch<br>
new file mode 100644<br>
index 0000000000..1efa0fdee6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch<br>
@@ -0,0 +1,37 @@<br>
+From 2c6599aa7d16efd29ae49865757eb449d9306742 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Kacper=3D20Michaj=3DC5=3D82ow?=3D &lt;<a href=3D"mailto:=
kasper93@gmail.com" target=3D"_blank">kasper93@gmail.com</a>&gt;<br>
+Date: Wed, 4 Nov 2026 20:28:57 +0100<br>
+Subject: [PATCH] ytdl_hook: reject playlist entry URLs with control charac=
ters<br>
+<br>
+The entries are joined into a memory:// M3U playlist, one URL per line.<br=
>
+A URL with a line break became several entries, and only the first line<br=
>
+went through url_is_safe(). The other lines were loaded with the origin<br=
>
+of the opened URL, so any protocol was allowed. Skip any URLs with<br>
+control characters.<br>
+<br>
+Fixes: e6e6b0dcc7<br>
+Fixes: GHSA-p99g-m25w-x8xv<br>
+(cherry picked from commit c3096515dcd26c14004f985538b5aa41db613856)<br>
+<br>
+CVE: CVE-2026-123095<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/mpv-player/mpv/co=
mmit/c3096515dcd26c14004f985538b5aa41db613856" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/mpv-player/mpv/commit/c3096515dcd26c14004f98553=
8b5aa41db613856</a>]<br>
+<br>
+Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
+---<br>
+ player/lua/ytdl_hook.lua | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/player/lua/ytdl_hook.lua b/player/lua/ytdl_hook.lua<br>
+index 65ef859595..2b0edb193a 100644<br>
+--- a/player/lua/ytdl_hook.lua<br>
++++ b/player/lua/ytdl_hook.lua<br>
+@@ -1111,6 +1111,9 @@ local function run_ytdl_hook(url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- links wit=
hout protocol as returned by --flat-playlist<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not site =
then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0msg.error(&quot;Playlist entry does not have unique URL, can&#39;t add i=
t.&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elseif site:find(=
&quot;%c&quot;) then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- =
a line break would add entries to the playlist<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg=
.error(&quot;Playlist entry URL contains control characters, can&#39;t add =
it.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elseif not s=
ite:find(&quot;://&quot;) then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-- youtube extractor provides only IDs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-- others come prefixed with the extractor name and &quot;:&quot;<br>
diff --git a/meta-oe/recipes-multimedia/mplayer/<a href=3D"http://mpv_0.41.=
0.bb" rel=3D"noreferrer" target=3D"_blank">mpv_0.41.0.bb</a> b/meta-oe/reci=
pes-multimedia/mplayer/<a href=3D"http://mpv_0.41.0.bb" rel=3D"noreferrer" =
target=3D"_blank">mpv_0.41.0.bb</a><br>
index f37ae4ac50..0c99e354e7 100644<br>
--- a/meta-oe/recipes-multimedia/mplayer/<a href=3D"http://mpv_0.41.0.bb" r=
el=3D"noreferrer" target=3D"_blank">mpv_0.41.0.bb</a><br>
+++ b/meta-oe/recipes-multimedia/mplayer/<a href=3D"http://mpv_0.41.0.bb" r=
el=3D"noreferrer" target=3D"_blank">mpv_0.41.0.bb</a><br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/mpv-player/mpv;name=
=3Dmpv;branch=3Drelease/$%7B@oe.utils.trim_version(&#39;$%7BPV%7D" rel=3D"n=
oreferrer" target=3D"_blank">github.com/mpv-player/mpv;name=3Dmpv;branch=3D=
release/${@oe.utils.trim_version(&#39;${PV}</a>&#39;, 2)};protocol=3Dhttps;=
tag=3Dv${PV} \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-opengl-context-require-swap_buffers-param-f=
or-FenceS.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-hwdec_drmprime_overlay-make-the-framebuffer=
-the-whole-frame.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2026-123095.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0inherit meson pkgconfig mime-xdg<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132205): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132205" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132205</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122226695/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122226695/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007671f1066017795f--
