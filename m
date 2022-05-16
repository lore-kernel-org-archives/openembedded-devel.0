Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A87EC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 18:08:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.985.1652724503417101928
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 11:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wDtRyr9i;
 spf=pass (domain: linaro.org, ip: 209.85.218.53,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id tk15so6727078ejc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbIoSVI3Ce7uvli2TJ9h9fLfRzFgWLDquM1Bmq/LX0Y=;
        b=wDtRyr9i108Jp034hEoJIiQQuTOXNEdq6S7MmjLmG4UC6X89Sr6jwPJA8qeJzetDdP
         s/T0sYNokPjPTKq5qJh28yDSFY9dxRsl2HDfoqXl/5KQWr/+iXQviJ0NDiDSW/qe2/C9
         UlwNid0u+R9AW6EIul+FII7qv58stfXbBdnoN4OjkqXqQJV/ZGR231L3H2JZ8PP7jGaT
         HYBLg2qgl78bohhZfvP4H0RtO53zUHe9RwKHkF5ldNVPNwBWMdoki4XRm4MSMJKXtXxl
         kzLnkeLuTgExbQ9PXIHL7awQddTKQstXWkUWJR75sEZRxb0mQ8MNVdISmXn+1ASfyO5+
         kR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbIoSVI3Ce7uvli2TJ9h9fLfRzFgWLDquM1Bmq/LX0Y=;
        b=nK34gKejG/VFx4tWZxp6hn8CeaJU6X+gdAhYUKMZghmdjNznx1t5krtOmSpgT6Macw
         glOdWfs0GxkdN7x7XTM6sgFSVp5gPgWX2UsnEXuVfVOYHnddaNsA16fMFdFjamVFOty1
         7+dQudIPZ3OECSsBPjG0a1r8zob8L2q03vYKlAJnIS0tn0/QXeuIK6OEKkEZAm7sm7g1
         myHf1Ju+jK8GQ5f55qKiozPG+k1kbDaytldmnCf6OiBfr3BaBRSQuv7ruMuoeVh0L8SL
         S6nVSTGe22SXId1hbxDUa7RQI31EusjotkPQBHXZGGTRoYG0qJdvHMyesDgaNI4dL2EO
         8wWg==
X-Gm-Message-State: AOAM533VIXD7rYppUzK3pgBgBjgRJ3lgAqmAmLamX073evX3HUuO5pIb
	AMhkQhzXFfK4Vfpsk959ilaz9UodI5oJneUetCbaKw==
X-Google-Smtp-Source: 
 ABdhPJzFZ1n5WKKEQTGpTRNy5mZDC5xLLfCDOwergtPe4ux/p7Vei7NN+nfqfymbA0MaPpipK054/xD0Z4GIo4BffM0=
X-Received: by 2002:a17:907:7244:b0:6f4:b93e:58a6 with SMTP id
 ds4-20020a170907724400b006f4b93e58a6mr15931877ejc.543.1652724501815; Mon, 16
 May 2022 11:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220510092824.2033312-1-nicolas.dechesne@linaro.org>
 <796b97a3-27d8-7c87-19fb-0ad96540028b@pr.hu>
 <a9997892-f4e1-cfcd-1a68-df3312d9a1d7@gmail.com>
 <CAP71WjxRyDy4kOVydX7rfLxrw63jKOp+DEg1KF+VegrogOCX=g@mail.gmail.com>
 <CAMKF1sqD3n-Wf4WiBjbRBaF65Tc7v_yox6s06Fi7mXRAHchwCg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqD3n-Wf4WiBjbRBaF65Tc7v_yox6s06Fi7mXRAHchwCg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 16 May 2022 20:08:10 +0200
Message-ID: 
 <CAP71Wjy0-D=JrEXvQBU-Tt7HOEd76ABWMEQQZNb8T9DVuvCDjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] imlib2: update SRC_URI
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, zboszor@pr.hu
Content-Type: multipart/alternative; boundary="000000000000d7baea05df24e8fb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 18:08:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97144

--000000000000d7baea05df24e8fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 7:59 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Mon, May 16, 2022 at 10:45 AM Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>
>>
>>
>> On Mon, May 16, 2022 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>>
>>>
>>> On 5/16/22 8:28 AM, Zoltan Boszormenyi via lists.openembedded.org wrote=
:
>>> > 2022. 05. 10. 11:28 keltez=C3=A9ssel, Nicolas Dechesne =C3=ADrta:
>>> >> The upstream repo location has changed, it's now
>>> >> https://git.enlightenment.org/old/legacy-imlib2
>>> >
>>> > This hits every branch in meta-openembedded, not only master.
>>> >
>>>
>>> A different patch fixing same thing is already in master.
>>>
>>
>> This is the merged patch, e.g.
>> 62becef1091d (imlib2: update SRC_URI)
>>
>> Not sure what you meant.
>>
>
>
> I had the thread broken I should have said this patch is upstream in
> master already if needed send backport request for respective release
> branches
>

ok, done for honister and kirkstone


> And yes, it's needed in all branches. Do you want/need a patch for this,
>> or can you backport/apply directly?
>>
>>>
>>> >>
>>> >> It's not clear when or why it happened, but the the commit hash we u=
se
>>> >> in SRCREV exists in the 'new' location, so let's at least update the
>>> >> SRC_URI for now, and fix this warning:
>>> >>
>>> >> WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL
>>> >> git://
>>> git.enlightenment.org/legacy/imlib2.git;protocol=3Dhttps;branch=3Dmaste=
r,
>>> >> attempting MIRRORS if available
>>> >>
>>> >> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>>> >> ---
>>> >>   meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
>>> >>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> >>
>>> >> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>> >> b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>> >> index 56d41cd39..869f8123d 100644
>>> >> --- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>> >> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>> >> @@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package
>>> >>   AUTO_LIBNAME_PKGS =3D ""
>>> >> -SRC_URI =3D
>>> >> "git://
>>> git.enlightenment.org/legacy/${BPN}.git;protocol=3Dhttps;branch=3Dmaste=
r
>>> <http://git.enlightenment.org/legacy/$%7BBPN%7D.git;protocol=3Dhttps;br=
anch=3Dmaster>"
>>>
>>> >>
>>> >> +SRC_URI =3D
>>> >> "git://
>>> git.enlightenment.org/old/legacy-${BPN}.git;protocol=3Dhttps;branch=3Dm=
aster
>>> <http://git.enlightenment.org/old/legacy-$%7BBPN%7D.git;protocol=3Dhttp=
s;branch=3Dmaster>"
>>>
>>> >>
>>> >>   S =3D "${WORKDIR}/git"
>>> >>   PACKAGECONFIG ??=3D "jpeg png zlib
>>> >> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>>> >>
>>> >>
>>> >>
>>> >>
>>> >>
>>> >
>>> >
>>> >
>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> > Links: You receive all messages sent to this group.
>>> > View/Reply Online (#97134):
>>> https://lists.openembedded.org/g/openembedded-devel/message/97134
>>> > Mute This Topic: https://lists.openembedded.org/mt/91008939/1997914
>>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
>>> [raj.khem@gmail.com]
>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >
>>>
>>

--000000000000d7baea05df24e8fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 16, 2022 at 7:59 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, May 16, 2022 at 10:45 AM Nicolas Dechesne &lt;<a href=3D"mailto:=
nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 16, 2022 at 6:09 PM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
On 5/16/22 8:28 AM, Zoltan Boszormenyi via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; 2022. 05. 10. 11:28 keltez=C3=A9ssel, Nicolas Dechesne =C3=ADrta:<br>
&gt;&gt; The upstream repo location has changed, it&#39;s now<br>
&gt;&gt; <a href=3D"https://git.enlightenment.org/old/legacy-imlib2" rel=3D=
"noreferrer" target=3D"_blank">https://git.enlightenment.org/old/legacy-iml=
ib2</a><br>
&gt; <br>
&gt; This hits every branch in meta-openembedded, not only master.<br>
&gt; <br>
<br>
A different patch fixing same thing is already in master.<br></blockquote><=
div><br></div><div class=3D"gmail_quote">This is the merged patch, e.g.=C2=
=A0</div>62becef1091d (imlib2: update SRC_URI)<br><div>=C2=A0</div><div>Not=
 sure what you meant. </div></div></div></blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I had the thread broken=
 I should have said this patch is upstream in master already if needed send=
 backport request for respective release branches=C2=A0</div></div></div></=
blockquote><div><br></div><div>ok, done for honister and kirkstone</div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"auto">And yes, it&#=
39;s needed in all branches. Do you want/need a patch for=C2=A0this, or can=
 you backport/apply directly?</div></div></div><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s not clear when or why it happened, but the the commit has=
h we use<br>
&gt;&gt; in SRCREV exists in the &#39;new&#39; location, so let&#39;s at le=
ast update the<br>
&gt;&gt; SRC_URI for now, and fix this warning:<br>
&gt;&gt;<br>
&gt;&gt; WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL <br>
&gt;&gt; git://<a href=3D"http://git.enlightenment.org/legacy/imlib2.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.en=
lightenment.org/legacy/imlib2.git;protocol=3Dhttps;branch=3Dmaster</a>, <br=
>
&gt;&gt; attempting MIRRORS if available<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dech=
esne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> | 2 +-<br>
&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://iml=
ib2_git.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> <br>
&gt;&gt; b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; index 56d41cd39..869f8123d 100644<br>
&gt;&gt; --- a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git=
.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git=
.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; @@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package<br>
&gt;&gt; =C2=A0 AUTO_LIBNAME_PKGS =3D &quot;&quot;<br>
&gt;&gt; -SRC_URI =3D <br>
&gt;&gt; &quot;git://<a href=3D"http://git.enlightenment.org/legacy/$%7BBPN=
%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bla=
nk">git.enlightenment.org/legacy/${BPN}.git;protocol=3Dhttps;branch=3Dmaste=
r</a>&quot; <br>
&gt;&gt;<br>
&gt;&gt; +SRC_URI =3D <br>
&gt;&gt; &quot;git://<a href=3D"http://git.enlightenment.org/old/legacy-$%7=
BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">git.enlightenment.org/old/legacy-${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot; <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; =C2=A0 PACKAGECONFIG ??=3D &quot;jpeg png zlib <br>
&gt;&gt; ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, d)}&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97134): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97134" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97134</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91008939=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91008939/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000d7baea05df24e8fb--

