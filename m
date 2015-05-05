Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 49FE471144
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 23:03:12 +0000 (UTC)
Received: by iget9 with SMTP id t9so87971592ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 16:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=u3Xe+qDdkYeha2/N45OyoADL1yiJqsZOw75OjH4v6NU=;
	b=pFgs6L+/ovQyFWD6J3or3BSqVYNRwfT/iiy+sh1BSMBcBG7Ow6u1Ll9eypxFDjT5sN
	p5by4o//0wMxs7sQBSoK1C6cDquPSQ2qyXsH2kt/wHWemM/EqFvIQDT/sbcwkTTNtrR9
	n2+58wVLs92PmrrgWPjCzvlzRgNzssPjK+l4qxJNbMhmOl/S+Vqt4ft5AD2KiU4L0VhH
	fqc1C60QrX9CUZ5G7NuPJw2YXsdBobWqhUU109qR7lMdJEEkMxjN+Z44dN5bjEUBRPzj
	2kTYapRDZ9/fFwfW9DY040EgVafOo3jIz/FJRiFadIA8jL6atS+gV1uq/GrKvdRVk7aA
	trSw==
X-Received: by 10.107.30.10 with SMTP id e10mr37109347ioe.72.1430866994071;
	Tue, 05 May 2015 16:03:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Tue, 5 May 2015 16:02:43 -0700 (PDT)
In-Reply-To: <BY2PR03MB441E61C43434B3C0DE3568884D10@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1430732876-15399-1-git-send-email-b40290@freescale.com>
	<CAMKF1so7KpzaY8Yog-s7hkgG1ujDxvgZL1wiPivTVmccF6=2-A@mail.gmail.com>
	<BY2PR03MB441E61C43434B3C0DE3568884D10@BY2PR03MB441.namprd03.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 May 2015 16:02:43 -0700
Message-ID: <CAMKF1soKi6oQaYQWwt4fbbMHxFe-dTb4XnwbuUKb-rbBiZEuWg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] polkit: do not hardcode the libdir
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
X-List-Received-Date: Tue, 05 May 2015 23:03:16 -0000
Content-Type: text/plain; charset=UTF-8

On 15-05-05 03:30:10, B40290@freescale.com wrote:
> Base_libdir is defined in meta/conf/bitbake.conf
>
> export base_libdir = "${base_prefix}/${baselib}"

thats OE environment. I was asking was autoconf question

>
>
>
> thanks,
> Chunrong
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Tuesday, May 05, 2015 4:22 AM
> To: openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH] polkit: do not hardcode the libdir
>
> On Mon, May 4, 2015 at 2:47 AM,  <b40290@freescale.com> wrote:
> > +-libprivdir = $(prefix)/lib/polkit-1
> > ++libprivdir = $(prefix)/${base_libdir}/polkit-1
>
> who defines base_libdir ?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

