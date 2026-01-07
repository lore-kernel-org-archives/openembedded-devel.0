Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57897D0D163
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:27:08 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13146.1767810424642796154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3TGLAy6;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4510974a6bbso980618b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767810424; x=1768415224; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA0VPLxsc8/Y85duNspheFsMUNY9ZoGvWHTyvA3yL1g=;
        b=Q3TGLAy6h1eeYkEnZ8mg2sbK07nWeltkL/xDuYcl0AGj3ZpKCldq7IGhrs5HiPGH5+
         ZnseytFHu1JI+ttQNO9Wc8or++xa1zSBol0NySw+h+UVi5rbxORD4uEOs8/iJbu04z/a
         rNCzNvmicCzS/mrx8iKunKuYW4OkdnX8RgSa0sR4WvDxXVnCIGApOcAI7TcU+gMRphFE
         7U5cyV0ZYc5QPI29r75V2MWUnbpfYLL65km9+8IgIB7TIU+UjLKx10G+dHS4pRHw9fds
         j1vVOB+7/a93/0FIVpVOLIseZF5WbvAbu7mzxgIEaobv+6H7lPRfGPjZY6bG14g7VEYD
         vEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810424; x=1768415224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IA0VPLxsc8/Y85duNspheFsMUNY9ZoGvWHTyvA3yL1g=;
        b=n6ZR22t1QkVhcnSv4V1A/7FfGivBkixGwb/M8SNcNng3dH3qgoExEq7qL/X+yuOYvu
         LwjIOwq25m9V+L1/51WDHwI2G8F3oFh6BpiocyGRjnKQDBV+31BEpmRbGhrDKJhT45ZI
         y5TUIgIu7mIwXvL9fCkFIRivLMKwAeBlMY/q/0UsE64iFBSQWt3giVFqDBlaVF1Bpofh
         9icsjqyhr6SR07LEfhwRq3uBj9lByNQrVpGrCqUo23W/x+fbkXmpCa4cTtxwIljsVrig
         VnVN6KZjwD8B5T4F6uf3OMl2kY47prCiXzdqSUn6fM4jDqcBqr6y6vy6KB16drR+E6NN
         u6sg==
X-Gm-Message-State: AOJu0Yy4jBOBLTorYpx7Fr4Kca6ZM98/qRAl70CgSjo2eoly4IYVACCI
	VnDH9oMSw1uiNZNZmyjU+PPftjFois9l+Fs/b4vGgyQcZaRxa9SlWVAb3VTELyK7RKIEzzoUFLU
	eBib1BMameb+sMtD1ISBufT/fYr1dLsY8OA==
X-Gm-Gg: AY/fxX4HyhbsUMlQ6recSmNyraFaN+iIy9D8ajNBkSSHcKvadmR5TvNRQzqfUEDRogJ
	0l8oF6ueMkdmztrseIRGcqpew8lfb20+51z4D8n5mWTMbIO1E5dLN+f1HzqGobm7Ubck2LcpJas
	iXQih/kmZpwHfE0FoOk0ikszoVg5duGQGhpJludrN8ykWwcIRki1cRVWs3J0SIDMX70zfgGLnMa
	JTNrxd7QXCB4dEMz3onfZ5BYic3296tI8LuPSfcewQBWPLi2PpQZKjV3107Gn1uohs54Aqb
X-Google-Smtp-Source: AGHT+IFfPVi/31CmI5sALsq0fUl38PWqPE6HiL+SJptHJA585OgUoE78yAbPEfAp3vYEEzZ6OIohQA8DT4M3It0nXX4=
X-Received: by 2002:a05:6808:181b:b0:459:b3ff:f0ff with SMTP id
 5614622812f47-45a6bede366mr1358461b6e.37.1767810423841; Wed, 07 Jan 2026
 10:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20260107181140.1026336-1-ankur.tyagi85@gmail.com> <CAMKF1sruWosduHTCySJC7EjSmA+G0jgNTxse+=ckp=Ap6-Y37g@mail.gmail.com>
In-Reply-To: <CAMKF1sruWosduHTCySJC7EjSmA+G0jgNTxse+=ckp=Ap6-Y37g@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 8 Jan 2026 07:26:52 +1300
X-Gm-Features: AQt7F2oulQp_dJg3nMtQ0Q6jEpHjFCeyYZQI2bRwbGL5Gj1widcJxhZcZtgfDlA
Message-ID: <CADySD0GRdbw6Z1ho5MewFcTkJHiH2K89VX2wjRhmQY1jeE4t6g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libjxl: Fix build error with arm and musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123234

On Thu, Jan 8, 2026 at 7:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Wed, Jan 7, 2026 at 10:11=E2=80=AFAM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Build fails for qemuarm with musl with following error:
>> /build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sou=
rces/libjxl-0.11.1/lib/jxl/convolve_separable5.cc
>> | error: out of range pc-relative fixup value
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb b/meta-o=
e/recipes-multimedia/libjxl/libjxl_0.11.1.bb
>> index 7b0a6db9fb..ad5b5d169b 100644
>> --- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
>> +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
>> @@ -46,5 +46,8 @@ PACKAGECONFIG[sizeless-vectors] =3D "-DJPEGXL_ENABLE_S=
IZELESS_VECTORS=3DON,-DJPEGXL_
>>  # lcms/src/cmsps2.c
>>  # error: out of range pc-relative fixup value
>>  CFLAGS:append:toolchain-clang:arm =3D " -fno-integrated-as"
>> +# lib/jxl/convolve_separable5.cc
>> +# error: out of range pc-relative fixup value
>> +CXXFLAGS:append:toolchain-clang:arm =3D " -fno-integrated-as"
>>
>
> in meta-clang we have following in nonclangable.conf
>
> SELECTED_OPTIMIZATION:remove:pn-libjxl:arm:toolchain-clang =3D "-O2"
> SELECTED_OPTIMIZATION:append:pn-libjxl:arm:toolchain-clang =3D " -Og"
>
> I wonder if this should be removed now

ok, I will look into it.

>
>>
>>  FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#123229): https://lists.openembedded.org/g/openembedd=
ed-devel/message/123229
>> Mute This Topic: https://lists.openembedded.org/mt/117138971/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

