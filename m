Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C5B109C04B
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 17:28:30 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28935.1774459702431081047
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 10:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AW9Tcy9g;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso151646d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774459701; cv=none;
        d=google.com; s=arc-20240605;
        b=iBVNIYvDjnOrV1abkThVGJSr7/BQB2L5UYyFCly4etrrn3RQyCBZnNswp9cFlQQ66x
         zRk2pAIQMh0Ld81Kw8bJe/GTAkqZB5pIhEnnZmi/Ndb082O+KJ/aGR4sE1EPSl/NhLhN
         zy4fKyJ4qo1W+K3FKVJ7BN8ow1XrOLr5Cdi72j5rTbZVfXmRWR73xxqT79bfA2900ue9
         FS1QvyXY2KpFVG0Ch3V8iiRycUp8QUnz3BHwFsS2Uq1KUsgBHFigwGZCEbDL6yv1dFnu
         rnzBLznT1sREnt8zRgisYW2jYeTRkszq0mUJinrczMKpsLttodvx3JLChZwkaBOmrYkb
         KM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dNcKk9QP4Tqc+IkBQX6zfJBeL7JIGFuHDnRbWtN6jLk=;
        fh=ETyxkoVAW6mjjuLL7f3OIRRxmkhdexKbxX5GL7sl1f0=;
        b=XdwZCt4ZcSs/HHudKELwYXcRJ+3VU603dTINiZhhyV365XqlvSb2njyhXoZtvOEyMz
         2JrrrYgkREnEao0Eg9FuNfmM52d3/rwayueWkNG0LppgD0XlrBRphHYZ15qdY2s+1uwn
         uUO1F8cNexE+0oTPUKkiAmz5fMxyd8Iuw1BftbFCkaBE1ve0Rmb60BbQvOcoGw6vM9o9
         +JeBLyjDYa9LdqJ1EFNI3QAfL+QUtm7jI9AqGoaaZIZIBLed1zJ3sy+3c7TqTwFCxfmI
         syuLcQFpofxXnHosWVi+Hz2fRf7gVKsxuJqEGKJpgpKvnMvWIfDlq6FMQFqjjqK+/IAW
         NkOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774459701; x=1775064501; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dNcKk9QP4Tqc+IkBQX6zfJBeL7JIGFuHDnRbWtN6jLk=;
        b=AW9Tcy9glhywZ7LQs+gljFJeD81FmmrgQjhgAlEkuGVoK+PmEnccPl+bBL3wh0sBla
         ePOCsuPTGgZuEJ30LBEBidxQX5fT2xR4WcSnehtm2DpbtBxse9Aj0/68bwvIueIMzp7A
         pFN+5Q3JdWKnF4VlGrumm+0XQB/7a8kBxVy5in3cQBYxZlKecEUEvTJ6Ga4Hyg6KAiLe
         OCVLZjQf4SOg2FHyEnM/aAGepH5RHZAnkr5y3UJIfEjP2VN+gRGB8SKZ8R1OohEQjWCy
         FwabNSKgPJw7JUQ0wpaTfGw436vLe3w2rz4EfF0jWcWHVRI6eFaZPrAjQmuRNuX2Hoej
         32Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459701; x=1775064501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNcKk9QP4Tqc+IkBQX6zfJBeL7JIGFuHDnRbWtN6jLk=;
        b=JQp3QZQuioQw6o5CZpGCfo2uHnsEEvGvzRNI4j568bwLAPjPhw8Xax8lj3pT0+sn8p
         7cNpjfq22fVOldgqQechHg7okrvi7jiTLYOk91zgrm2WWajGxzdGJ3Z7tKuVHutZYqIe
         BQV2zHrlexISYwRg8Dq5xMkx3GjutN9i86xAgJn8SlvYD/wA6CO7agQKM41JqNeTpNk0
         7K2avEUzE6L5X0wGuTnPQhc0ovPOF7ZDZ//TYsDxrBJdEpp1BqTCeT9qk9yl3cEX+cTG
         v5uuN6MWDFhxKSfYHf/78D0WMaaP/ft+24DxwHHKf6Cu/s5inw/g8FJdmHamTnbsCURv
         16IQ==
X-Gm-Message-State: AOJu0YyKQZCjGGCsY5y/yWAL0F7CgloFNHRtwAfLBwjDYsmfNDSdw6s1
	3PnaXW3ir6w09KOCzIGbxW3mS02unuzzY5wccWzNRjImQnqJuhsK1zCmXQOVDQn8VieJlur0GyQ
	j965kkPluSdd99Fvvw0snQsNslvUNHoaZEfYA
X-Gm-Gg: ATEYQzwXNP12kaevaHfA8SfoMSzclU1KkXoIQlXOcDnZ+0RtNq2gOjHegr1gJPkOsze
	LppvjLu5lTwNgDs1NgC3BswN88uwyJZLmX3rXs10QKG46FERbY36BWJ+zif4KbIB+SnwlW7AL4t
	GQwDV51VYL1OFtB5pf3giWabNSq4bzbAJV7/gN09xaAkaj/dNk1+jjGqq0T5x5UNQ83CWMEHMyQ
	tXML8HRc6O9wtBYlfyoh5rT3MGAcKtQHqte3uFzbujCpYTRqTrSvZLhAHnSWrUeXGLufdbvCdMe
	a/08jx8cDB4kUIG+4zL5TEbTnordyRJg7g1+p6rLTqrt/Hex5SBFZ558ENmYSamqKTcGOEesKTS
	ceS+yyWKDVXsIXSWU1bzR1JSW
X-Received: by 2002:a05:690e:6db:b0:64e:c215:a08e with SMTP id
 956f58d0204a3-64ee617b0f0mr3372552d50.72.1774459701251; Wed, 25 Mar 2026
 10:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <189D459852A339A7.2629287@lists.openembedded.org> <925ab698-2f42-4d35-a157-74ca3ce1e383@windriver.com>
In-Reply-To: <925ab698-2f42-4d35-a157-74ca3ce1e383@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 10:27:52 -0700
X-Gm-Features: AQROBzBg41jqSBg7jMagBx-RoJ2i3fqhARKjlq5yXB1lYr9TOEEA8FvkBbI-_aE
Message-ID: <CAMKF1srk7GhB1UbHO3mCOSXcYW5zVLkq+kh=sR8WcB0rPB6psA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Luajit: Update to latest on v2.1 branch
To: changqing.li@windriver.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000295577064ddc988e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 17:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125627

--000000000000295577064ddc988e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It perhaps got rebase wrath. I have cherry picked the needed bits

On Wed, Mar 25, 2026 at 12:13=E2=80=AFAM Changqing Li via lists.openembedde=
d.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> Hi, Khem
>
> It's strange that this patch turned out like this=EF=BC=9A
> https://git.openembedded.org/meta-openembedded/commit/?id=3D510ea4db57808=
82d9f1ad17b234d89bb691ed3fb
>
> Could you help to check it? Thanks. I cherry picked this patch based on
> the latest master, it can be cherry picked successfully.
>
> Regards
>
> Changqing
> On 3/16/26 16:38, Changqing Li via lists.openembedded.org wrote:
>
> License-Update: copyright year updated
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@wi=
ndriver.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
> index 9df5fca0e6..0bb78e18ad 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Just-In-Time Compiler for Lua"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd421a5e2a24207f5e260537399a=
9a38b"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0ae=
59ff3"
>  HOMEPAGE =3D "http://luajit.org" <http://luajit.org>
>
>  SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=
=3Dv2.1 \
> @@ -9,7 +9,7 @@ SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=
=3Dhttp;branch=3Dv2.1 \
>             "
>
>  PV =3D "2.1"
> -SRCREV =3D "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
> +SRCREV =3D "659a61693aa3b87661864ad0f12eee14c865cd7f"
>
>
>  inherit pkgconfig binconfig siteinfo
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125603):
> https://lists.openembedded.org/g/openembedded-devel/message/125603
> Mute This Topic: https://lists.openembedded.org/mt/118341592/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000295577064ddc988e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It perhaps got rebase wrath. I have cherry picked the need=
ed bits</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 12:13=E2=80=AFAM Chan=
gqing Li via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;<a href=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"ma=
ilto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><u></u>

 =20
  <div bgcolor=3D"#ffffff">
    <p>Hi, Khem</p>
    <p><span lang=3D"en"><span><span>It&#39;s strange that this patch turne=
d out like
            this=EF=BC=9A
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D510e=
a4db5780882d9f1ad17b234d89bb691ed3fb" target=3D"_blank">https://git.openemb=
edded.org/meta-openembedded/commit/?id=3D510ea4db5780882d9f1ad17b234d89bb69=
1ed3fb</a></span></span></span></p>
    <p><span lang=3D"en"><span><span>Could you help to check it? Thanks. I =
cherry
            picked this patch based on the latest master, it can be
            cherry picked successfully.</span></span></span></p>
    <p><span lang=3D"en"><span><span>Regards</span></span></span></p>
    <p>Changqing</p>
    <div>On 3/16/26 16:38, Changqing Li via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>License-Update: copyright year updated

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" target=3D=
"_blank">luajit_git.bb</a> | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.b=
b" target=3D"_blank">luajit_git.bb</a> b/meta-oe/recipes-devtools/luajit/<a=
 href=3D"http://luajit_git.bb" target=3D"_blank">luajit_git.bb</a>
index 9df5fca0e6..0bb78e18ad 100644
--- a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" targ=
et=3D"_blank">luajit_git.bb</a>
+++ b/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" targ=
et=3D"_blank">luajit_git.bb</a>
@@ -1,6 +1,6 @@
 SUMMARY =3D &quot;Just-In-Time Compiler for Lua&quot;
 LICENSE =3D &quot;MIT&quot;
-LIC_FILES_CHKSUM =3D <a>&quot;file://COPYRIGHT;md5=3Dd421a5e2a24207f5e2605=
37399a9a38b&quot;</a>
+LIC_FILES_CHKSUM =3D <a>&quot;file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af21=
31b0ae59ff3&quot;</a>
 HOMEPAGE =3D <a href=3D"http://luajit.org" target=3D"_blank">&quot;http://=
luajit.org&quot;</a>
=20
 SRC_URI =3D &quot;git://<a href=3D"http://luajit.org/git/luajit-2.0.git;pr=
otocol=3Dhttp;branch=3Dv2.1" target=3D"_blank">luajit.org/git/luajit-2.0.gi=
t;protocol=3Dhttp;branch=3Dv2.1</a> \
@@ -9,7 +9,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://luajit.org/git/lu=
ajit-2.0.git;protocol=3Dhttp;branch=3Dv2.1" target=3D"_blank">luajit.org/gi=
t/luajit-2.0.git;protocol=3Dhttp;branch=3Dv2.1</a> \
            &quot;
=20
 PV =3D &quot;2.1&quot;
-SRCREV =3D &quot;538a82133ad6fddfd0ca64de167c4aca3bc1a2da&quot;
+SRCREV =3D &quot;659a61693aa3b87661864ad0f12eee14c865cd7f&quot;
=20
=20
 inherit pkgconfig binconfig siteinfo
</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125603" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125603</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118341592/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118341592/1997914</a><br>
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

--000000000000295577064ddc988e--

