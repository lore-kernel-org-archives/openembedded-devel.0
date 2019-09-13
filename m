Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 159AB6C226
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 10:53:07 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f2so20299746edw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=JruQQqj4RcrtD+qmNVNSDLKFua4kqOPxj9bZ7Vi1oAo=;
	b=qazemmlS9l4EL2j3WlEu9pdKTYXKxLyt6zC+em+EYDbaTfebJzdF0+Wl7NctFA1SIp
	0WOmE1zu4W9kW3HNFM9PcxtafwCqffLRDH3UPiY1ls+CuvHl2dJAsjBkvqUjhfaNAYbQ
	BHgljSpb1PTo5evXGUVJR93nBG9aK62MGP55wAlvGBxtGjJNANRTNHxkzxCzZ/+mjb3S
	MeBmuGV6nPEDEcqzl/XxPkEH58nqgZKt4cHir7iyir13XI1tHUt0f7E7koroVF1cGCgN
	zOLRKnYWdphqcIvSF9n5FlgHUeKAX7n10lRD0TLyGX98xyO+80p0SbVsAC9Ymu+bvSs4
	2Wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=JruQQqj4RcrtD+qmNVNSDLKFua4kqOPxj9bZ7Vi1oAo=;
	b=ByznsEmz79hfnUUjoAQwubmdRcJjLV3wyjKZwhgeMGZB1y/pMizf+AhnJL7aNsyhwQ
	XJYg9hq17MmlqunhQYsr4TAnIRR/g0zarMNFRgxmqJDg6oFvLbr5bZhfk0KhJQfbNa6c
	+Q56MzqyRI6SJteQgFsoEUQrpjddyriG2FrOuK73GrrfXcqAn+5dHjEK7YqF7ql4Hvcf
	yAduWlmJw/kPfh0cmSQFgbcU88EtrBhzsU5hk/8qjxYicfZY3fOMSUGkk5uNg1YyoayN
	62V84ZWPaRj17ti6C79QjxErb4ZIQ+gp35Kg/oSpWWGHZCj22oXkmvBcZctXbvbmCNkI
	CVZg==
X-Gm-Message-State: APjAAAWQLswMcUpHOBnMqjvYg33bGglH4OjWmt7ZcwZeAqDvXG2EwMKP
	x/hXiMsLy3a3ROlB8zmkuYJVD7U/H9kw83ZOxfefyGsXZJo=
X-Google-Smtp-Source: APXvYqydBwr0a3ABdkgMuZqRe233B1ry54lh4I4Ps0IV1YDOtAOiN/JKNqzTxd6hMh68uEldbUhex1HUzLrpAlDNkqo=
X-Received: by 2002:a50:b582:: with SMTP id a2mr31472836ede.98.1568371988500; 
	Fri, 13 Sep 2019 03:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190913102650.2022-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190913102650.2022-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Sep 2019 12:53:08 +0200
Message-ID: <CA+chaQcx9Bu_ePY6kJNAmDaqReY4_rJMQ1Lf0qKb3DjvBBLWbQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 13 Sep 2019 10:53:08 -0000
Content-Type: text/plain; charset="UTF-8"

Please ignore this one.

Now I've noticed that it was like this before "clang: Let cmake figure out
python version for native" so I'll have to find why it doesn't work for me
instead of reverting your recent changes.

On Fri, Sep 13, 2019 at 12:26 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> * with /usr/bin/python -> python2.7 on the host, I was seeing:
>   CMake Error at
> work-shared/llvm-project-source-9.0.0-r0/git/lldb/cmake/modules/LLDBConfig.cmake:229
> (message):
>     Found incompatible Python interpreter (2.7) and Python libraries (3.7)
>   Call Stack (most recent call first):
>     work-shared/llvm-project-source-9.0.0-r0/git/lldb/CMakeLists.txt:20
> (include)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/clang/clang_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/
> clang_git.bb
> index 3906ef1..880307f 100644
> --- a/recipes-devtools/clang/clang_git.bb
> +++ b/recipes-devtools/clang/clang_git.bb
> @@ -17,7 +17,7 @@ BUILD_RANLIB_class-nativesdk = "llvm-ranlib"
>  BUILD_NM_class-nativesdk = "llvm-nm"
>  LDFLAGS_append_class-nativesdk = " -fuse-ld=gold"
>
> -inherit cmake cmake-native python3-dir
> +inherit cmake cmake-native python3-dir python3native
>
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
>
> @@ -102,6 +102,7 @@ EXTRA_OECMAKE_append_class-native = "\
>                    -DBOOTSTRAP_LLVM_ENABLE_LLD=ON \
>                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
>
>  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}'
> \
> +                  -DPYTHON_EXECUTABLE='${PYTHON}' \
>  "
>  EXTRA_OECMAKE_append_class-nativesdk = "\
>                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
> --
> 2.17.1
>
>

