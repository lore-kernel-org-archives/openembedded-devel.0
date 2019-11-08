Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A147E7FC75
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 17:13:50 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m4so5891742qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Nov 2019 09:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=klyB68hiouvKT8lvccfgdVzG6NBok790hoqRbmaC6Rc=;
	b=twe6h1+Ahm05vt0bjuUCw8Wbyq/kLNQ6d44I1hKRSV4v1sIrhxeLNK+RLY7ipQkS7Y
	Au/ICe8uZo8Q7+pTf1YjdUhol+LPZi4Hqj5zAPzSvKJvnoK0kUuXEqLLEgWJxvJfvA2r
	tCAKrB37hhJ2Wa9veTWJyCZc+aPcPMUnekcjCxbedacxMJMqH/cqkQ1gpbL3xxP+D2wi
	3uYC2zlVQNy2nvDNI+GOYJ1fgfRJseHcuQQRs749KPzEQS2SRidAOn45IMgonlpcY4CL
	Pz701sj+LEqTxQ0vZtAP8/KQO9PxCYsRyvVHQhr8tYlolYmAVzsT8kjFFx3HzRA1ag6t
	OVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=klyB68hiouvKT8lvccfgdVzG6NBok790hoqRbmaC6Rc=;
	b=hA4RGGScPexWan1rxdkmm6fqNQgHY6YvC89lTTq7TPs9ZcYZ9zGOcwqDPf8cOvwhfu
	Fiqm8DQd1ahFO3M6+73nr0cdyNAvdt/V/sgkSngEo96cZIrdiWfUWPrFJywD6ErdP10s
	OETcf/ndSvnn4vGwzIFRvp5mKiL9ZdU6hQwp94drX4A/nSpfCVIqg+C2EF/Ekb78SB4e
	BNn8qo6PmnxNjOA7DkrBG4q2u/kFeoW/UG07XHx6gTMGzyyjRP4Typdn03yZIKXIyAQP
	YTfDP0vgHZ+i2Qe4zZfVQL8Vgy0aehacYFVZYjeHrDV9HNrQuNu2pHqAJUKxkYbE3mZd
	sibA==
X-Gm-Message-State: APjAAAXBuhgPTBwOY6bUN3V01pS695jRiV/ZTlNXJUuvsdwLhtdiT3/O
	T7mslR5wzj4ODyGIUlqfljhxRpQRO8nAVB1/qKA=
X-Google-Smtp-Source: APXvYqwdTee9nT5HRzlZTgFBPsOZcOCsxEXZ5sg85tS8TJOZht2GyJGAJNlc4ABxq7oBYQR9mA+4kqnFscQtg68AHks=
X-Received: by 2002:a37:6554:: with SMTP id z81mr10283146qkb.9.1573233231220; 
	Fri, 08 Nov 2019 09:13:51 -0800 (PST)
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
In-Reply-To: <CAHw2UgAT_sL39YBSRJ2D7EKA28=4aL3OHJX7LW2Y4CVw_6STwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Nov 2019 09:13:24 -0800
Message-ID: <CAMKF1srcG7HP18wyYMK8Sn4uLbzyr+ePTGCLUZXvyecVj6nBoQ@mail.gmail.com>
To: Marek <marek.bykowski@gmail.com>
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
X-List-Received-Date: Fri, 08 Nov 2019 17:13:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek

I thought there are some feedbacks to be addressed, so I was hoping to get =
a v3

On Fri, Nov 8, 2019 at 5:24 AM Marek <marek.bykowski@gmail.com> wrote:
>
> Any thoughts if this is going to be included in the upstream?
> Thanks,
> Marek
>
> On Tue, 22 Oct 2019 at 12:03, marek.bykowski@gmail.com
> <marek.bykowski@gmail.com> wrote:
> >
> > On Tue, 22 Oct 2019 09:15:23 +0200
> > "marek.bykowski@gmail.com" <marek.bykowski@gmail.com> wrote:
> >
> > > On Mon, 21 Oct 2019 19:42:45 -0400
> > > Randy MacLeod <randy.macleod@windriver.com> wrote:
> > >
> > > > We have had Intel employees working on oe-core / meta-openembedded
> > > > for years so I hope that you will send the commit to that repo on
> > > > github and indicate the
> > > > upstream-status in the patch what we integrate into meta-oe.
> > >
> > > Hi Randy,
> > >
> > > I'm Intel (actually a subcontractor to them) working on occasion with
> > > Daniel Drogomir, Charlie Paul, and Chantale Ouimet from Windriver. I
> > > have put the names as chances they may be your colleagues. Even
> > > though I'm Intel I didn't know of lmbench Intel repo on github - this
> > > must a totally different team. Sure I'll send the patch onto that
> > > repo indicating these are the changes integration planned into
> > > meta-oe.
> > >
> > > Regards,
> > > Marek
> >
> > Done https://github.com/intel/lmbench/pull/9
>
>
>
> --
> Sl=C3=A1n,
> Marek

