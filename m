Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C33547FA42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 19:24:35 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z14so3813231qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 11:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KSQcWe7wdL7drTSF54295+hzOuQ9vvhaZ3fFya0jPTo=;
	b=CRRde5bo7f3Dx76WJ1AnevOmK1gFPEBzyslgjPJW4rNPcUFp8OA7HXaNvWhMe6RjzM
	owgMJOEx528Ee86UNNvL4xXOtLC9WLVFVZVNYzaTyumy9YbILjVkL8nb5sAQsH4qdhmm
	QKL74rsaH7OoZgQ+3dspgrUO4a59f7iw0VCEaGEARSCclYkzZm0sWaouF+cJpLb41Ikv
	dgsrzO3yFwiU2b98E14VOoI6iLF6hhJ799+N+Bt7prc1sMrZqs/ECHDKHUG6tC5Sz4xZ
	C3kmZkVTGpwCPBFofDQO/nmYFBPsBE4UCav6CBkrimKhqxSjHyr3LURDbOCFEj40WPRX
	WunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KSQcWe7wdL7drTSF54295+hzOuQ9vvhaZ3fFya0jPTo=;
	b=jakBBpeJHif909aJSIX5ohNhtVyEdh6oI5GsLfzPtUqHDKTVDIpu41/F30nza2c3aT
	axZ2iYBq3jGuWP7Z1lLm3WAJrzwJ4QhlxMi2R5AuJEKOkcECXuWot+Wgw7E053ckwHUM
	Tz56Amw/3jgfhq+OANjy+PX8edIZ0BvtJCrVpC5CPm3woceFPW1nnWTTw4fsWzSOr836
	VfXfSgfB5VKkV1eLKX5mMxWKAA6fhraH/9UCgS03mRwsKu0HgZt/qFOJhaH/4bHFGD6u
	myhnFrWUN8dTOS+rarSH3FWlvG3pP+wvH0daPNO1+CR9VS0lYnikyubn34/vrJOJ3O8A
	cOKg==
X-Gm-Message-State: APjAAAVoWbRbd7JZhyaXLyAqf07cORNfXl+qQQPJ4/MfXqsDejo7YTR0
	FNtnY+ynu3U65X+6E7hc7XhNjITi4qz82w2BMgM=
X-Google-Smtp-Source: APXvYqxibat0kOmJL8HsGCNw6IWbsB1E5TT7pu+AQvyQBM57wrXcuzqlYQ0MXsPDv0RfsrQH8EXjpfn89O1eZ+EWhcU=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr504598qkg.71.1575919475947;
	Mon, 09 Dec 2019 11:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20191209144525.21752-1-brgl@bgdev.pl>
In-Reply-To: <20191209144525.21752-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Dec 2019 11:24:07 -0800
Message-ID: <CAMKF1spX0HCZ-pcth0t80VSHMVvSN2BTyLb1jXg6h4LQG-XGOw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 19:24:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 9, 2019 at 6:45 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> rdiff is a popular tool for calculating binary delta patches. It's
> provided by the librsync package (unrelated to rsync already available
> in poky).
>
> This recipe adds new packages for librsync and rdiff.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb
>
> diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> new file mode 100644
> index 000000000..9d224767c
> --- /dev/null
> +++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Remote delta-compression library."
> +AUTHOR = "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schubert"
> +
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
> +
> +SRC_URI = "git://github.com/librsync/librsync.git"
> +SRCREV = "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "popt"
> +
> +inherit cmake
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGES =+ "rdiff"
> +FILES_rdiff = "/usr/bin/rdiff"

Please use ${bindir} instead of /usr/bin

> --
> 2.23.0
>

