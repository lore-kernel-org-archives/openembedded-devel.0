Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218EEC07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 12:01:48 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.41704.1698235301679025913
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Oct 2023 05:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NVOS9YnV;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ce2bcb131fso3626776a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698235301; x=1698840101; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0dnrUWkYai3viqZ+YDXyyF/PGxhgUOegWomc7DCXnak=;
        b=NVOS9YnVSlIRplRdr+sKpNnFvt/kE+iwW4Hd4BPgQ6Uenf+hkMDtEbesO9p+B6M4cM
         Z5ekZzGOT+b63oVAbDLjhrdzbgADkDQZRDiIWqREftwmPOYyaPsIwQLBXfiqbJIyfUd9
         Cn7Y6OA0O7DjHXWotvB9ZsWFmsRseN3/sdrOwayIzXfLw/ghPjUTvm7+V111IGXoR3pk
         JRT5XGbabC+MddVh3KL+TULpWtI953Y00SybM4vArw6Hhvs8Qd2L7qxEftvmJZZtqP3R
         MtJcWY5XfyDVsV4TZOYERKbfhBkbopx3k7KaOI3LcAIt96yyekE5wbTcehNyQL7v6j/j
         U/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235301; x=1698840101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dnrUWkYai3viqZ+YDXyyF/PGxhgUOegWomc7DCXnak=;
        b=BOvRdGKJFkQO523xpk1mJ+8/EFi/pcROrl/fxLLuZKHFlkqOJrqT5HtZ9+Elu2vOBn
         c9XbOuR+FDpwOeh0PWgSs78GUChq8Km/IkRs2eRdb2MHFEbBh5rTAWrtzjsUAHkv9+hs
         Z4VhAfJSpq5lxiLIqBmsFahI8KTJTPUbrey60QtXAuIRADs8Tbegi7ptI2YnV2YD7dvr
         UcRTbrCWl2/ouNDbdGmCCXjCzwhjZYGG3Md4S/q9nssSxThWNFdysO48iorVt2JYnTwb
         wGN3iXNGjwu/fLw37p6+YEdK3P47JjjaM3Y2qUGAno8ta1nIQGZkh8Zac9Z6jQKlC3Vg
         2Hyw==
X-Gm-Message-State: AOJu0YxuWpFCn5mT2TzT14RFUw2gjPAELa0rfHm7gaZ3SXmgY28sJ4Xf
	5Tr7oZdpUjVb24RPgtBWd0Z93hcfdtwe1TQQLUrQXda5h7GCYg==
X-Google-Smtp-Source: AGHT+IGh4rUklCPHD6SkyepbS0GSrVG+fyAm8eZbTBa6ioYYmBhIyx+HtuehUWnskmCWS+oDNKcXBUMuxmobpjgIhSw=
X-Received: by 2002:a05:6870:1056:b0:1e9:9a86:2937 with SMTP id
 22-20020a056870105600b001e99a862937mr15766793oaj.51.1698235300807; Wed, 25
 Oct 2023 05:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de> <179156E1429869C6.11247@lists.openembedded.org>
In-Reply-To: <179156E1429869C6.11247@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 25 Oct 2023 13:01:29 +0100
Message-ID: <CANPvuRmiW5Do8KUFqRCDwNb9YNgARBN3_D+OkRO5a+8GcnLi1Q@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: quaresma.jose@gmail.com
Cc: joerg.sommer@navimatix.de, openembedded-devel@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d9892906088937e2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 12:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105728

--000000000000d9892906088937e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quarta, 25/10/2023 =C3=A0=
(s)
12:41:

> Hi Joerg,
>
> This topic has already been discussed previously in
> https://lists.openembedded.org/g/openembedded-core/topic/98296212
>
> Bruce even sent a patch but it was never integrated, probably because it
> was a very invasive change.
> https://lists.openembedded.org/g/openembedded-core/message/182024
>
> Anyway you can solve this problem with:
> RM_WORK_EXCLUDE +=3D "make-mod-scripts"
>

I have proposed a fix for this
https://lists.openembedded.org/g/openembedded-core/message/189675


>
>
> Jose
>
> J=C3=B6rg Sommer via lists.openembedded.org <joerg.sommer=3D
> navimatix.de@lists.openembedded.org> escreveu no dia quarta, 25/10/2023
> =C3=A0(s) 09:57:
>
>> Hi,
>>
>> I'm having an odd problem building the external kernel module
>> kernel-module-imx-gpu-viv [1]. I'm using kirkstone and have rm_work
>> enabled.
>>
>> [1]  https://layers.openembedded.org/layerindex/recipe/40267/
>>
>> The module builds fine, but the install step contains the module signing
>> which **silently** fails with *libcrypto.so.3* not found:
>>
>> ```
>> | make -C /build/tmp/work-shared/ziborium/kernel-source
>>
>> M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.3.=
p4.2-r0/git/src
>> modules_install
>> | make[1]: Entering directory
>> '/build/tmp/work-shared/machine/kernel-source'
>> | make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f
>> /build/tmp/work-shared/machine/kernel-source/Makefile modules_install
>> | make[2]: Entering directory
>> '/build/tmp/work-shared/machine/kernel-build-artifacts'
>> | test -e include/generated/autoconf.h -a -e include/config/auto.conf ||
>> (               \
>> | echo >&2;                                                     \
>> | echo >&2 "  ERROR: Kernel configuration is invalid.";         \
>> | echo >&2 "         include/generated/autoconf.h or
>> include/config/auto.conf are missing.";\
>> | echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
>> to fix it.";    \
>> | echo >&2 ;                                                    \
>> | /bin/false)
>> | make -f
>> /build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modinst
>> |   mkdir -p
>>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;
>> cp
>>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/git/src/galcore.ko
>>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
>> |   :
>> |   scripts/sign-file "sha1" "certs/signing_key.pem"
>> certs/signing_key.x509
>>
>> /build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-=
r0/image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
>> || true
>> | scripts/sign-file: error while loading shared libraries:
>> libcrypto.so.3: cannot open shared object file: No such file or director=
y
>> |   sh /build/tmp/work-shared/machine/kernel-source/scripts/depmod.sh
>> echo 5.15.60-imx8mm+g343e81c0e39e
>> | Warning: modules_install: missing 'System.map' file. Skipping depmod.
>> | make[2]: Leaving directory
>> '/build/tmp/work-shared/machine/kernel-build-artifacts'
>> | make[1]: Leaving directory
>> '/build/tmp/work-shared/machine/kernel-source'
>> ```
>>
>> I noticed that there are special dependency definitions in
>> make-mod-scripts
>>
>> ```
>> do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
>> openssl-native:do_populate_sysroot"
>> do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>> ```
>>
>> and module-base.bbclass (inherited by module.bbclass)
>>
>> ```
>> # We do the dependency this way because the output is not preserved
>> # in sstate, so we must force do_compile to run (once).
>> do_configure[depends] +=3D "make-mod-scripts:do_compile"
>> ```
>>
>> Is there an additional dependency needed to address rm_work?
>>
>> Kind regards
>>
>> J=C3=B6rg Sommer
>> --
>> Navimatix GmbH
>> Tatzendpromenade 2
>> D-07745 Jena
>> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
>> Registergericht: Amtsgericht Jena, HRB 501480
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105727):
> https://lists.openembedded.org/g/openembedded-devel/message/105727
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

--000000000000d9892906088937e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu no dia quarta, 25/10/2023 =C3=A0(s) 12:41:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Joerg,=
<br><br>This topic has already been discussed previously in<br><a href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/topic/98296212" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-core/topic/98296212<=
/a><br><br>Bruce even sent a patch but it was never integrated, probably be=
cause it was a very invasive change.<br><a href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/message/182024" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-core/message/182024</a><br><br>Anyway you c=
an solve this problem with:<br><span style=3D"color:rgb(51,51,51);font-fami=
ly:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">RM=
_WORK_EXCLUDE +=3D &quot;make-mod-scripts&quot;</span></div></blockquote><d=
iv><br>I have proposed a fix for this<br><a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/189675">https://lists.openembedded.org/=
g/openembedded-core/message/189675</a>=C2=A0<br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><br>Jose</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">J=C3=B6rg S=
ommer via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:navimatix.de@lis=
ts.openembedded.org" target=3D"_blank">navimatix.de@lists.openembedded.org<=
/a>&gt; escreveu no dia quarta, 25/10/2023 =C3=A0(s) 09:57:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105727): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105727" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105727</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d9892906088937e2--

