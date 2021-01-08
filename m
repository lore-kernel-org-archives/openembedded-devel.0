Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.1301.1610137766101334172
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 12:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D+57hKma;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id i5so8370578pgo.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Jan 2021 12:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aTHCCqtukYwzM0D8BDCl6rUaYfyfn9ma6azR1Zss+Q=;
        b=D+57hKma+rKiGZsNige5JN0HBSRKpwLq30d7qF+8SVFxFaIoxgQ2dvEU24i0kSLW17
         uMyiXH414jBqN+iLDhj+0ZlxOHekNHPTSREL9NNykgbbVVq1yyBjS9DPqhetm5dm1Q54
         P3weEo6uQRWemPyO+kQI032P5d/DuA2Ug+vS4WOzMuc62XeGNXdXld7PiHxOvn7rujaw
         2+AV9UOwsCCj48dD9o2gLB7Ml9e+vQlj0pLFAKGVBbht3JLZxSTKbPy1TIITWikiVe1r
         uk+gB+scd3BjeNasqVCvA1zUWa3iuXKJHBhexZE3wzq/o7UZGCHpB5BU93pIgFONTRQV
         zTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aTHCCqtukYwzM0D8BDCl6rUaYfyfn9ma6azR1Zss+Q=;
        b=GyLDVlDYvh/FUUX7ZNMEoTopgFxZWxsJEpm8R/S6Aa+Vu88IKtiooMDY1Gx6dOuMaN
         qFHpywVC6APAGkjak8kbDp4+gkv8sJg5NpZOXLMAqAI/fj3G5X4M/jVkr8yRMEi4Txmo
         9Qm2NSufW/JiHoidkxxa3u7jPvqxHGxFrmbCOTsE0iU4LKHrRcoTx2tVtigGdr8lcTlb
         cgAFw76cTvbopJTTJC6SAgRR5R6pV3QUtr+Jo6ikOfPYcZ5kxTTejql37OLlAGD7OejR
         U1a/60Mrwe5hdKM+SnedaOS8LzcX0qWHxMIsoQBi/EyaH2Y8RL3BmWw62RDY8glCEwYU
         64hQ==
X-Gm-Message-State: AOAM530WOQN1x0kvAS+9PA2SoHZd0DwiBofVkzqs3AbP+uzREuvDLt9r
	wrPnuvUPBI156WBvWpIveYT8j4MlwUtH0Lil1mY=
X-Google-Smtp-Source: ABdhPJyMcgx0XssaqQ5UIAztfYH3kcoy3jJXKLCKRJlyTCi4BqllENsyIE1kHlcnvjRBw0oSjPB+BTI0mx/lfhOFSkw=
X-Received: by 2002:a65:5283:: with SMTP id y3mr8698353pgp.174.1610137765580;
 Fri, 08 Jan 2021 12:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-4-schnitzeltony@gmail.com> <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
In-Reply-To: <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 8 Jan 2021 21:29:13 +0100
Message-ID: <CALbNGRTreOS2m9z9tOp_Z3sGrVVypZr=5J9RBFwwnPF+fieYcw@mail.gmail.com>
Subject: Re: [oe] [PATCH 04/28] libxfce4ui: upgrade 4.14.1 -> 4.16.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 8:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> I see an odd failure on qemuriscv64
> https://errors.yoctoproject.org/Errors/Details/540832/
Hi Khem,

Have seen this either but assumed it was caused by going back and
forth during tests. Worked around this by cleansstate.

I think there is some race (unrelated to qemuriscv64): when I saw the
error, the file was there. I looked into that already but did not find
suspicious yet. Have put libxfce4ui back on my TODO...

Andreas
