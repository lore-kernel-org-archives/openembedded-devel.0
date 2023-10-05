Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6471E9370F
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 13:41:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.15631.1696513304073344839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 06:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bgd5wqtR;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-327be5fe4beso957751f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696513302; x=1697118102; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sQvgcOqJTeQrxpMOlvJwzsqlmbzzXJfwLl+crc2BgZ8=;
        b=Bgd5wqtREK9efafDLu8RJp9pEpgBs3/uO8Pl0IPQdsMd3mslgW00L2hBluY08yDOHl
         H4dLIS1nrIjykRPBC5djfYfjSAIkMxsvdYbJWHGAjFjTbfBSjFYoT2rq9Uhh5i/tA00x
         VVrXVUX6qXIYl3COkBL6D5+aeN32i6Z9STfFbfmcx8mFfH1FgOZtARf4ipJo09vsqD8B
         7j+zczRWbOfV6gSG30LKvVqy1rfgpHYGMzmTR0heng3xYPnC4j2+/wTEDT2In6xtxL1f
         m1VobAC6aXww7YvDVMUwpc4m/H7KJU3XDvyggqe5uprI3/eTB06RN7HhTKvV+9h5/hRm
         jRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696513302; x=1697118102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQvgcOqJTeQrxpMOlvJwzsqlmbzzXJfwLl+crc2BgZ8=;
        b=fIxJEMq/sRXGXdEz0lbDQLWVbgn+dhavPGhuX4UMbw0oP8MUaSOZH1+D+4o04EmL2I
         yIFilUqHANbk/a2yQ1e1iU1JsnxsRMGmpIQKmVxdNMOFvrUYJ/Wh6DS18FH5ILJiQENC
         0GrliuZI8KCP45X23+dfmHDNeFnBEj5IJf1mKe6pfycd0BNCAEA+HXHGXv1qhdssUjru
         VFCU6OBee42dd7N9MVkrXy4Y/pTaVX5CsrJVv40+dA2Mjq1rlFxsuCxufATM729p0Wq0
         Cb5yTmv7tgBTjNoRAQWAlYmVld9iuUQZDC327zCXjNtcYcGNHwckTDfGtAQmtbGYxCKx
         P0SA==
X-Gm-Message-State: AOJu0YwFHTtIxr2VH/HnRho4xDmDhq0zmi+z0wxZUP+LYXLCbNt/AwOw
	1JR2G4hEj1On+F7TAa/ZU2I7v5fOtTMbSdizXxM=
X-Google-Smtp-Source: AGHT+IHJphgN8vTtayf5foH4XWcOY2h45w3fWScCeLAasVN7FRGHhxh/rLiev8GKzGXCUcr3iDWsAsSM4SfV2K0i5W0=
X-Received: by 2002:a5d:4247:0:b0:31f:fa66:5852 with SMTP id
 s7-20020a5d4247000000b0031ffa665852mr5052390wrr.21.1696513302188; Thu, 05 Oct
 2023 06:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230927084242.1195772-1-peron.clem@gmail.com>
 <20230927084242.1195772-2-peron.clem@gmail.com> <178B37AD9D74C59B.3256@lists.openembedded.org>
In-Reply-To: <178B37AD9D74C59B.3256@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Oct 2023 15:41:28 +0200
Message-ID: <CA+chaQee3M40EuUD=NF1D-PS7w4dqxcBJ0WbYv-BniviZJoFdw@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 1/9] protobuf: upgrade 3.21.12 -> 4.22.2
To: martin.jansa@gmail.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Xiangyu Chen <xiangyu.chen@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000bbd7f00606f8483d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 13:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105356

--000000000000bbd7f00606f8483d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 3:01=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> This breaks opencv builds with dnn PACKAGECONFIG is enabled.
>
> opencv is using -std=3Dc++11 and now
> recipe-sysroot/usr/include/google/protobuf/stubs/common.h
> includes absl/strings/string_view.h which fails with
> opencv/4.8.0/recipe-sysroot/usr/include/absl/base/policy_checks.h:79:2:
> error: #error "C++ versions less than C++14 are not supported."
>    79 | #error "C++ versions less than C++14 are not supported."
>       |  ^~~~~
>
> as shown in http://errors.yoctoproject.org/Errors/Details/739306/
>
> Passing
> -DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF -DCMAKE_CXX_STANDARD=3D14
> in dnn PACKAGECONFIG:
> PACKAGECONFIG[dnn] =3D "-DBUILD_opencv_dnn=3DON -DPROTOBUF_UPDATE_FILES=
=3DON
> -DBUILD_PROTOBUF=3DOFF -DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF
> -DCMAKE_CXX_STANDARD=3D14,-DBUILD_opencv_dnn=3DOFF,protobuf protobuf-nati=
ve,"
>
> helps with this first part, but then it fails to link with absl:
> http://errors.yoctoproject.org/Errors/Details/739308/
>
> At least protobuf isn't upgraded in nanbield branch yet, so it still
> builds there.
>

FYI:

Similar issue was reported in:
https://github.com/opencv/opencv/issues/23466
and should be fixed in:
https://github.com/opencv/opencv/pull/23600
which is included in 4.8.0 version used in meta-oe, but now string_view is
pulled by protobuf itself, not flatbuffers.

On Wed, Sep 27, 2023 at 10:42=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:
>
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> ---
>>  ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++------
>>  .../{protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb}   | 11 ++++++++---
>>  2 files changed, 17 insertions(+), 9 deletions(-)
>>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
>> protobuf_4.22.2.bb} (86%)
>>
>

--000000000000bbd7f00606f8483d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 5, 2023 at 3:01=E2=80=AFPM Ma=
rtin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div>This breaks opencv builds with dnn PACKAGECONFIG is enabled.</di=
v><div><br></div><div>opencv is using=C2=A0-std=3Dc++11 and now</div><div>r=
ecipe-sysroot/usr/include/google/protobuf/stubs/common.h<br></div><div>incl=
udes=C2=A0absl/strings/string_view.h which fails with<br>opencv/4.8.0/recip=
e-sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #error &quot;C=
++ versions less than C++14 are not supported.&quot;<br>=C2=A0 =C2=A079 | #=
error &quot;C++ versions less than C++14 are not supported.&quot;<br>=C2=A0=
 =C2=A0 =C2=A0 | =C2=A0^~~~~<br></div><div><br></div><div>as shown in=C2=A0=
<a href=3D"http://errors.yoctoproject.org/Errors/Details/739306/" target=3D=
"_blank">http://errors.yoctoproject.org/Errors/Details/739306/</a></div><di=
v><br></div><div>Passing</div><div>-DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF -=
DCMAKE_CXX_STANDARD=3D14<br></div><div>in dnn PACKAGECONFIG:</div><div>PACK=
AGECONFIG[dnn] =3D &quot;-DBUILD_opencv_dnn=3DON -DPROTOBUF_UPDATE_FILES=3D=
ON -DBUILD_PROTOBUF=3DOFF -DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF -DCMAKE_CX=
X_STANDARD=3D14,-DBUILD_opencv_dnn=3DOFF,protobuf protobuf-native,&quot;<br=
></div><div><br></div><div>helps with this first part, but then it fails to=
 link with absl:</div><div><a href=3D"http://errors.yoctoproject.org/Errors=
/Details/739308/" target=3D"_blank">http://errors.yoctoproject.org/Errors/D=
etails/739308/</a><br></div><div><br></div><div>At least protobuf isn&#39;t=
 upgraded in nanbield branch yet, so it still builds there.</div></div></bl=
ockquote><div><br></div><div>FYI:</div><div><br></div><div>Similar issue wa=
s reported in:</div><div><a href=3D"https://github.com/opencv/opencv/issues=
/23466">https://github.com/opencv/opencv/issues/23466</a></div><div>and sho=
uld be fixed in:</div><div><a href=3D"https://github.com/opencv/opencv/pull=
/23600">https://github.com/opencv/opencv/pull/23600</a></div><div>which is =
included in 4.8.0 version used in meta-oe, but now string_view is pulled by=
 protobuf itself, not flatbuffers.</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 10:42=E2=80=AF=
AM Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com" targ=
et=3D"_blank">peron.clem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Xiangyu Chen &lt;<a href=3D"mailto:=
xiangyu.chen@windriver.com" target=3D"_blank">xiangyu.chen@windriver.com</a=
>&gt;<br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gma=
il.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++-----=
-<br>
=C2=A0.../{<a href=3D"http://protobuf_3.21.12.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_3.21.12.bb</a> =3D&gt; <a href=3D"http://protobuf_4.22=
.2.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.22.2.bb</a>}=C2=A0 =
=C2=A0| 11 ++++++++---<br>
=C2=A02 files changed, 17 insertions(+), 9 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://protobuf_=
3.21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a> =
=3D&gt; <a href=3D"http://protobuf_4.22.2.bb" rel=3D"noreferrer" target=3D"=
_blank">protobuf_4.22.2.bb</a>} (86%)<br></blockquote></div></div>
</blockquote></div></div>

--000000000000bbd7f00606f8483d--

