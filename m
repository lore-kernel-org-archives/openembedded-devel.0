Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.15079.1605234415431057151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TiNdjPst;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id 7so11097570ejm.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2020 18:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gjR71OsTR4fzeKOF5zeK5XuOJ1au4R5xYQxdmtLrS4U=;
        b=TiNdjPstfQlde+pSF1bRbGO1hh4cyNvf6WL6VivsZTJ6cjDqnMkuyo4EiQEpPcgEof
         5ih/OZvAf67Lox2e4Pt9nn1YxjfvLOwynkj/lDAynKbd1O5vIsGQLwCpF/Hm4a20Ka6E
         3mt+/kBbaKOl1Xcp4XzIICglnXoAP2VlQI2UsxkHZroe4NaSo9xtr2f9m1Fj4z0Y6K9+
         cdBEQd15t/UW6npTFXbxIsjkDHzMvdebmJYgS2bgiDiWIr1ZdN4YXtluvEjq2QZu11vz
         cvZ8qS5HVCAeOw150LXIr2Eyvw7uluCSLLjmGgNSsnXcSEIbovLB7y/O/CVxgntaehxF
         aWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gjR71OsTR4fzeKOF5zeK5XuOJ1au4R5xYQxdmtLrS4U=;
        b=bDUPxWDtSaJ0GUt1p8I+jGJP5pIvsnmi8JH+Zt8Ie6MuoVFg4ddb8sGHhABDeAt1rc
         WJtNLGkO24SniIdZM6KKnqB2kRhmfO5eU+PPwJG8SdvgiahK5YIzf5UP9Ypj57jHkrsF
         HpvKLcEcnFmd6a4/ljDZEZXnISVqNSSsBJMw8LHjYqwCcD/Yeh/rW02RSwtXRC07CfMA
         1wFARNXV4VkTNhFF9uExPFO43hYOAkDMg4KBqrYCxXPc4OFLmWHCSErvKy2q/0CQVdpV
         oSbpZQp2YCPMHc6rgSEoAkR+E5ffsWFLe+EkDY3nHU8DqIZPsu2PoEGVSGaOhoLAdkzj
         9KMw==
X-Gm-Message-State: AOAM530ajhx4Ighs0XY2SMeP2iCrud98G8b/mvTUTlUcgORExftl8thX
	dPWE+Vsj8HsToEQFPcwrNZEVc94D0pWeJwtDyxA=
X-Google-Smtp-Source: ABdhPJznCaJl7WAAjs9AouRWEIO0WENS/PVXsJkYUvK6ZZzm6QPzMAkv3YQOOuoAhW0Zqu9A+JdDwDfhg2Ibuiveq2A=
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr2187969ejb.517.1605234413836;
 Thu, 12 Nov 2020 18:26:53 -0800 (PST)
MIME-Version: 1.0
References: <1787995e-ca28-2c7f-589d-de56b747b024@broadcom.com> <dcffe9e8b3a47c0e0edaf91a294f92dcc4085553.camel@intel.com>
In-Reply-To: <dcffe9e8b3a47c0e0edaf91a294f92dcc4085553.camel@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2020 21:26:42 -0500
Message-ID: <CADkTA4OR3O00pdBBQOXf7wuK=CNABTsvH3+D+UTKRpMPLwQDNw@mail.gmail.com>
Subject: Re: [oe] all external kernel modules fail to compile with with poky and linux 5.10-rc1
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"scott.branden@broadcom.com" <scott.branden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 9:21 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> On Thu, 2020-11-12 at 15:57 -0800, Scott Branden via
> lists.openembedded.org wrote:
> > It appears the all external modules fail to compile if you try using
> > the 5.10-rc1 or later kernel due to this commit:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=596b0474d3d9b1242eab713f84d8873f9887d980
> >
> > Has anyone tried to compile the latest kernel or has a fix for yocto?
>
> Can you check if this resolves the problem:
>
> https://lists.openembedded.org/g/openembedded-core/message/144539

Yep, that's exactly what you need.

I haven't had my other updates merged yet, so mine is still pending.

Cheers,

Bruce

>
> Thanks,
>
> Anuj
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
