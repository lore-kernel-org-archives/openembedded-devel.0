Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A655EC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:59:10 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.3589.1646099949530517869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iLbZvB4q;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id a1so4248088qta.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cRQwNAzh7ld/4es6XqjofoGi+P3MZV8QwIhycYkT6mQ=;
        b=iLbZvB4qybqSct0FsJYluFPrDw1hb/+DgNCkj3sbYdr3iDzbpWosRJpw8JQ77LazE0
         DNw0eAhBYLR1XvZ4rumP8zmUBXr42yM3SpriU3re+L2pH55z4PC/wptTHmiPxJp6qi6r
         o3Px+VCavsWVWOFJrJzONMP+Ez01yqOnXbgqomXLmhQdskft1W7rY/zjK4SxG45OzIC5
         swIPW34/bYjArUwhKGH7VJMQmQanY013J8vOeetkzOcxWaDUHcyJkWX231DgVRJr2Mxe
         Ms+KR2KCxgls3fsaEwV45Ex6hMSZzEnA9+d22aWDRj5lfkbmfgmxT/Htx6Ie9Q+RW+hm
         XTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cRQwNAzh7ld/4es6XqjofoGi+P3MZV8QwIhycYkT6mQ=;
        b=Osmm3Tkjd6WjYKI83yx7ZY0DqrBkbGVVBoJ3VslhOUg9CVyH12fvy+pySfy7ASyzGF
         WsX0of3qjXqLSj0cOI9GjaKG7SPN79HHGPbOYdJNAaQMMfnIPD9nLKO4hxQNG6p38Rxf
         l9/YOoViXxp/jrhRvwWlNcPgIIEmgIFHEQoNSC3W2A5rHwJZtLGrL5DSbhBwndeDYqW2
         46cw+atEJFHq+VZsjs/dgedph+Ppk7xhkukc27X9Xj5Ko7kQ0LqT74/GfkYM/VAt3oar
         wXZxsHbYgW6sb7beKf3ChXCVaYzaux+h+BTU5RtUQtg/MwV5Z8boS8jaBrW1lpaYBBWF
         kKAw==
X-Gm-Message-State: AOAM5318mSSqM36DMvWGlranJb3dESJ4s/4XAqhAPREv6GPiLyDC6INF
	VteMUiZP1hbAoORd9GVatiaFErMxMLhl9Ua48cEGp4TpQI0=
X-Google-Smtp-Source: 
 ABdhPJx2SIwzKYFo3WGYEOigXBExJfPznrly4BdXn5ynY7jocMh8QgSmqKBTqT4s5nvxIC9R/iWEp1FelOEClUCp0PU=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr18456999qtc.54.1646099948505; Mon, 28
 Feb 2022 17:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20220228222206.25716-1-jsbronder@cold-front.org>
 <CAMKF1sppTUJmQQ0QgfE0j3i7ZqRAATPLA+2o3sKy1_Cd_3d51g@mail.gmail.com>
 <CAMKF1sq5Z5Vwx60Kym1wV8uN5taFeZ0dOxZ4EW4eY_6bkzCasQ@mail.gmail.com>
 <Yh1TyAUZz6bCAIba@ravine.members.linode.com>
 <CANx9H-Ba16h+X4p_thHhzSMeCy3feC+Hvj+Y7XHDB6pAE83uzw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-Ba16h+X4p_thHhzSMeCy3feC+Hvj+Y7XHDB6pAE83uzw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 17:58:42 -0800
Message-ID: 
 <CAMKF1srLJovLtF9kfMrXtYbzaUgxH53jDup-MXrUXdXwR=XaYw@mail.gmail.com>
Subject: Re: [oe] python3-configobj: drop recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: Justin Bronder <jsbronder@cold-front.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 01:59:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95616

On Mon, Feb 28, 2022 at 4:50 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Mon, Feb 28, 2022 at 2:59 PM Justin Bronder <jsbronder@cold-front.org> wrote:
>>
>> On 28/02/22 14:38 -0800, Khem Raj wrote:
>> > oh well Tim already fixed it, I would suggest you use master-next for
>> > this work since it has latest collaborations from everyone.
>> >
>> > https://patchwork.yoctoproject.org/project/oe/patch/20220227234254.1089695-1-tim.orling@konsulko.com/
>>
>> Ah, will do.  I was just searching subject lines for patches posted to this list
>> and missed the typo in the subject line ;)

yes good find.

>
>
> Ugh. Fly fast and typos happen.

No worries, I have it taken care of on master-next

>
>>
>>
>> >
>> > On Mon, Feb 28, 2022 at 2:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > > Thanks for looking into this, Armin added this recipe in 2020, I would
>> > > like to hear from him as well on what this recipe's future plans are.
>> > >
>> > > On Mon, Feb 28, 2022 at 2:22 PM Justin Bronder <jsbronder@cold-front.org> wrote:
>> > > >
>> > > > The last official release, 5.0.6 is from 2014 and does not build with
>> > > > bdist_wheel.  The upstream repository does appear active but it's
>> > > > unclear if anyone has the ability/motivation to tag a new release or
>> > > > upload it to PyPI.  If you depend upon this recipe, please work with
>> > > > upstream to tag a PEP-517 compliant release.
>> > > >
>> > > > https://github.com/DiffSK/configobj/issues/160
>> > > > https://github.com/DiffSK/configobj/issues/197
>> > > > https://github.com/DiffSK/configobj/issues/204
>> > > >
>> > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
>> > > > ---
>> > > >  .../packagegroups/packagegroup-meta-python.bb            | 1 -
>> > > >  .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 ---------
>> > > >  2 files changed, 10 deletions(-)
>> > > >  delete mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
>> > > >
>> > > > diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> > > > index dbfa991ebe..6b10913657 100644
>> > > > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> > > > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> > > > @@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>> > > >      python3-colorlog \
>> > > >      python3-colorzero \
>> > > >      python3-configargparse \
>> > > > -    python3-configobj \
>> > > >      python3-configparser \
>> > > >      python3-configshell-fb \
>> > > >      python3-constantly \
>> > > > diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
>> > > > deleted file mode 100644
>> > > > index 1b85368105..0000000000
>> > > > --- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
>> > > > +++ /dev/null
>> > > > @@ -1,9 +0,0 @@
>> > > > -SUMMARY = "Config file reading, writing and validation."
>> > > > -SECTION = "devel/python"
>> > > > -LICENSE = "BSD-3-Clause"
>> > > > -LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
>> > > > -
>> > > > -PYPI_PACKAGE = "configobj"
>> > > > -SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
>> > > > -
>> > > > -inherit pypi setuptools3
>> > > > --
>> > > > 2.35.1
>> > > >
>> > > >
>> > > >
>> > > >
>>
>> --
>> Justin Bronder
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95613): https://lists.openembedded.org/g/openembedded-devel/message/95613
> Mute This Topic: https://lists.openembedded.org/mt/89463815/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

