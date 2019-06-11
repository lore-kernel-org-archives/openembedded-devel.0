Return-Path: <asselsm@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 58AA87E6A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 19:53:10 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id e189so9896551oib.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 12:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=CQXtyQDmhTj8f2WPG+lJiX7nY46K4YOW+ghUil2Ggb0=;
	b=IbBWfQgQPwNe7ypM4F5asGczsUDpD7al9zTZ2aoGdv5I30Gwzm/7BbgjSjrmiPyqCj
	Ty0aDsl8PTOWQxPK2FIn5n1KJ4IX+jtQ9xKUcGlPC/b5Jo/Pez6ZEWRLiRclZpVTSmYr
	kFnEqYb0QZD5dw1zQG/XP3AV4QU1lErbZNaeQ3xlIJMWgtxqah773zlBCp5Lvw1zlq4a
	C1PkQsgWqD2ee5TGyKNgkyXrkCWKbHV+3sbzPNaAv3UNoZGxBwmuFZ9at/S816Wt1xwW
	XE7ExmTy1fEKmJwqfN1wrN9XNd2BsqTpS5RaZOqI93vq4ysEZkI0NiQCduiw3AWG7ozs
	FeCg==
X-Gm-Message-State: APjAAAWAkcSHKd+9riEtFb7rdggD84bDkXmZ2xlRo9fr0jV3JDLM/Rxw
	XLvicIhhwqpALK8k7eN7yGlJmM6CFcCUnx8fbkY=
X-Google-Smtp-Source: APXvYqwWlf2cMiPs25+bV3PiwK+ZYWhFrwfH1shqYS6aro89+nxdu/Ikq5Y8EhTnzmsGzrI359fDNXTSWQ/1Q8dTFd0=
X-Received: by 2002:aca:5b57:: with SMTP id p84mr5976934oib.4.1560282791291;
	Tue, 11 Jun 2019 12:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <1559531758-126270-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1559531758-126270-1-git-send-email-zhe.he@windriver.com>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 11 Jun 2019 15:53:00 -0400
Message-ID: <CAPuovEKTcOjHS1HTfq0rrrqYMkEAEbrow8wPF8EMhWaUuk+NSg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] rocksdb: Turn off Werror to fix build failure due to GCC9 checks
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
X-List-Received-Date: Tue, 11 Jun 2019 19:53:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 2, 2019 at 11:16 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> GCC9 introduce stricter checks, deprecated-copy and pessimizing-move, while
> rocksdb uses -Werror and causes the following build error.
>
> db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]
>
> utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2: As suggested, turn off Werror instead of the two specifc check options

There is now a proposed fix upstream and there is also an uprev in progress by
Pascal (RE: rocksdb: 5.18.3 -> 6.0.2). I have asked as part of that
the potential fix
be included along with the uprev.

Mark

>
>  meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> index 8d84619..5ce4c74 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
> @@ -30,6 +30,7 @@ EXTRA_OECMAKE = "\
>      -DPORTABLE=ON \
>      -DWITH_TESTS=OFF \
>      -DWITH_TOOLS=OFF \
> +    -DFAIL_ON_WARNINGS=OFF \
>  "
>
>  do_install_append() {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

