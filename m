Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD9086C106
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 16:04:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x4so2793285qtq.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bsKRh9yP5CCQbQ2JxXrilvWGA2NqE64E0L7deE9RUA8=;
	b=IUCBBTYpjfvj2y3yB8sRg/p4Zc+E+8TM25c5zT/Ah7YZaJRq0C6F32+WVhsPpiucAC
	PjgBVqUTDFlERAVZ30rEu0dF42r9tJl4kvjsBpfGq3UfMNmR6xtUprFveOS0fqa8j96X
	Tp9U/TGD2+P+4jNXBkqSCjun0IdRbOGgftHXqlBl041z7akPgWSNzkHFD6SgqROQ6Nfx
	WGoJ3FVuNLonLxCpA10ds+2sxPOCoFgKscXNURQAKvzb2HpLaeK81pEUKnyQzwUKGsoI
	KXXUSgmNZfgMNcCt8ErhJmRg+4UgE0FVQkpVt4aWBAiWL5PKmz3E8D2nVN9L1Xdf7k71
	0G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bsKRh9yP5CCQbQ2JxXrilvWGA2NqE64E0L7deE9RUA8=;
	b=Zf7+6CpquHHWOVKl+qb32oUWjxnVjdTWGnqtKgNepR5fMgPzut/F2rk5bcQ3Zc0ELb
	EkhPcj0eded0mllfmysttrLohqUr0Xp3u1iqQz9j0i0qdrGcQTNz+LuFmeQITXxKQAU9
	K2aDzCwLFV5datSvHFF9jG8pHSLDSe2oxYdwZ269WNY+eisFuUNbJg9PRjCxokXtFZXU
	CzCemN1racLeZq3WBST6uw44wLLmcHEeNpbq9e8jVYaiD93zX0dkIP7ENFHoT2Lg/EUu
	RqZAtKULUtpRteJoZwR0KCiMAD0M7CJ4h4HYNNvpuFGF2IvPRu+iyoaIjP8aR4pv7lPn
	Ainw==
X-Gm-Message-State: APjAAAUU3Nqx871IfmwcRg9Yz3tP392ERMvJqwlErZFqyGDBXdxqvJwB
	wEThrc47TRPBrOdIyqjlBchjKPDWp/XmyvuKcOQ=
X-Google-Smtp-Source: APXvYqz2nBeW7cC7MJY6qWYdFKxqZmZ2GschrblPCBTbW8sDSSRU/0kLXDHNKiyuGur3prqHVuB1gplUiUkNjVHAsEQ=
X-Received: by 2002:ac8:7445:: with SMTP id h5mr3895781qtr.53.1568390649435;
	Fri, 13 Sep 2019 09:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190913102650.2022-1-Martin.Jansa@gmail.com>
	<CA+chaQcx9Bu_ePY6kJNAmDaqReY4_rJMQ1Lf0qKb3DjvBBLWbQ@mail.gmail.com>
	<CAMKF1soXkZ=6YOrgiZCXZeeODJd4x7tdLvioAT1P+5G8CpFqSA@mail.gmail.com>
	<CA+chaQfjLx59L5TxeiAM4RP4qMwUWYhdT4uySiLyQLN5O-Z3gg@mail.gmail.com>
In-Reply-To: <CA+chaQfjLx59L5TxeiAM4RP4qMwUWYhdT4uySiLyQLN5O-Z3gg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 09:03:43 -0700
Message-ID: <CAMKF1sq8Up_9RxsmnNof8hbSvgMt_-Q8nQW7KO+XoYUW3CKGpg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 13 Sep 2019 16:04:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 13, 2019 at 7:49 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> OK, will do, README should be updated as well as it says to send individual patches to ML :).

right. Send another patch to update that

>
> On Fri, Sep 13, 2019 at 3:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Sep 13, 2019 at 3:53 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > Please ignore this one.
>> >
>> > Now I've noticed that it was like this before "clang: Let cmake figure out
>> > python version for native" so I'll have to find why it doesn't work for me
>> > instead of reverting your recent changes.
>> >
>>
>> this change is fine, there is another problem especially when doing stage2 build
>> where it does not respect python settings from env so I was hoping
>> that it will help to
>> let it detect python from hosttools which it does but I think this
>> patch makes things better
>> I would certainly think lets keep it. I am also mulling to disable
>> stage2, it will mean that
>> we dont use LTO to build the compiler itself it might become a bit
>> slow to compile programs
>>
>> can you send this as github pull please since CI is triggered on pulls there ?
>>
>> > On Fri, Sep 13, 2019 at 12:26 PM Martin Jansa <martin.jansa@gmail.com>
>> > wrote:
>> >
>> > > * with /usr/bin/python -> python2.7 on the host, I was seeing:
>> > >   CMake Error at
>> > > work-shared/llvm-project-source-9.0.0-r0/git/lldb/cmake/modules/LLDBConfig.cmake:229
>> > > (message):
>> > >     Found incompatible Python interpreter (2.7) and Python libraries (3.7)
>> > >   Call Stack (most recent call first):
>> > >     work-shared/llvm-project-source-9.0.0-r0/git/lldb/CMakeLists.txt:20
>> > > (include)
>> > >
>> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > > ---
>> > >  recipes-devtools/clang/clang_git.bb | 3 ++-
>> > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/
>> > > clang_git.bb
>> > > index 3906ef1..880307f 100644
>> > > --- a/recipes-devtools/clang/clang_git.bb
>> > > +++ b/recipes-devtools/clang/clang_git.bb
>> > > @@ -17,7 +17,7 @@ BUILD_RANLIB_class-nativesdk = "llvm-ranlib"
>> > >  BUILD_NM_class-nativesdk = "llvm-nm"
>> > >  LDFLAGS_append_class-nativesdk = " -fuse-ld=gold"
>> > >
>> > > -inherit cmake cmake-native python3-dir
>> > > +inherit cmake cmake-native python3-dir python3native
>> > >
>> > >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
>> > >
>> > > @@ -102,6 +102,7 @@ EXTRA_OECMAKE_append_class-native = "\
>> > >                    -DBOOTSTRAP_LLVM_ENABLE_LLD=ON \
>> > >                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
>> > >
>> > >  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}'
>> > > \
>> > > +                  -DPYTHON_EXECUTABLE='${PYTHON}' \
>> > >  "
>> > >  EXTRA_OECMAKE_append_class-nativesdk = "\
>> > >                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
>> > > --
>> > > 2.17.1
>> > >
>> > >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

