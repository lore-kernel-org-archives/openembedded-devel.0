Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2656.1631994644081215919
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 12:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RKEG9ui6;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id a14so809074qvb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 12:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpRr7QjCNhjqdBijXxjRXDxBuBdfb7Adsebnufljh/U=;
        b=RKEG9ui6XV53v8gIgF7jxflLxjqGNsFb+Kl7nsycGHQuTFGZbwGMw8ILDFor/2kiO8
         N7bHwpEb8jgmxMyllWc/fKR+iwuA1LGR/quJtLHB9rEJDhCdY67gA6gvMJqoy4d8XV20
         4iWEPG29/R7DGTtqDMGnCWHv7V/JMTGECJ5oSZGMvojwtVCeIi8VG6ZcEcz5jAabu8GH
         PbJEfesixQSw41imliMGg+u8bABboqFdhfyN61F5QWwQviSlOQsYSMktBMDdJ5Im56h+
         LCOM5rq6ZK2zztkpGgjI+ANmPh5fDSuM5Y9f3NFC4XKF7NtDPXyelSlN8u3VIu3tiF2K
         L2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpRr7QjCNhjqdBijXxjRXDxBuBdfb7Adsebnufljh/U=;
        b=aL34SrXBirxIlg05MGPU5vMe5MUbnn+GAYHDa/q8X39XTixIGF8zFLtxgDmLtFK669
         i7ZyZA9baCDJXG56xHQejITeEU+axB/Dkt05NNyZCoFY379nGoHFSU/NEwpi9eiNXiOs
         WJSTxV/sc62OHxl7XKvSzdptV4WT8jAWIYMOzgju8tNowA+bn6IsSRLdTJKKxNZ8Cuwo
         2ieoD6cw4Ec7xARzBjADQNc4nGoroAIPBXgeDE2KQr8mcRj0uqCaBqqXeB/A1O7vv/ne
         sm18+rsl3q8f5LDI+yCca5DTHgfPUbrXnAq76NEOO/9dxo/SVkrRaCveGeESlCvfRidb
         Ctng==
X-Gm-Message-State: AOAM530UbzG9a6DNdLExjOycdXGBZWT4aF2lvQaRAWlGShdOROQpdNjk
	UkExTMskS0e2ESc/sUbgAI1tTWCiwjEzYQxYAuE=
X-Google-Smtp-Source: ABdhPJzViSU1p/F0O47uoP93qv8LZOGVVsMP5U+rGMLTtRO1lmDcX085uIo48U4yTXwJv+P88q+pDmVUtHoUCE4uMi4=
X-Received: by 2002:a05:6214:50b:: with SMTP id v11mr17793401qvw.41.1631994643214;
 Sat, 18 Sep 2021 12:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <01841159-90c6-ba5f-62e6-b4e5859a770e@gmail.com>
In-Reply-To: <01841159-90c6-ba5f-62e6-b4e5859a770e@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 18 Sep 2021 12:50:17 -0700
Message-ID: <CAMKF1soS4f_4KqwBVZOPu5ks8VJsAtwzMDVM6Xk15RGW9Va==w@mail.gmail.com>
Subject: Re: [oe] meta-networking: fping license
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

it seems like stanford version of BSD-3 see debian's license file
https://tracker.debian.org/media/packages/f/fping/copyright-4.2-1

On Sat, Sep 18, 2021 at 12:10 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Hello,
>
> The LICENSE listed in this recipe is "BSD" and it clearly is not that
> nor could I find the below wording matching any of the BSD variants (
> Not a Lawyer). Now that SPDX data can be generated easier from core,
> this may barf with the invalid "License".  This is the last outstanding
> invalid BSD license in meta-oe and if anyone uses this package, maybe
> you can dig into finding out what the proper license should be.
>
> - Armin
>
>
> Constance of 'COPYING':
>
> * Original author:  Roland Schemers  <schemers@stanford.edu>
>  * IPv6 Support:     Jeroen Massar    <jeroen@unfix.org / jeroen@ipng.nl>
>  * Improved main loop: David Schweikert <david@schweikert.ch>
>  * Debian Merge, TOS settings: Tobi Oetiker <tobi@oetiker.ch>
>  * Bugfixes, byte order & senseful seq.-numbers: Stephan Fuhrmann
> (stephan.fuhrmann AT 1und1.de)
>  *
>  * Redistribution and use in source and binary forms are permitted
>  * provided that the above copyright notice and this paragraph are
>  * duplicated in all such forms and that any documentation,
>  * advertising materials, and other materials related to such
>  * distribution and use acknowledge that the software was developed
>  * by Stanford University.  The name of the University may not be used
>  * to endorse or promote products derived from this software without
>  * specific prior written permission.
>  * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
>  * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
>  * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
>
>
> 
>
