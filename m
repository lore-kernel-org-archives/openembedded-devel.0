Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.36529.1591016848334931191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 06:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Csn1R11T;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: jonatan.p@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id c8so6784197iob.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZZry9phU78wOu2Iai+f9t2Pewz1Fa9YJ4O0LrPC8594=;
        b=Csn1R11TVOZ4LbDMEF/Nx+8EN1o4+qnYp3c0Xu2ztCgLvd3h3HhabP21wWIZx+6hIL
         /fBcLl8cXbE05XgK+WKbRBo2cVo78yZmhSG9IGqFCZ32kf090O42wHsksM/KdKuG5gfQ
         VTeHgKi8jRSQ9Nb6WAVMHQUPyXjZYQYbMC/6G9V7s7x7Hbm6uS7JbLYDs3xU+U9p2koD
         W/VB8h6+G4uoi5i+H+B8oX4bl+/46RpSpewy+eRNHdTaU0swnG15Kyo57z8cv+AqNABp
         NG9zLJWtyYJCK8fI1VT9I9JHg2NJJfIQRLhSziKyNJTXWadZeJ1q8AwjCq8caIMwfCwq
         cUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZZry9phU78wOu2Iai+f9t2Pewz1Fa9YJ4O0LrPC8594=;
        b=k9m1ph52wCdf/qqntcy5rj2GEFq3iAHwGy32T9s3sYgLmO/5At0/ohuOTOhTQtQhXc
         q5bMSSyCMivJbiCM7PCBkB+ZzQUeTPvq7qL78Juul0yjVt2eYUKxFdD/34kssU5GSGPa
         GpEvpkqBvQH3tVnmq4PeV89vBQ22835Avt4YtAT8jil8104S8NfAEOJMHxajyu9R7U38
         tIPi3dTRG/iwblP1nWBnDBc4qZnRoj1E9vyG7ZS3w4V/PNHRFvL7rF96718TcJN7LNM4
         75VhZ7HbmBbxdow4hjBniT0hzh472yuONNgDKJwH1xgfR92pxChND3+BnbHAney8Yc17
         TcFA==
X-Gm-Message-State: AOAM531XVeTGHhwq8jbj1PV/MySjcFdOCGt7z6+KLZA/sFI6oU61QxnK
	5EWQo6ZsMKk8ea6/56JKDkE3NSVkv7Vzv9OR8eg=
X-Google-Smtp-Source: ABdhPJw6ECLJD92B2DekOqAojrm/7xPCI+DRX8XDM3ghr1WQxjcShcitcJifciRX84hcTVqoI21ImAtM4mz2ewuDUS4=
X-Received: by 2002:a05:6602:13c6:: with SMTP id o6mr18364557iov.84.1591016847749;
 Mon, 01 Jun 2020 06:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAKm+giO0HyHER+MkPyiN0GQou9j2Jsc6AuGTp6TyVBeHQSZ9qg@mail.gmail.com>
 <CANNYZj8dY=UPEqW6apNYMWQVofG7omUuyECdBhyZ-WcvtO=iPw@mail.gmail.com>
In-Reply-To: <CANNYZj8dY=UPEqW6apNYMWQVofG7omUuyECdBhyZ-WcvtO=iPw@mail.gmail.com>
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
Date: Mon, 1 Jun 2020 15:07:16 +0200
Message-ID: <CAKm+giMY6-6dsiOCgjDegX2OPvmK2456sp_6542UBA4_xzcEVw@mail.gmail.com>
Subject: Re: [oe] Rootfs conflicts when using multilib and doc-pkgs
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander (long time no see!),

Thanks for clearing that up, I'll go ahead and fix the manpages.

Thanks,
Jonatan

On Mon, Jun 1, 2020 at 1:48 PM Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>
> This is intentional. We do not want to special case multilib variants of=
 packages, and they should all be co-installable. The correct behavior is t=
o fix manpage generation in foo, so that it is reproducible, and either doe=
s not write the build timestamp at all into the file, or writes it based on=
 SOURCE_DATE_EPOCH (not sure if the latter works as intended in 2.6 though)=
.
>
> Alex
>
> On Mon, 1 Jun 2020 at 13:20, Jonatan P=C3=A5lsson <jonatan.p@gmail.com> =
wrote:
>>
>> Hello,
>>
>> I have a Yocto 2.6 build with multilib enabled. I also have the
>> doc-pkgs IMAGE_FEATURE enabled. I have issues with lib32-foo-doc and
>> foo-doc both installing manpages into the same location in the rootfs,
>> which causes conflicts during do_rootfs of my image recipe.
>>
>> The way I understand it, there shouldn't be any issues with having
>> lib32-foo-doc and foo-doc installing the same manpage, as long as the
>> manpages from both packages are identical. My problem is that in some
>> cases, the foo package is cached in sstate, but the lib32-foo package
>> is not, and the manpage contains a timestamp of when it was built.
>> This if course gives two different versions of the manpage.
>>
>> When the doc-pkgs IMAGE_FEATURE is enabled,
>> IMAGE_INSTALL_COMPLEMENTARY is populated with "*-doc", which matches
>> both lib32-foo-doc and foo-doc. This happens in image.bbclass. My
>> current work-around for this is to set PACKAGE_EXCLUDE_COMPLEMENTARY
>> to "lib32-*-doc" - which filters out all lib32 versions of the
>> manpages. In the vast majority of cases, I suspect that the lib32
>> version of the docs and the "normal" version should have the same
>> contents, which means that keeping only one version of the manpages
>> would work.
>>
>> Is the inclusion of both lib32-foo-doc and foo-doc intentional in
>> IMAGE_INSTALL_COMPLEMENTARY, or is this a mistake? If it is a mistake,
>> do you have any suggestions on what the correct behavior would be?
>> Excluding all packages with the MLPREFIX seems to work in my case, but
>> it seems like an inelegant approach.
>>
>> Thanks,
>> Jonatan
>>=20
