Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A8FDD799FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 14:06:53 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l81-v6so11524306pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QY1abtO+NVWyzNdYboV7F6rn0Yn/A9l9Yy9lcrv5KKE=;
	b=oz7Wur556HXVsQo1F4KmrFQYIyMoyCVheBF7twLBdICNR86gv4COM7VFD75C1jWufV
	FqYWiXsH+9vsKhVwOnK/zfieWTI23TQbwKUQ9bizF3Qoc0gQFnuX0R5YeAawUerNfkeC
	wNSXXGeKO6KPHxjw95DR3Yvh8PX/teBMier1iB9T+zD/ueCTiE2SY5TCx6hZZJhOQO8N
	HczUIWaq206Dofy2S5LMOCnI49xW6ur3T/zrHGu9vgKNqSJWTa2G0hGRifU/4yCaSNN1
	hQtctRA8noZwoY7+FHHsbS6nCknnC/oguwCyX4y8g1BoMKmbS4v8e2aD1mqMQnIZ4njA
	xKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QY1abtO+NVWyzNdYboV7F6rn0Yn/A9l9Yy9lcrv5KKE=;
	b=O0IGBOBtC+Tm0EtWNtZNf7qG1yoogZIu5ahxSlUo4v28E4ReRewnsMsklKZt4UlOUk
	UP+BqgYBoAbDYlh1ZVWJwM+v2DhGzgs8cA99WS1dVEpOt72CUUqSN9Rt9lIh3EPEb8nw
	kslxMVId7K4U7gTOT6keanr3YxaezCjj6u2+xVBdQis7uJD/NCi/W3LRvv22EKqUoKjX
	MtFgVJQIBZu7H+oevfgEgkPKEmGEqIZqhxJb6fZx518ogEqskUURW3tyKOjn4ItyFXEt
	lEpE/BsS3+dHur4fJ7jAlXl0eZJAxwb+bPzWBNADHox8BubHOnolCOOHHFwRtAizvZcJ
	htNg==
X-Gm-Message-State: ABuFfoiNEVBrNd90Eu2T6bueMlVd1MWJUmH/lebcXaZiEne6cbGfOr5U
	2FZgetL6rUC6/ZALRW5dSdE7V0F4zeLvZLkUdjU=
X-Google-Smtp-Source: ACcGV60zrjiDr5qcaBZ5XhAM/yzr9XVKLLLYzjHIY0mMIRZJdZI0A2wJiFZFLsxE8oTDLaEKHxc0tHQa25p6fNWGa4c=
X-Received: by 2002:a63:c40c:: with SMTP id
	h12-v6mr8603551pgd.298.1539698814141; 
	Tue, 16 Oct 2018 07:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
	<CAJTo0Lba-jQYe5W99ZA3zLCqNQiFeRhM7m8zipRTCon5cKA4sw@mail.gmail.com>
	<CAM_RqkOR+WeyxbrGm5FEThYOELNABzcWt6KTmj-A+JyZ1hvYxA@mail.gmail.com>
	<CAMKF1socKGKNmOROX0-isBt47hj+z1r7YyKxt+TKYDs0XZe=ZQ@mail.gmail.com>
In-Reply-To: <CAMKF1socKGKNmOROX0-isBt47hj+z1r7YyKxt+TKYDs0XZe=ZQ@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Tue, 16 Oct 2018 19:36:42 +0530
Message-ID: <CAM_RqkN_A6tsLUBWcscF0m7AVZbi2+QBaKoF9QmprFnb0n--1Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 14:06:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,
On Tue, Oct 16, 2018 at 7:17 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 16, 2018 at 5:37 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Hi Ross
> > On Tue, Oct 16, 2018 at 5:01 PM Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > On Tue, 16 Oct 2018 at 05:43, Ankit Navik <ankit.tarot@gmail.com> wrote:
> > >
> > > > +do_install () {
> > > > +       install -d ${D}${includedir}/CL/
> > > > +       install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> > > > +}
> > >
> > > -D to install is 'create directories' which you've already done in the
> > > previous line, so that can be removed.
> > >
> > > If you're removing -D then a more idiomatic form would be:
> > >
> > > +       install -d ${D}${includedir}/CL/
> > > +       install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
> > Opps, missed -D.
> > Cool. I will use your suggestion.
>
> you just need single line there in do_install
>
>  install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
Single line solution is not working as I said in earlier email, it
throws an error as No such file and directory.
Regards, Ankit
>
>
> >
> > Thanks, Ankit
> > >
> > > Ross
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

