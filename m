Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7C77EAEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 19:25:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x47so3769049qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eGGrPm54lHOYba90d5c4olnC4IzO+ulck9DnUZWCVQA=;
	b=Y9b+dmJ6XQbXU5tWXr21+X6/vKqjYbzdAsNDKa/kOPNmtpcIu23jabryctQNovXv5B
	+b1V9f2FV29jsjFzIt0izJK9eeBOJFsWdKYhCyDpd1Eyl/J2YH42oDUj0OKv1waPngax
	EybinF0J5jVF6kBKTDvJXbhc+ixQRnsAOncNkEbAWhz7mxAcC431aDISxuQGPmamWGFq
	HWJzM5IqrgI1khwRPsH5AFlW0bnjIcDaML+qqqiGCzfE68DbbqWDD8I/vsO4iXKYYIa2
	H7lEVfNKrW84816ITCWd31w3MUa41oTn9T7bQNT4uRaXyowD+r3wSmJJqi0lHhfsxUiC
	ZGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eGGrPm54lHOYba90d5c4olnC4IzO+ulck9DnUZWCVQA=;
	b=r8Ay2cM5mM9ZtIs5SHARUkxUf9KbnKwu5+EhrhyFXaGPl4kGYGg901N4SO0vIPfZES
	0d1jpX0NlEzjMAH+yne4dU2ia+Nu42txUog8QYliF53opgbHLToK9bZB/aA/4+w7P9Mx
	iVkl+U7r5sWg4VKdmjKFyq78xlHI1/PziXs722AdJOoLkLYzz/cikK4haoZTZZ2Tr4Ng
	t0mvTnGkPvHSMGqLzuT3gfv36fsRtcgDpLpJ+bLS21QBpFFbzNXp5kS1Mj+jNCLcx+/B
	zuWv71Gouw1vc39vejV1WhC5muT7rdwxn23wqbDyqX5dKMYCoso09IAESJQuqGVXxOJL
	dSCw==
X-Gm-Message-State: APjAAAWwdUFdp5h6atbHhjMUHrq5NaKF0D08xy1ka9yDboUz5OntnRXR
	TIlcn2RuHlztMWBGHKr0ta/AXFd7jyxeyiXw5NU=
X-Google-Smtp-Source: APXvYqzpWJn0nao614+gfLUrV/aIfcECWklxI+fE+fRzmvuXzBhB4Ko+WYlx3y8JR5xfA+KQvzGh+VZyWNCVSL5a8No=
X-Received: by 2002:aed:3f1d:: with SMTP id p29mr82239668qtf.378.1560540337008;
	Fri, 14 Jun 2019 12:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <1559271137-240663-1-git-send-email-zhe.he@windriver.com>
	<20190531084447.GA18583@localhost>
In-Reply-To: <20190531084447.GA18583@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 12:25:11 -0700
Message-ID: <CAMKF1spX4zGYv4D4WVSs9boWkP6LMVhTeNMhcJtx4Qc_ZdKAoQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rocksdb: Fix build failure due to GCC9 deprecated-copy pessimizing-move
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
X-List-Received-Date: Fri, 14 Jun 2019 19:25:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 1:45 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, May 31, 2019 at 10:52:17AM +0800, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > GCC9 introduce more stricter checks deprecated-copy and pessimizing-move, while
> > rocksdb uses -Werror and causes the following build error.
> >
> > db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]
> >
> > utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> >  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > index 8d84619..bbd8e4f 100644
> > --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > @@ -31,6 +31,9 @@ EXTRA_OECMAKE = "\
> >      -DWITH_TESTS=OFF \
> >      -DWITH_TOOLS=OFF \
> >  "
> > +do_compile_prepend() {
> > +    sed -i 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow -Wno-error=deprecated-copy -Wno-error=pessimizing-move")/' ${S}/CMakeLists.txt
> > +}
> >...
>
> It would be more elegant to add -DFAIL_ON_WARNINGS=OFF to EXTRA_OECMAKE
> instead.
>
> This is also correct in general, since the few packages using -Werror
> are frequently causing this kind of problem for distributions.
>

we also have a patch for new 6.x version, I am inclined to take that,
so please check if this patch is still needed or not on that version
secondly I see that deprecate-copy is gcc specific option, so mark it
with toolchain-gcc override so if needed

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

