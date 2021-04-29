Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.1298.1619662830542423503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 19:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uA9gcl0Y;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 8so32083284qkv.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Apr 2021 19:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bV1RRPATkoy8Q6Z+Rw7ufTKs+DYXWw1q0ZXxTH5GdcQ=;
        b=uA9gcl0YHtP+d1KKTmZ9V7Pm4xTSdmWKgQQjsb/OJ7mWy/+DzD7deTewC6gfntKzem
         siAu5POWEKB0mu6FYTlEZmliTUJZobxSrpSyfjWF8v6h+FfyiRkMtRCgLzS3dr8SJR8c
         o6MfPtrZNJmYmqKMb13eg7MJ9H0wdpATsG7xLWRrr5tka5Fq2DIMfewO88heKop0XOzo
         Mx2s7KvHiKYFETdYwjMhYLsyN/Pusud9erNfTSlyHS6icKw4SQVIYhNH/ezgbLU/FNZ5
         nBouDV0tbyRxqSnQmkLHAB+E2aq+IaSJsAaf1QDzzGP8Gs3nK+1IRdDvQhOsXvJI58rY
         8/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bV1RRPATkoy8Q6Z+Rw7ufTKs+DYXWw1q0ZXxTH5GdcQ=;
        b=OyRe0pmvr1YKfy9dxGFz4GGGEBvfaLVfXd5uK414RbyGl3IjtihJj46cLfq8ZbwcBn
         SS3GArH/ZyQn5EmtcSL3q/8NV1bg7S1iBQ0EU5gf3fS7LIBunnHd3AiSSHykV3fqID3g
         O2N6t6WHCXo0Vu+m5BV7FmRq/BE0V0y5g0lPgaiQjmDAI1sv1E1RqmL66UHZdXwCECTu
         YeJU+urfauwGAvd29TTxqXfq5SBI9/sjFZTyA++Eus0b70O1PV9ZN5MuVjn5kFS/1GsF
         UwguwOR6KluoM6nB/8Uvfn+Lpo3XJq/0U0XPKmReXjzXSTShF5AZaPHrUjXUFGfnx8wE
         gPcg==
X-Gm-Message-State: AOAM533PXmG5Kp5ymc6QrcnqbNam7eRf0XqhAN5fW+32OCyfWusbHaYi
	ia+3lB7+A82OnJXZsI29X6dsxN9NXj86M4XIkf8=
X-Google-Smtp-Source: ABdhPJwhPT0DVeiPO61S2NQqvFodgq0vio+5wrk1oyRhHOonBTOhiaG9KVQtbpM1rAJ+w3P42EiO0fNTAtiub5CCpNE=
X-Received: by 2002:a37:624c:: with SMTP id w73mr31873768qkb.125.1619662829662;
 Wed, 28 Apr 2021 19:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <3d3b4f06-859a-86cd-e0ed-0934c673e76e@gmail.com>
 <CAMKF1srqFHxSdOspdBTuj-i8dqTDfTUsYgErq3yT=9p7+k33+w@mail.gmail.com> <2775537c-e217-bb3a-f82b-699c987993cb@gmail.com>
In-Reply-To: <2775537c-e217-bb3a-f82b-699c987993cb@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Apr 2021 19:20:03 -0700
Message-ID: <CAMKF1sqhVK=tKWja90Ss+kL1wh3vUMd59YBhBEWKGL2ATqZyDQ@mail.gmail.com>
Subject: Re: [oe] nostromo fetch error on master/hardknott
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 7:10 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 4/26/21 9:03 PM, Khem Raj wrote:
> > On Mon, Apr 26, 2021 at 10:14 AM Armin Kuster <akuster808@gmail.com> wrote:
> >> Hello,
> >>
> >> I just notice new fetch errors for nostromo
> >> <https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb>
> >> in meta-webservers.
> >>
> >> The hosting site is not responding. https://www.nazgul.ch/
> >>
> >> My limited search for an alt source is coming up empty.  Is anyone using
> >> this app?
> > If this site stays AWOL then I am willing to accept a patch to delete
> > this recipe.
>
> The site is still not responding.  I will send a patch for Master by the
> weekend if no change.
>
> It posses an odd problem for the stable branches.  Would adding this
> recipes to that offensive exclusion list be acceptable?

I think it should be available via sources.openembedded.org mirror but
perhaps you can add PNBLACKLIST to such recipes may be

>
> - armin
> >> -armin
> >>
> >>
> >> 
> >>
>
>
