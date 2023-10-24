Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90C9C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 11:53:08 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.16080.1698148384866779981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 04:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnWp/imC;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507bd644a96so6453038e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698148383; x=1698753183; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcg+MIvjuVvVw7spD5gvTvRYzJoF6pQHluvvoZR+iSQ=;
        b=LnWp/imCAy+KP3Xe6BSlPiyuTvKxxCytO9yn2cciUGWisCkfe8qfoHBGW9EjreroB5
         JlqTQwlsw6NkVXptey1Tp3mFWvLseRsyke/52y5XxhgpS4G98BFCw0Yfi5DCFrt98gW+
         1LD97gHc9/anUP7M9OAusFYjZoGbtL5ygy2271RbqIDCTx1hGOC6lhlpcBTzBZF45K4g
         YCjZfNsMD9ZPX15MKCDNsXANwyNeHZ7JpERlishQiTVI2D7Y292MVL3y157nV0xmJdlA
         XUquVbrEfmJj2c9VSE0JQx58rkpdoORqDtqqHG+4VbWeQhrubh5Zh5UGSKqEmpZ8tp/p
         9MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698148383; x=1698753183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcg+MIvjuVvVw7spD5gvTvRYzJoF6pQHluvvoZR+iSQ=;
        b=ngGeYCPl5MIsjbJAmp5unSqXIlnyhAFx/5aiwhZticFBPeqYePVD93rgvN2xzm6fiK
         E0KjKKx/SnT8Tf6hECopfB0gx0mvy9PbWhtd4m0j64XrIPSqSe/jWSdCkykbgWuaZR8f
         j1MhIa2vtQ9DeoCtZhe+32w1guqOUhddmYoNhPi2SjURmV6TNy88gpiGoWX6ZqPI51mj
         kEwiuus1VwUZySDz+dZfQtKzz49HL1KDfSBnEDOywjo+n0ZtgpAVMpDk4kMPBUxLKVRQ
         u8B1MfvKLsdHCr3VgODzJlv/wKdhLAJ/B05Bpv5T/uo6LmUoEv7i7qHAht5IfWRaz7of
         g11g==
X-Gm-Message-State: AOJu0YxPq7Ufrdgu7Iu3ieTD1on4sxCn3dndRlnl9XOtBoggQEjkWuy5
	w1UbpbHJBCKdDbZXpiSbWAPO97oCdAZ7q7Xpnq0=
X-Google-Smtp-Source: AGHT+IF3PEYoYehwjupB8aCz8Ye4Ys0MEwvQCXLlNd3pzjthplJIQg4BRkiyLH7XUrPYZOFgK0iGdiPHS3Fr08DsH4w=
X-Received: by 2002:a19:ee13:0:b0:507:96a3:596d with SMTP id
 g19-20020a19ee13000000b0050796a3596dmr8375115lfb.49.1698148382617; Tue, 24
 Oct 2023 04:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com> <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com> <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com>
In-Reply-To: <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 24 Oct 2023 13:52:50 +0200
Message-ID: <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Samuli Piippo <samuli.piippo@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 11:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105720

Hi,

I have pushed a branch on my repo:
https://github.com/clementperon/meta-openembedded/tree/test_protobuf

and tried to reproduce the issue on my setup with the following kas yaml fi=
le.

But I don't see any issue at the configure stage.

cat XXXX/cortexa57-poky-linux-musl/test-protobuf/0.3/temp/log.do_configure

Show that -- Version:23.4.0 of Protobuf is found without any issue

Cmake host version is
$> cmake --version
cmake version 3.27.7

I'm missing something ?

Regards,
Clement

kas.yml
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
header:
  version: 8

machine: qemuarm64
distro: poky
target:
  - test-protobuf

repos:
  poky:
    url: https://git.yoctoproject.org/git/poky
    path: layers/poky
    refspec: master
    layers:
      meta:
      meta-poky:
      meta-yocto-bsp:

  meta-openembedded:
    url: https://github.com/clementperon/meta-openembedded
    path: layers/meta-openembedded
    refspec: test_protobuf
    layers:
      meta-oe:
      meta-networking:
      meta-python:

bblayers_conf_header:
  standard: |
    POKY_BBLAYERS_CONF_VERSION =3D "2"
    BBPATH =3D "${TOPDIR}"
    BBFILES ?=3D ""

local_conf_header:
  libc: |
    TCLIBC =3D "musl"
  standard: |
    CONF_VERSION =3D "2"
    PACKAGE_CLASSES =3D "package_ipk"
  debug-tweaks: |
    EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"

  diskmon: |
    BB_DISKMON_DIRS =3D "\
        STOPTASKS,${TMPDIR},1G,100K \
        STOPTASKS,${DL_DIR},1G,100K \
        STOPTASKS,${SSTATE_DIR},1G,100K \
        STOPTASKS,/tmp,100M,100K \
        ABORT,${TMPDIR},100M,1K \
        ABORT,${DL_DIR},100M,1K \
        ABORT,${SSTATE_DIR},100M,1K \
        ABORT,/tmp,10M,1K"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On Sun, 22 Oct 2023 at 20:45, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> I'm a bit confused here.
>
> I just did 'find tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1=
.56.2/ -name "protoc*"' and I see protoc binary only in recipe-sysroot-nati=
ve. That tells me that protoc, which is a part of nativesdk-protobuf-compil=
er, is not installed to recipe-sysroot.
>
> What am I missing here?
>
> Slava
>
> On 20.10.2023 09:35, Martin Jansa wrote:
>
> do_prepare_recipe_sysroot doesn't install any packages to RSS. Only packa=
ge manager on target or in do_rootfs uses packages.
>
> It installs the files from dependency populate_sysroot task.
>
> On Fri, Oct 20, 2023 at 9:11=E2=80=AFAM Samuli Piippo <samuli.piippo@gmai=
l.com> wrote:
>>
>> Dependency to the recipe name will always install all packages to RSS.
>> You can verify this by checking that the libprotoc.so from the nativesdk=
-protobuf-compile package is in the sysroot.
>> The problem you are facing is the fact that binaries are not installed i=
nto the sysroot (for nativesdk builds), so you are only missing the bin/pro=
toc-23.4.0 file.
>> The proposed and twice reverted fix for this is the aforementioned SYSRO=
OT_DIRS.
>>
>> -samuli
>>
>> On Fri, 20 Oct 2023 at 09:17, Vyacheslav Yurkov <uvv.mail@gmail.com> wro=
te:
>>>
>>> I think the problem goes down to how dependencies are populated in the =
sysroot. I raised this question in oe-core mailing list https://lists.opene=
mbedded.org/g/openembedded-core/message/189324 , but didn't get an answer y=
et.
>>>
>>> DEPENDS +=3D "protobuf" will only install the main package of protobuf =
to the sysroot, because it assumes that nativesdk-protobuf-compiler is also=
 part of the main package (which is not). I guess the part of the system po=
pulating sysroot deals with recipes only, and not with packages. I'm still =
trying to understand how that should be addressed properly.
>>> My understanding is that either all packages should be installed to sys=
root (which recipe claims it provides), or we need a way to indicate a pack=
age level dependency (i.e. nativesdk-protobuf-compiler in this case)
>>>
>>> Any ideas?
>>>
>>> Slava
>>>
>>> On 18.10.2023 14:28, Samuli Piippo wrote:
>>>
>>> Following simple test recipe will fail now when trying to use Protobuf =
with CMake.
>>>
>>> inherit cmake
>>> DEPENDS +=3D "protobuf"
>>>
>>> do_configure:prepend() {
>>>     echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
>>> }
>>>
>>> BBCLASSEXTEND =3D "nativesdk"
>>>
>>> ---
>>> CMake Error at tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1=
.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-poky=
sdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107 (message):
>>>   The imported target "protobuf::protoc" references the file
>>>
>>>      "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe=
-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux=
/usr/bin/protoc-23.4.0"
>>>
>>>   but this file does not exist.
>>> ---
>>>
>>> I don't quite see why every project/recipe should fix this independentl=
y when the simple workaround for this yocto-specific issue is available (na=
mely the use of SYSROOT_DIRS).
>>>
>>> -samuli
>>>
>>> ps. qtgrpc recipe and other Qt6 recipes are now visible in the layerind=
ex https://layers.openembedded.org/layerindex/recipe/348210/
>>>
>>>
>>> On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov <uvv.mail@gmail.com> wr=
ote:
>>>>
>>>> I'd like to follow-up on this and say that I see this issue now with n=
ativesdk build, in particular nativesdk-grpc recipe fails in master with th=
e same error. I hope that's partially related to the issue everybody is con=
fused about, but I'd like understand how to properly fix it.
>>>>
>>>> |   The imported target "protobuf::protoc" references the file
>>>> |
>>>> |      "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysd=
k-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-bui=
ldpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>>>> |
>>>> |   but this file does not exist.  Possible reasons include:
>>>> |
>>>> |   * The file was deleted, renamed, or moved to another location.
>>>>
>>>> The protoc-23.4.0 file already exists in the recipe-sysroot-native.
>>>>
>>>> And we do want protoc to be present in the SDK, but nativesdk build is=
 a cross-compilation, because SDKMACHINE and HOST might be different.
>>>> In this particular grpc case there's an option to say where the actual=
 protoc executable is ( -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=3D/home/uvv/proj=
ects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56=
.2/recipe-sysroot-native/usr/bin/protoc is passed to grpc).
>>>>
>>>> So there shouldn't be any issues here, but nativesdk build still fails=
.
>>>>
>>>> Looking into it further I see that protoc is actually packaged by prot=
obuf-compiler package, but when I try to add a package dependency to grpc r=
ecipe I get this:
>>>>
>>>> nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler
>>>>
>>>> Moreover, if I go into devshell and forcefully install nativesdk-libpr=
otobuf-compiler, then `bitbake nativesdk-grpc` is happy and compiles!
>>>>
>>>> So something wrong with the dependencies in protobuf recipe, but I can=
't figure out yet what exactly. Any ideas?
>>>>
>>>> Regards,
>>>> Slava
>>>>
>
>

