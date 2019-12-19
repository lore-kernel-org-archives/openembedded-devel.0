Return-Path: <marek.bykowski@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 191837FD1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:34:27 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id a67so2595412oib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sxeETLQix+hMvWAPUuZPt2XwTu4FjqLmLQXyHp/3TBY=;
	b=kY9IYTeNETxZzhaaRUwAsusLOYzEqGz8+YeD+FH8m1tSL9RScg0uZy37Tbe0dCsmyf
	LqL0aiYSu/CMuEw/PvQMq8TbNl9y1R5IOkJeISA5ZluOG9NGh5+7eFbpdbCCyG6MUcLW
	QLuoRdUicWirfL4flk8ZcBpLBpDj0fsqnoPSXjOLiag5CpI1BrqbJMNwVlOaXPqbCGzE
	ZFKOCQmsZAP1ffJdCwW0p+S5sR8o/jDx0kyCflonASlAvGggTg0uB6xb48OU9hsizwaB
	eFwOAfDGhqIRUKDho/+GD38UqceW0lO6NtHK6szZfgiZjmy+OryVUxRloNBPgk+0SaKQ
	eo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sxeETLQix+hMvWAPUuZPt2XwTu4FjqLmLQXyHp/3TBY=;
	b=TaOLCu+C5U2y5gs0GHgVHDLTpJfGlD4OqJts+9PPf2zHUh0gfLYhQMECSACb0XLksW
	Bp3CkahSOhmbwPdNfZl+ZBmQ4/JxOu+9yr8Xkg13IEzT1pnGZy8McZViWD7AdkN6y4eJ
	llMexin8IS8e1GpZyfknhKqYf3VIfgzQOjc0C5VhyLStO1QtnH8YzNc8QiXH0pr+osRZ
	e0s8Qblgckxks+9tB1LVOtVy7t5YCG4mI1aT4dkCRMnpLPb0UXg/YRz618EJFlwRNwZd
	6Fcb9qZtXSjr9KVu3Ux1dZK+8tIBaJatmz87RpGc01ybuBc/LZpyy/gckIWPpvZgBJuY
	UY7Q==
X-Gm-Message-State: APjAAAUrHpKiFGzc+0aGR0kaXY8OuOzmmcUryiK183DO8b4WuK8CfY7y
	v6qwVpggzSEGaHFfDxJOFprjC/uGnlTFAmpQvEk=
X-Google-Smtp-Source: APXvYqzLVjD0KHxiA7EuhWEW2PLtLKLp1cL6xPhBw+Sas9zzwToIE4S/wBbZttDfTJqBVk05QUSUQMSMaA511iAO+6U=
X-Received: by 2002:aca:4c57:: with SMTP id z84mr1780261oia.0.1576758867970;
	Thu, 19 Dec 2019 04:34:27 -0800 (PST)
MIME-Version: 1.0
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost> <20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
	<20191021113018.3c684d51@gmail.com>
	<0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
	<20191022091523.60d5434a@gmail.com> <20191022120320.71fb6436@gmail.com>
	<CAHw2UgAT_sL39YBSRJ2D7EKA28=4aL3OHJX7LW2Y4CVw_6STwg@mail.gmail.com>
	<CAMKF1srcG7HP18wyYMK8Sn4uLbzyr+ePTGCLUZXvyecVj6nBoQ@mail.gmail.com>
In-Reply-To: <CAMKF1srcG7HP18wyYMK8Sn4uLbzyr+ePTGCLUZXvyecVj6nBoQ@mail.gmail.com>
From: Marek <marek.bykowski@gmail.com>
Date: Thu, 19 Dec 2019 13:34:16 +0100
Message-ID: <CAHw2UgAUh82RGjtbCk05xDpeETD8m74mvMQCeMdcMJHGTUcAGg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Dec 2019 12:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't think Intel is interested in the pull request (
https://github.com/intel/lmbench/pull/9). With that are you still planning
on taking the change in?

Thanks,
Marek

On Fri, 8 Nov 2019 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Marek
>
> I thought there are some feedbacks to be addressed, so I was hoping to ge=
t
> a v3
>
> On Fri, Nov 8, 2019 at 5:24 AM Marek <marek.bykowski@gmail.com> wrote:
> >
> > Any thoughts if this is going to be included in the upstream?
> > Thanks,
> > Marek
> >
> > On Tue, 22 Oct 2019 at 12:03, marek.bykowski@gmail.com
> > <marek.bykowski@gmail.com> wrote:
> > >
> > > On Tue, 22 Oct 2019 09:15:23 +0200
> > > "marek.bykowski@gmail.com" <marek.bykowski@gmail.com> wrote:
> > >
> > > > On Mon, 21 Oct 2019 19:42:45 -0400
> > > > Randy MacLeod <randy.macleod@windriver.com> wrote:
> > > >
> > > > > We have had Intel employees working on oe-core / meta-openembedde=
d
> > > > > for years so I hope that you will send the commit to that repo on
> > > > > github and indicate the
> > > > > upstream-status in the patch what we integrate into meta-oe.
> > > >
> > > > Hi Randy,
> > > >
> > > > I'm Intel (actually a subcontractor to them) working on occasion wi=
th
> > > > Daniel Drogomir, Charlie Paul, and Chantale Ouimet from Windriver. =
I
> > > > have put the names as chances they may be your colleagues. Even
> > > > though I'm Intel I didn't know of lmbench Intel repo on github - th=
is
> > > > must a totally different team. Sure I'll send the patch onto that
> > > > repo indicating these are the changes integration planned into
> > > > meta-oe.
> > > >
> > > > Regards,
> > > > Marek
> > >
> > > Done https://github.com/intel/lmbench/pull/9
> >
> >
> >
> > --
> > Sl=C3=A1n,
> > Marek
>


--=20
Sl=C3=A1n,
Marek

