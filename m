Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB45C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:03:01 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.48463.1718892177155598865
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENDnQ5Qy;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: ticotimo@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2598ae41389so494375fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718892176; x=1719496976; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FF/KUNt8A6tGdPI3xCbOi4QB9SITFySFJIEqKeAg1Uc=;
        b=ENDnQ5QymYglxi+FRkDMFRmIQONRsauogHRP6FDPSlgoLQ7FpMfWXUwFsgKPchmnQo
         Eyc4wzE7tIwOxgJt+ayyrnGRqivzzABdLJp/xU/IG/9J/6i/MvQs8NpndO3UL66d8ucn
         6fCfFQcww/ooasNaMs2Vmny52fTul/to5zjIy/kxMRtXqkh9XSVCbT6lefB9S2yy+DfV
         YObuYLxeKMgXGfLfzgzFF1i8dAg76CM6t8llG+QgWFVHKqKyU3xq4mdiV1KQ376JfMb8
         Ef1fsM7sOlW13gNE6cwt/jwokko5URNsSzPeq78cyIRoNgZ/NI6rFgSnvS7qVkqrHOOq
         JKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892176; x=1719496976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FF/KUNt8A6tGdPI3xCbOi4QB9SITFySFJIEqKeAg1Uc=;
        b=VXjehm3NrX0Tda/RzMq/AHGpNeyZmiVOwXdhjRFEuzPOL6YJRzLaBy9sIojfrCcHpq
         K8YHyj613tcu/p3xEqeu1PfweAeg9O6vw8Ewy3IewbRDRy4hHERcBPfz3poZLpYaWon4
         G8pE4zYZJwsccvkf+yRZPWYGHoyb06YpgdAp4EstZkhUHKV6tLUg+Vr0ia9anpQTXB8U
         G02LHFK+crFZsjwhC6Gkx2rG/LenqIDYv57Is72hrlqkdR6S8CanSzVuAA3WxW1z8qMP
         S6RbEnVC15HF45fiJWOswcajrfvdLPHKJaCoObm8SFBYWtNgxA5QsvmOJ3meTgnWr5SG
         ir0w==
X-Gm-Message-State: AOJu0Yx/o8m7OrT3fkCqjR2fUS5JsdLDChsHXdrkK4Fcucik0kBGUFN5
	OIOSrtLcAPahnF2V5Rj+l22xGlm52stWSYCqQO42bMD/ZUG4gKkoXYob1ZY0ePoV7UFckhVKgIe
	S9ftEQ3HkDH3520h8N7Nl7eA7s3G5mQ==
X-Google-Smtp-Source: AGHT+IGK6S5qhkXY/3rnGqHNMLlkwL1MrRPij3c0ZjmXELDAVcvUf/hRiaqYYy1SEYXua7WYo3IAwOH2uuyx/LcAM2c=
X-Received: by 2002:a05:6358:718:b0:19b:5c37:3616 with SMTP id
 e5c5f4694b2df-1a1fd3c6d14mr609015655d.13.1718892176027; Thu, 20 Jun 2024
 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240620135252.980949-1-leon.anavi@konsulko.com>
 <20240620135252.980949-2-leon.anavi@konsulko.com> <CANx9H-DTxgFMiYVzDZ4=huR1o3vHiYaOCVrm+ustdh0_sBrtMw@mail.gmail.com>
In-Reply-To: <CANx9H-DTxgFMiYVzDZ4=huR1o3vHiYaOCVrm+ustdh0_sBrtMw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 20 Jun 2024 07:02:44 -0700
Message-ID: <CANx9H-DqfLxrVO6+guXZK+is4i-FDk1Vv3rC8V828j4CZ47bhA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-requests-file: Upgrade
 1.5.1 -> 2.1.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008f380d061b52c527"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 14:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110977

--0000000000008f380d061b52c527
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 7:01=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wro=
te:

> This should also be updated to inherit python_setuptools_build_meta per
>
> https://github.com/dashea/requests-file/blob/ce642a115d0cc7ee2d2cda614ce9=
b2a0bbebe562/pyproject.toml#L3
>

<https://github.com/dashea/requests-file/blob/ce642a115d0cc7ee2d2cda614ce9b=
2a0bbebe562/pyproject.toml#L3>
>
Never mind you did that ;)

>
>
> On Thu, Jun 20, 2024 at 6:53=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
>> Upgrade to release 2.1.0:
>>
>> - Correct a typo in requests_file.py
>> - Remove dependency on six
>> - Move metadata to pyproject.toml
>> - Correct homepage link in pyproject.toml
>> - Fix black formatting
>> - Set the request property in the returned Response object
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  ...ests-file_1.5.1.bb =3D> python3-requests-file_2.1.0.bb} | 9 ++++++--=
-
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>  rename meta-python/recipes-devtools/python/{
>> python3-requests-file_1.5.1.bb =3D> python3-requests-file_2.1.0.bb} (70%=
)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-requests-file_1.5.1.bb b/meta-python/recipes-devtools/python/
>> python3-requests-file_2.1.0.bb
>> similarity index 70%
>> rename from meta-python/recipes-devtools/python/
>> python3-requests-file_1.5.1.bb
>> rename to meta-python/recipes-devtools/python/
>> python3-requests-file_2.1.0.bb
>> index 7ff984a93..4e0adc39f 100644
>> --- a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
>> @@ -3,15 +3,18 @@ HOMEPAGE =3D "http://github.com/dashea/requests-file"
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9cc728d6087e43796227b0a31422=
de6b"
>>
>> -SRC_URI[md5sum] =3D "c96daf6b0c56687556e8a52748fd896c"
>> -SRC_URI[sha256sum] =3D
>> "07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e"
>> +SRC_URI[sha256sum] =3D
>> "0f549a3f3b0699415ac04d167e9cb39bccfb730cb832b4d20be3d9867356e658"
>>
>> -inherit pypi setuptools3 ptest
>> +PYPI_PACKAGE =3D "requests_file"
>> +
>> +inherit pypi python_setuptools_build_meta ptest
>>
>>  SRC_URI +=3D " \
>>          file://run-ptest \
>>  "
>>
>> +DEPENDS +=3D "python3-setuptools-scm-native"
>> +
>>  RDEPENDS:${PN}-ptest +=3D " \
>>      python3-pytest \
>>      python3-unittest-automake-output \
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110973):
>> https://lists.openembedded.org/g/openembedded-devel/message/110973
>> Mute This Topic: https://lists.openembedded.org/mt/106780172/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000008f380d061b52c527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 20, 2024 at 7:01=E2=80=AFAM Tim Orling &lt;<a h=
ref=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)"><div dir=3D"auto">This should also be updated to inherit=
 python_setuptools_build_meta per</div><div dir=3D"auto"><div><a href=3D"ht=
tps://github.com/dashea/requests-file/blob/ce642a115d0cc7ee2d2cda614ce9b2a0=
bbebe562/pyproject.toml#L3" target=3D"_blank">https://github.com/dashea/req=
uests-file/blob/ce642a115d0cc7ee2d2cda614ce9b2a0bbebe562/pyproject.toml#L3<=
/a></div></div></blockquote><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<div dir=3D"auto"><div dir=3D"auto"><a href=3D"https://github.com/dashea/re=
quests-file/blob/ce642a115d0cc7ee2d2cda614ce9b2a0bbebe562/pyproject.toml#L3=
" target=3D"_blank"></a></div></div></blockquote><div dir=3D"auto">Never mi=
nd you did that ;)</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto"><br></div><div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jun 20, 2024 at 6:53=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.ope=
nembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;leon.anavi=
=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" target=3D"_blank"=
>konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)">Upgrade to release 2.1.0:<br>
<br>
- Correct a typo in requests_file.py<br>
- Remove dependency on six<br>
- Move metadata to pyproject.toml<br>
- Correct homepage link in pyproject.toml<br>
- Fix black formatting<br>
- Set the request property in the returned Response object<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ests-file_1.5.1.bb" rel=3D"noreferrer" target=3D=
"_blank">ests-file_1.5.1.bb</a> =3D&gt; <a href=3D"http://python3-requests-=
file_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file_2=
.1.0.bb</a>} | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-requests-file_1.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-reque=
sts-file_1.5.1.bb</a> =3D&gt; <a href=3D"http://python3-requests-file_2.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file_2.1.0.bb</a=
>} (70%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
requests-file_1.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-reques=
ts-file_1.5.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-requests-file_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-requests-file_2.1.0.bb</a><br>
similarity index 70%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-r=
equests-file_1.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-request=
s-file_1.5.1.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-req=
uests-file_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-=
file_2.1.0.bb</a><br>
index 7ff984a93..4e0adc39f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-file_1.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file=
_1.5.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-request=
s-file_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests-file=
_2.1.0.bb</a><br>
@@ -3,15 +3,18 @@ HOMEPAGE =3D &quot;<a href=3D"http://github.com/dashea/re=
quests-file" rel=3D"noreferrer" target=3D"_blank">http://github.com/dashea/=
requests-file</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9cc728d6087e43796227b=
0a31422de6b&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c96daf6b0c56687556e8a52748fd896c&quot;<br>
-SRC_URI[sha256sum] =3D &quot;07d74208d3389d01c38ab89ef403af0cfec63957d53a0=
081d8eca738d0247d8e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0f549a3f3b0699415ac04d167e9cb39bccfb730cb832b=
4d20be3d9867356e658&quot;<br>
<br>
-inherit pypi setuptools3 ptest<br>
+PYPI_PACKAGE =3D &quot;requests_file&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
+DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
+<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
=C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110973): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110973" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110973</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106780172/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106780172/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000008f380d061b52c527--

