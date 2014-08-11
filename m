Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 874CE65D9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 15:54:37 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gl10so6764212lab.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=4M298Cwyqvjq6bQyFUFFFV0Rpqrs2hwO/HuEcO6EDcA=;
	b=kM1yUkMbXqqa5gaihFJCAq8+Pmm/qqAV7zj9rIUqzoGJyxW9MB/xi/+T4z4wFkZJko
	nnGvh+Pkszkk14CwPGA5XMkVFF+dijhhnMIuhNKmF2uwvd0GbXJ3QPaQCB9X1mCqKWDq
	26y29v0MmhZ5CeRH1Zs0RUUnMv4xWeSX+me9OTEiQpTEi2ujSgm124S/2HHMmlvBJmBS
	ADrqZVGvMEvD+Nn5nWNuXPIGpIkkfEgrH9uFgHaWDuIpPNnsiltJwC+3k5JX9INKAy9L
	pfJfNACpw9554inSqONZSoC3ekjFqvnhDmPit+54PY+zsJdJD+i4YC6u9mk0bkALu5Eq
	0Nqg==
X-Received: by 10.152.204.5 with SMTP id ku5mr9020280lac.68.1407772477805;
	Mon, 11 Aug 2014 08:54:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Mon, 11 Aug 2014 08:54:17 -0700 (PDT)
In-Reply-To: <20140811085150.GV14848@jama>
References: <cover.1407632366.git.chris_larson@mentor.com>
	<df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
	<20140810092431.GP14848@jama>
	<CABcZANma2YyDV34G+9EcZ20n8Uj7cFjKXh2AHG0zSqd2b+f4wg@mail.gmail.com>
	<20140811084647.GU14848@jama> <20140811085150.GV14848@jama>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 11 Aug 2014 08:54:17 -0700
X-Google-Sender-Auth: zcU6eEzedd8F31chfDohDF8NU4c
Message-ID: <CABcZANktWOJNMn2RUDhzxn1_5CyE1KV8iCpECp6kvP_Z2K9UnA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/5] dnsmasq: fix parallel make issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 15:54:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 11, 2014 at 1:51 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Mon, Aug 11, 2014 at 10:46:47AM +0200, Martin Jansa wrote:
> > On Sun, Aug 10, 2014 at 05:36:32PM -0700, Christopher Larson wrote:
> > > On Sun, Aug 10, 2014 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > >
> > > > > From: Christopher Larson <chris_larson@mentor.com>
> > > >
> > > > Is this v2 of this change which was sent earlier?
> > > >
> > >
> > >
> > > They should be the same, just this one is part of a series with other
> > > changes. Either should work fine for that particular issue.
> >
> > There were some smaller differences (like Upstream-Status and SRC_URI
> > addition in .inc instead of .bb).
> >
> > I've resolved them as conflicts in next patch.
>
> Hmm, maybe not correctly, can you please check what's wrong in
> master-next or resend rebased v2?


Hmm, will do, thanks.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

