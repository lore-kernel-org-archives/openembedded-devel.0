Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.216.1601919866410470365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 10:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GzugNHld;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id y11so10324645qtn.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2020 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ENSlfDLfh5KIvAEcSw73P6w8h/5TbIA/ZiAKbYq/x6Q=;
        b=GzugNHldbUByBPKPtTjhwv4kd5e2rLGNxzE7+qtFuiH31T+0YNYCMuibPbV9vRBD9E
         zOpfba6bv1zUN6jcpWmek1rAnRZtS+x8yRLIN5JA9AQ/GEEAfVC6J/vQTt8SrScnyQHV
         Gjdp4OsdfJ5weRjcm8hmTCiDh3qVq09mQbtsYfEFQRQZB2lkgqjw1a0hmRX4/ga49cbd
         uC9hHT978qhQU4RNYQjqXi8Kv22cMSJfon49ntE5ff2d0ZGBz9mD0VfPoRch4G7dzbG8
         kbcmV8PtSigpmbW1/GS74xbJzAyz9bC2AnwG99/tRXUNv+RN/WuI7proR4CcZD8/fnsZ
         uw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ENSlfDLfh5KIvAEcSw73P6w8h/5TbIA/ZiAKbYq/x6Q=;
        b=Q+0yz8k6/TSUMoWMlFSGGoGTB39i6mDPasCXooRVOG7W7Hfn+/+bmzH3VKt6bfgusj
         PjQ69iSCpRYw115ZjWn9VrJ92UrLtwtQuLeZElwiZUD1wNgxzu7plKNRiQySFm0uX/hc
         cx4v2Sa8d96WbR7kb2umtTHc7hNfXNhuVgcY0zPqYVs3Y4JZ+TGM6oMdvjFKEBmke6WB
         p0H+i7S4EUWHcfVfbuPUJMC6xGrGXdgHpV85SBcrpSOa8sXX/d7UJYwGxMUdGq9vam1I
         oFEM+PlzMT+ZFhNBm3hN4S9ew8fYXqCLwNRAmuvw2Zv+CHEE/LBkyu6fQ+fByEtZvBny
         v5mg==
X-Gm-Message-State: AOAM5335oiN+9q3k5H/ssQTLbkmufl2C2tqzuIt10mz1uDZZaCHDa5n0
	mccgee5IznZvhhrEG05GO2uVApN0oP8Va7dhXEo=
X-Google-Smtp-Source: ABdhPJyASU00rz17reDvU88q+RsC/OMWhdb4DO5N82hojcV0Yi2EigtuwqmYQUl/wLQ/AwgnSkxRAfxlrBlay+DG1w0=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr1035833qtb.80.1601919865471;
 Mon, 05 Oct 2020 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200928124526.27734-1-brgl@bgdev.pl> <CAMRc=McQ99QcMtdOH-2Y17QOrs=RyWMZHQ60aPAaTurR7VC3Fg@mail.gmail.com>
In-Reply-To: <CAMRc=McQ99QcMtdOH-2Y17QOrs=RyWMZHQ60aPAaTurR7VC3Fg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 5 Oct 2020 10:43:59 -0700
Message-ID: <CAMKF1spW28RWdNLD9GJkP4iDLvt6OjitGj_sJfA+ULZNY6B+nQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: consolidate the recipe files
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 4:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Mon, Sep 28, 2020 at 2:45 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > After dropping the support for v0.3.x, we no longer need the split into
> > .bb and .inc files. Let's move the contents of libgpiod.inc into
> > libgpiod_1.4.4.bb.
> >
> > While at it: do some refactoring: let's use ${BPN} in the URL, consolidate
> > certain variables and add some explanatory comments.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
>
> Hi Khem, Armin,
>
> Are you fine with this change? There's been no follow-up on this since
> last week.

This looks good to me. It escaped patchwork for some reason
>
> Bartosz
