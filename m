Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF6CCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 08:55:13 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9314.1791795303127830436
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 01:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bqhbyBTP;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4932b13c4ccso1038594fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 01:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791795302; cv=none;
        d=google.com; s=arc-20260327;
        b=ci2aGNUwJSOnN5ENTdy7snapii/iKEyV2Mc1xs9hnS8WW/64wrNb276O9Da1TLQb/X
         3t0rYkIUuOe7wAJvp+juEgvSCPkR8kNgHM2mYV76XlGuNtDk2oWchi+0VC2pBQKvlkxd
         TOtuAX3Uyxqfo9E20X1XRipqMGRUidT2dqWt6728HqeDUGKcHDIh3QqSgDmiIsfxVLsZ
         jvBA1J31seeR+8JQhKqhasM0p36jIt35MMSEW7vPK/Urqx07CGLi478k5+ertF4D50CN
         o8HJ6l87DOAg1/8yf28pnGLDS0hsnpLqEL01tfVT+2Y2Zroyl61h3l8BlBPcKJD6zTfp
         7JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1iBAznkwTdkMDyKWqcQDjaM+hTLJpTr+LQDy+ec6QHg=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=guUyaXEQro/uiCsU5n4q4lIE+bAIYEj59abtVrV60e+1siP5ot891QnIy9ZQwW/lGx
         xPAYH/bmOUQdwMEf3d53UBfkhxSvLWipOQNtsY/Ag632heEFjY1ivfjE5FoErhmBRMIV
         NQc8xVszq0SjnDO5T94Ez59yhttPHzrdCkhDOejPBSwe1629eXgb35dpKtGzsLR2H4n2
         BZlO5g5c46bDdKUFqfX/FJGNwgB8XYj61XwNGaM2TPg3tr6tMP3lFFZDFFARtCjOm5qw
         +5m55mCrw9ArAXUpswqvYO6b4V7vG5vmzKHY4wzcR9bexVJLalEnA3TU0C+7L2r7CzmC
         IQkg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795302; x=1792400102; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iBAznkwTdkMDyKWqcQDjaM+hTLJpTr+LQDy+ec6QHg=;
        b=bqhbyBTP7VgNohjcVpc0qw4juXEXV8gCNA+HjQKRaAsL2z/WXDW4FevC3RlaKcqqoO
         GzVcd8HJosmXqV6YVplpJu5J0D1MC7EgEEqWR4reUrTsbkXvzMBZcGnZg7A4z+8pEvkA
         /wV6G9RukTfv+4YsGBOS/mcIhpNf6K5kTWK4cBGc8ZWEvk1Xpi0aP88xWi6lHG14ZaNj
         Qn2LADKgHL6H1tKK3n3Ymut0G2B28VBNYVTdIPsFv4orYj6ghujlWWD9+/7Srt/DLv8+
         poDaMleX4eH+KB9a4KF/DbxPRdJ66R9RU4TUt/pkKuXWOxpjoCB4ksykPz4vxj2jNJ3v
         o40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795302; x=1792400102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iBAznkwTdkMDyKWqcQDjaM+hTLJpTr+LQDy+ec6QHg=;
        b=hOlLVv/ENkSYn7vWv/iO8O0vGMNsCofp6FkECp+vlhGAYDG/TtJHz1f5FzkMXzL22a
         sTBdn63J5aVjDxFi/Kg1v3T1wBxGZhNpvnK4xGan5M/cpXQjzpk0GDaeBWzHQUKxej3X
         tU/91XwzHsjC7eCsLXu6tawtASv0N+sxCOqUdW2QIlZiooeo7/xtKSXSYFLDcAksKTsb
         AiIfKdlrfMDmgX8ZEo9zgfBH0RImB92GVr2tYH0PEWIzcyw4wnlT+7KCiqcaF+TIHccf
         88apO0g8IMIe7rW+gSBQRhpTEuU9Sfg9boRwo3QjeugNW8zev9cL6tKrgMuHSnOkMggz
         Citw==
X-Gm-Message-State: AFq9FYKcuJpP+X8iZ7+/MI1+pEfxAIl9CRdrAktQgx0hrth7HRdmEvvE
	Pc7dNLxjhxpIFWxflCNjtvnoaHk2sVai5/jipW0IxkhL61kfR7eYUlFbin1nhwETNcgv3jnCKvF
	/9uyncHvwDq28TMcEsrebGaFDORwnUP0=
X-Gm-Gg: AYBFou00skXw/gnV++jr0z8txsYblMUSJjgRFy41dCrPeAKbfYSmZAf2mTjzlI8XKor
	qOVuBMcdGo5ppZ5vARaCPZMrGynb1fD9vgrfcJeJNV9Y9TvzXdvjkThEFLLmqZtj4YPM04svAGc
	IXv/P58wz4l8qCBS0VpOeryGAkqhMppmnPxcuFBOE3l+ZU2Vo+TSgRYgn4z6q4SwOZ+wvcgMboc
	VDYUeHnJJp0gnQUjLFSiZatKR2/DlTlNQ8MjDfIjPd1eJWkZp2RmGoirhZUSpSFGb1jiMG2VX3/
	Tk8c3UtYMI8EwrAUblPccFb2f6t2/4u4/ug6vLRRM/7LgjBdmzB9dBFD4SV19ahMyN3aig==
X-Received: by 2002:a05:6870:4ccc:b0:491:8695:3323 with SMTP id
 586e51a60fabf-4a2a8a5dc6amr7047521fac.24.1791795302255; Mon, 12 Oct 2026
 01:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
 <20261012001007.2541673-18-ankur.tyagi85@gmail.com> <CAMKF1sppXBtPARRGX48+TFpxbE1Fvm72fJQipnH5t8Tu5MN1mA@mail.gmail.com>
In-Reply-To: <CAMKF1sppXBtPARRGX48+TFpxbE1Fvm72fJQipnH5t8Tu5MN1mA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 12 Oct 2026 21:54:51 +1300
X-Gm-Features: AclHuK9nLT2JjNwU6_in9I9XkVYHztT842AlMw1cVxz21QWhpQ1mioY0p-yeHmQ
Message-ID: <CADySD0E0+6V41ZX0NZDJyF6GOUuzsRUCVsLhUBLTRt0JazzPgA@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][PATCH 18/28] libde265: patch CVE-2026-54240
 and CVE-2026-54241
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 08:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130759

On Mon, Oct 12, 2026 at 6:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Sun, Oct 11, 2026 at 5:11=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Debian identified same commit as fix for both CVEs[1][2].
>>
>> Details:
>> https://nvd.nist.gov/vuln/detail/cve-2026-54240
>> https://nvd.nist.gov/vuln/detail/cve-2026-54241
>>
>> [1]https://security-tracker.debian.org/tracker/CVE-2026-54240
>> [2]https://security-tracker.debian.org/tracker/CVE-2026-54241
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19=
.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
>> index a02d6dd5d8..8e145cf8dd 100644
>> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
>> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
>> @@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/strukturag/libde265.git;=
branch=3Dmaster;protocol=3Dhttps
>>             file://CVE-2026-49295.patch \
>>             file://CVE-2026-49337.patch \
>>             file://CVE-2026-49346.patch \
>> +           file://CVE-2026-54240-CVE-2026-54241.patch \
>
>
> did you miss adding the patchfile ?

indeed, sent v2.

>
>>
>>  "
>>  SRCREV =3D "824b4138ecd51611d7073f1b50d5d6f982609b06"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#130743): https://lists.openembedded.org/g/openembedd=
ed-devel/message/130743
>> Mute This Topic: https://lists.openembedded.org/mt/121708410/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

