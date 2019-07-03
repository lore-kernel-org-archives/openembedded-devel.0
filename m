Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id DE5487EB5D
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 10:46:00 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id m29so2221125qtu.1
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2019 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cQjQ0txhv71uNCr10rIxnf6wqugSJLfNAb4/J/bR7dc=;
	b=OnUzOrk0u5DheVrAXwv8VV/elmTWEoKrEozOWSoLHPd9rLIgyZfUlDXiifgKoxl3ml
	aiZOVyFWMYNBVa8E5vH2ZtoLpArbfDt6/X3XfRzrhn7mJjyRVXGtpVpLf+Pu2ZiBuS89
	UJvZMQc1+b/GkrGn5ZAkJUrTRXjKmGCAFScVQyJvFlcGcAWqy26fOKfdWHIamWsHVLby
	1p08wvh9zZeJdRfBvBn5ahTxifENeWA2FCM4432Ps11YX1QwuN0MYwb2xota/BivZ/kz
	IUSzzQPLsDVkkRiNMCddlXeWvD637CqwwSS1Nlhazdt9QAWXQ/dsnKA+1L5xgnZoTkDy
	syoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cQjQ0txhv71uNCr10rIxnf6wqugSJLfNAb4/J/bR7dc=;
	b=PlwQXdGFw7uSW2jeuF9xr+rKT5Qg8xMSKG70ieLM/WuV+mT2IRcLhVVAm4bNOkpAIL
	JgEJZMuHvYOV2i+KOUE7cmOjML9F5HT/E5JElUZk1C+lsl8GQ6uHkmfM9N+Dieo3IAxv
	SIcQOfwk9P81LRl1V3irVqem6wnm5r0yXFy7s4drNHeCPrj+n5VFNtQk6u4Y9wbndH3e
	8wmFEo/2Bndv25LviIybAvEpGFg7UlHGeia4bhu5r28a9ClR3a+VPL0gVfEb6zPrcUXK
	d/3TYthkWMNls7Mhe46Mz4gI+4rW5xRD1HsN42D+BuVCEQBqy3J8537RYEJaUvyrHdfM
	DLZA==
X-Gm-Message-State: APjAAAXrCinFxxk73/YufaMqxGLmYL5B5ZqPRURBlLisfSgOoDMhyRzz
	nwyuWQIYUKMR0/OHfYluswqrLDuDVvRelDpBlUM=
X-Google-Smtp-Source: APXvYqyh4l7D3eMd4M52XKjQWxN2DfDKqHYSsgFjOycdMO2vxgzSislyoPrThuUT3+uKBWe4PxwvW9Bi0GVzla3YTVY=
X-Received: by 2002:aed:3f1d:: with SMTP id p29mr30144889qtf.378.1562150761619;
	Wed, 03 Jul 2019 03:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sr9T0K71M5K4Qh+K-PrFv1dn5L0aNpn2hkN4usLY5hDpg@mail.gmail.com>
	<f69d8e4b-1603-e599-a56e-2b65a0eeb27e@gmail.com>
	<CAMKF1sqWjwdsArsPO1D3Ky3dFa8pkAO092hqdKLsPzbKBJd3JA@mail.gmail.com>
	<d28b367b-ebaa-9fba-6e48-c62438d92bbd@gmail.com>
	<20190703080901.GD1484@jama>
In-Reply-To: <20190703080901.GD1484@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jul 2019 06:45:35 -0400
Message-ID: <CAMKF1spG+qjOM1KJfaZ--133k-iUBjHQbHzXAgf6f-4TnONdkg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Delays in patch merges
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
X-List-Received-Date: Wed, 03 Jul 2019 10:46:01 -0000
Content-Type: text/plain; charset="UTF-8"

I thought we still wanted to review if all the changes are ok with this
pull.

My access to remote machine at home has been severed while I was traveling
this week. I am getting back today evening then things will start again.

On Wed, Jul 3, 2019 at 4:09 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, May 27, 2019 at 02:10:23PM -0700, akuster808 wrote:
> >
> >
> > On 5/27/19 12:02 PM, Khem Raj wrote:
> > > Primarily master if we have stable merges I still have one day
> >
> > what is in warrior-next is good to go.
>
> can we get the last batch of 20 commits merged from warrior-next to
> warrior?
>
> I can try to merge it to see if I still have permissions to do that if you
> approve
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

