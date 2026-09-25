Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2600DC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:48:09 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2732.1790354888537323186
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FSwChP35;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-67109935888so1135481d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 09:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790354887; cv=none;
        d=google.com; s=arc-20260327;
        b=WPjryuk6hn++hZG8xlNlOt/qQa/ap8YuVLktbuB8otTUSXJUTqsjpbxUPIVqn2tA4Q
         ezcB502jko+hI/Lo5KatSzsqeYCY5aKqOLpzQrIyzxIkJCAHMZ/li4rZPC8T8L/uneRD
         UnsYEyS6jMNpbj+0JJGx1/BJnzjU/unNgV8wg57fvRYgzhRd9X3HVqDhiwq3iH4S5PhE
         92rjqJ10RIpQUZ94ULx1p2DkMFROC25moFuQ3ELejy8VVY24yvUsg4x6woDm1oco56jb
         +pPensH2l4/8N3Zuizqn/Hsf6HUQKXc3m9W0wzJn2rV5UJ8lVWLyk/+zT056sdLoSDn5
         QHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6xy/RZ2g/WzyUmFovcV1uo4Lgd5ChI/CXhOKps8fv/E=;
        fh=eMqI8uCJtuyEwtccF729/SYv4V0AXl0B/fbxDJiHcyg=;
        b=jkd1J5ztFH9iOM9gU4DFeI46GZMp2c/aoFy3Rg+S/MWL+sHORCAFNIgcfRblh9VvDB
         0KL9foKOnRYyatlpjXamXgQzAPf/7pbWlle+QyJpzgy0lH70ZNMlioVm5x2lduKdWXeK
         r6LHgxr04FxC2aodcgGekxp70N6HX0F2g5JWRwzyGn0VRc0MqV8gl3xNoykpr4PgGo6K
         700GRkg0DDY2Gq/qkTOwwKtXig2Q+QXolChwTtluib34YD/Dw9C81YXDunppleUTuhCP
         lKmfv8wvGr+MEzyCM7Pl89emhqKSpH64w+TVg+YtJLbMuKnULO97nc3sjGv+tG/g3sAl
         dezQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354887; x=1790959687; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xy/RZ2g/WzyUmFovcV1uo4Lgd5ChI/CXhOKps8fv/E=;
        b=FSwChP352SqvtNk9vW5K+8jtDCYrmQpZt7Ruer1NafIoEtG71zrqT/aO1FhZtFL9ZZ
         sZkhfKYIyg2gcrKvbIrYPFciK1R1bIR8lnTAarD8E5oV3tYy2KKaNYKMNej2hhOgBIZE
         puLViiZZj3VO7VqxBYV0wz+sHnwaUL9x5Jyzk7vc6tdNF7TIj8cBjMUODY+I6wan1H5k
         Lc+T8lOlPVEDsw3/jyZ1qVpT2dSEJFfsxwzR/v1uoW4j1t1ndFgSoTBpuFezZsrZm0At
         0lPx8ndojbgcyvNaEBCmQPQd7HINk1JlNfkOj8VKYqcUYD+bMznQUz1Egmidik57cZs7
         MmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354887; x=1790959687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6xy/RZ2g/WzyUmFovcV1uo4Lgd5ChI/CXhOKps8fv/E=;
        b=WxF+m1knX7fKoSjjMhVzftxugS8NpQM6vbsB58V/RdTB7JuR1Uzdgt5cUvn/OeL6Ak
         f+LdTLG3TBzR61H7y3i8BI12lrUb8ax8/0uGhWX/jDEA0yzTreMWZ2eL2ooTrLRQ5Gag
         AGeVqLwU7kwHmFqmn55w5J9yd/hHz/1EvfY8+ddEqxX8XYcGCC7NPy32ewtI0ao5eppa
         rlhsTbFDDwUv32wIRKkh654R00yy8NeiHAF8uLGaY9o+8ueENT4sztsEOOk1bPx2bu0S
         0IcHQeztJrsmustZOIgLySbVhoN7v+cQBKo5krWB56BfedHqWXMFZJbIR78qbe50xDea
         brmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdMhchrY8sVgRkHUUHGye7NSphPfuHMpgEbNtvwkrx6yz1kLTbmTeGLrK7zx07fTlQuPQw8TH+NpAf3jtw1eK8Qrs=@lists.openembedded.org
X-Gm-Message-State: AFuF++kd3nk26LAAfYgh1ccvcWzIrPd5ck8kIuGqiWV9ClO+SsbWo0Mo
	3zps8wTxwtGY50OEJ0pI2UuOlRLAyYQgIyqF1Y7nNT+F30cHkWE6uQiKGSyyUka2mpOFUusY4qv
	zKg2xwrqTkZCL0DWIpPOQkVyUPqs8t54=
X-Gm-Gg: AYBFou1gg7M6CqzrtF13aIrbxIh56hqRczf/Ih5kAY2UdzNtLfKPUmknMyzr4te1bQO
	oP3WjZVl+1t7qDkdXDaV9XHlhqCJKD2qHi9r/JF6lLhabV2tklp7XVn1FwJaPJ89qQ1k5oeIa1k
	oesWIfmgO8a89up7lMdpOTyM6+3Dj0Qs31nB+qe9/PzkKxk+9ucaX8Tj75JZy2tgkuB2UMkik4u
	laWvngApC5rlUBv1saQYrI+yJH6gFr4ml2p/y0NHv4xXduZl98mW5kHG7BBfQclXmLm5bXnuZiZ
	T0m8P5o89R1QiagAWgGZgZ0F+AnE63irh/W1wcwNy8EzRNL5dntvDz3qHe6O6DOsAttVeeDszJs
	83qG/3y6udBxZaMw/Yn5AmucX1N27eW+s6AoDDA9Jg3D9rVj20Tu2p5fEwvu0+DPGzZZvsCNafO
	tOKJE8HtY8qm+KcKjMqiUe0yC4zbtm+49TXiz64JZ5nLgSFjejIy7gPMXYo/RKTpVZAAJotSDWO
	3MsrvEzDDS5l2jcofSodKdhXl6R419P1QnPmD9BhAEWIumn8tem11B4m3gWH4QuOy0pad8e0De/
	QR6AXIw=
X-Received: by 2002:a05:690e:bc8:b0:674:1c92:4e1d with SMTP id
 956f58d0204a3-6741c926319mr496439d50.101.1790354887296; Fri, 25 Sep 2026
 09:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260924125848.526537-1-leon.anavi@konsulko.com>
 <20260924125848.526537-2-leon.anavi@konsulko.com> <CADySD0HVsCvbEJQs8K3i9hVCDMsMEkacWSQVezF5EKVxV1=zxw@mail.gmail.com>
 <d0902746-e356-4df2-8e3c-a14d26a5ba02@konsulko.com>
In-Reply-To: <d0902746-e356-4df2-8e3c-a14d26a5ba02@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Sep 2026 09:47:40 -0700
X-Gm-Features: AclHuK9T9ZHo-cSMFlqjYsq3u_KhmZX6j4WqMQJJbJgEMWuGmF1PCAzDSScUmns
Message-ID: <CAMKF1sqbYyBQ=5ijC=SimfzELG_Wj0c+3zhayykTViuA6XGiiA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pydantic: Upgrade 2.13.4 -> 2.13.5
To: leon.anavi@konsulko.com
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000144b7b065c517be4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 16:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130308

--000000000000144b7b065c517be4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:32=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Hi Ankur,
>
> On 9/25/26 05:41, Ankur Tyagi wrote:
> > On Fri, Sep 25, 2026 at 12:58=E2=80=AFAM Leon Anavi via lists.openembed=
ded.org
> > <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >> Upgrade to release 2.13.5:
> >>
> >> - Allow reuse of validators when plugins are set
> >> - Fix missing GC traversal on some pydantic-core struct fields
> >> - Fix missing GC traversal in pydantic-core for
> >>    GeneralFieldsSerializer
> >> - Count validated model fields once in smart unions
> >>
> >> This work was sponsored by GOVCERT.LU.
> >>
> >> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >> ---
> >>   .../{python3-pydantic_2.13.4.bb =3D> python3-pydantic_2.13.5.bb}  | =
2
> +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>   rename meta-python/recipes-devtools/python/{
> python3-pydantic_2.13.4.bb =3D> python3-pydantic_2.13.5.bb} (98%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic_2.13.4.bb b/meta-python/recipes-devtools/python/
> python3-pydantic_2.13.5.bb
> >> similarity index 98%
> >> rename from meta-python/recipes-devtools/python/
> python3-pydantic_2.13.4.bb
> >> rename to meta-python/recipes-devtools/python/
> python3-pydantic_2.13.5.bb
> >> index 17a6941d14..7c5dcdcb26 100644
> >> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> >> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D09280955509d1c4ca14bae02f21d49a6"
> >>
> >>   inherit python_hatchling ptest-python-pytest
> >>
> >> -SRCREV =3D "cf67d4b3193c3fe43ede18612ed62785eee11382"
> >> +SRCREV =3D "001dea020e0809844e5b17666432c9135a976f46"
> >>   PV .=3D "+git"
> > no need to set PV
>
> OK, thank you for the code review. I removed it.
>
> >
> >>   SRC_URI =3D "git://
> github.com/pydantic/pydantic;protocol=3Dhttps;branch=3Dv2.13-fixes"
> > can please include tag=3Dv${PV} in the SRC_URI
>
> OK, but in this case with oe.utils.trim_version.
>
> I have just sent v2 of the patch.
>

I accepted v1, please send new patch with diff between v1 and v2


>
> Best regards, Leon
>
> >
> >>   DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
> >> --
> >> 2.47.3
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130307):
> https://lists.openembedded.org/g/openembedded-devel/message/130307
> Mute This Topic: https://lists.openembedded.org/mt/121408815/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000144b7b065c517be4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25,=
 2026 at 9:32=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsul=
ko.com@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ankur,=
<br>
<br>
On 9/25/26 05:41, Ankur Tyagi wrote:<br>
&gt; On Fri, Sep 25, 2026 at 12:58=E2=80=AFAM Leon Anavi via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org=
" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; Upgrade to release 2.13.5:<br>
&gt;&gt;<br>
&gt;&gt; - Allow reuse of validators when plugins are set<br>
&gt;&gt; - Fix missing GC traversal on some pydantic-core struct fields<br>
&gt;&gt; - Fix missing GC traversal in pydantic-core for<br>
&gt;&gt;=C2=A0 =C2=A0 GeneralFieldsSerializer<br>
&gt;&gt; - Count validated model fields once in smart unions<br>
&gt;&gt;<br>
&gt;&gt; This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"no=
referrer" target=3D"_blank">GOVCERT.LU</a>.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulk=
o.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../{<a href=3D"http://python3-pydantic_2.13.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pydantic_2.13.4.bb</a> =3D&gt; <a=
 href=3D"http://python3-pydantic_2.13.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pydantic_2.13.5.bb</a>}=C2=A0 | 2 +-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 =C2=A0rename meta-python/recipes-devtools/python/{<a href=3D=
"http://python3-pydantic_2.13.4.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-pydantic_2.13.4.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2.1=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.13.5.bb</a>=
} (98%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-pydantic_2.13.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-p=
ydantic_2.13.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-pydantic_2.13.5.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pydantic_2.13.5.bb</a><br>
&gt;&gt; similarity index 98%<br>
&gt;&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://=
python3-pydantic_2.13.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-py=
dantic_2.13.4.bb</a><br>
&gt;&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pydantic_2.13.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyda=
ntic_2.13.5.bb</a><br>
&gt;&gt; index 17a6941d14..7c5dcdcb26 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pydantic_2.13.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic=
_2.13.4.bb</a><br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pydantic_2.13.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic=
_2.13.5.bb</a><br>
&gt;&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D=
09280955509d1c4ca14bae02f21d49a6&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0inherit python_hatchling ptest-python-pytest<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV =3D &quot;cf67d4b3193c3fe43ede18612ed62785eee11382&quot;<b=
r>
&gt;&gt; +SRCREV =3D &quot;001dea020e0809844e5b17666432c9135a976f46&quot;<b=
r>
&gt;&gt;=C2=A0 =C2=A0PV .=3D &quot;+git&quot;<br>
&gt; no need to set PV<br>
<br>
OK, thank you for the code review. I removed it.<br>
<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/p=
ydantic/pydantic;protocol=3Dhttps;branch=3Dv2.13-fixes" rel=3D"noreferrer" =
target=3D"_blank">github.com/pydantic/pydantic;protocol=3Dhttps;branch=3Dv2=
.13-fixes</a>&quot;<br>
&gt; can please include tag=3Dv${PV} in the SRC_URI<br>
<br>
OK, but in this case with oe.utils.trim_version.<br>
<br>
I have just sent v2 of the patch.<br></blockquote><div><br></div><div>I acc=
epted v1, please send new patch with diff between v1 and v2</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards, Leon<br>
<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;python3-hatch-fancy-pypi-readme-nat=
ive&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.47.3<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130307): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130307" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130307</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121408815/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121408815/1997914</a><br>
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

--000000000000144b7b065c517be4--

