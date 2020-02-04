Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id E2C3961197
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 04:27:29 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id s24so19408686iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 20:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i7bN1VcR3uObFbZbOS8GkjiuqH8QNZ9d8C5Jh00gqig=;
	b=TkSIhCrSXqgaE38l7vs2PEDQBev2fh76+FQpx4c8BcUcyeibQbpI1Em/9VYf9V/qhz
	822AwRUL7Xp4xyqAKN+M4aQuNMPoDhcimNM8SFm6d9qxdOrcakFJHFe/nJrlKaTIe1Ys
	90Bdmny9UEPUwof9wEJ2cBQyPUmhAMpAKsKJlnT7/MS/CeeE/Fu0vQWlxTInEA2zyUWz
	02cIuSMA3cBOUyO4Rj0HnQ24LraqE66uma7Hd1UdrQz5sJdut24khhlVy2yI+AgWSzqB
	R6sVyHrQaxFgul00x+WbsG9ZkwIZHrWMn+9uJhYXfy83b2poBvConFaLA+u37jwLhQZt
	uEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i7bN1VcR3uObFbZbOS8GkjiuqH8QNZ9d8C5Jh00gqig=;
	b=G1reHNIcd0bWlM1LfYR3yyQ1s4s8W5dzrkyHNWFCn6asg+C8/Bok1Y6DuUAX9uMTCE
	dw4DK5FnrZpYr6OQ5D67ySD0Esz8Fo1kASNv7QYSPxNCVUyhwQ+foBPZBCT4lcjdUWJd
	IGiTDVViOY0ZBxGt4Zc2GJELbZNLNc9DRoo9jSIagE6MPjdMWjXWV67yYk35fHBLZU8Z
	S4DB4JngM7JwxQGMHB76IoXImKRJVsZqvby6Hi//j9sF5lzxoN+E6m3tleuDU2d1WtqZ
	7oTmvDEFTeOGN2L4j1YN8BgGlKFTZwXodcNqTKIE6w0vc/MVDBjmpIF6HKEPAFZnDdMK
	3/OA==
X-Gm-Message-State: APjAAAXvL/5OjUJdOB8lJHOfQLLKnXh5pM8eFczmoRlNKWCVQl6Hf+9Y
	z7dm5SdsoqY4WxIvwVN1za5CDGboCQpPt6C4SmY=
X-Google-Smtp-Source: APXvYqzMntRiKrnWwdoDwxfAMEMGUpeu20rxBmqqEzBStHcg0KuC99UHo/UV6lOEauMnPEeLbFWhgd9tM/p+xyJWNnc=
X-Received: by 2002:a6b:700e:: with SMTP id l14mr23298282ioc.170.1580790450827;
	Mon, 03 Feb 2020 20:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20200203193635.2253-1-raj.khem@gmail.com>
In-Reply-To: <20200203193635.2253-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Feb 2020 20:27:19 -0800
Message-ID: <CANx9H-DAha8kWN5pTQXqG9pWh2BT=v1zRG=icmHUDj08L8JG8A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] python-six: Update to 1.14.0
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
X-List-Received-Date: Tue, 04 Feb 2020 04:27:30 -0000
Content-Type: text/plain; charset="UTF-8"

merged. thank you.

On Mon, Feb 3, 2020 at 11:36 AM Khem Raj <raj.khem@gmail.com> wrote:

> Have its own checksums so its not tightly coupled to versions from
> oe-core
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-devtools/python/python-six_1.13.0.bb | 2 --
>  recipes-devtools/python/python-six_1.14.0.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-six_1.13.0.bb
>  create mode 100644 recipes-devtools/python/python-six_1.14.0.bb
>
> diff --git a/recipes-devtools/python/python-six_1.13.0.bb
> b/recipes-devtools/python/python-six_1.13.0.bb
> deleted file mode 100644
> index af26e83..0000000
> --- a/recipes-devtools/python/python-six_1.13.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools
> -require recipes-devtools/python/python-six.inc
> diff --git a/recipes-devtools/python/python-six_1.14.0.bb
> b/recipes-devtools/python/python-six_1.14.0.bb
> new file mode 100644
> index 0000000..779883a
> --- /dev/null
> +++ b/recipes-devtools/python/python-six_1.14.0.bb
> @@ -0,0 +1,6 @@
> +inherit pypi setuptools
> +require recipes-devtools/python/python-six.inc
> +
> +SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
> +SRC_URI[sha256sum] =
> "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
> +
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

