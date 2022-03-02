Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC35C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 17:13:09 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.326.1646241188398533945
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 09:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oXI56Yk1;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id j78so1843462qke.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1gUAGdSZqJqAhV+ijLONk9CUJ8qx5E10KYziPrZwyIA=;
        b=oXI56Yk1LEJLH4DJiXnQ4RSp1JoJrHyYuhrQ9yFdh6VDjGN68zCVFM9M/UO58QdlDL
         qrZr+VwYZTs+lQs4KfsATOtMeA4GgZpAuBO0eFlvlb/VO8Rg4i3v6oRE4vDMcAfc+Dcr
         vvqHYxni25NmekE5Dra34s5nu51+KZNPvfvQXFmhibiA37kxJA/T7DZpUqeSPeI+5k6J
         OiEzW+o5tXXO63AxjuZCi80fJESndE+IUbXxUWi63/tlLvhbR6D58vqAd2BiWzHQcn3v
         4cV62/8ow15m/QoGaWPtA8rNrvaK/LZhk94WDBRwDlBNsDsdGA/5VQZmAi3Pt/WnlePv
         VBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1gUAGdSZqJqAhV+ijLONk9CUJ8qx5E10KYziPrZwyIA=;
        b=GgAtDjuPyX2YsMycBsoEfZa36ei/MwRLtoN/veb/eJCqd/faIUhh+bCgy0lPHWE6/8
         qvYHv5ENmi4RsreIa4bWj2hKQ9kbpmBN3QwF+jZtOnviyI5zWvHZjrAcI3ICrA8z0t13
         ROcpOTUXDLmOoWmxInUdKzHt4ldr8uN7Tc1JW5/psanYDgxXvJSPkjDMiSpf2awggrMh
         SdmP+v2hFeSUKhl8KNDN0UBbyRcyiQnE8G5JOiqYoDBo+EcmdtV2SIXORxKucRoVH63h
         D2IA1Ggo1kIckfLmz/Wl3DWIhz3FgwE6+NG3+HOunsSwkTTkwoAmsJiopPaNEWrkP+uR
         Id8Q==
X-Gm-Message-State: AOAM5320wdpxEjHhcaAlR/zAPGtcy3/ASbH1ILhoMFw9lFJ7ysOqw6Wb
	kLafZcdUEX8qpv+ompA2qFgkS0GFtvdepmTzgAM=
X-Google-Smtp-Source: 
 ABdhPJweoKghgA03E514IVK1/7+VCXok7eaQeF7u1sNzdtC6D+jTSwEoe60UByGnRksuMjcDNfoQ4u8X7LFnTp9WjdI=
X-Received: by 2002:a05:620a:12ba:b0:663:6779:beeb with SMTP id
 x26-20020a05620a12ba00b006636779beebmr1473188qki.227.1646241187379; Wed, 02
 Mar 2022 09:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20220301221548.30730-1-jsbronder@cold-front.org>
 <2889da1e5fda4609aec7aa8d4a1651b0@axis.com>
In-Reply-To: <2889da1e5fda4609aec7aa8d4a1651b0@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 09:12:41 -0800
Message-ID: 
 <CAMKF1sqQQAy+-KpE+fRxyRC5HbunxfbWEC5YB1WJVi8JyT5zcw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyscaffold: fix wheel build and
 license
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Justin Bronder <jsbronder@cold-front.org>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 17:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95695

On Wed, Mar 2, 2022 at 6:49 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Justin Bronder
> > Sent: den 1 mars 2022 23:16
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-python][PATCH] python3-pyscaffold: fix wheel build and
> > license
> >
> > Without python3-setuptools-scm-native, the version on the generated
> > wheel is 0.0.0, not ${PV} as expected which causes
> > pip_install_wheel_do_install to fail to find the wheel.
> >
> > Consulting the LICENSE.txt distributed with the source, the template
> > files under pyscaffold.templates, which are installed as part of this
> > recipe, are licensed as BSD-0-Clause
> >
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  .../recipes-devtools/python/python3-pyscaffold_4.1.4.bb     | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-
> > pyscaffold_4.1.4.bb b/meta-python/recipes-devtools/python/python3-
> > pyscaffold_4.1.4.bb
> > index 7e5599e4aa..f58fc5e9aa 100644
> > --- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
> > @@ -5,8 +5,8 @@ used to create template Projects."
> >
> >  HOMEPAGE = "https://github.com/pyscaffold/pyscaffold"
> >  SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> > +LICENSE = "BSD-0-Clause & MIT"
>
> The official SPDX identifier is (weirdly enough) "0BSD".

Right, we need to run the conversion script on meta-openembedded
layers but perhaps after python/wheel stuff
settles out. Its better to address it here atleast for this recipe.

>
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
> >
> >  inherit pypi setuptools3
> >
> > @@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "46a2bbdf255ba2efc6c56ae1428249b61d56c4a3e54ef3db0d05fa9779
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > +DEPENDS += "python3-setuptools-scm-native"
>
> Build dependencies typically go near the start of the recipe,
> i.e., between LIC_FILES_CHKSUM and inherit.

yeah oe-stylize helps a bit with these kind of issues.

>
> > +
> >  RDEPENDS:${PN} += " \
> >       python3-email \
> >       python3-compression \
> > --
> > 2.35.1
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95689): https://lists.openembedded.org/g/openembedded-devel/message/95689
> Mute This Topic: https://lists.openembedded.org/mt/89489231/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

