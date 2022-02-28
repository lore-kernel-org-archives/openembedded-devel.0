Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C40C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 23:15:22 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.2038.1646090121117719969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mCJtn6U4;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id d3so15294309qvb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4x+VSPHO67tyGHqigfN0p8gMcgNnPetTkyP9WLTa7Qo=;
        b=mCJtn6U4vMYAgW+nmtpXxUCeuCBCxyx59buu1cj14LRi+CeTLlW8ZaR04F5RzmSt9Q
         xrTM24w+cFPyJcDSntOO7NK+lCufRLXjynRjxwZ9qun/bl6NUdLv0qjGP1QuDpzCAmmp
         QnLBibRKs8lWSbQHHIE7WrwRTdgw08Ovc06mYazkObJPNsI3glazRpJRjKZPTPbUypqs
         0J3vKgKeexYRvC/jdpSjHxYdpNoRuas4r+zWB9XlQZZh6VaxSiv1Zb74N1DOPAhHx2es
         h0ZC4Touxr751hGCJjZp5aPnPcT0S8L4xb2sKX9T3uLYyrMzawMt2oJKKQpleRnwMFHt
         zLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4x+VSPHO67tyGHqigfN0p8gMcgNnPetTkyP9WLTa7Qo=;
        b=N6/9eVz1DVujCUi43ricdv8U0r+zvBvkUiYhx+mERJjFQCL225AvapVzcSb1fynSBo
         EUgU9BOHu+gMV0XQ3hokkuJGEeNnLaOKzEhPwSHV4EIfVFaERvvJ1qoj2/6t6vqQQZBo
         wB8EYxbOgSn8etFO9bWmQpapL5r0UoOYaLoTW/PdZGh+iYXsgpbqC9rFdT/crPdTtF7i
         sizL+E1HjB9+ZAmxXitPH9NOayieriMAMu/up6hvGM1GsYqeP9RbTu4jPtijBSJUgftL
         GfLjvy/YeblGdjHKldTqiNmFAWIj8jnX3CGBYBaqQLRQX2yGU09MRQ8bd+6c9ryjAsDa
         OnSg==
X-Gm-Message-State: AOAM532h7V4iq5q1ynLImWJbNvemtv8iyxZNW85wEC21fYs88FCxPiLd
	h68Mb9rXB3b7/2jEc1RSRtebmnN82CtxmP2WgQ8=
X-Google-Smtp-Source: 
 ABdhPJxSswLOD9KVqvUWdaw7/DEZd2QfxXezIhouhHdMRnl+AnJQa2O8O1CBBXOmUqi6rvkCveJQ9L4TwSGJ1hdNjE4=
X-Received: by 2002:a05:622a:104c:b0:2de:377e:25d9 with SMTP id
 f12-20020a05622a104c00b002de377e25d9mr18092331qte.229.1646090120052; Mon, 28
 Feb 2022 15:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228224810.218466-1-raj.khem@gmail.com>
 <Yh1TI+NaXzec30cv@ravine.members.linode.com>
In-Reply-To: <Yh1TI+NaXzec30cv@ravine.members.linode.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 15:14:53 -0800
Message-ID: 
 <CAMKF1sqNZo5OhfFWdYOtcUh5di4qHWLx=Y3FJs9YxO74j2pVLw@mail.gmail.com>
Subject: Re: [oe] python3-termcolor: Use setuptools instead of distutils
To: Justin Bronder <jsbronder@cold-front.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 23:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95609

On Mon, Feb 28, 2022 at 2:56 PM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> So, am I right to stand corrected that patching stagnant projects to use
> distutils over setuptools is preferable to dropping the recipe?  I had assumed
> from other distribution work that cleaning things out when the opportunity arose
> was the norm.  If so, I'll stop trying to figure out if upstream is active and
> will fix the package along with sending patch upstream.

you are doing the right thing and removal is on cards. These recipes
were however added in 2019 and 2020 into OE
so I thought of giving an opportunity to original submitters to
comment before we can remove them.

>
> Regardless,
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
>
> On 28/02/22 14:48 -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  ...-Use-setuptools-instead-of-distutils.patch | 27 +++++++++++++++++++
> >  .../python/python3-termcolor_1.1.0.bb         |  3 ++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> > new file mode 100644
> > index 0000000000..a55a6a914b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> > @@ -0,0 +1,27 @@
> > +From e30308284c721210e2ba50d8b3d159cedf5eada8 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 28 Feb 2022 14:44:42 -0800
> > +Subject: [PATCH] setup.py: Use setuptools instead of distutils
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + setup.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/setup.py b/setup.py
> > +index c4fe4ed..dad1d29 100755
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -23,7 +23,7 @@
> > + # Author: Konstantin Lepa <konstantin.lepa@gmail.com>
> > +
> > + import os
> > +-from distutils.core import setup
> > ++from setuptools import setup
> > +
> > + prjdir = os.path.dirname(__file__)
> > +
> > +--
> > +2.35.1
> > +
> > diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> > index 17df7f983d..15bab622a6 100644
> > --- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> > @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
> >
> >  inherit pypi setuptools3
> >
> > -SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
> > +SRC_URI += "file://0001-setup.py-Use-setuptools-instead-of-distutils.patch"
> > +
> >  SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
> >
> >  BBCLASSEXTEND = "native"
> > --
> > 2.35.1
> >
>
> --
> Justin Bronder
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95607): https://lists.openembedded.org/g/openembedded-devel/message/95607
> Mute This Topic: https://lists.openembedded.org/mt/89463744/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

