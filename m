Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6D97FA59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:21:06 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l15so10488132qtr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f83pycLRbN/D9qdnZVeLbk6VLTUzf04TnWwP6gIoewo=;
	b=ICjkVoBaFG9JUtIUJvYuS5UxcIY7cnnIfYYQEMzIAZj4JoIz4/0gO/eYmdgfuQHKNp
	2Dz/GJn2wskgXK3sKe2cve9pK5fDxUSiJJw6ZV2SJGOknYFyXEO/fIl6aDXniTG7tDWv
	yVpahhpeynxMe7NaMACATEJ5SuKTl9S9SlrdR/IT85aPYo21eXcA0m28JOHuOaS1lLop
	NV8xG/7dlXHEIEf46KsrkCTdLF79OUcy3QP+kMBkEpS2b+M0xSCz1dYoxiTp3k+dER0t
	/WVMyYsuW/sS9JwA6vwUhnRV8V2iQlJTHXMwqhgFiBRHAo1zocBcK/8ypu9o/MAdZFXF
	emUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f83pycLRbN/D9qdnZVeLbk6VLTUzf04TnWwP6gIoewo=;
	b=c9epPsQQ5Rfmdh6kMy1Of1MQXqRDs4eVdj7g57Ed/NqgMDBtP7Zmouq36tOLcprecG
	8gaJCY293ocSjWL3Yg9G+vUUFuNnK+7gbQj6bhts+OQznchSuLF/lOiADM6u6hvCh+5p
	SEhDwqcup6p3KRPruo5i5xXCXQXiT14IFeOvwIfDtMIGpTSnPySiD+y4mX+TV7DvQ72h
	cH8df7iGgWA4toQOPAqkBExfjA6robvP3Wowo5RmU86kXpn/ua9iMda9nAHydoZ8Y6+1
	3IXEFO/YvIK/wIhkt6oxA8hcs4gnsuQV3kgC2//Mjxugo2w4bA6mEFAzzqci7LHql3kG
	eYHQ==
X-Gm-Message-State: APjAAAWCvIBO0rJF1E0vqK6KdzW0NhUHg8WTeqPZkepr0T3X++Adj4XS
	RjvVIELI5dwHf7N5w7Y3CpdYf9DypUX3+KVHc18qvG87uNBuIw==
X-Google-Smtp-Source: APXvYqwwVxVd9w8LF+ZHkx/K7pNKBl6uBSz8PjoS/j15UWWEG556US8GjdHJr4a74qCjs4ecbRcZVEbX5p87gAFdfWo=
X-Received: by 2002:ac8:411b:: with SMTP id q27mr959340qtl.53.1572301267041;
	Mon, 28 Oct 2019 15:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191028152722.31428-1-mns@gomspace.com>
In-Reply-To: <20191028152722.31428-1-mns@gomspace.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 23:20:39 +0100
Message-ID: <CAMKF1spcbB4OP4A6AgQBq+qmrD4pb82XWonRJiqOpMDbEYPp0w@mail.gmail.com>
To: Martin Siegumfeldt <mns@gomspace.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libiio: Conditionally inherit distutils3-base
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
X-List-Received-Date: Mon, 28 Oct 2019 22:21:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 4:27 PM Martin Siegumfeldt <mns@gomspace.com> wrote:
>
>  * inherit only when PACKAGECONFIG indicates Python bindings is build
>
> Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index e6e0eaef8..027e4d5e5 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
>
>  S = "${WORKDIR}/git"
>
> -inherit cmake python3native systemd distutils3-base
> +inherit cmake python3native systemd
>
>  DEPENDS = " \
>      flex-native bison-native libaio \
> @@ -30,6 +30,8 @@ PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
>  PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
>  PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
>
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distutils3-base', '', d)}
> +

we also need to define this packageconfig where it should add
-DPYTHON_BINDINGS=OFF
when it is not set

>  PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
>
>  RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

