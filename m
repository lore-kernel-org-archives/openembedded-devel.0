Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5D561BCA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 14:47:12 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id a6so2240178ilc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LMS9oAjwbQ8LTOrWPgvj0Gy3Yzn9xsQ/7n7woJjQ6qE=;
	b=VLQ5G1pqUWarlbNFIv+whwshATQGo7TVKMXXGR2tfE6HUTZVSLqP/OlM1266PqcVoJ
	haV7vCK18BmI7nn6LwxrMUrp1go6NhPLMhbGU8DkfIsMiQT1EX7WpzNmLAAh9zAAQOFZ
	mWWPtfVYXxPfgK6RWlR+ZKu3iNp/JMNrqEMNn7l9vgG8Zn+1pP0z/jSU44A9n1DBER1Y
	ovJYb2KLujvzQ4eqnwBya+tIK8XPuF/qC2Zd4S4oOqpJWMCJcBQmdHzjiXHL1X60cuMw
	AfVsH02OsracfgYFTmM3+WPIxZray7yTu3m6eZ3+oCe49X8dfdwa1M+kJe+5spv2gjoa
	4PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LMS9oAjwbQ8LTOrWPgvj0Gy3Yzn9xsQ/7n7woJjQ6qE=;
	b=mSZnoFgaibZ2zKfvoQwpF2o0gUyPp+xPYvlFXsNFsidMeAdudUSAXU3svRk6Lpl74e
	9vC5BoDQ4OXzg1Zu8UIde3CXbSGXbSIwdv5rNLyYqQJfpWGfxbhfbf4ExVwm24sspWoV
	WKsHPci4sTxrmZuNrwett7f5uAkxw9NQczuidQsQVWnQ6trqYoWLJ68TGxcQNILQQeXq
	O5mn5r1gdHhEE0PwJGCg/czwxIjsVAuIIBl68dSRlXGKWnRXLMKSXXP9KqFSXvTjZ5oy
	K6HJ5QY3zxVt4qWYyXNENCifxurPdPHy2pjFffOGQHxofRLoImxPr0AfrIf0fCmVc5Z5
	8OWA==
X-Gm-Message-State: ANhLgQ0ny1UAHSr6SPQ7Pirw0FL+f8xHKHnIO2yVc8ufegivJCNrrjFq
	6CaRgZUi1XvFQuJtDTDp3qyRfZTk9SDZ0yGao3Q=
X-Google-Smtp-Source: ADFU+vugTRjzJSWad9TgJf79k1E6ENQXVxHUA4MQOh2OQM4uezzfHV4eEOcoxm2Q5LEPsnkKkOIx8Cb3FfowQNWoTuU=
X-Received: by 2002:a92:d304:: with SMTP id x4mr3483408ila.151.1583938033962; 
	Wed, 11 Mar 2020 07:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200311070359.18480-1-nick83ola@gmail.com>
In-Reply-To: <20200311070359.18480-1-nick83ola@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 11 Mar 2020 07:47:03 -0700
Message-ID: <CANx9H-Ctq14Tj8DyHnN3-X3bB=8XXncAQiiVhRiALtLW4Rszjg@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	Parthiban Nallathambi <parthitce@gmail.com>
Subject: Re: [meta-python][PATCH 1/3] python3-cycler: add recipe for 0.10.0
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
X-List-Received-Date: Wed, 11 Mar 2020 14:47:13 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW, I had made significant progress towards getting ptest enabled for
Matplotlib, although a bit out of date now [1]. Which included a recipe for
cycler. It also unbundled a bunch of dependencies, like libagg.

The ptests do require a fair amount of ram, so standard qemu settings will
epically fail.

[1]
https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python-matplotlib-2.1.2-WIP

On Wed, Mar 11, 2020 at 12:04 AM Nicola Lunghi <nick83ola@gmail.com> wrote:

> This is a dependency for python3-matplotlib
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../python/python3-cycler_0.10.0.bb              | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-cycler_0.10.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
> b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
> new file mode 100644
> index 000000000..cd21be8ac
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Composable style cycles"
> +HOMEPAGE = "http://github.com/matplotlib/cycler"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
> +
> +SRC_URI[md5sum] = "4cb42917ac5007d1cdff6cccfe2d016b"
> +SRC_URI[sha256sum] =
> "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    python3-core \
> +    python3-six \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

