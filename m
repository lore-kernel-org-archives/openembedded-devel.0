Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95937D40D0D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 23:47:51 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.34166.1730849513092057466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 15:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GVethqC4;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-28862804c9dso173729fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 15:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730849512; x=1731454312; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aWCLiOGKt6sVHCzGcD1SPrmiwOKFNDMR/p6uQWQvzA=;
        b=GVethqC4KzvSmm9I2B3uaNd0kcZJ9Z8ZHiL2nts6CwcdCizi3lDFhEuJv0lZguaxSC
         NgpZJDcCx5TzWnSNKspCkzlXVER9fqN9zF+vC5LCqf1sVq4F1mbb+kA/w3lsKi3F5h2J
         JDKVxVr8G1ePLAYc3RHeOMsa8fxnAuaDwSiysECVkIEd81U7ZNLO5T0U0a+p7HF76BrG
         9a0wQ9Vpzhp7EpbRNl66nHnabjVN60HgXP/nb3GeUpj1yg2iSnUSra0w7mTlUaerBATj
         w9KG5EwV9JFJzUP3WwGfDg6xfqxuLOAdVwxXIUfwo/QoiQmqsUTVtWbJgpkM96/5EjrZ
         s2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730849512; x=1731454312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aWCLiOGKt6sVHCzGcD1SPrmiwOKFNDMR/p6uQWQvzA=;
        b=PPlsVzrkSpAcKkcSncGMmjt2Qi6kAuRYoNvNXlnVqCSx1/+cZI3Bh+VFakcfCznWPL
         2GCrhgaaZdH9UjKmfW23C/Pr3Trn7j71uNLACcVMjVmGm0xOwGcTXuZl0iOUlSi1X+xE
         558LmIj+VGq71iRbQJP+y3+t3nkwBJZylq5NlJX/zkuC24lR8K0vCN23gnBUb05MV7bp
         YpOpvXDC9fcc7TUvV12eZkRpA9/CR3EPs02HZWUgVeqnyTUPUJRRIzOIR4sIfhmANEEK
         fMCAzx/yNOE2oG5bqmysQ0LMWXzHP+tIque9v/KM5MpbhY2meOpuy5DZoY/DfPbDMX2R
         Lj0w==
X-Forwarded-Encrypted: i=1; AJvYcCVdJoPkH/v8BCO4PHz1XbDiiPFj2vuEwnN98Nir5t8KwJ7xwGBCJ6M/KtjZuNQBk//RgMl+R0A4OePErY0YB+xSLsM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMvJs5jIi9WfQbDPObQCTJ9GITzSY82Yf1urEkFub99u4IlEIn
	hiXY2cPbHL0cjXUt94wYk99v8VbGclLEMo2+VxJWDa4b7wA+8WfDZm73dH7ogyGHAffvIlImzHV
	j9vx9vrL1KJ9hFShiPBlG+m4l+Mw=
X-Google-Smtp-Source: AGHT+IH4G9qxPDDMsYNPhdJBhMJnYHlFYqc6/P1KStD3Rk3XfFjJQYBn/KNGJrbewOxVj5ZK3Z/FU4100HFjcXsoy70=
X-Received: by 2002:a05:6871:3a06:b0:278:2d12:9ef8 with SMTP id
 586e51a60fabf-2952a733ba0mr189903fac.14.1730849511912; Tue, 05 Nov 2024
 15:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20241105183658.34982-2-schonm@gmail.com> <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
 <CABTo8gA+4kJDeMOWOWqiAcwZdCa9XFxpVq9cyAQXQUD_dUFz8Q@mail.gmail.com> <CA+chaQeHTahXvMFvrG26LUz3kJZoU1huGuPYGo7bRcvXEro5pQ@mail.gmail.com>
In-Reply-To: <CA+chaQeHTahXvMFvrG26LUz3kJZoU1huGuPYGo7bRcvXEro5pQ@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Tue, 5 Nov 2024 18:31:41 -0500
Message-ID: <CABTo8gDbR4K+EDw2u99cGV4yA=2JjGdzU=RN60Y_YvdDSVmSzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 23:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113681

I can certainly do it that way if that is how folks want it done.  I
had been under the impression that folks wanted changes divided out by
recipe since it would make taking patches to other branches easier.

On Tue, Nov 5, 2024 at 6:02=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
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
> >=20
> >

