Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id DF20971D9E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 00:54:22 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id k3so4377225uak.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 16:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=l8N1QqF319UMMy/ywgQOgndVa9eXvK9EInCYq6N4gEw=;
	b=AgLSZDaQHhvtcRQYe0sLt3Rcq8y5fcN9G961VdjhefCW8e6wOXgTst4cXJ36AkA8KQ
	8wsI0v8tdBewevopHKqEDoQ0tYdxCQ48zuJkQLnM/31atGarCl9tZuyL+Hy8lg08W8EC
	5pgxtO6tqS9nUV8op5s6L0lFyn76kFeXl/eyXxsEDtXVBbM+apV3NepGKLx8JXyDFWqz
	704tEWLk2m8RMXdIdws6fxNMKOvsBzyZD5/IUIzzgwyLnogRCyRhLiqlAXoMfcPgPHVS
	jmbsVlrUXcT6zjoa4SyA39EMwcnG8o8ThFfUjyAVtXPvNVk3L2t16BYg6C99i0mYrekF
	EoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=l8N1QqF319UMMy/ywgQOgndVa9eXvK9EInCYq6N4gEw=;
	b=Cr01CF/qzD9woKY+QvQJgGQUw9+ApeR2nRWwz7ahzSe1hk633bRulmB4wfci2k3Qaa
	quirEptdIvBWoMRirz6G3JK3UKfBQNbL2bauyYOKY4C1+Uq4QA+rTN4+RQM+ztCFNLXb
	DGZypgr1jcivWOtWz0DQSw+GWCUpSfa2uzLuc6uMGQXh8JEvV4+5sT2N+/aLtVVpm6GB
	OkGPAwDuxlk4+Lkf5jbQOmFcxz6B5gFX0SG+NWMkFPpeJkFWobTSFLNYSYZlveh8crz5
	uGEOxbU4asa52/kV+EUYxXPZM0mFmP9RmjdJgncu0UsXhkF03Zc/9BWTKJNao1pvmjMN
	psUQ==
X-Gm-Message-State: AMke39ldXo2ReKMMBv1xqrDLOKFLunNs2F21Bi6mCuGbptWXN4R1mYpIqjq26UNaaBsUkiRDf0lr3T8/oB8GeA==
X-Received: by 10.176.6.130 with SMTP id g2mr4485973uag.91.1487379262544; Fri,
	17 Feb 2017 16:54:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Fri, 17 Feb 2017 16:53:52 -0800 (PST)
In-Reply-To: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Feb 2017 16:53:52 -0800
Message-ID: <CAMKF1sokUFzXYv1+7gGQQtiJQP2Oz2cE24FBJhi3RdP9io6TBQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Sat, 18 Feb 2017 00:54:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 17, 2017 at 9:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
> The recent storm of breakage in meta-oe caused by recipe specific sysroots
> was quite dramatic:
>
> ross@flashheart ~/Yocto/meta-oe ((044e518...))
> $ git grep PNBLACKLIST| wc -l
> 320
>
> Is it time to talk about splitting meta-oe into smaller real repositories
> so they can be maintained at their own pace by more maintainers?
>

I think thats a fine idea, however, it needs maintainers to sign up
first before any of this can be sustained. I think it was forewarned
that such a change is coming. recipe maintainers or users should have
risen up and sent patches. This can not be solved even if you divide
the layer into smaller layers. Problems still remains. Whats required
is to look other way, where we have
faster infrastructure to test meta-openemebedded layers and ease out
maintainer's job by testing and working though the changes. Blacklist
is infact the better way to disable the recipes instead of shuffling
layers. One still has a good base to start and fix it.

