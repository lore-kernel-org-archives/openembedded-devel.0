Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.29143.1606099698575213650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 18:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FAERJaNe;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id z188so4262097qke.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 18:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GSS5FnAxOKUkfyiOqo4klL6iOlKDv8qKPOziYeVZk2s=;
        b=FAERJaNebl+gXHs3QEbPdorOxkkBY+iAgwJS52VwclueAgdeupbVGGFcoIzQMvBJQk
         zW2knHmYnTJ+qkhKn2mq83cUe0tPgv4n3sOGkKFgY6yDFCcJjtGLKk1DKC3fHy9vad5l
         RfcVZsZmiUciZVBcB7PvkvgHxeJkWzYS4duHZ/tAq7L18kHPLS2gicuDInCPE/+agAT7
         wj7eaUJ4r19yBfjV0/si7TNZMqTQh6qvk3XYhHrzTDBkc9O5ZRrLuFj8i38qkMnQ+7IS
         oWawrBywcuL6lbVy6WF0tNibycILUwokkZEHHGUFyAs8pH7hmGeCdpVDrO5yF0hRmm7w
         nowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GSS5FnAxOKUkfyiOqo4klL6iOlKDv8qKPOziYeVZk2s=;
        b=d6ojLTZLm0ocvaDRPA5V45qTP7sygJlFfev0OusZk9psGBKD3APUEYes2qaZaklZLb
         BNH6JbyNYXH6rOebu02sjyJFEQ7xKvegw07kMlRnvTaUBNgucHeyiIVdjWTpN/w1h7wu
         nHNta3+R16xbT0PpLxNyuYGLoKuf285cYbtRupBMhqGug4PZOWM1aq3R3ZaXuh/1TUhw
         rhenGmIvHqfyuU+eeMh4Kqwq7OxQDbqXvyzLtyUeNm7LcrGL8XAnkc+M7YY0Bon5FSLd
         UzN46zeE7PJFQ0RPNKcLvwbpQecLO8REsCcTUwR4MHB3wiq25FOgq7f3jMs1wbphJX0S
         n3kA==
X-Gm-Message-State: AOAM532BtrZNutnJJ+Zq4pk2oUEKkBnAec6jtrno5SGL2vBFB/IEIhVw
	ugv2t60medO0gn98+YvKaVXP2eul+26MJ34Jcl4=
X-Google-Smtp-Source: ABdhPJzveCJ+IPxQTI/eXioiEdxbxmlelfsTUR0o8EvQo7YKIG9FpEMb+UJlht8m+FNtU3KFD1SSOu4jPrEq2W3IQpE=
X-Received: by 2002:a37:58c1:: with SMTP id m184mr14295944qkb.9.1606099697592;
 Sun, 22 Nov 2020 18:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20201121032832.21540-1-okaya@kernel.org> <CAMKF1sqydOH5teADQ8f3iDsR-2K96DT4dELN63kD_u7A8rfB9A@mail.gmail.com>
 <be3645d4-58a7-f330-dbf1-d8ae04121f2c@kernel.org>
In-Reply-To: <be3645d4-58a7-f330-dbf1-d8ae04121f2c@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 22 Nov 2020 18:47:51 -0800
Message-ID: <CAMKF1sqTutrLGcha+2raFvLSkrHSf1zbgsf+DgwavBqxABu7+Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cpp-netlib: add bitbake recipe
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2020 at 6:11 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 11/21/2020 2:20 AM, Khem Raj wrote:
> > can we add it to testing packagegroup too please ?
>
> hmm, why would this belong to testing group?
>
> This is a support library for networking similar to boost.

I guess, I should have been a bit more clear. So question is/was if this package
should be packages into packagegroup-meta-oe as well, since this helps in
ensuring that we can find any packaging issues etc. which normal world
builds dont.
