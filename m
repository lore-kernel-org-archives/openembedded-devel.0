Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.10153.1592582111934410581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 08:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X+7wwajQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id u13so11740445iol.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AWPB9BEKHCsiV+ngrqNKNCbk1BUVF2kSdJAQpb/k/44=;
        b=X+7wwajQ0ZXL7xPg+6RBUjjulqnZn4KOVonzlmrh7Hzco7Ph/wp+wpryOAHV9SDZST
         qtSzxC6KCGjC4BtGQCMuRzPDTlPmhFj6AtcX54rEeJLUiF0yevcU63y1lo2THof9fw2p
         Bj0q9UIIJaOa7EPwlQKaZE4FGzb6/7AHN2OQNbeEFf9p+2Z/XHqVcLv1MhKAGYoiSkyu
         R7T+GQP4N0j+ybeIxn6smXa5csoRli2DPFzId6MA+s1GVzbGi7EXqh/U2FEpEL4YhEGF
         X64zJ9dZJmPADMtAN+Ksk1foKGJMT2e138LzcXJUBNtGqNdw+yC3bSX4v6OoVKQVpSjR
         cNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AWPB9BEKHCsiV+ngrqNKNCbk1BUVF2kSdJAQpb/k/44=;
        b=bANMK2mRkOPPFjH5iyDwesnhUVKIEyPc4xA4/cbH/Mg2e0ful8GdY2PUBEe+QPkM7+
         z9qe9wt6xYeteiTrvKxWWYn4/fyMwLyDVbO145//7jwo+5wbsq8V2Qe/mQwh6VTWkp7L
         +nXAjKSn4jkNMtnvHii+Yod5OnbHPOw/4+PyvHS0ktdOL/I0JuLAX2GdMgigFXNke5kc
         XZ/GeWdliopQ45slM4QfYeI7CTWxBlKqSuOVmfF6iU9hxxuQluwgTQoDktjHZ/e6Wt85
         +8dYYkNM5ve+V32YHvphM8zorDHi+gOhaKddajgEwHEGBTj5z4ORC6XlzEzcKP3EU6Uc
         4fvw==
X-Gm-Message-State: AOAM5325jx8EtGM6GghcRCDFXmyJ1OgnPwirJXuAVxI/qQSx4VqmCgEu
	p6W2vCNaUXV054whRHMcU56W4ihW/NA3Xdu6hoQ=
X-Google-Smtp-Source: ABdhPJxjR/e3kNwZmUc49uyHDzwPa6kcKRFkpYoiZW+z+vTUL2dJ0MwfE/uKs9SUej/9Mjv18pps90RZJVqagRpjRHM=
X-Received: by 2002:a6b:e714:: with SMTP id b20mr5115958ioh.195.1592582111448;
 Fri, 19 Jun 2020 08:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
 <20200619113201.2811033-10-schnitzeltony@gmail.com> <e7646f40-9032-0b77-5969-9afa9a883704@gmail.com>
In-Reply-To: <e7646f40-9032-0b77-5969-9afa9a883704@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 19 Jun 2020 17:55:00 +0200
Message-ID: <CALbNGRR3bTe4ATHS-2505iGUOsQq+H3YPqRoLc-+cHCYvNmNLg@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 5:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 6/19/20 4:32 AM, Andreas M=C3=BCller wrote:
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../libgit2/{libgit2_1.0.0.bb =3D> libgit2_git.bb}               | 3 +=
+-
>
> I think we have been preferring to use PV via recipe names if possible.
> which this recipe is already doing, is there any benefit of renaming it
> to _git ?
Renaming:
* needs extra efforts to create diff while working on a recipe
* might cause issues on huge diffs

Shall I switch back to old scheme and send V2?

Andreas
