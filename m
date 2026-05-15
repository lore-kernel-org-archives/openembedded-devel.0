Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B13CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:14:12 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34697.1778850848484355143
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 06:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DyLlp0bw;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65dead17c24so6204683d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 06:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778850847; cv=none;
        d=google.com; s=arc-20240605;
        b=Fh6xSxfGw+xZLlcBOVEat11mr/w7CtioUmOVAIpRyhbb39KyvkhzI9rJNw79OzJleH
         epigSI/zcLa+ov6UvucLxe2GRMj++wr5EJNBhenpP6Bn2G28gLF1tYb8onyQzTa9O2rW
         B8bfwOyUeyglk2AYSmT2sYU0IZySj04Ue9yvZecMtNCzG9gmIxmoO873Dk0CgGK0e8sk
         m4/p2i0OvhbMgM06v0pZnBXzGZcmUJoChSkxQdlwRgUCGFwUNJhVML1CvtOB6j7jHeAN
         XT1farR6qQEoJiByYSOrryo2sjYFkjpXzOibif0diQRxpzrH7ZZq9ft7OvE+lmMZ+URI
         j4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ZhI9G4rgxogAyjdasWCcBZZHnh5qwvk6TtpCuiQs/Q=;
        fh=+jcAT/J+8eUffI4J8+D2Z0fRHvL5L4eOB6WKmwzicKo=;
        b=elnM13marWGxWfds9Bk9l4k5GyMZ8U06fcXAfJC5xnl88OsxLH2HLv8penhxqmk4GD
         gdQja5NP3YRG20lDskbYzvQBMoJYO7L9oApGfKY2lVHRNxYrzpvouf/cYPTBrs+skOIv
         iGh63pB9PhF03ky4LPYZY1z3iyRyJO0Wy/gj8cRr6MnwBAWUXWpnYhmWDgM/eldoGlQn
         kKolqZLPijKwdOq9ogzRvhGf9SBmVAwaoKSNQoD+Gzp32EBG6mu54yi5O79kTrzeXPQ4
         O2S59k8Xw21JWEfCXeVz8td+YdvtKibW9vw19+q0wrrOfwrF2id6ZQUrv5Pt8VCZc3RA
         zlfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778850847; x=1779455647; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZhI9G4rgxogAyjdasWCcBZZHnh5qwvk6TtpCuiQs/Q=;
        b=DyLlp0bwCECygHeMycl2miI9adGxGCUc/6G5SzzPpGex9UJcigCTiq7crvtc/mmCKv
         vyY6/4U0NlM7gsXrFNP79sQqPYtto3oxTpzt1J4mdS8My6dtY8c8J6LwVJb6UqCbFpsC
         A1Kwbdvu4WH64CvApyIj/8W72wf59xNhp7UptiReEauy64QQwoaQtCFk1GO62FQHj7/Z
         IHuVHEtCyNKgqz9KMvGccKRvEHa1oYZFS+l4WXX1y18VSwgA0GvwS+4jGX4AFnDFEHhv
         UPwiguwrO7i6fa0xGs81iU055UUFMtCvOkW/46Obbg92rppe16Kt7+LwSoKUyG4NShcC
         KRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778850847; x=1779455647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZhI9G4rgxogAyjdasWCcBZZHnh5qwvk6TtpCuiQs/Q=;
        b=moo+XqHEuEJxsjRqAmiqMBuzLYrli44gHZY/f8BKpM44U5EqH5h6T+uDcb0FLJHyMN
         g/rKvef4EzhxfHSdPxyBLn/aXejmwNxfv3gaKxXDJNPmiQKUG6nXZ9AGpma5cvAKN+I2
         I+m84vCIH4CTsMA+gbTcjqQFqstpF/DD9c+ZhduslbbJfIP9zyI7x44YXLNdi6yyCBNm
         GJDzk7N5Im6sTBWB66jLAXL5duSkpnCWF3qNNnZW5pT60NPolRggxwl4IThu22DDuAXE
         77RQMoA6Tc3jRWiO43c0ZY7ngq+DmWphxcB2LVpdZvTw6JbnXQsXSCpyZ8Slbt9pKNuV
         WNmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vw3I1iuRIqNggOnY00it6EgUhlq73cOfGVeWiBpN5zzLsPK3M7tzliMHRNRmwgiqJZVyH5GNA9wG5tBnH6ps8+h0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbmWKBZBjzEn6fP8EGMSrohms3HFhMwhLUDlSHDFy5e0rn4bqu
	Lhv3WglXyoCSRPwrCFVuuVdHx/YXL0h2bCTP0AgU1wRiWW4FvBUUzWUXbOz+3uCCJ6ECa3Qtwdj
	HNE5SMnVj7o39xZTws7/eyE+W1IU5u/o=
X-Gm-Gg: Acq92OG6UL6szAg2zjkufzaM4mvNx2aY7+tfNtgeQj/dfBLu2gHFMNDuX8XB54p3ajx
	/3rQJ6e1RwWMkaY02kkERIU3y8AgVVJTtWgiuXosUGZmg0hxFQLKxBL2XNy55zmxfo53/sTXY/D
	b4aOgZj5CT6S4hW0N9AhjUDSnmXRplUKNHSfwATmLriDBgaqxgbRQztm7xL6X/LnNJP2IvovVkZ
	/Sq1MGWtJkgu8hNVSNhtTBbEV10iMT79F5XxTsnx095S4TtU0Miqqjax1Pzpm3GKg1Xb71q2rrH
	xaccBCgYqXpi6ACq+HqimJVv5AyD3ormAFJf92zN0wwOugGCbMllOd1DF1vZjiTeQTkr2kcJIa9
	0tuXT1YBu7jx+R4VnIsEfFKnkbCTAnE9Ka9vpEXldzj5zuv2ZWGIbqZnVISkELlM4+Q0cE9LbNF
	3dv8rMU55AGwhQQKZYHMzz/F7KMA==
X-Received: by 2002:a05:690e:2502:10b0:651:d1e1:5d70 with SMTP id
 956f58d0204a3-65e2283ddd4mr3216669d50.54.1778850844292; Fri, 15 May 2026
 06:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
 <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org>
 <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com>
 <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
 <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com>
 <1575450.1778745762950591364@lists.openembedded.org> <1575450.1778840626136865406@lists.openembedded.org>
 <1824db6e-eded-4f5f-8626-c74406ef2670@gmail.com>
In-Reply-To: <1824db6e-eded-4f5f-8626-c74406ef2670@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 May 2026 06:13:52 -0700
X-Gm-Features: AVHnY4IYKVron3dYTMafYkH1FLTskzRg6UBOAvao4hwQJ_KM-Wzo3u0QoQFZWMU
Message-ID: <CAMKF1srFmVDNF=f2aU1SEYFv5MGXgZGOYc9150HDuBeTJg1V8g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aebb530651dafca4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 13:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127007

--000000000000aebb530651dafca4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026, 3:37=E2=80=AFAM Gyorgy Sarvari via lists.openembedded=
.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

>
> On 5/15/26 12:23, AshishKumar Mishra via lists.openembedded.org wrote:
> > Hi Khem / Team ,
> >
> > Able to reproduce the build error with CLANG
> > Brought meta-clang and tweaked the toolchain / cc / cxx provider as
> clang
>
>
> Just a small note: do not use meta-clang - it has been part of oe-core
> since the Whinlatter release.
>

Clarify a bit more here meta-clang is not needed to enable clang as the
compiler is provided by core layer now a days. So you should be able to
reproduce it with whatever settings you did but removing meta-clang

>
>
> > Will work to fix this and share the observation
> >
> > Sharing the error log to get an feedback just to avoid any gap's in
> > customization
> >
> > Below is the error :
> > bake-builds/poky-master/build/tmp/work/cortexa57-oe-linux/android-
> > tools/29.0.6.r14/android-tools=3D/usr/src/debug/android-tools/29.0.6.r1=
4
> >  -ffile-prefix-map=3D/home/bti-001003/upstream/bitbake-builds/poky-mast=
er/
> > build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/recipe-
> > sysroot=3D  -ffile-prefix-map=3D/home/bti-001003/upstream/bitbake-build=
s/
> > poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/
> > recipe-sysroot-native=3D  -pipe -fvisibility-inlines-hidden -std=3Dgnu+=
+20 -
> > UADB_HOST -DADB_HOST=3D0 -DALLOW_ADBD_DISABLE_VERITY -DALLOW_ADBD_NO_AU=
TH
> > -DPLATFORM_TOOLS_VERSION=3D'"28.0.2"'  -Isystem/core/diagnose_usb/inclu=
de
> >  -Isystem/core/adb/daemon/include -Isystem/core/adb/adbconnection/
> > include -Isystem/core/libasyncio/include -Isystem/core/libcutils/includ=
e
> > -Isystem/core/libcrypto_utils/include -Isystem/core/liblog/include/ -
> > Isystem/core/libutils/include -Iframeworks/native/libs/adbd_auth/includ=
e
> > -Wno-c++11-narrowing  -DPAGE_SIZE=3D4096 -fPIC -Isystem/coreinclude -
> > Isystem/core/adb -Isystem/core/base/include  -Idebian/out/system/core -
> > Isystem/tools/mkbootimg/include/bootimg -Isystem/core/fs_mgr/include -
> > Isystem/core/fs_mgr/include_fstab -DADB_VERSION=3D'""' -D_GNU_SOURCE -W=
l,-
> > O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -Wl,-
> > rpath=3D'$ORIGIN/../lib/android' -Wl,-rpath-link=3D'$ORIGIN/../lib/andr=
oid'
> > -lpthread -Ldebian/out/system/core -Ldebian/out/external/boringssl -
> > lbase -lcrypto_utils -l:libcrypto.a -lcutils -llog -lresolv
> > | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> > header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> > | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> > header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> > | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> > header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> > | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> > header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> > | aarch64-oe-linux-clang++: error: cannot specify -o when generating
> > multiple output files
> > | make: *** [/home/bti-001003/upstream/bitbake-builds/poky-master/build=
/
> > tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/sources/android-
> > tools-29.0.6.r14/debian/system/core/adbd.mk:84: build] Error 1
> > | make: Leaving directory '/home/bti-001003/upstream/bitbake-builds/
> > poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/
> > sources/android-tools-29.0.6.r14'
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > ERROR: Task (/home/bti-001003/upstream/bitbake-builds/poky-master/
> > layers/meta-openembedded/meta-oe/recipes-devtools/android-tools/android=
-
> > tools_29.0.6.r14.bb:do_compile) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 1685 tasks of which 275 didn't need to b=
e
> > rerun and 1 failed.
> > Summary: 1 task failed:
> >   /home/bti-001003/upstream/bitbake-builds/poky-master/layers/meta-
> > openembedded/meta-oe/recipes-devtools/android-tools/android-
> > tools_29.0.6.r14.bb:do_compile
> >     log: /home/bti-001003/upstream/bitbake-builds/poky-master/build/tmp=
/
> >
> work/cortexa57-oe-linux/android-tools/29.0.6.r14/temp/log.do_compile.1623=
961
> > Summary: There were 12 WARNING messages.
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >  ~/upstream/bitbake-builds/poky-master/build :
> >  ~/upstream/bitbake-builds/poky-master/build :
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127005):
> https://lists.openembedded.org/g/openembedded-devel/message/127005
> Mute This Topic: https://lists.openembedded.org/mt/119162735/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aebb530651dafca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 15, 2026, 3:37=E2=80=
=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 5/15/26 12:23, AshishKumar Mishra via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.=
org</a> wrote:<br>
&gt; Hi Khem / Team ,=C2=A0<br>
&gt; <br>
&gt; Able to reproduce the build error with CLANG=C2=A0<br>
&gt; Brought meta-clang and tweaked the toolchain / cc / cxx provider as cl=
ang=C2=A0<br>
<br>
<br>
Just a small note: do not use meta-clang - it has been part of oe-core<br>
since the Whinlatter release.<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Clarify a bit more here meta-clang is not need=
ed to enable clang as the compiler is provided by core layer now a days. So=
 you should be able to reproduce it with whatever settings you did but remo=
ving meta-clang=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote gmai=
l_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; Will work to fix this and share the observation=C2=A0<br>
&gt; <br>
&gt; Sharing the error log to get an feedback just to avoid any gap&#39;s i=
n<br>
&gt; customization<br>
&gt; <br>
&gt; Below is the error :<br>
&gt; bake-builds/poky-master/build/tmp/work/cortexa57-oe-linux/android-<br>
&gt; tools/29.0.6.r14/android-tools=3D/usr/src/debug/android-tools/29.0.6.r=
14<br>
&gt; =C2=A0-ffile-prefix-map=3D/home/bti-001003/upstream/bitbake-builds/pok=
y-master/<br>
&gt; build/tmp/work/cortexa57-oe-linux/android-tools/<a href=3D"http://29.0=
.6." target=3D"_blank" rel=3D"noreferrer">29.0.6.</a>r14/recipe-<br>
&gt; sysroot=3D =C2=A0-ffile-prefix-map=3D/home/bti-001003/upstream/bitbake=
-builds/<br>
&gt; poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14=
/<br>
&gt; recipe-sysroot-native=3D =C2=A0-pipe -fvisibility-inlines-hidden -std=
=3Dgnu++20 -<br>
&gt; UADB_HOST -DADB_HOST=3D0 -DALLOW_ADBD_DISABLE_VERITY -DALLOW_ADBD_NO_A=
UTH<br>
&gt; -DPLATFORM_TOOLS_VERSION=3D&#39;&quot;28.0.2&quot;&#39; =C2=A0-Isystem=
/core/diagnose_usb/include<br>
&gt; =C2=A0-Isystem/core/adb/daemon/include -Isystem/core/adb/adbconnection=
/<br>
&gt; include -Isystem/core/libasyncio/include -Isystem/core/libcutils/inclu=
de<br>
&gt; -Isystem/core/libcrypto_utils/include -Isystem/core/liblog/include/ -<=
br>
&gt; Isystem/core/libutils/include -Iframeworks/native/libs/adbd_auth/inclu=
de<br>
&gt; -Wno-c++11-narrowing =C2=A0-DPAGE_SIZE=3D4096 -fPIC -Isystem/coreinclu=
de -<br>
&gt; Isystem/core/adb -Isystem/core/base/include =C2=A0-Idebian/out/system/=
core -<br>
&gt; Isystem/tools/mkbootimg/include/bootimg -Isystem/core/fs_mgr/include -=
<br>
&gt; Isystem/core/fs_mgr/include_fstab -DADB_VERSION=3D&#39;&quot;&quot;&#3=
9; -D_GNU_SOURCE -Wl,-<br>
&gt; O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -Wl,-<br=
>
&gt; rpath=3D&#39;$ORIGIN/../lib/android&#39; -Wl,-rpath-link=3D&#39;$ORIGI=
N/../lib/android&#39;<br>
&gt; -lpthread -Ldebian/out/system/core -Ldebian/out/external/boringssl -<b=
r>
&gt; lbase -lcrypto_utils -l:libcrypto.a -lcutils -llog -lresolv<br>
&gt; | aarch64-oe-linux-clang++: warning: treating &#39;c-header&#39; input=
 as &#39;c++-<br>
&gt; header&#39; when in C++ mode, this behavior is deprecated [-Wdeprecate=
d]<br>
&gt; | aarch64-oe-linux-clang++: warning: treating &#39;c-header&#39; input=
 as &#39;c++-<br>
&gt; header&#39; when in C++ mode, this behavior is deprecated [-Wdeprecate=
d]<br>
&gt; | aarch64-oe-linux-clang++: warning: treating &#39;c-header&#39; input=
 as &#39;c++-<br>
&gt; header&#39; when in C++ mode, this behavior is deprecated [-Wdeprecate=
d]<br>
&gt; | aarch64-oe-linux-clang++: warning: treating &#39;c-header&#39; input=
 as &#39;c++-<br>
&gt; header&#39; when in C++ mode, this behavior is deprecated [-Wdeprecate=
d]<br>
&gt; | aarch64-oe-linux-clang++: error: cannot specify -o when generating<b=
r>
&gt; multiple output files<br>
&gt; | make: *** [/home/bti-001003/upstream/bitbake-builds/poky-master/buil=
d/<br>
&gt; tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/sources/android-<=
br>
&gt; tools-29.0.6.r14/debian/system/core/<a href=3D"http://adbd.mk:84" rel=
=3D"noreferrer noreferrer" target=3D"_blank">adbd.mk:84</a>: build] Error 1=
<br>
&gt; | make: Leaving directory &#39;/home/bti-001003/upstream/bitbake-build=
s/<br>
&gt; poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14=
/<br>
&gt; sources/android-tools-29.0.6.r14&#39;<br>
&gt; | ERROR: oe_runmake failed<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; ERROR: Task (/home/bti-001003/upstream/bitbake-builds/poky-master/<br>
&gt; layers/meta-openembedded/meta-oe/recipes-devtools/android-tools/androi=
d-<br>
&gt; tools_29.0.6.r14.bb:do_compile) failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 1685 tasks of which 275 didn&#39;t need=
 to be<br>
&gt; rerun and 1 failed.<br>
&gt; Summary: 1 task failed:<br>
&gt; =C2=A0 /home/bti-001003/upstream/bitbake-builds/poky-master/layers/met=
a-<br>
&gt; openembedded/meta-oe/recipes-devtools/android-tools/android-<br>
&gt; tools_29.0.6.r14.bb:do_compile<br>
&gt; =C2=A0 =C2=A0 log: /home/bti-001003/upstream/bitbake-builds/poky-maste=
r/build/tmp/<br>
&gt; work/cortexa57-oe-linux/android-tools/29.0.6.r14/temp/log.do_compile.1=
623961<br>
&gt; Summary: There were 12 WARNING messages.<br>
&gt; Summary: There were 2 ERROR messages, returning a non-zero exit code.<=
br>
&gt; =C2=A0~/upstream/bitbake-builds/poky-master/build :<br>
&gt; =C2=A0~/upstream/bitbake-builds/poky-master/build :=C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127005): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127005" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127005</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119162735/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119162735/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000aebb530651dafca4--

