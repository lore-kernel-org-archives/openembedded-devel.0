Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B59CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:07:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.49253.1697785658491656404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmAt6tkq;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40651a726acso3960275e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697785657; x=1698390457; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9VC/jQkDtpxDbs0xLTLnQiTZjFDjO7k6DfN/PrtosM=;
        b=lmAt6tkqBhrj2lr875ateebFjrsCpyOCYMFDFdlsx/uNPDmsa2fypWlYeg3Md16EP9
         HUkfWvXxkS0ke8j13nyvAdMQxJM0uod9jR3hwAQmVZkuNy1ApKdFTy2k9WquyokSKrQh
         VWmMBINN1j6Jke6gYUExdfInWF0DbbvMtu1HhWZpcJpxJ+ZKrz1L6N8855klhCwvXFf9
         tzsam2ZA+kw1X3lKJKDsHWkf50VL53JJKqIF6HWSQQ2VtTWQmxVoGjXQW/yU52QytTgW
         VqxRmp6YQNefPZ0EuGDzxWTsVv00o+yjpTYN5p34ea8t6u0Ef8xJBGVQIikOwpHP8w0P
         4w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697785657; x=1698390457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9VC/jQkDtpxDbs0xLTLnQiTZjFDjO7k6DfN/PrtosM=;
        b=vzoYhA98BIRCAmsc86Qtm3TyGyIOrTIY6IIy9VtW7TzmA2hY/apz81F7Ch1vXhAj0L
         1AhCFWKI/3wIzw0CtFCEm9Btwc11iPWv2bC04TNFT6+fUpjc8XXd6BZBHp0InUrZT8jd
         eT0Iq6HeSqrxl0HI1eVvUzfMz+LjOm6Yt3TQ6UuwvNUB2ncqo4ZDdyRSC0naNRuIj0rz
         ckpxKs7xuLoIMngY25cLmeVBFc4Sr4TVvCjloHPj0t3U/3L7LWjjMXpM0meeUWBtxFJs
         N17xaJCXednJKQDLzwb3JQNLZx/O1WlTdkmgBRu81jXAg2K5K02DSZDvbRcRGyj2QKxj
         n28Q==
X-Gm-Message-State: AOJu0YzXjjdZyqlfg9Qq7sxEgMa0OO+rbQB5sg53VDo23rmLL9qd3meu
	Cua4ePXx84T4rJ2P5424//SgBLPdJnZJx+4YEjE=
X-Google-Smtp-Source: AGHT+IEj8MHNYMKHuEcEyS5XfY7rjRLim4YVVx0Jc51L74aZNz3xidxQqX3WSZjL4LHaiFWk7NIanV/8OVI01yVlAzI=
X-Received: by 2002:a05:600c:4444:b0:405:49aa:d578 with SMTP id
 v4-20020a05600c444400b0040549aad578mr766515wmn.37.1697785656659; Fri, 20 Oct
 2023 00:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com> <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
In-Reply-To: <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Oct 2023 09:07:21 +0200
Message-ID: <CA+chaQcRqvNw=poVdCM0waCCWQ+i7Ys09EHjxPbLKsV8biLnaA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f8534606082086cc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 07:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105611

--000000000000f8534606082086cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, it installs whatever recipe stages in do_populate_sysroot which is
controlled by SYSROOT_DIRS, so the solution still makes sense to me as
explained before and IMHO is better than the alternatives (changing the
protobuf .cmake files to be different in sysroot and in PN-dev).

On Fri, Oct 20, 2023 at 8:17=E2=80=AFAM Vyacheslav Yurkov <uvv.mail@gmail.c=
om>
wrote:

> I think the problem goes down to how dependencies are populated in the
> sysroot. I raised this question in oe-core mailing list
> https://lists.openembedded.org/g/openembedded-core/message/189324 , but
> didn't get an answer yet.
>
> DEPENDS +=3D "protobuf" will only install the main package of protobuf to
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
> DEPENDS +=3D "protobuf"
>
> do_configure:prepend() {
>     echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
> }
>
> BBCLASSEXTEND =3D "nativesdk"
>
> ---
> CMake Error at
> tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib=
/cmake/protobuf/protobuf-targets.cmake:107
> (message):
>   The imported target "protobuf::protoc" references the file
>
>
>  "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysro=
ot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/b=
in/protoc-23.4.0"
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
>> nativesdk build, in particular nativesdk-grpc recipe fails in master wit=
h
>> the same error. I hope that's partially related to the issue everybody i=
s
>> confused about, but I'd like understand how to properly fix it.
>>
>> |   The imported target "protobuf::protoc" references the file
>> |
>> |
>> "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/n=
ativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sy=
sroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
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
>> -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=3D/home/uvv/projects/poky/build/tmp/w=
ork/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-nat=
ive/usr/bin/protoc
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
>> nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is happy a=
nd
>> compiles!
>>
>> So something wrong with the dependencies in protobuf recipe, but I can't
>> figure out yet what exactly. Any ideas?
>>
>> Regards,
>> Slava
>>
>>

--000000000000f8534606082086cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, it installs whatever recipe stages in do_populate_sysr=
oot which is controlled by=C2=A0SYSROOT_DIRS, so the solution still makes s=
ense to me as explained before and IMHO is better than the alternatives (ch=
anging the protobuf .cmake files to be different in sysroot and in PN-dev).=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Oct 20, 2023 at 8:17=E2=80=AFAM Vyacheslav Yurkov &lt;<a href=3D"ma=
ilto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><u></u>

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

--000000000000f8534606082086cc--

