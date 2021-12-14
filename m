Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB041C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 21:53:54 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.32371.1639518834183097560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 13:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lECSDlE0;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id z18so26761926iof.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 13:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L3oNiVdlwXZo4xp55gl5+qVZpWwAI/r4DMj6+9wGGi8=;
        b=lECSDlE02OO2SQlBmKf8CN5kiuLmiWzuEJ1r1SWQnfwrlrnPsbqG/+Xm6JAAM8amJQ
         hnUDBDun4hfhd1GuGdYY1TqgYus1/ELyVG3mYwMeOS9mejoQdBwEAhbkXA2UemKVdfFK
         U5eLEqXGmOlACTA73ya560yV7uHjRZvWcD8DzLJhw2lL5+TL6jtgga01u0R2nDZ9fIoZ
         09Iq7v4lKekoXLxl/ZKmASXjk+PUp3fjGb8h/Ij8axmAGC+hUVBCqIb/wTD+HQyvJpl6
         eTY4U6RJmPh/WmvUXLG9AvkXNfWfXJBo72dA1WTae1LDmrmdhA6PEdRMNSj3Dl8lQnOm
         vT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L3oNiVdlwXZo4xp55gl5+qVZpWwAI/r4DMj6+9wGGi8=;
        b=HC1/lUKnYFmnciIoZNabnwGJNwzvOy/GC2uIPLvVT7/b0/lCVD2pj8nXl6W/MDwx3C
         /g+8TZcHoDsPEVJkrD21wNqcf9cPAL4GEzaAsvb88d2VURHaIhRDj5KXrhduc0wZUWpF
         N3igvbNM/z2v1Up20qeO34ddyaPM48GFaZs4jAqFnFcrpBlmug1m+3bG321QUOTl6rNK
         ToaOJ4nUv//Zote4UWYk2uZnPiXvR/BXygWVxA8ZYbLVV7pewrMdVEbPnj/OYQoLhgRD
         2iR/rOppVTqJp/sWotN6+Hx6cUkO14NYvOgZcZKQyVJaJReaaa/oth0Ek1SCgPcgWrCy
         du5Q==
X-Gm-Message-State: AOAM530fWVZ/ieXsLuLzwiPAHJitPqOQ0ra0QHnTZaARD4Vj83sZVFMQ
	v4uo8oMkxjb7oPEKtjzJdk+ImnKD63gvn4/LCTHtcYPw
X-Google-Smtp-Source: 
 ABdhPJyR/rbqMbO0HuWb6i/vmj0idT2OOla4lhobwI3ewC1JztNfOH+VLNE1UFruMYlt1gDGOtzK1KxzmZJmBlKB/pE=
X-Received: by 2002:a05:6638:34a9:: with SMTP id
 t41mr4161355jal.303.1639518833026;
 Tue, 14 Dec 2021 13:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20211214190436.1819246-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20211214190436.1819246-1-mark.hatle@kernel.crashing.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 14 Dec 2021 13:53:42 -0800
Message-ID: 
 <CANx9H-AtwcmtryXHCpo76-ofU+kPR+qgoo+Gkjf5CfTEpQK4qA@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH] python3-matplotlib: Disable automatic
 download during do_compile
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a52a9205d32239a6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 21:53:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94361

--000000000000a52a9205d32239a6
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 11:04 AM Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

> From: Mark Hatle <mark.hatle@xilinx.com>
>
> Add a patch to disable the automatic download of components.
>
> Add manual download for a specific freetype and qhull version.
>

At one point I had a separate recipe for qhull.
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=timo/python-matplotlib-2.1.2-WIP&id=0913d8029887f025ec8978866ea82cbc6b0db246
That branch was getting most of the way through ptests at the time. It
needed a lot of ram and disk space and took a while. The configurations for
backends were also a pita.


> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  .../matplotlib-disable-download.patch         | 50 +++++++++++++++++++
>  .../python/python3-matplotlib_3.5.1.bb        | 12 +++++
>  2 files changed, 62 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
> b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
> new file mode 100644
> index 000000000..e032ceb2c
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
> @@ -0,0 +1,50 @@
> +Disable automatic downloading of components!
> +
> +Upstream-Status: Inappropriate [disable feature]
> +
> +Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> +
> +--- a/setupext.py.orig 2021-12-14 09:44:33.499041044 -0800
> ++++ a/setupext.py      2021-12-14 09:45:00.447041706 -0800
> +@@ -64,40 +64,7 @@
> +     BytesIO
> +         The file loaded into memory.
> +     """
> +-    cache_dir = _get_xdg_cache_dir()
> +-
> +-    if cache_dir is not None:  # Try to read from cache.
> +-        try:
> +-            data = (cache_dir / sha).read_bytes()
> +-        except IOError:
> +-            pass
> +-        else:
> +-            if _get_hash(data) == sha:
> +-                return BytesIO(data)
> +-
> +-    # jQueryUI's website blocks direct downloads from urllib.request's
> +-    # default User-Agent, but not (for example) wget; so I don't feel too
> +-    # bad passing in an empty User-Agent.
> +-    with urllib.request.urlopen(
> +-            urllib.request.Request(url, headers={"User-Agent": ""}),
> +-            context=_get_ssl_context()) as req:
> +-        data = req.read()
> +-
> +-    file_sha = _get_hash(data)
> +-    if file_sha != sha:
> +-        raise Exception(
> +-            f"The downloaded file does not match the expected sha.
> {url} was "
> +-            f"expected to have {sha} but it had {file_sha}")
> +-
> +-    if cache_dir is not None:  # Try to cache the downloaded file.
> +-        try:
> +-            cache_dir.mkdir(parents=True, exist_ok=True)
> +-            with open(cache_dir / sha, "xb") as fout:
> +-                fout.write(data)
> +-        except IOError:
> +-            pass
> +-
> +-    return BytesIO(data)
> ++    raise IOError(f"Automatic downloading is disabled.")
> +
> +
> + def get_and_extract_tarball(urls, sha, dirname):
> diff --git a/meta-python/recipes-devtools/python/
> python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/
> python3-matplotlib_3.5.1.bb
> index f9eb79ff1..9b3ca5902 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
> @@ -25,6 +25,18 @@ SRC_URI[sha256sum] =
> "b2e9810e09c3a47b73ce9cab5a72243a1258f61e7900969097a8172322
>
>  inherit pypi setuptools3 pkgconfig
>
> +# Stop the component from attempting to download when it detects a missing
> +# dependency
> +SRC_URI += "file://matplotlib-disable-download.patch"
> +
> +# This python module requires a full copy of freetype-2.6.1
> +SRC_URI += "
> https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/build
> "
> +SRC_URI[freetype.sha256sum] =
> "0a3c7dfbda6da1e8fce29232e8e96d987ababbbf71ebc8c75659e4132c367014"
> +
> +# This python module requires a full copy of 'qhull-2020'
> +SRC_URI += "
> http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz;name=qhull;subdir=matplotlib-${PV}/build
> "
> +SRC_URI[qhull.sha256sum] =
> "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
> +
>  # LTO with clang needs lld
>  LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
>  LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94359):
> https://lists.openembedded.org/g/openembedded-devel/message/94359
> Mute This Topic: https://lists.openembedded.org/mt/87728349/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a52a9205d32239a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 14, 2021 at 11:04 AM Mark Hatle &lt;<a href=3D"=
mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">From: Mark Hatle &lt;<a href=3D"mailto:=
mark.hatle@xilinx.com" target=3D"_blank">mark.hatle@xilinx.com</a>&gt;<br>
<br>
Add a patch to disable the automatic download of components.<br>
<br>
Add manual download for a specific freetype and qhull version.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">At one point I h=
ad a separate recipe for qhull.</div><div dir=3D"auto"><div><a href=3D"http=
s://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo/python-=
matplotlib-2.1.2-WIP&amp;id=3D0913d8029887f025ec8978866ea82cbc6b0db246">htt=
ps://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo/python=
-matplotlib-2.1.2-WIP&amp;id=3D0913d8029887f025ec8978866ea82cbc6b0db246</a>=
</div>That branch was getting most of the way through ptests at the time. I=
t needed a lot of ram and disk space and took a while. The configurations f=
or backends were also a pita.</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)"><br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@xilinx.com" targ=
et=3D"_blank">mark.hatle@xilinx.com</a>&gt;<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.=
org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;<br>
---<br>
=C2=A0.../matplotlib-disable-download.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 50 +++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-matplotlib_3.5.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-matplotlib_3.5.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 12 +++++<br>
=C2=A02 files changed, 62 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-matplo=
tlib/matplotlib-disable-download.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplot=
lib-disable-download.patch b/meta-python/recipes-devtools/python/python3-ma=
tplotlib/matplotlib-disable-download.patch<br>
new file mode 100644<br>
index 000000000..e032ceb2c<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-dis=
able-download.patch<br>
@@ -0,0 +1,50 @@<br>
+Disable automatic downloading of components!<br>
+<br>
+Upstream-Status: Inappropriate [disable feature]<br>
+<br>
+Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@xilinx.com" tar=
get=3D"_blank">mark.hatle@xilinx.com</a>&gt;<br>
+<br>
+--- a/setupext.py.orig 2021-12-14 09:44:33.499041044 -0800<br>
++++ a/setupext.py=C2=A0 =C2=A0 =C2=A0 2021-12-14 09:45:00.447041706 -0800<=
br>
+@@ -64,40 +64,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0BytesIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The file loaded into memory.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+-=C2=A0 =C2=A0 cache_dir =3D _get_xdg_cache_dir()<br>
+-<br>
+-=C2=A0 =C2=A0 if cache_dir is not None:=C2=A0 # Try to read from cache.<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D (cache_dir / sha).read=
_bytes()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if _get_hash(data) =3D=3D sha:<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return BytesIO(da=
ta)<br>
+-<br>
+-=C2=A0 =C2=A0 # jQueryUI&#39;s website blocks direct downloads from urlli=
b.request&#39;s<br>
+-=C2=A0 =C2=A0 # default User-Agent, but not (for example) wget; so I don&=
#39;t feel too<br>
+-=C2=A0 =C2=A0 # bad passing in an empty User-Agent.<br>
+-=C2=A0 =C2=A0 with urllib.request.urlopen(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 urllib.request.Request(url, hea=
ders=3D{&quot;User-Agent&quot;: &quot;&quot;}),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context=3D_get_ssl_context()) a=
s req:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D req.read()<br>
+-<br>
+-=C2=A0 =C2=A0 file_sha =3D _get_hash(data)<br>
+-=C2=A0 =C2=A0 if file_sha !=3D sha:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;The downloaded file does=
 not match the expected sha.=C2=A0 {url} was &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;expected to have {sha} b=
ut it had {file_sha}&quot;)<br>
+-<br>
+-=C2=A0 =C2=A0 if cache_dir is not None:=C2=A0 # Try to cache the download=
ed file.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache_dir.mkdir(parents=3DTrue,=
 exist_ok=3DTrue)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(cache_dir / sha, &quo=
t;xb&quot;) as fout:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fout.write(data)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+-<br>
+-=C2=A0 =C2=A0 return BytesIO(data)<br>
++=C2=A0 =C2=A0 raise IOError(f&quot;Automatic downloading is disabled.&quo=
t;)<br>
+<br>
+<br>
+ def get_and_extract_tarball(urls, sha, dirname):<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
matplotlib_3.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotli=
b_3.5.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-matplotlib_3.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-matpl=
otlib_3.5.1.bb</a><br>
index f9eb79ff1..9b3ca5902 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-matplot=
lib_3.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.5.1=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-matplot=
lib_3.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.5.1=
.bb</a><br>
@@ -25,6 +25,18 @@ SRC_URI[sha256sum] =3D &quot;b2e9810e09c3a47b73ce9cab5a7=
2243a1258f61e7900969097a8172322<br>
<br>
=C2=A0inherit pypi setuptools3 pkgconfig<br>
<br>
+# Stop the component from attempting to download when it detects a missing=
<br>
+# dependency<br>
+SRC_URI +=3D &quot;file://matplotlib-disable-download.patch&quot;<br>
+<br>
+# This python module requires a full copy of freetype-2.6.1<br>
+SRC_URI +=3D &quot;<a href=3D"https://downloads.sourceforge.net/project/fr=
eetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=3Dfreetype;subdir=3Dmatpl=
otlib-$%7BPV%7D/build" rel=3D"noreferrer" target=3D"_blank">https://downloa=
ds.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;n=
ame=3Dfreetype;subdir=3Dmatplotlib-${PV}/build</a>&quot;<br>
+SRC_URI[freetype.sha256sum] =3D &quot;0a3c7dfbda6da1e8fce29232e8e96d987aba=
bbbf71ebc8c75659e4132c367014&quot;<br>
+<br>
+# This python module requires a full copy of &#39;qhull-2020&#39;<br>
+SRC_URI +=3D &quot;<a href=3D"http://www.qhull.org/download/qhull-2020-src=
-8.0.2.tgz;name=3Dqhull;subdir=3Dmatplotlib-$%7BPV%7D/build" rel=3D"norefer=
rer" target=3D"_blank">http://www.qhull.org/download/qhull-2020-src-8.0.2.t=
gz;name=3Dqhull;subdir=3Dmatplotlib-${PV}/build</a>&quot;<br>
+SRC_URI[qhull.sha256sum] =3D &quot;b5c2d7eb833278881b952c8a52d20179eab8776=
6b00b865000469a45c1838b7e&quot;<br>
+<br>
=C2=A0# LTO with clang needs lld<br>
=C2=A0LDFLAGS:append:toolchain-clang =3D &quot; -fuse-ld=3Dlld&quot;<br>
=C2=A0LDFLAGS:remove:toolchain-clang:mips =3D &quot;-fuse-ld=3Dlld&quot;<br=
>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94359): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94359" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94359</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87728349/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
87728349/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a52a9205d32239a6--

