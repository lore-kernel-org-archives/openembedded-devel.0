Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id DDFC079DCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 12:53:13 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f18-v6so12147015qkm.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=uVJ63l4ZFWUkM7iybXCutWzjt1NcBY5exe91e/phCyk=;
	b=vMilvXpTvhZ6YG5Mzk+KINXGVkddwk5S8sDenLBa2fDYgPvVRAzgWBAbgV7ME1IFxa
	8bFm4T7UpyexwSxBBsdpGYzVbaFtEJ7Evt3hZdyTaEQ7fSPUARtpIHULLJWMtrsOi0JC
	c01epK/S2fOEflxuYKZNtbQIkDCeD5PtApLY3ftA+bVFV9pOGZShx2QyWCWAGQbnBsYf
	4+J11opA7WvQv0Hij56wvIoPWbyJWrn8YyRydPN/o6cdSAlFl1EPeR0EaIwQu6MGdJ/n
	xIliwOz0wK4b877Bc2aA/gndpsKMG3+CPFN2zhWRjmjN8lcOVhFQ6uRZoI3l6EygpnuN
	irDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=uVJ63l4ZFWUkM7iybXCutWzjt1NcBY5exe91e/phCyk=;
	b=Qt+md3uyynqg/lw4pRxXVkxA/nzOhZnN5b+1Nszd4ofVsC5rJOrJes5/qkf9/XWzSG
	KOIMYCUFou25aHhWdekREpBzYtQwlHTsHsmCjHr3vFJApBZLYLjGEuAYNbyhNRfLuISP
	g8wjJvP5aH+qvSg3A6AuN1UwY89BLfIQv7cwjqEnGC1NpRo1rBkdqTLInEERepwzyOFl
	wRSc+osj5VKSdIP+FmtKg1X3zhx864erjGCYtDQuL7PgYYew8J/YdlZHyD7/oMkvlljB
	dA4B+S1MEqH47dsGfyI0eoxqq2GiN+4XkikVYA8wDr62cZ/nxz/M/aPHj3MH75DCWsI1
	behg==
X-Gm-Message-State: AGRZ1gLKBIzrLmuFGuQCwKzDG8bwDp9PH5zqi0C+GptjXXkME99l9MZJ
	I65ENnQtn3ePFtMwWVMzDD+80mqoPxhPzIpG1b0iF8QFK8s=
X-Google-Smtp-Source: AJdET5ddlLO+ifJvrFWz1cqlSMO3L2avRoMxveEg2+2Q6rp6/31SaD3yWNy+hGy87uZNzIq0ko9HmPkbF8isk3rKL1I=
X-Received: by 2002:a37:d408:: with SMTP id l8mr6223032qki.315.1541076793913; 
	Thu, 01 Nov 2018 05:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181031191737.24419-1-max+openembedded@blarg.de>
	<CAMKF1srH+=42D=taFWYPaOAy96ihWiERRFykXEOHdNtXqNyekQ@mail.gmail.com>
	<20181101065522.l7go4mzqij7kcwwm@swift.blarg.de>
In-Reply-To: <20181101065522.l7go4mzqij7kcwwm@swift.blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Nov 2018 05:52:47 -0700
Message-ID: <CAMKF1sqhXWUkVpw5coNY4qePxd6HJA8x0RcJ8g5+HUEsGcizTg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mpd: update to 0.21
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
X-List-Received-Date: Thu, 01 Nov 2018 12:53:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 11:55 PM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> On 2018/11/01 01:16, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Max
> >
> > thanks for the patch, however it will be good if this patch was detecting
> > a move and not add/delete of files, it is easy to review the patches
> > that way to just concentrate on what changes rather than full files
>
> I understand, but the lines changed are way beyond git's threshold,
> because the majority of lines in this recipe was PACKAGECONFIGs, and
> all of them had to be changed due to the Meson migration.  Do you have
> an idea how to tell git to do the right thing for you?
>


try adding

[diff]
        renames = copies

to ~/.gitconfig
> Max

