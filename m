Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0821AC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:05:13 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.42.1717095912404389939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=HhzcVKjk;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.208.54, mailfrom: troth@openavr.org)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57a1e980a65so1010876a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1717095910; x=1717700710; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EwfIl4k7NqFDJTmlKk74PY4OfTeam7kiiKdykFWermI=;
        b=HhzcVKjkdPSAdzdqo1C4oU7m+U6PQZFRgM+buw/1YX7bbySWZSvGYBXNMyb86Zw6kv
         Tjb2eRKkGjfX7FtMvXYohq+zKnBEZAuoJG6SZd8j+CIsEIfT6C2O6FCFnaSC+RSQeM1T
         1OZvP2XZ7SmT0Cxas2Fx5wonQcCLnWwJ2j8texMgy580/bhag1eniLQdtS5v77TLbWN6
         ogDrsoEZwQuQiO4PaJa62mGFkI5bXMsn4hsUrSKlN7OJ2biTCBVSyN7yAxGWQSsUMnt3
         F2E6YcXWfgmiVMIamppymhQRE3Ey0B16uAMAaUyiQKlfz8n9yZ1hBESgVph17DiVHsgy
         N5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717095910; x=1717700710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwfIl4k7NqFDJTmlKk74PY4OfTeam7kiiKdykFWermI=;
        b=hphbOVCThvEHPUyQgQhRJi1/0Ky78eH61GPIcetFrsWjdvQXXLHbw7r84s3JXuyyc6
         bidhpThlFu8R4z6Bt6M2fFKXMcjbxtt7ic/iijk0XQOMp+h/thLJZHG42HR9A5Xrof98
         gZKHsyhKAsnEXoEJTnLvuFWUeSSB/9HIENf1/KInfj8q9mYZKDzDMS7z5bKqWbltk515
         b5iescW5arML53wYAuAL/GdGJCUiMKO2r4ehnAjLyXChZ1a10nfbjIXF+RFXWNMZOJde
         V1/Ka+KwQAOswvIPJnhgYqzhuEyrwW9h2EaASSj7YAbSB/PhZxs1C1CUj38+WjsqITHI
         jsIw==
X-Gm-Message-State: AOJu0Yw77QAlI/MoZ7X1ialSiA1ibt+oghZ7kHJjuI/GGiYRSe8X6WX/
	/r8shGd8XikBoRanWTv2bC6l+s2TSpen42ErwYdnt695PonS3pPL/FvKWyE90vlE3zok+CASh6x
	MGyWvUsLbnpJ1+yifm4UVaGU4PducsczU0ae8QXlPSZSPOiD9u6E=
X-Google-Smtp-Source: AGHT+IEEYoUe0z/AqwU53Xprfn7fuvjpEdbIGbGZ0Y4PWPTrA3Ohx/igCtrAhid0bjsa1ZjrrOBVSfxY7x8Ost9VmwA=
X-Received: by 2002:a50:8748:0:b0:578:2148:61f5 with SMTP id
 4fb4d7f45d1cf-57a17902cedmr2042558a12.30.1717095910426; Thu, 30 May 2024
 12:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240529010328.2079536-1-raj.khem@gmail.com>
In-Reply-To: <20240529010328.2079536-1-raj.khem@gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Thu, 30 May 2024 13:04:59 -0600
Message-ID: <CAFMvBt3FTDitezHMgmM4MydPmmbSZa5_gjox4DdqOW7Dxk2waQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] catch2: Upgrade to 3.x release series
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c974c00619b08b27"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110639

--000000000000c974c00619b08b27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI: Updating catch2 to v3 breaks the ptest build for libgpiod-1.6.4.

I needed to disable ptests to get it to work for our builds.
The real fix would be to port the libgpiod-1.6.4 code to catch2 v3, but we
want to migrate to libgpiod-2.x soon anyways.

Just giving folks using libgpiod-1.6.4 a heads up on what I found.

Ted Roth

On Tue, May 28, 2024 at 7:03=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> It supports C++20 better and newer compilers e.g. clang19
> works better with 3.x series.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../catch2/{catch2_2.13.10.bb =3D> catch2_3.6.0.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-test/catch2/{catch2_2.13.10.bb =3D> catch2_3.6.0.=
bb}
> (87%)
>
> diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
> b/meta-oe/recipes-test/catch2/catch2_3.6.0.bb
> similarity index 87%
> rename from meta-oe/recipes-test/catch2/catch2_2.13.10.bb
> rename to meta-oe/recipes-test/catch2/catch2_3.6.0.bb
> index f8080c8f97..52045bd144 100644
> --- a/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
> +++ b/meta-oe/recipes-test/catch2/catch2_3.6.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE =3D "https://github.com/catchorg/Catch2"
>  LICENSE =3D "BSL-1.0"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31bef20d78c"
>
> -SRC_URI =3D "git://
> github.com/catchorg/Catch2.git;branch=3Dv2.x;protocol=3Dhttps"
> -SRCREV =3D "182c910b4b63ff587a3440e08f84f70497e49a81"
> +SRC_URI =3D "git://
> github.com/catchorg/Catch2.git;branch=3Ddevel;protocol=3Dhttps"
> +SRCREV =3D "4e8d92bf02f7d1c8006a0e7a5ecabd8e62d98502"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110598):
> https://lists.openembedded.org/g/openembedded-devel/message/110598
> Mute This Topic: https://lists.openembedded.org/mt/106361394/3617677
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> troth@openavr.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c974c00619b08b27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FYI: Updating catch2 to v3 breaks the ptest build for=
 libgpiod-1.6.4.</div><div><br></div><div>I needed to disable ptests to get=
 it to work for our builds.</div><div>The real fix would be to port the lib=
gpiod-1.6.4 code to catch2 v3, but we want to migrate to libgpiod-2.x soon =
anyways.<br><br></div><div>Just giving folks using libgpiod-1.6.4 a heads u=
p on what I found.<br><br></div><div>Ted Roth<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 28, 2024=
 at 7:03=E2=80=AFPM Khem Raj via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">It supports C++20 better=
 and newer compilers e.g. clang19<br>
works better with 3.x series.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../catch2/{<a href=3D"http://catch2_2.13.10.bb" rel=3D"noreferrer" t=
arget=3D"_blank">catch2_2.13.10.bb</a> =3D&gt; <a href=3D"http://catch2_3.6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">catch2_3.6.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-test/catch2/{<a href=3D"http://catch2_2.13.10.=
bb" rel=3D"noreferrer" target=3D"_blank">catch2_2.13.10.bb</a> =3D&gt; <a h=
ref=3D"http://catch2_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">catch2_=
3.6.0.bb</a>} (87%)<br>
<br>
diff --git a/meta-oe/recipes-test/catch2/<a href=3D"http://catch2_2.13.10.b=
b" rel=3D"noreferrer" target=3D"_blank">catch2_2.13.10.bb</a> b/meta-oe/rec=
ipes-test/catch2/<a href=3D"http://catch2_3.6.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">catch2_3.6.0.bb</a><br>
similarity index 87%<br>
rename from meta-oe/recipes-test/catch2/<a href=3D"http://catch2_2.13.10.bb=
" rel=3D"noreferrer" target=3D"_blank">catch2_2.13.10.bb</a><br>
rename to meta-oe/recipes-test/catch2/<a href=3D"http://catch2_3.6.0.bb" re=
l=3D"noreferrer" target=3D"_blank">catch2_3.6.0.bb</a><br>
index f8080c8f97..52045bd144 100644<br>
--- a/meta-oe/recipes-test/catch2/<a href=3D"http://catch2_2.13.10.bb" rel=
=3D"noreferrer" target=3D"_blank">catch2_2.13.10.bb</a><br>
+++ b/meta-oe/recipes-test/catch2/<a href=3D"http://catch2_3.6.0.bb" rel=3D=
"noreferrer" target=3D"_blank">catch2_3.6.0.bb</a><br>
@@ -4,8 +4,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/catchorg/C=
atch2" rel=3D"noreferrer" target=3D"_blank">https://github.com/catchorg/Cat=
ch2</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSL-1.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3De4224ccaecb14d942=
c71d31bef20d78c&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/catchorg/Catch2.git;b=
ranch=3Dv2.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/catchorg/Catch2.git;branch=3Dv2.x;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;182c910b4b63ff587a3440e08f84f70497e49a81&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/catchorg/Catch2.git;b=
ranch=3Ddevel;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github=
.com/catchorg/Catch2.git;branch=3Ddevel;protocol=3Dhttps</a>&quot;<br>
+SRCREV =3D &quot;4e8d92bf02f7d1c8006a0e7a5ecabd8e62d98502&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.45.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110598): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110598" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110598</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106361394/361=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106361394/3617677</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:troth@openavr.org" targe=
t=3D"_blank">troth@openavr.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c974c00619b08b27--

