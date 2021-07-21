Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.4102.1626897832902215963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 13:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dN/J+d8G;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id j8-20020a17090aeb08b0290173bac8b9c9so539632pjz.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 13:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sRYJxjJKdb4w03AyQKU1D1pQuUAq05XyciA6sKY6iQ4=;
        b=dN/J+d8GAYNjiAFsU8TZ5bw5tQ5lDdEFBFX4vd7zt7VGF19EQyZFYZb5t9bkoqhESc
         23+w5CBQPpgImdSvABluc2hPgNaqv2YOUdl2lxVBeXyT2+v8j4Doaij9FnTdxNWQckm/
         zFimFzwb2IqdIlMMzFViDZ5TnwJ6ELlb+ZdsYiFoQ8JSkwWwtVOAP/NbUQxFNvTYRrfj
         ZV+fzWDNAg0QRzOTIpBsWn4eeB1xzflAWiz84QSG3AIF6zyB+blvaUtERi8ELKB4vOKq
         tGpuEuTmTW/gvQmr8t0S+4FfEyePNOKemYseT+0YAdEq4CCcX2U8feiWDu/hLxg6cDm4
         i1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sRYJxjJKdb4w03AyQKU1D1pQuUAq05XyciA6sKY6iQ4=;
        b=s8DBomtNg/JFr5kVGuJRpnkc8JKfc2LUnDISPMakcNOB9+MA5O2dZhsXTeEztAQbfp
         UEDLY00hZJVNY1Wx1cl0n8aEkfnWoj7KCpJRR5xfhKym+KVVJ+pOrQEM5c/nhyO7j7Nt
         AHy1hstTjJ0kupu6HOdjQjZmg1i2bZgR6O8mL1jDYyRUtKdjHslEgX7//h/NhQ0qvUkz
         u+4U5PDVpxSffsR3rizj5PZyrjJnQhattlta1KTQFPUQrFtrDtp7tynZAaDgkIvVbr03
         4xWc2iLzIoSkwqbxGpsGmNJ8CRoCf0+Kh6mqvwKbCGTEyLMZKEJb/oIAWHN9AqdXmmPo
         aqZw==
X-Gm-Message-State: AOAM533Ft45nZukWEhBw5qjE4H5yh775ErLvUuXjbOARzTgBC5yxly4O
	r7HsvO6c+c18tYGsGNDpIURcwlGBVXKKLqJRl7Y=
X-Google-Smtp-Source: ABdhPJzaCBKVwGNBXkBz/B41mSGIxrRBCJC0D4bt7W4D8gdfBIn6T3fasangU03qnGS3XrZxq3BSDVGk6yxR0j5HUqM=
X-Received: by 2002:a17:903:244f:b029:12a:f0f9:19a3 with SMTP id
 l15-20020a170903244fb029012af0f919a3mr29373325pls.42.1626897832364; Wed, 21
 Jul 2021 13:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210720061405.2255027-1-schnitzeltony@gmail.com>
 <20210720061405.2255027-2-schnitzeltony@gmail.com> <CAMKF1src_sGprN3FES8kHFE=0BL5JrP9+xO1Y+cAM8bois2=+Q@mail.gmail.com>
In-Reply-To: <CAMKF1src_sGprN3FES8kHFE=0BL5JrP9+xO1Y+cAM8bois2=+Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 21 Jul 2021 22:03:39 +0200
Message-ID: <CALbNGRSZaV7K_bjQ3esXds2kLX1zRXcYcbsRzkJUS1qrTQw3OA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] jack: upgrade 1.19.18 -> 1.19.19
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 7:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jul 19, 2021 at 11:14 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > Changes:
> >
> > * Add jack_position_t::tick_double, and flags around it
> > * Add zalsa "-w" argument to wait for soundcard to be available
> > * Bump internal protocol version to 9 (due to struct alignment)
> > * Fix alignment of fields for atomic accesses
> > * Fix build for platforms needing __STDC_FORMAT_MACROS
> > * Fix compilation of documentation
> >
>
> this fails to build with clang e.g see
> https://errors.yoctoproject.org/Errors/Details/593001/
> which is not a problem for this patch to go in but I thought you might
> find it interesting
Listening to clang's complaints is usually a good idea. Added it to my
TODO - may take am in close to vacation panic...

Andreas
