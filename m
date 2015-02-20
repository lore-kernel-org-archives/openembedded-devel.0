Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0C77D6B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 14:36:00 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so12566523qae.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 06:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wEtjNT6+YD+RVug6ZWCT4rxaxbGjQ4qOmb9RBYd6eJo=;
	b=nGaz+Ec/TXFfgkrDkLfEmOYkwWsQx938kz5kE+Z61+eHeWGx6K4R/wtjWzHPGrjAdp
	oCYbqfWCILuHdBdqSPgl/a/02g1NJgqEPmObZN9k2NmICT8blA9/IdEtY2w4GsFulFL1
	fSTYQwWJPOgGR8gbvtsUiCK8nDQfD24UJ33cnIEpdfvrTmKoEg2eB5NkFUNSXsH6lVAx
	jOS7asCD1CDmOh4Zv4BKblNAqOpadkyqkpbkFl2qKfpaiu0f85k3JhwfqK8pjL8w6hJg
	sLeSlk/yT1k4T6bH1VqRGNgjPnJaRkdPr9f7N3RHK+6vXsGsugkOcnboI+a06hEorOnH
	JWtg==
MIME-Version: 1.0
X-Received: by 10.140.41.169 with SMTP id z38mr23200792qgz.56.1424442962064;
	Fri, 20 Feb 2015 06:36:02 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Fri, 20 Feb 2015 06:36:01 -0800 (PST)
In-Reply-To: <BB19F3C7-2950-4E41-BF62-70BFE4FB9C9B@gmail.com>
References: <BB19F3C7-2950-4E41-BF62-70BFE4FB9C9B@gmail.com>
Date: Fri, 20 Feb 2015 08:36:01 -0600
Message-ID: <CACS+7ZTe-PfQ0VjLJ3pkEi8chSg4rH2+fLog7aNUqkPQ=ZZssg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>, openembedded-core@lists.openemebedded.org
Subject: Re: [RFT] gcc 5.0 recipes available for testing
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
X-List-Received-Date: Fri, 20 Feb 2015 14:36:05 -0000
Content-Type: text/plain; charset=UTF-8

On 20 February 2015 at 04:55, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All
>
> Encouraged by help received on testing out glibc 2.21, now  I have put together OE recipes for gcc-5
>
> GCC 5.0 is in prerelease stage 4 ( open for regression and doc fixes only)
>
> https://gcc.gnu.org/ml/gcc/2015-01/msg00156.html
>
> The recipes are available here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-5.0
>
> you just need the topmost commit and then set
>
> GCCVERSION = "5.0"
> SDKGCCVERSION = "5.0"
>
> in local.conf
>
> It has been lightly tested thus far but try it out and report issues you observe in your build setups, we will bake it there
> until 5.0 release
>
> Thanks for helping out

I'll get to testing it later today, but allegedly the address
sanitizer and undefined behaviour sanitizer runtime libraries support
more architectures now, so I'll need to look into turning them on for
AArch64 at least.

>
> -Khem
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

