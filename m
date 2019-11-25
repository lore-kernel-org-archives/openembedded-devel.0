Return-Path: <mine260309@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 77EF77F2A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 03:41:32 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id q1so12829203ile.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 19:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uFgVmyFdH9WIOvGJRbMGuQU5Wq1iRTNDkj3bkux9D/c=;
	b=C1tsnNYnXe4X5Ibx3J2hetbrj0wyNu+8cxxuNjZMILaPdJKX5HjVcG3mr8l4lrTd4v
	0X7ws3U/RVTqesRLBWwq8YHbJLpber/8aaLMTZeGLSnYjMTzGwtp7ilux93txkDf4P6r
	bF2wR/4I6bqed79t0a1OHL96YFmPvUh3AnX0L+Dry9DdoevYf/J69YPvS3BJVo0zgWd6
	cydfZ6jAd/zb/FIUgRpgS87QjJuxVzKgVuB8uoyPa9A0Y8QsfcMaQFthIL+EHRAr2Zt3
	cB4iH76zb3L7TS0TRqsgm/TVdxhXIkPlMw5Z6bcJ7M/haKqqpqHU4PHERAOxKo7J3+1g
	8wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uFgVmyFdH9WIOvGJRbMGuQU5Wq1iRTNDkj3bkux9D/c=;
	b=lrg3lfUUE1DLJ6V7QUH4/Vn0GV6oR5UAbBHg8PjYNMiPJmKxFVTGVDzjASPmcrmW1g
	nMzS/3q4N7dLclaJcFi5kkeyml9OszcjvjOgwM80GJKHJYgkCoBSxbOM0fmWm0WYJtTK
	gSn1Rajvzh6bPMc/TUpmC/CsvUlhABv5DbjWY+4a+rc0HPUMSaetJNYZ4bG6ebIj6U0C
	CFT/UGcaq/m2/SMfXh9R1gO3G8ynJc4u5aQ4EquVo/yXPtS3UxIWQvo3vMwStIA/2zAI
	lnFjJ/zFh9X6Djt/GtWMsLN5Rt2iNH4wRrG1VXs01QiFNCnzPOjHZw2G4+E7hlCY2KIr
	dUPg==
X-Gm-Message-State: APjAAAVun8kXC532JYiBzUvB/pdJ0HpVFSLtjr9jmuMeNY5sdSrBEkKq
	ZfZOwlzAaX37st9+o+Utg65Mk3D01n/x6JlJ7Q4bPA==
X-Google-Smtp-Source: APXvYqxqbTduEZ11DCVI7ffZ9jKdV1KRzeFho7DZTUM06Detmc1qiI3dyf2tvhBIBwfXRbUqlRwWNvnSwQEgbHsuulA=
X-Received: by 2002:a92:af19:: with SMTP id n25mr32703303ili.138.1574653293513;
	Sun, 24 Nov 2019 19:41:33 -0800 (PST)
MIME-Version: 1.0
References: <1574315133-73046-1-git-send-email-mine260309@gmail.com>
	<20191125030831.GA16252@localhost>
In-Reply-To: <20191125030831.GA16252@localhost>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 25 Nov 2019 11:41:23 +0800
Message-ID: <CAARXrtkhU3UhmQ8kTv6w5TVfBLT0QxoZDK-0P0VqgQhguD=MxA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 25 Nov 2019 03:41:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 25, 2019 at 11:08 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Nov 21, 2019 at 01:45:33PM +0800, Lei YU wrote:
> > The googletest recipe was using 1.8.1 tag, and in the recipe it was
> > using the git revision instead of the tag release.
> >
> > Rename it to googletest_git.bb and use the 1.10.0 release revision to
> > get the latest release.
> >...
>
> When removing the version from the recipe name you have to set PV manually.

Fixed and sent v2 patch.
Thanks.

