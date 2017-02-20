Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 26225600B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 00:56:28 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id 62so1180264uar.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 16:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=wuKE3OG4LU+OPtAHcUDTrYrq/ablCJMbtVCTZzZfzVw=;
	b=Y4ruc/BpXf/9Z+R60pS29gB3R9p/qIfkAidNUTTHYvPj6Jw+pKazBXzgnmZdY1Grvh
	H3Gu16/EjNV6RCteSvxxV0R3g7kubUPZx1bumjey0gJ/Xmj38AKZDJcYHBKouCcUn/Dc
	IcZ0j6ByBzTkNBj8PzflYQRSnGER91dM8+EOwj5glxrW8mw4B4QjrynB3fKlZ3WvSa95
	Wqc4ewfVfKMUdCbSFDK6jNLQVjpRt/hsuS2C7/ujhE2/CRa6ms6/f4i61Fpja2dfXQ66
	4GMwb0MLlL177yppUpIrUTCn8dGn+kHV9PrMGTd+ap+rDQorQvxYWqOqKliV7Tv7qcLj
	7KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=wuKE3OG4LU+OPtAHcUDTrYrq/ablCJMbtVCTZzZfzVw=;
	b=XenKWGr3oDCX2L4L6s02GqukZQj2a+aOoegzMOBQSJGIik7VuBRL6uXO92X5kUOuY4
	bYMpaym5479D/NFizYSch3MlhEcvOBguFNWHITBeqe3ChbYruwILx865Ep3Nqlibpau1
	Ax/lAg8YnmIcq28ugPVxVkEl977f1PAuaDhYsrMJ68wh0YQhhRuKdPhhJNE03i+4aviR
	mizdKiLIG2g71eyjFMU6/ErqHBUmrKgO8BzCq0vu1oyMgoUdA7oUM4JM0XkISiZGn/CA
	NGZ3rYSIEnwdTR4VRsacV0NLlWcU6mozsJRvsFmYpMTQ08e915J+3kr+FqCdsdvsDMr1
	vqCg==
X-Gm-Message-State: AMke39njv51d+4qnppQ9FsFseRoYXN8nf5NVe67bRJe4Ax3/i6j0oPQdH7AGeVtAv6Wkg3qd/3izM8QV704BQQ==
X-Received: by 10.176.90.144 with SMTP id w16mr9287473uae.101.1487552188797;
	Sun, 19 Feb 2017 16:56:28 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.20.1702191333140.31844@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.20.1702191333140.31844@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Feb 2017 00:56:17 +0000
Message-ID: <CAMKF1so-WgaN+PvoQmKrwH6E8mEikRvsPoZszSk4_gzH+ZK8og@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: are you allowed to have an underscore in a recipes directory?
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
X-List-Received-Date: Mon, 20 Feb 2017 00:56:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 19, 2017 at 10:37 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   i just noticed this in meta-oe/recipes-support:
>
> $ ls
> ...
> lm_sensors


Its directory name I believe and not recipe name that you are talking about
here in this case it is fine

>
> ...
>
>   is there any issue with that directory name containing an
> underscore? i know that has special meaning in a recipe file name, but
> i've never noticed an underscore being used as above.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

