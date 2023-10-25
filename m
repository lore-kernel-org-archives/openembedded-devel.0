Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09416C25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 11:41:08 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.41371.1698234059742028050
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Oct 2023 04:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lw5fAnB2;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-457cb7f53afso2187680137.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698234059; x=1698838859; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cmJApniks43z2VB2u1NMMaQAreCAUQ78hR99eLby6X8=;
        b=Lw5fAnB2OlG89rJLB+EFGz++KMl6mvvjC8I8D6TznvhlW1C1O3srKBfc47sM4UVeA7
         DvB+sPQhgQTJfedQkdazwtGSHJVJG8FgNP18kOTwXkuGBDOO5mOrOoBwc5Tge0aDqpN0
         9wujfYxwZKxzYlb94nXzhL2O3HzjyjSZAYhMn+9fYUndf9iCkpZWZHuUOmxuua9hk48u
         n886t6nRa52AqGquV0xxwlgvOlmOj0GE1gWeELgzKG9Wpb3sa8FbxNv9UCrL7Zttz4B8
         k6oGnERb0Ha8eTmyoS3zV2yv0LkB9MlcTGRwdMBuO/O+pHcgLEAiCzFKV27ixDhapJlz
         A8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234059; x=1698838859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmJApniks43z2VB2u1NMMaQAreCAUQ78hR99eLby6X8=;
        b=B7VGGwA0U50sUYW1zITNRAvQnRjk2orTVgD97MMUsbQ1QgEifcbgquMVPcKGR4pWbe
         PXWD+fGuakzBSNTf7CA0d1SfxpFeELnjAB5ZOmvLMi9A5iz/qCCAclMKevZZYNMfYhWp
         bD3I4xi0apKz9dNc7b5Qw9EakZ2ayTvKufWJ0mrUcyua2gE5PUYOjB6z+OkKz0mEs8LF
         LyagNnw5vIm54QNc/n1UL8IIEJzINbVbniUOM97p19GLBA3Oarm8O6CIurleosnONX4O
         Tzzo5+3DQIBjhLVpyBbumxSVel2wkzWlZaeGEo7EfWoSJbtqRmepou7qC7z0Pd3RaDO+
         wciQ==
X-Gm-Message-State: AOJu0Yzi2ZX8Eu6z4q9gEWDYPjosCacfTvlXD4EIRHaOO02XcjORqQhW
	t/7UtPtr+Y4EznjYpbx6H5apgWrFNvxMK5hCxm8=
X-Google-Smtp-Source: AGHT+IFL2tc0vqhT3XcN6UlDRnaTQNdv0Iu7nPpVXryFMNlaoMKK/P1cE73oMnNP6FXRkDIu3yhk9mHrZcAPXT5beIo=
X-Received: by 2002:a05:6102:512a:b0:45a:9bb2:d486 with SMTP id
 bm42-20020a056102512a00b0045a9bb2d486mr6101071vsb.15.1698234058700; Wed, 25
 Oct 2023 04:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
In-Reply-To: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 25 Oct 2023 12:40:47 +0100
Message-ID: <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d07e1b060888ed6e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 11:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105727

--000000000000d07e1b060888ed6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

This topic has already been discussed previously in
https://lists.openembedded.org/g/openembedded-core/topic/98296212

Bruce even sent a patch but it was never integrated, probably because it
was a very invasive change.
https://lists.openembedded.org/g/openembedded-core/message/182024

Anyway you can solve this problem with:
RM_WORK_EXCLUDE +=3D "make-mod-scripts"

Jose

J=C3=B6rg Sommer via lists.openembedded.org <joerg.sommer=3D
navimatix.de@lists.openembedded.org> escreveu no dia quarta, 25/10/2023
=C3=A0(s) 09:57:

> Hi,
>
> I'm having an odd problem building the external kernel module
> kernel-module-imx-gpu-viv [1]. I'm using kirkstone and have rm_work
> enabled.
>
> [1]  https://layers.openembedded.org/layerindex/recipe/40267/
>
> The module builds fine, but the install step contains the module signing
> which **silently** fails with *libcrypto.so.3* not found:
>
> ```
> | make -C /build/tmp/work-shared/ziborium/kernel-source
>
> M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.3.p=
4.2-r0/git/src
> modules_install
> | make[1]: Entering directory
> '/build/tmp/work-shared/machine/kernel-source'
> | make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f
> /build/tmp/work-shared/machine/kernel-source/Makefile modules_install
> | make[2]: Entering directory
> '/build/tmp/work-shared/machine/kernel-build-artifacts'
> | test -e include/generated/autoconf.h -a -e include/config/auto.conf ||
> (               \
> | echo >&2;                                                     \
> | echo >&2 "  ERROR: Kernel configuration is invalid.";         \
> | echo >&2 "         include/generated/autoconf.h or
> include/config/auto.conf are missing.";\
> | echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
> to fix it.";    \
> | echo >&2 ;                                                    \
> | /bin/false)
> | make -f
> /build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modinst
> |   mkdir -p
>
> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r=
0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;
> cp
>
> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r=
0/git/src/galcore.ko
>
> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r=
0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
> |   :
> |   scripts/sign-file "sha1" "certs/signing_key.pem"
> certs/signing_key.x509
>
> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r=
0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
> || true
> | scripts/sign-file: error while loading shared libraries:
> libcrypto.so.3: cannot open shared object file: No such file or directory
> |   sh /build/tmp/work-shared/machine/kernel-source/scripts/depmod.sh
> echo 5.15.60-imx8mm+g343e81c0e39e
> | Warning: modules_install: missing 'System.map' file. Skipping depmod.
> | make[2]: Leaving directory
> '/build/tmp/work-shared/machine/kernel-build-artifacts'
> | make[1]: Leaving directory '/build/tmp/work-shared/machine/kernel-sourc=
e'
> ```
>
> I noticed that there are special dependency definitions in make-mod-scrip=
ts
>
> ```
> do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
> openssl-native:do_populate_sysroot"
> do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
> ```
>
> and module-base.bbclass (inherited by module.bbclass)
>
> ```
> # We do the dependency this way because the output is not preserved
> # in sstate, so we must force do_compile to run (once).
> do_configure[depends] +=3D "make-mod-scripts:do_compile"
> ```
>
> Is there an additional dependency needed to address rm_work?
>
> Kind regards
>
> J=C3=B6rg Sommer
> --
> Navimatix GmbH
> Tatzendpromenade 2
> D-07745 Jena
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105726):
> https://lists.openembedded.org/g/openembedded-devel/message/105726
> Mute This Topic: https://lists.openembedded.org/mt/102174355/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d07e1b060888ed6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joerg,<br><br>This topic has already been discussed pre=
viously in<br><a href=3D"https://lists.openembedded.org/g/openembedded-core=
/topic/98296212">https://lists.openembedded.org/g/openembedded-core/topic/9=
8296212</a><br><br>Bruce even sent a patch but it was never integrated, pro=
bably because it was a very invasive change.<br><a href=3D"https://lists.op=
enembedded.org/g/openembedded-core/message/182024">https://lists.openembedd=
ed.org/g/openembedded-core/message/182024</a><br><br>Anyway you can solve t=
his problem with:<br><span style=3D"color:rgb(51,51,51);font-family:&quot;H=
elvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">RM_WORK_EXCL=
UDE +=3D &quot;make-mod-scripts&quot;</span><br><br>Jose</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">J=C3=B6rg Sommer vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
joerg.sommer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.org">navim=
atix.de@lists.openembedded.org</a>&gt; escreveu no dia quarta, 25/10/2023 =
=C3=A0(s) 09:57:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi,<br>
<br>
I&#39;m having an odd problem building the external kernel module<br>
kernel-module-imx-gpu-viv [1]. I&#39;m using kirkstone and have rm_work<br>
enabled.<br>
<br>
[1]=C2=A0 <a href=3D"https://layers.openembedded.org/layerindex/recipe/4026=
7/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedded.org/la=
yerindex/recipe/40267/</a><br>
<br>
The module builds fine, but the install step contains the module signing<br=
>
which **silently** fails with *libcrypto.so.3* not found:<br>
<br>
```<br>
| make -C /build/tmp/work-shared/ziborium/kernel-source<br>
M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.3.p4.=
2-r0/git/src<br>
modules_install<br>
| make[1]: Entering directory &#39;/build/tmp/work-shared/machine/kernel-so=
urce&#39;<br>
| make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f<br>
/build/tmp/work-shared/machine/kernel-source/Makefile modules_install<br>
| make[2]: Entering directory<br>
&#39;/build/tmp/work-shared/machine/kernel-build-artifacts&#39;<br>
| test -e include/generated/autoconf.h -a -e include/config/auto.conf ||<br=
>
(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
| echo &gt;&amp;2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
| echo &gt;&amp;2 &quot;=C2=A0 ERROR: Kernel configuration is invalid.&quot=
;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
| echo &gt;&amp;2 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/generated=
/autoconf.h or<br>
include/config/auto.conf are missing.&quot;;\<br>
| echo &gt;&amp;2 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run &#39;make old=
config &amp;&amp; make prepare&#39; on kernel src<br>
to fix it.&quot;;=C2=A0 =C2=A0 \<br>
| echo &gt;&amp;2 ;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
| /bin/false)<br>
| make -f<br>
/build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modinst<br>
|=C2=A0 =C2=A0mkdir -p<br>
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;<br>
cp<br>
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
git/src/galcore.ko<br>
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko<br>
|=C2=A0 =C2=A0:<br>
|=C2=A0 =C2=A0scripts/sign-file &quot;sha1&quot; &quot;certs/signing_key.pe=
m&quot;<br>
certs/signing_key.x509<br>
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko<br>
|| true<br>
| scripts/sign-file: error while loading shared libraries:<br>
libcrypto.so.3: cannot open shared object file: No such file or directory<b=
r>
|=C2=A0 =C2=A0sh /build/tmp/work-shared/machine/kernel-source/scripts/depmo=
d.sh<br>
echo 5.15.60-imx8mm+g343e81c0e39e<br>
| Warning: modules_install: missing &#39;System.map&#39; file. Skipping dep=
mod.<br>
| make[2]: Leaving directory<br>
&#39;/build/tmp/work-shared/machine/kernel-build-artifacts&#39;<br>
| make[1]: Leaving directory &#39;/build/tmp/work-shared/machine/kernel-sou=
rce&#39;<br>
```<br>
<br>
I noticed that there are special dependency definitions in make-mod-scripts=
<br>
<br>
```<br>
do_configure[depends] +=3D &quot;virtual/kernel:do_shared_workdir<br>
openssl-native:do_populate_sysroot&quot;<br>
do_compile[depends] +=3D &quot;virtual/kernel:do_compile_kernelmodules&quot=
;<br>
```<br>
<br>
and module-base.bbclass (inherited by module.bbclass)<br>
<br>
```<br>
# We do the dependency this way because the output is not preserved<br>
# in sstate, so we must force do_compile to run (once).<br>
do_configure[depends] +=3D &quot;make-mod-scripts:do_compile&quot;<br>
```<br>
<br>
Is there an additional dependency needed to address rm_work?<br>
<br>
Kind regards<br>
<br>
J=C3=B6rg Sommer<br>
-- <br>
Navimatix GmbH<br>
Tatzendpromenade 2<br>
D-07745 Jena<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105726): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105726" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105726</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102174355/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102174355/5052612</a><br>
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

--000000000000d07e1b060888ed6e--

