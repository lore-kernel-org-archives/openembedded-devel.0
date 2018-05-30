Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 23CFE60800
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 16:50:29 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v13-v6so18538197wrp.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=04b+235RkH6QmM1iBiZNumPtpro4rPFD7khjB+22a78=;
	b=cczQkPZ0tlxT9oQVk+GCNIAQEl0RWq2OP7yiPdGRVkgmz4bBvKnuxrvGOTWtfaw80b
	oQOfdwCpEiXtCG9ZrCcBKXb078Bd5GtR1kkw8NElanSUwwQcOMaw8mQz/7A/tbBFPg6q
	3pXHTpExYWD3Qc6IQziIPKrH6MPW1QumG3Gvt7s2cN9Vfy7ibt1FweRqywuL6f2Agzcu
	4bMemdqrPHj7uUqARoQhUpDtNJQPVu4Le7TOreXRQYFpg7Cwty3cW3X4n4lua3qPWZ6r
	QRPPqrFgzZQG74/SNigZlaEYX4r8qBgeLeKRgSaFjhRjD6jcjGq0ulXW0cOZRUo/K2QG
	XWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=04b+235RkH6QmM1iBiZNumPtpro4rPFD7khjB+22a78=;
	b=GKTHMHrkFiBQVNPOcQx3pSwrHF69vMLLOvMmKU1kuNobGlG7C1pFA8VakuUwzbvRw1
	BguDO+GWfL70aIjkS4kIwGQSLz408QnuSe1NOUMiYOEZxszPrPKz4z3UixdQz6rciCBX
	di9tjA8CoQm5/9X9fNeNVd9HKQ6gTSS/xV9RoLnvmMihFpwnf3o10O+UEj0pCuTNAW4W
	1g5W0e4fWQNFqXtIn+tmGYvYoTXTU26MZMgDfAhNSQ+06sqn2gW3xHKoVCxPgPb3jHmf
	H2SbrC0gEl1WtxbE8MTHksI6i1JRBErfPxqTD8d6E4bn9oYMf3iwF9aFwcINeRyMCYKL
	gYNg==
X-Gm-Message-State: ALKqPwe+1FaUoMWh5Ma3dnQs6iGmO93Ki1554k2ayqsDnwSRlXw6yApk
	T5342W4HW6jrZ27nnjgzMf9EwrkLQo7nW4/EWbE=
X-Google-Smtp-Source: ADUXVKJHYcgpKsjrs3K8Tu0Z4o7ueuryGFiYqJ1dEIqoP4bXH60mXKJMFxvu+DLQyK2yqw7IZ1v/BoB+FM5T/ZNUQJY=
X-Received: by 2002:a5d:408f:: with SMTP id
	o15-v6mr2479495wrp.133.1527699030746; 
	Wed, 30 May 2018 09:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180530134741.29397-1-george.mccollister@gmail.com>
	<CAMKF1sqgQSZE9K36c3MOAEd_HCMoQAL5in8eRXSBdbbSe-+zrg@mail.gmail.com>
	<CAFSKS=NhF86xbrGtJAbfxhGMAsNGiaLxWVj-4oAjjk2R4zsFNQ@mail.gmail.com>
	<CAMKF1srma2-E4JwpKro-u6USuh+dXi49mnH_YT=ZCOLN3VzrgQ@mail.gmail.com>
In-Reply-To: <CAMKF1srma2-E4JwpKro-u6USuh+dXi49mnH_YT=ZCOLN3VzrgQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 May 2018 18:50:19 +0200
Message-ID: <CA+chaQfQhyKdSNqbdoJtdiC91xF88Her2AmiRp6f37KYE6N=HA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Subject: Re: [meta-oe][rocko][PATCH v2] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 16:50:30 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW: I've checked it in fresh checkout with "git branch -a --contains"
shown before.

On Wed, May 30, 2018 at 6:41 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 30, 2018 at 8:29 AM, George McCollister
> <george.mccollister@gmail.com> wrote:
> > On Wed, May 30, 2018 at 10:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> Can you try this patch with
> >>
> >> Bitbake -cleanall recipe
> >>
> >> And bake it again
> >
> > bitbake -c cleanall protobuf
> > bitbake protobuf
> >
> > Works fine for me with the patch applied. Did you run into a problem
> > or have a concern?
> >
>
> yes my concern was that your local git repo for protobuf might have some
> commits which might not be available in upstream repo. So checking out
> a fresh copy from upstreaming and building it is required.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

