Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC97C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 00:13:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.109687.1699488800902518413
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 16:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gANLkyyk;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50939d39d0fso370508e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 16:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699488799; x=1700093599; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1BKw+XL89iXvzMmwUUunSU6VZV9v142+tfhQVkN6Rc=;
        b=gANLkyykXJcDtMls55HLYlh0/Y/Qi0YxcQiOBotNfXXLEDK2zx37Qjfmxnws8meFYN
         hh8eeYRrI5qtF4T3tKUmBDI6WtmIx/xyvE2TDcTQShnYr1uf7dFQmJDj1HCjmHD5GkT/
         VJ0B7jC+ZndHa8qHjwjW+rQ7xXCJrmSGHyXbY1DjTlhJaIskAW35BUE2Ke8eic1uETmb
         mv1CSwdXwRwXFeBICKTvVMMZ/gaTdmM+dekIQzZACQ+wB4C/8izWBlT72mzE9sqbyhkH
         67GnxSbyrYYL2+uZ3yOok2+zCjUatEA9UMbMhZYOZGCYKVAbYbebjxilXy3OFAl7OESy
         tBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699488799; x=1700093599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1BKw+XL89iXvzMmwUUunSU6VZV9v142+tfhQVkN6Rc=;
        b=VDLOkn3PONyll6xt6S13rNjV8PQPuxYdoqz8vOjakSt3QdKUoUalCgOqe/rA6hLRqY
         UHdMmmvf36nVgkMLhvpFOM4CRWvfXpmLZtFZMQJR8Asp3wUn14cNw1df+hr7p7LUTqn7
         26zo9XLMaMNi8DRSUjityaqs+RDt1rtBh8AJHe/RvPl7qS/pY8j6dKdCVXx2YshZC67g
         UgYvWzW6bjr2xVHWmCPCCuafMgUJFScB58AjoPt1b2X6Y1urptA1erwEN9Bu2l0bTley
         2jh0rUKsYGqa8+QbYcPRLmq3jSpibJ1liT4ZhSGwz9qS7LzGCTs40VsZBoSOan/cp5uI
         8atA==
X-Gm-Message-State: AOJu0YyqhMyCUEkb5yrq03RYoPHkZudMBOvjIG25vE4Q4ZGSNd5fwULR
	r1MnoA3MbRR281onWQ0D6QnGxbfgZlGjyBBUVhs=
X-Google-Smtp-Source: AGHT+IG1ebv4Nu7BKSpVzBypA4roKlQP7fCwgAM/6cEg1XO5ERlHYfjeyfp4bt6xdugFiLWNVXfwQSZg07y1ZYzt1/Y=
X-Received: by 2002:a05:6512:3da4:b0:503:3680:6726 with SMTP id
 k36-20020a0565123da400b0050336806726mr179767lfv.6.1699488798546; Wed, 08 Nov
 2023 16:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com> <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com> <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org> <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
In-Reply-To: <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 9 Nov 2023 09:13:08 +0900
Message-ID: <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000231fe90609ad1213"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 00:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106489

--000000000000231fe90609ad1213
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuli,

Le mer. 8 nov. 2023, 22:30, Samuli Piippo <samuli.piippo@gmail.com> a
=C3=A9crit :

> Hi Cl=C3=A9ment,
>
> Were you able to reproduce the issue?
>

Sorry I'm on vacation without access to a laptop at the moment.

But if I understand the issue is not related to a target or native recipes
issue, right?

It's only when building the SDK and then try to build an application with
it right?

Maybe there is a missing dependency when building the SDK.

Regards,
Clement



> On Tue, 24 Oct 2023 at 16:33, Samuli Piippo via lists.openembedded.org
> <samuli.piippo=3Dgmail.com@lists.openembedded.org> wrote:
>
>> The protoc binary is not enabled for target builds. Try nativesdk build
>> and it should then fail to find it.
>>
>> On Tue, 24 Oct 2023 at 14:53, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
>>
>>> Hi,
>>>
>>> I have pushed a branch on my repo:
>>> https://github.com/clementperon/meta-openembedded/tree/test_protobuf
>>>
>>> and tried to reproduce the issue on my setup with the following kas yam=
l
>>> file.
>>>
>>> But I don't see any issue at the configure stage.
>>>
>>> cat
>>> XXXX/cortexa57-poky-linux-musl/test-protobuf/0.3/temp/log.do_configure
>>>
>>> Show that -- Version:23.4.0 of Protobuf is found without any issue
>>>
>>> Cmake host version is
>>> $> cmake --version
>>> cmake version 3.27.7
>>>
>>> I'm missing something ?
>>>
>>> Regards,
>>> Clement
>>>
>>> kas.yml
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> header:
>>>   version: 8
>>>
>>> machine: qemuarm64
>>> distro: poky
>>> target:
>>>   - test-protobuf
>>>
>>> repos:
>>>   poky:
>>>     url: https://git.yoctoproject.org/git/poky
>>>     path: layers/poky
>>>     refspec: master
>>>     layers:
>>>       meta:
>>>       meta-poky:
>>>       meta-yocto-bsp:
>>>
>>>   meta-openembedded:
>>>     url: https://github.com/clementperon/meta-openembedded
>>>     path: layers/meta-openembedded
>>>     refspec: test_protobuf
>>>     layers:
>>>       meta-oe:
>>>       meta-networking:
>>>       meta-python:
>>>
>>> bblayers_conf_header:
>>>   standard: |
>>>     POKY_BBLAYERS_CONF_VERSION =3D "2"
>>>     BBPATH =3D "${TOPDIR}"
>>>     BBFILES ?=3D ""
>>>
>>> local_conf_header:
>>>   libc: |
>>>     TCLIBC =3D "musl"
>>>   standard: |
>>>     CONF_VERSION =3D "2"
>>>     PACKAGE_CLASSES =3D "package_ipk"
>>>   debug-tweaks: |
>>>     EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>>>
>>>   diskmon: |
>>>     BB_DISKMON_DIRS =3D "\
>>>         STOPTASKS,${TMPDIR},1G,100K \
>>>         STOPTASKS,${DL_DIR},1G,100K \
>>>         STOPTASKS,${SSTATE_DIR},1G,100K \
>>>         STOPTASKS,/tmp,100M,100K \
>>>         ABORT,${TMPDIR},100M,1K \
>>>         ABORT,${DL_DIR},100M,1K \
>>>         ABORT,${SSTATE_DIR},100M,1K \
>>>         ABORT,/tmp,10M,1K"
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> On Sun, 22 Oct 2023 at 20:45, Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> wrote:
>>> >
>>> > I'm a bit confused here.
>>> >
>>> > I just did 'find
>>> tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/ -name
>>> "protoc*"' and I see protoc binary only in recipe-sysroot-native. That
>>> tells me that protoc, which is a part of nativesdk-protobuf-compiler, i=
s
>>> not installed to recipe-sysroot.
>>> >
>>> > What am I missing here?
>>> >
>>> > Slava
>>> >
>>> > On 20.10.2023 09:35, Martin Jansa wrote:
>>> >
>>> > do_prepare_recipe_sysroot doesn't install any packages to RSS. Only
>>> package manager on target or in do_rootfs uses packages.
>>> >
>>> > It installs the files from dependency populate_sysroot task.
>>> >
>>> > On Fri, Oct 20, 2023 at 9:11=E2=80=AFAM Samuli Piippo <samuli.piippo@=
gmail.com>
>>> wrote:
>>> >>
>>> >> Dependency to the recipe name will always install all packages to RS=
S.
>>> >> You can verify this by checking that the libprotoc.so from the
>>> nativesdk-protobuf-compile package is in the sysroot.
>>> >> The problem you are facing is the fact that binaries are not
>>> installed into the sysroot (for nativesdk builds), so you are only miss=
ing
>>> the bin/protoc-23.4.0 file.
>>> >> The proposed and twice reverted fix for this is the aforementioned
>>> SYSROOT_DIRS.
>>> >>
>>> >> -samuli
>>> >>
>>> >> On Fri, 20 Oct 2023 at 09:17, Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> wrote:
>>> >>>
>>> >>> I think the problem goes down to how dependencies are populated in
>>> the sysroot. I raised this question in oe-core mailing list
>>> https://lists.openembedded.org/g/openembedded-core/message/189324 , but
>>> didn't get an answer yet.
>>> >>>
>>> >>> DEPENDS +=3D "protobuf" will only install the main package of proto=
buf
>>> to the sysroot, because it assumes that nativesdk-protobuf-compiler is =
also
>>> part of the main package (which is not). I guess the part of the system
>>> populating sysroot deals with recipes only, and not with packages. I'm
>>> still trying to understand how that should be addressed properly.
>>> >>> My understanding is that either all packages should be installed to
>>> sysroot (which recipe claims it provides), or we need a way to indicate=
 a
>>> package level dependency (i.e. nativesdk-protobuf-compiler in this case=
)
>>> >>>
>>> >>> Any ideas?
>>> >>>
>>> >>> Slava
>>> >>>
>>> >>> On 18.10.2023 14:28, Samuli Piippo wrote:
>>> >>>
>>> >>> Following simple test recipe will fail now when trying to use
>>> Protobuf with CMake.
>>> >>>
>>> >>> inherit cmake
>>> >>> DEPENDS +=3D "protobuf"
>>> >>>
>>> >>> do_configure:prepend() {
>>> >>>     echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
>>> >>> }
>>> >>>
>>> >>> BBCLASSEXTEND =3D "nativesdk"
>>> >>>
>>> >>> ---
>>> >>> CMake Error at
>>> tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysro=
ot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/l=
ib/cmake/protobuf/protobuf-targets.cmake:107
>>> (message):
>>> >>>   The imported target "protobuf::protoc" references the file
>>> >>>
>>> >>>
>>> "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysr=
oot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/=
bin/protoc-23.4.0"
>>> >>>
>>> >>>   but this file does not exist.
>>> >>> ---
>>> >>>
>>> >>> I don't quite see why every project/recipe should fix this
>>> independently when the simple workaround for this yocto-specific issue =
is
>>> available (namely the use of SYSROOT_DIRS).
>>> >>>
>>> >>> -samuli
>>> >>>
>>> >>> ps. qtgrpc recipe and other Qt6 recipes are now visible in the
>>> layerindex https://layers.openembedded.org/layerindex/recipe/348210/
>>> >>>
>>> >>>
>>> >>> On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov <uvv.mail@gmail.com=
>
>>> wrote:
>>> >>>>
>>> >>>> I'd like to follow-up on this and say that I see this issue now
>>> with nativesdk build, in particular nativesdk-grpc recipe fails in mast=
er
>>> with the same error. I hope that's partially related to the issue every=
body
>>> is confused about, but I'd like understand how to properly fix it.
>>> >>>>
>>> >>>> |   The imported target "protobuf::protoc" references the file
>>> >>>> |
>>> >>>> |
>>> "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/=
nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/s=
ysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>>> >>>> |
>>> >>>> |   but this file does not exist.  Possible reasons include:
>>> >>>> |
>>> >>>> |   * The file was deleted, renamed, or moved to another location.
>>> >>>>
>>> >>>> The protoc-23.4.0 file already exists in the recipe-sysroot-native=
.
>>> >>>>
>>> >>>> And we do want protoc to be present in the SDK, but nativesdk buil=
d
>>> is a cross-compilation, because SDKMACHINE and HOST might be different.
>>> >>>> In this particular grpc case there's an option to say where the
>>> actual protoc executable is (
>>> -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=3D/home/uvv/projects/poky/build/tmp/=
work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-na=
tive/usr/bin/protoc
>>> is passed to grpc).
>>> >>>>
>>> >>>> So there shouldn't be any issues here, but nativesdk build still
>>> fails.
>>> >>>>
>>> >>>> Looking into it further I see that protoc is actually packaged by
>>> protobuf-compiler package, but when I try to add a package dependency t=
o
>>> grpc recipe I get this:
>>> >>>>
>>> >>>> nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler
>>> >>>>
>>> >>>> Moreover, if I go into devshell and forcefully install
>>> nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is happy =
and
>>> compiles!
>>> >>>>
>>> >>>> So something wrong with the dependencies in protobuf recipe, but I
>>> can't figure out yet what exactly. Any ideas?
>>> >>>>
>>> >>>> Regards,
>>> >>>> Slava
>>> >>>>
>>> >
>>> >
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105722):
>> https://lists.openembedded.org/g/openembedded-devel/message/105722
>> Mute This Topic: https://lists.openembedded.org/mt/101679410/3617605
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> samuli.piippo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000231fe90609ad1213
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Samuli,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le mer. 8 nov. 2023, 22:30, Samuli Piippo &l=
t;<a href=3D"mailto:samuli.piippo@gmail.com" target=3D"_blank" rel=3D"noref=
errer">samuli.piippo@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi <span>Cl=C3=A9ment</span>,=
</div><div><br></div><div>Were you able to reproduce the issue?<br></div></=
div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Sorry I&#39;m on vacation without access to a laptop at the moment.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">But if I understand the issue i=
s not related to a target or native recipes issue, right?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">It&#39;s only when building the SDK and t=
hen try to build an application with it right?</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Maybe there is a missing dependency when building th=
e SDK.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><di=
v dir=3D"auto">Clement=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 24 Oct 2023 at 16:33, S=
amuli Piippo via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;samuli.piipp=
o=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">The protoc binary is not enabled for target builds. Try nativesdk build =
and it should then fail to find it.<br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 24 Oct 2023 at 14:53, Cl=C3=
=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com" rel=3D"noref=
errer noreferrer" target=3D"_blank">peron.clem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I have pushed a branch on my repo:<br>
<a href=3D"https://github.com/clementperon/meta-openembedded/tree/test_prot=
obuf" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/clementperon/meta-openembedded/tree/test_protobuf</a><br>
<br>
and tried to reproduce the issue on my setup with the following kas yaml fi=
le.<br>
<br>
But I don&#39;t see any issue at the configure stage.<br>
<br>
cat XXXX/cortexa57-poky-linux-musl/test-protobuf/0.3/temp/log.do_configure<=
br>
<br>
Show that -- Version:23.4.0 of Protobuf is found without any issue<br>
<br>
Cmake host version is<br>
$&gt; cmake --version<br>
cmake version 3.27.7<br>
<br>
I&#39;m missing something ?<br>
<br>
Regards,<br>
Clement<br>
<br>
kas.yml<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
header:<br>
=C2=A0 version: 8<br>
<br>
machine: qemuarm64<br>
distro: poky<br>
target:<br>
=C2=A0 - test-protobuf<br>
<br>
repos:<br>
=C2=A0 poky:<br>
=C2=A0 =C2=A0 url: <a href=3D"https://git.yoctoproject.org/git/poky" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">https://git.yoctoproje=
ct.org/git/poky</a><br>
=C2=A0 =C2=A0 path: layers/poky<br>
=C2=A0 =C2=A0 refspec: master<br>
=C2=A0 =C2=A0 layers:<br>
=C2=A0 =C2=A0 =C2=A0 meta:<br>
=C2=A0 =C2=A0 =C2=A0 meta-poky:<br>
=C2=A0 =C2=A0 =C2=A0 meta-yocto-bsp:<br>
<br>
=C2=A0 meta-openembedded:<br>
=C2=A0 =C2=A0 url: <a href=3D"https://github.com/clementperon/meta-openembe=
dded" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/clementperon/meta-openembedded</a><br>
=C2=A0 =C2=A0 path: layers/meta-openembedded<br>
=C2=A0 =C2=A0 refspec: test_protobuf<br>
=C2=A0 =C2=A0 layers:<br>
=C2=A0 =C2=A0 =C2=A0 meta-oe:<br>
=C2=A0 =C2=A0 =C2=A0 meta-networking:<br>
=C2=A0 =C2=A0 =C2=A0 meta-python:<br>
<br>
bblayers_conf_header:<br>
=C2=A0 standard: |<br>
=C2=A0 =C2=A0 POKY_BBLAYERS_CONF_VERSION =3D &quot;2&quot;<br>
=C2=A0 =C2=A0 BBPATH =3D &quot;${TOPDIR}&quot;<br>
=C2=A0 =C2=A0 BBFILES ?=3D &quot;&quot;<br>
<br>
local_conf_header:<br>
=C2=A0 libc: |<br>
=C2=A0 =C2=A0 TCLIBC =3D &quot;musl&quot;<br>
=C2=A0 standard: |<br>
=C2=A0 =C2=A0 CONF_VERSION =3D &quot;2&quot;<br>
=C2=A0 =C2=A0 PACKAGE_CLASSES =3D &quot;package_ipk&quot;<br>
=C2=A0 debug-tweaks: |<br>
=C2=A0 =C2=A0 EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;<br>
<br>
=C2=A0 diskmon: |<br>
=C2=A0 =C2=A0 BB_DISKMON_DIRS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STOPTASKS,${TMPDIR},1G,100K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STOPTASKS,${DL_DIR},1G,100K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STOPTASKS,${SSTATE_DIR},1G,100K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STOPTASKS,/tmp,100M,100K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ABORT,${TMPDIR},100M,1K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ABORT,${DL_DIR},100M,1K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ABORT,${SSTATE_DIR},100M,1K \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ABORT,/tmp,10M,1K&quot;<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
On Sun, 22 Oct 2023 at 20:45, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.m=
ail@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">uvv.mail@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I&#39;m a bit confused here.<br>
&gt;<br>
&gt; I just did &#39;find tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk=
-grpc/1.56.2/ -name &quot;protoc*&quot;&#39; and I see protoc binary only i=
n recipe-sysroot-native. That tells me that protoc, which is a part of nati=
vesdk-protobuf-compiler, is not installed to recipe-sysroot.<br>
&gt;<br>
&gt; What am I missing here?<br>
&gt;<br>
&gt; Slava<br>
&gt;<br>
&gt; On 20.10.2023 09:35, Martin Jansa wrote:<br>
&gt;<br>
&gt; do_prepare_recipe_sysroot doesn&#39;t install any packages to RSS. Onl=
y package manager on target or in do_rootfs uses packages.<br>
&gt;<br>
&gt; It installs the files from dependency populate_sysroot task.<br>
&gt;<br>
&gt; On Fri, Oct 20, 2023 at 9:11=E2=80=AFAM Samuli Piippo &lt;<a href=3D"m=
ailto:samuli.piippo@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">samuli.piippo@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Dependency to the recipe name will always install all packages to =
RSS.<br>
&gt;&gt; You can verify this by checking that the libprotoc.so from the nat=
ivesdk-protobuf-compile package is in the sysroot.<br>
&gt;&gt; The problem you are facing is the fact that binaries are not insta=
lled into the sysroot (for nativesdk builds), so you are only missing the b=
in/protoc-23.4.0 file.<br>
&gt;&gt; The proposed and twice reverted fix for this is the aforementioned=
 SYSROOT_DIRS.<br>
&gt;&gt;<br>
&gt;&gt; -samuli<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 20 Oct 2023 at 09:17, Vyacheslav Yurkov &lt;<a href=3D"mai=
lto:uvv.mail@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">uvv=
.mail@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think the problem goes down to how dependencies are populate=
d in the sysroot. I raised this question in oe-core mailing list <a href=3D=
"https://lists.openembedded.org/g/openembedded-core/message/189324" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/g/openembedded-core/message/189324</a> , but didn&#39;t get an answ=
er yet.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; DEPENDS +=3D &quot;protobuf&quot; will only install the main p=
ackage of protobuf to the sysroot, because it assumes that nativesdk-protob=
uf-compiler is also part of the main package (which is not). I guess the pa=
rt of the system populating sysroot deals with recipes only, and not with p=
ackages. I&#39;m still trying to understand how that should be addressed pr=
operly.<br>
&gt;&gt;&gt; My understanding is that either all packages should be install=
ed to sysroot (which recipe claims it provides), or we need a way to indica=
te a package level dependency (i.e. nativesdk-protobuf-compiler in this cas=
e)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Any ideas?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Slava<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 18.10.2023 14:28, Samuli Piippo wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Following simple test recipe will fail now when trying to use =
Protobuf with CMake.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; inherit cmake<br>
&gt;&gt;&gt; DEPENDS +=3D &quot;protobuf&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; do_configure:prepend() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0echo &quot;find_package(Protobuf CONFIG)&qu=
ot; &gt; ${S}/CMakeLists.txt<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; CMake Error at tmp/work/x86_64-nativesdk-pokysdk-linux/natives=
dk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x8=
6_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107 (messa=
ge):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0The imported target &quot;protobuf::protoc&quot; r=
eferences the file<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;tmp/work/x86_64-nativesdk-pokysdk-li=
nux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/=
sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0but this file does not exist.<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don&#39;t quite see why every project/recipe should fix this=
 independently when the simple workaround for this yocto-specific issue is =
available (namely the use of SYSROOT_DIRS).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -samuli<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ps. qtgrpc recipe and other Qt6 recipes are now visible in the=
 layerindex <a href=3D"https://layers.openembedded.org/layerindex/recipe/34=
8210/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ayers.openembedded.org/layerindex/recipe/348210/</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov &lt;<a href=3D=
"mailto:uvv.mail@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>uvv.mail@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;d like to follow-up on this and say that I see this =
issue now with nativesdk build, in particular nativesdk-grpc recipe fails i=
n master with the same error. I hope that&#39;s partially related to the is=
sue everybody is confused about, but I&#39;d like understand how to properl=
y fix it.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0The imported target &quot;protobuf::protoc&q=
uot; references the file<br>
&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 &quot;/home/uvv/projects/poky/build/=
tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroo=
t/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bi=
n/protoc-23.4.0&quot;<br>
&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0but this file does not exist.=C2=A0 Possible=
 reasons include:<br>
&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0* The file was deleted, renamed, or moved to=
 another location.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The protoc-23.4.0 file already exists in the recipe-sysroo=
t-native.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; And we do want protoc to be present in the SDK, but native=
sdk build is a cross-compilation, because SDKMACHINE and HOST might be diff=
erent.<br>
&gt;&gt;&gt;&gt; In this particular grpc case there&#39;s an option to say =
where the actual protoc executable is ( -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=
=3D/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/na=
tivesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc is passed to grpc)=
.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; So there shouldn&#39;t be any issues here, but nativesdk b=
uild still fails.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Looking into it further I see that protoc is actually pack=
aged by protobuf-compiler package, but when I try to add a package dependen=
cy to grpc recipe I get this:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler<b=
r>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Moreover, if I go into devshell and forcefully install nat=
ivesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is happy and com=
piles!<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; So something wrong with the dependencies in protobuf recip=
e, but I can&#39;t figure out yet what exactly. Any ideas?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Slava<br>
&gt;&gt;&gt;&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105722): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105722" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/messag=
e/105722</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101679410/361=
7605" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/101679410/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-devel+o=
wner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:sa=
muli.piippo@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">samu=
li.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div></div>

--000000000000231fe90609ad1213--

