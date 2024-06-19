Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB0FC27C4F
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 00:34:59 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.9729.1718757289836758402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 17:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LVB+tc/Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63127fc434aso50973127b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 17:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718757289; x=1719362089; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nv7fXcGvwNnYs0s32BOXZIqW6fkIBbNqI+eA6FVs/Zg=;
        b=LVB+tc/Z08AgT+uemBfG9Cd35u94alZ1JCyVOHlomXujziGusBwQNs0gJpDJhu+etm
         0PXMDZB1DSmgk6a0xILX0I36iEFX58SlCMsCm/VQHSjPaIgBeZ20qMDcoKN92jpt5OlK
         haG3uWZit4RL7CZ3msRxC9Yx6bqCkhXyN4A2rv1qfQDVNpdZmyzykxoQomsCTm+ppPGB
         xKnbjnENi8RLK7YSWFyNpQ9wNHtHHWYitl1wAkCCgHnqygNkXmdu5VaS9zkqXAVbsK5h
         nqbYLI9nIOyOr3Jd2GCw6qKn0feIOramxJr1XnodULAAuEK943CdzdgY2Ziew860VWxr
         KhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718757289; x=1719362089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv7fXcGvwNnYs0s32BOXZIqW6fkIBbNqI+eA6FVs/Zg=;
        b=u4aOhsCL3++l3epVLgVXBOZ7s/uoHkDxYIw1ZUO5a+OMgz8xSxf9oL1tu/F0byGVV8
         J8biL0CFGCEeYHEImEA2OURmXbKeNKpWhk0DgqEwiwA6uu4r9TWVDscBtqI+5W/yXKKB
         Rs0ibpjeS/az4KhNtSGUmktxWByOsDRmittdQl4iZ1FMi5V3e3gus7DHIjGf24Oh/Yu4
         WTaYuZsKYBaIgXA1q+RDWt9+aNV6pFc+1E/UJE0Ov3BoD6RLKHGRwVE+qEvwOv/u9tVp
         epu2fB9B5yrjhcmKMJ7QVyKo15I4Sg1lpM96n3u5xZiAMTJK143geAZD11/jPlPnt6t1
         bilg==
X-Forwarded-Encrypted: i=1; AJvYcCXD+dBf0YdJl43amiwTtkmMalnDlPCbN7nHTwRfJZIW1ftNpDqQgex4yRmYZ+ryuf63QEnS0QTpHm3B+t6b/2lnQbIoX9jNAVRIPAOGQ2KIT9NBpQw5AfRyZQ==
X-Gm-Message-State: AOJu0YxavCpUOw3ZpyjfyeMiF9DMAxPsypvf4CzdgFOF4JTeogdzsIVp
	PuqRFRjJv6JoreD2niFQVWZIJi/tuTLUjXiSRUz3ljHX+98tTzOY5QUiEcFWm/iphVYsgPRPPFz
	qcdOx028v9gqxTGGOTCTa6bmnlQY=
X-Google-Smtp-Source: AGHT+IEhRWO8HMjiFsdj8v0l9N587ggHkhO3gE+yCi4uIO4UA4wtR97P5FZw2F1QmDnlhOuCdHWLgh4A3FJhiz+l/Oc=
X-Received: by 2002:a81:f001:0:b0:615:10f8:124a with SMTP id
 00721157ae682-63a8e0e3160mr12163647b3.29.1718757288732; Tue, 18 Jun 2024
 17:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240617191342.2360052-1-Randy.MacLeod@windriver.com>
 <CANx9H-DUPrkCGV9neBKQL+f-SkVyLzdooQnC2zt7BLPFA7bxwg@mail.gmail.com>
 <5f1edf15-1554-4d6d-a4cc-e1decd194da8@windriver.com> <7193adf3-3f0a-4579-b1c5-336a59f859e7@windriver.com>
In-Reply-To: <7193adf3-3f0a-4579-b1c5-336a59f859e7@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 18 Jun 2024 17:34:37 -0700
Message-ID: <CANx9H-B4KEib+yx=xMaSiC2iAbuLnGGqRNaZ526-xanPXqfG5A@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pyyaml-include:
 support native and nativesdk build
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: multipart/alternative; boundary="000000000000a6c6e0061b335dc4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 00:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110959

--000000000000a6c6e0061b335dc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 4:55=E2=80=AFPM Randy MacLeod <randy.macleod@windri=
ver.com>
wrote:

> On 2024-06-17 9:22 p.m., Randy MacLeod wrote:
>
> On 2024-06-17 7:36 p.m., Tim Orling wrote:
>
> Master already has this, so it is a backport request.
>
> Randy, I assume you verified both targets build without issue.
>
> I did test on master but didn't for scarthgap since it would "obviously
> work"!
>
> Famous last words...
>
> On my PopOS (ubu-22.04 - ish) host:
>
> |
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake:
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/sysroots-u=
ninative/x86_64-linux/usr/lib/libstdc++.so.6:
> version `CXXABI_1.3.15' not found (required by
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake)
> | ---------------------------------------------
> | Error when bootstrapping CMake:
> | Problem while running initial CMake
> | ---------------------------------------------
> | WARNING: exit code 11 from a shell command.
> ERROR: Task
> (/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/recipes-d=
evtools/cmake/cmake-native_3.28.3.bb:do_configure)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 485 tasks of which 0 didn't need to be
> rerun and 1 failed.
>
>
> Summary:
>
> 1. both native and nativesdk build fine when I remove a custom native
> toolchain!
> 2. The commit for master hasn't merged yet so I'll wait for that before
> sending v2.
>

Thank you for the due diligence. Makes sense to me.


>
> Details for Tim with one question:
>
> That -native build problem was due to having a custom gcc in /usr/local.
> Oops!
>
> python3-pyyaml-include-native builds fine using the distro's gcc :
>
> =E2=9D=AF /usr/bin/gcc --version
> gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
>
>
> The nativesdk- python3-pyyaml-include build succeeds too but there was on=
e
> warning that I'm unsure about:
>
>    Building target platforms: x86_64_nativesdk-pokysdk-linux
>    Building for target x86_64_nativesdk-pokysdk-linux
>    Processing files:
> nativesdk-python3-pyyaml-include-1.3.2-r0.x86_64_nativesdk
>    warning: Ignoring invalid regex
> ^((${prefix}/=3DLIB=3D|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$
> <----
>    Finding  Provides:
>    Finding  Requires(interp):
>    Finding  Requires(rpmlib):
>    ...
>
>
> That happens when running rpmbuild... ah, here's the source:
>
> =E2=9D=AF rg pkgconfig
> /.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inc=
lude/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs
>
> /.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inc=
lude/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs/pkgcon=
fig.attr
> 1:%__pkgconfig_provides    %{_rpmconfigdir}/pkgconfigdeps.sh --provides
> 2:%__pkgconfig_requires    %{_rpmconfigdir}/pkgconfigdeps.sh --requires
> 3:%__pkgconfig_path
> ^((%{_libdir}|%{_datadir})/pkgconfig/.*\.pc|%{_bindir}/pkg-config)$
>
> which is likely from rpm-native/usr/lib/rpm/fileattrs/pkgconfig.attr
>
> and so not specific to this change it would seem.
>
> We should still fix it, but the pkgconfig.attr line has been around in rp=
m
> for > 10 years.
>
> Tim,
>
> I'm out of time for today.
> Is it easy for you to find out if this warning is something that works
> well in Fedora but generates a warning in YP?
>

Perhaps, I can run it in a container or VM. Maybe tgamblin is a better fit,
since he still runs Fedora as his daily driver.
CC: Trevor Gamblin

>
>
> I don't usually worry about how rpm packaging works in detail so this was
> fun and I got to use strace! ;-)
>

Getting to the bottom of something that has been around for 10 years and
not necessarily perfect yet is always fun.

>
>
> ../Randy
>
>
> I'll try that on a supported distro and re-submit adding a comment about
> it being a backport.
> I'm busy most of the week so it may be a while.
>
> Thanks for asking Tim and sorry for the noise.
>
> ../Randy
>
>
>
> On Mon, Jun 17, 2024 at 12:13=E2=80=AFPM Randy MacLeod via lists.openembe=
dded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jS=
HZJsReCax2W-Q$>
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
>> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
>> <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!=
AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqEL=
oYvkazy3jSHZJsRdX0IWwxQ$>
>>    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pyyaml-include_1.3.2.bb
>> <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!=
AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqEL=
oYvkazy3jSHZJsRdX0IWwxQ$>
>> b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
>> <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!=
AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqEL=
oYvkazy3jSHZJsRdX0IWwxQ$>
>> index 3a5bd99a7..309d0ac59 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.b=
b
>> <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!=
AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqEL=
oYvkazy3jSHZJsRdX0IWwxQ$>
>> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.b=
b
>> <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!=
AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqEL=
oYvkazy3jSHZJsRdX0IWwxQ$>
>> @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D " \
>>      python3-pytest \
>>      python3-unittest-automake-output \
>>  "
>> -
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110943):
>> https://lists.openembedded.org/g/openembedded-devel/message/110943
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-devel/message/110943__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4=
RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRdaJIdgGQ$>
>> Mute This Topic: https://lists.openembedded.org/mt/106727475/924729
>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/106727475=
/924729__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTc=
OiQ_RMZ0yqELoYvkazy3jSHZJsRd-fviFOQ$>
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-devel/unsub__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1Z=
wM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd659LC0Q$>
>> [ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--000000000000a6c6e0061b335dc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 2024 at 4:55=E2=80=AF=
PM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.m=
acleod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2024-06-17 9:22 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>On 2024-06-17 7:36 p.m., Tim Orling
        wrote:<br>
      </div>
      <blockquote type=3D"cite">
       =20
        <div dir=3D"auto">Master already has this, so it is a backport
          request.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Randy, I assume you verified both targets build
          without issue.</div>
      </blockquote>
      I did test on master but didn&#39;t for scarthgap since it would
      &quot;obviously work&quot;!<br>
      <p>Famous last words...</p>
      <p>On my PopOS (ubu-22.04 - ish) host:</p>
      <p>|
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_64-=
linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake:
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/sysroots-uni=
native/x86_64-linux/usr/lib/libstdc++.so.6:
        version `CXXABI_1.3.15&#39; not found (required by
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_64-=
linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake)<br>
        | ---------------------------------------------<br>
        | Error when bootstrapping CMake:<br>
        | Problem while running initial CMake<br>
        | ---------------------------------------------<br>
        | WARNING: exit code 11 from a shell command.<br>
        ERROR: Task
(/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/recipes-dev=
tools/cmake/cmake-native_3.28.3.bb:do_configure)
        failed with exit code &#39;1&#39;<br>
        NOTE: Tasks Summary: Attempted 485 tasks of which 0 didn&#39;t need
        to be rerun and 1 failed.<br>
      </p>
      <p><br>
      </p>
    </blockquote>
    <p>Summary:</p>
    <p>1. both native and nativesdk build fine when I remove a custom
      native toolchain!<br>
      2. The commit for master hasn&#39;t merged yet so I&#39;ll wait for t=
hat
      before sending v2.<br></p></div></blockquote><div><br></div><div>Than=
k you for the due diligence. Makes sense to me.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div><p>
    </p>
    <p><br>
    </p>
    <p>Details for Tim with one question:<br>
      <br>
    </p>
    <p>That -native build problem was due to having a custom gcc in
      /usr/local. Oops!<br>
    </p>
    <p>python3-pyyaml-include-native builds fine using the distro&#39;s gcc
      :</p>
    <p>=E2=9D=AF /usr/bin/gcc --version<br>
      gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0<br>
    </p>
    <p><br>
    </p>
    <p>The nativesdk- python3-pyyaml-include build succeeds too but
      there was one warning that I&#39;m unsure about:<br>
      <br>
      =C2=A0=C2=A0 Building target platforms: x86_64_nativesdk-pokysdk-linu=
x<br>
      =C2=A0=C2=A0 Building for target x86_64_nativesdk-pokysdk-linux<br>
      =C2=A0=C2=A0 Processing files:
      nativesdk-python3-pyyaml-include-1.3.2-r0.x86_64_nativesdk<br>
      =C2=A0=C2=A0 warning: Ignoring invalid regex
^((${prefix}/=3DLIB=3D|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      &lt;----<br>
      =C2=A0=C2=A0 Finding=C2=A0 Provides: <br>
      =C2=A0=C2=A0 Finding=C2=A0 Requires(interp): <br>
      =C2=A0=C2=A0 Finding=C2=A0 Requires(rpmlib): <br>
      =C2=A0=C2=A0 ...</p>
    <p><br>
    </p>
    <p>That happens when running rpmbuild... ah, here&#39;s the source:<br>
    </p>
    <p>=E2=9D=AF rg pkgconfig
/.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inclu=
de/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs<br>
/.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inclu=
de/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs/pkgconfi=
g.attr<br>
      1:%__pkgconfig_provides=C2=A0=C2=A0=C2=A0 %{_rpmconfigdir}/pkgconfigd=
eps.sh
      --provides<br>
      2:%__pkgconfig_requires=C2=A0=C2=A0=C2=A0 %{_rpmconfigdir}/pkgconfigd=
eps.sh
      --requires<br>
      3:%__pkgconfig_path=C2=A0=C2=A0=C2=A0
      ^((%{_libdir}|%{_datadir})/pkgconfig/.*\.pc|%{_bindir}/pkg-config)$<b=
r>
      <br>
    </p>
    <p>which is likely from
      rpm-native/usr/lib/rpm/fileattrs/pkgconfig.attr</p>
    <p>and so not specific to this change it would seem.<br>
      <br>
      We should still fix it, but the pkgconfig.attr line has been
      around in rpm for &gt; 10 years.<br>
    </p>
    <p>Tim,<br>
    </p>
    <p>I&#39;m out of time for today.<br>
      Is it easy for you to find out if this warning is something that
      works well in Fedora but generates a warning in YP?</p></div></blockq=
uote><div><br></div><div>Perhaps, I can run it in a container or VM. Maybe =
tgamblin=C2=A0is a better fit, since he still runs Fedora as his daily driv=
er.</div><div>CC: Trevor Gamblin=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>I don&#39;t usually worry about how rpm packaging works in detail so
      this was fun and I got to use strace! ;-)</p></div></blockquote><div>=
<br></div><div>Getting to the bottom of something that has been around for =
10 years and not necessarily perfect yet is always fun.=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div><p> <br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <p> </p>
      <p>I&#39;ll try that on a supported distro and re-submit adding a
        comment about it being a backport.<br>
        I&#39;m busy most of the week so it may be a while.</p>
      <p>Thanks for asking Tim and sorry for the noise.<br>
      </p>
      <p>../Randy<br>
      </p>
      <blockquote type=3D"cite">
        <div dir=3D"auto"><br>
        </div>
        <div><br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 17, 2024 at
              12:13=E2=80=AFPM Randy MacLeod via <a href=3D"https://urldefe=
nse.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6=
VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsReCax2W-Q$" ta=
rget=3D"_blank">lists.openembedded.org</a>
              &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.ope=
nembedded.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&g=
t;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
              Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.c=
om" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
              <br>
              Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacL=
eod@windriver.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br=
>
              Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
              ---<br>
              =C2=A0.../recipes-devtools/python/<a href=3D"https://urldefen=
se.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!aw5nRqXm=
GOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRdX0IW=
wxQ$" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-include_1.3.2.bb<=
/a>=C2=A0
              =C2=A0 =C2=A0| 2 +-<br>
              =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/meta-python/recipes-devtools/python/<a href=3D"h=
ttps://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveY=
dw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvka=
zy3jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-in=
clude_1.3.2.bb</a>
              b/meta-python/recipes-devtools/python/<a href=3D"https://urld=
efense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!aw5n=
RqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd=
X0IWwxQ$" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-include_1.3.2=
.bb</a><br>
              index 3a5bd99a7..309d0ac59 100644<br>
              --- a/meta-python/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!=
aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZ=
JsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-include_1=
.3.2.bb</a><br>
              +++ b/meta-python/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!=
aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZ=
JsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-include_1=
.3.2.bb</a><br>
              @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
              =C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
              =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
              =C2=A0&quot;<br>
              -<br>
              +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#110943): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/110943__=
;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0y=
qELoYvkazy3jSHZJsRdaJIdgGQ$" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-devel/message/110943</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/106727475/924729__;!!AjveYdw8EvQ!aw5nRqXmGOpTn=
-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd-fviFOQ$"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/106=
727475/924729</a><br>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.opene=
mbedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!aw5nRqXmGO=
pTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd659LC0=
Q$" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-devel/unsub</a>
              [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">tico=
timo@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div></div>

--000000000000a6c6e0061b335dc4--

