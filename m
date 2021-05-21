Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.5163.1621572094107042082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 21:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ATFQy0WF;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id i67so18565668qkc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 21:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eJfBLy/eU2RN0GVk2ap5pTvgZ1DsGUEm39JDnT2OKHY=;
        b=ATFQy0WFzQe4PftITSweBBNc+bKh5QuJIrST3S7iu2lXpSdCd17n/AYgnKapquMBfi
         +FTgIjPZ2BzXPXnXwbaueCal4dWOCVvxZb5D99+p6yydGBJixs/GJJS59sOyXN0LBjEr
         lncEf5O8HfbBnKkcbmy/xTZxDhEbezAHOMTD8dw58loxA5KDo89GVki1M/70kvAarHSz
         4NNweQb+rZ5DVk/AHo/vXedQwItaTV9QBdFDlCVoAbjeyqrom0fjr5P9wRZHwDrSJnb6
         rv/czDbSchije/tU8E68JOBVdn6YgE/ePvplnmc9mqiPIyRQQafVGeI3UaqUN5QQMqan
         Xx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eJfBLy/eU2RN0GVk2ap5pTvgZ1DsGUEm39JDnT2OKHY=;
        b=Kk580amtiag2Cpui/wUBMsLQePfUU8sK6YmsMVfvZ8f4wF9t65XgZYHn5+dEOmTQSi
         FTBn+NU7mBl3x0WaGD/aXuFs80O1ONfcK/vMJiaDw24jsaPVepx+mPmS+EBjek0RI+kl
         TMhGIAchqadSi+A+9Aw2mJlCGLRdsFzKBJaEO0f+0xAcoC6FJh29La9KNhfOyvjzs9o1
         S/5ho6R00L+KXivdke5JZqk1xHc3wcVTvTekuHNDYOAUBoiSKEFAeDSsIWci2vflVn4W
         5O2tGqCKXxNTl1Torbz79TRKCshA4pikF//w3mCGrAVW1uqBywzk6gN0/10PLZl1cn80
         fqSQ==
X-Gm-Message-State: AOAM532rFjDZXIPIMrXaMqKSIEMvy9snaEdizx1lMOMth55Bga3n4O3/
	xyfCsqFGjpf570dvquJ+jqiRNKYTdtsDdmYiJh4=
X-Google-Smtp-Source: ABdhPJwnifwiVG7nkh4xV+CKjQTivjUs+Y4v0Mipsciy3ETSxM+LCAvIxUPNsdAjvWYx9TJjUcQeQ9QWIm6ZgYAk1so=
X-Received: by 2002:a37:270d:: with SMTP id n13mr9677484qkn.146.1621572093160;
 Thu, 20 May 2021 21:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210521012342.2205595-1-robert.joslyn@redrectangle.org>
 <CAMKF1sqgn11fpRWTmJrHX+okNSx=-4Ay1Us=gb=F-_OcPT73ag@mail.gmail.com> <7A70D5A5-893A-4894-BF7C-4FDB07580879@redrectangle.org>
In-Reply-To: <7A70D5A5-893A-4894-BF7C-4FDB07580879@redrectangle.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 20 May 2021 21:41:06 -0700
Message-ID: <CAMKF1srNH64FDGafO=5-fAdGEN7xf5niaNkWiY2cxJXJ77juTg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ctags: Recipe cleanup
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 8:19 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
>
> > On May 20, 2021, at 6:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, May 20, 2021 at 6:25 PM Robert Joslyn
> > <robert.joslyn@redrectangle.org> wrote:
> >>
> >> The configure script does not have a manpages option, resulting in a
> >> warning:
> >>        ctags-5.9.20210502.0-r0 do_configure: QA Issue: ctags: invalid =
PACKAGECONFIG: manpages [invalid-packageconfig]
> >>
> >> Since there does not seem to be any man pages or documentation related
> >> configuration options, remove the manpages class.
> >>
> >
> > so it seems it will be using python-docutils for generating manpages ?
>
> Yes, it uses rst2man.py, which is part of python3-docutils. It looks like=
 the configure script checks for a few rst2man varieties to determine if it=
 should generate the man pages or not.
>
> Perhaps a better way to do this is to add the manpages class back, and pu=
ll in the dependency with:
>
> PACKAGECONFIG[manpages] =3D =E2=80=9C,,python3-docutils-native"

perhaps that might be a better approach

>
> Thanks,
> Robert
