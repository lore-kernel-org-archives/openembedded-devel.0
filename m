Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C34EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 18:07:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.2874.1689703670828651134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 11:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GPfPR4gi;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31434226a2eso5977292f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689703669; x=1692295669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xobXXUaI2acRMC97MlIQtsEU3O/qyJQT3uG7REqBgvA=;
        b=GPfPR4gikwxvDzvt+1SJmXPKVdLTZpjK52ObGiWfw/HqgI509hHFLj673sM1Q0yYq1
         Wb/VqrIuzTntlklwC63PQ6wuUs22LnS8dIECvze9yOvl4YBnuPrKIasy68HMb2h5kL+q
         OUZc7PNpBu0pK+Cna3DKy03kNUZXcom0B9mBtmfH7mPNm2EWHlakkg7tiB8INRU7mgkX
         y+5tSXIYVuV+VUMYWOtentd5WCIO8L/Be2/EBj1Ey2Yr3F2qfgp8s0OEYUxq1phBnVbU
         XMCL0sS9hdq3FHsEwrR7eXszYZkcpJ8XDEK3xKYjh1XmSIMTRJfTkavzOkenpfq2lLnC
         NviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703669; x=1692295669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xobXXUaI2acRMC97MlIQtsEU3O/qyJQT3uG7REqBgvA=;
        b=VO4lD/VLfJXV9OgK/tgAgUS2NCVfzfyZBNOsA7RzLAFgQwqz4SZDUhVb0Np9GbmbWn
         0j2s/Vm9LNCK/kThLdBf1uhQlsFeRn9p8tN5e3VCQFi3GqPte9f9l8NlohnbcyuYw94M
         mTRiSXHbeNuGob4MuRG9SujC8Qf0g1ItX3W31Yt+jefHLeYtIsmFw/viQy/6qEW4x+VO
         0T6WClE2bmWC6hpgyVbh/baZMIGipKLmdYLzHRkJ7zXjSzcnO/OJs7HNjakuF4bCh5Zp
         FVmMP3it+d5QvoJNvGpY0415kdB27d0phgNCvbE0gUTHvyLE+gVithuHmnKMGS9wDW2w
         Q2dg==
X-Gm-Message-State: ABy/qLZf5JwUuOgxbnfm/aydVdPBMUNB1gO3T55ECFP7lzt0sol8YurU
	drtuHdd9c4qwx2gtDHOaHDv3SY9Kfffyo5zUJYw=
X-Google-Smtp-Source: APBJJlE229Cr7o97vrttojpdF6k3278tf1L0lZ6bnwVwFAeQeI6a+KsRRLgy4XxWVjQmU9HCjRs3iYOnRCEBQ94cN0s=
X-Received: by 2002:a5d:690e:0:b0:315:92ce:e218 with SMTP id
 t14-20020a5d690e000000b0031592cee218mr16199194wru.41.1689703668923; Tue, 18
 Jul 2023 11:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <1772F75C0586ED27.2899@lists.openembedded.org>
In-Reply-To: <1772F75C0586ED27.2899@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jul 2023 20:07:05 +0200
Message-ID: <CA+chaQcmNZp3V9PvUT8sS=7-E-=RH7w-ARPmYaagaUZBvG0z1A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2 1/3] libtommath: add recipe for LibTomMath
 used by dropbear
To: Martin.Jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f643c60600c6ca9f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 18:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103950

--000000000000f643c60600c6ca9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry for noise, but this one will need v3 to respect CXX as it's
trying to use host's gcc and arm builds with older gcc fail with:

gcc: error: unrecognized command-line option '-mthumb'
gcc: error: unrecognized command-line option '-mfpu=3Dneon'
gcc: error: unrecognized command-line option '-mfloat-abi=3Dsoftfp'
gcc: error: unrecognized command-line option '-fcanon-prefix-map'; did you
mean '-fmacro-prefix-map=3D'?


On Tue, Jul 18, 2023 at 3:09=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * When system-libtom PACKAGECONFIG is used, both libtomcrypt and libtomma=
th
>   are used from system and we need a recipes for both.
>
> * libtomcrypt was already added to meta-oe in langdale and PACKAGECONFIG
>   was added in dropbear in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Db7c2edd2d6ded=
287d8b34dd047ae84d3fd69d4c6
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v2: drop explict -fPIC as v2 of libtomcrypt no longer uses static
> libtommath.a
>
>  .../libtommath/libtommath_1.2.0.bb            | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libtommath/libtommath_1.2.0.b=
b
>
> diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
> b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
> new file mode 100644
> index 0000000000..34d7f4cf6b
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "LibTomMath is a number theoretic multiple-precision integer
> library"
> +HOMEPAGE =3D "https://www.libtom.net/LibTomMath"
> +SECTION =3D "libs"
> +LICENSE =3D "Unlicense"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D23e7e0a32e53a2b1d35f5fd9ef053=
402"
> +
> +SRC_URI =3D "git://
> github.com/libtom/libtommath.git;protocol=3Dhttps;branch=3Dmaster"
> +
> +SRCREV =3D "6ca6898bf37f583c4cc9943441cd60dd69f4b8f2"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D "'PREFIX=3D${prefix}' 'DESTDIR=3D${D}' 'LIBPATH=3D${lib=
dir}'
> 'CFLAGS=3D${CFLAGS}'"
> +
> +do_compile() {
> +    oe_runmake -f makefile.shared
> +}
> +
> +do_install() {
> +    oe_runmake -f makefile.shared install
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103944):
> https://lists.openembedded.org/g/openembedded-devel/message/103944
> Mute This Topic: https://lists.openembedded.org/mt/100214532/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f643c60600c6ca9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry for noise, but this one will need v3 to resp=
ect CXX as it&#39;s trying to use host&#39;s gcc and arm builds with older =
gcc fail with:<div><br></div><div>gcc: error: unrecognized command-line opt=
ion &#39;-mthumb&#39;<br></div><div>gcc: error: unrecognized command-line o=
ption &#39;-mfpu=3Dneon&#39;<br>gcc: error: unrecognized command-line optio=
n &#39;-mfloat-abi=3Dsoftfp&#39;<br>gcc: error: unrecognized command-line o=
ption &#39;-fcanon-prefix-map&#39;; did you mean &#39;-fmacro-prefix-map=3D=
&#39;?<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Jul 18, 2023 at 3:09=E2=80=AFPM Mart=
in Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">* When system-libtom PACKAGECONFIG is us=
ed, both libtomcrypt and libtommath<br>
=C2=A0 are used from system and we need a recipes for both.<br>
<br>
* libtomcrypt was already added to meta-oe in langdale and PACKAGECONFIG<br=
>
=C2=A0 was added in dropbear in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3Db7c2edd2d6ded287d8b34dd047ae84d3fd69d4c6" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3Db7c2edd2=
d6ded287d8b34dd047ae84d3fd69d4c6</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
v2: drop explict -fPIC as v2 of libtomcrypt no longer uses static libtommat=
h.a<br>
<br>
=C2=A0.../libtommath/<a href=3D"http://libtommath_1.2.0.bb" rel=3D"noreferr=
er" target=3D"_blank">libtommath_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 21 +++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libtommath/<a href=3D"http=
://libtommath_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libtommath_1.2=
.0.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/libtommath/<a href=3D"http://libtommat=
h_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libtommath_1.2.0.bb</a> b/=
meta-oe/recipes-support/libtommath/<a href=3D"http://libtommath_1.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libtommath_1.2.0.bb</a><br>
new file mode 100644<br>
index 0000000000..34d7f4cf6b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libtommath/<a href=3D"http://libtommath_1.2.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libtommath_1.2.0.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;LibTomMath is a number theoretic multiple-precision inte=
ger library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.libtom.net/LibTomMath" rel=3D"no=
referrer" target=3D"_blank">https://www.libtom.net/LibTomMath</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;Unlicense&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D23e7e0a32e53a2b1d35f5fd9ef=
053402&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/libtom/libtommath.git=
;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/libtom/libtommath.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br=
>
+<br>
+SRCREV =3D &quot;6ca6898bf37f583c4cc9943441cd60dd69f4b8f2&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;&#39;PREFIX=3D${prefix}&#39; &#39;DESTDIR=3D${D}&#3=
9; &#39;LIBPATH=3D${libdir}&#39; &#39;CFLAGS=3D${CFLAGS}&#39;&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 oe_runmake -f makefile.shared<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 oe_runmake -f makefile.shared install<br>
+}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103944): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103944" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103944</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100214532/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100214532/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f643c60600c6ca9f--

