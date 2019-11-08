Return-Path: <marek.bykowski@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id D73177F746
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 13:24:36 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y194so5223045oie.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Nov 2019 05:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tjxd9+I4blDxvTzsOgeruQPRQtgy0ENq0qaanLyY610=;
	b=rMcMOY+dn5zfBOjdVF8S9Obz779//s3RPJYmenvW6u7f9TuIxRtpbbnyxqzcUaGV97
	f1673bz5U9rWdIM90UlNPPSi279dzKc5LXB8IKEe63JWnP01sFvjN5khZQ63pmE10M+t
	y05rvDOYFCSmIoKVjtNh1xcGrV78Ffmn/wd/7HzKfDmeIIkuNL6txJ85uIO2HDZqkGcZ
	BCntAkh73qlOjM8qxgOm91E/DQRXB+MjKJtx5tsQIgXiFgUiqH0e8PV9VeMfZl2ocpnT
	LZGzJHJIAaywdocNkWh6gSkxhhK/uCQCu8ObElDX8rwhuamMprHP+myhs7ulmS+mhwPn
	pCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tjxd9+I4blDxvTzsOgeruQPRQtgy0ENq0qaanLyY610=;
	b=X9h2mQMxMbVpQ583WLKCNgP+56yZX7XxgnjLgWhnqqvU7tsep6YpW4jFvRBRAnhXDk
	t7MQpHrgJzd92zH4MjpVsfqRRIogHNOGDx/VAXZOzqrCQoHeRBGQYjRpXnIPetay/8Is
	o/FBgcOvuqaCZwg0eSw/wZAT0qvEmYUMOL04/FpjX4u3/aZl4iZT4MDwMyKJ1dJNCpVV
	1yB9kPFsS9mO/Uc+o5KsoYuaWZhsxTjz6MLUvR6I84Pt0bNsj2snHlQmRZ5OS9q2GaWU
	KbKqxmOVzHPOMXSFwVNVKe/cUvHDSjljouWMXYwN7gb1m2LvuMclJl6lu3q0JCyjWf3N
	32vg==
X-Gm-Message-State: APjAAAUjY6gR5bligUhAs6H3OJX49acfPM4wklXzzNA6qJqCu5Zacpt5
	rX5fR0r6DAeDPx2mDgfgxQ8i72Qnrt3bR5wMCm0=
X-Google-Smtp-Source: APXvYqx22tTjc/+QcESj/P0bM6ZpG0+GsKG7pcdt2jU6BU9G8QEyThYB+ci801FclVapzFN9PqgCm/wlqkMTmZDGNGU=
X-Received: by 2002:aca:abc2:: with SMTP id u185mr9386984oie.160.1573219477527;
	Fri, 08 Nov 2019 05:24:37 -0800 (PST)
MIME-Version: 1.0
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost> <20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
	<20191021113018.3c684d51@gmail.com>
	<0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
	<20191022091523.60d5434a@gmail.com> <20191022120320.71fb6436@gmail.com>
In-Reply-To: <20191022120320.71fb6436@gmail.com>
From: Marek <marek.bykowski@gmail.com>
Date: Fri, 8 Nov 2019 14:24:25 +0100
Message-ID: <CAHw2UgAT_sL39YBSRJ2D7EKA28=4aL3OHJX7LW2Y4CVw_6STwg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
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
X-List-Received-Date: Fri, 08 Nov 2019 13:24:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any thoughts if this is going to be included in the upstream?
Thanks,
Marek

On Tue, 22 Oct 2019 at 12:03, marek.bykowski@gmail.com
<marek.bykowski@gmail.com> wrote:
>
> On Tue, 22 Oct 2019 09:15:23 +0200
> "marek.bykowski@gmail.com" <marek.bykowski@gmail.com> wrote:
>
> > On Mon, 21 Oct 2019 19:42:45 -0400
> > Randy MacLeod <randy.macleod@windriver.com> wrote:
> >
> > > We have had Intel employees working on oe-core / meta-openembedded
> > > for years so I hope that you will send the commit to that repo on
> > > github and indicate the
> > > upstream-status in the patch what we integrate into meta-oe.
> >
> > Hi Randy,
> >
> > I'm Intel (actually a subcontractor to them) working on occasion with
> > Daniel Drogomir, Charlie Paul, and Chantale Ouimet from Windriver. I
> > have put the names as chances they may be your colleagues. Even
> > though I'm Intel I didn't know of lmbench Intel repo on github - this
> > must a totally different team. Sure I'll send the patch onto that
> > repo indicating these are the changes integration planned into
> > meta-oe.
> >
> > Regards,
> > Marek
>
> Done https://github.com/intel/lmbench/pull/9



--=20
Sl=C3=A1n,
Marek

