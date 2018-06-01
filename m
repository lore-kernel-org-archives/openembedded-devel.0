Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C289C74FA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:37:58 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id y20-v6so4495270qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 21:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rH8GtktabozjSF+s+VqobZO9kMa4u7y+7ntTW8i6ihE=;
	b=EP4Eyfvkw+W/SYLIWbs3h/E42ZYJtDHKjETFYRokw24oL6ioHYg/cnNcRqWHxnkukH
	XdzEW6YGwhkPs5ztpc+gGWmES+j7r3ag0ODXGqD4vGJn+KUP9iF41EzOTG8Wqw7Yy1uS
	cCSZeY/fX4hmuYegDkAx7Ud5wwzNTHrC7++UQzJlkgWUDgoNhP2CkpaV9U8S+WfAF0gr
	OSVzIWBq2gWA5oDBKDm6jEO68FOHPpln1xmOyGQ0WKUr0kmlGJMVvUtSQR9TRKEm5MZL
	EgHu/FWv56Q9YeM5wR2b3WEzrKExDjqb79Lt01AALYaMVIMX/3UJUPnmL5uWMs1kj1Kh
	3vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rH8GtktabozjSF+s+VqobZO9kMa4u7y+7ntTW8i6ihE=;
	b=Q1Rxn1vg/Rexw4Iy/Z8ah0ASz92kKZ+rSjRthfadKiP7d9pP5bWb7yXtt+hGEmZWCw
	YwVN5UvH38A8mPvIoEKXyvcCtG70UuM6ZyWMQNDCMWtReYLLmBsZC7pOQhHDh1lJ+55G
	h0DNzooJdVaAPTweNJCJAVDWfTEyL+xRZxXAEv8vKXCsHq0zXf9Fz10YIkc1H1OcgRuO
	8x7/LG9wpdLXSuNJw2nhJfHUHs+y8YUNXArTxFKBRAMKi1pgeGxBZJuAV1u1DzsxI4oy
	dsBQcin2YXvTLhEWMawR8BJDdQ7ThVxXt5EOzSeU0x5HyCLmPisRDe4AuTlu39sHu2oe
	S8tA==
X-Gm-Message-State: APt69E1lYKmbLOrMW1/eOkYWZh3RXcszpwvP0pTehOHkvHUTAAWqlgzl
	yk3YaXzWY2jb5klHctLeMEzn8roeoijLy/2Ytqk=
X-Google-Smtp-Source: ADUXVKIC/QmnPmlweXg3A6LZOvDBm21hr89tPI/Y68nh8OnOMkSaP4LtPuyXlh496rE+HPH9KY31e2ZYX5RlTKPnLo8=
X-Received: by 2002:ac8:4407:: with SMTP id
	j7-v6mr4025911qtn.117.1527827879200; 
	Thu, 31 May 2018 21:37:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Thu, 31 May 2018 21:37:28
	-0700 (PDT)
In-Reply-To: <1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
References: <20180510063718.16913-1-andrew@aj.id.au>
	<1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
	<CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
	<1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2018 21:37:28 -0700
Message-ID: <CAMKF1sr-k=TK-wyUtDJMUT8DK=EcS3A08jCJD-xjOD_Aw-MbQw@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Fri, 01 Jun 2018 04:37:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 31, 2018 at 7:36 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Khem,
>
> Thanks for testing.
>
> On Fri, 1 Jun 2018, at 02:18, Khem Raj wrote:
>> fails to build on qemumips
>>
>
> Do I have to support MIPS for the recipe to be acceptable? Is there some way we can limit the recipe to architectures for which the software is known to work?

Ideally we tend to support the core architectures and mips is one of
them, so unless there is a very basic
reason e.g. missing support etc. we tend to fix the problems, so I
would suggest to see if it can be fixed preferably
if not then we should cite the reason and probably we can add mips to
incompatible hosts but that is last resort
once a recipe goes in it becomes a maintenance work and I would like
to make it as light as possible.

