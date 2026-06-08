Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E33CD8C90
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 01:23:03 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44820.1780881776306757590
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 18:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WvZXkDGd;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66077f6c438so3154324d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 18:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780881775; cv=none;
        d=google.com; s=arc-20240605;
        b=HtpsQRmGKglM9eu2igr78py6K5do9z7z0Aydlc4VU38TpKVw2kKSPf5aDsa66DNk30
         jEEDZECymGcauxNbrgNyFPD6Y+sC2c/sXy2HsyUqLa8xTKozBYW1eCF6kJasEGA7aidn
         BBKVYDQwf7DfC1YISl+UlGD/gIstsU1vwqIK0Gz4tlC3lTDZMOjwCwpy34bR7e9svGwG
         md8/4eIcBRSJ1hAn+qlXNJebrJjKsihnFlgDBF3rZ/3uKTb+2ryA5Xombsn0R18NIQvu
         fv+m5joLvAwpOk9fUPpooVybgyfaFF3AEiB9of11OHMF3opt3FzD5npuA6grK0x1LylL
         /5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mbK8a8c7Av0xGeVe02bp9XNqq/IgL0poYYHLNRfULlI=;
        fh=t00iliNe9pL0QaiZgATkfZzbJzbg/gzT7cLy1S2kUZs=;
        b=X0cSJEZtYKQ6TQ+ClBVOoqigpp+WTGCi2AhdWxZfKV3eotFTQOBq0OWJs1BceXOEq0
         X0ew5R2wEb5loM1s/FIg1E4cYw/JRIrsREI/WaPykt+/V2B/7j319pYBQjkCD85AeI1S
         7J1k9WMoQIS/1XyKtdmDQBdLpQ3JCYfGQuM4jQdoA5zjaPM6lSuB+IxM5RTgQh1MCwC0
         6F+dql1Bpyp9y58JOXc87P+b0pHP3whP7tvu0Tfmv2TrDO83ywkvxxlxe+On1QSwvFgE
         v97oZDMctWfHnXVxOuRy4vQ7kD+tc5Pu6IK9/VA5NFg/DNBDb9uMZ1qQ4SfXr5QLuWsc
         V+Jw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780881775; x=1781486575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbK8a8c7Av0xGeVe02bp9XNqq/IgL0poYYHLNRfULlI=;
        b=WvZXkDGdN3+dcvqOqaGYeznYKQ7VVDBO8Vv0SXax3/sFXrmROnvfl/c1QJDgt699zR
         Sx629wcrSc+v43JL7Z2oZmQ74oiC/O8lQoMFylJgoDUB8eZRcvShbuJDjZDESDbjz8U7
         hGIZ913wGdkeaP12xejh2NjebRkxuT7yw7aYPT72AMIPdS87Ie2KUtA8yUsfTjk3Cv3Q
         8/NVLw8TVvcNCxoVKFo/OMz570jcfOLZd+47bm9wyvASP9MpCm4Bmd5dm+kSNM7BLESF
         bva2u4s31EgQUl1xFLe8GZWV9z8RoiCZdcn2eoSTduSV5k1y/e/YqUGokBof2UuNoWO/
         4ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780881775; x=1781486575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbK8a8c7Av0xGeVe02bp9XNqq/IgL0poYYHLNRfULlI=;
        b=fH1sgDdGSuMw9iCU3S67bs5boLzHwRkA4DG4SEe/hhvrUo9zLDN2LVYym5AfY8TucZ
         IuxjeHisDcZAleF9zJ4gjEHc4RQstMWdSt0tnKSaYvrYyi4UJC2XXF7eqqCfP+rb2cMu
         xB84LWyRmkMKjfhiV6ULgQPBbrZDhOdCg4SMUxLwsxk6TKFUjFNbYqgSjnZbCSxULmgP
         IdZNtkqaQP/dpJLSybBm0Ruj+m22IW8Q9iNCN9FAJR2Hyr1p/AY4/a2sao8ljWjdA4Aq
         mdJhupj3u0yV0yQHop6NIK4xKtbqPAGxdM7LdQeWOVndA1SDRkda+U38zkTagN9dU54i
         mRCg==
X-Gm-Message-State: AOJu0YwNAz4gdINQ1n/NMuha9251MZYNJJKQDksWLcNp9ZhJejl3cizG
	wumMPj0K6h30oEs8Q5YmuvwFIHH9Z3al5LGympEodvP0VkXNeCp+MImySDjLiLEBcUfo4VP8/+c
	McHjAcELj0nxlXScSo5D2YN4oeUMMeSMj1Kng
X-Gm-Gg: Acq92OFFDvxmYPwArP6o9mkanBjjcVs/sQksxOqBsv1/R1/Iwc+nTkTfGg/5ki5neYS
	wWN/HqJ97PjuDZYYvnBTVYh2/vMrrNbMnyGStxTrEUdscB5ordCEq5yAsdS4VMyQU2nR0iNNwXG
	N1ARxHho3nYRx+q3qKIRuiZxYuC+Iafo/yxjSDaJaxBDubVWj7re/mn3r0Rod8z6olcN8GrVszB
	aOmD96wunQJJ/mDZU9jwbdMxyvRl/QHGiym5Nm6vzsXWCdd0+mBXdlmmLTBxhdhcCr1R7IKB+lg
	vZ7fYV32M/8cOfjWGEpzXEkHjhKE1Pd4SFrGbYoa8i1tvWEggRKIXbqOLHITwOoeQwdxJDALT5h
	6CjKjpomKnaJzhRx6TRB+DkuCaC4FwcHopbhU0y/A39isTo/1PENskxFCibs0b4PGX+yZhvEp9i
	1xCh8VZ53zE/ZW2Hk=
X-Received: by 2002:a05:690e:134d:b0:660:5b90:b426 with SMTP id
 956f58d0204a3-66108356e59mr11477250d50.46.1780881775343; Sun, 07 Jun 2026
 18:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260530121231.3939854-1-filipe.pires@konsulko.com>
In-Reply-To: <20260530121231.3939854-1-filipe.pires@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 18:22:30 -0700
X-Gm-Features: AVVi8Cf5su_DazTlJF1_Qk3DnMdkCB-E244Yx-LhUnzW0g7-j9D0t5lz_Jv55uM
Message-ID: <CAMKF1soBNh0aVkjWkuN6yEAFO4Y2wYnQWLtEYjRWAamCOxRPQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lcov: upgrade 1.16 -> 2.4
To: filipe.pires@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009b3e8f0653b3d9b2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 01:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127417

--0000000000009b3e8f0653b3d9b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inlin=
e

On Sat, May 30, 2026 at 5:12=E2=80=AFAM fpires96 via lists.openembedded.org
<filipe.pires=3Dkonsulko.com@lists.openembedded.org> wrote:

> From: Filipe Pires <filipe.pires@konsulko.com>
>
> Signed-off-by: Filipe Pires <filipe.pires@konsulko.com>
> ---
>  meta-oe/recipes-support/lcov/{lcov_1.16.bb =3D> lcov_2.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/lcov/{lcov_1.16.bb =3D> lcov_2.4.bb} (95%=
)
>
> diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb
> b/meta-oe/recipes-support/lcov/lcov_2.4.bb
> similarity index 95%
> rename from meta-oe/recipes-support/lcov/lcov_1.16.bb
> rename to meta-oe/recipes-support/lcov/lcov_2.4.bb
> index a889b3fa82..210cae45f6 100755
> --- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
> +++ b/meta-oe/recipes-support/lcov/lcov_2.4.bb
> @@ -51,7 +51,7 @@ RDEPENDS:${PN}:append:class-target =3D " \
>      gcov-symlinks \
>  "
>  SRC_URI =3D "
> https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-=
${PV}.tar.gz
> "
> -SRC_URI[sha256sum] =3D
> "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
> +SRC_URI[sha256sum] =3D
> "3457825c6b2fe4ef77c782b82a23875c84a3c955243823f05d8f2dec0d455820"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/linux-test-project/lcov/relea=
ses
> "
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127300):
> https://lists.openembedded.org/g/openembedded-devel/message/127300
> Mute This Topic: https://lists.openembedded.org/mt/119561081/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009b3e8f0653b3d9b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build<div><br></div><div><a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inline">https://au=
tobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inline</a></div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sat, May 30, 2026 at 5:12=E2=80=AFAM fpires96 via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f=
ilipe.pires=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org">konsul=
ko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Filipe Pires &lt;<a href=3D"mailto:filip=
e.pires@konsulko.com" target=3D"_blank">filipe.pires@konsulko.com</a>&gt;<b=
r>
<br>
Signed-off-by: Filipe Pires &lt;<a href=3D"mailto:filipe.pires@konsulko.com=
" target=3D"_blank">filipe.pires@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/lcov/{<a href=3D"http://lcov_1.16.bb" rel=3D"=
noreferrer" target=3D"_blank">lcov_1.16.bb</a> =3D&gt; <a href=3D"http://lc=
ov_2.4.bb" rel=3D"noreferrer" target=3D"_blank">lcov_2.4.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/lcov/{<a href=3D"http://lcov_1.16.bb" =
rel=3D"noreferrer" target=3D"_blank">lcov_1.16.bb</a> =3D&gt; <a href=3D"ht=
tp://lcov_2.4.bb" rel=3D"noreferrer" target=3D"_blank">lcov_2.4.bb</a>} (95=
%)<br>
<br>
diff --git a/meta-oe/recipes-support/lcov/<a href=3D"http://lcov_1.16.bb" r=
el=3D"noreferrer" target=3D"_blank">lcov_1.16.bb</a> b/meta-oe/recipes-supp=
ort/lcov/<a href=3D"http://lcov_2.4.bb" rel=3D"noreferrer" target=3D"_blank=
">lcov_2.4.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-support/lcov/<a href=3D"http://lcov_1.16.bb" re=
l=3D"noreferrer" target=3D"_blank">lcov_1.16.bb</a><br>
rename to meta-oe/recipes-support/lcov/<a href=3D"http://lcov_2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">lcov_2.4.bb</a><br>
index a889b3fa82..210cae45f6 100755<br>
--- a/meta-oe/recipes-support/lcov/<a href=3D"http://lcov_1.16.bb" rel=3D"n=
oreferrer" target=3D"_blank">lcov_1.16.bb</a><br>
+++ b/meta-oe/recipes-support/lcov/<a href=3D"http://lcov_2.4.bb" rel=3D"no=
referrer" target=3D"_blank">lcov_2.4.bb</a><br>
@@ -51,7 +51,7 @@ RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gcov-symlinks \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/linux-test-project/lc=
ov/releases/download/v$%7BPV%7D/lcov-$%7BPV%7D.tar.gz" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/linux-test-project/lcov/releases/downlo=
ad/v${PV}/lcov-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c=
2ba5224995668e3240b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3457825c6b2fe4ef77c782b82a23875c84a3c95524382=
3f05d8f2dec0d455820&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/linux-test=
-project/lcov/releases" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/linux-test-project/lcov/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127300): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127300" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127300</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119561081/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119561081/1997914</a><br>
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

--0000000000009b3e8f0653b3d9b2--

