Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0D0C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 18:58:44 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.65709.1638212322853142529
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 10:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ejbMqfsE;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id z9so17623771qtj.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 10:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=waepRBuMAOnRjMvMKMN9WqZdekY8219A8fyWGQ5vdoU=;
        b=ejbMqfsEOsJqn+A6cZSAL9AYrcnzgidaoiyayk124qiXfc92cDt3l0fNFl0cPMlG8V
         CzUYwr6Z/4bVHhNL8KTQ4DzDF9ybflUC8jlk7om31/eHwDEpp6QIe6vCcT8aIjAC2H76
         Z26u+hiwD1h+QiduhK6mOYwVYA33A1OSKDDmcTiqAMHovkuw7SogPY6lKzqHL0U69UYv
         jXLJnhFrxs96Bv0yKVFw/MS/iaxP8arWBOV7uJT9hytFPmt6raFApxsOdY7X+N+Bj7qq
         K6VLAeJ5FmcN3I75KlKB4sGziyyi6Q2RnATvDx384VT6gHvRQo/DpGHjPZLaxWYPSZLM
         xOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=waepRBuMAOnRjMvMKMN9WqZdekY8219A8fyWGQ5vdoU=;
        b=6YA+wAyRpfTxasqOYjeyedXsvRPesBgEvkiHtNNbOYEZzu9znzn3W5+sWiS0izaAYX
         BTE6s7h1U+F8wyZx8VK97J96nxRQnVW02eLlfxyhh6dRXve/uqJQmXWVR6MDD31vD+To
         vVXr+knFDx1vonJ+m2Fb8ap5182Bs4GU9B++3VaQk2QbnSNYAvdVTsauG5i1EC4o9HcG
         HXB7OWOf/0AnLf47Dv8TaKZ0B43qAccEkSVyGlYPcb0f31GuYJNebKrApytmYn97R+Ky
         BjcBU86v1miaNwI1ug30Nu2YcA/nMJsVpNK2tzKXLrzfit4YkorBGiDkqzI2YB1NWXQA
         ts2Q==
X-Gm-Message-State: AOAM533bnkPaTKcAXRGnsSmVHFcPArV5bxibzgVq4ckXHKMSDkG69RrV
	T+stTZNBca3QrDcBaWZOwHuOzqY2tRF5QVktDyv41V/rUMvQkw==
X-Google-Smtp-Source: 
 ABdhPJw+yW737Jd0HFDd2dde5ajltPHTwXpjRV3Y0DrpQ+Hs/BSKnkddauPHQK+NDsjX25PhcxOvE9MVT9ooFgN7nW0=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr36534428qtf.660.1638212321868;
 Mon, 29 Nov 2021 10:58:41 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAHMaQtB6aySwe6DjrGmAZXj9c8i1v6MSCX-Hfe7k3pvxW3RJtg@mail.gmail.com>
 <2076fc48-04ee-b7db-65d1-062c5438477f@gmail.com>
 <CAHMaQtBrRoXryLp3oZjuh5jWv8oJ5VButa2VUj3H3-2yHrVLrw@mail.gmail.com>
In-Reply-To: 
 <CAHMaQtBrRoXryLp3oZjuh5jWv8oJ5VButa2VUj3H3-2yHrVLrw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2021 10:58:15 -0800
Message-ID: 
 <CAMKF1so+i7gQgMJqjCam=LAWwHJKKi2a+aObko=Ljrd4m5xyzw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-coloredlogs: Added nativesdk
 python3-docutils: Added nativesdk and native python3-humanfriendly: Added
 nativesdk
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 18:58:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94142

On Mon, Nov 29, 2021 at 9:35 AM Windel Bouwman <windel.bouwman@gmail.com> wrote:
>
> This patch is for the hardknott branch. I'm sorry I did not tag it as such.
>

python3-coloredlogs was still needed in master so I took that part,
I think you should look into master and do relevant backports instead
of writing specific patch

> On Mon, Nov 29, 2021 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> which branch are you proposing this patch for ?
>> it seems to be not applicable to master and if its meant for release
>> branches then tag it with appropriate release branch name in subject line.
>>
>> On 11/29/21 12:42 AM, Windel Bouwman wrote:
>> > These changes are needed in order to build colcon as an SDK package.
>> >
>> > Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com
>> > <mailto:windel.bouwman@gmail.com>>
>> > ---
>> >   meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
>> > <http://python3-coloredlogs_15.0.bb> | 2 +-
>> >   meta-python/recipes-devtools/python/python3-docutils_0.17.bb
>> > <http://python3-docutils_0.17.bb>    | 2 ++
>> >   .../recipes-devtools/python/python3-humanfriendly_9.1.bb
>> > <http://python3-humanfriendly_9.1.bb>        | 2 +-
>> >   3 files changed, 4 insertions(+), 2 deletions(-)
>> >
>> > diff --git
>> > a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
>> > <http://python3-coloredlogs_15.0.bb>
>> > b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
>> > <http://python3-coloredlogs_15.0.bb>
>> > index daeda6b2e..da4f7a574 100644
>> > --- a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
>> > <http://python3-coloredlogs_15.0.bb>
>> > +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
>> > <http://python3-coloredlogs_15.0.bb>
>> > @@ -20,4 +20,4 @@ RDEPENDS_${PN} += "\
>> >       ${PYTHON_PN}-humanfriendly \
>> >   "
>> >
>> > -BBCLASSEXTEND = "native"
>> > +BBCLASSEXTEND = "native nativesdk"
>> > diff --git
>> > a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
>> > <http://python3-docutils_0.17.bb>
>> > b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
>> > <http://python3-docutils_0.17.bb>
>> > index 8605e93b5..f8cd205fa 100644
>> > --- a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
>> > <http://python3-docutils_0.17.bb>
>> > +++ b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
>> > <http://python3-docutils_0.17.bb>
>> > @@ -7,3 +7,5 @@ LIC_FILES_CHKSUM =
>> > "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
>> >   SRC_URI[sha256sum] =
>> > "e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"
>> >
>> >   inherit pypi setuptools3
>> > +
>> > +BBCLASSEXTEND = "native nativesdk"
>> > diff --git
>> > a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
>> > <http://python3-humanfriendly_9.1.bb>
>> > b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
>> > <http://python3-humanfriendly_9.1.bb>
>> > index fb6a7e3b6..a5f2031b2 100644
>> > --- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
>> > <http://python3-humanfriendly_9.1.bb>
>> > +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
>> > <http://python3-humanfriendly_9.1.bb>
>> > @@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-target += " \
>> >       ${PYTHON_PN}-stringold \
>> >   "
>> >
>> > -BBCLASSEXTEND = "native"
>> > +BBCLASSEXTEND = "native nativesdk"
>> > --
>> > 2.25.1
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#94133): https://lists.openembedded.org/g/openembedded-devel/message/94133
>> > Mute This Topic: https://lists.openembedded.org/mt/87373885/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

