Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3C447DED3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:07:12 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 14so1668555qtf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rTHfdbaGpLkbMsMzkFbQjB4PlxC7oTpccS383zwRr10=;
	b=uT51VlEcfGeoswFklovpbWMx5uAuKtoy3pdyX3bfWpHcyuEP6DkRqKFY8yg2KRwgCb
	8R/t1ojoiPFHy7RYB6+2U3ec75pZzb6yTqP76Z/mfNu92lIcxubbA9wTrNmuqAbUn2tg
	i8uZZ/cU2Gbsm33qprzBGuVcPZcDZOcrH7XxPmizMIXlm8oNP+m8OxaJALy/skYbDUhJ
	n0GY0LnrstItIgcxS1wn2/12cySQzsnWoFh9cW4jeYMwzO7VrnOb6akh+YbGA3N55H2i
	ACwRBPlQkLThzKmuyXcBboPHLjH+Bo+oupqZ1fmFrEDQ1UkIzkOe4CKahTLeIuFJ/Q9Q
	Z1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rTHfdbaGpLkbMsMzkFbQjB4PlxC7oTpccS383zwRr10=;
	b=fVLfnUrltKQENb7oQ6bOv77TAz4k2LQg5rAAatJua4/HybBi+hjIdV6d06832PixTo
	BekNpzuTJYquXniTTwYjJ8P4phSGjAp4Usds8ckghmuqInn7GGUrBSJsztEYmpjdXDwN
	dkFdFhqzHlRj0KZm164SpD8gYVEYOf8vhjDqzHphr6jv6yaynQJIBRbKUqu3MgaEO0yR
	RgnmfROsZaZ95Vsqee7g8iQkNbLlGQ4Rda1cPept6ZGb1RxKUqqpmabIl9yUlYH4UhBh
	VQcSslWVEh7wf4CwDaMxpMpNpZ5NoMK+sGwjpBp6qPi4JVSU4EXqjpNjkYBukDeX/vKD
	zTxQ==
X-Gm-Message-State: APjAAAUIX592GBrNg4tSPnCmquXIBAJWLVxsIq3raPSWangjqSWN/1to
	u4C8Tt+Uk+8m83ePpuW3L2aBSHxPuzSls4b8IKITKKhEuJs=
X-Google-Smtp-Source: APXvYqw25Le3lF2KFLgUyl6suZgB0VJTme78qEvFAalwteXz7SfM4z4H03yftahU2pssM1Auu5m8olhdqKqljxsvBQw=
X-Received: by 2002:aed:23a8:: with SMTP id j37mr64608309qtc.53.1559120833542; 
	Wed, 29 May 2019 02:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <1559011919-113581-1-git-send-email-changqing.li@windriver.com>
	<20190528193734.GA18778@localhost>
	<30bbbc31-4f2d-771c-bb83-a09407a13489@windriver.com>
In-Reply-To: <30bbbc31-4f2d-771c-bb83-a09407a13489@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2019 11:06:47 +0200
Message-ID: <CAMKF1squ-XhkRTG9PEOuPQBX-dnPu6riWst8+i4gYWkLLEEE4Q@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 1/2] phoronix-test-suite: add rconflict
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
X-List-Received-Date: Wed, 29 May 2019 09:07:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 4:51 AM Changqing Li <changqing.li@windriver.com> wrote:
>
> On 5/29/19 3:37 AM, Adrian Bunk wrote:
> > On Tue, May 28, 2019 at 10:51:58AM +0800, changqing.li@windriver.com wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> phoronix-test-suite rdepend on lsb, lsb rdepend on lsbinitscripts,
> >> lsbinitscripts rconflict with initscripts-functions. so also add
> >> rconflict for this one.
> >> ...
> > In what situation is this needed?
> >
> > It sounds wrong if rconflict from lower-level packages have to be
> > replicated in higher-level packages, and is likely to break in the
> > future.
> >
> > cu
> > Adrian
>
> My original idea is that,  by add this info,  we can get the rconflict
> info when parse recipe.
>
> But, you are right,  this  is not good for an indirect rconflicts.
>
>
> @Khem,  I noticed this is on master-next,  so maybe this patch 1/2
> needed to be reverted.  Sorry for the inconvenience.
>

thanks for letting me know, I have dropped it.
> --
> BRs
>
> Sandy(Li Changqing)
>

