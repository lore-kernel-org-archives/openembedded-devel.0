Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83476F43832
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:58:39 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21105.1776265114640771159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UaWFS8B6;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-651bc8f864fso2733827d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776265114; cv=none;
        d=google.com; s=arc-20240605;
        b=HQ2Pr/oMz+83/PcbxyKIonSfQVxDyov7iiG7FqX01a+T04c4ZTa7oPxjghIMq03Sgz
         FzMPfSh7xkwSFRP3x00uXWtnjBSE58VemEGQ/vTGL6GAuuypbLGnL+zl6O+28gvimvDq
         lO0V4PA4D8TB8NYXFXggWPepeRNqQTAknhEzW62ptjO1YQBegbNj6ooR7n/BczkudsUS
         lfYasxSitAy5pjjGq8Hor/8r1IvvcmuTKIom1LwoDtcnpaxOgHFlvFh9pt7R8MkFJeUc
         Pm1/KumFTp1ptlVqflnNorzPAtAXzWYLz8XWvE7/Cxgi4GCJh/mI4zlt0aqrKwIPeVUK
         5m2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L1WMVati/ikd9Iump6m8jrWLZIEsFdTs5gjwhM3NtPU=;
        fh=C75Xr3BybIIz66XNYP0bIfQ/QyMIDbm2VV6ixGFJrqE=;
        b=YSoQRTJ4g7D9Hq0QxibDGxVLbQey+/pTBDXfq87BctoXegA+thI14lUR0yiy3EQhQF
         W1HJEJHiTwjz/SW7kCbz/oHL6ZacvLf+v/hl6XQL56iLasKrSHSOz+BTwi/yLLV8SgNu
         /N+VG5rdO1dAIAhZcVr4QM1rmLllvaws8ImIV451A8yUzNiFDemUmpDs1tA+7jyEs2Sn
         IkPjl2mPuaqehgstXHt05R67MyiSqzSgZsv7jnzQA92DYm9I4XsXe9QImk38ijgl0vvU
         3b3DaacZG8obmBlJs5iw7HM+OAVkWinVbAuToFparJpRRpksHQEfEgZdVG7G338W4aTP
         OBVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776265114; x=1776869914; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L1WMVati/ikd9Iump6m8jrWLZIEsFdTs5gjwhM3NtPU=;
        b=UaWFS8B60EWZsRTUSScd15gHskS8Pv/eSklc5PxGf7Dr4mcwxLhLbgrL5oCHeA3mvh
         drwH9v5VNlpBmcY4WJw3weYIpbgfLkZ3ppUlIJpG0lBIIzzJdQlnKyBvBrpnJV/UW+W8
         KjttA+jVUM7dFKEVjVkoBCIuBvzc+wRnArrKT4L3DMg+psy2XsW+1gWeEUyXHL73Nbe4
         4dVEqvjZoioly07vhxChdCRtRfB4IqCRMVshML+A8tpIdIGq2snxacaBhfJs0KWnhOPD
         FVmqjtQ35mUsdLmFw0wOcV/mG/NUNdvS/gDj9YMfUehzASscnd1UoKg/3x/Q7sUOkMLn
         IgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776265114; x=1776869914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1WMVati/ikd9Iump6m8jrWLZIEsFdTs5gjwhM3NtPU=;
        b=b9LJK+ksIoGKI1wECKhRNdkgFsqZL5GJfNF8eZG2lqAJUDyqETCTp+ViFgmIDHN7GC
         UARV/YsW9bNZ9liKqPT4DGSH/vIs/Ut6vM4Iirz5nqwpMiDikD4DT2tR2jFt/QGRuppJ
         k2U0AqHTVfFGkWts+eQbB/gSlV//kBevVsHNez+uZAOthkcHZas8ak1WfRv3ypsGbVod
         GkTAAOGosOa45ROYp/3FJLv3qJ7p6h0p4lAu01OVL20tFuG6NgOJ8o9kyT3LWmy8+Tep
         4DQQTdrm3fJKdkaU33dS3Xx/wGHzbUKZKXh4Sn8InU2LX1MUyLcnfzttsRw+FysElyLs
         qcDw==
X-Forwarded-Encrypted: i=1; AFNElJ9DRHVTu6aUNH7InJJ9L+vs8g5G6i29zW6/5uyXexp429WTr5aOszSa49be1Xsel26ck02QsNbawLSzVYb7v15TQoo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKKjQQsSywvQA3SLUrL2YWEClGDq3jJYhak3rPUXAmKdYkWZbL
	4nkdlfru+Z9h+VJl/rIWVdVDXfCrrQWHJkzOt+kspcRmzG+Nwid2M078+atA0dUHjUL2gqnU5Do
	IgXqjwW9MgEprSZDzwtf4FWv1v07m7gg=
X-Gm-Gg: AeBDieuKG0Q1/gIu4QwRTtAMhgbxsPnJMLcp5+qME/n5gkXhIuxKlbnzsAXJ9Z0PU03
	7jrOkFnYlliMi85+henehULyeK9CzyFcUqVm0Bmy8vPuiShV2ZgcZbL2nyg6i5ty2FXw10recBz
	OuCpjm8S5e+Vh9BvUQpGAbQA2noi1S0MdvzPqgaQL+ZYMnUbiSlkPzAiO3RbiAh2so4XCWqRJ3a
	Xi96aN0/X3ixaeCTH5xUZqc+yOENBZAjguvhkUs+ONx1d20ldKn8r2+8WNhui1RriBNvhbYX0pL
	uZVEwcDCrvJxwGMG7AfQwqRuai3jQE/Zl6hkDOfbC5vYYCHLKPKRG6lkT8gJm8SOSdFbj/7RQ+o
	4wXnJUvSAUPJPRs/5s4PAABSkdn433S0qnkPTLCQ4U0AsBTJUEZSNkAG2VMR9o4eVHkEQtXM2iP
	dGx8RbgPufI1Bl/hc=
X-Received: by 2002:a05:690e:4801:b0:650:ea3:de9b with SMTP id
 956f58d0204a3-65198ab0f2fmr14276414d50.21.1776265113678; Wed, 15 Apr 2026
 07:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
 <20260329-fix-confusing-appends-v1-10-df7e87b8b879@gmail.com> <13c8553f-9420-47a7-af0d-da9f56b9a98f@sephalon.net>
In-Reply-To: <13c8553f-9420-47a7-af0d-da9f56b9a98f@sephalon.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Apr 2026 07:58:07 -0700
X-Gm-Features: AQROBzBNGCY_VcDnN4ZNzQfVtCmW7bz69ejrCFzHMgO6mgvcLtbSibB-WEy3eNs
Message-ID: <CAMKF1sokQEq7egMv9Tafap9xfjAdjW-BRb_ZXCgV2ieUJVNkRA@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/13] syzkaller: Drop qemu-system-native dependency
To: me@sephalon.net
Cc: Michal Sieron <michalwsieron@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Ovidiu Panait <ovidiu.panait@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000020b86f064f80f3b9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 14:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126361

--00000000000020b86f064f80f3b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 7:22=E2=80=AFAM Stefan Wiehler via lists.openembedd=
ed.org
<me=3Dsephalon.net@lists.openembedded.org> wrote:

> > Either I am missing something or it isn't needed in the build time and
> > should maybe be a RRECOMMENDS:${PN}?
> >
> > Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> > Cc: Stefan Wiehler <me@sephalon.net>
> > ---
> >  meta-oe/recipes-test/syzkaller/syzkaller_git.bb | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> > index e35a8a77be..bdd4cf6a40 100644
> > --- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> > +++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> > @@ -6,8 +6,6 @@ LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/LICENSE;md5=3D5335066555b14d832335aa4660d6c376"
> >  require ${BPN}-licenses.inc
> >
> > -DEPENDS:class-native +=3D "qemu-system-native"
> > -
> >  SRC_URI =3D
> "git://${GO_IMPORT};protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}=
;branch=3Dmaster"
> >  SRCREV =3D "22ec1469fe8c0ba256de07e8f97fa7b375b522bd"
> >  require ${BPN}-go-mods.inc
> > @@ -39,8 +37,6 @@ GOBUILDFLAGS:remove =3D "-buildmode=3Dpie"
> >
> >  LDFLAGS:append:class-target =3D
> "${@bb.utils.contains_any("TC_CXX_RUNTIME", "llvm android", " -lc++", "
> -lstdc++", d)}"
> >
> > -DEPENDS:class-native +=3D "qemu-system-native"
> > -
> >  compile_native() {
> >      export HOSTOS=3D"${GOHOSTOS}"
> >      export HOSTARCH=3D"${GOHOSTARCH}"
> >
>
> I see this has already been merged, but QEMU is actually required for
> the syzkaller selftest, which is only documented in the respective
> commit message [1].
>
> However, I am not sure if the selftest is still maintained; it has not
> seen any changes since its introduction in 2022 and when I did the last
> syzkaller update, I was already unable to run it. I am primarily
> interested in running syzkaller on real hardware, and if nobody is using
> and maintaining the selftest we might as well remove it.
>
> @Ovidiu Panait, as the initial author, are you still interested in the
> syzkaller selftest?
>

Its not run as part of CI and acceptance criteria because selftests do not
pass. However, I am wlling to accept fixes for selftests and
if they can be a subset which passes we can think of adding it to regular
CI check.

>
> Kind regards,
>
> Stefan
>
> [1]
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/lib/oeqa/se=
lftest/cases/syzkaller.py?id=3Dcfac82c560e514333ebb1de772778554d1aca49c
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126360):
> https://lists.openembedded.org/g/openembedded-devel/message/126360
> Mute This Topic: https://lists.openembedded.org/mt/118570174/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000020b86f064f80f3b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15,=
 2026 at 7:22=E2=80=AFAM Stefan Wiehler via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;me=3D<a href=3D"mailto:sephalon.n=
et@lists.openembedded.org">sephalon.net@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Either I=
 am missing something or it isn&#39;t needed in the build time and<br>
&gt; should maybe be a RRECOMMENDS:${PN}?<br>
&gt; <br>
&gt; Signed-off-by: Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail=
.com" target=3D"_blank">michalwsieron@gmail.com</a>&gt;<br>
&gt; Cc: Stefan Wiehler &lt;<a href=3D"mailto:me@sephalon.net" target=3D"_b=
lank">me@sephalon.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-test/syzkaller/<a href=3D"http://syzkaller_git.b=
b" rel=3D"noreferrer" target=3D"_blank">syzkaller_git.bb</a> | 4 ----<br>
&gt;=C2=A0 1 file changed, 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-test/syzkaller/<a href=3D"http://syzkalle=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">syzkaller_git.bb</a> b/meta-=
oe/recipes-test/syzkaller/<a href=3D"http://syzkaller_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">syzkaller_git.bb</a><br>
&gt; index e35a8a77be..bdd4cf6a40 100644<br>
&gt; --- a/meta-oe/recipes-test/syzkaller/<a href=3D"http://syzkaller_git.b=
b" rel=3D"noreferrer" target=3D"_blank">syzkaller_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-test/syzkaller/<a href=3D"http://syzkaller_git.b=
b" rel=3D"noreferrer" target=3D"_blank">syzkaller_git.bb</a><br>
&gt; @@ -6,8 +6,6 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/LICENSE;md5=
=3D5335066555b14d832335aa4660d6c376&quot;<br>
&gt;=C2=A0 require ${BPN}-licenses.inc<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS:class-native +=3D &quot;qemu-system-native&quot;<br>
&gt; -<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://${GO_IMPORT};protocol=3Dhttps;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX};branch=3Dmaster&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;22ec1469fe8c0ba256de07e8f97fa7b375b522bd&quot;<=
br>
&gt;=C2=A0 require ${BPN}-go-mods.inc<br>
&gt; @@ -39,8 +37,6 @@ GOBUILDFLAGS:remove =3D &quot;-buildmode=3Dpie&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LDFLAGS:append:class-target =3D &quot;${@bb.utils.contains_any(&=
quot;TC_CXX_RUNTIME&quot;, &quot;llvm android&quot;, &quot; -lc++&quot;, &q=
uot; -lstdc++&quot;, d)}&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS:class-native +=3D &quot;qemu-system-native&quot;<br>
&gt; -<br>
&gt;=C2=A0 compile_native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export HOSTOS=3D&quot;${GOHOSTOS}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export HOSTARCH=3D&quot;${GOHOSTARCH}&quot;<br>
&gt; <br>
<br>
I see this has already been merged, but QEMU is actually required for<br>
the syzkaller selftest, which is only documented in the respective<br>
commit message [1].<br>
<br>
However, I am not sure if the selftest is still maintained; it has not<br>
seen any changes since its introduction in 2022 and when I did the last<br>
syzkaller update, I was already unable to run it. I am primarily<br>
interested in running syzkaller on real hardware, and if nobody is using<br=
>
and maintaining the selftest we might as well remove it.<br>
<br>
@Ovidiu Panait, as the initial author, are you still interested in the<br>
syzkaller selftest?<br></blockquote><div><br></div><div>Its not run as part=
 of CI and acceptance criteria because selftests do not pass. However, I am=
 wlling to accept fixes for selftests=C2=A0and</div><div>if they can be a s=
ubset which passes we can think of adding it to regular CI check.=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
<br>
Stefan<br>
<br>
[1] <a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-o=
e/lib/oeqa/selftest/cases/syzkaller.py?id=3Dcfac82c560e514333ebb1de77277855=
4d1aca49c" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.or=
g/meta-openembedded/commit/meta-oe/lib/oeqa/selftest/cases/syzkaller.py?id=
=3Dcfac82c560e514333ebb1de772778554d1aca49c</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126360): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126360" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126360</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118570174/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118570174/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000020b86f064f80f3b9--

