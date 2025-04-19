Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9293DC369BD
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 14:19:44 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.8690.1745072382758472331
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 07:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dvrbt/op;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6060a70ba80so382182eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745072382; x=1745677182; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IzBjV3QLgTjmoiYRGDEmUn47LQ/TK6VnUd3RU+r4qWI=;
        b=Dvrbt/oplC4Nni5d7KZImglEWowPm30bJmNc+AsQjatHq5UWpRZaakjdCtwyJREuAV
         so+AcQM6UlTEHEMh0noaHkE8SPCLXr3Z16paWd/gCjrpzlapq+AgI67pEFxmXta9jaJB
         1jBj9V1JZ7RhVfT3TbT4IPuX9tqfE7vftsixWZwEDDQVgI9Ci+H2NPQdxFAWok6fL+ri
         MeoWabwm5Zy39cmqNfg7QcdHQPlbWqpNb1QE8B8zQgQC4GlcX2f698vnXP0p3DkcfvB4
         HvIh6kjLqyQ3qw6cSsu8VmYzifAvpXE+9C6+dzDs7qieRZOH2Xait0HxYlHbOPHelbJC
         pNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745072382; x=1745677182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzBjV3QLgTjmoiYRGDEmUn47LQ/TK6VnUd3RU+r4qWI=;
        b=qjTS2k4jYcxl1wuc0J9ENqBZ4noXYYE5beAVpzP2OWwChAhDAuoTfRmi2St1WbooHY
         IT8y4G8DTY1rCAJeaTOTKGi7SvBQUScXIB2UQPBWIwv3q7WIOV6p2EaoxSWbcORjXLHA
         OvMtI1qPSm0e+7IJ5faW/ryPRTK05ppQSmGUZrywLkZog1U1Wjl/pFAHNI1j7wugFPFp
         t2ku6AmDBGuxDC+PJMUMI0B4nJws1XXCf+Fy+FJ/+l/vX1nmZ4kFDcvr66gR4TBCqL8X
         QD6KKMUULsi+PC28hDIFJWPB8GVQRvL1N7tiWzpjb93KcuHg1GKpfIEUQOGrC4h01oz2
         TpVw==
X-Gm-Message-State: AOJu0YyW6ubZG6EaJkXjlMi7xs2w166t2pM7w4LHfwwzx9BEdQXWuXiN
	n7Klwj/SrNBCvQZoXOsSEUwVytlsg/+/jc1wRX4GPeqES1dG6O9VSMFMKZPqGRriKyICfO4lipe
	OxpDiVdo95QndWBUh1eyx9nTvX2M=
X-Gm-Gg: ASbGncsa4h0vd/GFBNMx1mhLOUWRi2OH9O9sWlSh4DYz8f/YZNDu2bR54eexE0XNBnh
	DDbNOAYf+RnLduM018RrDij4qDtpyl+ywUUWMBJH3Z4HlQVUyHi8aO5sbqxPmKogljiVKMnslO1
	vt4neX0He+Wn5y5JauhoIOyn9K/S3ozQrO2K7FMjBByAezwwEm4jnW
X-Google-Smtp-Source: AGHT+IGLaNAo1k3pxVi9i7s9s6dMEc5XsbaF8dkOomj6mN1DmuoFS8XsBUCdgSS+oCOfP0Y4RLvpqP5DM4zIsOK7U0o=
X-Received: by 2002:a4a:c910:0:b0:606:47f:849 with SMTP id 006d021491bc7-606047f0ca3mr1845293eaf.1.1745072381916;
 Sat, 19 Apr 2025 07:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250418105119.3211549-1-leon.anavi@konsulko.com>
 <CAMKF1sqhR5FRsw3cfM1J1V4qhbdo4YYgf+NQ3CODAk9O9nD4iA@mail.gmail.com>
 <CAMKF1sqjHe7JoGBTQrOfzUi_em8nXw5yVrDhNWTHzy+mFo0HEg@mail.gmail.com> <321017f0-7d50-44af-a391-126d3d4d9ff0@konsulko.com>
In-Reply-To: <321017f0-7d50-44af-a391-126d3d4d9ff0@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Apr 2025 07:19:31 -0700
X-Gm-Features: ATxdqUHm_5MsHtp7XKD4dng85zGW8d4pAZvMIHOpPVIzJ2bOQdaIi4ZK_cSTeoo
Message-ID: <CAMKF1sqL3tYOx2JR5MVs5+-RXDYeDpRYfvNbsoryTpoQMVq8uA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-eth-utils: Upgrade 5.2.0 -> 5.3.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e7efa0633225366"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 14:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116982

--0000000000006e7efa0633225366
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 7:07=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com=
> wrote:

> Hi Khem,
>
> On 18.04.25 =D0=B3. 21:55 =D1=87., Khem Raj wrote:
> > Here is further recipes which need this check
> I saw that in the mean time you submitted a patch that enables pydantic
> risc-v builds because python3-pydantic-core has been fixed. Regarding
> these circumstances do we need to check these recipes?


Yeah I fixed pydantic I will now take v1

>
>
> Best regards,
> Leon
>
> > ERROR: Nothing RPROVIDES 'python3-eth-utils' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-abi_5.2.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-keys_0.5.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-
> >     =E2=86=AA python/recipes-devtools/python/python3-eth-account_0.12.1=
.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-rlp_2.1.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-rlp_4.1.0.bb
> > RDEPENDS on or otherwise requires it)
> >     python3-eth-utils was skipped: incompatible with host
> > riscv32-yoe-linux (not in COMPATIBLE_HOST)
> >     NOTE: Runtime target 'python3-eth-utils' is unbuildable, removing..=
.
> >     Missing or unbuildable dependency chain was: ['python3-eth-utils']
> >     ERROR: Nothing RPROVIDES 'python3-eth-abi' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-abi_5.2.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-account_0.12.1.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-abi'
> >     NOTE: Runtime target 'python3-eth-abi' is unbuildable, removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-abi']
> >     ERROR: Nothing RPROVIDES 'python3-eth-abi-dev' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-abi_5.2.0.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-abi-dev'
> >     NOTE: Runtime target 'python3-eth-abi-dev' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-abi-dev'=
]
> >     ERROR: Nothing RPROVIDES 'python3-eth-keys' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-keyfile_0.8.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-keys_0.5.0.bb,
> > /home/yoe/sources/meta-openembedded/
> >     =E2=86=AA meta-python/recipes-devtools/python/python3-eth-account_0=
.12.1.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-keys'
> >     NOTE: Runtime target 'python3-eth-keys' is unbuildable, removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-keys']
> >     ERROR: Nothing RPROVIDES 'python3-eth-keyfile' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-keyfile_0.8.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-account_0.12.1.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-keyfile'
> >     NOTE: Runtime target 'python3-eth-keyfile' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-keyfile'=
]
> >     ERROR: Nothing RPROVIDES 'python3-eth-keyfile-dev' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-keyfile_0.8.0.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-keyfile-dev'
> >     NOTE: Runtime target 'python3-eth-keyfile-dev' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was:
> ['python3-eth-keyfile-dev']
> >     ERROR: Nothing RPROVIDES 'python3-eth-keys-dev' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-keys_0.5.0.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-keys-dev'
> >     NOTE: Runtime target 'python3-eth-keys-dev' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-keys-dev=
']
> >     ERROR: Nothing RPROVIDES 'python3-rlp' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-account_0.12.1.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-rlp_2.1.0.bb,
> > /home/yoe/sources/meta-openembedded/meta-
> >     =E2=86=AA python/recipes-devtools/python/python3-rlp_4.1.0.bb RDEPE=
NDS on
> > or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-rlp'
> >     NOTE: Runtime target 'python3-rlp' is unbuildable, removing...
> >     Missing or unbuildable dependency chain was: ['python3-rlp']
> >     ERROR: Nothing RPROVIDES 'python3-eth-rlp' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-account_0.12.1.bb,
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-rlp_2.1.0.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-rlp'
> >     NOTE: Runtime target 'python3-eth-rlp' is unbuildable, removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-rlp']
> >     ERROR: Nothing RPROVIDES 'python3-eth-account-dev' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-account_0.12.1.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-account-dev'
> >     NOTE: Runtime target 'python3-eth-account-dev' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was:
> ['python3-eth-account-dev']
> >     ERROR: Nothing RPROVIDES 'python3-eth-account' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-account_0.12.1.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-account'
> >     NOTE: Runtime target 'python3-eth-account' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-account'=
]
> >     ERROR: Nothing RPROVIDES 'python3-eth-rlp-dev' (but
> > /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/
> python3-eth-rlp_2.1.0.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-eth-rlp-dev'
> >     NOTE: Runtime target 'python3-eth-rlp-dev' is unbuildable,
> removing...
> >     Missing or unbuildable dependency chain was: ['python3-eth-rlp-dev'=
]
> >     ERROR: Nothing RPROVIDES 'python3-rlp-dev' (but
> > /home/oe/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-rlp_4.1.0.bb
> > RDEPENDS on or otherwise requires it)
> >     No eligible RPROVIDERs exist for 'python3-rlp-dev'
> >     NOTE: Runtime target 'python3-rlp-dev' is unbuildable, removing...
> >     Missing or unbuildable dependency chain was: ['python3-rlp-dev']
> >
> > On Fri, Apr 18, 2025 at 8:26=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> >> On Fri, Apr 18, 2025 at 3:51=E2=80=AFAM Leon Anavi via lists.openembed=
ded.org
> >> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >>> Upgrade to release 5.3.0:
> >>>
> >>> - Replace arg["name"] with arg.get("name") to correctly handle
> >>>    optional names
> >>> - Add new methods: to_wei_decimals, and from_wei_decimals which
> >>>    take a number instead of a string
> >>> - Add CamelModel pydantic model for validating objects and
> >>>    serializing to camelCase when used with by_alias=3DTrue, with
> >>>    the general expectation of a well-formed JSON-RPC object.
> >>>
> >>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >>> ---
> >>>   ...python3-eth-utils_5.2.0.bb =3D> python3-eth-utils_5.3.0.bb} | 5
> ++++-
> >>>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>>   rename meta-python/recipes-devtools/python/{
> python3-eth-utils_5.2.0.bb =3D> python3-eth-utils_5.3.0.bb} (76%)
> >>>
> >>> diff --git a/meta-python/recipes-devtools/python/
> python3-eth-utils_5.2.0.bb b/meta-python/recipes-devtools/python/
> python3-eth-utils_5.3.0.bb
> >>> similarity index 76%
> >>> rename from meta-python/recipes-devtools/python/
> python3-eth-utils_5.2.0.bb
> >>> rename to meta-python/recipes-devtools/python/
> python3-eth-utils_5.3.0.bb
> >>> index 435d032a84..3b71684820 100644
> >>> --- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
> >>> +++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> >>> @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
> >>>   LICENSE =3D "MIT"
> >>>   LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd3f53e7cc5bf80b16eff1f4a38c73182"
> >>>
> >>> -SRC_URI[sha256sum] =3D
> "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
> >>> +SRC_URI[sha256sum] =3D
> "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
> >>>
> >>>   PYPI_PACKAGE =3D "eth_utils"
> >>>   UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> >>> @@ -16,4 +16,7 @@ RDEPENDS:${PN} +=3D " \
> >>>       python3-eth-typing \
> >>>       python3-setuptools \
> >>>       python3-toolz \
> >>> +    python3-pydantic \
> >>>   "
> >>> +
> >>> +COMPATIBLE_HOST:riscv32 =3D "null"
> >> this should also be applied to recipes which depend upon
> python3-eth-utils
> >>> --
> >>> 2.39.5
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#116947):
> https://lists.openembedded.org/g/openembedded-devel/message/116947
> >>> Mute This Topic: https://lists.openembedded.org/mt/112328943/1997914
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [raj.khem@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
>

--0000000000006e7efa0633225366
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 19, 2025 at 7:07=E2=80=AFAM=
 Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com">leon.anavi@konsu=
lko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
On 18.04.25 =D0=B3. 21:55 =D1=87., Khem Raj wrote:<br>
&gt; Here is further recipes which need this check<br>
I saw that in the mean time you submitted a patch that enables pydantic <br=
>
risc-v builds because python3-pydantic-core has been fixed. Regarding <br>
these circumstances do we need to check these recipes?</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">Yeah I fixed pydantic I will now take=
 v1=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Best regards,<br>
Leon<br>
<br>
&gt; ERROR: Nothing RPROVIDES &#39;python3-eth-utils&#39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-abi_5.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-abi_5.2.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-keys_0.5.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-eth-keys_0.5.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=86=AA python/recipes-devtools/python/<a href=3D=
"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-eth-account_0.12.1.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-rlp_2.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-rlp_2.1.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-rlp_4.1.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-rlp_4.1.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0python3-eth-utils was skipped: incompatible with ho=
st<br>
&gt; riscv32-yoe-linux (not in COMPATIBLE_HOST)<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-utils&#39; is=
 unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-utils&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-abi&#39; =
(but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-abi_5.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-abi_5.2.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-eth-account_0.12.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-a=
bi&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-abi&#39; is u=
nbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-abi&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-abi-dev&#=
39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-abi_5.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-abi_5.2.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-a=
bi-dev&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-abi-dev&#39; =
is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-abi-dev&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-keys&#39;=
 (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-keyfile_0.8.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-eth-keyfile_0.8.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-keys_0.5.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-eth-keys_0.5.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=86=AA meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-eth-account_0.12.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-k=
eys&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-keys&#39; is =
unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-keys&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-keyfile&#=
39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-keyfile_0.8.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-eth-keyfile_0.8.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-eth-account_0.12.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-k=
eyfile&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-keyfile&#39; =
is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-keyfile&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-keyfile-d=
ev&#39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-keyfile_0.8.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-eth-keyfile_0.8.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-k=
eyfile-dev&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-keyfile-dev&#=
39; is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-keyfile-dev&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-keys-dev&=
#39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-keys_0.5.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-eth-keys_0.5.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-k=
eys-dev&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-keys-dev&#39;=
 is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-keys-dev&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-rlp&#39; (but=
<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-eth-account_0.12.1.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-rlp_2.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-rlp_2.1.0.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=86=AA python/recipes-devtools/python/<a href=3D=
"http://python3-rlp_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
rlp_4.1.0.bb</a> RDEPENDS on<br>
&gt; or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-rlp&#=
39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-rlp&#39; is unbui=
ldable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-rlp&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-rlp&#39; =
(but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-eth-account_0.12.1.bb</a>,<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-rlp_2.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-rlp_2.1.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-r=
lp&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-rlp&#39; is u=
nbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-rlp&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-account-d=
ev&#39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-eth-account_0.12.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-a=
ccount-dev&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-account-dev&#=
39; is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-account-dev&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-account&#=
39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-account_0.12.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-eth-account_0.12.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-a=
ccount&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-account&#39; =
is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-account&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-eth-rlp-dev&#=
39; (but<br>
&gt; /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-eth-rlp_2.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-rlp_2.1.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-eth-r=
lp-dev&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-eth-rlp-dev&#39; =
is unbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-eth-rlp-dev&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Nothing RPROVIDES &#39;python3-rlp-dev&#39; =
(but<br>
&gt; /home/oe/sources/meta-openembedded/meta-python/recipes-devtools/python=
/<a href=3D"http://python3-rlp_4.1.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-rlp_4.1.0.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0No eligible RPROVIDERs exist for &#39;python3-rlp-d=
ev&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Runtime target &#39;python3-rlp-dev&#39; is u=
nbuildable, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing or unbuildable dependency chain was: [&#39;=
python3-rlp-dev&#39;]<br>
&gt;<br>
&gt; On Fri, Apr 18, 2025 at 8:26=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt; On Fri, Apr 18, 2025 at 3:51=E2=80=AFAM Leon Anavi via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
&gt;&gt; &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded=
.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;&gt;&gt; Upgrade to release 5.3.0:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Replace arg[&quot;name&quot;] with arg.get(&quot;name&quot;)=
 to correctly handle<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 optional names<br>
&gt;&gt;&gt; - Add new methods: to_wei_decimals, and from_wei_decimals whic=
h<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 take a number instead of a string<br>
&gt;&gt;&gt; - Add CamelModel pydantic model for validating objects and<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 serializing to camelCase when used with by_alias=
=3DTrue, with<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 the general expectation of a well-formed JSON-RPC=
 object.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@kon=
sulko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0...<a href=3D"http://python3-eth-utils_5.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-eth-utils_5.2.0.bb</a> =3D&gt; =
<a href=3D"http://python3-eth-utils_5.3.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-eth-utils_5.3.0.bb</a>} | 5 ++++-<br>
&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0rename meta-python/recipes-devtools/python/{<a hre=
f=3D"http://python3-eth-utils_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-eth-utils_5.2.0.bb</a> =3D&gt; <a href=3D"http://python3-eth-util=
s_5.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-utils_5.3.0.bb=
</a>} (76%)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-eth-utils_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-eth-utils_5.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"=
http://python3-eth-utils_5.3.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-eth-utils_5.3.0.bb</a><br>
&gt;&gt;&gt; similarity index 76%<br>
&gt;&gt;&gt; rename from meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-eth-utils_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-eth-utils_5.2.0.bb</a><br>
&gt;&gt;&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-eth-utils_5.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
eth-utils_5.3.0.bb</a><br>
&gt;&gt;&gt; index 435d032a84..3b71684820 100644<br>
&gt;&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-eth-utils_5.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-=
utils_5.2.0.bb</a><br>
&gt;&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-eth-utils_5.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-eth-=
utils_5.3.0.bb</a><br>
&gt;&gt;&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;devel/python&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd3=
f53e7cc5bf80b16eff1f4a38c73182&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -SRC_URI[sha256sum] =3D &quot;17e474eb654df6e18f20797b22c6caab=
b77415a996b3ba0f3cc8df3437463134&quot;<br>
&gt;&gt;&gt; +SRC_URI[sha256sum] =3D &quot;1f096867ac6be895f456fa3acb26e957=
3ae66e753abad9208f316d24d6178156&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0PYPI_PACKAGE =3D &quot;eth_utils&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKA=
GE}&quot;<br>
&gt;&gt;&gt; @@ -16,4 +16,7 @@ RDEPENDS:${PN} +=3D &quot; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-eth-typing \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-setuptools \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-toolz \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 python3-pydantic \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
&gt;&gt; this should also be applied to recipes which depend upon python3-e=
th-utils<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.39.5<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt;&gt; View/Reply Online (#116947): <a href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/116947" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-devel/message/116947<=
/a><br>
&gt;&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/=
112328943/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/112328943/1997914</a><br>
&gt;&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openem=
bedded.org</a><br>
&gt;&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/opene=
mbedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt;<br>
</blockquote></div></div>

--0000000000006e7efa0633225366--

