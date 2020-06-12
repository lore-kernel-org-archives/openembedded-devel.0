Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.22289.1591975305799531830
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GP+cm4G/;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w9so7399135qtv.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tGjrU8WzKJ2hhXRCcQ2AoLpecvMG1DAVeyOWYps/0Vw=;
        b=GP+cm4G/WlHZjYIdeWbWX4T3SQV1EYFkOsg+aV7zTexGjFo7rmCjJkLrhGNfXSsgZV
         4UPZq0WxacWoHJuwRnFx4ZOtQyN7kt8potxjlcz5ImWh72KjlCEGK+XlsGwTMoV8BzVe
         VhM6FKLu/XbR9c+xQcIfNGxP9LIS/RaDXi/rNz7pHFizgdUvLrdnreVpz2d7E3gNHIbh
         l0iH6tGhGBgT1gnLP54JliPcF4nA1tuCnIOL30QjXhh8I9hpCNWYYqqL+Iab9gYXpqMj
         oEGOeNCKe00geW/2WcYT3FNr7Gibtb82c3fnMHS+byC727iKJrQ1ZmxNYSt89o5MIP9K
         EcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tGjrU8WzKJ2hhXRCcQ2AoLpecvMG1DAVeyOWYps/0Vw=;
        b=hv3wFLtWP47ESukxTnAde8p4Q6XWfQdFfckKvwBAtmxuJAJcapCx4eE/U5cer7YUqL
         55a9yfSQhuwo0B2c9yfdce036SiMVoMfsFJwuFcsvA8tsdSR/J0n1Bf6gQ4PV+EzsJ6g
         GeltrVbgy5CF2h1U7dhO2/AvZHtzYvS5O9IwAl0IK+cOHdOtAiL45hN2rY+6y1kx1jEm
         LQFr6dy+CvmUl0yXgzUaVAGu9B+BGpSE5Mb/pZlSmP2VWU+giy6MTVmrjQ9zQKn+cGFf
         rEN4q1TKNb1uqdcJClxgW/43U5PwQvETS/p6c//kTfcAVvlih1tbScrfL+JAd0CRIl0G
         pt2Q==
X-Gm-Message-State: AOAM533iul1d8OZmgaEuLjaT5UF/3X87ABVUFJmNfsc+ZpzooZbNeix1
	dgCNzQPX9vxOzCeMHV6Ba8yoWm73M+lNS5ranpE=
X-Google-Smtp-Source: ABdhPJwSXQ46/pSvnz2PtBAkkdPHwk+ZuzKB16FptlaKRhNNiNuTGi0thyg71zolnk6kX/nBOAbvvJr3Pu0fNu0uxgM=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr3579296qto.285.1591975304786;
 Fri, 12 Jun 2020 08:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200612054313.4166368-1-anuj.mittal@intel.com> <20200612054313.4166368-2-anuj.mittal@intel.com>
In-Reply-To: <20200612054313.4166368-2-anuj.mittal@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 12 Jun 2020 08:21:33 -0700
Message-ID: <CAMKF1soEA5dfNkWET3RbaRR=W=fTGcfMsd1=bZfX+_i54_baDA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] opencl-clhpp: add recipe
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000088793905a7e4a225"

--00000000000088793905a7e4a225
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 11, 2020 at 10:43 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> Recipe to provide OpenCL API C++ bindings.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../recipes-core/opencl/opencl-clhpp_git.bb   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> new file mode 100644
> index 000000000..540c5d346
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY  = "OpenCL API C++ bindings"
> +DESCRIPTION = "OpenCL API C++ bindings from Khronos"
> +
> +SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https"
> +
> +LICENSE  = "Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +PV = "2.0.11+git${SRCPV}"
> +SRCREV = "432b551429b362a877ed9b647b7114022b332be0"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = " \
> +                  -DBUILD_DOCS=OFF \
> +                  -DBUILD_EXAMPLES=OFF \
> +                  -DBUILD_TESTS=OFF \
> +                  "
> +
> +ALLOW_EMPTY_${PN} = "1"


Why is this needed ?


> --
> 2.25.4
>
> 
>

--00000000000088793905a7e4a225
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 11, 2020 at 10:43 PM Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Recipe to provide OpenCL API C++ bindi=
ngs.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a>=C2=A0 =C2=A0| 22=
 +++++++++++++++++++<br>
=C2=A01 file changed, 22 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-core/opencl/<a href=3D"http://ope=
ncl-clhpp_git.bb" rel=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb<=
/a><br>
<br>
diff --git a/meta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhpp_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a> b/meta-o=
e/recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.bb" rel=3D"norefer=
rer" target=3D"_blank">opencl-clhpp_git.bb</a><br>
new file mode 100644<br>
index 000000000..540c5d346<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.bb" r=
el=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a><br>
@@ -0,0 +1,22 @@<br>
+SUMMARY=C2=A0 =3D &quot;OpenCL API C++ bindings&quot;<br>
+DESCRIPTION =3D &quot;OpenCL API C++ bindings from Khronos&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/OpenCL-=
CLHPP.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dhttps</a>&quot;<br>
+<br>
+LICENSE=C2=A0 =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
+<br>
+PV =3D &quot;2.0.11+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;432b551429b362a877ed9b647b7114022b332be0&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+EXTRA_OECMAKE =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBUILD_DO=
CS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBUILD_EX=
AMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBUILD_TE=
STS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Why is this needed ?</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
-- <br>
2.25.4<br>
<br>
<br>
</blockquote></div></div>

--00000000000088793905a7e4a225--
