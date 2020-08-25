Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.16906.1598371044892488685
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 08:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QCXcHXRi;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id u1so1511089edi.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LfrtglWuyxY4Pw3p/yg+tMRn0YpfnDqWacUOUnSdMRM=;
        b=QCXcHXRiRq+3OgAVwpZPzwKjQHOq0WrdIZ3nvJRFj8LM/kCN97KPnz/vgLLyV3yO73
         8yLsP0t3rAkuIR+6wjc17UmeVGP+kFCoDsD/QJvcoxlv7ZBcYJ8cSpJNVbx018Nwgim7
         j5iJB2vJKUSynATF7IQ9Vw3SE+ZeJaGdVVNo1bsJJwyH+YrIvYw2hoZGKU6SEw56Q8zn
         LO6agzeNzb6SOajGZqQc213uynGgrX8Gwq+sVAwZ9W5Vl8IK78UosClAeLyGnN6YFprX
         dyEQir5bUSoYMMwVQmm9MN5IDMgQ/O08pm4AX/2rKcUudWY/wY26tVc6MzGWgFRz7fFo
         4RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LfrtglWuyxY4Pw3p/yg+tMRn0YpfnDqWacUOUnSdMRM=;
        b=q6wSPfQr3ElSOnHZf9R/vxx5sUgjGnCRO3IMPS0DMvz5xIb1a+uLPy2gNFUgGaO9tr
         h9/S2ZWudqcZdkT+Y9pA7TKNpCcdsGqNo2eOIEpIjsCDlvlhXBLCjUBb8s+xMM1i4Xe9
         KVa/5g5YCeywyn+ye8A5mYNy/nHhQURA2TRbPFil14mnrfLdvIJJC54rnhOYhvCVHnjp
         RXU4zRY4JkLU1hmwXGpnp2ZTf6pMkaxJrLXjusIcqC2NursIq3oXpLJeoL8SZrZlshx6
         /9FeCizq71MRv/QzrGYjGRdqcBbwo7UldG+R1Sxnt2J+1E04kjuNkjooVQaop2Zx+Wgk
         H3kQ==
X-Gm-Message-State: AOAM532JknpvCmZyG8qNXHs1ze6/Q3bQgNvHtq5GYA4tV9K7PjYbUBSw
	WfzyqZuGiTarwRd2GCw5V8YcXBlbpF4IyKdpxLI=
X-Google-Smtp-Source: ABdhPJw+RVqig3w/xKHwB0yV8TA0shQH2FqaVBF81mLMrq5PsrGccNFBBlIw9ECzDtcQKdyou7D+ThmsvFCoOSErxvg=
X-Received: by 2002:a50:954d:: with SMTP id v13mr11057418eda.337.1598371043192;
 Tue, 25 Aug 2020 08:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
In-Reply-To: <20200825154524.188696-1-diego.rondini@kynetics.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 25 Aug 2020 17:57:12 +0200
Message-ID: <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Diego <diego.rondini@kynetics.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003fb4c905adb5c213"

--0000000000003fb4c905adb5c213
Content-Type: text/plain; charset="UTF-8"

Doesn't this trigger src-uri-bad QA warning? It would be better to use git
fetcher.

On Tue, Aug 25, 2020 at 5:45 PM Diego <diego.rondini@kynetics.com> wrote:

> Bitbucket is no longer the official home of eigen, which has moved to
> gitlab. Update SRC_URI to download releases from gitlab, fixing:
> WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
>
> https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2
> ,
> attempting MIRRORS if available
>
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> index f638848d1..9c3d962f4 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
>  LICENSE = "MPL-2.0"
>  LIC_FILES_CHKSUM =
> "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
>
> -SRC_URI = "
> https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2
> "
> -SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
> -SRC_URI[sha256sum] =
> "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
> +SRC_URI = "
> https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
> +SRC_URI[sha256sum] =
> "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
>
> -S = "${WORKDIR}/eigen-eigen-323c052e1731"
> +S = "${WORKDIR}/eigen-${PV}"
>
>  inherit cmake
>
> --
> 2.26.2
>
> 
>

--0000000000003fb4c905adb5c213
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t this trigger=C2=A0src-uri-bad QA warning? It w=
ould be better to use git fetcher.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 5:45 PM Diego &lt=
;<a href=3D"mailto:diego.rondini@kynetics.com">diego.rondini@kynetics.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bi=
tbucket is no longer the official home of eigen, which has moved to<br>
gitlab. Update SRC_URI to download releases from gitlab, fixing:<br>
WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL<br>
<a href=3D"https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfil=
ename=3Dlibeigen-3.3.7.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https:=
//bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=3Dlibeigen-3=
.3.7.tar.bz2</a>,<br>
attempting MIRRORS if available<br>
<br>
Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynetics.=
com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a> | 8 ++++----<b=
r>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3=
.3.7.bb" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a> b/meta-=
oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
index f638848d1..9c3d962f4 100644<br>
--- a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
+++ b/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
@@ -4,11 +4,11 @@ HOMEPAGE =3D &quot;<a href=3D"http://eigen.tuxfamily.org=
/" rel=3D"noreferrer" target=3D"_blank">http://eigen.tuxfamily.org/</a>&quo=
t;<br>
=C2=A0LICENSE =3D &quot;MPL-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.MPL2;md5=3D815ca599c9df247=
a0c7f619bab123dad&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://bitbucket.org/eigen/eigen/get/$%7BPV=
%7D.tar.bz2;downloadfilename=3D$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=
=
=3D"_blank">https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfi=
lename=3D${BP}.tar.bz2</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;05b1f7511c93980c385ebe11bd3c93fa&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5=
436dddcd61ff9d77a3ce&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.com/libeigen/eigen/-/archive/=
$%7BPV%7D/eigen-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2</a>&quot=
;<br>
+SRC_URI[md5sum] =3D &quot;b9e98a200d2455f06db9c661c5610496&quot;<br>
+SRC_URI[sha256sum] =3D &quot;685adf14bd8e9c015b78097c1dc22f2f01343756f196=
acdc76a678e1ae352e11&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/eigen-eigen-323c052e1731&quot;<br>
+S =3D &quot;${WORKDIR}/eigen-${PV}&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>

--0000000000003fb4c905adb5c213--
