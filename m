Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5069B61115
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:21:49 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id s18so9981579iln.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 23:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N7pP3aEINoPE35tMBxVLnIGZFqv1RUj0EaEAtffRfAs=;
	b=slCsVG7tfmsZaNL7FXgmDiMK9iQD034mhBt9FpfsZy59fd/BoME5fjNJTicgXyV0gh
	sltQeMG7TjLE4XU2lJtZcJjEjWQNJ3itGBsbZDx/w8JuCJRcmGvAv317bfLrLGopmIsa
	36jMhbsN7qVk6WCzuEH3Db9VNIK1qs8hqQvv3aZc/PLnqOe3XWCR3voiShjQ5ORE/DdC
	HfXwiwpmSNzPuMV2UdkiOb6WXOR20wPNtXC0eAAbQuY4JzhfwW1GRQtGrYV/mYdngaI+
	ZnjoXxkhdA2CHOuWUtJdU24pnWM2rmIPzo3G/TNaFJKxjU9zWYQKdZeRdXQMCqToMuyS
	Hd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N7pP3aEINoPE35tMBxVLnIGZFqv1RUj0EaEAtffRfAs=;
	b=nrTuYv7Iq3NBk1907qlPqDMrMgfOh9mPFLHNj6/WH/BQhmH9QyL83jI7ikwBw2RMOk
	PsnyRLxKaYb4ouYJ+jBvM/DsZs7o3c3wUlAd/dAIns+XNznlSWWTq9KGy9SIQlcb8Di+
	vEFryIHOw+7kKB3SlveVc4viLzUy2NP9ENrg1JioakWLoSEP7cL1zBSHWtQFzjNmqOvZ
	oL+yHXZns/wMP/2qtQgpEEKbxj76knM/BuKBZLD23gW0/QGk/NErX7QhgRhhYwwp40sA
	yCDnjfObGJ29cvUgNYG+x4NZqTX2FkkugxTcSNoDtz9VHEI1SUdDEk/VNs8aiFQzS5gn
	ftnQ==
X-Gm-Message-State: APjAAAVs0NcsBX44EuumUJ7NueF6XLYZZjwV7ZUvCzzDJwC3eZSK4Yv+
	AqA9o9O275qI9RBdE2YFH/vZ+pDB3iYFMm3VH1I=
X-Google-Smtp-Source: APXvYqw9jVGB9PSZfgPkf1urSxAZhrZ8u6JmY9j0gho1fPimvZFVOGNBZx3/IVDcz+dSfY/TR9qGmE2Goal1Wf9t1lQ=
X-Received: by 2002:a92:8d98:: with SMTP id w24mr67025126ill.198.1582615310212;
	Mon, 24 Feb 2020 23:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20200220173431.23452-1-joe.slater@windriver.com>
In-Reply-To: <20200220173431.23452-1-joe.slater@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 24 Feb 2020 23:21:38 -0800
Message-ID: <CANx9H-BDJc7uwT=xiA8occtC5OugeFTD81zrqMOd=LbJFPqK_w@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH 1/1] python-lxml: fix installation
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
X-List-Received-Date: Tue, 25 Feb 2020 07:21:49 -0000
Content-Type: text/plain; charset="UTF-8"

I made one slight change in that I kept the "inherit" line intact, but
moved it where you had done.

Merged.

Thank you!

On Thu, Feb 20, 2020 at 9:34 AM Joe Slater <joe.slater@windriver.com> wrote:

> Inherit setuptools before adding to variables defined in it.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-devtools/python/python-lxml_4.4.2.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb
> b/recipes-devtools/python/python-lxml_4.4.2.bb
> index 911ba58..0f9cdf7 100644
> --- a/recipes-devtools/python/python-lxml_4.4.2.bb
> +++ b/recipes-devtools/python/python-lxml_4.4.2.bb
> @@ -21,6 +21,11 @@ SRC_URI[sha256sum] =
> "eff69ddbf3ad86375c344339371168640951c302450c5d3e9936e98d64
>
>  DEPENDS += "libxml2 libxslt"
>
> +
> +inherit setuptools
> +
> +# add to the defaults which are set in the setuptools bbclass
> +#
>  DISTUTILS_BUILD_ARGS += " \
>                       --with-xslt-config='pkg-config libxslt' \
>                       --with-xml2-config='pkg-config libxml-2.0' \
> @@ -31,7 +36,7 @@ DISTUTILS_INSTALL_ARGS += " \
>                       --with-xml2-config='pkg-config libxml-2.0' \
>  "
>
> -inherit pypi setuptools
> +inherit pypi
>
>  # {standard input}: Assembler messages:
>  # {standard input}:1488805: Error: branch out of range
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

