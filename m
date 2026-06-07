Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E415CD8C90
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 20:58:32 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40664.1780865906039602657
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 13:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QK3FFLta;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6607048fa62so3498572d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 13:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780865905; cv=none;
        d=google.com; s=arc-20240605;
        b=cAj7WG91tRPlvmtBq1leJbgOiGSOZk9sMuX3Qk142NJHp95IQme2WH64BnHsubKecr
         4Et4VGcJZJfJIs6D/xJ4Y7nkauuaF3pC3+MJBriMEQOFBGQ909hVJvV9m3SZVJlLg9fP
         BZP+a1hl4xgWB0zh7j3FV5hezoOQ7UG7n5wZxbuw2idQwZWOVtmEA5pP+aI3BVNl61gf
         yYX5xbmdDgXsp02eiCT7sEkJNP/tX/fGHz6MHm6ssqykT4fkCQA31vpAjTy+GAFK6Ysp
         TK0jVfmTW+8XS+KK+2oFy8ANWHL+6muf2+Me5N8g8HMP7p1zhub1r5KE85lfYBx/SubO
         xonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tkCyO4poZaUbLGigmm4qsDq469MAcJTGewbcVi6hgHU=;
        fh=h0bScLfMRXRQ+BStGprxJ2c2f7h00VTMaKqHpcNQi8Y=;
        b=b88XUYCK6em/O+3WU+HSKn7g+dcaH8YLNS7F2uJ5Q8hQF9/tHuVdBnCvNTNHYaR8Oj
         hGT2EvY4BIPkQ0sbiWwuz9os2z1vyLJqqf/Yh+AqGzfoftB6/Q2nemHDWqtxsySpEkCa
         iiRFuoN1C6J1eLC60WdEsPaGdtAPiEZxqIK/sSSATHtEkUE3rNcqFzrnFAMeECctYtiS
         nzBu8ggSp/YO6XGPQ6PxR9S8XVBwBqJ77HIGmmPtl5fpJMjZ7g24W5hJS/ofA7Y859ss
         3MiMi6udSCooPQx3CBVisxpCA0+HpgmDo4L0SbqtVEv9Cjpy4HNCJBbmnp+3X5OjA0Gy
         eHFg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780865905; x=1781470705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tkCyO4poZaUbLGigmm4qsDq469MAcJTGewbcVi6hgHU=;
        b=QK3FFLtabSFEz47KfYxeMzhJ4xEc0RMpwfDoyXUKNTeHJJleILLEXmF6BYRUawMtX2
         baHtTqyWmIm0fJZ1GxKqmPzibWb8chZndJKmpJf5KX09PhtspBO6UUKDYQLAKBerorfc
         nMI0UpQ1kWRGnu/e2QV53xh2nfjV+8F0RsFz0lV4nIlfTiivMeoXnGeiPQHq6wYinXVr
         oF1OntJrTysToGmHEg02w3xquZP4fIjsVabFY+ho25+nRQnL8URMXB5ciLWYyuo8msI8
         POtKnNQjQnIiZJxeIaFJNlT8iDK7lLbkArOf8LoeCuddiMUtKg+bN6QOC8OWUNohVHer
         cE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780865905; x=1781470705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkCyO4poZaUbLGigmm4qsDq469MAcJTGewbcVi6hgHU=;
        b=s2lasHkJn57Kpo5dJZVSw+/yya0RCzKE6l673mLo1Th9C6nraccc7xMrbXf9HiZiE8
         Jk6fZYrrvdeRomekcZQ8nRPifpJIN9VCxCvTQrTVBmCXQeOrPp2j65NWenA1YHWop4XH
         RyMyjrZTrDah6sC65UMD76wsZ+qqJH2HRy+pz8GytUmvDJhJ46ikYMtvnNYyzHpqiq3m
         OjqZ6DgkZCbdira9SHsuTnVw6xGwXrjNsNbVb9O9nbUctFZPY22Y+oC6OUASNiv2mXbQ
         /zIyxC0i0cYugEnafnRNtX3hkpDwVcbv0t860WExse36sgEAZ2PixqXjh1Ai+FtGDeK8
         uUrg==
X-Forwarded-Encrypted: i=1; AFNElJ/doAoPNXIPFjWnfPZvEDJyb1H7jlhCiAHN9CmTI3CUUpNhH1FxeTRzf5pBwib3hV1j54KbBNXi8vat7UOjMgGu8V4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLfUsX07EMfvHSJLRsNmsqNXrnPI9dMkyNcS2sP67pAnirnsm/
	CDLWF4L2GVF3pTkoHZ/28S9qn9sIjIMZtCGHg1vDZUtUILy92NdB7ppQWf6is8DX/yMNXV3dm+6
	CChS0klkXxdY3xCTLxk5peWpPzJtX/3Y=
X-Gm-Gg: Acq92OE25qZmKEvrYwW8b1RpNQ1AhmUrtT26nOmZE6KLvtnWKWhxolCiZmZP1X08mDK
	BfAW3RPOUisMr474XDVKqLepkJNB2srMHBDwagWDvGOpn1I/79rUFL/TGyTU/lveK0xsvvJG06m
	+vjXeojwtjz9z9pzxqdFNfhikj2aNmVXkob+VhN90gsuQXNEARQ49xQQ8oLQvpUOY5sA7+D/CUb
	AbENVR7oQAeV/+UdwRcKSH92MLhpMIu3yxujDAls+qm3vUdMhCFJrue85IgGo7B+NOVsExLOfoJ
	YKo+paNVk0nzuSmlglaTInUnnXLueicB2nU/JAaDP1q1tvw0Fj7vYNU0LkiUpKlzTud+Hu0AyNF
	p20Nj2cEdcNffvRrsShKTB3+SLmrZRnyd0MM5jdcYAX0fio3zth2MRQ/y63tKULAB3lId9Ah/la
	gqE9OWM3BC+Kd08Jo=
X-Received: by 2002:a05:690e:4012:b0:65e:4b1d:c694 with SMTP id
 956f58d0204a3-66107038fa1mr10889913d50.45.1780865904965; Sun, 07 Jun 2026
 13:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260530073155.1588404-1-f_l_k@t-online.de> <b1e3711a-d31d-43e2-b14e-fa437fa74ef2@ti.com>
In-Reply-To: <b1e3711a-d31d-43e2-b14e-fa437fa74ef2@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 13:57:59 -0700
X-Gm-Features: AVVi8Cf11WMDdqkhz1xl6hnm5UZO4IdVkIaOw_-Cj-AotUPxk36xziwGnj75h8A
Message-ID: <CAMKF1so+NT7m33qQq6ihr7F62Cu57RZK2Te3pCQi0R3rp5UvUg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libcamera: add workaround to fix build with
 gcc 16
To: reatmon@ti.com
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a87b1e0653b02772"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 20:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127412

--000000000000a87b1e0653b02772
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

there is a report on libcamera with similar problem see

https://lists.libcamera.org/pipermail/libcamera-devel/2026-January/057081.h=
tml

however, no resolution, Would be good to ping that thread as well.

On Tue, Jun 2, 2026 at 8:16=E2=80=AFAM Ryan Eatmon via lists.openembedded.o=
rg
<reatmon=3Dti.com@lists.openembedded.org> wrote:

>
> Not sure if the maintainers want to go in this direction but I've tested
> this patch and it fixes the build issue.
>
> Tested-by: Ryan Eatmon <reatmon@ti.com>
>
>
> On 5/30/2026 2:31 AM, Markus Volk via lists.openembedded.org wrote:
> > libcamera fails if using gcc16 with -Werror=3Darray-bounds=3D
> >
> > Ignore this issue for now until it is properly fixed
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >   meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 +=
+
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.7.1.bb b/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.7.1.bb
> > index 74cb910417..9be439fdf1 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> > @@ -100,3 +100,5 @@ FILES:${PN}-pycamera =3D
> "${PYTHON_SITEPACKAGES_DIR}/libcamera"
> >   GLIBC_64BIT_TIME_FLAGS =3D ""
> >
> >   INSANE_SKIP +=3D "32bit-time"
> > +
> > +CXXFLAGS +=3D "-Wno-error=3Darray-bounds=3D"
> >
> >
> >
> >
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127361):
> https://lists.openembedded.org/g/openembedded-devel/message/127361
> Mute This Topic: https://lists.openembedded.org/mt/119559335/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a87b1e0653b02772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">there is a report on libcamera with similar problem see<di=
v><br></div><div><a href=3D"https://lists.libcamera.org/pipermail/libcamera=
-devel/2026-January/057081.html">https://lists.libcamera.org/pipermail/libc=
amera-devel/2026-January/057081.html</a></div><div><br></div><div>however, =
no resolution, Would be good to ping that thread as well.</div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Jun 2, 2026 at 8:16=E2=80=AFAM Ryan Eatmon via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;reatmon=3D<a=
 href=3D"mailto:ti.com@lists.openembedded.org">ti.com@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
Not sure if the maintainers want to go in this direction but I&#39;ve teste=
d <br>
this patch and it fixes the build issue.<br>
<br>
Tested-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" target=3D"_bla=
nk">reatmon@ti.com</a>&gt;<br>
<br>
<br>
On 5/30/2026 2:31 AM, Markus Volk via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; libcamera fails if using gcc16 with -Werror=3Darray-bounds=3D<br>
&gt; <br>
&gt; Ignore this issue for now until it is properly fixed<br>
&gt; <br>
&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" ta=
rget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-multimedia/recipes-multimedia/libcamera/<a href=3D"ht=
tp://libcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7=
.1.bb</a> | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"h=
ttp://libcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.=
7.1.bb</a> b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http:/=
/libcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.b=
b</a><br>
&gt; index 74cb910417..9be439fdf1 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://l=
ibcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.bb<=
/a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://l=
ibcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.bb<=
/a><br>
&gt; @@ -100,3 +100,5 @@ FILES:${PN}-pycamera =3D &quot;${PYTHON_SITEPACKAG=
ES_DIR}/libcamera&quot;<br>
&gt;=C2=A0 =C2=A0GLIBC_64BIT_TIME_FLAGS =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0INSANE_SKIP +=3D &quot;32bit-time&quot;<br>
&gt; +<br>
&gt; +CXXFLAGS +=3D &quot;-Wno-error=3Darray-bounds=3D&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127361): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127361" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127361</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119559335/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119559335/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a87b1e0653b02772--

