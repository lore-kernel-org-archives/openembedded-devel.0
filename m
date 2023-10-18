Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F09CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 12:28:56 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.279930.1697632132395059296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 05:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eqkM2/Ni;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: samuli.piippo@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7b5fcf9c682so3176722241.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697632131; x=1698236931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OKcKlTUgJzABMQBBPAIxo5D0CExl+0pBWbiZbZLeLJw=;
        b=eqkM2/Ni6Ox778KOTVfUgr5GnSCeaHWYaAXd2wRbLEYB6aKvjJ2pTgeCUiEz18ZSjW
         FMC7C2owlAjWUkHXauMCIHXVaNz3r6TEH+WYADfxgbrGuTrl6s+DXHNn3SfkgU1YlGD0
         39MKpAsRoUsvXPly14DdZc4YZONRqkKtaEYpjqPVTCFTa4/XRwaEU7ngDphAziK6v7Di
         iFZwIPB2NDNBZMWCNZaHeav0S2Hj9t8W4Z4vln2iXjTpkaIZzgVuxYcc1yezsNfh84Z7
         +W1wv8drYWqHB6wa7j4zDawGutPpid8w7V6h2/eTf0838H1x/OUgyeEwkXxaNAfDXwbp
         JELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632131; x=1698236931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKcKlTUgJzABMQBBPAIxo5D0CExl+0pBWbiZbZLeLJw=;
        b=En+uGERaVzWPzEWxfKarFD/vUEN2tzXkeiczPylrt0Gyk2dy0y4SZI+8HwFWaDaRKC
         wjO/c6zr2AcgdPrM21Ej/WvQr5kGRa/It3wtcmvXP/KwGl8DOa/xr/VZ59ps3H8HabEL
         tvyX4xwdGtto2260Dfqivxcz1FEM6+FHRu0ZT644D9Q9ntEIrh/gwqnnHseODaCbNgCq
         H0v9mJRvAfZ6l3cQMjOSnccKHVhut3ANipYNQdSaIrQhy/z49s8OK/bvYVpvtRfiBhiq
         kYdpum+YI9+REFfl+TfZ1DghHruNT8Yj65A08ivEwVRbRKhIO4DjbT3+oHaxBznQO0aA
         42OA==
X-Gm-Message-State: AOJu0Yx1+mkIaPKCVf4tIGHBkGiKUXEqWKSBcqscQLKCo8TBnc89HbAE
	bDfSPnsDN8UQnauF7RM6OQW8Wh0xXiwaDUEteM0=
X-Google-Smtp-Source: AGHT+IHV+qETs7KIqQpxajpkadCfl4U3dLTXI6w44UlsF35bbA3YEQMAISGUI6KsCZ+oCcDlqqrNL1W8Whh8FdzNzlg=
X-Received: by 2002:a67:c18b:0:b0:457:d97a:4553 with SMTP id
 h11-20020a67c18b000000b00457d97a4553mr4978671vsj.25.1697632130954; Wed, 18
 Oct 2023 05:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
In-Reply-To: <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 18 Oct 2023 15:28:39 +0300
Message-ID: <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001ffff70607fcc888"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 12:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105575

--0000000000001ffff70607fcc888
Content-Type: text/plain; charset="UTF-8"

Following simple test recipe will fail now when trying to use Protobuf with
CMake.

inherit cmake
DEPENDS += "protobuf"

do_configure:prepend() {
    echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
}

BBCLASSEXTEND = "nativesdk"

---
CMake Error at
tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107
(message):
  The imported target "protobuf::protoc" references the file


 "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"

  but this file does not exist.
---

I don't quite see why every project/recipe should fix this independently
when the simple workaround for this yocto-specific issue is available
(namely the use of SYSROOT_DIRS).

-samuli

ps. qtgrpc recipe and other Qt6 recipes are now visible in the layerindex
https://layers.openembedded.org/layerindex/recipe/348210/


On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> I'd like to follow-up on this and say that I see this issue now with
> nativesdk build, in particular nativesdk-grpc recipe fails in master with
> the same error. I hope that's partially related to the issue everybody is
> confused about, but I'd like understand how to properly fix it.
>
> |   The imported target "protobuf::protoc" references the file
> |
> |
> "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
> |
> |   but this file does not exist.  Possible reasons include:
> |
> |   * The file was deleted, renamed, or moved to another location.
>
> The protoc-23.4.0 file already exists in the recipe-sysroot-native.
>
> And we do want protoc to be present in the SDK, but nativesdk build is a
> cross-compilation, because SDKMACHINE and HOST might be different.
> In this particular grpc case there's an option to say where the actual
> protoc executable is (
> -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
> is passed to grpc).
>
> So there shouldn't be any issues here, but nativesdk build still fails.
>
> Looking into it further I see that protoc is actually packaged by
> protobuf-compiler package, but when I try to add a package dependency to
> grpc recipe I get this:
>
> nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler
>
> Moreover, if I go into devshell and forcefully install
> nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is happy and
> compiles!
>
> So something wrong with the dependencies in protobuf recipe, but I can't
> figure out yet what exactly. Any ideas?
>
> Regards,
> Slava
>
> On 02.10.2023 18:25, Vyacheslav Yurkov via lists.openembedded.org wrote:
>
> On 01.10.2023 20:22, Martin Jansa wrote:
>
>
> Issue with .cmake file from protobuf, right?
>
>
> No, it's the issue with the cmake of the project that uses protobuf. But
> that depends on a user case, perhaps I didn't get it properly.
>
>
>
>> If we can properly fix it at the recipe level, then why should we keep
>> this workaround/hack?
>>
>> Also if you really need it, you can have a .bbappend for protoc/grpc in
>> the downstream layer. But I would be in favor to avoid this by default no?
>>
>
> I haven't seen any proper fix for this exact issue. Yes you can patch
> .cmake generation not to include bindir when building for target (while it
> needs it for native build), but then that change will break possible use of
> protobuf on target, so the SYSROOT_DIRS still seems like lesser evil here.
>
> Here are some examples from meta-ros:
>
> https://github.com/ros/meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a62cc
>
> https://github.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c
>
> https://github.com/ros/meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c4104533
>
> https://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf
>
> I don't care about protobuf, but the explanation from Samuli looks like
> the same issue as what I remember from above and I don't see how
> SYSROOT_DIRS causes mixing executables or any issues for installing them
> for target.
>
>
> I didn't look at the original issue of Samuli, but your issue is also
> fixed by a workaround. IMHO, the proper fix would be not to make CMake
> "happy" by providing a binary it can't use, but a proper export of
> cross-compiled tools for
> https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt
> library. I'd say the workflow should be similar to protobuf/grpc recipes,
> i.e. a native recipe builds the libraries only, and the target recipe
> builds tools and libraries.
>
> Regards,
> Slava
>
>
>

--0000000000001ffff70607fcc888
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Following simple test recipe will fail now when tryin=
g to use Protobuf with CMake.=C2=A0</div><div><br></div><div>inherit cmake<=
br>DEPENDS +=3D &quot;protobuf&quot;<br><br>do_configure:prepend() {<br>=C2=
=A0 =C2=A0 echo &quot;find_package(Protobuf CONFIG)&quot; &gt; ${S}/CMakeLi=
sts.txt<br>}<br><br>BBCLASSEXTEND =3D &quot;nativesdk&quot;</div><div><br><=
/div><div>---</div><div>CMake Error at tmp/work/x86_64-nativesdk-pokysdk-li=
nux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/=
sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake=
:107 (message):<br>=C2=A0 The imported target &quot;protobuf::protoc&quot; =
references the file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;tmp/work/x86_64-native=
sdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardco=
ded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0&quot;<br>=
<br>=C2=A0 but this file does not exist.</div><div>---<br></div><div><br></=
div><div>I don&#39;t quite see why every project/recipe should fix this ind=
ependently when the simple workaround for this yocto-specific issue is avai=
lable (namely the use of=C2=A0SYSROOT_DIRS).</div><div><br></div><div>-samu=
li</div><div><br></div><div>ps. qtgrpc recipe and other Qt6 recipes are now=
 visible in the layerindex <a href=3D"https://layers.openembedded.org/layer=
index/recipe/348210/">https://layers.openembedded.org/layerindex/recipe/348=
210/</a></div><div><br>  </div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yur=
kov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>I&#39;d like to follow-up on this and say
      that I see this issue now with nativesdk build, in particular
      nativesdk-grpc recipe fails in master with the same error. I hope
      that&#39;s partially related to the issue everybody is confused about=
,
      but I&#39;d like understand how to properly fix it.<br>
      <br>
      |=C2=A0=C2=A0 The imported target &quot;protobuf::protoc&quot; refere=
nces the file<br>
      | <br>
      |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
&quot;/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux=
/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/=
sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0&quot;<br>
      | <br>
      |=C2=A0=C2=A0 but this file does not exist.=C2=A0 Possible reasons in=
clude:<br>
      | <br>
      |=C2=A0=C2=A0 * The file was deleted, renamed, or moved to another lo=
cation.<br>
      <br>
      The protoc-23.4.0 file already exists in the
      recipe-sysroot-native.<br>
      <br>
      And we do want protoc to be present in the SDK, but nativesdk
      build is a cross-compilation, because SDKMACHINE and HOST might be
      different.<br>
      In this particular grpc case there&#39;s an option to say where the
      actual protoc executable is (
-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=3D/home/uvv/projects/poky/build/tmp/work=
/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native=
/usr/bin/protoc
      is passed to grpc). <br>
      <br>
      So there shouldn&#39;t be any issues here, but nativesdk build still
      fails.<br>
      <br>
      Looking into it further I see that protoc is actually packaged by
      protobuf-compiler package, but when I try to add a package
      dependency to grpc recipe I get this:<br>
      <br>
      nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler<br>
      <br>
      Moreover, if I go into devshell and forcefully install
      nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is
      happy and compiles!<br>
      <br>
      So something wrong with the dependencies in protobuf recipe, but I
      can&#39;t figure out yet what exactly. Any ideas?<br>
      <br>
      Regards,<br>
      Slava<br>
      <br>
      On 02.10.2023 18:25, Vyacheslav Yurkov via <a href=3D"http://lists.op=
enembedded.org" target=3D"_blank">lists.openembedded.org</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>On 01.10.2023 20:22, Martin Jansa
        wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <br>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>Issue with .cmake file from protobuf, right?</div>
          </div>
        </div>
      </blockquote>
      <br>
      No, it&#39;s the issue with the cmake of the project that uses
      protobuf. But that depends on a user case, perhaps I didn&#39;t get i=
t
      properly.<br>
      <br>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div dir=3D"ltr">
                <div><span class=3D"gmail_default" style=3D"font-family:mon=
ospace">If w</span><span class=3D"gmail_default">e can properly fix it at t=
he
                    recipe level, then why should we keep this
                    workaround/hack?</span></div>
                <div><span class=3D"gmail_default"><br>
                  </span></div>
                <div><span class=3D"gmail_default">Also if you really need
                    it, you can=C2=A0have a .bbappend for protoc/grpc in th=
e
                    downstream layer. But I would be in favor to avoid
                    this by default no?</span></div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I haven&#39;t seen any proper fix for this exact issue. Ye=
s
              you can patch .cmake generation not to include bindir when
              building for target (while it needs it for native build),
              but then that change will break possible use of protobuf
              on target, so the SYSROOT_DIRS still seems like lesser
              evil here.</div>
            <div><br>
            </div>
            <div>Here are some examples from meta-ros:</div>
            <div><a href=3D"https://github.com/ros/meta-ros/commit/875ceed4=
b1c693c2eb0f2b7ea85385be576a62cc" target=3D"_blank">https://github.com/ros/=
meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a62cc</a><br>
            </div>
            <div><a href=3D"https://github.com/ros/meta-ros/commit/67c03755=
543655ad0634e078bc30d8ab9969a16c" target=3D"_blank">https://github.com/ros/=
meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c</a><br>
            </div>
            <div><a href=3D"https://github.com/ros/meta-ros/commit/5e61eb05=
20d2841c0da7e14eecc833b3c4104533" target=3D"_blank">https://github.com/ros/=
meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c4104533</a><br>
            </div>
            <div><a href=3D"https://github.com/ros/meta-ros/commit/a53bb7cc=
8b45a72b704e75311d68b37a6db50cdf" target=3D"_blank">https://github.com/ros/=
meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf</a><br>
            </div>
            <div><br>
            </div>
            <div>I don&#39;t care about protobuf, but the explanation from
              Samuli looks like the same issue as what I remember from
              above and I don&#39;t see how SYSROOT_DIRS causes mixing
              executables or any issues for installing them for target.</di=
v>
          </div>
        </div>
      </blockquote>
      <br>
      I didn&#39;t look at the original issue of Samuli, but your issue is
      also fixed by a workaround. IMHO, the proper fix would be not to
      make CMake &quot;happy&quot; by providing a binary it can&#39;t use, =
but a
      proper export of cross-compiled tools for <a href=3D"https://github.c=
om/geographiclib/geographiclib/blob/main/CMakeLists.txt" target=3D"_blank">=
https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt</a>
      library. I&#39;d say the workflow should be similar to protobuf/grpc
      recipes, i.e. a native recipe builds the libraries only, and the
      target recipe builds tools and libraries.<br>
      <br>
      Regards,<br>
      Slava</blockquote>
    <br>
  </div>

</blockquote></div>

--0000000000001ffff70607fcc888--

