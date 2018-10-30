Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 111BE79BD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 21:05:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c16-v6so15253752qtj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZD5cEwYbDZChwexN58JzSdJYpJF6XqB2sxzDB+a6JPY=;
	b=eeocnzr6KBMiazDfXl1Bl3M40qloOi2q0nyPJsxceVgxV3QIxLDRRqaRz6p71TU4mH
	Ik0ToLtHognYZlTMBtSCLBZOQ628jTM4ygYD3dtBq7eGiJOfHBfY6dY6YRnWMoSeLPTA
	aVHg+fa8HYYQeT3f6t5g+4lCy3QzqI0IQhtxrmhnxFf+0wSDJlhQLikagkv9uYVTcuwo
	aoFFFLu9maGxoxnmnQyXHYI7jsKugmOGvrogBwkKyoAf7SpCkY928aZOdFr0tJl38CVx
	mVy22tQykPPaUk+WKYPTyfgcw2mXEEsW7unD0i5Ydvg0A35Hthl2eoPlXPzzLmuQGh5t
	obgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZD5cEwYbDZChwexN58JzSdJYpJF6XqB2sxzDB+a6JPY=;
	b=nsCs0jqo1eTV25tGCICKws4ewgDsFqBo9xNQ8lqlE2FqzcLlpCRKBPS5AljCt9hQhZ
	va9//HhdD8oTynmkpucqXElqKCb29dZgwRa2vEw/7Y0MXk1DX8o5cPy6JCKd3UnhCgcw
	tX07cGMvk9D1Jo2L6kUifwrRVL46xJjBu5+CpZ18rLVgXdeMVOzSbKQctB8wbZSMtfR3
	W56YS1oIgpA9eLzn0u3/SWGhCdpObIXCMDEgIkYo0Wr9Rd/kYserOHciMqD1L5WedkfQ
	RcGsrjv0Q6TmP29mX6+/wOts6rfXOQd72H9pSVErzKmfe0J+KSZIBItZgGoKwf1Y6vPB
	xOZg==
X-Gm-Message-State: AGRZ1gJycnfeJ9jRmT4ISTKxAuYQTrr4bQ9xb6oiKqii65715smSUsIz
	SwIoZMYFtMtxhWqZQOOAoKjDoomodXS2wP+RAWc=
X-Google-Smtp-Source: AJdET5fT9p90hRYCSc87hPntDvtsn88h/Gc0j5mxZPeB7jMEWCxIdv5RO0z5Unpiciqe8FEaJyDvQhVuOl7e6tN8Uko=
X-Received: by 2002:aed:3e94:: with SMTP id
	n20-v6mr333500qtf.196.1540933524531; 
	Tue, 30 Oct 2018 14:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181030133511.2954-1-pascal.bach@siemens.com>
	<20181030133511.2954-2-pascal.bach@siemens.com>
In-Reply-To: <20181030133511.2954-2-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Oct 2018 15:04:58 -0600
Message-ID: <CAMKF1sq1BgDRg+8oB2d=sUWtCo2x-4FMGyMTS-r4ZPAiD1TG0Q@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] civetweb: disable tests
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
X-List-Received-Date: Tue, 30 Oct 2018 21:05:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 30, 2018 at 7:35 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Tests try to download third party code and bypass the bitbake fetcher to
> do that. This will not work in environments with no internet access.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-networking/recipes-connectivity/civetweb/civetweb_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> index 004cf960a..d681f7f30 100644
> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> @@ -23,6 +23,7 @@ EXTRA_OECMAKE = " \
>      -DCIVETWEB_ENABLE_DUKTAPE=OFF \
>      -DCIVETWEB_ENABLE_LUA=OFF \
>      -DCIVETWEB_ENABLE_ASAN=OFF \
> +    -DCIVETWEB_BUILD_TESTING=OFF \
>  "
Probably, it will be good to turn this into a packageconfig, I am fine
to disable it by default
but it might be useful to have it enabled with say images with ptest feature on.

>
>  # Building with ninja fails on missing third_party/lib/libcheck.a (which
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

