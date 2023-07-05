Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F338FEB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:37:24 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.1341.1688578644025707910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Hp14JjIG;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-440c14d6a5eso2147807137.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688578643; x=1691170643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ipfUiKVDaGRMkjOIyhMiPAfQ08FxkGqKMwe+2VnLc=;
        b=Hp14JjIGpIBLAmvMb54Q/oRXzA2w43S/kThUU8JzF1yV7V6/AJitJXoB8ES8p9poas
         9OcDFwTvJS1VyxV3tJIIYRDd4eNaLJR8JDii/zgRCV8zCb+vMvzGHR54ibzpVN4kM445
         aygV0lCa8kOjACcP71FS9OzaHKbKNRkxrscu1lSF1B7affzj+UZ83iQFeUHIaOJpy6LT
         Vt86MlnMKzm8rxfrJoZyLHxXdK+Fs+9EhagBHOG0Sh7yjQIoGU/7GnPaSY0wtRbzfo+n
         ijbIWupsjUxtuvrJHV6Pgo+bpUMyBJa77lBr16J0NuTpIa0kQW83S/AI+zYtvkXSynp8
         4uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688578643; x=1691170643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/ipfUiKVDaGRMkjOIyhMiPAfQ08FxkGqKMwe+2VnLc=;
        b=Zxqg+BwNeCC1OCVNA2BYUDUd6yjACwYkFnw+2qHn49X90vMIZPSomBU8RokgalGVbC
         W9vaYtZYDTwCDztuE6GSMqxDAQ6vtJZGq7OeDKGDx5V2QhOUI6pBM+dT5kFUAgHxY5/U
         02vNpcsjpU9PWOnZ5DznLKCqvUK3CINqmvzEwbMrNBJdbVG86w+wD995MTrbxeboy8Ef
         fwYMIPmtfUKIzcg3BImWldvam+8552WWFClY8eUZT0db2L60uePWevyTAdWGAH0Ga6GD
         PZiCuriaFSJSKAdqcjYC1xIwqa04b4CNs5+rgzDjxiSEmfgQZSYaZ33SeDIC1zgKdRi/
         XrDw==
X-Gm-Message-State: ABy/qLZVzNB2Sxe6s4Ohw0MWE8FM+gKBM5zHvhA8qw82427a6pHIFLQ8
	aAuVdSgLIqsK+ubwgSqcBmYkmKxDw5XcSMbM4JQ=
X-Google-Smtp-Source: APBJJlE57WQUkfO6xNGDoNtoestsvCFbCk7a8CzjnhmSHlKTe9OKqf7l7NnbPjkBYOnotU8Qbmk+b609y0RLpE+PTSg=
X-Received: by 2002:a05:6102:282a:b0:443:8549:163e with SMTP id
 ba10-20020a056102282a00b004438549163emr7629713vsb.34.1688578641998; Wed, 05
 Jul 2023 10:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230705172550.3371930-1-raj.khem@gmail.com>
In-Reply-To: <20230705172550.3371930-1-raj.khem@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 5 Jul 2023 18:37:11 +0100
Message-ID: <CANPvuRmCb3i2Z6VWTt9pgwbhMYWa0Q+oRnMBUpuMe-66r67xNQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-grpcio-tools: Upgrade to 1.56.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000021b8cd05ffc0da70"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103674

--00000000000021b8cd05ffc0da70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Looks like the old version was not deleted.

Jose

Khem Raj <raj.khem@gmail.com> escreveu no dia quarta, 5/07/2023 =C3=A0(s) 1=
8:25:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...f-Disable-musttail-attribute-on-mips.patch |  8 ++++----
>  .../python/python3-grpcio-tools_1.56.0.bb     | 19 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 4 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-grpcio-tools_1.56.0.bb
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-=
Disable-musttail-attribute-on-mips.patch
> b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-=
Disable-musttail-attribute-on-mips.patch
> index 8b13d7ae21..8c70b2b6a6 100644
> ---
> a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-=
Disable-musttail-attribute-on-mips.patch
> +++
> b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-=
Disable-musttail-attribute-on-mips.patch
> @@ -14,11 +14,11 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>
>  --- a/third_party/protobuf/src/google/protobuf/port_def.inc
>  +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
> -@@ -255,6 +255,7 @@
> +@@ -338,6 +338,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125
>   #error PROTOBUF_TAILCALL was previously defined
>   #endif
> - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
> + #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) &&      \
>  +    !defined(__mips__) &&                                        \
> -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
> -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
> +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__) && \
>       !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
> diff --git a/meta-python/recipes-devtools/python/
> python3-grpcio-tools_1.56.0.bb b/meta-python/recipes-devtools/python/
> python3-grpcio-tools_1.56.0.bb
> new file mode 100644
> index 0000000000..eb1994d7ce
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Google gRPC tools"
> +HOMEPAGE =3D "http://www.grpc.io/"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D7145f7cdd263359b62d342a0=
2f005515"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS +=3D "${PYTHON_PN}-grpcio"
> +
> +SRC_URI +=3D
> "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
> +            file://0001-protobuf-Disable-musttail-attribute-on-mips.patc=
h
> \
> +            "
> +SRC_URI[sha256sum] =3D
> "39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39c287d7d61c5057f48b8"
> +
> +RDEPENDS:${PN} =3D "${PYTHON_PN}-grpcio"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103668):
> https://lists.openembedded.org/g/openembedded-devel/message/103668
> Mute This Topic: https://lists.openembedded.org/mt/99969391/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000021b8cd05ffc0da70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Khem,<br><br>Looks like the old version was not de=
leted.<div><br></div><div>Jose</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia quarta, 5/07/2023 =
=C3=A0(s) 18:25:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...f-Disable-musttail-attribute-on-mips.patch |=C2=A0 8 ++++----<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio-tools_1.56.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-grpcio-tools_1.56.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 19 +++++++++++++++++++<br>
=C2=A02 files changed, 23 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-grpcio-tools_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-grpcio-tools_1.56.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-=
protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-dev=
tools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-=
on-mips.patch<br>
index 8b13d7ae21..8c70b2b6a6 100644<br>
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobu=
f-Disable-musttail-attribute-on-mips.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobu=
f-Disable-musttail-attribute-on-mips.patch<br>
@@ -14,11 +14,11 @@ Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy=
@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
=C2=A0--- a/third_party/protobuf/src/google/protobuf/port_def.inc<br>
=C2=A0+++ b/third_party/protobuf/src/google/protobuf/port_def.inc<br>
-@@ -255,6 +255,7 @@<br>
+@@ -338,6 +338,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125<br>
=C2=A0 #error PROTOBUF_TAILCALL was previously defined<br>
=C2=A0 #endif<br>
- #if __has_cpp_attribute(clang::musttail) &amp;&amp; !defined(__arm__) &am=
p;&amp; \<br>
+ #if __has_cpp_attribute(clang::musttail) &amp;&amp; !defined(__arm__) &am=
p;&amp;=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0+=C2=A0 =C2=A0 !defined(__mips__) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0!defined(_ARCH_PPC) &amp;&amp; !defined(__wasm__) &amp=
;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0!(defined(_MSC_VER) &amp;&amp; defined(_M_IX86)) &amp;=
&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0!defined(_ARCH_PPC) &amp;&amp; !defined(__wasm__) &amp=
;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0!(defined(_MSC_VER) &amp;&amp; defined(_M_IX86)) &amp;=
&amp; !defined(__i386__) &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 !(defined(__NDK_MAJOR__) &amp;&amp; __NDK_MAJOR &lt;=
=3D 24)<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
grpcio-tools_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio=
-tools_1.56.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-grpcio-tools_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-grpcio-tools_1.56.0.bb</a><br>
new file mode 100644<br>
index 0000000000..eb1994d7ce<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-grpcio-=
tools_1.56.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-grpcio-tools_=
1.56.0.bb</a><br>
@@ -0,0 +1,19 @@<br>
+DESCRIPTION =3D &quot;Google gRPC tools&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.grpc.io/" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.grpc.io/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;endline=3D8;md5=
=3D7145f7cdd263359b62d342a02f005515&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+DEPENDS +=3D &quot;${PYTHON_PN}-grpcio&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://0001-setup.py-Do-not-mix-C-and-C-compiler-option=
s.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-protobuf-Disable-mus=
ttail-attribute-on-mips.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI[sha256sum] =3D &quot;39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39=
c287d7d61c5057f48b8&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-grpcio&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103668): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103668" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103668</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99969391/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99969391/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--00000000000021b8cd05ffc0da70--

