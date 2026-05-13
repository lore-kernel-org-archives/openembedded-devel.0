Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF29CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:24:58 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2118.1778657097583706414
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 00:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dt5hz0Gu;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65dd9b25829so2016694d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 00:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778657097; cv=none;
        d=google.com; s=arc-20240605;
        b=F+13Cd8NTsrQS8afATlJcdrTaroErr81NETzFeSSDuBYQsGMCdGmgypxRRgHrCNc+3
         2DUNsObS5++lKCfWfth/0+ftCv3QheGHJeT1Qi13NfnSFTN+qOdLevOGWXJ/8OwA1cSd
         0MGElcaMEoDEoD8s87utE4avdNslDNrzIOJHAYk2k56IzfZPpKMTtWtpKZVr0JSY7CLg
         kFhMVzUA1DnhK9nHxnQZ/dRCKNxnMtpsG45KLnEbydueo62ZmwYMi+dVf4APjA9kxdI7
         aLU1zLHSF564kNIXAklefxwReJIgPRZFJWGi41+bhs8ZQMJZQDsqkrevPfPX/Ox8sPHE
         tdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HKnWKRVJyzKUMLmoNcppXdZ82sLa0sjdLLWujcZoaxs=;
        fh=W8gol2YzCxET1LVyvGyuiPOs1EC53CxfVVzDdnABwrc=;
        b=RdZmbJ8Mg5y3/LyU8WhtayYJGyZw7crzukEOr3hisLx386YQgVRDkbtlxN6zjxu9u1
         zy3IqFelfWC4g4SW7f+Yxx1tcwo/ZDXDhwvSwOux6NCme3uH35Mwcr3dL2wNxc5GQsNm
         QR4bmp+mr5dXp6z9PR/Z+yT8kOFsBb/3A77gzbH4C/HVJ6br1wPATEa3Sylt/Isms1eZ
         dtEZnz6kHya1w59zaf9WKW/53hk491j2DXQjs4gda52mKgEQu/e6zostxEKGA16yIIYc
         0s3Pee64q0GqlfRCCLDv1jXjBv/a/ARCkz2w/g2T3aS7gTa93BUDxeXMgh3r0Rbpon61
         vTBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778657097; x=1779261897; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKnWKRVJyzKUMLmoNcppXdZ82sLa0sjdLLWujcZoaxs=;
        b=Dt5hz0GuNbKiwFIlRLCcIQ5rK08+KJapq8cUbLV/OwvucoR7FNwDw3haY9Mukr9h0r
         rpiDXDhhTpSpQmxMeVXt1GLxRZIf1mXqk5A5ssh28saDG1UECVpf5qSJITM7xK2tufWK
         azyUWWpitTcvowieAgLRVeXAVSANsM1qyLBUYfCCHg4eGROSYIYXrusWgdOrkoQZhAAM
         2hVOerBxatoQe1XMDKadndUjaSpV4bzxZ5AYFyRhhI96HYjQVd5QNGMpMyA9FypVVNdJ
         sPWrcU1ruD3Zu2f6DbrYSy5QOAhblkg9NIVC5tWLeBQ0xFBzrYdvBsjNlordy+i0OR4/
         xnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657097; x=1779261897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKnWKRVJyzKUMLmoNcppXdZ82sLa0sjdLLWujcZoaxs=;
        b=qgCrWKu4WeXRNHbr8F/OIPomRzY5Ifly/AlezypwBMXtMurFKnS0QpxJI2NJgjEnZb
         DEeJa0joVudmNzciyVrwbgWh7BEijGJvM9coaGylUpC21/9ttew6EBDa5GuqxxHXzv1V
         30RADWJtSZE4vQomQuLAalUbRjG/4uMi1mNGfk1tPvKp68SMsMVRbvZq+2x9+FnZaZql
         uFD6hlECHx4WYKObAvi8Zjtb1JFyqk4GiG+3+Hl7ieHD2hb++c6hWvdViQ3rTPEsBud0
         fPDJAQ6MrjEBQoGKxMBVhQ8AlssejooUNCacCSR3qHTIt8Xg7h/9iKVqq/TSAIWrAT8e
         FQPA==
X-Gm-Message-State: AOJu0YzmVyaqS8gFFjR2+MEDWzbe8t41LfLXSqTBYjuHCu7EVaEbg88E
	886/lTfEjH3arOFNVkEjTJSDcuSe5d+LXbm1Se5sIWvD4VY7yexJSul0LkaLwcopXfa/KTh0Kv3
	nsytt42uI6U1iQAzadMmJzirHDjWQ2j4mEPwICAPzIw==
X-Gm-Gg: Acq92OGsdAdS0QrhB/7skd35H6tf5dsGviyaMPHGMF48wcRqvKoN4zGmWJJF6aLZ684
	71yqQ4rPqanH1azphVcMYngc0yh+0dYBPYPMM3+3f042qglHc3o49TGs1y6F8j7sDCNIdZXqsam
	RsgGYTw7BH77u5CexFLgW6HyrKPOkwoQKrZS26162KJJcKtjIVHmCH1Wt3RVjSYhrozWJLZTwd4
	1ThiA7LK7kHlnJkydKw0j0kuUZZs1ZKy4PTh07F1i+0KgbFLGOq6/bR4/jlihoP+4gT92CrKHjV
	1th5L6ph2vXep2TNY1pmKaGsQX8KV5D/l0W5P+evM9xLfAZQGPFt4e3IHon/FAIAcBT7KxVs0q6
	LLiaZukuQCvxmivj/vUkYS8cYwi69AV9zGPOqkhwqb2IiUapJcEDm9iykbvRdmedhZAYvcR/cl3
	iV/2YwQw==
X-Received: by 2002:a05:690e:c44:b0:658:a95b:894a with SMTP id
 956f58d0204a3-65df61fb365mr2304549d50.13.1778657096547; Wed, 13 May 2026
 00:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260513072300.1620413-1-li.zhou@windriver.com>
In-Reply-To: <20260513072300.1620413-1-li.zhou@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 00:24:29 -0700
X-Gm-Features: AVHnY4J03zXCIzjbiMoKWZRfz94R5ugdDyp79X29tfygm1_7wYiUsiiUdAl86-U
Message-ID: <CAMKF1sry2mXLqkGADz0oLRvGckaWVB0awzayB-mQui+AZ_cCyA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH V2] haveged: upgrade 1.9.19 -> 1.9.20
To: li.zhou@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006ac1160651ade02a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 07:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126955

--0000000000006ac1160651ade02a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase on top of latest master

On Wed, May 13, 2026 at 12:23=E2=80=AFAM Li Zhou via lists.openembedded.org
<li.zhou=3Dwindriver.com@lists.openembedded.org> wrote:

> ChangeLog:
> https://github.com/jirka-h/haveged/releases/tag/v1.9.20
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  .../haveged/{haveged_1.9.19.bb =3D> haveged_1.9.20.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb =3D>
> haveged_1.9.20.bb} (91%)
>
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> rename to meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> index 69de5628c4..f055cc2430 100644
> --- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> +++ b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> @@ -6,8 +6,8 @@ HOMEPAGE =3D "https://www.issihosts.com/haveged/index.htm=
l"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -SRCREV =3D "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
> -SRC_URI =3D "git://
> github.com/jirka-h/haveged.git;branch=3Dmaster;protocol=3Dhttps \
> +SRCREV =3D "e2d96806273caa9ce7457e2f8669a3c40517ca27"
> +SRC_URI =3D "git://
> github.com/jirka-h/haveged.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${=
PV}
> <http://github.com/jirka-h/haveged.git;branch=3Dmaster;protocol=3Dhttps;t=
ag=3Dv$%7BPV%7D>
> \
>  "
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/jirka-h/haveged/releases"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126954):
> https://lists.openembedded.org/g/openembedded-devel/message/126954
> Mute This Topic: https://lists.openembedded.org/mt/119293639/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006ac1160651ade02a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase on top of latest master</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, May 13, 2026 at 12:23=E2=80=AFAM Li Zhou via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;li.zhou=3D<a href=3D"m=
ailto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">ChangeLog:<br>
<a href=3D"https://github.com/jirka-h/haveged/releases/tag/v1.9.20" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/jirka-h/haveged/releases/t=
ag/v1.9.20</a><br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" target=
=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../haveged/{<a href=3D"http://haveged_1.9.19.bb" rel=3D"noreferrer" =
target=3D"_blank">haveged_1.9.19.bb</a> =3D&gt; <a href=3D"http://haveged_1=
.9.20.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.20.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/haveged/{<a href=3D"http://haveged_1.=
9.19.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.19.bb</a> =3D&gt;=
 <a href=3D"http://haveged_1.9.20.bb" rel=3D"noreferrer" target=3D"_blank">=
haveged_1.9.20.bb</a>} (91%)<br>
<br>
diff --git a/meta-oe/recipes-extended/haveged/<a href=3D"http://haveged_1.9=
.19.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.19.bb</a> b/meta-o=
e/recipes-extended/haveged/<a href=3D"http://haveged_1.9.20.bb" rel=3D"nore=
ferrer" target=3D"_blank">haveged_1.9.20.bb</a><br>
similarity index 91%<br>
rename from meta-oe/recipes-extended/haveged/<a href=3D"http://haveged_1.9.=
19.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.19.bb</a><br>
rename to meta-oe/recipes-extended/haveged/<a href=3D"http://haveged_1.9.20=
.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.20.bb</a><br>
index 69de5628c4..f055cc2430 100644<br>
--- a/meta-oe/recipes-extended/haveged/<a href=3D"http://haveged_1.9.19.bb"=
 rel=3D"noreferrer" target=3D"_blank">haveged_1.9.19.bb</a><br>
+++ b/meta-oe/recipes-extended/haveged/<a href=3D"http://haveged_1.9.20.bb"=
 rel=3D"noreferrer" target=3D"_blank">haveged_1.9.20.bb</a><br>
@@ -6,8 +6,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.issihosts.com/hav=
eged/index.html" rel=3D"noreferrer" target=3D"_blank">https://www.issihosts=
.com/haveged/index.html</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
<br>
-SRCREV =3D &quot;0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/jirka-h/haveged.git;b=
ranch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/jirka-h/haveged.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
+SRCREV =3D &quot;e2d96806273caa9ce7457e2f8669a3c40517ca27&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/jirka-h/haveged.git;b=
ranch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/jirka-h/haveged.git;branch=3Dmaster;protocol=3Dhttps=
;tag=3Dv${PV}</a> \<br>
=C2=A0&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/jirka-h/ha=
veged/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/jir=
ka-h/haveged/releases</a>&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126954): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126954" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126954</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119293639/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119293639/1997914</a><br>
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

--0000000000006ac1160651ade02a--

