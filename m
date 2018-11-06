Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
	[209.85.219.176])
	by mail.openembedded.org (Postfix) with ESMTP id A57E874E1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Nov 2018 08:16:58 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id u103-v6so3413903ybi.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Nov 2018 00:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ODwYgIAz4tBsLDooI7WHNuHf91jUed6hT1VihtJTTpM=;
	b=sKiNIn1+L2xowWGL4i9/SozrrohGn3gMLMciQEm9ucL/vqcCyBWuk5dxor+9cQZhrs
	OymMK5nSzb1/ixTJ3ovYwbZSxm2uYJlMH2RrfAN/kDtgfZURovudQO2opY2ScaO03WNA
	/s3vfkYek6teRwfCTenGdH6uLisQlsyWiAOnQB+kJpW6R10RHueT8SYalC8w8SZNAf9x
	p9XmBVUEa4kpIgmIl8XNymQMxKsDTXOvfn4tng3EbEzYiBqCRbPd0NAlj8m18ChMVy9F
	pXkd7qCL9QceFJQFTBEoXrj2cKIBN8OfJp4tROargkAGZGoT20QvLdmQwQVih0cMgdJI
	HbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ODwYgIAz4tBsLDooI7WHNuHf91jUed6hT1VihtJTTpM=;
	b=lNUxg0nkrKWMLQhj8051+EhFvk58Lp/Iz1yqtEDgFHq7Kb5nYjmf8IU3JAHTQvLUSc
	ZM/iPCDPSlZZSpJEERI6Tpd2pboxVMU/rK7/PSrNdIGhH3MFkmKcCXZcEK4iPnLEKlHb
	FZBhcBLzXbiPIb5UnS1slxYg+A4ZDGbXhSP2N2bVm0hmSKkr48RqWj5G11Xoly2IwKOt
	72o3O56M/pI3eD6mu3ROQVp2hDTf1BfSU6OI27p6immRxGWwA7dWjKj9A9wDRuDBxLcd
	z+PL6z8qTF6qc882Y3F8KSQkTt6BdgOGUR/N1lUtIsAPaeuwG+IhCu+zVka4Oojz7A7E
	68Kg==
X-Gm-Message-State: AGRZ1gIQdtVdTR8BjEGxUaNiOfKhUgPatVmc6EzJkNMO6TgpyVsckuKA
	leh9q1Tkj+P0QG8/yBQ1PRVTmUGJEmNsaFp2cN8=
X-Google-Smtp-Source: AJdET5f1N4wzJeTtabDukEl6g+JJnLJv02DCvMApDhHhcdWv4qBWeACweucoZZ7NKS6NlhRHqjthzwb9G5HX0k/PzNA=
X-Received: by 2002:a25:308a:: with SMTP id
	w132-v6mr24694195ybw.106.1541492219427; 
	Tue, 06 Nov 2018 00:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20181105055915.148218-1-kai.kang@windriver.com>
	<d6c0751d-d377-f964-0310-3856116bea88@windriver.com>
	<CALbNGRTZCP+TKaDh40aFuh8ryx=kZRZacnn+i20Ok47CvM7iig@mail.gmail.com>
	<180b349b-52ad-c4cf-2add-69f74e2c649d@windriver.com>
In-Reply-To: <180b349b-52ad-c4cf-2add-69f74e2c649d@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 6 Nov 2018 09:16:45 +0100
Message-ID: <CALbNGRQDVmE1FJR3jfPdsAWDQEOFnse5UFbkpx3E8sXgm2Jh6Q@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] libunique: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Tue, 06 Nov 2018 08:16:58 -0000
Content-Type: text/plain; charset="UTF-8"

> > I think this breaks introspection - why not just pack Unique-1.0.gir?
>
>
> If configure option '--disable-introspection' is set rather than
> '--enable-introspection', no file Unique-1.0.gir is created and
> ${D}${datadir} is empty.
> Option '--ignore-fail-on-non-empty' of rmdir is to make sure not affect
> introspection.
>
Ok - thanks.

Andreas

