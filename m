Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4E3C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:05:17 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.4828.1646381116074225429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KTVkG6CL;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id e22so6072164qvf.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=KpfnjkeVpFALKil2US3+kdu1le8Fa7gpWVvIIZ1DHfk=;
        b=KTVkG6CLZVyZuWBjJCR5HN/LO8WpnDvQybLKPzqWdjCVEMFfEmiO20MTRtjSw4F1sA
         BmLiSfiDExqHG+7rntNRbl3NFspf+1fU/SKtIZkECw63DUgRM3JiE+kXjHwjzRdASY/w
         9SAhlC+2N+uJWb3Jo86Ptqivtnbe7jxyVW98Tp7W0aMiCxFSu/en9Ief5rZF/pWW4/mq
         lGCrk4Zp9x1xOfH+BWHRE6zl84TEJ+PxGnCEnpHgk5NCCKlkCg7Dtok4B/bauluJBtzb
         QVB8SXAYcCetkxkMj1QUfhFOcd2dDxtKIkfoKzJ9WXnWMGt0uLzBNe8KmO8lHRnDwAzv
         Ggeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=KpfnjkeVpFALKil2US3+kdu1le8Fa7gpWVvIIZ1DHfk=;
        b=JdASckO4pZ3FLKDhUVqeeATr4AWzTVYCmEzV0B/lAFuWxEsnbQtNmofLZKoEmBABtY
         xj8i5mQjhRjcyft17H4uyjt0ev8uATSuu8utJs2c7WBqXSBeJXOFrDaHxaWZijEEjWKf
         3N6nwIAayl1fqhgOT5YkLgoIh7Qp37Uva0zGyW3uBQ899Gbn+6NWLwTTLzBF+GWYHHoN
         38OtTp+LswIpJLgBf5ZRPsNZGLDitaG1JeesYir37iR7VWBF9Z/eJOP8KWDdzw1ALAsG
         GHLFiAnumqhWTL0knNcl9r5S4EKwqgo8RtH+OIKLM6iMnxUROmvWHKd5GnP7CJNdhSdS
         xqPw==
X-Gm-Message-State: AOAM531tYNDfpoPL76ay8WOSJ0/wt8oJvKato1FpOEaffmg6vKPZHE2v
	HSGln6S2m9whoFUNNQqwqnv042ddZs5XtK7cw9g=
X-Google-Smtp-Source: 
 ABdhPJz7qmm34VGOOnfWs2CTIH/8GQIOCCSDnllp5vkloqPRRxrLxsu6XPllzQPlIjY5UDX5z2QGkNpE8QA2Vo13Uyw=
X-Received: by 2002:ad4:5dea:0:b0:433:2d8f:f85 with SMTP id
 jn10-20020ad45dea000000b004332d8f0f85mr15157170qvb.63.1646381115098; Fri, 04
 Mar 2022 00:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20220228155714.7894-1-jsbronder@cold-front.org>
 <CAMKF1spdXVvNtLfq=-GBRROe+-=D0jZ+9Pg=EfaoK55A7uqtuw@mail.gmail.com>
 <YiEOlH9jmQ/3JEjo@ravine.members.linode.com>
In-Reply-To: <YiEOlH9jmQ/3JEjo@ravine.members.linode.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 00:04:49 -0800
Message-ID: 
 <CAMKF1sr4g7bZVF+=asUsmpZutoak1HFO79GmN_UnnRiqYSo1Kw@mail.gmail.com>
Subject: Re: python3-crc32c: add 2.2.post0
To: Justin Bronder <jsbronder@cold-front.org>, Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:05:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95768

On Thu, Mar 3, 2022 at 10:53 AM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> Ah right, this package only support arm or x86.  I'll send an update.

actually thats not the case, it tries to use SSE when target is x86
and crc extensions on aarch64, for
other architectures it uses general purpose instructions.
however it uses wrong way to detect platform by poking at build system
for platform architecture
I have sent a patch to fix it.

>
> On 02/03/22 18:47 -0800, Khem Raj wrote:
> > I am seeing a failure with clang on non x86 host. See
> >
> > https://errors.yoctoproject.org/Errors/Details/650724/
> >
> > On Mon, Feb 28, 2022 at 7:57 AM Justin Bronder <jsbronder@cold-front.org> wrote:
> > >
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > >  meta-python/licenses/CRC32C-ADLER                | 15 +++++++++++++++
> > >  .../python/python3-crc32c_2.2.post0.bb           | 16 ++++++++++++++++
> > >  2 files changed, 31 insertions(+)
> > >  create mode 100644 meta-python/licenses/CRC32C-ADLER
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > >
> > > diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/CRC32C-ADLER
> > > new file mode 100644
> > > index 0000000000..f1f0e94ee0
> > > --- /dev/null
> > > +++ b/meta-python/licenses/CRC32C-ADLER
> > > @@ -0,0 +1,15 @@
> > > +This software is provided 'as-is', without any express or implied
> > > +warranty.  In no event will the author be held liable for any damages
> > > +arising from the use of this software.
> > > +
> > > +Permission is granted to anyone to use this software for any purpose,
> > > +including commercial applications, and to alter it and redistribute it
> > > +freely, subject to the following restrictions:
> > > +
> > > +1. The origin of this software must not be misrepresented; you must not
> > > +   claim that you wrote the original software. If you use this software
> > > +   in a product, an acknowledgment in the product documentation would be
> > > +   appreciated but is not required.
> > > +2. Altered source versions must be plainly marked as such, and must not be
> > > +   misrepresented as being the original software.
> > > +3. This notice may not be removed or altered from any source distribution.
> > > diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > new file mode 100644
> > > index 0000000000..0d51420939
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > @@ -0,0 +1,16 @@
> > > +SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
> > > +HOMEPAGE = "https://github.com/ICRAR/crc32c"
> > > +
> > > +LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
> > > +LIC_FILES_CHKSUM = " \
> > > +    file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
> > > +    file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
> > > +    file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
> > > +    file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
> > > +"
> > > +
> > > +SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
> > > +
> > > +inherit pypi setuptools3
> > > +
> > > +RDEPENDS:${PN} += "python3-core"
> > > --
> > > 2.35.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#95585): https://lists.openembedded.org/g/openembedded-devel/message/95585
> > > Mute This Topic: https://lists.openembedded.org/mt/89453390/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>
> --
> Justin Bronder

