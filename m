Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97E4EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 14:38:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12306.1687703886657273955
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 07:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T0tMwIRG;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-313e742a787so678472f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687703885; x=1690295885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e7RjD94ijqoqsm/9EWt4tJwPXVzWIcNG9ryCgZ5t5uM=;
        b=T0tMwIRGEBEZeE9yEm2pKuNfnwOTf0oV7+T4YcGlIxINoiEZxiakytJ4JFwDD/nAxF
         swLHX4ps1X1uKMUFJ+cgIuDBxWAQhc7qKGUHaPRFtt2hXQZL5JHSmesQ573d1sPXIgAF
         IE2sFv5UySnqp7KvdDAINXP89sZlpyo3NgSrsmBjKCX8pR6Fs6+NXlRdXlR1043NdHIT
         H0SEcuZbyN/o2zZdRz5D63RR9tuXqSEu3RFqPskJcTBgtwLpD98wJ69uhBv6t7ZkbyEQ
         Ob7aTiYioMFO8iOpTB/6uNkO7HhnWSNLs3oxhAYVjdSQ41RKSogjfS9plMvhPWjISz/w
         FFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687703885; x=1690295885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7RjD94ijqoqsm/9EWt4tJwPXVzWIcNG9ryCgZ5t5uM=;
        b=jR2pdpmXVBGtFJ0dHmQ1mGwbBh4Jcjp4wnu/x4jC9wxWChWlH4dseRlM4bfEIK0FdL
         TTsqaLVNBm/zDpw8dk8ruCzNwm9A8H5RVB3/HDtw3roeuhUNP8iMsRugtoVr49pPD7Ew
         U1EPhWFeBvAsP+hDTfTruPCQglLunzkeHAgcpwmwPs0vrET/P77m0iJ48oL1iaq4F/I8
         QXPR/VSI+V7q1YVAaW+P40bY2dUILlKy3fg4KyCeg3Nzwlv7k86O5bm444xRSEr80ysn
         HRJ58grs6nrU2xM+/jRH+A9s2/ZcAGcjs//f5UR8eembcyGyx2oGdqCo6PrVaGNmQNbs
         BmNg==
X-Gm-Message-State: AC+VfDzrHhBAvaXLpzSXd7u/TFhBVwd96Nlv0He05XFkoC/eoslGUHf+
	ef+AO0bwyLjB55a1qHvhLSD0AjkV46L4e+ylNWQ=
X-Google-Smtp-Source: ACHHUZ6dutweDfbXOV2/eaamUjQf3/84P2hDIltaA+Tue5GR31/4b02jOUxmfRdxIA5rS+EDWzTuFmleJKXTiElvz5U=
X-Received: by 2002:adf:f5d1:0:b0:313:e20c:b90b with SMTP id
 k17-20020adff5d1000000b00313e20cb90bmr3747020wrp.26.1687703884663; Sun, 25
 Jun 2023 07:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230619182559.104504-1-beniaminsandu@gmail.com>
 <CA+chaQcgWg7AJ7kk62HE2xTS6k3sORmgb4OTJmhqcwyN+ZqmPQ@mail.gmail.com> <CABQJdOG4=HojBgBTc9cJX92pe0ZKzS6=c0NgKHQiKR6Ue67ZVQ@mail.gmail.com>
In-Reply-To: <CABQJdOG4=HojBgBTc9cJX92pe0ZKzS6=c0NgKHQiKR6Ue67ZVQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 25 Jun 2023 16:37:37 +0200
Message-ID: <CA+chaQeoWV8c5toN8brcLmEkzAk-FxjSRsSHVtQRD1LZwvZS=w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add support for v3.x
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000880e7b05fef52efe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 14:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103564

--000000000000880e7b05fef52efe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe just skip the recipe when building without crypto? If someone uses
tune without crypto for whatever reason, then it might be better to show an
error that crypto is mandatory for this recipe instead of silently changing
the decision not to use crypto with DEFAULTTUNE.

I've noticed it just in world builds, don't really need 64bit mbedtls build
in this multilib setup (which uses just 64bit kernel and external modules,
whole userspace is 32bit).

Regards,

On Sun, Jun 25, 2023 at 3:42=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com>
wrote:

> On Sun, Jun 25, 2023 at 1:53=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > On Mon, Jun 19, 2023 at 8:26=E2=80=AFPM Beniamin Sandu <beniaminsandu@g=
mail.com>
> wrote:
> >>
> >> Version 3.4.0 adds a lot of improvements and fixes (a notable one
> >> being initial support for PKCS7 CMS), but since this is a pretty
> >> big jump, let's keep both versions for a while, so the v2.x users
> >> can upgrade to 3.x in a timely manner if needed.
> >>
> >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> >> ---
> >>  .../mbedtls/mbedtls_3.4.0.bb                  | 85 ++++++++++++++++++=
+
> >>  1 file changed, 85 insertions(+)
> >>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/
> mbedtls_3.4.0.bb
> >>
> >> diff --git a/meta-networking/recipes-connectivity/mbedtls/
> mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/
> mbedtls_3.4.0.bb
> >> new file mode 100644
> >> index 000000000..ebc6ba573
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> >
> >
> > ....
> >
> >> +# Needs crypto instructions on aarch64
> >> +TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
> >
> >
> > This assumes too much about TUNE_CCARGS_MARCH_OPTS structure and in som=
e
> multilib builds I'm seeing:
> >
> > # $TUNE_CCARGS_MARCH_OPTS [4 operations]
> > #   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:19
> > #     [_defaultval] ""
> > #   postdot oe-core/meta/conf/machine/include/arm/feature-arm-neon.inc:=
26
> > #     "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16'
> ], '+fp', '', d)}"
> > #   postdot oe-core/meta/conf/machine/include/arm/feature-arm-simd.inc:=
5
> > #     "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
> > #   :append[aarch64]
> meta-oe/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb:45
> > #     "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto',
> d)}"
> > # pre-expansion value:
> > #   "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ]=
,
> '+fp', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '',
> d)}${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
> > TUNE_CCARGS_MARCH_OPTS=3D"+crypto"
> >
> > And empty TUNE_CCARGS_MARCH, because TUNE_FEATURES has only aarch64
> >
> > # $TUNE_CCARGS_MARCH [4 operations]
> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv7a.inc:6
> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', '
> -march=3Darmv7-a', '', d)}"
> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv6.inc:5
> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6'=
,
> '', d)}"
> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv5.inc:5
> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv5', '
> -march=3Darmv5t${ARMPKGSFX_DSP}', '', d)}"
> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv4.inc:5
> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
> -march=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
> > # pre-expansion value:
> > #   "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv7-a=
',
> '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6', =
'',
> d)}${@bb.utils.contains('TUNE_FEATURES', 'armv5', '
> -march=3Darmv5t${ARMPKGSFX_DSP}', '',
> d)}${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
> -march=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
> > TUNE_CCARGS_MARCH=3D""
> >
> > causing do_configure failure:
> >
> > aarch64-oe-linux-gcc: warning: +crypto: linker input file unused becaus=
e
> linking not done
> > aarch64-oe-linux-gcc: error: +crypto: linker input file not found: No
> such file or directory
> > ninja: build stopped: subcommand failed.
>
> As I understand, you are building a lib64 multilib variant with a pure
> aarch64 tune (no core specifications or optimizations whatsoever)?
> I have tested with a bunch of different machines and tuning variations
> on my side, but I never encountered a build in the real world with
> arm64 instructions enabled and nothing else, so did not think trying
> out this one would be useful.
> Building with crypto instructions on arm64 machines was the path with
> the least resistance in getting rid of compilation errors because of
> target specific option mismatches, but I will look if there is better
> way to handle this when I get the chance.
>
> >
> >>  +
> >> +# For now the only way to enable PSA is to explicitly pass a -D via
> CFLAGS
> >> +CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', '
> -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> >> +
> >> +PROVIDES +=3D "polarssl"
> >> +RPROVIDES:${PN} =3D "polarssl"
> >> +
> >> +PACKAGES =3D+ "${PN}-programs"
> >> +FILES:${PN}-programs =3D "${bindir}/"
> >> +
> >> +ALTERNATIVE:${PN}-programs =3D "hello"
> >> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> +
> >> +CVE_PRODUCT =3D "mbed_tls"
> >> +
> >> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
> >> +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
> >> +# Fix merged upstream
> https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a5331=
0adf73a86c
> >> +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
> >> +
> >> +# Strip host paths from autogenerated test files
> >> +do_compile:append() {
> >> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> >> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> >> +}
> >> +
> >> +# Export source files/headers needed by Arm Trusted Firmware
> >> +sysroot_stage_all:append() {
> >> +       sysroot_stage_dir "${S}/library"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> >> +       sysroot_stage_dir "${S}/include"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> >> +}
> >> +
> >> +do_install_ptest () {
> >> +       install -d ${D}${PTEST_PATH}/tests
> >> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> >> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> >> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> >> +}
> >> --
> >> 2.25.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#103441):
> https://lists.openembedded.org/g/openembedded-devel/message/103441
> >> Mute This Topic: https://lists.openembedded.org/mt/99629175/3617156
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [Martin.Jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000880e7b05fef52efe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Maybe just skip the recipe when building =
without crypto? If someone uses tune without crypto for whatever reason, th=
en it might be better to show an error that crypto is mandatory for this re=
cipe instead of silently changing the decision not to use crypto with DEFAU=
LTTUNE.</div><div dir=3D"ltr"><br></div><div>I&#39;ve noticed it just in wo=
rld builds, don&#39;t really need 64bit mbedtls build in this multilib setu=
p (which uses just 64bit kernel and external modules, whole userspace is 32=
bit).</div><div><br></div><div>Regards,</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 25, 2023 at 3:42=E2=80=
=AFPM Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com">beniami=
nsandu@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Sun, Jun 25, 2023 at 1:53=E2=80=AFPM Martin Jansa &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmai=
l.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jun 19, 2023 at 8:26=E2=80=AFPM Beniamin Sandu &lt;<a href=3D"=
mailto:beniaminsandu@gmail.com" target=3D"_blank">beniaminsandu@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Version 3.4.0 adds a lot of improvements and fixes (a notable one<=
br>
&gt;&gt; being initial support for PKCS7 CMS), but since this is a pretty<b=
r>
&gt;&gt; big jump, let&#39;s keep both versions for a while, so the v2.x us=
ers<br>
&gt;&gt; can upgrade to 3.x in a timely manner if needed.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@=
gmail.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../mbedtls/<a href=3D"http://mbedtls_3.4.0.bb" rel=3D"noref=
errer" target=3D"_blank">mbedtls_3.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 85 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 85 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/mbed=
tls/<a href=3D"http://mbedtls_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank=
">mbedtls_3.4.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-networking/recipes-connectivity/mbedtls/<a href=
=3D"http://mbedtls_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3=
.4.0.bb</a> b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http:=
//mbedtls_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3.4.0.bb</=
a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..ebc6ba573<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http=
://mbedtls_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_3.4.0.bb<=
/a><br>
&gt;<br>
&gt;<br>
&gt; ....<br>
&gt;<br>
&gt;&gt; +# Needs crypto instructions on aarch64<br>
&gt;&gt; +TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D &quot;${@bb.utils.conta=
ins(&#39;TUNE_FEATURES&#39;, &#39;crypto&#39;, &#39;&#39;, &#39;+crypto&#39=
;, d)}&quot;<br>
&gt;<br>
&gt;<br>
&gt; This assumes too much about TUNE_CCARGS_MARCH_OPTS structure and in so=
me multilib builds I&#39;m seeing:<br>
&gt;<br>
&gt; # $TUNE_CCARGS_MARCH_OPTS [4 operations]<br>
&gt; #=C2=A0 =C2=A0set oe-core/meta/conf/machine/include/arm/arch-arm.inc:1=
9<br>
&gt; #=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;&quot;<br>
&gt; #=C2=A0 =C2=A0postdot oe-core/meta/conf/machine/include/arm/feature-ar=
m-neon.inc:26<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, [ &#39;vfpv3d16&#39;, &#39;vfpv5spd16&#39; ], &#39;+fp&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt; #=C2=A0 =C2=A0postdot oe-core/meta/conf/machine/include/arm/feature-ar=
m-simd.inc:5<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;simd&#39;, &#39;+simd&#39;, &#39;&#39;, d)}&quot;<br>
&gt; #=C2=A0 =C2=A0:append[aarch64] meta-oe/meta-networking/recipes-connect=
ivity/mbedtls/<a href=3D"http://mbedtls_3.4.0.bb:45" rel=3D"noreferrer" tar=
get=3D"_blank">mbedtls_3.4.0.bb:45</a><br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;crypto&#39;, &#39;&#39;, &#39;+crypto&#39;, d)}&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, [ &#=
39;vfpv3d16&#39;, &#39;vfpv5spd16&#39; ], &#39;+fp&#39;, &#39;&#39;, d)}${@=
bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;simd&#39;, &#39;+simd&#39;,=
 &#39;&#39;, d)}${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;crypto&#=
39;, &#39;&#39;, &#39;+crypto&#39;, d)}&quot;<br>
&gt; TUNE_CCARGS_MARCH_OPTS=3D&quot;+crypto&quot;<br>
&gt;<br>
&gt; And empty TUNE_CCARGS_MARCH, because TUNE_FEATURES has only aarch64<br=
>
&gt;<br>
&gt; # $TUNE_CCARGS_MARCH [4 operations]<br>
&gt; #=C2=A0 =C2=A0postdot oe-core/meta/conf/machine/include/arm/arch-armv7=
a.inc:6<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;armv7a&#39;, &#39; -march=3Darmv7-a&#39;, &#39;&#39;, d)}&quot;<br>
&gt; #=C2=A0 =C2=A0postdot oe-core/meta/conf/machine/include/arm/arch-armv6=
.inc:5<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;armv6&#39;, &#39; -march=3Darmv6&#39;, &#39;&#39;, d)}&quot;<br>
&gt; #=C2=A0 =C2=A0postdot oe-core/meta/conf/machine/include/arm/arch-armv5=
.inc:5<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;armv5&#39;, &#39; -march=3Darmv5t${ARMPKGSFX_DSP}&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt; #=C2=A0 =C2=A0postdot oe-core/meta/conf/machine/include/arm/arch-armv4=
.inc:5<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;armv4&#39;, &#39; -march=3Darmv4${ARMPKGSFX_THUMB}&#39;, &#39;&#39;=
, d)}&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39=
;armv7a&#39;, &#39; -march=3Darmv7-a&#39;, &#39;&#39;, d)}${@bb.utils.conta=
ins(&#39;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39; -march=3Darmv6&#39;, &#=
39;&#39;, d)}${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;,=
 &#39; -march=3Darmv5t${ARMPKGSFX_DSP}&#39;, &#39;&#39;, d)}${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;armv4&#39;, &#39; -march=3Darmv4${ARMPK=
GSFX_THUMB}&#39;, &#39;&#39;, d)}&quot;<br>
&gt; TUNE_CCARGS_MARCH=3D&quot;&quot;<br>
&gt;<br>
&gt; causing do_configure failure:<br>
&gt;<br>
&gt; aarch64-oe-linux-gcc: warning: +crypto: linker input file unused becau=
se linking not done<br>
&gt; aarch64-oe-linux-gcc: error: +crypto: linker input file not found: No =
such file or directory<br>
&gt; ninja: build stopped: subcommand failed.<br>
<br>
As I understand, you are building a lib64 multilib variant with a pure<br>
aarch64 tune (no core specifications or optimizations whatsoever)?<br>
I have tested with a bunch of different machines and tuning variations<br>
on my side, but I never encountered a build in the real world with<br>
arm64 instructions enabled and nothing else, so did not think trying<br>
out this one would be useful.<br>
Building with crypto instructions on arm64 machines was the path with<br>
the least resistance in getting rid of compilation errors because of<br>
target specific option mismatches, but I will look if there is better<br>
way to handle this when I get the chance.<br>
<br>
&gt;<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt; +# For now the only way to enable PSA is to explicitly pass a -D v=
ia CFLAGS<br>
&gt;&gt; +CFLAGS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#=
39;, &#39;psa&#39;, &#39; -DMBEDTLS_USE_PSA_CRYPTO&#39;, &#39;&#39;, d)}&qu=
ot;<br>
&gt;&gt; +<br>
&gt;&gt; +PROVIDES +=3D &quot;polarssl&quot;<br>
&gt;&gt; +RPROVIDES:${PN} =3D &quot;polarssl&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PACKAGES =3D+ &quot;${PN}-programs&quot;<br>
&gt;&gt; +FILES:${PN}-programs =3D &quot;${bindir}/&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +ALTERNATIVE:${PN}-programs =3D &quot;hello&quot;<br>
&gt;&gt; +ALTERNATIVE_LINK_NAME[hello] =3D &quot;${bindir}/hello&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +CVE_PRODUCT =3D &quot;mbed_tls&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# Fix merged upstream <a href=3D"https://github.com/Mbed-TLS/mbed=
tls/pull/5310" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mbed=
-TLS/mbedtls/pull/5310</a><br>
&gt;&gt; +CVE_CHECK_IGNORE +=3D &quot;CVE-2021-43666&quot;<br>
&gt;&gt; +# Fix merged upstream <a href=3D"https://github.com/Mbed-TLS/mbed=
tls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9e=
ce03c7e4a53310adf73a86c</a><br>
&gt;&gt; +CVE_CHECK_IGNORE +=3D &quot;CVE-2021-45451&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# Strip host paths from autogenerated test files<br>
&gt;&gt; +do_compile:append() {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${S}/++g&#39; ${B}/tests=
/*.c 2&gt;/dev/null || :<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${B}/++g&#39; ${B}/tests=
/*.c 2&gt;/dev/null || :<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +# Export source files/headers needed by Arm Trusted Firmware<br>
&gt;&gt; +sysroot_stage_all:append() {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/library&q=
uot; &quot;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/include&q=
uot; &quot;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include&quot;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +do_install_ptest () {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${B}/tests/test_suite_* ${D}${PT=
EST_PATH}/tests/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests/ -type f =
-name &quot;*.c&quot; -delete<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR ${S}/tests/data_files ${D}${PTE=
ST_PATH}/tests/<br>
&gt;&gt; +}<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#103441): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/103441" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/103441</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9962=
9175/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/99629175/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000880e7b05fef52efe--

