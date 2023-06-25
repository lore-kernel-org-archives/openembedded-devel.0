Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B840CC001B0
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 10:53:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9288.1687690421869910985
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 03:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V0hI23n4;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3112d202363so2622983f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687690420; x=1690282420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RoETEraSpYPx8+tNqL9zgKoLTG253+AJKWf/5dS71PM=;
        b=V0hI23n43eVJANS9OZZByCAxLX5cyHOjWjjkDHN6Loy+YvF6vkvDxu2av81InAclQX
         8R9CCv4XK6nIEDNqXTiPpBiiE7CBax2Db1VwCM8/njk1zItcVZHuiJdSh6srb20qpt8p
         h4YjodAjIb45HNHvACj2DRMHN9Wq4j4WiconOt3Aq8dQD0z0pKBpFkJ3XA+CtZBV8kPF
         RCsOIapezMH/uvHGhDTEtRO1/4C545juVGhjjpCTofpSfu4bpEq1IipGQOrxbimCq9oD
         5boUkClt38KwQiw2sVrsfK9IXOBUxnN2IKIznnSU9IuKTnd8Ev9AAK/d14OBTcFpYBjb
         Su1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687690420; x=1690282420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoETEraSpYPx8+tNqL9zgKoLTG253+AJKWf/5dS71PM=;
        b=LozanimemVi6KvSwHVmus0QiZk7u5RWX2FL6EjHeb4b7PA7jwNKuIp5BdazYWvR0jO
         0FhCnqv1i9NTK/EFxYh5d7agQTsjUmw2xSiK7jj3FAAZLt/KMUQVVdtrHQv+KlVyE3jc
         yKhHsJ9VTBllYd6pEao9aK4fi7hEpd0SqurRVXvVm1Yl01zKQ4PhUlH+oeN5mc0/BEqS
         G6rC6fRmUIZ/4eKawvAsrX2cKCoH1aicTtf2UNB3vppsB+38TQPqKDIsZsQ0CM9AeysM
         7CG6Ta2S5wckHoHfaYRACVQ8Y3IitnhiTI6FaHIhU2kFgbE6o2Aiu25E3QPFWUVXpSP9
         /KWg==
X-Gm-Message-State: AC+VfDxZzA0Sd79GvyZh+wkrQ7DVTjndH6EJxVq6uYuB+sXweglmx/eq
	l2uLl8OG0uwrkMpBQB6r9qthvrYQtKwyeNzTl8M=
X-Google-Smtp-Source: ACHHUZ7AtwUdIS//hqdPJkXd4o2RRdKpv1h/E/+fjl2AwjO8BspgteLEpCgG0davMHoGpZ6cUPCEXt9YzQ+/HXnB/bs=
X-Received: by 2002:a5d:4410:0:b0:30f:cd69:dd50 with SMTP id
 z16-20020a5d4410000000b0030fcd69dd50mr7945484wrq.48.1687690419880; Sun, 25
 Jun 2023 03:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230619182559.104504-1-beniaminsandu@gmail.com>
In-Reply-To: <20230619182559.104504-1-beniaminsandu@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 25 Jun 2023 12:53:28 +0200
Message-ID: <CA+chaQcgWg7AJ7kk62HE2xTS6k3sORmgb4OTJmhqcwyN+ZqmPQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add support for v3.x
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f7c63905fef20b26"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 10:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103560

--000000000000f7c63905fef20b26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 8:26=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com>
wrote:

> Version 3.4.0 adds a lot of improvements and fixes (a notable one
> being initial support for PKCS7 CMS), but since this is a pretty
> big jump, let's keep both versions for a while, so the v2.x users
> can upgrade to 3.x in a timely manner if needed.
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  .../mbedtls/mbedtls_3.4.0.bb                  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/
> mbedtls_3.4.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.b=
b
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> new file mode 100644
> index 000000000..ebc6ba573
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb


....

+# Needs crypto instructions on aarch64
> +TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
>

This assumes too much about TUNE_CCARGS_MARCH_OPTS structure and in some
multilib builds I'm seeing:

# $TUNE_CCARGS_MARCH_OPTS [4 operations]
#   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:19
#     [_defaultval] ""
#   postdot oe-core/meta/conf/machine/include/arm/feature-arm-neon.inc:26
#     "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ],
'+fp', '', d)}"
#   postdot oe-core/meta/conf/machine/include/arm/feature-arm-simd.inc:5
#     "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
#   :append[aarch64] meta-oe/meta-networking/recipes-connectivity/mbedtls/
mbedtls_3.4.0.bb:45
#     "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
# pre-expansion value:
#   "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ],
'+fp', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '',
d)}${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
TUNE_CCARGS_MARCH_OPTS=3D"+crypto"

And empty TUNE_CCARGS_MARCH, because TUNE_FEATURES has only aarch64

# $TUNE_CCARGS_MARCH [4 operations]
#   postdot oe-core/meta/conf/machine/include/arm/arch-armv7a.inc:6
#     "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv7-a',
'', d)}"
#   postdot oe-core/meta/conf/machine/include/arm/arch-armv6.inc:5
#     "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6', ''=
,
d)}"
#   postdot oe-core/meta/conf/machine/include/arm/arch-armv5.inc:5
#     "${@bb.utils.contains('TUNE_FEATURES', 'armv5', '
-march=3Darmv5t${ARMPKGSFX_DSP}', '', d)}"
#   postdot oe-core/meta/conf/machine/include/arm/arch-armv4.inc:5
#     "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
-march=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
# pre-expansion value:
#   "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv7-a', '=
',
d)}${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6', '',
d)}${@bb.utils.contains('TUNE_FEATURES', 'armv5', '
-march=3Darmv5t${ARMPKGSFX_DSP}', '',
d)}${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
-march=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
TUNE_CCARGS_MARCH=3D""

causing do_configure failure:

aarch64-oe-linux-gcc: warning: +crypto: linker input file unused because
linking not done
aarch64-oe-linux-gcc: error: +crypto: linker input file not found: No such
file or directory
ninja: build stopped: subcommand failed.

 +
> +# For now the only way to enable PSA is to explicitly pass a -D via CFLA=
GS
> +CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', '
> -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> +
> +PROVIDES +=3D "polarssl"
> +RPROVIDES:${PN} =3D "polarssl"
> +
> +PACKAGES =3D+ "${PN}-programs"
> +FILES:${PN}-programs =3D "${bindir}/"
> +
> +ALTERNATIVE:${PN}-programs =3D "hello"
> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +CVE_PRODUCT =3D "mbed_tls"
> +
> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
> +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
> +# Fix merged upstream
> https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a5331=
0adf73a86c
> +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
> +
> +# Strip host paths from autogenerated test files
> +do_compile:append() {
> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> +}
> +
> +# Export source files/headers needed by Arm Trusted Firmware
> +sysroot_stage_all:append() {
> +       sysroot_stage_dir "${S}/library"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> +       sysroot_stage_dir "${S}/include"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> +}
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103441):
> https://lists.openembedded.org/g/openembedded-devel/message/103441
> Mute This Topic: https://lists.openembedded.org/mt/99629175/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f7c63905fef20b26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jun 19, 2023 at 8:26=E2=80=AFPM B=
eniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com">beniaminsandu@=
gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Version 3.4.0 adds a lot of improvement=
s and fixes (a notable one<br>
being initial support for PKCS7 CMS), but since this is a pretty<br>
big jump, let&#39;s keep both versions for a while, so the v2.x users<br>
can upgrade to 3.x in a timely manner if needed.<br>
<br>
Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com=
" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_3.4.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mbedtls_3.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 85 +++++++++++++++++++<br>
=C2=A01 file changed, 85 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/mbedtls/<a hr=
ef=3D"http://mbedtls_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls=
_3.4.0.bb</a><br>
<br>
diff --git a/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http:/=
/mbedtls_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3.4.0.bb</a=
> b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbedtls_=
3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3.4.0.bb</a><br>
new file mode 100644<br>
index 000000000..ebc6ba573<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbedtl=
s_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3.4.0.bb</a></bloc=
kquote><div>=C2=A0</div><div>....</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">+# Needs crypto instructions on aarch64<br>
+TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D &quot;${@bb.utils.contains(&#39;=
TUNE_FEATURES&#39;, &#39;crypto&#39;, &#39;&#39;, &#39;+crypto&#39;, d)}&qu=
ot;<br></blockquote><div><br></div><div>This assumes too much about TUNE_CC=
ARGS_MARCH_OPTS structure and in some multilib builds I&#39;m seeing:</div>=
<div><br></div><div># $TUNE_CCARGS_MARCH_OPTS [4 operations]</div># =C2=A0 =
set oe-core/meta/conf/machine/include/arm/arch-arm.inc:19<br># =C2=A0 =C2=
=A0 [_defaultval] &quot;&quot;<br># =C2=A0 postdot oe-core/meta/conf/machin=
e/include/arm/feature-arm-neon.inc:26<br># =C2=A0 =C2=A0 &quot;${@bb.utils.=
contains(&#39;TUNE_FEATURES&#39;, [ &#39;vfpv3d16&#39;, &#39;vfpv5spd16&#39=
; ], &#39;+fp&#39;, &#39;&#39;, d)}&quot;<br># =C2=A0 postdot oe-core/meta/=
conf/machine/include/arm/feature-arm-simd.inc:5<br># =C2=A0 =C2=A0 &quot;${=
@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;simd&#39;, &#39;+simd&#39;=
, &#39;&#39;, d)}&quot;<br># =C2=A0 :append[aarch64] meta-oe/meta-networkin=
g/recipes-connectivity/mbedtls/<a href=3D"http://mbedtls_3.4.0.bb:45">mbedt=
ls_3.4.0.bb:45</a><br># =C2=A0 =C2=A0 &quot;${@bb.utils.contains(&#39;TUNE_=
FEATURES&#39;, &#39;crypto&#39;, &#39;&#39;, &#39;+crypto&#39;, d)}&quot;<b=
r># pre-expansion value:<br># =C2=A0 &quot;${@bb.utils.contains(&#39;TUNE_F=
EATURES&#39;, [ &#39;vfpv3d16&#39;, &#39;vfpv5spd16&#39; ], &#39;+fp&#39;, =
&#39;&#39;, d)}${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;simd&#39;=
, &#39;+simd&#39;, &#39;&#39;, d)}${@bb.utils.contains(&#39;TUNE_FEATURES&#=
39;, &#39;crypto&#39;, &#39;&#39;, &#39;+crypto&#39;, d)}&quot;<br>TUNE_CCA=
RGS_MARCH_OPTS=3D&quot;+crypto&quot;</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">And empty TUNE_CCARGS_MARCH, because TUNE_FE=
ATURES has only aarch64</div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote"># $TUNE_CCARGS_MARCH [4 operations]<br># =C2=A0 postdot o=
e-core/meta/conf/machine/include/arm/arch-armv7a.inc:6<br># =C2=A0 =C2=A0 &=
quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv7a&#39;, &#39; =
-march=3Darmv7-a&#39;, &#39;&#39;, d)}&quot;<br># =C2=A0 postdot oe-core/me=
ta/conf/machine/include/arm/arch-armv6.inc:5<br># =C2=A0 =C2=A0 &quot;${@bb=
.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39; -march=3Dar=
mv6&#39;, &#39;&#39;, d)}&quot;<br># =C2=A0 postdot oe-core/meta/conf/machi=
ne/include/arm/arch-armv5.inc:5<br># =C2=A0 =C2=A0 &quot;${@bb.utils.contai=
ns(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39; -march=3Darmv5t${ARMPKGS=
FX_DSP}&#39;, &#39;&#39;, d)}&quot;<br># =C2=A0 postdot oe-core/meta/conf/m=
achine/include/arm/arch-armv4.inc:5<br># =C2=A0 =C2=A0 &quot;${@bb.utils.co=
ntains(&#39;TUNE_FEATURES&#39;, &#39;armv4&#39;, &#39; -march=3Darmv4${ARMP=
KGSFX_THUMB}&#39;, &#39;&#39;, d)}&quot;<br># pre-expansion value:<br># =C2=
=A0 &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv7a&#39;, &=
#39; -march=3Darmv7-a&#39;, &#39;&#39;, d)}${@bb.utils.contains(&#39;TUNE_F=
EATURES&#39;, &#39;armv6&#39;, &#39; -march=3Darmv6&#39;, &#39;&#39;, d)}${=
@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39; -march=
=3Darmv5t${ARMPKGSFX_DSP}&#39;, &#39;&#39;, d)}${@bb.utils.contains(&#39;TU=
NE_FEATURES&#39;, &#39;armv4&#39;, &#39; -march=3Darmv4${ARMPKGSFX_THUMB}&#=
39;, &#39;&#39;, d)}&quot;<br>TUNE_CCARGS_MARCH=3D&quot;&quot;<br></div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">causing do_con=
figure failure:</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">aarch64-oe-linux-gcc: warning: +crypto: linker input file unused =
because linking not done<br>aarch64-oe-linux-gcc: error: +crypto: linker in=
put file not found: No such file or directory<br>ninja: build stopped: subc=
ommand failed.</div><div class=3D"gmail_quote"><br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">=C2=A0+<br>
+# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS=
<br>
+CFLAGS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;psa&#39;, &#39; -DMBEDTLS_USE_PSA_CRYPTO&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
+PROVIDES +=3D &quot;polarssl&quot;<br>
+RPROVIDES:${PN} =3D &quot;polarssl&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-programs&quot;<br>
+FILES:${PN}-programs =3D &quot;${bindir}/&quot;<br>
+<br>
+ALTERNATIVE:${PN}-programs =3D &quot;hello&quot;<br>
+ALTERNATIVE_LINK_NAME[hello] =3D &quot;${bindir}/hello&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+CVE_PRODUCT =3D &quot;mbed_tls&quot;<br>
+<br>
+# Fix merged upstream <a href=3D"https://github.com/Mbed-TLS/mbedtls/pull/=
5310" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mbed-TLS/mbed=
tls/pull/5310</a><br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2021-43666&quot;<br>
+# Fix merged upstream <a href=3D"https://github.com/Mbed-TLS/mbedtls/commi=
t/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a=
53310adf73a86c</a><br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2021-45451&quot;<br>
+<br>
+# Strip host paths from autogenerated test files<br>
+do_compile:append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${S}/++g&#39; ${B}/tests/*.c 2&gt=
;/dev/null || :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${B}/++g&#39; ${B}/tests/*.c 2&gt=
;/dev/null || :<br>
+}<br>
+<br>
+# Export source files/headers needed by Arm Trusted Firmware<br>
+sysroot_stage_all:append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/library&quot; &quo=
t;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/include&quot; &quo=
t;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include&quot;<br>
+}<br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}=
/tests/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests/ -type f -name &qu=
ot;*.c&quot; -delete<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/=
tests/<br>
+}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103441): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103441" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103441</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99629175/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99629175/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f7c63905fef20b26--

