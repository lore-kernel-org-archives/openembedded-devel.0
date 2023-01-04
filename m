Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C13C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 18:11:54 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.20303.1672855909952260530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 10:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mml4ajqk;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id i127so30177332oif.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5/cndawpd/t+czj60wdpbJKsWkvXLA3TJCjAZP80Tk=;
        b=Mml4ajqk2qgo5FrqGJbxiDH9AvIa3x7gKa5IDjeuTHA0x681acE1Si7UPpjnM1QW0i
         fDL2Xb669XshL8SLJZ15MSZsPKFKtLO0kXd3bwASYNkq6Lj1O2y2dDVmSxN+T217Wbl9
         4t6lOUqkhNwSvTN2s+bm2DhfHkuGejJ3DJYasoxUBS1wvboZ6uJbfyztzGqB3N65PNK1
         4+SpcXfdBIdobQRwPbDSzUNiFV9Bf5I5SBSBl0Y32NB1OXfPYEHqXqtEtKrB8z4G18j+
         qGSAGwk356WIGrUBcEGkXbyN/iA4syR7DR0Fh14S2JQBNx4cKnAZYyVUOh4n88JGGIQ1
         NMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5/cndawpd/t+czj60wdpbJKsWkvXLA3TJCjAZP80Tk=;
        b=EIhBNcQAwvIX/gKHT5+/CkYaxy57yYpmna5aP1GC9UIA5tOxADPY3csqvtr54WjrQB
         vvjYTiOZrNApqEHGthVsRUwoKwLIh4UyIGwvTjo+RiuilBF370VSdCcgHNVL2mGG781W
         99RqvahNxCkgXxbF/xo5MzciV8v631jCRklh/MlKCXIEN6LdzOS6XkK+PkMxXmbx0Iap
         kooE47Xym8jeI6l0JEp47FdqHbaqo+X5+Yv68ixRVAmly3rjhXJMiRdJieBHT2E2TBiL
         0DZ/l91SGBr46g7n8cLbEucJG/K9pQ7voMkvFKAZmU5a9oPhj0oZix9h7tfeSp+v86mq
         PAvg==
X-Gm-Message-State: AFqh2kpn7PR73800TUr+nypu9TplRijdhEzHpeFPeK2ogBzOSpJXV4Zk
	SAUDhEvrnszSulJV14hiHbhnLqteDdDg0yw8H2U=
X-Google-Smtp-Source: AMrXdXulwqpggRA53huctXgSw8s+xG5komczr0DwdPe0VL4vXZSzcfyDu3hku89wZ+TKJhhng4n9frdOTRlKaEdUrnY=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr1948919oib.55.1672855909119; Wed, 04
 Jan 2023 10:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20230104112157.2537461-1-alex@linutronix.de> <CAMKF1sr8vfyye2mNQMeZ-F3zymftt1zsM7tn-Dt=eT8sweRZOA@mail.gmail.com>
 <CANNYZj92uX2WYu=BqbYZqAZETPb+nToWFBvxNiaQWyYCdMZAEA@mail.gmail.com>
In-Reply-To: <CANNYZj92uX2WYu=BqbYZqAZETPb+nToWFBvxNiaQWyYCdMZAEA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2023 10:11:22 -0800
Message-ID: <CAMKF1souVEXyDrfZ_yZ3UzdRQAdGeeYFGuvRr6mnC-pMcEr0zw@mail.gmail.com>
Subject: Re: [oe] [PATCH] packagegroup-meta-python: drop python3-strict-rfc3339
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 18:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100401

On Wed, Jan 4, 2023 at 10:09 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> No, jsonschema is fixed to not use the removed recipe. I sent a gigantic patchset to core a few hours ago with all that.
>

OK thanks

> Alex
>
> On Wed 4. Jan 2023 at 18.00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Jan 4, 2023 at 3:22 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> >
>> > This has been unmaintained, not needed by anything and is now
>> > removed from oe-core.
>>
>> There is also python3-jsonschema in this packagegroup which depends on
>> python3-strict-rfc3339
>> perhaps that needs to go as well ?
>>
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
>> >  1 file changed, 1 deletion(-)
>> >
>> > diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> > index 4e318967d..2275ccd6c 100644
>> > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> > @@ -414,7 +414,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>> >      python3-sqlparse \
>> >      python3-sqlsoup \
>> >      python3-stevedore \
>> > -    python3-strict-rfc3339 \
>> >      python3-supervisor \
>> >      python3-sympy \
>> >      python3-tabulate \
>> > --
>> > 2.30.2
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#100397): https://lists.openembedded.org/g/openembedded-devel/message/100397
>> > Mute This Topic: https://lists.openembedded.org/mt/96048124/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

