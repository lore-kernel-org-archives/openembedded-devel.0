Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.13097.1611338666632846220
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 10:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eV6JFcL4;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id d14so5963643qkc.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 10:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=644/qYng10zK0+yOf64xi1D9roYa5qDPG5AP7MmsCwE=;
        b=eV6JFcL4WG0zRM9Y+JM6ZxQE/jdTVABHNnhlvADru5ejG0SQ8epWSbyg7FSWLdS6Qx
         tK2wEO+TfRbBTbwMkYAO+a1RwqBkGvPz89uRW3Uutt0H2k3Z95jsQgD6oEN2TPJX60Ry
         Lg59jbgu8ye97GDIeVTMpDRjMg+atLqm9OC0hwIsZk3FTG9VJDtBo+CEe4TjRt5nZ2H+
         i7Vc7BP7gY4EGlKRuzv0J44N0DPr7J64LL/e7ynM7fg+tjMmzWir/g+9wyL80SUd5bXq
         SKL11/LppWPa43H/JjkLc4BYb/rZ7+LHy0Of6x2w9bZJDtgl5U+/FKsK7dmlaLp8BAVg
         NFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=644/qYng10zK0+yOf64xi1D9roYa5qDPG5AP7MmsCwE=;
        b=eoxS0WoOIaqedmqjykBPSZY157F+YIGYiA+FP0xJTrF3xOPfe7LC/GXh0W9ZtUxEza
         jPE+Ajs7i8iIYuTgJ5PBgFhQ31NUQCkh+Kudpe3m4Lp82lvxJgUWP4j1/JW2+wRfOe6d
         vmGf5YZqmD1OFe6AmgG7GAaFuzZrR1JBN8kJC2RkUgVYdF8YHVuGf0pfy8nVlUPGOHUU
         RjnosU6askGj8DDh7kM9zRTntYBzT84VuThyyOAdJzzxH4iBwzVSyS0aBPNKEkMkk26z
         rUqVSv7nM4s2wiP5VC/u5zwOQkEVI14oUAHSKMNXWGa6WVRxCgBsGv7Tl+KZv97369d/
         UN7g==
X-Gm-Message-State: AOAM530ZsaIm5mpOss2B+yw1nBC0i4p+TuniKeX4/CeNu1MZ/HvVUJvu
	zzSoqDIh2KQvP/8xcr9hSJMu4NiVSEv/8fBFuLY=
X-Google-Smtp-Source: ABdhPJwm3ufDzzNwMmLyPnn/7XZGJ15vjBWCTyLmw7pCFzxhqrlI1fzfgvQJWL4vcj0Fzc0045YV/p8ESVu4U0hx+vY=
X-Received: by 2002:a37:744:: with SMTP id 65mr5605518qkh.71.1611338665679;
 Fri, 22 Jan 2021 10:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20210122101652.46438-1-zhe.he@windriver.com> <20210122101652.46438-2-zhe.he@windriver.com>
In-Reply-To: <20210122101652.46438-2-zhe.he@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 Jan 2021 10:04:14 -0800
Message-ID: <CAMKF1sozWaDwOdO8AgY+O_8a7VNjnKSV5yMOccQuFJDokLDSnw@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lmbench: lat_fifo: Fix cleanup sequence
To: He Zhe <zhe.he@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c7dd8f05b98104bc"

--000000000000c7dd8f05b98104bc
Content-Type: text/plain; charset="UTF-8"

Can you submit this upstream as well please


On Fri, Jan 22, 2021 at 2:17 AM He Zhe <zhe.he@windriver.com> wrote:

> Files should be unlinked after all users exit. Otherwise we might
> experience
> (w) read/write on pipe: No such file or directory
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../0001-lat_fifo-Fix-cleanup-sequence.patch  | 42 +++++++++++++++++++
>  .../lmbench/lmbench_3.0-a9.bb                 |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644
> meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
>
> diff --git
> a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
> b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
> new file mode 100644
> index 000000000..42b14cece
> --- /dev/null
> +++
> b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
> @@ -0,0 +1,42 @@
> +From 78912c0ac5e090095a2f2bd6226e02cce949e72e Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Fri, 22 Jan 2021 10:03:38 +0000
> +Subject: [PATCH] lat_fifo: Fix cleanup sequence
> +
> +Files should be unlinked after all users exit.
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + src/lat_fifo.c | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/lat_fifo.c b/src/lat_fifo.c
> +index c625161..85bb9d1 100644
> +--- a/src/lat_fifo.c
> ++++ b/src/lat_fifo.c
> +@@ -120,16 +120,16 @@ cleanup(iter_t iterations, void * cookie)
> +
> +       if (iterations) return;
> +
> +-      unlink(state->filename1);
> +-      unlink(state->filename2);
> +-      close(state->wr);
> +-      close(state->rd);
> +-
> +       if (state->pid > 0) {
> +-              kill(state->pid, 15);
> ++              kill(state->pid, SIGKILL);
> +               waitpid(state->pid, NULL, 0);
> +               state->pid = 0;
> +       }
> ++
> ++      unlink(state->filename1);
> ++      unlink(state->filename2);
> ++      close(state->wr);
> ++      close(state->rd);
> + }
> +
> + void
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 68c7e7b4f..21e81ecf2 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -28,6 +28,7 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
>
> file://0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch \
>             file://0001-lmbench-Point-webpage-lm-to-target-directory.patch
> \
>             file://0001-doc-Fix-typos-in-manual-pages.patch \
> +           file://0001-lat_fifo-Fix-cleanup-sequence.patch \
>             "
>  SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
>  SRC_URI[sha256sum] =
> "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
> --
> 2.17.1
>
>
> 
>
>

--000000000000c7dd8f05b98104bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Can you submit this upstream as well pleas=
e=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><div class=
=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Jan 22, 2021 at 2:17 AM He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com=
">zhe.he@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Files should be unlinked after all users exit. Otherwise we might experi=
ence<br>
(w) read/write on pipe: No such file or directory<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-lat_fifo-Fix-cleanup-sequence.patch=C2=A0 | 42 ++++++++++++=
+++++++<br>
=C2=A0.../lmbench/<a href=3D"http://lmbench_3.0-a9.bb" rel=3D"noreferrer" =
target=3D"_blank">lmbench_3.0-a9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/=
0001-lat_fifo-Fix-cleanup-sequence.patch<br>
<br>
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fif=
o-Fix-cleanup-sequence.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.=
0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch<br>
new file mode 100644<br>
index 000000000..42b14cece<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-c=
leanup-sequence.patch<br>
@@ -0,0 +1,42 @@<br>
+From 78912c0ac5e090095a2f2bd6226e02cce949e72e Mon Sep 17 00:00:00 2001<br=
>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank=
">zhe.he@windriver.com</a>&gt;<br>
+Date: Fri, 22 Jan 2021 10:03:38 +0000<br>
+Subject: [PATCH] lat_fifo: Fix cleanup sequence<br>
+<br>
+Files should be unlinked after all users exit.<br>
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
+---<br>
+ src/lat_fifo.c | 12 ++++++------<br>
+ 1 file changed, 6 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/src/lat_fifo.c b/src/lat_fifo.c<br>
+index c625161..85bb9d1 100644<br>
+--- a/src/lat_fifo.c<br>
++++ b/src/lat_fifo.c<br>
+@@ -120,16 +120,16 @@ cleanup(iter_t iterations, void * cookie)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (iterations) return;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 unlink(state-&gt;filename1);<br>
+-=C2=A0 =C2=A0 =C2=A0 unlink(state-&gt;filename2);<br>
+-=C2=A0 =C2=A0 =C2=A0 close(state-&gt;wr);<br>
+-=C2=A0 =C2=A0 =C2=A0 close(state-&gt;rd);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (state-&gt;pid &gt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(state-&gt;pid, 15)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(state-&gt;pid, SIG=
KILL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0waitpid(state-&gt;=
pid, NULL, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;pid =3D =
0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 unlink(state-&gt;filename1);<br>
++=C2=A0 =C2=A0 =C2=A0 unlink(state-&gt;filename2);<br>
++=C2=A0 =C2=A0 =C2=A0 close(state-&gt;wr);<br>
++=C2=A0 =C2=A0 =C2=A0 close(state-&gt;rd);<br>
+ }<br>
+ <br>
+ void <br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta-oe/recipes-benchmark/lmbench/<a href=3D"http://lmbench_3=
.0-a9.bb" rel=3D"noreferrer" target=3D"_blank">lmbench_3.0-a9.bb</a> b/meta=
-oe/recipes-benchmark/lmbench/<a href=3D"http://lmbench_3.0-a9.bb" rel=3D"n=
oreferrer" target=3D"_blank">lmbench_3.0-a9.bb</a><br>
index 68c7e7b4f..21e81ecf2 100644<br>
--- a/meta-oe/recipes-benchmark/lmbench/<a href=3D"http://lmbench_3.0-a9.b=
b" rel=3D"noreferrer" target=3D"_blank">lmbench_3.0-a9.bb</a><br>
+++ b/meta-oe/recipes-benchmark/lmbench/<a href=3D"http://lmbench_3.0-a9.b=
b" rel=3D"noreferrer" target=3D"_blank">lmbench_3.0-a9.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/lmbench/lmbench-=
${PV}.tgz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-Makefile-use-lib=
dir-instead-of-hardcoded-lib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lmbench-Point-webpag=
e-lm-to-target-directory.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-doc-Fix-typos-in-man=
ual-pages.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lat_fifo-Fix-cleanup=
-sequence.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;b3351a3294db66a72e2864a199d37cbf&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cbd5777d15f44eab7666dcac418054c3c09df99=
826961a397d9acf43d8a2a551&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000c7dd8f05b98104bc--
