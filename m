Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14900.1793721944279695234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 08:05:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=06e16GZE;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b305e10ac7so3391957b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 08:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793721943; cv=none;
        d=google.com; s=arc-20260327;
        b=pBSLLkT1m/SUGC20wBTTMYq6QYpUDdrxwF3i1jnd+69yybOjZfN8ZKKyJur1wir7uF
         qABR+V/43OihehswuWA/NjG+6KhhdF4PCJEO7bSgQFIWBBnjYstwocHpYrnDvxSPVJkL
         JZFe+gsm6OFYXp4aBFZKOMkm9Q20JywikssMVlj6OOiw/GHdye8BQIyaWEzcAlJCpQvg
         D9zb/lsdPiYctwrdZ2DrZQVHZCW3pdTxGEHNl/wcZ8MQFwshOMd9/J80Kt73JFZyJdlk
         gKqsAmfZvcD0nLVpeGnOnG4nQU7u1Cm+nblc6zSJMgjhy0x2cE61lGOOXu3bRXmumkQK
         HqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xHQYoF5XjtKy/rYRlWXzcTPwprQRElx5/95zE4QKEhA=;
        fh=1JQgoyV2Fo95OQnnJCztnV535dLM1ApxTC7qxaKapHE=;
        b=GHb1N1rW7JNxgxlQlM2L4GAqhE3A+DZ8TIIeyfM3qiRtXEXoKHt3EIAleB5MQTRwO2
         sSh0lNZ/fMr/QSGl/bDN/pNHPo+JsdY7vmMK0DBiwXmTcTNOqk+DKmGOAPORUkYbfGVO
         1Yv5tOne1zWJIZ/KwmpzWXLx+7bB5rKWVPjEl8uBeR6sh+zEHpchyAusTfBpcaPE1XNH
         GGc1pgBxH2vTiGkXVJJ0SdnIRrVB+XQeXiYYUuwi44tjlBrn4BrIq7pXwyYfJhzU9omS
         Neh2IjzC/UbcGFx1FtlGHiZNXODFMd6U/gvRvCWg+XZ/Nns8t8NFSbmeHkJUrOvIjEET
         +V4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721943; x=1794326743; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHQYoF5XjtKy/rYRlWXzcTPwprQRElx5/95zE4QKEhA=;
        b=06e16GZEZFZvljjjL07Aua/88k1Y+iHsMQQI+BgwixzkitK1CKsJ7V9aLhkZCLyD4w
         5lvy8gmOTUNPoovr+ELroAMlgDVZZWmf1fPt5F4agAhl0VgjagfSweozM+9PatQCjwWz
         m0lJ+KZcqnfbMWB/mzIXZs33+GUjeviQR2tnCPMOj+/vKAohNE6ByqHhuTVFCPFL2hi7
         rnDo3+BmdmVGQxeqlHkVDtNeC54ly4+Fou4MV04WMO2wicJg6CdgsOrdjKxi6342hM7w
         b4L4Ri3Emepc5tbQKtDgTxUcgFaPAmNtByg6ioEhHeerH+22s7AByp3LIux3L4gEDhhp
         gP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721943; x=1794326743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xHQYoF5XjtKy/rYRlWXzcTPwprQRElx5/95zE4QKEhA=;
        b=rgRp8cWRYntzlf8NWvgmmOviKsACeghmqcW6qS5sOjXqfHcYDleTRjdLVtm1nrJeLs
         e0muVLLqA8K2XY4/QX6PuM+rrJrQXwRpk1DxUpgyLeijBE6PmX03+ICeXGmp8JW7VluQ
         xQvaIGINyC6+Y7IdO8ktjbo0xM81IjOk+1i6EtjLCx7KzJRGigUaKgRgYmC/3zpN6NZG
         39xb7s+6Gn54LiZ18/Js5GdzsdMLXLvEZcikR1yJF5n3bOr2dEgJqgYfOGRT83pOA8k1
         Q+hmSQG/4AYdxE2YGjXsHU0VDqDZUX7NTaNR8N7v4xcvrZq6XtYR5S7ay2uCKXLlvyYB
         t7CA==
X-Gm-Message-State: APuU4Z/kFHycHEmkEzJDQNHLdZXKxgRe6C9Ywy9SMfCV9hbOVx2J5KoX
	6j2bSNxxnvom23ls+lRVTWmnW+Gj+KudLAfDvFjOXse4BfdRrA33KXey4b6VT6fx/cxJC9HYvqM
	17Bwani0oOP7WB+84IhY+TLuV5cZeKiyzBhE2WF64Yw==
X-Gm-Gg: AYBFou2wK4EYP2qBhET6++3hDzhPOyTDysv9dJg/ULRW5RzpUnx2GIPH1RETDTCldfP
	cMOHX0Bh0tN8iy3kQ2tcUJlZbnaGQBg4JCEn+wCkfZSBYDapDWL4V6AGkgGkYTeEDNu9q+EWm9X
	BWV/vdONSyNbpSqnPH4+NBoUKVf1CoS2C5KQu2TcU2hqBZro92/kfhxNCMTn2cd2nOtMVdYCOGt
	go4MS7i4TKTEksEtcv48+8z8qPtzNK2AZo7zuscDf6KwrPN/SkIPq9i4YiUjI1xlxK5Ef1MpFqz
	V7zcqHt3DU4CAcvVWMOOzeRIlE+xsRgmv6Q3+hnZAy5gd7Gkls32YX68wSSWWlXl4z5rlqq0NYt
	6gHoOo5blMQcgdEaB/YKg2Z3rA925xSzVMlKe4A1sFqFv1NNLW6VA4PliW7tz2jf/y/s+IeABI0
	jTyxL6pBcj2PFET+8cposXyJjL/8bV+h+/iwK9CwoqE8Nh6sRt/p+zLggjYSdBQgQV8KjW1cRnI
	V4FHwDY8JVoZV93KwBeFOFOTfEh+s8jV2cjrH+Y8/Fjw6J5zyYmBj4GLRUt+S56VqS5laqLUkUT
	AIAoTueaLj6XjtV21SyJaw5iq6OEjRUtXmi5R1mC5jIAVwaA4AwSBHF/IW452BGV8QzpHW0iJJp
	SNMg+qWa2bAU=
X-Received: by 2002:a05:690c:389:b0:8ab:37e5:6678 with SMTP id
 00721157ae682-8b2b679d88cmr93788997b3.44.1793721942915; Tue, 03 Nov 2026
 08:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20261103145328.1973965-1-leon.anavi@konsulko.com>
 <20261103145328.1973965-3-leon.anavi@konsulko.com> <CAMKF1soPVRZnP2TMvtwU1KOgsndQjJmNZbVgsFxncDu+-oO20Q@mail.gmail.com>
 <CALtQ3O2J4cssDgK=6QV990gB+JJaUekjhM1wzS2LoZPWFD3-6A@mail.gmail.com>
In-Reply-To: <CALtQ3O2J4cssDgK=6QV990gB+JJaUekjhM1wzS2LoZPWFD3-6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2026 08:05:29 -0800
X-Gm-Features: AclHuK-Ee4GQImTGz7fVzi6HVduGyLPrFk2uZEN-I6Uv1MeoLcfNCFgXUdheMEs
Message-ID: <CAMKF1sq+kY_0AFjuBh7JvsmHGzvvXg1vU4OZmJTKC8hbPv3zTw@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 3/3] overlayfs-tools: Upgrade
 2025.01 -> 2026.10
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003bbf04065f616f5a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 16:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131798

--0000000000003bbf04065f616f5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the explanation. Would it be possible to summarize this in the
commit message for clarity?

Thanks,
Khem

On Tue, Nov 3, 2026, 7:55=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com> w=
rote:

> Hi Khem,
>
> On Tue, Nov 3, 2026 at 4:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>>
>>
>> On Tue, Nov 3, 2026 at 6:53=E2=80=AFAM Leon Anavi via openembedded-devel
>> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>>
>>> Upgrade to release 2026.10:
>>>
>>> - meson: Disable tests build by default
>>> - Define attr dependency
>>> - Test if merged overlay is usable after mounting
>>> - Remove trusted xattrs from upperdir metacopies before copying
>>>   attributes
>>> - Add Option To Use rsync for merge Operation
>>> - Support merge metacopy file
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>  ...verlayfs-tools_2025.01.bb =3D> overlayfs-tools_2026.10.bb} | 6 +---=
--
>>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>>  rename meta-filesystems/recipes-utils/overlayfs/{
>>> overlayfs-tools_2025.01.bb =3D> overlayfs-tools_2026.10.bb} (68%)
>>>
>>> diff --git a/meta-filesystems/recipes-utils/overlayfs/
>>> overlayfs-tools_2025.01.bb b/meta-filesystems/recipes-utils/overlayfs/
>>> overlayfs-tools_2026.10.bb
>>> similarity index 68%
>>> rename from meta-filesystems/recipes-utils/overlayfs/
>>> overlayfs-tools_2025.01.bb
>>> rename to meta-filesystems/recipes-utils/overlayfs/
>>> overlayfs-tools_2026.10.bb
>>> index 3b5963bb26..6a3d609567 100644
>>> --- a/meta-filesystems/recipes-utils/overlayfs/
>>> overlayfs-tools_2025.01.bb
>>> +++ b/meta-filesystems/recipes-utils/overlayfs/
>>> overlayfs-tools_2026.10.bb
>>> @@ -7,14 +7,10 @@ SRC_URI =3D "\
>>>      git://
>>> github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dmaster;ta=
g=3Dv${PV}
>>> <http://github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dm=
aster;tag=3Dv$%7BPV%7D>
>>> \
>>>  "
>>>
>>> -SRCREV =3D "6e925bbbe747fbb58bc4a95a646907a2101741f6"
>>> +SRCREV =3D "950d0cf35e4f917b6836565d76e38bcf7fcf2d5f"
>>>
>>>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>>>
>>>  inherit meson pkgconfig
>>>
>>>  DEPENDS:append:libc-musl =3D " fts"
>>> -
>>> -do_configure:prepend() {
>>> -       sed -i '/Custom targets for testing overlay function/,/command =
:
>>> .*permanent...changes/ d' ${S}/meson.build
>>> -}
>>>
>>
>> Why is this hunk removed ?
>>
>
> In version 2026.10 the tests build is disabled by default because file
> meson.build has been modified to include "if get_option('tests')".
> Following this change I don't think we still need it and anyway if we kee=
p
> do_configure:prepend the build will fail with: "ERROR: Expecting endif go=
t
> eof."
>
> Best regards, Leon
>
>
>>
>>
>>> --
>>> 2.47.3
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#131793):
>>> https://lists.openembedded.org/g/openembedded-devel/message/131793
>>> Mute This Topic: https://lists.openembedded.org/mt/122076983/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
>>> raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--0000000000003bbf04065f616f5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the explanation. Would it be possible to summa=
rize this in the commit message for clarity?<br><br>Thanks,<br>Khem<div><br=
></div><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Nov 3, 2026, 7:55=E2=80=AFAM Leon Anavi &lt;<a h=
ref=3D"mailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>Hi Khem,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Nov 3, 2026 at 4:55=E2=80=AFPM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.kh=
em@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, 2026 at 6:=
53=E2=80=AFAM Leon Anavi via openembedded-devel &lt;leon.anavi=3D<a href=3D=
"mailto:konsulko.com@lists.openembedded.org" target=3D"_blank" rel=3D"noref=
errer">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Upgrade to release 2026.10:<br>
<br>
- meson: Disable tests build by default<br>
- Define attr dependency<br>
- Test if merged overlay is usable after mounting<br>
- Remove trusted xattrs from upperdir metacopies before copying<br>
=C2=A0 attributes<br>
- Add Option To Use rsync for merge Operation<br>
- Support merge metacopy file<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank" rel=3D"noreferrer">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://verlayfs-tools_2025.01.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">verlayfs-tools_2025.01.bb</a> =3D&gt; <a href=3D=
"http://overlayfs-tools_2026.10.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">overlayfs-tools_2026.10.bb</a>} | 6 +-----<br>
=C2=A01 file changed, 1 insertion(+), 5 deletions(-)<br>
=C2=A0rename meta-filesystems/recipes-utils/overlayfs/{<a href=3D"http://ov=
erlayfs-tools_2025.01.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">o=
verlayfs-tools_2025.01.bb</a> =3D&gt; <a href=3D"http://overlayfs-tools_202=
6.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayfs-tools_20=
26.10.bb</a>} (68%)<br>
<br>
diff --git a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://ove=
rlayfs-tools_2025.01.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ov=
erlayfs-tools_2025.01.bb</a> b/meta-filesystems/recipes-utils/overlayfs/<a =
href=3D"http://overlayfs-tools_2026.10.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">overlayfs-tools_2026.10.bb</a><br>
similarity index 68%<br>
rename from meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://over=
layfs-tools_2025.01.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ove=
rlayfs-tools_2025.01.bb</a><br>
rename to meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overla=
yfs-tools_2026.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overl=
ayfs-tools_2026.10.bb</a><br>
index 3b5963bb26..6a3d609567 100644<br>
--- a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overlayfs-=
tools_2025.01.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayfs=
-tools_2025.01.bb</a><br>
+++ b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overlayfs-=
tools_2026.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayfs=
-tools_2026.10.bb</a><br>
@@ -7,14 +7,10 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/kmxz/overlayfs-tools=
.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">github.com/kmxz/overlayfs-tools.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3Dv${PV}</a> \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;6e925bbbe747fbb58bc4a95a646907a2101741f6&quot;<br>
+SRCREV =3D &quot;950d0cf35e4f917b6836565d76e38bcf7fcf2d5f&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
=C2=A0inherit meson pkgconfig<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; fts&quot;<br>
-<br>
-do_configure:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/Custom targets for testing overlay=
 function/,/command : .*permanent...changes/ d&#39; ${S}/meson.build<br>
-}<br></blockquote><div><br></div><div>Why is this hunk removed ?</div></di=
v></div></blockquote><div><br></div><div>In version 2026.10 the tests build=
 is disabled by default because file meson.build has been modified to inclu=
de &quot;if get_option(&#39;tests&#39;)&quot;. Following this change I don&=
#39;t think we still need it and anyway if we keep do_configure:prepend the=
 build will fail with: &quot;ERROR: Expecting endif got eof.&quot;<br><br>B=
est regards, Leon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131793): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131793" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/131793</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122076983/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/122076983/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--0000000000003bbf04065f616f5a--
