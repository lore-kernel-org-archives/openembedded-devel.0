Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9731877FF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 03:51:00 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b184so45067082wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 20:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=U7aURbkoSAFE5jN+t/n3nEhHBkEBkBd4aLUpKzy4HuE=;
	b=bfhDjuAidGc6BKwpt5ldNG2x88Xrcj/qLHPby0MUTFeA+XFBSpDZLa3yxbfPvukcAq
	yYaJNLAs6UrEQaGMm6oCHDoKO34HhuGa2giE7rDkGYIeS6Zpxq/yY+EJuUG6QGn1+i0l
	9NyJ/9SOLVCYhI24gB6Hn3v6YOi9iSBnn8ozfptQlzpfLlW8S6EOvnDAPegvU9XyVYls
	Gww1u/lTfPN0Dg2E89+zUJ9O5gUaq/LOC6QnBkLWzJlanGPFCDZYEhyw/RO5VzX0V6vI
	3eaKOYTI/ULiFgG9mcFd0AUbgZs+qGIjWFDdSVo6+xBb6jjXZnfP+oB4GTwPD11g0c00
	J9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=U7aURbkoSAFE5jN+t/n3nEhHBkEBkBd4aLUpKzy4HuE=;
	b=i4mBCKEr1aKvfwdS+Ne09I+8SWL4FVlMxR5BAnBWfX5vcCk44v4wKSUsTEjlxggDSX
	bGtlXJtP4P/SLaPMho5c5t1WRyZOWrsZ212yeJPewc9ZGPE3iH7/MvoL2qHZyQ/Ru/bx
	xLwJYUZ0KarTTvrfAkQOrGNDl2y00ojMbIg4BbPFoOaIc5Jv8Q5JruCySaUKeFWe7Cf6
	TRnZWD9iKq1Lfy8CPAi4NvYonax32j7GPeYPAnx5iZf7MtYd062M1/0xIHBC5F6RNwma
	DD48YowwvCJO8zAnI7wRd54T6LvndEKwH8v5fb/c67eDJlFneG3OrOcsnzlwpUHNRtN9
	PpHw==
X-Gm-Message-State: AKS2vOwm5kCVsJtH0jnqyUsjShNDzLf5nVF5xQYIEmnZ0Z016GUH1uP1
	4yFR4niEJc085OSIrsnVKAlhof7SVw==
X-Received: by 10.80.139.229 with SMTP id n34mr6046521edn.127.1498621861004;
	Tue, 27 Jun 2017 20:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1498612870-16566-1-git-send-email-Randy.MacLeod@windriver.com>
In-Reply-To: <1498612870-16566-1-git-send-email-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Jun 2017 03:50:50 +0000
Message-ID: <CAMKF1spW2bpo5etTWmUVL1xBGJCeRFqfq06Wa8LBFx0uRPGgjg@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>,
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] binutils: update SRCREV to fix powerpc gold link bug
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
X-List-Received-Date: Wed, 28 Jun 2017 03:51:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 27, 2017 at 6:30 PM Randy MacLeod <Randy.MacLeod@windriver.com>
wrote:

> Update to the latest commit on the 2.28 branch to pick up:
>    a3e00a8 [GOLD] Avoid duplicate PLT stub symbols on ppc32
> along with several backported bug fixes for arm*, etc.
>
> This resolves the systemd link error for qemuppc
> with the error message:
>    .../powerpc-oe-linux-ld.gold:
>    error: invalid STB_LOCAL symbol in external symbols
>    error: linker defined: multiple definition of
> '00000001.plt_call.memcpy+8000'
>    command line: previous definition here
>
> described in:
>
> [YOCTO #11696]
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.28.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc
> b/meta/recipes-devtools/binutils/binutils-2.28.inc
> index 47bfa1a..52f5d92 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.28.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
> @@ -18,7 +18,8 @@ BINUPV = "${@binutils_branch_version(d)}"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"
> +#SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"

No need to comment out just replace it

>
> +SRCREV = "7ea1464297eadebe62aae92ad9bebb33f92c2454"
>  SRC_URI = "\
>       git://
> sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git
> <http://sourceware.org/git/binutils-gdb.git;branch=binutils-$%7BBINUPV%7D-branch;protocol=git>
> \
>       file://0004-Point-scripts-location-to-libdir.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

