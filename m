Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3A660572
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:32:50 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id l14so1981696qvu.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gC/6o2/3McElz4K07wNd7NVEcgGjWyCVKGGGWy/jgNM=;
	b=eb3v30UCweQ0pg42iCgIrjioogTLtelpqwbZntdxYR0pEGi0QnceeZMkvuN5raat/M
	b+fBMkzs/MJ9wjVcbxhvxSNnPP/1vtpGWwzK4J34VD/z5n/1cIT+/4L6AUcfZ2Lxz+xp
	91krJCdY1TpY8PPC/gYBg5EotUISauaWvtaivFOyGbswHQ251cfnStp0phFjwkhFQT/2
	T9ITiOl7ZBdy0jMMH1804THIAf6LzAnWEsZWkiurOnzmnLJRXbA36B662L7KihlpxCH4
	rMylYDJDuaIDcqgIJSbI0DRYmvtXs+WSCOMYDQV25PW/JNJVl9unm3Fo0m2rfjUptXqW
	YJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gC/6o2/3McElz4K07wNd7NVEcgGjWyCVKGGGWy/jgNM=;
	b=W6gJYDwiUfpLZTWvXBbaoH9mCTRgYF6UwE5SIhRr3vla2YStJrXHxNeuxHapB+3aps
	lI6VJRYF71llGpQsRABF0sZfPv9axktKLtpm4SsXy+Ls5TWulLLlK9gHiu8Ici+oKOKm
	VW2Sv5P25aG51RctUBXjy9lBnYjfh00zjdmUmIfHfQyoKqkK4iVoEpzPDMwuQJbJOvvm
	ieLbfvxdBwhoaNlHtkiaq6k8jfY3bmt+/XHiu7s74+yuA909BnQlcMMpnFZHlLNyDB8+
	UdYv+O2ZqMy2TOmZaJFLSmdRigQFQSTtMGcaq3YmkpoSYVxQIaiUX4ump/LvuZ5EEGR9
	Nslw==
X-Gm-Message-State: APjAAAXG+awhAtZN+vSB7L2H0/pRjuPiJawI93YDBy1NBSZXwrkeZ0XL
	Pu5ibZoOpgN23A+rwYue4jmTZvA+DFWWDgy95f4=
X-Google-Smtp-Source: APXvYqzo5kAPC6rfOXkD1/uZ+4ojBYwyAmZFSQGFqzR4jh7jSui9pNBr3pm6zlOOYzA2ODJ9K82xMgZ/W5rH5erRGLQ=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr107823qvo.55.1580945570897;
	Wed, 05 Feb 2020 15:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20200205203053.6742-1-twoerner@gmail.com>
	<20200205210707.c4eqrvbyl7tl3knt@jama>
	<20200205230236.GA18868@linux-uys3>
In-Reply-To: <20200205230236.GA18868@linux-uys3>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Feb 2020 15:32:24 -0800
Message-ID: <CAMKF1srgMFjgmLkmo6NLW=xdvK-0ARqowk9z6bBRjWqmkgViSg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mpv: 0.26.0 -> 0.32.0
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
X-List-Received-Date: Wed, 05 Feb 2020 23:32:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 3:02 PM Trevor Woerner <twoerner@gmail.com> wrote:
>
> On Wed 2020-02-05 @ 10:07:07 PM, Martin Jansa wrote:
> > Thanks,
> >
> > would you mind undoing:
> > http://git.openembedded.org/meta-openembedded/commit/?id=0c182e58775966699c303c1e2561c273197bf445
> > in the same commit?
>
> Sure, no problem.
> v2 on the way
>
> > Also was this sent with -M?
>
> haha, I know exactly what you mean! I did the format-patch twice just to
> convince myself I had used the -M (and I had, twice). I don't understand why
> there's no similarity :-(

also please take a look at
https://errors.yoctoproject.org/Errors/Details/390294/

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

