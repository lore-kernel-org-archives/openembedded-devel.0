Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.26557.1613945233778063002
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hUshg/kF;
 spf=pass (domain: konsulko.com, ip: 209.85.222.182, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f182.google.com with SMTP id z190so10899414qka.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Feb 2021 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=WBzX3mWW7WyCDGFNJMamhVbyJKKu62H/RX4/RHy3Ags=;
        b=hUshg/kF/1q1P3+PQjRZH6tO7PKCuCaSDYny0KYWHrD2HCCAGY9bVlhtf6mKEIIKIj
         eA3gQIEu6wDApw2oLu39oxj1Tsw+Z4qQcViLON6dSYdoLzLdDmSwjN7f34HiCWimYSGr
         C5jpiA+w1Kz6BiWKOzODlBVjW+5p+CSigFYJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=WBzX3mWW7WyCDGFNJMamhVbyJKKu62H/RX4/RHy3Ags=;
        b=KdFyb+AGOLAhvEJ+G+D5kRnJ8KvtmTXXM6/D7qNyIv1hiWnbgWdF7CcoOKRPjHdJIH
         6ZzvuKWBlkV6xVbzfOy7dr1mwDBHbRZXf1jWcYmmLu/0D3GyrrJn/0yY1QLCyWu7gX9G
         bcB0XyXvpZJoMHycC4wFGq5yyGlDL+XVn9fOk32TnFi4nqcQDd+8O0492wY1viLhWCzK
         EVXnIUnMbHLlf8oIbssLAAyEnCB0keJm+MBaDpYw21qYTCNqH/LUDE/vbvZ83cfzGtZ/
         vfp8+YKUs/1DBK4KAXo7mMoWcsppMuri+jWY2Iw50NTUHFTW7bxCkKqNAep1zwBlSOzJ
         DA+w==
X-Gm-Message-State: AOAM530IZQqJanPcRnNawqRTAY8tF41lW05kT1WQJMVQkUJanNpUyWUG
	PHkvxINICHe/BCbhw9JtrcoTC/zRyQJYDQ==
X-Google-Smtp-Source: ABdhPJw3wlqtXR0VSYu9oSXvQhdWBb//+2rqveMHjelqepUAKoxvpDxFEA4F/mhWlojq1gwmKUjcLA==
X-Received: by 2002:a05:620a:13ac:: with SMTP id m12mr18300276qki.18.1613945232885;
        Sun, 21 Feb 2021 14:07:12 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id x79sm11110439qka.75.2021.02.21.14.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:07:12 -0800 (PST)
Date: Sun, 21 Feb 2021 17:07:11 -0500 (EST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] [meta-oe] kernel-fitimage: Fix CVE-2021-27138
In-Reply-To: <6350f605-b8a5-f8d0-17c5-97309b843f90@linux.vnet.ibm.com>
Message-ID: <84b582ab-fa1b-e5c1-5d8-6dc763f953c7@spiteful.org>
References: <20210220214042.4882-1-klaus@linux.vnet.ibm.com> <5a8c8c64-137f-ba2-63b9-59e878f3307f@spiteful.org> <6350f605-b8a5-f8d0-17c5-97309b843f90@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 21 Feb 2021, Klaus Heinrich Kiwi wrote:

> >>          CVE-2021-27138
> >>
> >> Adjust the kernel-fitimage.bbclass accordingly to not use unit
> >> addresses. In addition to fixing a CVE, this is also required before we
> >> can bump U-Boot to 2021.4.
> >>
> >> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> > [snip]
> >
> > Please send this to the oe-core list since kernel-fitimage.bbclass is in
> > it, not meta-openembedded.  I would also perhaps be inclined to not
>
> Thanks, for some reason I thought that -core was discussed here, but I have
> read the README more carefully since then.
>
> > describe this change itself as "fixing a CVE", since it is the change in
> > U-Boot that actually does that IMO.
> >
>
> Yeah I was unsure how to summarize that, since the CVE 'fix' in U-boot is
> to really disallow unit addresses, and looks like it's not going to be
> applied to released branches, but instead only on 2021.4 onwards. So I
> opted to call out the CVE in the title, as it is, in practical terms,
> addressing a CVE (if it's a workaround or a proper fix is debatable I
> guess).

My concern is more about trying to avoid giving people the impression this
change somehow fixes the U-Boot vulnerability, as it is entirely possible
they might not being using kernel-fitimage.bbclass to generate their
fitimages.  I'd be okay with something along the lines of "In addition
to not generating fitimage configurations vulnerable to the CVE, this is
also required before we can bump U-Boot to 2021.4, which removes unit
address support to fix the CVE."

Thanks,

Scott

