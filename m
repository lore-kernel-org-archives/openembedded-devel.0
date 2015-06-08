Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 77B3473D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 17:58:32 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so62816366igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=s708uDBdPKRhqlA/jhDwik5fp5KZV5GwaDdXLWFt1V8=;
	b=qAIuWo3TwFIwZizMCLbJ6vq0aPuLn8S7vwF1qGhA2cYBBDIVq2dKRSufZ+jpvYRyfW
	yMC7C+be+T1VZYIxp2rAfpWlCBwm9xfrUK+TexqTeXY/ZLrBLIsAJXXqQav++sDLU4k+
	Y7VSFnyRHF309kl1aUB66ASG54ppz5mbYj+oKlXgOT7hVpi5vh7hO5+f9s9VpiLV5jpa
	7qWleurOO5EgM3PApcpVYC+zUbSEQYUzhfVlD//C9JmLfcncEWatL5pselLwYTdBzDaD
	hYabDtIrAHrncNUH2d3rFfYFY6oGiUqB1FxslAYJj8EPk7raiD3XN6Irqwf0YfIxoDeo
	6cqA==
X-Received: by 10.43.17.135 with SMTP id qc7mr25074672icb.14.1433786313885;
	Mon, 08 Jun 2015 10:58:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Mon, 8 Jun 2015 10:58:03 -0700 (PDT)
In-Reply-To: <20150608172456.GE2384@jama>
References: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
	<20150608170503.GD2384@jama>
	<CAMKF1spH5Fovxv6vp0S2T27GHt0BFqO6Tmm1ig3gJZ4+0M5peg@mail.gmail.com>
	<20150608172456.GE2384@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jun 2015 13:58:03 -0400
Message-ID: <CAMKF1spdZakWinTTr77WBh6024bhEDA_F7VnpSJTzTLq0g=69A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 17:58:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 8, 2015 at 1:24 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> If it's too much to ask, I'll just update b5.4* branches in
> https://github.com/meta-qt5/qtbase myself before applying this patch,
> but basically when I'm upgrading to newer version, I usually want to use
> git to just rebase the patches for newer revision (or completely new
> branch like now when upgrading from 5.4 to 5.5 and having up2data
> patches in qtbase git repository is very useful, when I'm done I just
> git format-patch them to refresh .patch files in meta-qt5.
>
> For new meta-qt5 patches it's simple, I can just use git am to add them
> in meta-qt5/qtbase, for refreshing patches I need to be more careful not
> to forget to do this, before I do next version/revision upgrade.

essentially, you have created forks of qt repos from upstream. Are you
also syncing them on regular bases ?
So we never rebase/refresh the patches but do incremental patches
unless you decide to squash them ?

I am fine with this workflow. I have something similar in mind for
other components.It will help us push component
patches upstream as well. I am doing something similar for toolchain
components on my own but in the end generating
patches for public consumption.

