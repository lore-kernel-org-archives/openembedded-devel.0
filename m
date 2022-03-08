Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB4DC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 11:38:06 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.7100.1646739484827851702
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 03:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJ4R5t7G;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id b24so1428017edu.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gFPwfTgTqGBLg9J1+DcJUVYVqGVMxUu4oTV4WCw6tLo=;
        b=ZJ4R5t7G47j1O4PJrh4CuDMSCEPE7GzkAgQyVJNj3bf2clgB08rogJqeANgXw98ra1
         kwzVa29/9lzZ/PYfr6JBZlYtPhkgcdWj4qQA1H2kvqjwEU8oG+s5EFG3shBLEoCOV3KW
         QK9p41Ej5OoGm0e+NGTWEef25bIXUijVksyVVCPlT1jHNWk8o5ALaZYYh4hJJnaj+W/5
         lphyb8P40ux04VPt83J1PuS3PDBLxQ+nT3QlW35v1UNUGxgJ8RULMvTMNObhAOvQehYc
         kdY2MjRdAjGGvX+AhxrJUT5D813J2zy0gbiflcuBEOOB626iJvM6DHY44jm1PVpzGhn4
         oVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gFPwfTgTqGBLg9J1+DcJUVYVqGVMxUu4oTV4WCw6tLo=;
        b=MfN1P9LoJIEySfvt5R/hXmHpOuw64VHcdftnsi3c2N6mNSJxiuGk9DVEaBw+Mcbtgh
         PtICepKOQyErEoiqz4kEdOZmM3ldmJ9LsAYUMJ4WjEpHWExK9jPLshDjFNrJhgzwF9Po
         4bcfqI7uF8lyRixC1xszdZWOGRT+atFfiSaMiZPEr2p5btZxmgsNFtIOe6CrX8SDlTxT
         FGa7nwrkykdYvSQa775/zUGo9xyJvj3/raLyBl9An/2C6fiYaeXGkkRzRIASjJ396r/R
         7q+AC3ior0QpHbM6h53GgwwAhfnWsIfa1sh3nhzNRehao9ojTrDfdbYmo2yfqy5EkJia
         F7fg==
X-Gm-Message-State: AOAM530RA8uJCy8UmLkewAY9NhkqPbS/2Gx0y1PKbTiUJH/U8g0szyaU
	Sf2GrZtHkBrPeS/JjeqnVw==
X-Google-Smtp-Source: 
 ABdhPJyEtIOTb8VqRW+FvOfZNOT6FJ2IU40EgXd82tIfdp63SAnejbW4NxYZ3R0APK06ZvGYYqsXrg==
X-Received: by 2002:aa7:cb18:0:b0:413:3a7a:b5d6 with SMTP id
 s24-20020aa7cb18000000b004133a7ab5d6mr15364277edt.254.1646739482972;
        Tue, 08 Mar 2022 03:38:02 -0800 (PST)
Received: from OP01518NB.oip.local (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm5749070ejb.164.2022.03.08.03.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 03:38:02 -0800 (PST)
Date: Tue, 8 Mar 2022 12:38:00 +0100
From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libiio: point PYPA_WHEEL to custom location
Message-ID: <20220308113800.GA36@OP01518NB.oip.local>
References: <20220306063116.710-1-sam.van.den.berge@gmail.com>
 <CAMKF1sriSNk8FQJhUSHumG5eoA+5d_w4EzeidDwzm_0oZrNTFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1sriSNk8FQJhUSHumG5eoA+5d_w4EzeidDwzm_0oZrNTFQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 11:38:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95881

On Sat, Mar 05, 2022 at 11:29:42PM -0800, Khem Raj wrote:
> Thanks for fixing this
> 
> On Sat, Mar 5, 2022 at 10:31 PM Sam Van Den Berge
> <sam.van.den.berge@gmail.com> wrote:
> >
> > From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> >
> > This fixes the installation of the python bindings of libiio.
> >
> > Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> > ---
> >  meta-oe/recipes-support/libiio/libiio_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> > index f33fc0c1c..19753a13b 100644
> > --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> > +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> > @@ -15,6 +15,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> >  S = "${WORKDIR}/git"
> >
> >  SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
> > +PIP_INSTALL_PACKAGE = "libiio"
> > +PIP_INSTALL_DIST_PATH = "${B}/bindings/python/dist/"
> > +PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.21-*.whl"
> 
> perhaps we do not need to set PYPA_WHEEL perhaps. I am also wondering
> why its not failing in
> oe world builds. Can you check it again with latest master-next of
> both core and meta-oe
> 

Thanks for the hint.

Tried today with latest master and it worked without my patch. I guess commit
6f2d85a7b7d9 in oe-core fixes some things so this patch can be dropped.

> >
> >  DEPENDS = " \
> >      flex-native bison-native libaio \
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95810): https://lists.openembedded.org/g/openembedded-devel/message/95810
> > Mute This Topic: https://lists.openembedded.org/mt/89585637/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

