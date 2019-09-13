Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id D6C7B7E713
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:59:30 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id f16so1939886qkl.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P7KxosKBnz7xRwGqVjYwL3DBg6MfsqU9HqZDZaRxZ3o=;
	b=T6aNQOGqqESDLIgiUDJ6K+0RVgHMRXuRz7QQWSLk0s1qxlrUkd1M63W3LAJ0BtrliH
	Ft5ug3EfDCO+ObfsuFK6qA3LUyCjsR4dhr2kQjTmXzZVB5NhatWJDKhqxUXBkBgfdjwL
	rscUtdz5Trt5lfMShJJWMy5CYoJAgoR+37M8n9O6/jwY1YwIirS3W2POd/tqWKFotlqh
	RCV1EsIF/1wBaYYh4zJA3tz6Roc3tj6XUCfpeEgGtF08onMS4d+RT6jwjt8MqoimSlCm
	iqSTP4tUhp6W/kbyOcEszzhQ478vdKWiiwi445vzFUFXEK8g7EtHd1Z0yqcl5y2jzFQ1
	uoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P7KxosKBnz7xRwGqVjYwL3DBg6MfsqU9HqZDZaRxZ3o=;
	b=h+DypLE4TSwvueBojOgUnMKwed+bWHnTtyolpblhryUtf4XTXaul1/XCrtcsxfQHII
	c5173tjb5/3mfCQpoG+NKLM4gtES8jzD7bQZiYUmQpQ+9SluIIRBLhMWau7FljNyCLPl
	cm9ncEBGETCEU59cmfczyROTmEeOYwN9qe8QnfOt0cD3a2Rgzp1sa13cuofa/zRpTpez
	y5kW16nY2zxJjoreRlC/kjDNSVGJWg+Mll3u+BSzCQPweDMYXNXTZKI+v+qVgYMeRnpO
	1Xdc/tIwAfjphiqDVNij6qkNy6XJmXXwPd2TlaInwgqCnmQuJ/1VyaAzDB1yCPDtq+AM
	booA==
X-Gm-Message-State: APjAAAVmxEdvW2yT0rkVV3vZ/fc0Mn7av30zSgw8E2W1KgQVqV4rEgPu
	2aUzwnV6QxMp46fIpE2VCXZqDpIvSFSM7SFtNPk=
X-Google-Smtp-Source: APXvYqwzmNXi6ga5QIm8NuDi0tDwjEyTogtRMCtZ6ClzZu7ZFx2qYYuvaz5c57c4Tjaq1uI67z126Us+qfIE6Pei4bA=
X-Received: by 2002:a37:e40b:: with SMTP id y11mr46160668qkf.9.1568383171570; 
	Fri, 13 Sep 2019 06:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190913102650.2022-1-Martin.Jansa@gmail.com>
	<CA+chaQcx9Bu_ePY6kJNAmDaqReY4_rJMQ1Lf0qKb3DjvBBLWbQ@mail.gmail.com>
In-Reply-To: <CA+chaQcx9Bu_ePY6kJNAmDaqReY4_rJMQ1Lf0qKb3DjvBBLWbQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 06:59:05 -0700
Message-ID: <CAMKF1soXkZ=6YOrgiZCXZeeODJd4x7tdLvioAT1P+5G8CpFqSA@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Sep 2019 13:59:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 13, 2019 at 3:53 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Please ignore this one.
>
> Now I've noticed that it was like this before "clang: Let cmake figure out
> python version for native" so I'll have to find why it doesn't work for me
> instead of reverting your recent changes.
>

this change is fine, there is another problem especially when doing stage2 build
where it does not respect python settings from env so I was hoping
that it will help to
let it detect python from hosttools which it does but I think this
patch makes things better
I would certainly think lets keep it. I am also mulling to disable
stage2, it will mean that
we dont use LTO to build the compiler itself it might become a bit
slow to compile programs

can you send this as github pull please since CI is triggered on pulls there ?

> On Fri, Sep 13, 2019 at 12:26 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > * with /usr/bin/python -> python2.7 on the host, I was seeing:
> >   CMake Error at
> > work-shared/llvm-project-source-9.0.0-r0/git/lldb/cmake/modules/LLDBConfig.cmake:229
> > (message):
> >     Found incompatible Python interpreter (2.7) and Python libraries (3.7)
> >   Call Stack (most recent call first):
> >     work-shared/llvm-project-source-9.0.0-r0/git/lldb/CMakeLists.txt:20
> > (include)
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-devtools/clang/clang_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/
> > clang_git.bb
> > index 3906ef1..880307f 100644
> > --- a/recipes-devtools/clang/clang_git.bb
> > +++ b/recipes-devtools/clang/clang_git.bb
> > @@ -17,7 +17,7 @@ BUILD_RANLIB_class-nativesdk = "llvm-ranlib"
> >  BUILD_NM_class-nativesdk = "llvm-nm"
> >  LDFLAGS_append_class-nativesdk = " -fuse-ld=gold"
> >
> > -inherit cmake cmake-native python3-dir
> > +inherit cmake cmake-native python3-dir python3native
> >
> >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
> >
> > @@ -102,6 +102,7 @@ EXTRA_OECMAKE_append_class-native = "\
> >                    -DBOOTSTRAP_LLVM_ENABLE_LLD=ON \
> >                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
> >
> >  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}'
> > \
> > +                  -DPYTHON_EXECUTABLE='${PYTHON}' \
> >  "
> >  EXTRA_OECMAKE_append_class-nativesdk = "\
> >                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
> > --
> > 2.17.1
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

