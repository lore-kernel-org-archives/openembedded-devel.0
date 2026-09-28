Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C4BCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:30:40 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64254.1790616633183578908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L8EN/spF;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fded6b087so3068164d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790616632; cv=none;
        d=google.com; s=arc-20260327;
        b=rkvnw2rLr4SPWShUSxFOqjAVanAxwKAfO9C1+9SzHXeS1Z499tVoi8rPmrxhtTiyte
         YvxYLiL2OdPAjIV/cMakwJpan+EEzAirjkSYPePJ6GDzB41SBI2ZIwOtbS1Zr6smdif3
         H0WaNvashlwiSVwQDFNlheZWZmvKtwxf4nekChN0wJVthl8H/MXJ/bihTOvlMU0nh9wI
         IPpmjKyLJ1dAv8AjP8KkKGRiBRx/gRok1tNMO7TjXUjvNcYIUzh+Iu9TAl1zi3lpamxu
         OZHamJPF6Nni2XE0jTdD/kZ3XEX9YWhHr9PvuCgGYtf7KlrhGbvuBvCqDkU1R69MakeI
         PX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZjqAwYkyVBtKwnsvvvt6oxJ5WZdsbJ3RRH1d/6MZK/k=;
        fh=OFle2CS3VNisdCAgSRXUV24N3cCDSB7jOnOizepy1to=;
        b=Q0V8839QFLT8tw1btniAhTY9sDvhKpAfcfFzWO77DHj0oN2C4onGon6WNc4uSeTnma
         5+G1HMRu9yy96z2d+/Kax1FoKQw2GsHgh3qiMrA3U1Tr1y2dw+25Mt+yS+fT3bDwcQsy
         0dGcb04VVP+BHF5YNbDLhfscpqLm5HOAFzD+RXTsLWYGpY8BdlZEvvUGfLOsc/HL7ITi
         PLU6QmKV6sqdXvQuLerWUVPwWOyb2Klc1bBiAEKr19FqukLB4abSSyUYov6bj8Mu66hi
         1elRsZoZuAqcBrB94rPpgXlt6nk0XL8L8UpzAVrbKzJBXD2RfJqM5Lbzwt9EUf5h12s4
         Ac2g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790616632; x=1791221432; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjqAwYkyVBtKwnsvvvt6oxJ5WZdsbJ3RRH1d/6MZK/k=;
        b=L8EN/spFYcmi7f2447w/3GWS7tguGSa7UiIgGX3ucgwwysZbn2126WeMyr87FlKLKp
         oVOim1fA4a4CegbXpxh7+YaiO7lK3kHlNkF3OzbFCTBjp9dD8oK0wMKb82LdwRdbr7i6
         yRaOiBYyhrD7DMUjOth0U4zpB4shPFu6HzvSXHz5J8suN8faoDmEUHUiaqioonmKQUiv
         BmVj3oT2Qq0bfqTPTLz7ra88HGlYDAx7v0a4zDTqqvPcbBP8Y18SsjeoVYTLTZoSidlQ
         TVSADt8UZB4WWkfK+by0UuxpaKOoBK6xDWV0B1f81OZsg2bU+jWQuTaQeM1b9uNCDCHz
         Y8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616632; x=1791221432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZjqAwYkyVBtKwnsvvvt6oxJ5WZdsbJ3RRH1d/6MZK/k=;
        b=FXsH/mNaKUNw03PYWfrxNCOzzd/GVK0aszU5A4+FNRIGFe9BR2yEAJHyA6FOkpzvu5
         RZUrMnbmPEKjM16fNNGH1ySHtwqtH4hqSusjY2bREbnzydfxByp0Jmg2me+qAuncGwrn
         v2q7Qhi/mLipnK7fSl0Px40NzF/fwcIthjP5Da9G63htYAaAhgRmL3XUGSejCsFaX9kP
         YpGr0qJ73KVKyc/PIIgFEgnE7TMwm9emC0yhjG8EEX2ZAyhkmBRS41XkMBmlrc1BL46b
         eMcd+1tHhfCu/arRcjTjmCEY9Uhy2hkxhz0uoFaQD2CbK+3Hc/Xo68omEv/oicR62bIw
         FGHw==
X-Gm-Message-State: AFq9FYKKRS7rBZzAzL6tw2IBzVUe0p7V2UfIdUNZXiJckdDBK3XUzKrR
	9HDvpAp2nqggj3f5+Ix+BJ/hV3r97fFZRYtSq2Em1MG5gr6Qlg9dQf690mfLGREKsxW3N+utwKi
	CUyV7+vaCrANEhUmmpHcgoZhQGgF7bfPU40+78k4=
X-Gm-Gg: AYBFou1LVdmrNs9CZmu5J3VK57lAWAOCEPJS2ih3lKCHmRyfkaJLcuaHZEid0UJcrzw
	nH5gqwAiGSRslt+7ZnXikInVLXaFbUc2U8OFdlNzdxID9trE0VmQ4T+8lK6fXqKWQLfyvqgDFjM
	UZHyOTS7cPrxgkRxLWq0WMoB54xpgIFzMBuUGMoypOD329ugm1PugDyzRSC1Egg8JlW044ZpinV
	t0YRXiDlUdWpPWQwn9hVoyml3U39Y7AAsoHS101burfoGNCxiRTyxqY0BAcOd1fOFXrT09lRaTz
	3RmI5Ber/RLMe3l4cIFSHQhW+P3li6NVzlQSKBybYKX1wH342+Zyom+XDnmbQLS6mj1zfbLymO7
	L7sid7+11jcQ7JIBmlgC2MFPwcBczMJPfu99wlM8RNnvKUZydpD34z8r4R2cUVwhQn/zHKTQKbr
	25s7HLTjYVh7lwPhcalAvjjW36IZRFf4UTOtVmAAwuCkTFTmLkOJE28oJ4etB7EghSK6xz7X5uK
	q0mmcyfwykRwVzaCALkcsdIdc1JS9COIwevmtMWXhwDLb3eVE+xPiPiTDh++g1c6O5qoLq6ZwAN
	xD5upoHj
X-Received: by 2002:a05:690e:1408:b0:675:3f33:b183 with SMTP id
 956f58d0204a3-6753f33c2aemr2373450d50.24.1790616631813; Mon, 28 Sep 2026
 10:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260928092140.2252231-2-alex.kiernan@gmail.com> <20260928092140.2252231-4-alex.kiernan@gmail.com>
In-Reply-To: <20260928092140.2252231-4-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Sep 2026 10:30:05 -0700
X-Gm-Features: AclHuK819YTGknCTbo4oHTKkjosWYSglHTMsvEbmoHmTcaKxud4AvRgsbZCuB4U
Message-ID: <CAMKF1soRHUQH11fLC9+Dk4aktcT7+wBGASRNX_7Jzhoq9DQ+cA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-varlink: add recipe
To: alex.kiernan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000044ac50065c8e6c24"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130445

--00000000000044ac50065c8e6c24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can these tests be make to run as part of ptest image framework in this
layer e.g. Can I execute it as part of meta-python-image-ptest-all

On Mon, Sep 28, 2026 at 2:22=E2=80=AFAM Alex Kiernan via lists.openembedded=
.org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:

> Reference Python Varlink binding. Fetched from git as 32.1.0 was never
> published to PyPI (latest there is 31.0.0 from 2021).
>
> AI-Generated: Claude Opus 5 (Claude Code)
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  .../python/python3-varlink_32.1.0.bb          | 27 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-varlink_32.1.0.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index 9d07fc44e27a..f84941daf08b 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -440,6 +440,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>      python3-ujson \
>      python3-unidiff \
>      python3-uritemplate \
> +    python3-varlink \
>      python3-vcversioner \
>      python3-versioneer \
>      python3-versiontools \
> diff --git a/meta-python/recipes-devtools/python/python3-varlink_32.1.0.b=
b
> b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
> new file mode 100644
> index 000000000000..8c532371d0a2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Python implementation of the Varlink protocol"
> +HOMEPAGE =3D "https://github.com/varlink/python"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c29e"
> +
> +# 32.1.0 is not published on PyPI
> +SRC_URI =3D "git://
> github.com/varlink/python.git;protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "8b3ba4e8206b098c524f538036a941b47797840d"
> +
> +inherit python_setuptools_build_meta
> +
> +# Keep the bundled test suite, and its python3-unittest dependency,
> separate
> +PACKAGES =3D+ "${PN}-tests"
> +FILES:${PN}-tests =3D "${PYTHON_SITEPACKAGES_DIR}/varlink/tests"
> +RDEPENDS:${PN}-tests =3D "${PN} python3-unittest"
> +
> +RDEPENDS:${PN} =3D "\
> +    python3-core \
> +    python3-datetime \
> +    python3-io \
> +    python3-json \
> +    python3-netclient \
> +    python3-netserver \
> +    python3-shell \
> +"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130428):
> https://lists.openembedded.org/g/openembedded-devel/message/130428
> Mute This Topic: https://lists.openembedded.org/mt/121468544/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000044ac50065c8e6c24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can these tests be make to run as part of ptest image fram=
ework in this layer e.g. Can I execute it as part of=C2=A0meta-python-image=
-ptest-all</div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 2026 at 2:22=E2=80=AFAM Ale=
x Kiernan via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;alex.kiernan=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Reference Python Varlink binding. Fetch=
ed from git as 32.1.0 was never<br>
published to PyPI (latest there is 31.0.0 from 2021).<br>
<br>
AI-Generated: Claude Opus 5 (Claude Code)<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 1=
 +<br>
=C2=A0.../python/<a href=3D"http://python3-varlink_32.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-varlink_32.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 27 +++++++++++++++++++<br>
=C2=A02 files changed, 28 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-varlink_32.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-varlink_32.1.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index 9d07fc44e27a..f84941daf08b 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -440,6 +440,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-ujson \<br>
=C2=A0 =C2=A0 =C2=A0python3-unidiff \<br>
=C2=A0 =C2=A0 =C2=A0python3-uritemplate \<br>
+=C2=A0 =C2=A0 python3-varlink \<br>
=C2=A0 =C2=A0 =C2=A0python3-vcversioner \<br>
=C2=A0 =C2=A0 =C2=A0python3-versioneer \<br>
=C2=A0 =C2=A0 =C2=A0python3-versiontools \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
varlink_32.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-varlink_32.=
1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
varlink_32.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-varlink_32.=
1.0.bb</a><br>
new file mode 100644<br>
index 000000000000..8c532371d0a2<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-varlink=
_32.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-varlink_32.1.0.bb<=
/a><br>
@@ -0,0 +1,27 @@<br>
+SUMMARY =3D &quot;Python implementation of the Varlink protocol&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/varlink/python" rel=3D"no=
referrer" target=3D"_blank">https://github.com/varlink/python</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b=
21ef20c29e&quot;<br>
+<br>
+# 32.1.0 is not published on PyPI<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/varlink/python.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github=
.com/varlink/python.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;8b3ba4e8206b098c524f538036a941b47797840d&quot;<br>
+<br>
+inherit python_setuptools_build_meta<br>
+<br>
+# Keep the bundled test suite, and its python3-unittest dependency, separa=
te<br>
+PACKAGES =3D+ &quot;${PN}-tests&quot;<br>
+FILES:${PN}-tests =3D &quot;${PYTHON_SITEPACKAGES_DIR}/varlink/tests&quot;=
<br>
+RDEPENDS:${PN}-tests =3D &quot;${PN} python3-unittest&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 =C2=A0 python3-core \<br>
+=C2=A0 =C2=A0 python3-datetime \<br>
+=C2=A0 =C2=A0 python3-io \<br>
+=C2=A0 =C2=A0 python3-json \<br>
+=C2=A0 =C2=A0 python3-netclient \<br>
+=C2=A0 =C2=A0 python3-netserver \<br>
+=C2=A0 =C2=A0 python3-shell \<br>
+&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130428): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130428" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130428</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121468544/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121468544/1997914</a><br>
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

--00000000000044ac50065c8e6c24--

