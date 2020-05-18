Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.340.1589824102099001490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 10:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jLEBPHIZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id 4so8841233qtb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 10:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXQTqPLabzoUmOFM2ru5Eww4Lz/MJnsFVQ4S2etIg6c=;
        b=jLEBPHIZVeGDj5e4pdzQVaBTtJfFFUlacVHC2Gs6IeIm+gsNr2aYrwnCSAof+wP9pr
         0IdJZzJtb0uKlizKaTlMAK8vp92QvA08htLvuVDaSqiZhvUTO7Po+F0+mDOgcpo7vEdE
         sNS2zzZl+ploQr2Dv1wv75BP5ua19zCPtRVafVMIVeBzLCNGbzgcqG8YDP90tuPqyuuw
         W49TseCtopPKyfqrWynswe39CR1r5KNr/5AAtsPgcrlJ/mXsfS1KqQFXqRifP+vEGr31
         ZgrnYWB7/N0dTpU7gaj+uPSHqxfkBzsYmnOzHnrrgJuZLuQY4PiN+TIG+fWMbsE69Jgl
         /pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXQTqPLabzoUmOFM2ru5Eww4Lz/MJnsFVQ4S2etIg6c=;
        b=KteGQP/yswelXLi+xSJ3A4wRqhbitYpP0ADBCHxmkv197pI4zvBYuLbz3LbhxUkTJX
         1wyc6JZS1yT+8rvfi0S7mp9nM01I+qjh+JkbVs9DDnPSq2KQ3JGTAATGjaS+dF1Ez2kd
         CK2TlW/1Bb1yv70ekMo9B1pbv+xv7hm8gfIPtu33PWAtxAAJiRrdscQ9wb1sZjbLmWXi
         kar2+J8BtjEgSKrtlnNmsaMnnp8POg2+Rkrsl7nmk8DPHQJnhw75ckDMQgH7UHmmioq/
         sFC1tFuNGy8HRuMYgOzBmEU9EvVj2sW2sJaCGx2/O6+CJp1qWDIbVCcJB6lPbOxsw+ip
         SQsA==
X-Gm-Message-State: AOAM53189FcEOD1OYU8bccN/t7NzdCXa673EqmfHxNVzH+rhAeKuVQIv
	QB5mqnAPZGmDHOfVxmH4mPXI20Ma5pqfLXGzjedCxxPe
X-Google-Smtp-Source: ABdhPJzJqFC4nzLFrU3YwR5gEW7O4cF7pIl2pNF8fTEKJZYt012w7janPsirjeE41wp/6j8HtiEfUEO6kV9El/2nRdY=
X-Received: by 2002:ac8:478f:: with SMTP id k15mr2984130qtq.285.1589824100868;
 Mon, 18 May 2020 10:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <160F47A92CF7AFC2.6323@lists.openembedded.org> <20200515184114.GC11927@denix.org>
 <d67d77d6-d3bc-3635-06c0-09a58a1ed8db@gmail.com> <160F481530632D33.6323@lists.openembedded.org>
 <20200518172303.GL11927@denix.org>
In-Reply-To: <20200518172303.GL11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 18 May 2020 10:47:54 -0700
Message-ID: <CAMKF1sq8RKeaSxtny1UPrE9tGYE4DaU6uty+qHXv9jJC6Ev0gQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/2] remove pycryptodome(x) and pyelftools
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 18, 2020 at 10:23 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, May 15, 2020 at 02:47:26PM -0400, Denys Dmytriyenko wrote:
> > On Fri, May 15, 2020 at 11:42:13AM -0700, Khem Raj wrote:
> > >
> > >
> > > On 5/15/20 11:41 AM, Denys Dmytriyenko wrote:
> > > >Joshua,
> > > >
> > > >FYI
> > > >
> > > >
> > > >On Fri, May 15, 2020 at 02:39:38PM -0400, Denys Dmytriyenko wrote:
> > > >>From: Denys Dmytriyenko <denys@ti.com>
> > > >>
> > > >>python3-pycryptodome(x) and python3-pyelftools have been moved to OE-Core.
> > > >>Remove from meta-python now.
> > > >>
> > > >>OE-Core changes are still in master-next, so may need to wait until merged
> > > >>to master.
> > > >>
> > >
> > > thanks, if you are watching this please send a note once its in master.
> >
> > Sure, will do.
>
> So, OE-Core master-next got merged to master earlier today, but I see you
> already have these 2 in your master-next, so should be good. Thanks.
>

right thanks for notifying.

>
> > > >>Denys Dmytriyenko (2):
> > > >>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
> > > >>   python3-pyelftools: moved to OE-Core, remove from meta-python
> > > >>
> > > >>  .../python/python-pycryptodome.inc                 | 29 ----------------------
> > > >>  .../python/python3-pycryptodome_3.9.4.bb           |  2 --
> > > >>  .../python/python3-pycryptodomex_3.9.4.bb          | 10 --------
> > > >>  .../python/python3-pyelftools_0.25.bb              | 14 -----------
> > > >>  4 files changed, 55 deletions(-)
> > > >>  delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
> > > >>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
> > > >>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
> > > >>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
> > > >>
> > > >>--
> > > >>2.7.4
> > > >>
> > > >
> > > >>
> > > >
> > > >
> > > >
> > > >
> >
> > >
> >
>
> > 
>
