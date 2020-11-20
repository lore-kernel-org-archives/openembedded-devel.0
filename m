Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web09.1862.1605913111214405091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 14:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TD9bfpq5;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id l7so2106854qtp.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 14:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AipRvWwIjxmGKUmF1gaaUYUD3Qcs34oVk0vqVAzYW58=;
        b=TD9bfpq55BoG+d3nUFRBflmzBod8nDNOUJmCmm+t+7/p+2lraSeLaqDaUuMcXdojs1
         yl1Y+KdHAzw5XLjBEQzIZVdVRN4Uc0i9zP/fVZFVf4metwaWN8NWOiOCGncBIlCrRcUf
         s6vMubpYy9Ncs5aueZcuFXYOX6qc6Nk6x/jM1CjSrlH3DV6wjU85ceYcx291fRKj2SJZ
         G7g97un5DvzZ6HNL4cU7I4/yNmy7dVnGybqQcB+RIouaq5Szqozh+VLtcXz7e3ja88AC
         yLRz+JsGfhibrPMf+KeRuuZ4pa4tWb5uQDtC2oEFrZDThLr4y+VNtSo+DEUJSmicSyiE
         fBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AipRvWwIjxmGKUmF1gaaUYUD3Qcs34oVk0vqVAzYW58=;
        b=Dq0al71A9ITVCvHxXV6MGKThK9YrGehQauHUCFHu1F/o4rbXtZ485ezw2I1Rm1iYJy
         43mPHpZShLhgoG0W0j6BESOXXQ6Uypn4OuWqj+INKIkI6NmLwgjQjgpXOiws9i6FXXzO
         8/o25SikBEHPw+87iiDtHG6JPiejQFpvmhgSsgGZ3UpMo84MOMGOA1LGBZGMHssav12K
         Pn7Z0UTUzElvVXFC6rZne+v+KB1E1qYNZEsdKu80xmsiO+eWjH/SlIPIK6NO+F7mzZhA
         JNUfqK8P26J3qRCjaGsDnmF4xzJ5qsiRMd650ie1trBn1/NJ6ZkReYUAlCE8Bz7YD1GA
         cBBQ==
X-Gm-Message-State: AOAM530+SafgddjtUhuh16vbcpGOq91w5OrISyVg7vrHK9i7Bm5lDRID
	zeFSm+it0nPbGburH2h4Gny8cLIx6Pd7v7NbVa4=
X-Google-Smtp-Source: ABdhPJxUnvZ5u6bIfBebhobmjnRk0Bx4yi9rfF+lZfdYBBQFmhucUMXLPm4U8FdVCaGH5+z59XA1R2D1zlSTdtVdrK4=
X-Received: by 2002:aed:2962:: with SMTP id s89mr4390207qtd.88.1605913110044;
 Fri, 20 Nov 2020 14:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20201119074134.6963-1-kai.kang@windriver.com> <CALbNGRRv0h52taHB2zB6ieiprpmPDTPzVvrKJxnMZXiaioUL+A@mail.gmail.com>
In-Reply-To: <CALbNGRRv0h52taHB2zB6ieiprpmPDTPzVvrKJxnMZXiaioUL+A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Nov 2020 14:58:04 -0800
Message-ID: <CAMKF1so+RbA7WRMAW_JxJ1SSfakWeNLzy35pG0S=sA8uh6d9Zw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 0/4] Update 4 recipes in meta-xfce
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Kang Kai <kai.kang@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 12:18 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Nov 19, 2020 at 8:41 AM <kai.kang@windriver.com> wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> >
> > Kai Kang (4):
> >   xfce4-cpufreq-plugin: 1.2.1 -> 1.2.2
> >   xfce4-weather-plugin: 0.10.1 -> 0.10.2
> >   xfce4-mailwatch-plugin: 1.2.0 -> 1.3.0
> >   tumbler: 0.2.9 -> 0.3.1
> Although tumbler is a dev-release, I am fine with the whole series.
>

Thanks Andreas.

> Andreas
>
>=20
>
