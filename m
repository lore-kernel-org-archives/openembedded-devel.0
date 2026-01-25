Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79036E63C82
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 01:57:39 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32023.1769306257654704933
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 17:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XldQqEuR;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7942b9663f8so30345617b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 17:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769306257; cv=none;
        d=google.com; s=arc-20240605;
        b=f9WstQLbaMlrsqS8/HQdvTCbXQGUEWzukiA5fl3kgY4D6A2pPQ/YHoYqIA7PwXtMru
         hHpz87NvhOQyI1Em9mjdQHDhBRVVyIdlBRx86jk/F8chk82Jnn1Ck1VsHPOjymBxa+u4
         QWUoOx1Vr5CgzRpWWJBjsQKif5ZsLVSOr/o/PA1AmK9aS+oimQ1o3wm+D+5IPVNY+JD1
         EMGshenU0frH0Fs5WbV3f7oWuEsM/6r3gHOO+eA/ysvLxlETXQxjxYwPrJ98j5DBqp8t
         Mnv4U/ZbmsDNW1xeDkH9oRM0mMMxOCPGkasDHIauSnK7GqZ6lPZJjqM61osMhKoCZ+Ca
         GwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c1mouIgEf37kYgiP8Uizger9rTy1yLDDxFYuDQ49VBQ=;
        fh=RnZMXDUlwXY8UgMJsCy3860tY0uphmLPDqFPKV9t5MY=;
        b=LlaeDgq893TPlwLJLWo8tUdf8DID5Y+9272yGzVP/YkOrOAh444actcO01IX5x6k0V
         xyxNr1mfSmCjGg9ofgEhIcD+UFRrhi5y4iKCSmTweK9qU/NRJpEE8IfJCTnUTvjakSLT
         m+koLNT+gIj9noghYHkuAB2FEtv0ce1PHGeK/IsasNWeGa3H5ig61Sq47+Ll6MiBFJUJ
         4WphWhvY30XTco4B+IB+C3vzuYuc16+hm7l22SyMvShkG0/Do7ylcPwiF2UqnOpx0G+3
         weURsL4pBILpbGr/8Ns3WydUBoC836CFJKvm62iA5almMVI+zcmVmP3LL9R7WFJTQnp8
         ds/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769306257; x=1769911057; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c1mouIgEf37kYgiP8Uizger9rTy1yLDDxFYuDQ49VBQ=;
        b=XldQqEuRqrEg91KkZJitZxcISxTlJ8t/P7as372kyf8YS1Z/LwAtfqatKo7kVQHIIW
         z8JrSRsIo8K0hF7nnWPEC4wkHRTEZ+cNcoJr1ww/uW1b1tvpM2AFt4RVE/O4XYV498WM
         hidHigBF03dy9qCSCAte40D4dGbg2k11Qw2XGoXzgbaol8WD3yeeBkEzLiEHUnEpH4Qn
         BcEG03NlTLXYCZinH0HNBJbQdTqWutsuyFnRWMsNpMMoHicpyPrhqSSfaI/dp4Bu3McM
         Cc3UBQSRfNCmxiBU0LeJOCusE4un3THN1FTSYKhmUZ543oodHN60G+M3vSD0Oyd1isfx
         gJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769306257; x=1769911057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1mouIgEf37kYgiP8Uizger9rTy1yLDDxFYuDQ49VBQ=;
        b=ENxMNzjCWYxpxIww+z5/btEaiitKqdu69vzi26YohJX6uWxDmBXYf8+C4eecnmyJTP
         eY5q6rmUEqcRCFl5j5P9dhjNud6ZjrNuJR/JO0ffMV4sIK2ZTe1ujw6/Xgke+x+L++jy
         hC3GzgvxPo5PBlU2bIIuwvrKYAjUCoy/BwXZHfuLxwKalOes+lysrstO/qoKFMIINQb5
         D3uAcUH5soz41j2ILWA6JZXNWYzVbblqrvf2qIVtHVTKS+xZ79m22ZHxJaubOyVnZrx4
         pz1Zf7JyN9E7oF5E+46PKJv1CmCO//3hSW0k/y9mYQBLSiJ2aHJiaBfFAhWZKvxkISk5
         npZw==
X-Gm-Message-State: AOJu0Yxpqv8CWW8el09YLD7zFAAoExo07vGFcUCAJU0KBamUBCBEsSmc
	kSqxCCrcqGbQh1vPHgwIm+J/0ks3ZU8pwfLxwF3REfKEdpOHvF9t8W/U/mNuEdNLibfWpRp4IUC
	+3etHBEw2eCkPQpPuaXlgelk8jSzsgryvh18Y
X-Gm-Gg: AZuq6aJ8DA5TGJoLoq1m6YLBMrsdpmJM+Ad7L1dw6yRarimQAVtBeEuBsnhHSjsF4qp
	ljEE1oTCzBXgvTK3j9TzY2vXQw/jyxYFM+3QPi0ijjk8ptipepT5NDFvuGW/Tl/MS2Xw9VgkD93
	4VVdmjgAoqLJ+AxVVEpw6I3qalb+m29YpNKVJAeeL70JudV/Sz09j2Rt0UGRTKpSM8cqA6zKSau
	+mIS0Hsl5cz/upi23V7r44yhTMOcKznwCRKNt985wJ9OFMLvlU7YlzGFICbUNSwPg2TCUX9vvBS
	0XfpK7erELLLeiyWWuxFKTVW28bylzIV7adhXX1zy8qC6c00YFoL7hZKIrPLAEmQExL4u/205MQ
	ZzGA1nNTQueBnttmppDpW+T/FxdJTSu/D7Whvsi/aWTs=
X-Received: by 2002:a05:690c:c513:b0:786:9817:edac with SMTP id
 00721157ae682-7945a9689b1mr3210717b3.43.1769306256687; Sat, 24 Jan 2026
 17:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20260123154842.1635662-2-frederikbraendstrup@gmail.com> <20260123154842.1635662-4-frederikbraendstrup@gmail.com>
In-Reply-To: <20260123154842.1635662-4-frederikbraendstrup@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jan 2026 17:57:10 -0800
X-Gm-Features: AZwV_QgXegWVp0fYV2dqcZQsnoQMEllTqLBsMFuq72rwp3p6kfG2qX5BAWArAaU
Message-ID: <CAMKF1sreHZhOxEsOwpy3+7Ljajy_jg=tGzZyZtGjxNgjfp-xtQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v1 2/2] liboauth2: Add recipe at 2.2.0
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000edc5d306492cb63c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 01:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123831

--000000000000edc5d306492cb63c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 7:49=E2=80=AFAM Frederik Br=C3=A6ndstrup via
lists.openembedded.org <frederikbraendstrup=3Dgmail.com@lists.openembedded.=
org>
wrote:

> ---
>  .../liboauth2/liboauth2_2.2.0.bb              | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
>
> diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> new file mode 100644
> index 0000000000..3067f7ea63
> --- /dev/null
> +++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "OAuth 2.x and OpenID Connect C library"
> +HOMEPAGE =3D "https://github.com/OpenIDC/liboauth2"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +
> +SRC_URI =3D "git://
> github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV=
}
> <http://github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv$%7BPV%7D>
> "
> +
> +PV =3D "2.2.0"
> +SRCREV =3D "12571b6d6568c2db7d5f080f60ecb55795c0db19"
> +
> +DEPENDS =3D "libpcre2 jansson libcheck curl openssl cjose apache2"
>

apache2 is part of meta-webserver layer and meta-oe does not depend on
meta-webserver but its other way around
maybe turn apache2 support into a packageconfig and keep it disabled by
default, if its a hard dependency then
move the recipe to meta-webserver layer.


> +
> +inherit pkgconfig autotools-brokensep
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[memcache] =3D
> "--with-memcache,--without-memcache,libmemcached"
> +PACKAGECONFIG[redis] =3D "--with-redis,--without-redis,hiredis"
> +PACKAGECONFIG[jq] =3D "--with-jq,--without-jq,jq"
> +PACKAGECONFIG[apache] =3D "--with-apache,--without-apache,apache2"
> +
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123785):
> https://lists.openembedded.org/g/openembedded-devel/message/123785
> Mute This Topic: https://lists.openembedded.org/mt/117419834/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000edc5d306492cb63c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 23,=
 2026 at 7:49=E2=80=AFAM Frederik Br=C3=A6ndstrup via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;frederikbraendstrup=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">---<br>
=C2=A0.../liboauth2/<a href=3D"http://liboauth2_2.2.0.bb" rel=3D"noreferrer=
" target=3D"_blank">liboauth2_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 20 +++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/liboauth2/<a href=3D"http:=
//liboauth2_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.=
bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_=
2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a> b/met=
a-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_2.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a><br>
new file mode 100644<br>
index 0000000000..3067f7ea63<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_2.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;OAuth 2.x and OpenID Connect C library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/OpenIDC/liboauth2" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/OpenIDC/liboauth2</a>&quo=
t;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2ee41112a44fe7014dce33e264=
68ba93&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/OpenIDC/liboauth2;pro=
tocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;t=
ag=3Dv${PV}</a>&quot;<br>
+<br>
+PV =3D &quot;2.2.0&quot;<br>
+SRCREV =3D &quot;12571b6d6568c2db7d5f080f60ecb55795c0db19&quot;<br>
+<br>
+DEPENDS =3D &quot;libpcre2 jansson libcheck curl openssl cjose apache2&quo=
t;<br></blockquote><div><br></div><div>apache2 is part of meta-webserver la=
yer and meta-oe does not depend on meta-webserver but its other way around<=
/div><div>maybe turn apache2 support into a packageconfig and keep it disab=
led by default, if its a hard dependency then</div><div>move the recipe to =
meta-webserver layer.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+<br>
+inherit pkgconfig autotools-brokensep<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[memcache] =3D &quot;--with-memcache,--without-memcache,libme=
mcached&quot;<br>
+PACKAGECONFIG[redis] =3D &quot;--with-redis,--without-redis,hiredis&quot;<=
br>
+PACKAGECONFIG[jq] =3D &quot;--with-jq,--without-jq,jq&quot;<br>
+PACKAGECONFIG[apache] =3D &quot;--with-apache,--without-apache,apache2&quo=
t;<br>
+<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123785): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123785" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123785</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117419834/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117419834/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000edc5d306492cb63c--

