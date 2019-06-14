Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 533377EABA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 23:46:14 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h21so4433820qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 16:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pfb/xJ+eky90iPqjTYpTCUcS9Htp4lWwd/CoJsjmGUU=;
	b=bpBW9RXm6Uvmd35zmaXTm8CSAQ6m9g0RElbTxLoNcc+GdTgNDNdlvqtrEbhGJfec9Y
	x9oJHpN+tld8jZPhd7sKYEdmQMsNcMiuI7z8c24NRgLV2ESff98TD8mn9C/R8mTz8c0P
	K1aATS17B4RyfPoE/WwSiaHwDXH11ueOjT1Af7fq7cKQ/PnT59Pl73cNHHPJXq7ZqLrF
	n8+ojXuNYirdS9alvk4EJ00EkpzEofxN/QoO69tkwW7YzjGyuJ/t1F6ty/RA7Jsbf0+R
	HOD331RBKVMZwYLHuxCh0xA0p1D3YyFA2E6Qtd0azmkbpIwIEFBWKQolXV9abyja/335
	+40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pfb/xJ+eky90iPqjTYpTCUcS9Htp4lWwd/CoJsjmGUU=;
	b=M/dTXfd+aCmA2XwTF6KzFdi2JbPvCPpZ9J0NuEBljnDYwDl46W6IewHz9sGG0WkQr2
	U89zN4MIHJUyRXsC9SCLf0SB1SfkSBQrf/7gyYSKkO6osJAxr9lQFPQNCDl1YfBsKCs9
	RyT33kYPZgCO37VCiZ3wg8rWTlWvby6FSPbdaannA9sOrcLECBJ/o8OFU5oc7w6SWbYU
	ynK0B5Mm/muCj5crY+tGY5W6gBG+73X8df4QnTS4OQPLZ7eHrJbvLazM7HCWbGSnVmhw
	JmNrGFD9BGfRgCr4JDRvB+aJh7ldAUVrVgykqqCcngUFlE3E27DQUdnx9dSnI6dQ6WsV
	hWng==
X-Gm-Message-State: APjAAAXNNc3lVzX26ZkOa1x0ZLb28Mx0IZWga/ekYs9i/pMt1lFKortm
	+y8o9+2Kk7+SMQB+LtzJ5bmkoAk9+qj6nrdCTXLVEA==
X-Google-Smtp-Source: APXvYqx1iVYpP1f6A6V2MRPoe9n6bRAHsmghMxkUJquq1fReyLeLmMoDvvk4jyqxp3SZRe4X+8+AT9wogzdPHvt+jeE=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr80535640qtp.88.1560555975074; 
	Fri, 14 Jun 2019 16:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <1559271137-240663-1-git-send-email-zhe.he@windriver.com>
	<20190531084447.GA18583@localhost>
	<CAMKF1spX4zGYv4D4WVSs9boWkP6LMVhTeNMhcJtx4Qc_ZdKAoQ@mail.gmail.com>
	<20190614232933.GA23784@localhost>
In-Reply-To: <20190614232933.GA23784@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 16:45:49 -0700
Message-ID: <CAMKF1squyZmYdpptg=1EZNc7haotMWX8MMNA3OpDqFqSpw2i9w@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Jun 2019 23:46:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 14, 2019 at 4:29 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Jun 14, 2019 at 12:25:11PM -0700, Khem Raj wrote:
> > On Fri, May 31, 2019 at 1:45 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Fri, May 31, 2019 at 10:52:17AM +0800, zhe.he@windriver.com wrote:
> > > > From: He Zhe <zhe.he@windriver.com>
> > > >
> > > > GCC9 introduce more stricter checks deprecated-copy and pessimizing-move, while
> > > > rocksdb uses -Werror and causes the following build error.
> > > >
> > > > db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]
> > > >
> > > > utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]
> > > >
> > > > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > > > ---
> > > >  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > > index 8d84619..bbd8e4f 100644
> > > > --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > > +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > > @@ -31,6 +31,9 @@ EXTRA_OECMAKE = "\
> > > >      -DWITH_TESTS=OFF \
> > > >      -DWITH_TOOLS=OFF \
> > > >  "
> > > > +do_compile_prepend() {
> > > > +    sed -i 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow -Wno-error=deprecated-copy -Wno-error=pessimizing-move")/' ${S}/CMakeLists.txt
> > > > +}
> > > >...
> > >
> > > It would be more elegant to add -DFAIL_ON_WARNINGS=OFF to EXTRA_OECMAKE
> > > instead.
> > >
> > > This is also correct in general, since the few packages using -Werror
> > > are frequently causing this kind of problem for distributions.
> > >
> >
> > we also have a patch for new 6.x version, I am inclined to take that,
> > so please check if this patch is still needed or not on that version
> >...
>
> The 6.0.2 patch adds a fix for this on top of 6.0.2:
>     This also includes a patch that fixes GCC9 compatibility, it's currently submitted
>     upstream but not yet accepted due to style issues.

yeah I think the patch is quite gcc specific, not upstream worthy IMO

>
>
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

