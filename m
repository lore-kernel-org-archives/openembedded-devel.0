Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46EECCD1A4
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 16:28:28 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web10.8861.1760804903155164269
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 09:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmkEDlxw;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e2c7a3d10so367647d50.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760804902; x=1761409702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzNXd+RJXp0hc0VEp1gqVNBkpzix96eVZi5ycXF85DA=;
        b=ZmkEDlxwKCBf8AnhpgVVR24cBMfedT23gB74NwsG9vK89EFWUccqYNrsPBGCGU44Eu
         6RGE9+pWZ1eVBZUiSDl1eSFR5sh1AEpEr9NSQ17o+wafKTy7nR9ETCLQkfA7wzQvEPsL
         +X0gInQ19a97tWGQSNJ/0gg3Jsu8HqGITyz518MZ0z61mwFcFdN/JO/sYr7KcCkWPzrY
         x+ZbcGSYGc4f1fOvCZyTdO54CQFWfhHjxChsE2AlUTblRjv3Ew7QdVdNZq27voA/zjaO
         77ZxIj8lTzLOcpoLJZqDtcw5B+EzZ9cSgQpUI4Gx8CdCuseiz39tNQBQAEwroPBRkX8B
         2QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760804902; x=1761409702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzNXd+RJXp0hc0VEp1gqVNBkpzix96eVZi5ycXF85DA=;
        b=kcplhH+ReyDsBmeUQ9YgtI5yyWikoYkbpGGDPFvuDC2Zb/O1yw61lG5Xrh9urr4SzR
         ajaehNGcTKR3kH/qZeM4If50PECnv5htQ4qYl4R3CDvissFzCvACeCx1YzDLGuETtHcJ
         HccH7Tw1r1MVP0bUvuqpxNErhnbUO0gEW/ywcu6hxc8B2DChfKzcPM246X7YeudZArpC
         39bGZZ5g2u2GHOUKzpWl8sWJ3MhJ8SEJdcyfC7jLK96MGS1Q6tYc67YnimCd9W0tVvmy
         ln+V8t06FhEl0QQkiBXoX7TgZWJV4tyWcsORwU6VUUxBBonbPPB/NJ+QWetvrkSd4d0j
         oy4g==
X-Gm-Message-State: AOJu0YzFnSGjz5jGJ3A44/3Fk/sDECnhXX4MRmqD8x5FnIUH0J4zXux+
	p1fwKOBvfnkvvMmrDtgM/fgMk+V2Ncx0TjtGUgnab7PqDF+Ij1LsqRZZNAq+QF9QZ4vBB4fIdog
	BUg4EB8vltCMZCgCEtQAFcxSmc+MO8PE=
X-Gm-Gg: ASbGncuM1KkVCecOl8/Ifo3lfCIQmjHIFPVOmMoumzsQiig9+w8q2giAHLpWzyjKvXx
	cEePDmZgK5hWw7Eb1QMcHR03s6E7vtvGdyDtdHcA7a7N7ue1Pn7d/gevqA1pw8oflmc8QDRG6hP
	PKKl8MIuBbbN9CNiP7nJPIan8VKVAP4RPXg05+N7ioE+PVz2iTLRw9+WzjDUe0+oT/8Ld24QpEk
	M/duQ/Dt00lbZVw2iwiIo7hlnAIbcR/9NUEtmF3M8Bt1cUsQWppXMBGOg0AlLI/DmPpBpFUo1tM
	w9u/3bAuMdaK3Sd5z93upiifDwFTgQ3SZ0me7rBJcnY0qCnqwMwLKpMJBF2dnJgCyWQRKuGF0Cx
	/RvA=
X-Google-Smtp-Source: AGHT+IFBSmqBth2hNgoC5T9th4tSkleu89Sb6Yi55jP1mAED6Q6l093Ct7VyWVvAh4q8vZ2+NwvUsPLaW6oxfkUkSqw=
X-Received: by 2002:a05:690e:168c:b0:63c:f5a6:f30f with SMTP id
 956f58d0204a3-63e1626157bmr5996377d50.57.1760804902145; Sat, 18 Oct 2025
 09:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251018101937.3979005-1-skandigraun@gmail.com>
In-Reply-To: <20251018101937.3979005-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Oct 2025 09:27:56 -0700
X-Gm-Features: AS18NWBRtp79sPv2-TTLbWk1uG5e5sJcY0leIQoP6Do4h6cVQzz-Hofkg3deupg
Message-ID: <CAMKF1sqbUCQ4Fk6sX8ALuS_bv_4P=gy=a233mcFGeBjjpZav9w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] oprofile: Fix failing ptests
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 16:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120787

Thanks for fixing the ptests Gyorgi, I do run the meta-openembedded
ptests regularly and every bit helps in keeping the bar up.

On Sat, Oct 18, 2025 at 3:19=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Files need to be in right directory structure
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 51b38953a6e7f2769b5f4ac021f55299f3c68b99)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/=
recipes-kernel/oprofile/oprofile_1.4.0.bb
> index 23e7d3d5c3..fb10992890 100644
> --- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
> +++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
> @@ -56,16 +56,18 @@ do_install_ptest() {
>                 find ${tooltest} -perm /u=3Dx -type f| cpio -pvdu ${D}${P=
TEST_PATH}
>         done
>
> -       # needed by some libop tests
> -       cp -r events ${D}${PTEST_PATH}
> -
> +       install -d ${D}${PTEST_PATH}/../${BP}/events ${D}${PTEST_PATH}/..=
/${BP}/libutil++/tests
>         # needed by libregex regex_test
>         cp libregex/stl.pat ${D}${PTEST_PATH}/libregex
>         cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
>
>         # needed by litutil++ file_manip_tests
> +       cp ${S}/libutil++/tests/file_manip_tests.cpp \
> +               libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/../$=
{BP}/libutil++/tests
>         cp ${S}/libutil++/tests/file_manip_tests.cpp \
>                 libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libu=
til++/tests
> +       # needed by some libop tests
> +       cp -R --no-dereference --preserve=3Dmode,links -v ${S}/events ${D=
}${PTEST_PATH}/../${BP}
>  }
>
>  RDEPENDS:${PN} =3D "binutils-symlinks"
> @@ -73,3 +75,4 @@ RDEPENDS:${PN} =3D "binutils-symlinks"
>  FILES:${PN} =3D "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${B=
PN}"
>  FILES:${PN}-dev +=3D "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}=
/lib*.la"
>  FILES:${PN}-staticdev +=3D "${libdir}/${BPN}/lib*.a"
> +FILES:${PN}-ptest +=3D "${libdir}/${BPN}/${BP}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120783): https://lists.openembedded.org/g/openembedde=
d-devel/message/120783
> Mute This Topic: https://lists.openembedded.org/mt/115821404/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

