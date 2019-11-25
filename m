Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id DA3067FC52
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 05:03:52 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id n4so5176090qvq.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 21:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZL50BjTYwl0VF6eWDXy86EJrzUyrTHZOwdnvK3JMQCU=;
	b=R9IjyNOv34R5eqAFtpsylQwscIfxS2LKSn3ULQEJPBjVBrPphaMTWy+KCJJ6bGmhDJ
	rQveO1WYGa6tsau8vzrywoEV66ZUkkBbmw2/WLD/++wWI2PZQsvCj7ragps9TFvbRIEy
	feP/6N9npnD4nFBew2oaJcRLVWYAOIOkP3vP1iqdi/mRkoLXoFO1IJNqDBHO2EoZOlfU
	f1NI2x0OkoAztTeipGXaQcSmXZlJmvWC9UyoL65uBcvcXA/7ORL35YdB5lRdFrKBccAX
	Au4LoO9f+EPuqihzpZREM6uTzE00z7l4FEWXya9FKa9KkUU37yGVDVv2/5T+Cgr9oORe
	DpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZL50BjTYwl0VF6eWDXy86EJrzUyrTHZOwdnvK3JMQCU=;
	b=Ig+RdeD9C9t9oj52vjD98qRghH6mCKcyS3A+rObaP8zxPJsrZNfQS4JDmRh8DFVZV+
	kuE8yLQBSLHDAA3qh0rdiY7J8E9ZHi3IbMqQflVYrf4u6iT0hLHQI//gZeYB24FvLiA4
	Wj+xZ96qbZ9IottW76s0UKcEBEeP/02S1F+N2ChxEARfsY8iQWLwXyHD5QzGLdDr2jYw
	qOQVPGAemiVJAjSiDlcRK1fZc0LfWyLq8ON4TB+L+fMTecDqYNR7rDORqkMsmMJUpBg9
	sEheRQrftsNTzr3xxNv1YoETbtNdlu/LPi2AmxmeOEOAa4SOJWHF4jA7HOdvNZG9pByA
	JMPg==
X-Gm-Message-State: APjAAAWVMq0uJMcyJbuO3dF+4jGBH/M8TIUrH3ijUf2p0eQY7J56mXoQ
	lWXH4AwJnIKi+/dqZpoO/3GEqwvsJWZtZm/VMk8=
X-Google-Smtp-Source: APXvYqxK0A4Nk2IkFTte6cz/K4SgvzCk4FOekhQJ6gCIOWSt1BsPzAY8vnX0m5zczZg4o3E5KUJlUe8T/16O7oYThgc=
X-Received: by 2002:ad4:4dce:: with SMTP id
	cw14mr25793762qvb.185.1574658233666; 
	Sun, 24 Nov 2019 21:03:53 -0800 (PST)
MIME-Version: 1.0
References: <1574315133-73046-1-git-send-email-mine260309@gmail.com>
	<20191125030831.GA16252@localhost>
	<CAARXrtkhU3UhmQ8kTv6w5TVfBLT0QxoZDK-0P0VqgQhguD=MxA@mail.gmail.com>
In-Reply-To: <CAARXrtkhU3UhmQ8kTv6w5TVfBLT0QxoZDK-0P0VqgQhguD=MxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Nov 2019 21:03:27 -0800
Message-ID: <CAMKF1so86g6hCzATiFO5UcWFoRTxO8WVg-tQeimAj2YXgcRqZg@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] googletest: move to release 1.10.0
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
X-List-Received-Date: Mon, 25 Nov 2019 05:03:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 24, 2019 at 7:41 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Mon, Nov 25, 2019 at 11:08 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Nov 21, 2019 at 01:45:33PM +0800, Lei YU wrote:
> > > The googletest recipe was using 1.8.1 tag, and in the recipe it was
> > > using the git revision instead of the tag release.
> > >
> > > Rename it to googletest_git.bb and use the 1.10.0 release revision to
> > > get the latest release.
> > >...
> >
> > When removing the version from the recipe name you have to set PV manually.
>
> Fixed and sent v2 patch.

Thanks, I have rebased this one on top of v1, as v1 was already merged.

> Thanks.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

