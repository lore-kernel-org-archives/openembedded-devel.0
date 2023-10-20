Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782BBCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:11:26 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.49279.1697785880893522508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3J1w7+K;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-49d0f24a815so204947e0c.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697785880; x=1698390680; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiFipaDMKkAtuh2dD9J2U0e2djcwSUiT84xGePMecw=;
        b=g3J1w7+KWE4HcjcJyZQCwPUXQ9CKxyJiv/lz+oHotVHGxI6/kPVfohvPh/5NZMvubs
         TiK++oJwP2Bjux7/sFpgimWEynQkPRfBK/S1StEOfx7hE6LYGC94274XxaO/oORldE5b
         ku+YSFf0+Sb1RH/l9chuSIOU+7DMpC9O/SvdOiI3BojflKpZnRxoyqFqX8RlnXWbPE5P
         Bqjw1MpSxRA/lICJ8BYs9Ne7LRpHBrp8NWxd1+8y5BpAt+fRDTN3u0feKegLSFLZq7Pt
         KWIVWP/ndY8XpCfAUX8zUYIP6h0pXrP9xKqHzjO7lGxjQD8i9J5rVYDQ9GVwdYG973ED
         k+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697785880; x=1698390680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTiFipaDMKkAtuh2dD9J2U0e2djcwSUiT84xGePMecw=;
        b=khSoRZcsXX749HVDSnEPPsGpJ4X7DdhqE9chVOrcQYYVI6x9L8/WFB2tPBTfow0AVl
         2PQtmmJ6XjB+ycNH6Bmjf8AhmZtO9mMWy0Wd6ixDdQnmGXh0j7XoO+Y4Mwj3T356qr4j
         knmty8mMyoR3KIyFWvir6CUyrVmNr6Ma3t7JqtvmPNhkKVa7FBsUESVUqCoacWUQK2Yd
         mv2CaH8yp/vja6+4vRBFkqGDinE7/8ide5XWrIj2aQmt2DNun7T92vWTVaH1pnCef8N9
         SCt6aHv4b3dArk9CPmoppv2T+dRSs8SlNAuytTSMuKdv9GbeuPM9/AvAahkVf/K+bC1W
         XOKA==
X-Gm-Message-State: AOJu0YyfrH0LNbziovpw5hHKKrPLRJQW/IS4IGKmn/4ljHR0pEK1mhLH
	0THRXfxEwyT7f0UOrQN7LEbHneCbVpH2nOLxzSE=
X-Google-Smtp-Source: AGHT+IHed00FbCm3PUXUygrxSds2l5G30rnRtUusFaFE4bU0qV65uEvS2D+SCzcsXCotTpqnzN0sw3XfjF82Hb/d1sk=
X-Received: by 2002:a67:ab0c:0:b0:452:6ac0:ed19 with SMTP id
 u12-20020a67ab0c000000b004526ac0ed19mr1238827vse.31.1697785879809; Fri, 20
 Oct 2023 00:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com> <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
In-Reply-To: <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 20 Oct 2023 10:11:08 +0300
Message-ID: <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004558340608209402"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 07:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105612

--0000000000004558340608209402
Content-Type: text/plain; charset="UTF-8"

Dependency to the recipe name will always install all packages to RSS.
You can verify this by checking that the libprotoc.so from the
nativesdk-protobuf-compile package is in the sysroot.
The problem you are facing is the fact that binaries are not installed into
the sysroot (for nativesdk builds), so you are only missing the
bin/protoc-23.4.0 file.
The proposed and twice reverted fix for this is the aforementioned
SYSROOT_DIRS.

-samuli

On Fri, 20 Oct 2023 at 09:17, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> I think the problem goes down to how dependencies are populated in the
> sysroot. I raised this question in oe-core mailing list
> https://lists.openembedded.org/g/openembedded-core/message/189324 , but
> didn't get an answer yet.
>
> DEPENDS += "protobuf" will only install the main package of protobuf to
> the sysroot, because it assumes that nativesdk-protobuf-compiler is also
> part of the main package (which is not). I guess the part of the system
> populating sysroot deals with recipes only, and not with packages. I'm
> still trying to understand how that should be addressed properly.
> My understanding is that either all packages should be installed to
> sysroot (which recipe claims it provides), or we need a way to indicate a
> package level dependency (i.e. nativesdk-protobuf-compiler in this case)
>
> Any ideas?
>
> Slava
>
> On 18.10.2023 14:28, Samuli Piippo wrote:
>
> Following simple test recipe will fail now when trying to use Protobuf
> with CMake.
>
> inherit cmake
> DEPENDS += "protobuf"
>
> do_configure:prepend() {
>     echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
> }
>
> BBCLASSEXTEND = "nativesdk"
>
> ---
> CMake Error at
> tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107
> (message):
>   The imported target "protobuf::protoc" references the file
>
>
>  "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>
>   but this file does not exist.
> ---
>
> I don't quite see why every project/recipe should fix this independently
> when the simple workaround for this yocto-specific issue is available
> (namely the use of SYSROOT_DIRS).
>
> -samuli
>
> ps. qtgrpc recipe and other Qt6 recipes are now visible in the layerindex
> https://layers.openembedded.org/layerindex/recipe/348210/
>
>
> On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> I'd like to follow-up on this and say that I see this issue now with
>> nativesdk build, in particular nativesdk-grpc recipe fails in master with
>> the same error. I hope that's partially related to the issue everybody is
>> confused about, but I'd like understand how to properly fix it.
>>
>> |   The imported target "protobuf::protoc" references the file
>> |
>> |
>> "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>> |
>> |   but this file does not exist.  Possible reasons include:
>> |
>> |   * The file was deleted, renamed, or moved to another location.
>>
>> The protoc-23.4.0 file already exists in the recipe-sysroot-native.
>>
>> And we do want protoc to be present in the SDK, but nativesdk build is a
>> cross-compilation, because SDKMACHINE and HOST might be different.
>> In this particular grpc case there's an option to say where the actual
>> protoc executable is (
>> -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
>> is passed to grpc).
>>
>> So there shouldn't be any issues here, but nativesdk build still fails.
>>
>> Looking into it further I see that protoc is actually packaged by
>> protobuf-compiler package, but when I try to add a package dependency to
>> grpc recipe I get this:
>>
>> nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler
>>
>> Moreover, if I go into devshell and forcefully install
>> nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is happy and
>> compiles!
>>
>> So something wrong with the dependencies in protobuf recipe, but I can't
>> figure out yet what exactly. Any ideas?
>>
>> Regards,
>> Slava
>>
>>

--0000000000004558340608209402
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dependency to the recipe name will always install all=
 packages to RSS.</div><div>You can verify this by checking that the libpro=
toc.so from the nativesdk-protobuf-compile package is in the sysroot.</div>=
<div>The problem you are facing is the fact that binaries are not installed=
 into the sysroot (for nativesdk builds), so you are only missing the bin/p=
rotoc-23.4.0 file.<br></div><div>The proposed and twice reverted fix for th=
is is the aforementioned SYSROOT_DIRS.</div><div><br></div><div>-samuli<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, 20 Oct 2023 at 09:17, Vyacheslav Yurkov &lt;<a href=3D"mailto=
:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>I think the problem goes down to how
      dependencies are populated in the sysroot. I raised this question
      in oe-core mailing list
      <a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/189324" target=3D"_blank">https://lists.openembedded.org/g/openembedded-co=
re/message/189324</a>
      , but didn&#39;t get an answer yet.<br>
      <br>
      DEPENDS +=3D &quot;protobuf&quot; will only install the main package =
of
      protobuf to the sysroot, because it assumes that
      nativesdk-protobuf-compiler is also part of the main package
      (which is not). I guess the part of the system populating sysroot
      deals with recipes only, and not with packages. I&#39;m still trying
      to understand how that should be addressed properly.<br>
      My understanding is that either all packages should be installed
      to sysroot (which recipe claims it provides), or we need a way to
      indicate a package level dependency (i.e.
      nativesdk-protobuf-compiler in this case)<br>
      <br>
      Any ideas?<br>
      <br>
      Slava<br>
      <br>
      On 18.10.2023 14:28, Samuli Piippo wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Following simple test recipe will fail now when trying to
          use Protobuf with CMake.=C2=A0</div>
        <div><br>
        </div>
        <div>inherit cmake<br>
          DEPENDS +=3D &quot;protobuf&quot;<br>
          <br>
          do_configure:prepend() {<br>
          =C2=A0 =C2=A0 echo &quot;find_package(Protobuf CONFIG)&quot; &gt;
          ${S}/CMakeLists.txt<br>
          }<br>
          <br>
          BBCLASSEXTEND =3D &quot;nativesdk&quot;</div>
        <div><br>
        </div>
        <div>---</div>
        <div>CMake Error at
tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/u=
sr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/c=
make/protobuf/protobuf-targets.cmake:107
          (message):<br>
          =C2=A0 The imported target &quot;protobuf::protoc&quot; reference=
s the file<br>
          <br>
          =C2=A0 =C2=A0
=C2=A0&quot;tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/reci=
pe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-lin=
ux/usr/bin/protoc-23.4.0&quot;<br>
          <br>
          =C2=A0 but this file does not exist.</div>
        <div>---<br>
        </div>
        <div><br>
        </div>
        <div>I don&#39;t quite see why every project/recipe should fix this
          independently when the simple workaround for this
          yocto-specific issue is available (namely the use
          of=C2=A0SYSROOT_DIRS).</div>
        <div><br>
        </div>
        <div>-samuli</div>
        <div><br>
        </div>
        <div>ps. qtgrpc recipe and other Qt6 recipes are now visible in
          the layerindex <a href=3D"https://layers.openembedded.org/layerin=
dex/recipe/348210/" target=3D"_blank">https://layers.openembedded.org/layer=
index/recipe/348210/</a></div>
        <div><br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Oct 2023 at 15:06,
          Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" targe=
t=3D"_blank">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>I&#39;d like to follow-up on this and say that I see this
              issue now with nativesdk build, in particular
              nativesdk-grpc recipe fails in master with the same error.
              I hope that&#39;s partially related to the issue everybody is
              confused about, but I&#39;d like understand how to properly
              fix it.<br>
              <br>
              |=C2=A0=C2=A0 The imported target &quot;protobuf::protoc&quot=
; references the
              file<br>
              | <br>
              |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
&quot;/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux=
/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/=
sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0&quot;<br>
              | <br>
              |=C2=A0=C2=A0 but this file does not exist.=C2=A0 Possible re=
asons
              include:<br>
              | <br>
              |=C2=A0=C2=A0 * The file was deleted, renamed, or moved to an=
other
              location.<br>
              <br>
              The protoc-23.4.0 file already exists in the
              recipe-sysroot-native.<br>
              <br>
              And we do want protoc to be present in the SDK, but
              nativesdk build is a cross-compilation, because SDKMACHINE
              and HOST might be different.<br>
              In this particular grpc case there&#39;s an option to say
              where the actual protoc executable is (
-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=3D/home/uvv/projects/poky/build/tmp/work=
/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native=
/usr/bin/protoc
              is passed to grpc). <br>
              <br>
              So there shouldn&#39;t be any issues here, but nativesdk buil=
d
              still fails.<br>
              <br>
              Looking into it further I see that protoc is actually
              packaged by protobuf-compiler package, but when I try to
              add a package dependency to grpc recipe I get this:<br>
              <br>
              nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler<br>
              <br>
              Moreover, if I go into devshell and forcefully install
              nativesdk-libprotobuf-compiler, then `bitbake
              nativesdk-grpc` is happy and compiles!<br>
              <br>
              So something wrong with the dependencies in protobuf
              recipe, but I can&#39;t figure out yet what exactly. Any
              ideas?<br>
              <br>
              Regards,<br>
              Slava<br>
              <br>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <pre cols=3D"72"></pre>
  </div>

</blockquote></div>

--0000000000004558340608209402--

