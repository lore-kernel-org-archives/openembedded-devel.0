Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C9CEB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 15:52:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.2279.1687362734605400379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 08:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=h6s4fLK6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30fbf253dc7so4996635f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687362733; x=1689954733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EfbMLBbPod7DiLXj+N/1HljmkfAfvmputjdFg9ieHdo=;
        b=h6s4fLK6X1gicPnUFAQJvvK4e8Huvl5Iy3Cd6VCI2LSpHd021ncq+70SQvORR8jk38
         DHpv1REbc6StrAspiAsiKeyxaw2CXFAuEccf91ohQ39rrFewQRAg7VcisbVll5eVKvnK
         02Q24MPdBjMXg8RzfKQU5OuBblDdR3gtJQBQWtIaW7Z+zN9hdyOsPO1IrgQpFDUl7yAu
         IhFwcRl44VjaJepVE6STebyqFmgOdsuh8YjTJCBpgomHtsRwvKmzrB3lIZ+PTjwXOAPi
         3IYS3mpiwOjS4Uofyamtw0TQNHah/dUpmxCY3UKyX4wvxhrksCycQcBnETBuuBzx/E9L
         RUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687362733; x=1689954733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfbMLBbPod7DiLXj+N/1HljmkfAfvmputjdFg9ieHdo=;
        b=K9YSznwxwQCiqg9SC44hJ5v2yFZxUQgdr1QcQUE6yIgBixOapBVPnCN7C5YH7yrbbY
         eTth+viy3hA6hEMPJa+EefmAkBUK1UsaLFM5dsK6I5mmOEMGfPGD1eddg8GDtNSIHEOU
         cCvpntPRiptlrY8MAaRmCp41gcMuHiP89vUTsGbbmVogeEYcK5xXdZl1dwGefJWA/OuH
         VeTqObdXXzOqvOfeXTOZXtOEuFKk0n18KEs9vPrH3hyZViheyWyEZVLwn81hB7C/ghan
         bA+dd+Fr6C6FPgGMn9+OFDRm3bKvHrDph9/eL9ZATljRV+llLb2aaZC2eQrTfa4ELBZs
         Yj3g==
X-Gm-Message-State: AC+VfDyOXe1bi1LqQy2HMswRTc0nHE89uEJ01yGv32zt4GRzdBEMf7ZU
	XLjpvkA1BmYGTCx9MoGc2SDMFalaEM1fAaIHHBE=
X-Google-Smtp-Source: ACHHUZ6yZZKsdHYUhUpDJ2wA/RE1TsAzNXUg2h+QFdQLyR4Z4DZ6uIbTjKjAsgqvKi/R8hZ2zmzGLgt03KbzxIJG8MA=
X-Received: by 2002:a5d:6dce:0:b0:30a:e63b:950 with SMTP id
 d14-20020a5d6dce000000b0030ae63b0950mr19264466wrz.31.1687362732710; Wed, 21
 Jun 2023 08:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230621143552.4140867-1-raj.khem@gmail.com>
In-Reply-To: <20230621143552.4140867-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Jun 2023 17:51:52 +0200
Message-ID: <CA+chaQenARDweHmhx8EZztpDfhBfJPPNMDXtFaEhDh-Jo2Akbg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] postfix: Fix Upstream-Status keyword
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a5f3105fea5c0a7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 15:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103476

--0000000000004a5f3105fea5c0a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 4:35=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-daemons/postfix/files/0001-Fix-makedefs.patch      | 2 +-
>  ...-Change-fixed-postconf-to-a-variable-for-cross-compil.patch | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> index aa93083802..bacfdb5e67 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pat=
ch
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pat=
ch
> @@ -11,7 +11,7 @@ for Linux2 and Linux3 systems.
>    native build, search host library path for nsl and resolv library
>    which comes from libc
>
> -Upstreamstatus: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>  ---
>

Thanks Khem!

Sorry I should have spotted these when sending my Pending additions (the
regex in scripts/contrib/patchreview.py isn't wide enough to catch
"Upstreamstatus" as well.

In this 0001-Fix-makedefs.patch there is also "Upstream-Status: Pending"
added by my change, if you can drop it here (or let me know if you want v2
of my change with these 2 fixed).

Cheers,

diff --git
> a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> index 6eee817716..8420b496a3 100644
> ---
> a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> +++
> b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> @@ -3,11 +3,10 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Fri, 19 Jun 2015 17:14:58 +0900
>  Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
>
> -Upstreamstatus: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>  ---
> -Upstream-Status: Pending
>
>   Makefile.in     |  2 +-
>   postfix-install | 18 ++++++++++--------
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103474):
> https://lists.openembedded.org/g/openembedded-devel/message/103474
> Mute This Topic: https://lists.openembedded.org/mt/99677348/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004a5f3105fea5c0a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 21, 2023 at 4:35=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-daemons/postfix/files/0001-Fix-makedefs.patch=C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0...-Change-fixed-postconf-to-a-variable-for-cross-compil.patch | 3 +-=
-<br>
=C2=A02 files changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedef=
s.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch<br>
index aa93083802..bacfdb5e67 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch=
<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch=
<br>
@@ -11,7 +11,7 @@ for Linux2 and Linux3 systems.<br>
=C2=A0 =C2=A0native build, search host library path for nsl and resolv libr=
ary<br>
=C2=A0 =C2=A0which comes from libc<br>
<br>
-Upstreamstatus: Inappropriate [embedded specific]<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Yao Zhao &lt;<a href=3D"mailto:yao.zhao@windriver.com"=
 target=3D"_blank">yao.zhao@windriver.com</a>&gt;<br>
=C2=A0---<br></blockquote><div><br></div><div>Thanks Khem!</div><div><br></=
div><div>Sorry I should have spotted these when sending my Pending addition=
s (the regex in scripts/contrib/patchreview.py isn&#39;t wide enough to cat=
ch &quot;Upstreamstatus&quot; as well.</div><div><br></div><div>In this 000=
1-Fix-makedefs.patch there is also &quot;Upstream-Status: Pending&quot; add=
ed by my change, if you can drop it here (or let me know if you want v2 of =
my change with these 2 fixed).</div><div><br></div><div>Cheers,</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixe=
d-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-d=
aemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-com=
pil.patch<br>
index 6eee817716..8420b496a3 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postc=
onf-to-a-variable-for-cross-compil.patch<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postc=
onf-to-a-variable-for-cross-compil.patch<br>
@@ -3,11 +3,10 @@ From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.=
com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0Date: Fri, 19 Jun 2015 17:14:58 +0900<br>
=C2=A0Subject: [PATCH] Change fixed postconf to a variable for cross-compil=
ing<br>
<br>
-Upstreamstatus: Inappropriate [embedded specific]<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Yao Zhao &lt;<a href=3D"mailto:yao.zhao@windriver.com"=
 target=3D"_blank">yao.zhao@windriver.com</a>&gt;<br>
=C2=A0---<br>
-Upstream-Status: Pending<br>
<br>
=C2=A0 Makefile.in=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0 postfix-install | 18 ++++++++++--------<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103474): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103474" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103474</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99677348/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99677348/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004a5f3105fea5c0a7--

