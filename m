Return-Path: <twoerner@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 447C26079F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 19:55:40 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v15-v6so3062647wrm.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zs5saMbcoz5qOiewafL/T3ccD6JAWid0GPr7RUcxRm4=;
	b=KH4pjIocbzYLQSRqte+pOF+MbirThTJzpOqWoKfC5rpfBHk6gzBRZjArhf+PBBd6xe
	iyiz0PqcaXx4TZIAOzzRslqDfj9go3A4grOmNi4SOqVGdGeogJc1HfhZBU4FwOgE/oLF
	uHoZAd1JKCYEobZB5A0PUgnfjTePsHxwEVBbmkpuXl6Fygk269iv3xyyCT4qNK+bTO46
	XqbvckR2VCfo5/tpTkZHr82MiAdLsWy0lhgbHzaX2cVHGt6LmT+U84COy3qA7LZnMbsI
	b+VfrLBSelsZGDIlfk9idm7b55Q6LH6BFAnEPR1swecl5dwybh4mG6Q0/ez0iT+ECNLo
	dCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zs5saMbcoz5qOiewafL/T3ccD6JAWid0GPr7RUcxRm4=;
	b=qu9or/iH8xMdcCz9Op/+Iy7ZSmQliQgyhMA7Hq/Yd9UeyzQuSxzjs8Pk27NvXSoxS5
	gYDiixMgrEkmKot+l+Ze35y13SsZlQkUIl+i5orMGwcjI+ue+KD0t18bqv+gst8rstpB
	JAQYvZzEUKBgZKkUPaWCnnvfrI594NPI2LI0Zw/hct9VjG8Frqc2f8gYxXbvKkNYQ4kC
	O7RZpOcWzUPs0knDgD862BfmpIUtW/Yp8/CdqL2GzWNK1LQ7zxBbS78nGUfUBu4ecN6v
	xp89/latnMnoO1HU7AzgGbTU58KBVdVdXTVpnxd8CYbqQzpwGZP1a/Mlp6KJe45N+C9P
	bAzQ==
X-Gm-Message-State: ALKqPweLd+2WX+l/HfjtW8SZhwZeHgJgXqDMUR1fYYBFgSUUCpACxCeQ
	DQQFUzyKKQjVvxaab0g6ekPXxPjhYozwgcOtas8=
X-Google-Smtp-Source: AB8JxZrGvBLa9uCK1dsmJBpvx/0r9qWlkB5gEVQ8OcVdPJbOrNY+LKI39C73FKB1CUj+zUHNIJyju9YwzHirj8NLdlU=
X-Received: by 2002:a19:d153:: with SMTP id
	i80-v6mr15293393lfg.16.1526500541355; 
	Wed, 16 May 2018 12:55:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:17a1:0:0:0:0:0 with HTTP; Wed, 16 May 2018 12:55:40
	-0700 (PDT)
In-Reply-To: <8f704304-6617-740c-6caa-6758f6b70241@gmail.com>
References: <20180516171948.18406-1-twoerner@gmail.com>
	<8f704304-6617-740c-6caa-6758f6b70241@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 16 May 2018 15:55:40 -0400
Message-ID: <CAHUNapQZt=WHBRuxF1SZCP51e83BKAjCJz_G8_bTvtELonSzHw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] grpc: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 19:55:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 3:37 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 05/16/2018 10:19 AM, Trevor Woerner wrote:
> > Since we know that github archives which are automatically generated
> have a
> > tendency to change their checksums[1], switch to using a git clone.
> >
> > [1] http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-September/114916.html
>
> This recipe is in the middle of moving to meta-networking ie in
> master-next not yet merged to master.
>
> either the meta-networking maintainer will integrate or maybe a rebase
> on master-next would be helpful??
>

Sure, I can send a v2 rebased on master-next.

Now that you've started a build test of master, maybe the rest of this
janitorial cleanup should be done relative to master-next?


>
> thanks for the patch.
>

no problem! :-D

