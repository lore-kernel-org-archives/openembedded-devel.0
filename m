Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67793D1036D
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 23:55:11 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1195.1764114906710630479
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 15:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J3CNzG6e;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b31c610fcso5224612f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 15:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764114905; x=1764719705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=30H5EY9MldYjy6i17LAB5kBPE/uW9mmbTySD1Ka0THw=;
        b=J3CNzG6eFNI2UdxEdBBiGEvoTZ9crG5a4iMfGV5TFd/iWZDkVs7LYPTww4zZEJwJI0
         RjuDL6TZn1mTYgi5J/ZPT9i6ZfxOd4rI1lfbxG2d+KTbtP8WlvQ0hL4lt9gRuaFoCtMD
         YNLAfBK7I/hWCZ31cVeDBnST0AOyTdUzlOpls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114905; x=1764719705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30H5EY9MldYjy6i17LAB5kBPE/uW9mmbTySD1Ka0THw=;
        b=hBo35E5MYQvrG+kxcHezTl3Pu++KMTd1eGe3aMmzagy7XqgwR3PGB2/2r3Wxh6d0Mr
         9NJl7qu66V8EsOBkr0DOfhA/Qn9bu1iS4ciehSp/xeOrrHtk12e1tASqLY5S3F2bWtSl
         UMdu8eNuC3MShLgYJsYktbSg0yqLp6iOYDffivturn3j3cOg+hiICCpptqQyUIPwcN9L
         UxbDTNl1iJjyvNIp2hLniTDrS7tEs/3sgrCTfug0O/1A4NB1IzXaRZ/UJiHLo5tj/vej
         KndD9YTLeu7pT5hJXW8jW56YOpF6GnZyGp0U5Ob7+Kh5Hatu+FQN8OgZwifFCzWZYyIv
         WWBg==
X-Gm-Message-State: AOJu0YypFy5u2c1Ql6+r17jJIQKXhH3sfwpi3g4uWrkKSoaMv9wko3e3
	rfYE2XryFQyWe4QhQSzBHhehQpYcw7uH3vOnTrpZ2qNKr2kfR0MZr4L6ZwCdnNaqa4am24JizUp
	qha0Zw5c0kvwlumEuUnbxz0EKywqf+jSAlVs07QW9YQ==
X-Gm-Gg: ASbGncvcc0NXEthdxJErRBtMlu5G9vRgqOLcaXjgac5BcPwDinj3Hh3nEHH1Vsj1Va1
	Mwlxudo8wDd0Q5FRBpFeBeu2RpDwNdHvYBPd6E/2Du5sZvGSFazGZhTvvEFmiYCkXK1t2NqKp7T
	0dEwEFeJJhyGrjMuj7lFylXUm6kKkSA3kN9OSsuWAqflwIbq5X3DG7D5Ex80xu94Fxv3/YjKqlV
	u4dv59mfDBd0YliACnxCJpsKfTUX5G25fc8lWAt/MXXqMOEQU+xUXTvJb4vwdEyHy10mHAUdHdy
	4YjUPE0KRsLQQg5ytmZ86XGOuMqM
X-Google-Smtp-Source: AGHT+IGdrrpETKmIGh9WpU0uNKw5W2gWLEtZ88N5Q6vxVat3jWmS3nexruq9mNCkd3/ZyVwJwhCGz9mNsQpcM59du08=
X-Received: by 2002:a05:6000:1841:b0:429:b525:6df5 with SMTP id
 ffacd0b85a97d-42e0f1fc3f8mr4917835f8f.3.1764114904878; Tue, 25 Nov 2025
 15:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20251125225858.1361559-1-raj.khem@gmail.com>
In-Reply-To: <20251125225858.1361559-1-raj.khem@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 26 Nov 2025 00:54:37 +0100
X-Gm-Features: AWmQ_bnRuASwDmKmFyjph4bNjPUXumjEpUVcCW5u7LEwf0xQrcQLytDkKsPgyew
Message-ID: <CAMSfU+6kcE1uociWaV1s06rNw+a-1sRjL9q=DYGOq-t57Ms-VA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystem][PATCH] e2tools: Fix buildpaths in ptests
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003fa04506447402de"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 23:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122067

--0000000000003fa04506447402de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 nov. 2025 =C3=A0 23:59, Khem Raj via lists.openembedded.org <raj=
.khem=3D
gmail.com@lists.openembedded.org> a =C3=A9crit :

> Currently the path checks are escaping QA check for buildpath detection
> but config.status
> still has paths which show up in reproduciblity failures, comparing build
> in path A and
> build in path B, content of config.status don't end up same.


FYI, last time we tried to fixed that, some of the lines in config.status
looked like this:
S["LDFLAGS"]=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/build=
/build/build-st-meta-filesyste"\
"ms/build-st/reproducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0=
.1.2/sources/e2tools-0.1.2=3D/usr/src/debug/e2tools/0.1.2
 -ffile-prefix-map"\
"=3D/work/x86-64-v3-poky-linu"\
"x/e2tools/0.1.2/build=3D/usr/src/debug/e2tools/0.1.2
 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/build=
/build/build-st-meta-fil"\
"esystems/build-st/reproducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2t=
ools/0.1.2/recipe-sysroot=3D
 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/"\
"reproducible-meta-oe/build/build/build-st-meta-filesystems/build-st/reprod=
ucibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo"=
\
"t-native=3D  -Wl,-z,relro,-z,now"

=3D> The non-reproducible paths split across line breaks.

This is autoconf trying to generate a portable AWK script (meaning the
maximum line size for a literal is around 150). Since the "portable" here
means supporting prehistoric UNIX version of awk we started working on
modifying this limit in autoconf (_AC_AWK_LITERAL_LIMIT) to something more
modern (1000). The goal was to avoid having non-reproducible paths split
across line breaks to let sed work correctly but we never quite finished
this patch.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-utils/e2tools/e2tools_0.1.2.bb       | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> index 219735acd1..b7b925da0e 100644
> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> @@ -39,7 +39,21 @@ do_install_ptest() {
>          ${D}${PTEST_PATH}/build/autom4te.cache \
>          ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
>          ${D}${PTEST_PATH}/*/*/autom4te.cache
> -    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
> +    sed -e 's@[^ ]*-ffile-prefix-map=3D[^ "]*@@g' \
> +        -e 's@[^ ]*-fdebug-prefix-map=3D[^ "]*@@g' \
> +        -e 's@[^ ]*-fmacro-prefix-map=3D[^ "]*@@g' \
> +        -e 's@[^ ]*--sysroot=3D[^ "]*@@g' \
> +        -e 's@[^ ]*--with-libtool-sysroot=3D[^ "]*@@g' \
> +        -e 's@[^ ]*--with-install-prefix=3D[^ "]*@@g' \
> +        -e '/EXT2FS_CFLAGS/d' \
> +        -e '/LDFLAGS/d' \
> +        -e '/PKG_CONFIG_PATH/d' \
> +        -e '/PKG_CONFIG_LIBDIR/d' \
> +        -e 's@${S}@${PTEST_PATH}@g' \
> +        -e 's@${B}@${PTEST_PATH}/build@g' \
> +        -e 's@${HOSTTOOLS_DIR}@@g' \
> +        -e 's@${RECIPE_SYSROOT}@@g' \
> +        -i ${D}${PTEST_PATH}/build/config.status
>  }
>
>  RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk make pe=
rl"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122065):
> https://lists.openembedded.org/g/openembedded-devel/message/122065
> Mute This Topic: https://lists.openembedded.org/mt/116477328/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000003fa04506447402de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 25 nov. 2025 =C3=A0=C2=A023:=
59, Khem Raj via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><div c=
lass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Currently the path checks are escaping QA check for build=
path detection but config.status<br>
still has paths which show up in reproduciblity failures, comparing build i=
n path A and<br>
build in path B, content of config.status don&#39;t end up same.</blockquot=
e><div>=C2=A0</div><div>FYI, last time we tried to fixed that, some of the =
lines in=C2=A0config.status looked like this:</div><div>S[&quot;LDFLAGS&quo=
t;]=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =C2=A0-ffile-pre=
fix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/build/build/buil=
d-st-meta-filesyste&quot;\<br>&quot;ms/build-st/reproducibleB-extended/tmp/=
work/x86-64-v3-poky-linux/e2tools/0.1.2/sources/e2tools-0.1.2=3D/usr/src/de=
bug/e2tools/0.1.2 =C2=A0-ffile-prefix-map&quot;\<br>&quot;=3D/work/x86-64-v=
3-poky-linu&quot;\<br>&quot;x/e2tools/0.1.2/build=3D/usr/src/debug/e2tools/=
0.1.2 =C2=A0-ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-me=
ta-oe/build/build/build-st-meta-fil&quot;\<br>&quot;esystems/build-st/repro=
ducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo=
t=3D =C2=A0-ffile-prefix-map=3D/srv/pokybuild/yocto-worker/&quot;\<br>&quot=
;reproducible-meta-oe/build/build/build-st-meta-filesystems/build-st/reprod=
ucibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo&=
quot;\<br>&quot;t-native=3D =C2=A0-Wl,-z,relro,-z,now&quot;<br><br></div><d=
iv>=3D&gt; The non-reproducible paths split across line breaks.</div><div><=
br></div><div>This is autoconf trying to generate a portable AWK script (me=
aning the maximum line size for a literal is around 150). Since the &quot;p=
ortable&quot; here means supporting prehistoric UNIX version of awk we star=
ted working on modifying this limit in autoconf (_AC_AWK_LITERAL_LIMIT) to =
something more modern (1000). The goal was to avoid having non-reproducible=
 paths split across=C2=A0line breaks to let sed work correctly but we never=
 quite finished this patch.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 16 +++++++++++++++-<br>
=C2=A01 file changed, 15 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2too=
ls_0.1.2.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a> b/me=
ta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.2.bb" re=
l=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a><br>
index 219735acd1..b7b925da0e 100644<br>
--- a/meta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a><br>
+++ b/meta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a><br>
@@ -39,7 +39,21 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/build/autom4te.cache \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PA=
TH}/*/*/.github \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/*/*/autom4te.cache<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s;${TMPDIR};;g&#39; ${D}${PTEST_PATH}/build/c=
onfig.status<br>
+=C2=A0 =C2=A0 sed -e &#39;s@[^ ]*-ffile-prefix-map=3D[^ &quot;]*@@g&#39; \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*-fdebug-prefix-map=3D[^ &quot;]=
*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*-fmacro-prefix-map=3D[^ &quot;]=
*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*--sysroot=3D[^ &quot;]*@@g&#39;=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*--with-libtool-sysroot=3D[^ &qu=
ot;]*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*--with-install-prefix=3D[^ &quo=
t;]*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/EXT2FS_CFLAGS/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/LDFLAGS/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/PKG_CONFIG_PATH/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/PKG_CONFIG_LIBDIR/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${S}@${PTEST_PATH}@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${B}@${PTEST_PATH}/build@g&#39; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${HOSTTOOLS_DIR}@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${RECIPE_SYSROOT}@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${PTEST_PATH}/build/config.status<br>
=C2=A0}<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;bash coreutils e2fsprogs e2tools gawk=
 make perl&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122065): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122065" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122065</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116477328/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116477328/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000003fa04506447402de--

