Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAC7C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:39:07 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.1604.1646087942711598161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SHGwtM7X;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id t21so11611922qkg.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4facPWChY0B7mzUF/CA3MLLS/QrrSYd2PV+nbunp4eM=;
        b=SHGwtM7XWPzLd20ZkdRYIgcyftzViZAUnuga5uKnqAuCdgJqpUgUrUITqQ52QcVuCN
         iUokhttEcQhrYQhzzvBmF6OnEkpW+VWsuA13gVeH6fh4eUN+oEa7goM1Cn0yoy/nloyH
         bFoEiP6HrAj8+J4sE75+1aAWA7LVK2P80zlXvXk7iYzjf6lv74mB+oEvJGM1qkGvr4aH
         PrveQdtwut9VsP1b51OpKC6DP3Le9248fjimLvR65eux7q7RiQf8JRAH6M1wS3SzEWji
         EHRBqx7RPl3qMoqW08VFuj0mUHL3KVRsdozA0lrmzLdPpJLofqu8ooAHYw7WH3cSe5+S
         2+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4facPWChY0B7mzUF/CA3MLLS/QrrSYd2PV+nbunp4eM=;
        b=Kmwx60FZraGlrLNq3lrC+sQHv5mQjWRAPP+h93Mo79v1NpvkdEPzRxuWmVLTYv3B8+
         AHaHEWztAyhym6tlqL0WMybS0DoLhURzp2ZHZzXi78oI1pzCBHfcgqSaiQAm3i+Gm610
         IBiEFZVy1vd3gLgmiMQXrKvfVNN7VNHR3J+td9Yl0yssI8AEdQDVAUAf+xe1FxXy3BmB
         txSixJr2Fg9eRJgPm8KCHZc73edNW78J0CvJF28ud3EH/lbekEqmfEM2qQQF76oCaNmA
         1i6wmAlftilHEEEMJRt3w/UAHPWEh1JkEfLoM2hK37IYvD8llW9LX7dtPfhJ4nxg+URO
         Yk7Q==
X-Gm-Message-State: AOAM532425773ZVMrqQHD2inYVDLvtxqSwIm5oa0pVbDPChZ9dQe77V4
	P78/8JsF7LPT7SyxJum9HAwoJvjnwC64znriuhI=
X-Google-Smtp-Source: 
 ABdhPJyKCUhliNDaZE/RzyfBXnolSiUHvXqeseCur98neMc1o/7SZKC9MrUHTEHpalGbTBxNf9Kw5TmEXZtQrMEb8BA=
X-Received: by 2002:a05:620a:16d5:b0:60d:d3a7:af9e with SMTP id
 a21-20020a05620a16d500b0060dd3a7af9emr12300755qkn.463.1646087941698; Mon, 28
 Feb 2022 14:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20220228222206.25716-1-jsbronder@cold-front.org>
 <CAMKF1sppTUJmQQ0QgfE0j3i7ZqRAATPLA+2o3sKy1_Cd_3d51g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sppTUJmQQ0QgfE0j3i7ZqRAATPLA+2o3sKy1_Cd_3d51g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 14:38:35 -0800
Message-ID: 
 <CAMKF1sq5Z5Vwx60Kym1wV8uN5taFeZ0dOxZ4EW4eY_6bkzCasQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-configobj: drop recipe
To: Justin Bronder <jsbronder@cold-front.org>,
 Armin Kuster <akuster808@gmail.com>,
	Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:39:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95604

oh well Tim already fixed it, I would suggest you use master-next for
this work since it has latest collaborations from everyone.

https://patchwork.yoctoproject.org/project/oe/patch/20220227234254.1089695-1-tim.orling@konsulko.com/

On Mon, Feb 28, 2022 at 2:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for looking into this, Armin added this recipe in 2020, I would
> like to hear from him as well on what this recipe's future plans are.
>
> On Mon, Feb 28, 2022 at 2:22 PM Justin Bronder <jsbronder@cold-front.org> wrote:
> >
> > The last official release, 5.0.6 is from 2014 and does not build with
> > bdist_wheel.  The upstream repository does appear active but it's
> > unclear if anyone has the ability/motivation to tag a new release or
> > upload it to PyPI.  If you depend upon this recipe, please work with
> > upstream to tag a PEP-517 compliant release.
> >
> > https://github.com/DiffSK/configobj/issues/160
> > https://github.com/DiffSK/configobj/issues/197
> > https://github.com/DiffSK/configobj/issues/204
> >
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  .../packagegroups/packagegroup-meta-python.bb            | 1 -
> >  .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 ---------
> >  2 files changed, 10 deletions(-)
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> >
> > diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > index dbfa991ebe..6b10913657 100644
> > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > @@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
> >      python3-colorlog \
> >      python3-colorzero \
> >      python3-configargparse \
> > -    python3-configobj \
> >      python3-configparser \
> >      python3-configshell-fb \
> >      python3-constantly \
> > diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> > deleted file mode 100644
> > index 1b85368105..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> > +++ /dev/null
> > @@ -1,9 +0,0 @@
> > -SUMMARY = "Config file reading, writing and validation."
> > -SECTION = "devel/python"
> > -LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
> > -
> > -PYPI_PACKAGE = "configobj"
> > -SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
> > -
> > -inherit pypi setuptools3
> > --
> > 2.35.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95601): https://lists.openembedded.org/g/openembedded-devel/message/95601
> > Mute This Topic: https://lists.openembedded.org/mt/89462996/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

