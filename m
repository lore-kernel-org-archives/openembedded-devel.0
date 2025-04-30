Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67D1C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 01:54:26 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.7312.1745978057232764394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 18:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYw/fMsa;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fe83c8cbdbso2106198b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 18:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978056; x=1746582856; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6z4FFjrMliHZbBaU8zhSXy22l0f5CTVrv9IfzMfQqE=;
        b=IYw/fMsatIX+gSBSogS/6hG89JV/FCJdK1MZz/9l68cgmLmSnlKs6WKE9b5jVFhIsd
         iDPhecxpYCk9q34uJMfvlSMMo/I8j/CMGgNafteFA3dZMjD3yn5784ILNNVPUmP4+Xk1
         UIz5jPvTjyT3/hq5BqxsT6d1D4bopOYfpv//9IgkoQZyy24UVySM+c7VHztwGnyAe2Zv
         LLI5OTRh3+wQ8XYSeZMW6HQ/AVEty1uugaT9JYIVJSbWAQmCXveKmXC/J9kcmJ8puoGg
         oahlce9oAoR3+SxAf+z13Un5J4T3lBNLEW9v1dGnJT+3M2oINHJk9D7szGKvWzQHkYvA
         uvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978056; x=1746582856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6z4FFjrMliHZbBaU8zhSXy22l0f5CTVrv9IfzMfQqE=;
        b=cF4WA6ZC1fnq0vGUJTe+WvDRHk0pHt6zAcBJPmrBmZpXgfGpCqOv8TN+wPJHMc4bUt
         hSW2PkOlsG6RFEgIYG4tclDds3iUG5Y/tmqEE5KhHdULDfn6Or9J9LbTPd/Lvn1vnyrx
         e0kvizLFx8G/pkt3/vA8uta7Xqzw/G6IebvQUWs4aLLDvJqS0VtUn5/MGAEgDfz2uHRd
         bhFoaCvlJjzpdiSCKOjnnAhIYDA3z0t7u7clqSs71Y1KVv09wErL8ouIDunIKynw4NH9
         0fqI3vxHQTOh0t02n/CgJNTyxSIsClRlm8N5Gk8x1vE5A8PqtABFoWG6mSTIX8T9UPZA
         VyYw==
X-Gm-Message-State: AOJu0Yw0UCWR+ruX7fctnzVnzg2WF+GcZWalpQSeoFgSvFQWR25UwZ0R
	pqoLKDMrtEfG0PCaDFVtI9752OBDsjFDzMH726aghfwd0MATRXfbFQnrG6oBGjw0OrPPyTvXMD/
	tWFVB+QDooDB8/PM0RVsnZdp5eMg=
X-Gm-Gg: ASbGnctPh8CGs0Cm7jv5I4KfOL6RnV0P6uI4vBed2UdxJSzqqjXnGryRicGapbLBGkL
	MyRFSwE/ga3cfej8Lwdn/VgtlvIsfzJ4SP39iWwQRiegQHj1In9TbeEk7IqVpGpeF7fm5uVw10N
	StAxi09wVhljluZVaU2GJ4
X-Google-Smtp-Source: AGHT+IG0OxGBNaYP8DjmHvWI1qsVy+8/kBwmBVPODAG6ntsnlMyBqKRYZ4C+FMyyag/uK/TTfs9AGOzwsrSpnFbMObQ=
X-Received: by 2002:a05:6808:338b:b0:403:290c:74a with SMTP id
 5614622812f47-403290c099bmr75096b6e.20.1745978056398; Tue, 29 Apr 2025
 18:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250429172122.50669-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250429172122.50669-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Apr 2025 18:53:49 -0700
X-Gm-Features: ATxdqUFp5j__pDBNve4Gby720rmGC0DWJUlndkobb2REaNM_i9gPeZvdgcCc3Q4
Message-ID: <CAMKF1srzC2aNuBgLVVfR1nOHC=mphjfj30_a55NNNp0bMQvXqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 01:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117246

This recipe is already part of the repository. So you need to do git
mv to move it to a new location ( recipes-support ) . Commit, test and
send the patch.

On Tue, Apr 29, 2025 at 2:59=E2=80=AFPM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> - Simple, stable, powerful.
> - Apply for embedded devices to PC, server.
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_1.0.6.bb        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0=
.6.bb
>
> diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb b=
/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> new file mode 100644
> index 000000000..dedc07668
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> @@ -0,0 +1,20 @@
> +
> +SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful of logging librar=
y in ANSI C/C++. Ready for billion records."
> +DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o external dependencies."
> +HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517=
952ac7c"
> +
> +SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps;tag=3Dv${PV}"
> +
> +PV =3D "1.0.6+git"
> +SRCREV =3D "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117244): https://lists.openembedded.org/g/openembedde=
d-devel/message/117244
> Mute This Topic: https://lists.openembedded.org/mt/112517962/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

