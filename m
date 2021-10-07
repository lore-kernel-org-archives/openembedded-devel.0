Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53EDC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 15:31:01 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.13519.1633620661301728293
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eq8bC6Nz;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so5419624pjb.0
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=N6JBvY95GZc9L93mtZNv6J9k9/01stgkz0bjwEQC/ac=;
        b=Eq8bC6NzHryB6doyE6jrJpXLBfo2sRxAUNds/ujFJRMHFTCQ2iMmR0hQt9dEeBy7PI
         vvpPR0urxq8AZHLUVvlMlrjfsrRjkJMe1P3aSeyU2flonCuxHlfPNhvGmW2lQIbW2pKF
         +B+G9pzabdpfJ2osMFGvUbMkEzH+VstVOGVPTMXIL/EsA360wYpovng//UAVyUAb7+J9
         Tz+S6L3qrWCDGuQhESjvQnhkZNwqD0ytUJMChG1+9rvrdsVkMv5mTlEmJBaVI3jUPUWU
         jK4An6S5vKW5j+xQBZcOqHWI2e8K/6651GzshTdKAGJiWapnfQWqDPPnc8b3VpP/AscT
         qaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=N6JBvY95GZc9L93mtZNv6J9k9/01stgkz0bjwEQC/ac=;
        b=Hl1BfqXT4CnDCvyXyKlbcvfVzYrhqhp8aKRQn85fqRVJ7hBWlBE9QyN1mBbLt+ZpWL
         NSYevghX1DskF9Y+3TAz0mqerfCOfE+/Zx9AOcr8+BswL1V//NKQLuaiqwHbIfKH31nT
         7qTYUdeCf8/BzUgtfXwS8bxZwk40uNlkUZg2MWIJ5dQm6dT7UplVnlP2UncNoNftsUJx
         2zu9eKashWM9PiXhMb2vHe+uM14sil8SGQ6sG5hgietpbfZJb1Lw4qOVM4lwPMYAgk5g
         pj5Z8Z3No2N2xTKIwMLn2rD22uHI2y4Hj6zQNbu+tk7tJh6HtNC8X7zfHRmAd3P2nAcx
         BO0g==
X-Gm-Message-State: AOAM5329Wv6FQI3SMLfml2SgHG40vIlH8FGSivVDKxdE7+ynACoz6qKj
	Bvfg/v/5GIQ8FVP1vWK/u80wHvVw4vc=
X-Google-Smtp-Source: 
 ABdhPJzfCIjY4Z688CqaSbCmzeNdJF3+aCuMi0uy8Suly2q098tsSK5EBAOtR4TZQ5CAm7BmypD8Hg==
X-Received: by 2002:a17:90a:e015:: with SMTP id
 u21mr3248011pjy.43.1633620660522;
        Thu, 07 Oct 2021 08:31:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:fe70:32cd:915b:f655?
 ([2601:202:4180:a5c0:fe70:32cd:915b:f655])
        by smtp.gmail.com with ESMTPSA id
 r130sm17340577pfc.89.2021.10.07.08.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 08:31:00 -0700 (PDT)
Subject: Re: [oe] Honister branch created for meta-openembedded
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: 
 <CAMKF1sqWQXyp+n6vR3cn9HjPgF+ubzYgi0=EoVNF+H3f5QUJoQ@mail.gmail.com>
 <CA+chaQdd4LEN+wbmGZwkj9FYotJ7urCGQnr3LTYSm7UBKMd-iw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f039505b-4494-7396-a2b1-1c3f79a304fb@gmail.com>
Date: Thu, 7 Oct 2021 08:30:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CA+chaQdd4LEN+wbmGZwkj9FYotJ7urCGQnr3LTYSm7UBKMd-iw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Oct 2021 15:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93204


On 10/7/21 8:06 AM, Martin Jansa wrote:
> Can we please merge master into honister branch?
I did that for hardknott and got a bit of flack from the community for
doing that.

I am damned if I do and dammed if I don't.
>
> The gattlib fix is needed there as well to fix:
> ERROR: gattlib-0.2+gitAUTOINC+5c7ee43bd7-r0 do_package_qa: QA Issue:
> gattlib rdepends on glib-2.0-dev [dev-deps]
>
> IMHO it would be better to keep honister and master branch identical
> until there is first change in meta-oe which shouldn't be included in
> honister.
>
> Doing separate builds for master and honister now, when they both
> depend on identical oe-core (except the branch name) also isn't needed
> and only causes extra maintenance overhead.

Well, I have been working on setting my honister build env so I have
been focused on other things. will pick up the additional changes shortly.

-armin

>
> Now it already isn't the case due to the README update only in
> honister branch, so they cannot be identical as they are in e.g.
> oe-core and other layers (unless you want to force-push to remove
> README update until the branches really need to be separate).


>
> Regards,
>
> On Fri, Oct 1, 2021 at 7:35 AM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     Hello All,
>
>     honister branch for the upcoming 3.4 release has been created for
>     meta-openembedded layers
>     Armin has graciously offered to continue as stable maintainer for this
>     release as well.
>
>     Please test it in your honister based distro setup and report any
>     issues you might encounter
>     master branch continues to accept changes as usual
>
>     Thanks you
>     -Khem
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#93184):
>     https://lists.openembedded.org/g/openembedded-devel/message/93184
>     <https://lists.openembedded.org/g/openembedded-devel/message/93184>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/85992208/3617156
>     <https://lists.openembedded.org/mt/85992208/3617156>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://lists.openembedded.org/g/openembedded-devel/unsub>
>     [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


