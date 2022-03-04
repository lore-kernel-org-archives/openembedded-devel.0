Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474CCC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:52:27 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.8568.1646409146081190289
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JeoRHABN;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id n11so7688416qtk.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=T7hEoXrQiA3sgfwgOtmmFb9Ky2nWr5Eo2Mw3z8Ma+dg=;
        b=JeoRHABNgRTEX6skiCM05q4RBj77f8K4IdBhjr94rRp5MjIydMo8eEz2VvJX+3Yxqw
         XJXzBulc2dlGuNrlhxhxiPS9S2DOEWJkRmuJNxggK+k8Y/gItfWKdNNJohynrX1G1xPE
         BhPXS9EVAAPtAZwas3kMj+Qu0kJtXo21Y46j8pFfJGaC5v3prZ/pP4WIZAaIa3Tlbhxw
         kY9Bdcer9pAs2Bya4vQ32luT5CkGdy4d2EDVIhhNCANWnzQ+/XENdQKOLtwSsAbSyOlu
         3e/BWshsC9kudCDxNowzDrXXhKwjooBIVHa9w6uMIKjDDnrtJm33YtD7PT4zMi0Z2Rut
         EhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=T7hEoXrQiA3sgfwgOtmmFb9Ky2nWr5Eo2Mw3z8Ma+dg=;
        b=mXW0W+iE/pP8a5SNI8CYeFJgTyXdh6SFswWkzoPeRx67Pj7bnQYvr2J2KS+9dg47TM
         xAUwtVx8ZC2GVVCPlcz6+DJDWtw6h/c+4ic0ML/N9mEDQTKW0PWzqgmkUxc1NrF12Y95
         sBRsLcZ7Z0gzISsHfbGC8mhQotUWuy+BaxNGzCz5/i/U2ZHORL5AwoiL3k+tNH3SGmZu
         IMTqt/7kSb6RhnhznybD1Mdq4GHzvxyda2pqpknR2MLhR0g0qkIuV0LJSM137rulKpJX
         qYKk3N6fFodptl2IavQigkILivlMD7a0ku351YQgwB+jvQ3bWguDyTRx3sVkNxfLh0lg
         BmZQ==
X-Gm-Message-State: AOAM5306muUYrHDxJM4/GZo5zVEPHBxNmj9tjVfnu7XCrRSnQyha/xmI
	XHdAGPNpGzaWZjpUMhZaPD0srKB3mZ0dwRBMIwo=
X-Google-Smtp-Source: 
 ABdhPJzsR7kfAh47jw5nZ7pn94jXxo7xaAva5VN8ieaRWo2/OFWFVwppSEXwOCzMt3QaPamSR1/KLS2QrwI+CbcMudc=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr31979021qtc.54.1646409144993; Fri, 04
 Mar 2022 07:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20220228155714.7894-1-jsbronder@cold-front.org>
 <CAMKF1spdXVvNtLfq=-GBRROe+-=D0jZ+9Pg=EfaoK55A7uqtuw@mail.gmail.com>
 <YiEOlH9jmQ/3JEjo@ravine.members.linode.com>
 <CAMKF1sr4g7bZVF+=asUsmpZutoak1HFO79GmN_UnnRiqYSo1Kw@mail.gmail.com>
 <YiIv7PqwqdTxKDid@ravine.members.linode.com>
In-Reply-To: <YiIv7PqwqdTxKDid@ravine.members.linode.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 07:51:59 -0800
Message-ID: 
 <CAMKF1spfMDpjR-3RkaeT_UFN0xuGcWBcfoSBRoPaHyg2pqbhkw@mail.gmail.com>
Subject: Re: python3-crc32c: add 2.2.post0
To: Justin Bronder <jsbronder@cold-front.org>, Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 15:52:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95789

On Fri, Mar 4, 2022 at 7:27 AM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> On 04/03/22 00:04 -0800, Khem Raj wrote:
> > On Thu, Mar 3, 2022 at 10:53 AM Justin Bronder <jsbronder@cold-front.org> wrote:
> > >
> > > Ah right, this package only support arm or x86.  I'll send an update.
> >
> > actually thats not the case, it tries to use SSE when target is x86
> > and crc extensions on aarch64, for
> > other architectures it uses general purpose instructions.
> > however it uses wrong way to detect platform by poking at build system
> > for platform architecture
> > I have sent a patch to fix it.
>
> You're much quicker then I am.  However, based on
> https://github.com/ICRAR/crc32c/pull/10 I think we can simply update setup.cfg.
> I'll send a patch in case you prefer that mechanism, but no problem if patching
> setup.py is preferable.

That patch seems incomplete, it does not consider the arm/aarch64
piece which perhaps
is added after that pull was created. So someone needs to forward port
that patch and
refresh the pull, until then my proposed patch is more comprehensive.

>
> I did try passing '--platform=${TARGET_ARCH}' but bdist_wheel didn't recognize
> the parameter.
>
> >
> > >
> > > On 02/03/22 18:47 -0800, Khem Raj wrote:
> > > > I am seeing a failure with clang on non x86 host. See
> > > >
> > > > https://errors.yoctoproject.org/Errors/Details/650724/
> > > >
> > > > On Mon, Feb 28, 2022 at 7:57 AM Justin Bronder <jsbronder@cold-front.org> wrote:
> > > > >
> > > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > > > ---
> > > > >  meta-python/licenses/CRC32C-ADLER                | 15 +++++++++++++++
> > > > >  .../python/python3-crc32c_2.2.post0.bb           | 16 ++++++++++++++++
> > > > >  2 files changed, 31 insertions(+)
> > > > >  create mode 100644 meta-python/licenses/CRC32C-ADLER
> > > > >  create mode 100644 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > > >
> > > > > diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/CRC32C-ADLER
> > > > > new file mode 100644
> > > > > index 0000000000..f1f0e94ee0
> > > > > --- /dev/null
> > > > > +++ b/meta-python/licenses/CRC32C-ADLER
> > > > > @@ -0,0 +1,15 @@
> > > > > +This software is provided 'as-is', without any express or implied
> > > > > +warranty.  In no event will the author be held liable for any damages
> > > > > +arising from the use of this software.
> > > > > +
> > > > > +Permission is granted to anyone to use this software for any purpose,
> > > > > +including commercial applications, and to alter it and redistribute it
> > > > > +freely, subject to the following restrictions:
> > > > > +
> > > > > +1. The origin of this software must not be misrepresented; you must not
> > > > > +   claim that you wrote the original software. If you use this software
> > > > > +   in a product, an acknowledgment in the product documentation would be
> > > > > +   appreciated but is not required.
> > > > > +2. Altered source versions must be plainly marked as such, and must not be
> > > > > +   misrepresented as being the original software.
> > > > > +3. This notice may not be removed or altered from any source distribution.
> > > > > diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > > > new file mode 100644
> > > > > index 0000000000..0d51420939
> > > > > --- /dev/null
> > > > > +++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > > > @@ -0,0 +1,16 @@
> > > > > +SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
> > > > > +HOMEPAGE = "https://github.com/ICRAR/crc32c"
> > > > > +
> > > > > +LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
> > > > > +LIC_FILES_CHKSUM = " \
> > > > > +    file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
> > > > > +    file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
> > > > > +    file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
> > > > > +    file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
> > > > > +"
> > > > > +
> > > > > +SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
> > > > > +
> > > > > +inherit pypi setuptools3
> > > > > +
> > > > > +RDEPENDS:${PN} += "python3-core"
> > > > > --
> > > > > 2.35.1
> > > > >
> > > > >
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#95585): https://lists.openembedded.org/g/openembedded-devel/message/95585
> > > > > Mute This Topic: https://lists.openembedded.org/mt/89453390/1997914
> > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > >
> > >
> > > --
> > > Justin Bronder
>
> --
> Justin Bronder

