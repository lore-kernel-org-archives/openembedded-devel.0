Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BFDC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 15:16:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.17108.1716995802672875425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 08:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9GQWXAm;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ae14e78e5so918165e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716995801; x=1717600601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nwePnrd6OEImCCZeCZ28Ww9ZDz9lRlJmDAdka6lrH4U=;
        b=g9GQWXAm0lZA3mjEgIgItRMCjbdj1yUThA+mvU9fq98eiLz65cv47rx/GmivBolY/X
         HpCDQcA2IL8AugPLwEcHEStn0rHCbF24uJKszWNhEtk29qlTTHwxhOmurBxHaQdWhQqA
         6m8oUYb1SJb8GJdd3Kky/vv+5Occ7hvaGjNr+ujwEqFCyz1Zd0JFFMIAgZXrb0EuFtMw
         9Ca1rr1N+AeDCfkx7fpGvjkT4wpf8l8ZMtqqFmJZoV105O2qQar4q5e0+ZzQNRlpv1g9
         BhKrCH1NdGnJgMT6u4BuJReUJDLSiw3z7lgPHG11Z4mb+ptxDv4dnjDnY9oYw1TzNPvM
         000A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995801; x=1717600601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwePnrd6OEImCCZeCZ28Ww9ZDz9lRlJmDAdka6lrH4U=;
        b=qaVBh6pJvVjbRLb7a0lwbCb/W78jSTfyQy8z1yJD0gbjeU3SQOAADc0kjSCKB7OTzZ
         hd+bdzU5ITGL/RMoL2DmhrtTSb99OJG86vKvSbKk3hz/+9kSbd9PTb+p6DxrJ+TRgXUq
         tcfia5Rt7Xgvam34qwTDrdxJzuArh11cvEtSzy51a7fRAh4tRo54pkkpEgAaXGSY2uyu
         vY6CvxxNlR2ykRgh9HBdvLWddguSot+nbj8Gli9DIMWzmjM76j3NJX9amDMWQ3woVwkn
         gMLy471TfsCoLUTRPvPsOUkm1o4XB6F7rU5982D5dmlzXoiFONnNm8g2FJzU1Hu96v7U
         BgFg==
X-Gm-Message-State: AOJu0YyxdzxpHOTnghXror305nTQOdgA8/WilZ/C3+XIqQ16xo6LK4qH
	5ci2T69eSH9GRwVBNJ+sOer9ubi7Ie8nEpCZlWHELrslBwnn69/zVXKqpKIu1aXKJVerAtE22P7
	gTe46VU/1lu23QfkMLmK+sQO5tJwugg==
X-Google-Smtp-Source: AGHT+IGrpAvvIlia3I8LpvWlbpvvCM4H81KHkGwkZ/5TuiaWECPMv5UHBUfPYVZPsQEz/c5UwCGOxrPydcSQtfaAees=
X-Received: by 2002:a19:760e:0:b0:529:b644:9b4e with SMTP id
 2adb3069b0e04-529b6449d1cmr4010412e87.66.1716995800147; Wed, 29 May 2024
 08:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240528095659.4123056-1-mingli.yu@windriver.com>
In-Reply-To: <20240528095659.4123056-1-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 29 May 2024 08:16:25 -0700
Message-ID: <CANx9H-BYs2hEx0FZorOfjHSq7qFZjCtZUU1Upnyw_BiJyNJmDg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add new recipe
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bfb1820619993cf2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 15:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110615

--000000000000bfb1820619993cf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 2:57=E2=80=AFAM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Dasbus is a DBus library written in Python 3, based on GLib
> and inspired by pydbus.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../recipes-devtools/python/python3-dasbus_1.7.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-dasbus_1.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> new file mode 100644
> index 000000000..c07464210
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Dasbus is a DBus library written in Python 3, based on GLib
> and inspired by pydbus."
> +HOMEPAGE =3D "https://dasbus.readthedocs.io"
> +SECTION =3D "devel"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
> +
> +SRC_URI =3D "git://
> github.com/dasbus-project/dasbus.git;protocol=3Dhttps;branch=3Dmaster \
> +"
> +SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3


This should inherit python_hatchling since a proper pyproject.toml is
provided
https://github.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6dc97d=
12f4462f8d4/pyproject.toml#L7


> +
> +RDEPENDS:${PN} =3D "python3-pygobject"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110580):
> https://lists.openembedded.org/g/openembedded-devel/message/110580
> Mute This Topic: https://lists.openembedded.org/mt/106345708/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bfb1820619993cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 28, 2024 at 2:57=E2=80=AFAM Yu, Mingli via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;mingli=
.yu=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded.org">eng.windr=
iver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_b=
lank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Dasbus is a DBus library written in Python 3, based on GLib<br>
and inspired by pydbus.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-dasbus_1.7.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-dasbus_1.7.bb</a> | 15 +++++++=
++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-dasbus_1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-das=
bus_1.7.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dasbus_1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-dasbus_1.7.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dasbus_1=
.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-dasbus_1.7.bb</a><br>
new file mode 100644<br>
index 000000000..c07464210<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dasbus_=
1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-dasbus_1.7.bb</a><br>
@@ -0,0 +1,15 @@<br>
+SUMMARY =3D &quot;Dasbus is a DBus library written in Python 3, based on G=
Lib and inspired by pydbus.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://dasbus.readthedocs.io" rel=3D"norefe=
rrer" target=3D"_blank">https://dasbus.readthedocs.io</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75=
310742&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/dasbus-project/dasbus=
.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>github.com/dasbus-project/dasbus.git;protocol=3Dhttps;branch=3Dmaster</a> =
\<br>
+&quot;<br>
+SRCREV =3D &quot;413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit setuptools3</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">This should inherit python_hatchling since a proper pyproject.toml is p=
rovided=C2=A0</div><div dir=3D"auto"><div><a href=3D"https://github.com/das=
bus-project/dasbus/blob/be51b94b083bad6fa0716ad6dc97d12f4462f8d4/pyproject.=
toml#L7">https://github.com/dasbus-project/dasbus/blob/be51b94b083bad6fa071=
6ad6dc97d12f4462f8d4/pyproject.toml#L7</a></div></div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)" dir=3D"auto"><br>
+<br>
+RDEPENDS:${PN} =3D &quot;python3-pygobject&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110580): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110580" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110580</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106345708/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106345708/924729</a><br>
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

--000000000000bfb1820619993cf2--

