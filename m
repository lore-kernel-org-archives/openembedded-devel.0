Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCDCC982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 18:53:14 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4102.1790016787114587094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 11:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UUrNoZEm;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac929eso2943691d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790016786; cv=none;
        d=google.com; s=arc-20260327;
        b=jSJFJO6l4ESQjjkw7g8agt+MIb5uujrH96/pkbgVdhEt+eHzkLqbA3gTvSYWA4jP1Y
         mA5+RvFUba77I8aAV4hxrdLS8iXmPq95jr8a5RiVJcmMnU7t53M9UhSDbLOKLwpZ30V4
         lz/7rRDf2WXBJI+nZMHEn7jgi/Ayf+XCDzpod0SgCC31OmPeMX0aYlAK/VP+7u8+SotV
         rpKUP9xC1zzxrP0PVAkvKDQ+762kl2nh8/+rme8LMncrktvoq29EGANTkX0ysOEm0xV3
         82OvULTaTScT7KLPnHL6GDGkY129lviP4tzeEtikubJRZamb/EQBlnu2vgn/o7qvbVrx
         mUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gMwJMPC9VIxbmIXJW63t2VJt63Jw74eyBJRbZWva/oY=;
        fh=Zr0VrZrsAja6IU1lanfEqvdHbQEsmvOxYWJciIeXR/Q=;
        b=OkocDNYEWTVbal+urJNUyNzdFmIZerJdFEyHbn9nuftgNWCQTMB75c2hrVlZXBkWEW
         C+acb7pkLF2asAgWvYvkyI8B/wUozQVn7LD9HrmkgvtUbcBf6sgtGsuSJFhn5ukhaUm3
         4e1w4RTPii3fzL6MG4w/E31TObKmk3QiebvGqwnFUwUbqOkBWvX976Kyu5ablM1GP8G/
         Jx1Ixev7Yg7a8iX4ZfXqW1c/NcHeqJFhSdEE1mhfaUuornISjiEfH/i6OJrX1LYNdC64
         6wGFpcXPAPhe30b5C+cVhuXNuwWTLgEKoaQoHbHN+r0Z36eRql0KkNsll1zIzVrPfJaF
         lRgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790016786; x=1790621586; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMwJMPC9VIxbmIXJW63t2VJt63Jw74eyBJRbZWva/oY=;
        b=UUrNoZEm39z71YIBCuFI1VOU0JMaV08y/TS/N0Er/WB+nN9OvpHfOSHan87BC8DijN
         EdXmm4V9I5kSNkSHgHk5Qokdp+XvtyMlNDWWvc/7ce6gUCfoOhjyyxsZvBjT8+7rbLIO
         eTPlGpatzEWV8YFcKSxkiUDH2mSdhY7CVSo3Q/lcP1kDusvmXZb6uCFW2ZoUdxZL58Pp
         7Yu/rhoOT6QqhL/psOsIvSLEVtuWs09KtM27Gp3n6reTj7V0/k8K/Vlzm8SFo1cLpleV
         TzCdctjgFLzA7azJS95khsM5TinDkfK+MloBLkhejn/J2zfH0LwvMY7HDWEX9vQ5lD9v
         jjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016786; x=1790621586;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gMwJMPC9VIxbmIXJW63t2VJt63Jw74eyBJRbZWva/oY=;
        b=TpPEE5jtH/elpgYPlyl4Um8ODvSr81EMuAAFUqgY26X+q62aPyC+El6drVdrr2+xdW
         6Bcr7ahkaj1vWAARqu4SSOyLZOk0uGca0uXZc7u38/4jUqpvKBMXi7jkXHiL4xNlxrLU
         5DZOAmQPuCc6EwqPuEKCZXI746JxsTTkyYRVKSvNBEgxciWiGgebZznW5Wnrl+yHRp8h
         bYjojMXoJzCmRq9RnJesGLO2fZDK8gBdSfaeshHV8wq+xZGcjk0trrdKOMRHcbbuCOeD
         oHvpHeUqXJNaPvrmxIc8Xh6Wbl+WucrkcYfM2KrKHeYNO55T4YHu2tyTQ7ggf3RZUmwr
         9+GQ==
X-Gm-Message-State: AFuF++nqOGPB8T20hS0ABXBBcFp/4qdNHHEuE4/N+8LES0edVoGj0pSN
	soJU2tpRgBZd4sd2E4Hjus4N97UNh08dLgGJseQ7Y/YjzntfxAAxWQO96SHRXJUZtMj2gqGmuW5
	Dx70xTEmuLYzOIyS7Ug304oRBODXP6NI=
X-Gm-Gg: AYBFou152/RV2+LXqMFvGBRmB7ymgRhS9DoUg7hCopwYLfD7AeVq2YAFVfmz8rriZmi
	dcFgYUCDslAXw6K6KKBPoXJzvhsTWy5oO6yBP0geqw+A7cJu+GHG0STXbVP7/j+9y+FVwMYWpAB
	CVNXZrqxwlxU38w4URZEJfc/FdPLwNDovm7mL+BfwOeAXf+mPNWjaGLvOaFF7GjfiKpVv8h/8ts
	0Dpi+UD68HDGJGpx8KRCbHRLScDXxV0/MgXhn3hAkUEOt2geYMzRqmv2QHZOpjxa9aCC0LLH642
	R58SicH3/GWASLv4QQqpN5zRmt76aO47GCyXcoPvsQvRt37aYiD0vn7YpPuaVLc9WWsJLrKxCkl
	cwKA20SBkmW8ATNHC2gZH0rY1y2ZkSYwXkoC38JtYKSwYSlbEUga6zfX1M8lIZ4csGhjzAzgbZ2
	SwF9jXcrDKWaRy4Nz7vgsGW1NcFd/nW3Kozr7IJdektYnNre8sb6kuFKzk0auhnS8OgMeByHTQB
	m0pJPTvRwzeQDwHpDza4ADhUh6BsZylPDumb2nP+QBLN0Qor3nYKoJdfsEAIzAqIK+6mh5AU8/h
	kzMuW5lg
X-Received: by 2002:a05:690e:120e:b0:66f:c1be:a657 with SMTP id
 956f58d0204a3-6717fdbf1b6mr3904218d50.73.1790016785913; Mon, 21 Sep 2026
 11:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260921121133.3377823-1-joaohf@gmail.com>
In-Reply-To: <20260921121133.3377823-1-joaohf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Sep 2026 11:52:39 -0700
X-Gm-Features: AcwNN1UzQffnfsIplXZtTkrqE6UWeph1hxvPl8lBFvcZYvfX1Tt1oaFw_q1WOTw
Message-ID: <CAMKF1srJ8wPVA8u5XNNriFFLFRpo8YxA20g4V2vu12ATonZJFg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] boardid: add recipe
To: joaohf@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000aa9b9f065c02c2e6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 18:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130167

--000000000000aa9b9f065c02c2e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I accepted v1, Please send the changes done in v2 as an incremental patch.

On Mon, Sep 21, 2026 at 5:11=E2=80=AFAM Jo=C3=A3o Henrique Ferreira de Frei=
tas via
lists.openembedded.org <joaohf=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> CC: Ross Burton <Ross.Burton@arm.com>
> ---
> changes in v2:
>  - remove PV
>  - remove do_configure and do_install
>
>  .../boardid/boardid_1.15.0.bb                 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
>
> diff --git a/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
> b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
> new file mode 100644
> index 0000000000..d77d91162c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Print out a platform-specific board serial number"
> +DESCRIPTION =3D "This program looks up a device-specific serial number a=
nd
> prints it. \
> +The original use was to provide some non-changing and unique material fo=
r
> dynamically \
> +creating device names on a local LAN. There are implementation specific
> boards as well \
> +generic mechanisms for getting serial number."
> +HOMEPAGE =3D "https://github.com/nerves-project/boardid"
> +LICENSE =3D "Apache-2.0 AND CC-BY-4.0 AND CC0-1.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSES/Apache-2.0.txt;md5=3Dc846ebb396f8b174b10ded4771514fcc \
> +
> file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032 \
> +
> file://LICENSES/CC-BY-4.0.txt;md5=3D9b33bbd06fb58995fb0e299cd38d1838"
> +
> +SRC_URI =3D "git://
> github.com/nerves-project/boardid/;protocol=3Dhttps;branch=3Dmain"
> +
> +SRCREV =3D "2ccf22a8be22d7597e16fb225c1173876674f7a4"
> +
> +do_install () {
> +        install -d ${D}${bindir}
> +        install -m 0755 ${S}/boardid ${D}${bindir}
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130161):
> https://lists.openembedded.org/g/openembedded-devel/message/130161
> Mute This Topic: https://lists.openembedded.org/mt/121355518/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa9b9f065c02c2e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I accepted v1, Please send the changes done in v2 as an in=
cremental patch.=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 2026 at 5:11=E2=
=80=AFAM Jo=C3=A3o Henrique Ferreira de Freitas via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;joaohf=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-=
off-by: Jo=C3=A3o Henrique Ferreira de Freitas &lt;<a href=3D"mailto:joaohf=
@gmail.com" target=3D"_blank">joaohf@gmail.com</a>&gt;<br>
CC: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank=
">Ross.Burton@arm.com</a>&gt;<br>
---<br>
changes in v2:<br>
=C2=A0- remove PV<br>
=C2=A0- remove do_configure and do_install<br>
<br>
=C2=A0.../boardid/<a href=3D"http://boardid_1.15.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">boardid_1.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/boardid/<a href=3D"http:/=
/boardid_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">boardid_1.15.0.bb<=
/a><br>
<br>
diff --git a/meta-oe/recipes-extended/boardid/<a href=3D"http://boardid_1.1=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">boardid_1.15.0.bb</a> b/meta-o=
e/recipes-extended/boardid/<a href=3D"http://boardid_1.15.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">boardid_1.15.0.bb</a><br>
new file mode 100644<br>
index 0000000000..d77d91162c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/boardid/<a href=3D"http://boardid_1.15.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">boardid_1.15.0.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;Print out a platform-specific board serial number&quot;<=
br>
+DESCRIPTION =3D &quot;This program looks up a device-specific serial numbe=
r and prints it. \<br>
+The original use was to provide some non-changing and unique material for =
dynamically \<br>
+creating device names on a local LAN. There are implementation specific bo=
ards as well \<br>
+generic mechanisms for getting serial number.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/nerves-project/boardid" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/nerves-project/board=
id</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND CC-BY-4.0 AND CC0-1.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSES/Apache-2.0.txt;md5=3Dc846ebb396=
f8b174b10ded4771514fcc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/CC-BY-4.0.txt;md5=3D9b33bbd06fb58995fb0e299cd38d1838&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/nerves-project/boardi=
d/;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/nerves-project/boardid/;protocol=3Dhttps;branch=3Dmain</a>&quot;<br=
>
+<br>
+SRCREV =3D &quot;2ccf22a8be22d7597e16fb225c1173876674f7a4&quot;<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/boardid ${D}${bindir}<br>
+}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130161): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130161" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130161</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121355518/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121355518/1997914</a><br>
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

--000000000000aa9b9f065c02c2e6--

