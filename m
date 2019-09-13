Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 331507EC9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:49:56 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id o9so27345868edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=abM4hdxE7DMDIbc0u2bREdA3Bwtgn5QOoY6q8RllLic=;
	b=ik2uxEALym7xR+CtrZHYcRG5QnJD0PVbfzuV6ufStzSiLryGe7bIIK3orcTeuF/2f1
	n7ClfzlzMFiCUM8YgqLiJFu7cX1uOSc8g0vVsrOERw6KXYMueOZYoU2KAlH7FBkEGDEu
	sl8S3kU2ccpoQ7V/73lx8btOxQRVJVyhDWc/uNBL2RJ7cF5bBv9K4/+SlrMwA1s3fj6+
	Q1c1SlMcegGgwoffxOwx6EXqNlelabDxJ97PRxxDVyvuYU8CZZA/5nY+IhxCZiIo58V8
	yGrp1/Bd/c/JFrjtnj1bh2CJoWrVLqsvmyfRhle0g/i71w5rLYaFyoCKhcjEgdpvDe+V
	xkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=abM4hdxE7DMDIbc0u2bREdA3Bwtgn5QOoY6q8RllLic=;
	b=cmldQ+hNlIxpoF+n2LOvn0oYo3tPYZFe3q4iE1kSYpVqdImu9PLsom8k7tzWCB+zhp
	85ZqlTVOW+GP4Bear/8jmwbDdHl2gB4+znnCLwILdyfGEMdK6r6I8tojASBT7p5QQs7A
	+eVf5l4Fuc5IBgIpWX8ScvXuJ7QvPjoecVeE7BVxt91qgCiXX7H7jGvPr9h48KIWLK2z
	OlnZooMQk9W4+srdSYq12CBI2M9cN7SRBh8Rk0FnnrXNyOq1Av/mJgvJ4k2nJPNJDwS3
	Dp4iBA3qlNZHIGtFsGvNKjeSYDijUHYEnhTrPO7GfKXdXUIJkqZjDGXoKjDsIIKOAnfS
	EC7w==
X-Gm-Message-State: APjAAAUo1KCnzjsLE6MRKme+DLU6bseQ8S/hYOu2QUl/FbhESuzkf8vx
	o69pr9jz2MtXUmcKD2Qot1DbnBwLcPukpJOWiam4OvbB
X-Google-Smtp-Source: APXvYqwBQbIAn2gyw9hWqjacDKeUb3Bl0VxXMKmbrf9LITCPty8uwxz6Dl/AzfOZI8Gz/rAZVkFeas80xSOxi7Gq0eQ=
X-Received: by 2002:a17:906:c401:: with SMTP id
	u1mr40284115ejz.254.1568386197570; 
	Fri, 13 Sep 2019 07:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190913102650.2022-1-Martin.Jansa@gmail.com>
	<CA+chaQcx9Bu_ePY6kJNAmDaqReY4_rJMQ1Lf0qKb3DjvBBLWbQ@mail.gmail.com>
	<CAMKF1soXkZ=6YOrgiZCXZeeODJd4x7tdLvioAT1P+5G8CpFqSA@mail.gmail.com>
In-Reply-To: <CAMKF1soXkZ=6YOrgiZCXZeeODJd4x7tdLvioAT1P+5G8CpFqSA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Sep 2019 16:49:45 +0200
Message-ID: <CA+chaQfjLx59L5TxeiAM4RP4qMwUWYhdT4uySiLyQLN5O-Z3gg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang][PATCH] clang: make sure python3 is used for native builds
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
X-List-Received-Date: Fri, 13 Sep 2019 14:49:57 -0000
Content-Type: text/plain; charset="UTF-8"

OK, will do, README should be updated as well as it says to send individual
patches to ML :).

On Fri, Sep 13, 2019 at 3:59 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Sep 13, 2019 at 3:53 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Please ignore this one.
> >
> > Now I've noticed that it was like this before "clang: Let cmake figure
> out
> > python version for native" so I'll have to find why it doesn't work for
> me
> > instead of reverting your recent changes.
> >
>
> this change is fine, there is another problem especially when doing stage2
> build
> where it does not respect python settings from env so I was hoping
> that it will help to
> let it detect python from hosttools which it does but I think this
> patch makes things better
> I would certainly think lets keep it. I am also mulling to disable
> stage2, it will mean that
> we dont use LTO to build the compiler itself it might become a bit
> slow to compile programs
>
> can you send this as github pull please since CI is triggered on pulls
> there ?
>
> > On Fri, Sep 13, 2019 at 12:26 PM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > * with /usr/bin/python -> python2.7 on the host, I was seeing:
> > >   CMake Error at
> > >
> work-shared/llvm-project-source-9.0.0-r0/git/lldb/cmake/modules/LLDBConfig.cmake:229
> > > (message):
> > >     Found incompatible Python interpreter (2.7) and Python libraries
> (3.7)
> > >   Call Stack (most recent call first):
> > >     work-shared/llvm-project-source-9.0.0-r0/git/lldb/CMakeLists.txt:20
> > > (include)
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  recipes-devtools/clang/clang_git.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-devtools/clang/clang_git.bb
> b/recipes-devtools/clang/
> > > clang_git.bb
> > > index 3906ef1..880307f 100644
> > > --- a/recipes-devtools/clang/clang_git.bb
> > > +++ b/recipes-devtools/clang/clang_git.bb
> > > @@ -17,7 +17,7 @@ BUILD_RANLIB_class-nativesdk = "llvm-ranlib"
> > >  BUILD_NM_class-nativesdk = "llvm-nm"
> > >  LDFLAGS_append_class-nativesdk = " -fuse-ld=gold"
> > >
> > > -inherit cmake cmake-native python3-dir
> > > +inherit cmake cmake-native python3-dir python3native
> > >
> > >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
> > >
> > > @@ -102,6 +102,7 @@ EXTRA_OECMAKE_append_class-native = "\
> > >                    -DBOOTSTRAP_LLVM_ENABLE_LLD=ON \
> > >                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
> > >
> > >
> -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}'
> > > \
> > > +                  -DPYTHON_EXECUTABLE='${PYTHON}' \
> > >  "
> > >  EXTRA_OECMAKE_append_class-nativesdk = "\
> > >                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
> > > --
> > > 2.17.1
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

