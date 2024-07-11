Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4662BC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 03:23:08 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.3901.1720668182934484419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 20:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f5jE8Bbe;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-48fde3a2b17so149553137.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720668182; x=1721272982; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jt0S5YHTnZdetKuPwVF8CSoxsq4okRk5J2E2LeQ4ltI=;
        b=f5jE8BbeIYzyDkBqBGhofbOABr4mSCa2+TzPJ0yNjJwXCwkdstycKni1aapzdC0MaG
         DefT3rT2FE3cj4wXfubWDkBs3SaJ6QK+vqnj0P2mfKZ6hqrlqeiqoZf0DBxk9PA+nrN6
         8xwTrLWkxVWh9iUv2XZTmV8VwlLV/+O5sjZ3JXNjW+39sBf/Q9R4yy2AALKE+je74hwE
         LX1WU/bFyQ5ATgf5NcQ3aVxokl6tNxNLaeze+h12P2GP/zpKu4gq8+PD08HaIMyc2cy6
         CVNeoT8HPee+qU/ze1dHs/u7lt2PRkpzZkvQlxXWezoTNx5xzMEA96Ns396bGHx3bBmr
         vmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720668182; x=1721272982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jt0S5YHTnZdetKuPwVF8CSoxsq4okRk5J2E2LeQ4ltI=;
        b=YeUxJJtoEOnSWzuZVhWlGMWZXV33fgXXnFzN3OSPxyH6bcbsWNbEm9v+bzDkcgJbuQ
         UdAZTImGF7+wRs0ojP2eBGmxO8JN5qjpWfx6IiiPnONtaow/V3FiLY6FnaK9Rfwr0raT
         OYMAbYbcvINz10U0LYd3vFhouiJ75YsPbCbwLMamZocU+NC66ZwZVPRXIKKu37iULutv
         oOCAJDM6f3USVlmnDs8rNp5Aq6uV7LmWTmjX3kkACFOpFfY2nl1UpcEGZ1PHau6mOZGs
         DS1Y+0Gj4ocVQARwgiQ+lNfrQKTZTcK0uBTVhddllFBMfTgjGUH+4IaJRHeW1uTEHBAF
         pXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTvT0bRhBqp1s33MB7SR793LGoJ0ZPMAzP9N0LBtJC/+Gmvfw80xxu5lcaSoLMADb1E/hvI7qBogLvQWGKDsq9T+3D6ahCC3/XsZqm6l3ePthXHbEtj35MQ==
X-Gm-Message-State: AOJu0YxRjTbmYa2v2/SdSDbaPIuv5v/+sgsx0dopv/xLwkAUVSAUlS8S
	+UWZQdDzM7/tieSvHFV2I3Z9bJSU3coLa/i9c7aXIheEzES7WOlHlgQm0CHqIAwFyFdcyLVYszo
	D0DsdqEResDDoq3b6qjpcC0acnng=
X-Google-Smtp-Source: AGHT+IGQc8pVl9cat/mqq6uct8v+7rYHWsmZmskPOL6oVmx9wWw03LQ+ap6ZqLr0BYcdSX/x+cRGDeerb9TkE9LUVoQ=
X-Received: by 2002:a05:6102:41ac:b0:48f:ea3c:268b with SMTP id
 ada2fe7eead31-490321b91c4mr8092131137.17.1720668181826; Wed, 10 Jul 2024
 20:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANgaEnLXUKjX-V65zJ3mhugd2f5CKJpBzvgLzPeaLvOPYoF9Kg@mail.gmail.com>
 <4272f43ca7ff59832c643c60cd1ecb4f0e78513a.camel@linuxfoundation.org>
In-Reply-To: <4272f43ca7ff59832c643c60cd1ecb4f0e78513a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jul 2024 20:22:34 -0700
Message-ID: <CAMKF1sqT_TxEiXGm=PkCXX-4K7w8rnvzubo0Vr1xvmNDn_RRJA@mail.gmail.com>
Subject: Re: [oe] Reports for CVE triage
To: richard.purdie@linuxfoundation.org
Cc: jacoba@thehoodiefirm.com, openembedded-devel@lists.openembedded.org, 
	Engineering <engineering@neighbourhood.ie>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 03:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111311

On Wed, Jul 10, 2024 at 5:50=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Hi,
>
> On Thu, 2024-07-04 at 11:02 +0200, Jacoba Brandner via lists.openembedded=
.org wrote:
> > This email contains a review of the remaining CVEs from the status
> > list: https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-
> > oe/cve-status-master.txt
> > This work is done as part of "Milestones 3, 4, 5 and 6. Triage CVEs"
> > as stated in the Scope of Work with Sovereign Tech Fund (STF)
> > (https://www.sovereigntechfund.de/).
> >
> > The reports are saved as HTML files here:
> > - Milestone 3: https://clients.neighbourhood.ie/yocto/81-120.html
> > - Milestone 4: https://clients.neighbourhood.ie/yocto/121-160.html
> > - Milestone 5: https://clients.neighbourhood.ie/yocto/161-200.html
> > - Milestone 6: https://clients.neighbourhood.ie/yocto/201-221.html
> >
> > The reports contains a review of the CVEs including the following:
> > - Package versions affected
> > - Current package version on 'meta-openembedded'
> > - Notes on how the CVE can be addressed
> >
> > Please note that for the CVEs marked as 'invalid', separate patch
> > status updates have been sent to this mailing-
> > list: openembedded-devel@lists.openembedded.org.
> >
> > The collection of all emails we've sent to NIST are saved
> > here https://clients.neighbourhood.ie/yocto/NIST.html
> >
> > We can also provide this in any other format that might be convenient
> > for you. Please let us know.
>
> I had a look into this. Firstly, I wanted to say a huge thanks for
> working through this, you're doing a great job! Getting the status of
> CVEs sorted out, particularly the older ones makes a huge difference to
> the clarity of the security situation of our codebase.
>
> We can see the status of our codebase here:
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/
>
> You can see we've gone from around 271 CVEs at the start to having 136
> currently listed.
>
> When I looked at the list of open CVEs, a few did catch my eye,
> particularly the 24 still open against imagemagick.

This is pretty cool. Next in line is yasm with 20, and I think if we
upgrade to latest
master then most of the CVEs will be gone. I will take a look into it
( time permits )
. I implore our community to also review and provide feedback and/or patche=
s.

Btw. the color coding for master and dunfell is same or atleast it
looks like that to my
eye, maybe we should just drop dunfell from the graphs now that its EOL

>
> I can see many were already excluded in the recipe, based upon the CPE
> needing an update and I appreciate you've sent emails to get the NVD
> entry tweaked:
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/imagemagick/imagemagick_7.1.1.bb
>
> In your report for milestone 4, I see CVE-2014-9822 has a CPE sent for
> it:
>
> https://clients.neighbourhood.ie/yocto/121-160.html
>
> but it is listed as being an open issue in the metadata. Was there a
> reason we don't have the CVE_STATUS[CVE-2014-9822] set in the recipe?
>
> There are a few others that are probably in a similar state to this.
>
> I suspect there are a few details we need to tweak just to fully ensure
> the reports reflect all the good work you've done?
>
> Thanks again for the work though, there is some really great data here,
> I just want to ensure our metrics fully reflect it.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111298): https://lists.openembedded.org/g/openembedde=
d-devel/message/111298
> Mute This Topic: https://lists.openembedded.org/mt/107034729/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

