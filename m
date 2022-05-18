Return-Path: <jaskij@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F5DC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:48:37 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.4498.1652878115210693126
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 05:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S+sR2DbI;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: jaskij@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-e5e433d66dso2475149fac.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=6G2Luxc1DIcxERtFjmJMg1wHdE6z/GxWUoFJT0qReVI=;
        b=S+sR2DbIY+Z1y6hTHYXmzT822ecVkyJmaRrWRQ/nZA4Hfk+fxbgXCNhQMT6AZKUOGm
         0wvV7pq2KCBDTWMZvILj4LO5CJJyXQHHDevz3TufcE6l0pnglbNXjBSei7IS1EsRFlUi
         CsxxGSipzjKmd381B8J3x0uvvRA6p0/SySdzIVIRalRwwRJOCZzFIrxwEwQs6gskSW9U
         xn28jjInP0S8sCcVJsjEobyh/AVnG6ldhL48ORKkSYMg6lSJY4vPJ4gwT+MZheje7axn
         TWExwufptBEWviIRnAAc0g0ki7tABMIj/LzMHuL7rcOW7eW2QhmBveI8w4RZUZcbDToZ
         ieqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6G2Luxc1DIcxERtFjmJMg1wHdE6z/GxWUoFJT0qReVI=;
        b=sHvJC+kF7kh9saq8Uo1eCrhgrXUxu4cRbO40IkAhBiCcMRq8ofaLQxEbHh5mX03+eU
         SoFjJBfkHNPb3oV4nWAYHYqJHIe15CXz1Q5fYofFtTktQ8BWSJ+B4zihlbqKkqM3s5Wk
         oYEK5sN32cU1kh2iHlrBp+Xzl46gedLcFH1OC8Dwlint9nv1osKVLoIRdMMSLApIcYGM
         Xxmx1b/j4J+mWUN8rwQ9LBOp5DQ4HQmhSb/Z2NN4XnpcTs3eYMJA+fblsC6KK7m//cKS
         uW8iApfNl7ey1RRTbkmmU2ENjL7fEeXd1YbSbtEA2J9gMlSE7Xq/yZQmWGVUHTK7Pcnx
         fxFQ==
X-Gm-Message-State: AOAM531XG3iZ/FUs92yXyXq6nr5d35rS5mSM5kKwCBEbKogeKs2tetz9
	SZ3G05msKizu9O5lGS9ZHmGCdzXk8yu5E528O2ORfIRXyI64dQ==
X-Google-Smtp-Source: 
 ABdhPJztsBuKVfN7muDSRJLTbz9GYSdkC53Dluh7u7aTfw/yxDjlJVUI7sp191YRwiX/VOo36XTYKn2NIiLTPomHXUA=
X-Received: by 2002:a05:6870:8896:b0:ed:a31a:fbf7 with SMTP id
 m22-20020a056870889600b000eda31afbf7mr15517844oam.273.1652878113794; Wed, 18
 May 2022 05:48:33 -0700 (PDT)
MIME-Version: 1.0
From: jaskij <jaskij@gmail.com>
Date: Wed, 18 May 2022 14:48:22 +0200
Message-ID: 
 <CAGRymWUFaGpqbw769Vr_N7--6B8uRj8A5wCvc01nDfudk5FZfQ@mail.gmail.com>
Subject: [BUG] python3-protobuf performance regression
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d46f7e05df48acf6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 12:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97160

--000000000000d46f7e05df48acf6
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

After updating from Hardknott to Kirkstone, we have noticed a massive
performance regression in python3-protobuf.

The regression is caused by the package not building (and thus not using)
the native implementation. What seems to have happened is that
`DISTUTILS_BUILD_ARGS` in the python3-protobuf recipe was not updated to
`SETUPTOOLS_BUILD_ARGS`. This would be a simple fix - just update the
recipe and set the flag, if not for one thing: protobuf in meta-oe is in
version 3.19.4, and python3-protobuf 3.20.0 in meta-python is not able to
link against it.

Internally, I have rolled back python3-protobuf to 3.19.4 and built it with
`SETUPTOOLS_BUILD_ARGS += "--cpp_implementation"`. The difference is...
massive.

For 2000 samples with our test code we get (all times in microseconds):

python3-protobuf 3.20
parse      mean: 28713us percentiles: {5: 26623, 25: 27343, 50: 28943, 75:
29663, 95: 30687}
python3-protobuf 3.19
parse      mean:   939us percentiles: {5: 756, 25: 944, 50: 950, 75: 956,
95: 1008}

Changing the variable in python3-protobuf is simple, the problem is the
version mismatch. It's either roll back python3-protobuf or update protobuf.

Jan

-- 
Jan Dorniak
e-mail:jaskij@gmail.com

--000000000000d46f7e05df48acf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,<br></div><div><br></div><div>After up=
dating from Hardknott to Kirkstone, we have noticed a massive performance r=
egression in python3-protobuf.<br></div><div><br></div><div>The regression =
is caused by the package not building (and thus not using) the native imple=
mentation. What seems to have happened is that `DISTUTILS_BUILD_ARGS` in th=
e python3-protobuf recipe was not updated to `SETUPTOOLS_BUILD_ARGS`. This =
would be a simple fix - just update the recipe and set the flag, if not for=
 one thing: protobuf in meta-oe is in version 3.19.4, and python3-protobuf =
 3.20.0 in meta-python is not able to link against it.</div><div><br></div>=
<div>Internally, I have rolled back python3-protobuf to 3.19.4 and built it=
 with `SETUPTOOLS_BUILD_ARGS +=3D &quot;--cpp_implementation&quot;`. The di=
fference is... massive.</div><div><br></div><div>For 2000 samples with our =
test code we get (all times in microseconds):</div><div><br></div><div><spa=
n style=3D"font-family:monospace">python3-protobuf 3.20<br>parse =C2=A0 =C2=
=A0 =C2=A0mean: 28713us percentiles: {5: 26623, 25: 27343, 50: 28943, 75: 2=
9663, 95: 30687}<br>python3-protobuf 3.19<br>parse =C2=A0 =C2=A0 =C2=A0mean=
: =C2=A0 939us percentiles: {5: 756, 25: 944, 50: 950, 75: 956, 95: 1008}</=
span></div><div><br></div><div>Changing the variable in python3-protobuf is=
 simple, the problem is the version mismatch. It&#39;s either roll back pyt=
hon3-protobuf or update protobuf.</div><div><br></div><div>Jan<br></div><di=
v><div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"color:rgb(102,102=
,102)">Jan Dorniak</span><br style=3D"color:rgb(102,102,102)"><a style=3D"c=
olor:rgb(102,102,102)" href=3D"mailto:e-mail%3Ajaskij@gmail.com" target=3D"=
_blank">e-mail:jaskij@gmail.com</a><font color=3D"#666666"><br></font><br><=
div></div></div></div></div></div></div></div>

--000000000000d46f7e05df48acf6--

