Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3EEC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 08:47:55 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.66030.1698310068213552956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 01:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAAP5Yro;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32d9b507b00so476976f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698310066; x=1698914866; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CzDpViGnlSZ0DocbUgV1953NRJtdZmBasT3367zTLs8=;
        b=mAAP5Yro5okV1eP+sX71ZTWZ+0F2e1aNBnzO3/0ziiKQRx8DJcNWzOO0XtE29kkj0I
         vA5/scwKmh9OC5gt/LGl9Qd55opOuxTZundA5a5/xUqSTNKX67+9ElP5mSotTyfrOBZV
         FvZ2AS10y2WopgnzXaDi70FNTYo/kzegAayAitCFR0SSPgdSoH/2TwKv8lfwBnECkVol
         emGoDz6lJeXPPeU2gmexjtGwbreUEP1llGGoKa3XpWRyaGPtDsNtCCbzQe61KUFB3KqI
         kmwxPcqrCnq0LWB4KYHysWcOwEKYLpCgv4l4tZPnvFeZgcFq8S/Cpaq2MbbMjTlZeArv
         zCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698310066; x=1698914866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzDpViGnlSZ0DocbUgV1953NRJtdZmBasT3367zTLs8=;
        b=ndfeqKYO+iw/WhnZrtQweeZODMSbG5qCX9c92pDKnTcM5/gxLOnXjcK728QtzqPPKU
         NQEVI8z64If96voC0IqQHKqu/Fep9syeFpojAEm7skZH/2PC5t6ymjRUJb6wZ6SnBPhZ
         VxhWaserIqgpfPhdp79NJvNfDcRI+1axcZsWQicXxliqJUmuFFQCW6ntrELLdzzDDV4P
         /2zEklAzT2cCBPvPuMun6YOfz1c+mzHUbwib2MwjuroQuDTbqwGwwNKBTFhrTX0eTfMR
         62PMgl5D+vYji0IWF3ndv/WRaBENjF27SiXJiwJADsl6pjZI9aJy/so081v1Ngpi9H4u
         Meng==
X-Gm-Message-State: AOJu0YyjaT4UCXXHtjiLXO/KDWsZ1eNsBEDvE3uTR3ZvUPNXv/SEfmpW
	MrsflWAKvVWUSqcR4b4su7Hv/qNAweGeRPyA01I=
X-Google-Smtp-Source: AGHT+IHFfSUWm4Ih/obzX0tS4QyEcQWtMFzf3NBKcJ3xu1yR5pEfpcQ3gdvs14780/9T/V3H4aOTGPIUS1J/O78oSUQ=
X-Received: by 2002:adf:e507:0:b0:329:6e92:8d77 with SMTP id
 j7-20020adfe507000000b003296e928d77mr12555785wrm.51.1698310066285; Thu, 26
 Oct 2023 01:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com> <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
In-Reply-To: <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Oct 2023 10:47:33 +0200
Message-ID: <CA+chaQd4QPvQbso9jvYEBeX4rEb+fpv9NKBGJKox434NuN5gxQ@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	joerg.sommer@navimatix.de, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000038324e06089aa0ad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 08:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105732

--00000000000038324e06089aa0ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But something like this inside of the external kernel module should work,
right? If yes, then it could be moved to module.bbclass or something.

At least as long as the RPATH is set correctly, that worked for me with
some old 4.9 kernels in:
https://github.com/shr-distribution/linux/commit/409f7adf4a862e439b5bec0473=
9b67713e08b8ba

On Thu, Oct 26, 2023 at 10:35=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail=
.com>
wrote:

>
>
> Khem Raj <raj.khem@gmail.com> escreveu no dia quarta, 25/10/2023 =C3=A0(s=
)
> 18:18:
>
>> I wonder if something like below would help
>>
>> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
>> b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> index 2cff48c39c3..6133721334c 100644
>> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> @@ -12,7 +12,7 @@ S =3D "${WORKDIR}"
>>
>>  do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
>> openssl-native:do_populate_sysroot"
>>  do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>> -
>> +do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sysroot"
>>
>
> This doesn't solve the problem because at compile time the openssl is
> already there on native sysroot
> and this is the reason for the sign-file to be linked with openssl.
> The make-mod-script doesn't install anything and only calls make on the
> shared staging kernel dir
> and the consequence is creating some binaries on the shared staging kerne=
l
> builddir.
> One of the tools it builds is the sign-file linked dynamically with the
> openssl in the native sysroot of
> make-mod-script. At the end of make-mod-script the rm_work deletes the
> native sysroot
> and this will remove the openssl libcrypto.so.3.
> Next time the sign-file in the shared staging kernel builddir will run th=
e
> libcrypto.so.3 will not be found.
> Without using the rm_work class everything works as expected.
>
> Jose
>
>
>>  DEPENDS +=3D "bc-native bison-native"
>>  DEPENDS +=3D "gmp-native"
>>
>> On Wed, Oct 25, 2023 at 7:45=E2=80=AFAM Bruce Ashfield <bruce.ashfield@g=
mail.com>
>> wrote:
>> >
>> > On Wed, Oct 25, 2023 at 7:40=E2=80=AFAM Jose Quaresma <quaresma.jose@g=
mail.com>
>> wrote:
>> > >
>> > > Hi Joerg,
>> > >
>> > > This topic has already been discussed previously in
>> > > https://lists.openembedded.org/g/openembedded-core/topic/98296212
>> > >
>> > > Bruce even sent a patch but it was never integrated, probably becaus=
e
>> it was a very invasive change.
>> > > https://lists.openembedded.org/g/openembedded-core/message/182024
>> >
>> > Heh. No, that wasn't the reason. The change wasn't invasive, it is
>> > isolated to just the single recipe.
>> >
>> > I just didn't have the cycles to chase down host specific issues and
>> > uninative updates.
>> >
>> > Clobbering rm_work isn't the right solution IMHO, but it can do the jo=
b.
>> >
>> > Bruce
>> >
>> > >
>> > > Anyway you can solve this problem with:
>> > > RM_WORK_EXCLUDE +=3D "make-mod-scripts"
>> > >
>> > > Jose
>> > >
>> > > J=C3=B6rg Sommer via lists.openembedded.org <joerg.sommer=3D
>> navimatix.de@lists.openembedded.org> escreveu no dia quarta, 25/10/2023
>> =C3=A0(s) 09:57:
>> > >>
>> > >> Hi,
>> > >>
>> > >> I'm having an odd problem building the external kernel module
>> > >> kernel-module-imx-gpu-viv [1]. I'm using kirkstone and have rm_work
>> > >> enabled.
>> > >>
>> > >> [1]  https://layers.openembedded.org/layerindex/recipe/40267/
>> > >>
>> > >> The module builds fine, but the install step contains the module
>> signing
>> > >> which **silently** fails with *libcrypto.so.3* not found:
>> > >>
>> > >> ```
>> > >> | make -C /build/tmp/work-shared/ziborium/kernel-source
>> > >>
>> M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.3.=
p4.2-r0/git/src
>> > >> modules_install
>> > >> | make[1]: Entering directory
>> '/build/tmp/work-shared/machine/kernel-source'
>> > >> | make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f
>> > >> /build/tmp/work-shared/machine/kernel-source/Makefile modules_insta=
ll
>> > >> | make[2]: Entering directory
>> > >> '/build/tmp/work-shared/machine/kernel-build-artifacts'
>> > >> | test -e include/generated/autoconf.h -a -e
>> include/config/auto.conf ||
>> > >> (               \
>> > >> | echo >&2;                                                     \
>> > >> | echo >&2 "  ERROR: Kernel configuration is invalid.";         \
>> > >> | echo >&2 "         include/generated/autoconf.h or
>> > >> include/config/auto.conf are missing.";\
>> > >> | echo >&2 "         Run 'make oldconfig && make prepare' on kernel
>> src
>> > >> to fix it.";    \
>> > >> | echo >&2 ;                                                    \
>> > >> | /bin/false)
>> > >> | make -f
>> > >> /build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modin=
st
>> > >> |   mkdir -p
>> > >>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;
>> > >> cp
>> > >>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/git/src/galcore.ko
>> > >>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
>> > >> |   :
>> > >> |   scripts/sign-file "sha1" "certs/signing_key.pem"
>> > >> certs/signing_key.x509
>> > >>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
>> > >> || true
>> > >> | scripts/sign-file: error while loading shared libraries:
>> > >> libcrypto.so.3: cannot open shared object file: No such file or
>> directory
>> > >> |   sh /build/tmp/work-shared/machine/kernel-source/scripts/depmod.=
sh
>> > >> echo 5.15.60-imx8mm+g343e81c0e39e
>> > >> | Warning: modules_install: missing 'System.map' file. Skipping
>> depmod.
>> > >> | make[2]: Leaving directory
>> > >> '/build/tmp/work-shared/machine/kernel-build-artifacts'
>> > >> | make[1]: Leaving directory
>> '/build/tmp/work-shared/machine/kernel-source'
>> > >> ```
>> > >>
>> > >> I noticed that there are special dependency definitions in
>> make-mod-scripts
>> > >>
>> > >> ```
>> > >> do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
>> > >> openssl-native:do_populate_sysroot"
>> > >> do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>> > >> ```
>> > >>
>> > >> and module-base.bbclass (inherited by module.bbclass)
>> > >>
>> > >> ```
>> > >> # We do the dependency this way because the output is not preserved
>> > >> # in sstate, so we must force do_compile to run (once).
>> > >> do_configure[depends] +=3D "make-mod-scripts:do_compile"
>> > >> ```
>> > >>
>> > >> Is there an additional dependency needed to address rm_work?
>> > >>
>> > >> Kind regards
>> > >>
>> > >> J=C3=B6rg Sommer
>> > >> --
>> > >> Navimatix GmbH
>> > >> Tatzendpromenade 2
>> > >> D-07745 Jena
>> > >> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
>> > >> Registergericht: Amtsgericht Jena, HRB 501480
>> > >>
>> > >>
>> > >>
>> > >
>> > >
>> > > --
>> > > Best regards,
>> > >
>> > > Jos=C3=A9 Quaresma
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105731):
> https://lists.openembedded.org/g/openembedded-devel/message/105731
> Mute This Topic: https://lists.openembedded.org/mt/102174355/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000038324e06089aa0ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">But something like this inside of the external kernel modu=
le should work, right? If yes, then it could be moved to module.bbclass or =
something.<div><br></div><div>At least as long as the RPATH is set correctl=
y, that worked for me with some old 4.9 kernels in:</div><div><a href=3D"ht=
tps://github.com/shr-distribution/linux/commit/409f7adf4a862e439b5bec04739b=
67713e08b8ba">https://github.com/shr-distribution/linux/commit/409f7adf4a86=
2e439b5bec04739b67713e08b8ba</a><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 26, 2023 at 10:35=E2=
=80=AFAM Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quare=
sma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; escreveu no dia quarta, 25/10/2023 =C3=A0(s) 18:18:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">I wonder if something like below woul=
d help<br>
<br>
diff --git a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mo=
d-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0=
.bb</a><br>
b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scripts_1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a><br>
index 2cff48c39c3..6133721334c 100644<br>
--- a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
<br>
+++ b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
<br>
@@ -12,7 +12,7 @@ S =3D &quot;${WORKDIR}&quot;<br>
<br>
=C2=A0do_configure[depends] +=3D &quot;virtual/kernel:do_shared_workdir<br>
openssl-native:do_populate_sysroot&quot;<br>
=C2=A0do_compile[depends] +=3D &quot;virtual/kernel:do_compile_kernelmodule=
s&quot;<br>
-<br>
+do_populate_sysroot[depends] +=3D &quot;openssl-native:do_populate_sysroot=
&quot;<br></blockquote><div><br></div><div>This doesn&#39;t solve the probl=
em because at compile time the openssl is already there on native sysroot</=
div><div>and this is the reason for the sign-file to be linked with openssl=
.<br>The make-mod-script doesn&#39;t install anything and only calls=C2=A0m=
ake on the shared staging kernel dir</div><div>and the consequence is creat=
ing some binaries on the shared staging kernel builddir.<br>One of the tool=
s it builds is the sign-file linked dynamically=C2=A0with the openssl in th=
e native sysroot of<br></div><div>make-mod-script. At the end of make-mod-s=
cript the rm_work deletes the native sysroot</div><div>and this will remove=
 the openssl libcrypto.so.3.=C2=A0</div><div>Next time the=C2=A0sign-file i=
n the shared staging kernel builddir will run the libcrypto.so.3 will not b=
e found.<br>Without using the rm_work class everything=C2=A0works as expect=
ed.</div><div><br>Jose<br><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
=C2=A0DEPENDS +=3D &quot;bc-native bison-native&quot;<br>
=C2=A0DEPENDS +=3D &quot;gmp-native&quot;<br>
<br>
On Wed, Oct 25, 2023 at 7:45=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; On Wed, Oct 25, 2023 at 7:40=E2=80=AFAM Jose Quaresma &lt;<a href=3D"m=
ailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a=
>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Joerg,<br>
&gt; &gt;<br>
&gt; &gt; This topic has already been discussed previously in<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/top=
ic/98296212" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/topic/98296212</a><br>
&gt; &gt;<br>
&gt; &gt; Bruce even sent a patch but it was never integrated, probably bec=
ause it was a very invasive change.<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/182024" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/182024</a><br>
&gt;<br>
&gt; Heh. No, that wasn&#39;t the reason. The change wasn&#39;t invasive, i=
t is<br>
&gt; isolated to just the single recipe.<br>
&gt;<br>
&gt; I just didn&#39;t have the cycles to chase down host specific issues a=
nd<br>
&gt; uninative updates.<br>
&gt;<br>
&gt; Clobbering rm_work isn&#39;t the right solution IMHO, but it can do th=
e job.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Anyway you can solve this problem with:<br>
&gt; &gt; RM_WORK_EXCLUDE +=3D &quot;make-mod-scripts&quot;<br>
&gt; &gt;<br>
&gt; &gt; Jose<br>
&gt; &gt;<br>
&gt; &gt; J=C3=B6rg Sommer via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;joerg.som=
mer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.org" target=3D"_bla=
nk">navimatix.de@lists.openembedded.org</a>&gt; escreveu no dia quarta, 25/=
10/2023 =C3=A0(s) 09:57:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;m having an odd problem building the external kernel mo=
dule<br>
&gt; &gt;&gt; kernel-module-imx-gpu-viv [1]. I&#39;m using kirkstone and ha=
ve rm_work<br>
&gt; &gt;&gt; enabled.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [1]=C2=A0 <a href=3D"https://layers.openembedded.org/layerind=
ex/recipe/40267/" rel=3D"noreferrer" target=3D"_blank">https://layers.opene=
mbedded.org/layerindex/recipe/40267/</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The module builds fine, but the install step contains the mod=
ule signing<br>
&gt; &gt;&gt; which **silently** fails with *libcrypto.so.3* not found:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ```<br>
&gt; &gt;&gt; | make -C /build/tmp/work-shared/ziborium/kernel-source<br>
&gt; &gt;&gt; M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu=
-viv/6.4.3.p4.2-r0/git/src<br>
&gt; &gt;&gt; modules_install<br>
&gt; &gt;&gt; | make[1]: Entering directory &#39;/build/tmp/work-shared/mac=
hine/kernel-source&#39;<br>
&gt; &gt;&gt; | make -C /build/tmp/work-shared/machine/kernel-build-artifac=
ts -f<br>
&gt; &gt;&gt; /build/tmp/work-shared/machine/kernel-source/Makefile modules=
_install<br>
&gt; &gt;&gt; | make[2]: Entering directory<br>
&gt; &gt;&gt; &#39;/build/tmp/work-shared/machine/kernel-build-artifacts&#3=
9;<br>
&gt; &gt;&gt; | test -e include/generated/autoconf.h -a -e include/config/a=
uto.conf ||<br>
&gt; &gt;&gt; (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;&gt; | echo &gt;&amp;2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; &gt;&gt; | echo &gt;&amp;2 &quot;=C2=A0 ERROR: Kernel configuration is=
 invalid.&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;&gt; | echo &gt;&amp;2 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inc=
lude/generated/autoconf.h or<br>
&gt; &gt;&gt; include/config/auto.conf are missing.&quot;;\<br>
&gt; &gt;&gt; | echo &gt;&amp;2 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run=
 &#39;make oldconfig &amp;&amp; make prepare&#39; on kernel src<br>
&gt; &gt;&gt; to fix it.&quot;;=C2=A0 =C2=A0 \<br>
&gt; &gt;&gt; | echo &gt;&amp;2 ;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt; | /bin/false)<br>
&gt; &gt;&gt; | make -f<br>
&gt; &gt;&gt; /build/tmp/work-shared/machine/kernel-source/scripts/Makefile=
.modinst<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0mkdir -p<br>
&gt; &gt;&gt; /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/=
6.4.3.p4.2-r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;<br=
>
&gt; &gt;&gt; cp<br>
&gt; &gt;&gt; /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/=
6.4.3.p4.2-r0/git/src/galcore.ko<br>
&gt; &gt;&gt; /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/=
6.4.3.p4.2-r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galc=
ore.ko<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0:<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0scripts/sign-file &quot;sha1&quot; &quot;certs/=
signing_key.pem&quot;<br>
&gt; &gt;&gt; certs/signing_key.x509<br>
&gt; &gt;&gt; /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/=
6.4.3.p4.2-r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galc=
ore.ko<br>
&gt; &gt;&gt; || true<br>
&gt; &gt;&gt; | scripts/sign-file: error while loading shared libraries:<br=
>
&gt; &gt;&gt; libcrypto.so.3: cannot open shared object file: No such file =
or directory<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0sh /build/tmp/work-shared/machine/kernel-source=
/scripts/depmod.sh<br>
&gt; &gt;&gt; echo 5.15.60-imx8mm+g343e81c0e39e<br>
&gt; &gt;&gt; | Warning: modules_install: missing &#39;System.map&#39; file=
. Skipping depmod.<br>
&gt; &gt;&gt; | make[2]: Leaving directory<br>
&gt; &gt;&gt; &#39;/build/tmp/work-shared/machine/kernel-build-artifacts&#3=
9;<br>
&gt; &gt;&gt; | make[1]: Leaving directory &#39;/build/tmp/work-shared/mach=
ine/kernel-source&#39;<br>
&gt; &gt;&gt; ```<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I noticed that there are special dependency definitions in ma=
ke-mod-scripts<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ```<br>
&gt; &gt;&gt; do_configure[depends] +=3D &quot;virtual/kernel:do_shared_wor=
kdir<br>
&gt; &gt;&gt; openssl-native:do_populate_sysroot&quot;<br>
&gt; &gt;&gt; do_compile[depends] +=3D &quot;virtual/kernel:do_compile_kern=
elmodules&quot;<br>
&gt; &gt;&gt; ```<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; and module-base.bbclass (inherited by module.bbclass)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ```<br>
&gt; &gt;&gt; # We do the dependency this way because the output is not pre=
served<br>
&gt; &gt;&gt; # in sstate, so we must force do_compile to run (once).<br>
&gt; &gt;&gt; do_configure[depends] +=3D &quot;make-mod-scripts:do_compile&=
quot;<br>
&gt; &gt;&gt; ```<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Is there an additional dependency needed to address rm_work?<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Kind regards<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; J=C3=B6rg Sommer<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Navimatix GmbH<br>
&gt; &gt;&gt; Tatzendpromenade 2<br>
&gt; &gt;&gt; D-07745 Jena<br>
&gt; &gt;&gt; Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<=
br>
&gt; &gt;&gt; Registergericht: Amtsgericht Jena, HRB 501480<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105731): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105731" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105731</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102174355/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102174355/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000038324e06089aa0ad--

