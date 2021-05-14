Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.5043.1620972672201330888
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 23:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MJihccks;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id f29so15574792qka.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 23:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=77zTonT7Z6Z7+0lsuGB6Ty4nUeU0Mr3081OaXuvQZ7o=;
        b=MJihccks9934N63qK+JtyrIQfBWqX5ngEgLuDWkeVlmnn2ezhpHv+hS80+mN1T6Z1n
         PtyePcyGIBR+aPZja20pC5TUNfFU3MqS1zG8FkV+hOenZQerAiNinnRWx3M7oqyKsVFW
         7W7qu2BUlfb7VTIJcEsHUrYPteyRSqeTZjHaXLEWxK50CNwwFV3swWdvsE1n/k+qD1Nu
         MG6wDhKGtNpf9fzU44gQPLqTidTo5a2iWi9O3asv1LHpVWG1iKAcOUa6oCuYW4H2SifE
         CDIYpJht1PtPqmvArUMKBqi0Cin8tmhlLeRCioBmqluAHqNh7kEETwNjZ6SyVnfZDbCM
         9oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=77zTonT7Z6Z7+0lsuGB6Ty4nUeU0Mr3081OaXuvQZ7o=;
        b=HG0hVvdDda9wXeD8EkFEmujw1B0NceZSfFp+Qv/ATT07KotjT+53Wiq6GSvInwfZ2w
         DDDGoyvvW0gnjxqq7MTOlvcgN3Dcj/B3PYh799sPNk/LpldKhi+MHIOCb2oJOnwFzyJb
         CE54KVkiGna+zadEuLqsbyLnlEqFIWZxxQ//eksnql0SRu7AAKDxGdwvcTtsYqKbzKfN
         z8MfXyc+5LDmT2gG5h8bjMoqWHqqom1lmaEIbvSQDnJjGAKTxAxh1Xx46UecMkWBhSjL
         y7E1Oy14ZIZjDURbr682WZlttR/WV5xJw28HTm1WSb9zSpenX/viYYSRKqBf2+VI9Sy+
         RCEw==
X-Gm-Message-State: AOAM531qSLhYu9bdwb94VzUYP6rNlDaO7SlMLjCSOSjgcBffotNce3T6
	03AGYlAkbUJfzDiEMSiq/e5Pn0SVTn9NrIr4Gzc=
X-Google-Smtp-Source: ABdhPJzLyTyC1WI8ExwYlvYXZDWgu2r1TEIP5nciQqQLqJvHCuZGBNK2wrsajwA+F4uJPcWm6OUoqtPQySeD1e2ssV0=
X-Received: by 2002:a37:270d:: with SMTP id n13mr41400815qkn.146.1620972671346;
 Thu, 13 May 2021 23:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <418378d1-ae13-c44f-6136-ed733f1dcf40@gmail.com>
In-Reply-To: <418378d1-ae13-c44f-6136-ed733f1dcf40@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 May 2021 23:10:45 -0700
Message-ID: <CAMKF1soKE2wty8+QMM5XUx5oEwW8BC-bHnAomHjkW-wmCu+5ww@mail.gmail.com>
Subject: Re: dunfell merge request May 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Thu, May 13, 2021 at 9:55 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit c1a50683225b0bf10f8d7a18280acefa7469ecc2:
>
>   libupnp: Fix CVE-2020-13848 (2021-04-23 19:13:09 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 2915810edbb6599051e30efb3b7f805665ddcc23:
>
>   ostree: switch from default master branch to main to fix do_fetch
> failure (2021-05-13 21:52:34 -0700)
>
> ----------------------------------------------------------------
> Martin Jansa (1):
>       ostree: switch from default master branch to main to fix do_fetch
> failure
>
>  meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
