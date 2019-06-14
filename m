Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4217D7EB0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 23:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45QcJb3jDbz1n;
	Sat, 15 Jun 2019 01:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560554976;
	bh=i8gVRaPDclsnvhKF41ZGgHEMQsq14fJnCF8HzXHr8dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=el/dxlTczPrK0qOy6mEJF/lS0RcH3FBe4CGRXHUdxz69GUq6RWlQ6MvUOo1ARnAIh
	r2/uRcncPu/RTqkccpWtGfDPOreNKvkZpqRsfU1YwhaRUFf+dTdeJjCC2cKHdJns1Q
	/GonKEDBXDm2+5mEjWaDXwkgXVN+50p4mnBAuESAd+teNPwBbM584zIDwEbViuqnUi
	0QlnZ26thBWK9kunSfBPCWAnayqGRZ4n7W9BA0iqQlWYEsSme77iJ5IuA87Ds35g2P
	OLSdOSSELCfo4xda4SLRV6VSODqMFFLvKhioviovadKV5a5mtIQNnKhTdwhl6WNO4z
	56+5w/zF9kEt/g4NWbRAIgG8dKcaJ1X82nJgN9/C5JfKaCrXQ22kOo3ycDws1Sngdr
	tqngzQ6E/UwyZa6g2Q1vMqurBk4ZnTol+KKxQW1EduGSMVNRhYpbw6yN2kpgXIGB/T
	/HjfbgPcJj/9SQseyRJN+Aeo1N+EcfUTSEKu1Ru54f8DsrKjPB+IYzBleFnzUUYRsq
	izEk5rYkEU8jsquyvXOBGJBUdiGO+K9WrXg8k9Mzp2R0lJ8IMiXAmlgyugiQ/RlyM5
	nyV8Xz3/mzWf77nyO42FkELqjLohlb+4mRyiKLSw3LtzJv9kiearqa6w8juCQaW4nb
	3Su4+AHOTHBcmj7q2Iy0s9Zg=
Date: Sat, 15 Jun 2019 02:29:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190614232933.GA23784@localhost>
References: <1559271137-240663-1-git-send-email-zhe.he@windriver.com>
	<20190531084447.GA18583@localhost>
	<CAMKF1spX4zGYv4D4WVSs9boWkP6LMVhTeNMhcJtx4Qc_ZdKAoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spX4zGYv4D4WVSs9boWkP6LMVhTeNMhcJtx4Qc_ZdKAoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Fri, 14 Jun 2019 23:29:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 14, 2019 at 12:25:11PM -0700, Khem Raj wrote:
> On Fri, May 31, 2019 at 1:45 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Fri, May 31, 2019 at 10:52:17AM +0800, zhe.he@windriver.com wrote:
> > > From: He Zhe <zhe.he@windriver.com>
> > >
> > > GCC9 introduce more stricter checks deprecated-copy and pessimizing-move, while
> > > rocksdb uses -Werror and causes the following build error.
> > >
> > > db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]
> > >
> > > utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]
> > >
> > > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > > ---
> > >  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > index 8d84619..bbd8e4f 100644
> > > --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> > > @@ -31,6 +31,9 @@ EXTRA_OECMAKE = "\
> > >      -DWITH_TESTS=OFF \
> > >      -DWITH_TOOLS=OFF \
> > >  "
> > > +do_compile_prepend() {
> > > +    sed -i 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow -Wno-error=deprecated-copy -Wno-error=pessimizing-move")/' ${S}/CMakeLists.txt
> > > +}
> > >...
> >
> > It would be more elegant to add -DFAIL_ON_WARNINGS=OFF to EXTRA_OECMAKE
> > instead.
> >
> > This is also correct in general, since the few packages using -Werror
> > are frequently causing this kind of problem for distributions.
> >
> 
> we also have a patch for new 6.x version, I am inclined to take that,
> so please check if this patch is still needed or not on that version
>...

The 6.0.2 patch adds a fix for this on top of 6.0.2:
    This also includes a patch that fixes GCC9 compatibility, it's currently submitted
    upstream but not yet accepted due to style issues.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


