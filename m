Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2769.1792805717101914948
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 18:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UeDKEF/E;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-483c607ccb4so782654fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 18:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792805716; cv=none;
        d=google.com; s=arc-20260327;
        b=lzclDA+KvwSEkub8uycduFVxscHelFOemHb6Yd4DhfCNzR6mxb9LCAfwZ59xRBTcAP
         353ZjENDcKhoFI4o8lEVOBBwBVIlY82WdBxrCEhIJDGHeDVgy6jZOJG1dSMjmB5qzcgI
         Jn4CMOMHkjPo6ReyMBPibcnU1aWjLGBqJfy2xwzt1OyB323pCvGglcD5YN/f3qMNlZdp
         kxbu1gLSsnXtZCpU3NdS6bIEJmC3ECE90ABerFQ5n6ua5+tlEfGrzIwIWvc+jJs4wD8a
         riIUDQBTdI/niqqKR5Ci35Q+puKFAFE7aV333ymxxiL0OpCITbiS1ayvCZG7MuZsuaOx
         v+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31wfwi/CXoxQ2MUU6Zre+F4cNvgjoSDKty5WNWs8qyk=;
        fh=XOI6TtVZPT4M4+St2buSvvvpyffvGrE/xpgLSZrQNok=;
        b=RihTkL29AMOZMxLnkYb/AGm7oUl4fGj2O531/sepv+vsT37WvTwfGAMtUAe0ItDja0
         PUMafsIXiL8VyLAWcqY0c2tIspa0WF3bivPBnsD53Jf6P0VC0E+VGFeUrW9aFPzU+Mtx
         ELFftBCQxvu69gnBxFb7/L0bSD+hblmDFPlbNRRH/lSJvhxYvmM7iTqpLqMmlmXhbgV1
         CTPsLXpAENldWaLPlGSIYGoF9NTqgC1nl3XugoCMsXorQy2THuL2mXM1+CqY8yMmww2T
         17STtxKIR66hskgXJly7wbHxsUEUxkJQ9KWAH6Ac553bKMxgY5UhLSnTDogJg4ttyJR2
         n5Fg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792805716; x=1793410516; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31wfwi/CXoxQ2MUU6Zre+F4cNvgjoSDKty5WNWs8qyk=;
        b=UeDKEF/ERFrzSju6F7omrhpzs9103AOHskogBtaibWxj1xvdm7VoVtLWiD5XW/KDP8
         5bmgNPY3moGHvv8aeknNZPZXDyTJ+s8xBcEAL9hk+dFaAndRfroeWgUegFAlfvNr1HGD
         Q+eahoJ2d77wQ46+zNa+0KZ06RGXMSoqlR4xubBCVENeslw37hoJA/BzoOAbB/5E63eK
         6+eVZAME3/BIIJ+OO0rRLuCRM+eVDORcXEhfanXgJe3xN+nfdPCCwY8B/c7qiXoQStmH
         Y1PfTjGJj3OnHqm7S1hE7xGXqh1dw1i0Sa26i0dXDE/rz8PyLKJKox9i2ldfEAoIwjWW
         I5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792805716; x=1793410516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31wfwi/CXoxQ2MUU6Zre+F4cNvgjoSDKty5WNWs8qyk=;
        b=vjFRAM1bJoA+wt5wLLzD5Pl4qxzqyp6sSWgZ6y93zZurtz45PBQNpRyr/7Od4BGDab
         sY4RQxKKHRy/Sncs52uStC5rDwFvxgNLIloxSBOt4DflxpBd+OXah7KOYgZBY2h65S5Z
         19947xNo89pE0QjwoOZO65gHaT+LUkjKGTALa7EhwmTjj/fx0odKpEsssXCHz8kWoxzC
         xs58V1ObH2R2iKQfZpsGeJDDRO4j+9cRsgyG6+R+k+dpFzU9ja1WGHfNkJRQ01qdLbRc
         QMzsmdb0RzLpx48p7H74O3TS5OyXMR+hNNKnTRuuLwDNJiivOLNrlsBoz6W+aVaglGxX
         OrBQ==
X-Gm-Message-State: AFq9FYKoWu4+AyNHf3Ve7paoihC3A14jksOwwS451MMXdHxYPZ02w3Jb
	alENtOdDy2JoCU4Bp+BkG64YEa6qzgNVDpmC4rUWaVctM4NAG7Wr+Vrtqq6H8gvNPnoTOgANeVv
	707/GXP/aqV1wuB1g++3qxuMm8CV/rxnN+/ru
X-Gm-Gg: AYBFou3S8jxYwosDHmGEV4kUlEleFpeTAnHSA54x+A9t87tdwiernuz3QPq/r9hzFNQ
	viSbP3AOCIanG/I1bArbhMIJYOTIlsp2mc/3rPQKeDD9AU+a0wJlyzndlfBSN59vsubxECZ8BsN
	pAFsM2389q/S02/c6sXans7kF62P0GAPWN4Q1VZxtG/zzvH+t/cDasdCd48nTPBj1MheWeU11aA
	nGBU5ua8zZQF6n2oEw7kWfm5IBkI1/sf9Ky2/ZgWbTR0YAzv1A0GlVUMSvCRutRjEqsDRdjLi7h
	xybIraaeU21e83XoLJ/eukvKvwL9pKKpEjesKDcpjB44Tj7uUF65GY/bWrkh36/WYrKTFpnLDj0
	SnYT4yeY/PhFw/cwVbeR3U5BIuYDf76P77dXUdzRlFVAKApey2ttUaGBP+DH2aw==
X-Received: by 2002:a05:6870:898d:b0:491:a2d5:ab31 with SMTP id
 586e51a60fabf-4a83f4b006bmr710177fac.12.1792805716220; Fri, 23 Oct 2026
 18:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261023154925.3671992-1-ross.burton@arm.com>
In-Reply-To: <20261023154925.3671992-1-ross.burton@arm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 24 Oct 2026 14:35:05 +1300
X-Gm-Features: AclHuK88ZQF2ei-x6lTerWTqBsiBhIocqv5QI-2Fx4VSE7E2QgRiWMwPvI9fNNE
Message-ID: <CADySD0H4P_ZNHP4rokOHjg22ypd83P9Ykmnkey4qP1+HfQNqMw@mail.gmail.com>
Subject: Re: [oe] [PATCH] brotli: upgrade 1.2.0 -> 1.2.1
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 01:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131392

Already sent earlier
https://lists.openembedded.org/g/openembedded-devel/message/131308

On Sat, Oct 24, 2026 at 4:49=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Just one fix:
> - CVE-2026-111497: out-of-bounds write permits remote code execution
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../brotli/{brotli_1.2.0.bb =3D> brotli_1.2.1.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb =3D> brotli_1.2.=
1.bb} (83%)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.2.1.bb
> similarity index 83%
> rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
> rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
> index 84495a32360..2db266c2fee 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
> @@ -6,8 +6,8 @@ BUGTRACKER =3D "https://github.com/google/brotli/issues"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1609382f94635271=
2a319b4b"
>
> -SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dmaster;protocol=
=3Dhttps"
> -SRCREV =3D "028fb5a23661f123017c060daa546b55cf4bde29"
> +SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dv1.2;protocol=
=3Dhttps"
> +SRCREV =3D "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
>
>
>  inherit cmake lib_package
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131377): https://lists.openembedded.org/g/openembedde=
d-devel/message/131377
> Mute This Topic: https://lists.openembedded.org/mt/121902538/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
