Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.8786.1612630754814892311
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 08:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oCeiu8Qn;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id r13so5047724qvm.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 08:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cOHtFOz+9SDdB9vRTmqbn5V/BLNwusTiz+DHb6Qj25w=;
        b=oCeiu8QnUKcOli9Zfn3ZWBcNZYRCtIKa1VGsUoDvTdRB+XlQz/TmWz+Q04qEpcKiEX
         T/nxHmtvq/ts+4YLWsUs3mxt2aXGsz6R9IPYm1wsMBZxefE4hvo6OMSDd0DepSEG7PSB
         X4ruAWHj2YciwKc4M3Rv0eo8fIfJf3FNaHjR9zK2BqaKxYPxbbRMlyMco4X18Xrq3dab
         7dNYYOJCOrNH5dcprwK/wwYrxQXLW6hM1I6ADMc+F0Y6zpeMfsz1SDzuw2EmOBLUhj/B
         UeLfBWBnaporyUqpLAc6HDokAaxwVrraWGBpWN64OeeoVQMaQYNVAX0xNxtbbb8Ix2dP
         I3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cOHtFOz+9SDdB9vRTmqbn5V/BLNwusTiz+DHb6Qj25w=;
        b=AdFegOADmf6s6IJKloEYv7/wGBe8IcFeKizJQ6w8jpHlr/YHokZNEG2YPA0M9BRrYb
         SEnARPH3f64iVB7XGximCOJVnRoKAC+9lBkmaQfNe4fBRwMPttP0JtEcP74wuWF0FKqD
         hcSEJbbQ4vdo8BjEi3fHCzrwDhb0VmS40uwwEgIeigzeUTo0//AzBVNtoPax3wUOVyJX
         5FmmNJlUjNh7OKpzblCLRfM3vkNmFzGqvMGzUx10Qiz6OpUDmfm40NHQQj7CPrCwxexo
         kimm/m2REJX6OU6z3ktpBxDBoSn5exfkF0CQwO973plPx6irCMeKBQOSbDsvIYPxjN3Q
         XplA==
X-Gm-Message-State: AOAM531rKBteTO6J+NbX71i+Y5DxEQkQZKLCfNahbae01vADqB8hvsH5
	bLSGJ7GIgE8RmqWmnL1jq+5qxBKkzb5VUiHFQ1wkbtm1QBZeTQ==
X-Google-Smtp-Source: ABdhPJw5KykMpQ+Ja4k3ahICOpVYXQjziF6r08yLd+zUByI7axcU8TovDFFTpxdAaBdfBVHsurUSS+ByLWPwALFuTkA=
X-Received: by 2002:a0c:b92f:: with SMTP id u47mr6692538qvf.8.1612630753866;
 Sat, 06 Feb 2021 08:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-5-leon.anavi@konsulko.com> <705cccd4-b386-75b7-374d-5f89484df713@windriver.com>
 <CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com>
 <c2d93155-0eb1-063c-80a5-d51d03bb1c03@windriver.com> <7d8982a6-7b76-53f9-70d4-6eeb204f9489@konsulko.com>
In-Reply-To: <7d8982a6-7b76-53f9-70d4-6eeb204f9489@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 08:58:47 -0800
Message-ID: <CAMKF1sqWaUiUtweHRwcHjCW5FOyzBCn0KCVgWk6rdAf_omdBXg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 6, 2021 at 6:00 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Hi Khem, Trevor,
>
> On 5.02.21 =D0=B3. 21:56 =D1=87., Trevor Gamblin wrote:
> >> hey Trevor can you see the musl failure I am seeing ?
> >> we should hold it until thats fixed.
> > Alright, let's hold off then. Need to add musl builds to my pipeline...
> >
> I have an idea what I did wrong related to numpy versions. I will have a
> look.
>
> Khem, btw which version of numpy did you have on your musl test setup
> when it failed?

for CI I use yoe/mut branches of all layers where they are based on
master or master-next of given layer and for oe-core
its using master-next
see
https://github.com/YoeDistro/yoe-distro/blob/yoe/mut/.gitmodules

>
> Best regards,
> Leon
>
>
> --
> Leon Anavi
> Software Engineer
> konsulko.com
>
