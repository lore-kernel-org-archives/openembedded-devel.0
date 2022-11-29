Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B6AC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 17:34:09 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.156517.1669743242124636961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 09:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtxynUqG;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1322d768ba7so17900928fac.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 09:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4N17ThfmKmjcFer4XDgLZJ7rjBoQDlC5Y14OgTSvulY=;
        b=GtxynUqGrFL1C0a9iLiBwIH9voWP5l+yYnqPOQmXgDRNI9f8IldXgV9MO7ZUZN4VOs
         6Tb4w5xFtdIRcY6vEdiEvxnGDVy9aQ+GVHg6BL4h/ojaoZC/61xpy3nKxdTrj7HBxcIr
         246VWFHP9KOtAbmah8Bc2TmuF/qP0SxZZ/QNmJ4+lJox1eXHBarK750USMHW9iiu5U9r
         Ce3/mkBwC/OE/OG9zCnLSspdCHnYwGB1HUkw/iUE51XUvyHdWs6dzmnC05g7+iBpgbl+
         SeBLBhNRJ0aNK9qS4MMNF3/mLx/sUUSr0aXWq2RCQgwJAkGtN/6g3oLIFml+ULRilSB6
         Xpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N17ThfmKmjcFer4XDgLZJ7rjBoQDlC5Y14OgTSvulY=;
        b=1dzO+UFB29EvL0Q77KbQqE0HZxPgIkD55NrDrvx1XNbZBcwHC1qUk6V9JwK75C9cUw
         u9UU2Sv8SbtK3jTX1QmeyB+AfQGLvy1OOLcF4zpVRB9a+rP8xyk1wMfx2R0sHzLTh9vh
         ynWPZ/H5dKfjVq+Js9IGURHPBxOmfXPJ+kHTrC03F+tk1VdMJyvASxbRUUPqHyspZOSP
         32Mj3xh07JSesgRz96v+FnIEYbr9vvR748kKBKUgARSRAEdwfDaq6oYAMMKjLYuQU3UA
         W71vhGml+1fCUAa2zeV7477SRGgpzs7G83T7lqL1uRn/Fa2IO2hecr/hVgilBUdGgft8
         fSVw==
X-Gm-Message-State: ANoB5pmyn1QCfDzYkH0HIPtXGcM4P7bLscccwcfylJQKF9VAyyLUFqvT
	YuHxYcMpg/5Z3hlXyGGi4pF+W44d0rNNGRlGoH8=
X-Google-Smtp-Source: AA0mqf6EvY4/oOLywuG8pLzgiHIRItqkjqvDS3asV1s1rzJ8ZUhp4lkXr1pfRlt8DhdBmTacquAQR8d6XWRkvoSReOQ=
X-Received: by 2002:a05:6870:1784:b0:13b:1e05:a73d with SMTP id
 r4-20020a056870178400b0013b1e05a73dmr34413461oae.55.1669743241260; Tue, 29
 Nov 2022 09:34:01 -0800 (PST)
MIME-Version: 1.0
References: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
 <1669615786-13094-3-git-send-email-wangmy@fujitsu.com> <d5ab3ee61fc546038cc5bdc0157da56f@axis.com>
In-Reply-To: <d5ab3ee61fc546038cc5bdc0157da56f@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2022 09:33:35 -0800
Message-ID: <CAMKF1so6JMrWG3B6UQb40pK9H4oXsTRC8gzQ1FGZOJ6WNLRcyQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: wangmy <wangmy@fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 17:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99847

On Mon, Nov 28, 2022 at 8:01 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of wangmy
> > Sent: den 28 november 2022 07:10
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Wang Mingyu <wangmy@fujitsu.com>
> > Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Fix:
> > ======
> >     Do not use 00:00:00:00:00:00 as chassis ID.
> >     Do not busy loop when an interface with a neighbor disappears.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../recipes-daemons/lldpd/{lldpd_1.0.15.bb => lldpd_1.0.16.bb}  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.15.bb => lldpd_1.0.16.bb} (96%)
> >
> > diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
> > similarity index 96%
> > rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
> > rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
> > index c7237d74b..45425561f 100644
> > --- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
> > +++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
> > @@ -12,7 +12,7 @@ SRC_URI = "\
> >      file://run-ptest \
> >      "
> >
> > -SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
> > +SRC_URI[sha256sum] = "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb984711df8465a9"
>
> This was for some reason integrated without the checksum update.
> However, a subsequent commit changed the SRC_URI (from media.luffy.cx
> to github.com), which caused a change to the checksum as I now get:
>
> ERROR: lldpd-1.0.16-r0 do_fetch: Fetcher failure for URL:
> 'https://github.com/lldpd/lldpd/releases/download/1.0.16/lldpd-1.0.16.tar.gz'.
> Checksum mismatch! File: '.../downloads/lldpd-1.0.16.tar.gz.tmp' has sha256
> checksum '7753c6e31e938923185f4e10c4ab328929729e22ee4a9687d08881fb82c092ee'
> when 'f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126' was
> expected
>
> I.e., the checksums for the 1.0.16 tarball on media.luffy.cx does not match
> the checksum of the same tar ball on github.com. And comparing the contents
> of the two identically named tarballs reveals that the one from
> media.luffy.cx has been generated with newer version of autoconf and
> automake.
>
> I also wonder if the change of SRC_URI, which was triggered by the AB not
> being able to fetch the tarball, was really due to the checksum not having
> been updated when the recipe version was stepped.

The site was not accessible. I would rather use github release
artifacts if the projects
make that. I think I forgot to run bitbake -ccleanall before testing
this change. Thanks for reporting it.
and fixing it.

>
> Based on the above, my recommendation is to revert commit e154914718 (i.e.,
> the SRC_URI update), and then update the checksum as per the originally
> supplied patch from Wang Mingyu:
>
> SRC_URI[sha256sum] = "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb984711df8465a9"
>
> I will send two patches to do this.
>
> >
> >  inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
> >
> > --
> > 2.25.1
>
> //Peter
>

