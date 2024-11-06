Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A9AD40D18
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 01:08:52 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.36119.1730855325559515461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 17:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JebqcIat;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71808b6246bso3213164a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 17:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730855325; x=1731460125; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pK63EJF9gOde0b8xQSKSh5t31y/XyySuaMAox1YIt0=;
        b=JebqcIat8oEbS+fFdZwFgnVm7OnaUGEAY0aAqSFCrTMxfzAgS4pdjX7QjBXORAb4h0
         8YwaURKI80eOtEc+DQfXqZNUBSDmNBKsnoM60LmN8PisnUcscF3RByYKFT03Bm+ly2b6
         eboyK8nSe3zgftqwx/kOfHJciGOycM4dlYOpFbKjdiImiBCqDq3S+FNQ06ufnKp295sN
         doMdchUFTqlBN0r/4nq/n2PtFPwdDt0xQ+KuqMw+9Lsz45GkItsvEE7tKL/62Cuf1u9K
         nnC8UU2BJQ3H/xB7yuHChHIry3r13Cn2Ef1UVadLU86vrhHoQN+sR1Vszw9wnN+MGmem
         qF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730855325; x=1731460125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pK63EJF9gOde0b8xQSKSh5t31y/XyySuaMAox1YIt0=;
        b=E7bX8Vmopek3kA/2CfvvBZpX0wmTt9attM1hj9yvttj0ee753VU6iWMwVc2bOk3yfG
         c20lwIeTMFyMgcj/l7DlzXeFwHEAfy0xep2HqjidYlsaivd6Nb5R9BxfjEmoVi1Q0fJv
         NZ/Qy7/JX5fGRre5HSWRn3AgSTHPBA7hMPpvORPfInT22c/hw6JI4Q9BnzNhAqMJ5MuD
         fUP6qphIkNdutBNgi9/pAtx1gawuwNX8HKr/vVab9O3PgcdTh0/DIDj5er+tTzrCoSMh
         DSGQAUm9dMF8R4zPVcYxdlnMg1/uEeFgDKGzTycv/oO+LNHKmf0AJuEqILQILNJdsAU7
         j1vw==
X-Forwarded-Encrypted: i=1; AJvYcCVH7/GLBWu3F39+4z7TW23wPRBp51AgBMPuLBLjjR3sSz91XoHBUkpesCgbBkXezXfnqY67GRVKd0sDd87ZC+B1a2I=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/z/8ID/8wKVj34kbm89QpDi+qSU2BpX4CFFMNlQTtBhlP3+RD
	4kNd1Jg0NrVOBkDTS1dEHsbBEJ/MottJfrvkgbvZ8Dcsh6/ssvivkAKqKCZ/RA49JOcbQFAB/rC
	OtSaIwt2nEOTFdX2IapudX7Sxg8apZA==
X-Google-Smtp-Source: AGHT+IEQZpbwvawfgaqw3l23H8euxNkF1ullLXr0Mav/N9D1k4WMPkg++t2jCDUMtOxmnpNbOfFbjoTF7o2qRy6QnYE=
X-Received: by 2002:a05:6830:350a:b0:710:f879:a15a with SMTP id
 46e09a7af769-719ca25bec7mr18095901a34.27.1730855323226; Tue, 05 Nov 2024
 17:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20241105183658.34982-2-schonm@gmail.com> <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
 <CABTo8gA+4kJDeMOWOWqiAcwZdCa9XFxpVq9cyAQXQUD_dUFz8Q@mail.gmail.com> <CA+chaQeHTahXvMFvrG26LUz3kJZoU1huGuPYGo7bRcvXEro5pQ@mail.gmail.com>
In-Reply-To: <CA+chaQeHTahXvMFvrG26LUz3kJZoU1huGuPYGo7bRcvXEro5pQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 17:08:17 -0800
Message-ID: <CAMKF1srvM_0RE1HokPTDKCx94Q3qSuoO-d_2Vw2-ouSrY_dA5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
To: Martin Jansa <martin.jansa@gmail.com>
Cc: schonm@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 01:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113683

yeah I think thats perhaps a better way to get this all in once.

On Tue, Nov 5, 2024 at 3:02=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> Why not send all these simple one line changes in single commit per
> layer? They aren't controversial nor need separate explanation for
> each recipe.
>
> On Tue, Nov 5, 2024 at 11:59=E2=80=AFPM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > I did indeed run into mail throttling.  I will keep my submissions
> > shorter in the future.
> >
> > The remaining 100-161 should be on the mailing list at this point.
> >
> > Please let me know if you encounter any issues.
> >
> > Thanks,
> > Jason Schonberg
> >
> > On Tue, Nov 5, 2024 at 4:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >
> > > Thanks for this much needed cleanup. I see that it says patch 0/161,
> > > but then I only see 99 patches on ML.
> > > so something is amiss here. I wonder if there is some throttling on
> > > mailer or some such. so perhaps send 100 onwards
> > > as a new patch series. If nothing works create a pull request
> > >
> > > On Tue, Nov 5, 2024 at 10:54=E2=80=AFAM J. S. via lists.openembedded.=
org
> > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > Following the note in section 5.5 found here :
> > > >   https://docs.yoctoproject.org/dev-manual/new-recipe.html?highligh=
t=3Dmd5sum#fetching-code
> > > > drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is alr=
eady being used.
> > > >
> > > > Thanks,
> > > > Jason Schonberg
> > > >
> > > >
> > > >
> > > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#113678): https://lists.openembedded.org/g/openembed=
ded-devel/message/113678
> > Mute This Topic: https://lists.openembedded.org/mt/109411793/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

