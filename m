Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 451B578C8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 17:15:01 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d131-v6so10113978qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RkpNw6H3xQUsekE53onGfWZRSHBMZNhheoS8pdfLeDo=;
	b=P0lue5UmBDMPzw9oOQ6hlChSSXiM/Wk+XYveJEgfYMeU/3fyQuHk3Q5Q0Z1VYvu+TJ
	/XeX0KMGKADMqLCEtiQ9xGYTlcM3pQH2nRJ74YbGBu8s4H+tkrCFOrqAEz/8cMzWNvwj
	vhrhws3UEkrGEiadUeOUijFc9Rl/RUMTHsQsUi7TwDVCFon9OnM+AyfGB0rbyrcxqhuR
	YcZfYlyXUs90dDBtfon5BqzE4SKc29KEErS3jHFHk7V5kJHHmxFBCsRzE/raDTO3Uw3C
	xWslx5zNDw8bvU4xNlfCRsqMuIxBMfIwq161HYfVdKeL/gYDzgFlLARU9j+2SX4Xm8N/
	7KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RkpNw6H3xQUsekE53onGfWZRSHBMZNhheoS8pdfLeDo=;
	b=pd5O9Ial8L32KVc7aG4Vdj/GwVFmdXQpRCg1xBEwUun72+o8hHSxrkOBxO5emFHKxX
	X3vCtjuZlf2bFBG3YjZdTR3JHcS20etEjCVNE7Eu9G/BrO+Kvn26zb9AsPq0tBpoNmLA
	WVoMPyiw2Wk9GCyJPg8I+qmhrdbogO/mfeyGv2y6WhEZDEU34EilyX5i3YCJuy3OKvqu
	gZ5s/ZnEfF9B011gQh3Ceq+ZEDqlQ2MArcA/TUJWBnHTdaXWdgGcbhLx9yOnWOf+nDuh
	nXmM6WdgCgR1ySoApDo63bDWY3rc/FUBFYAZkGSNnomomH+VcIOKI5SNLQTXUil6enhH
	5s9A==
X-Gm-Message-State: APzg51Bjs4tiyOZ1JXfIlkrXH88i79WQuSPo2Ae+3eKHKrV4QAkZfGsT
	JoSOw5s8n8xGG8nwXYMt4bwrW0pur8pyvMjfqyU=
X-Google-Smtp-Source: ANB0VdaVcgbgoVMJ0qTKPdFYWx2T6xCAkadUJd78ctXY7tbv2PAt2IfpMvctgkY65cHMoI61G/XM5ggROJbA6FKqirI=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr6703600qke.102.1536340501862; 
	Fri, 07 Sep 2018 10:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20180907102842.24197-1-schnitzeltony@gmail.com>
	<CAMKF1speuTVVk+o9svpy-Chudk18WGvMcvEEd70dsw8x+9Kdag@mail.gmail.com>
	<CALbNGRT4HbiFCxVT9CYEX=-cOKCT0HfKkAJ35F5FH2e5xJWzDg@mail.gmail.com>
In-Reply-To: <CALbNGRT4HbiFCxVT9CYEX=-cOKCT0HfKkAJ35F5FH2e5xJWzDg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2018 10:14:35 -0700
Message-ID: <CAMKF1srtxPsZum6ePBxCeyehxYJbC8YoN-QXD0Pfw+BSR=JR=g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] blueman: rdepend on packagegroup-tools-bluetooth instead of bluez5-obex
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
X-List-Received-Date: Fri, 07 Sep 2018 17:15:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 7, 2018 at 9:54 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Fri, Sep 7, 2018 at 4:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > hi Andreas
> >
> > On Fri, Sep 7, 2018 at 3:29 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >>
> >> Have a better out-of-the-box experience
> >>
> >
> > Making a recipe rdep on a meta recipe is sort of too coarse grained
> > the vice versa is expected
> > can we encode all needed recipes in rdep ?
> That just causes redundancies - what is the problem exactly?

Not generally hard opinionated on it. But I think
packagegroups generally cater to images no to individual recipes.

>
> Andreas

