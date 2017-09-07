Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED73577805
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 08:28:27 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id x85so15424433vkx.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 01:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o1rFnjXZY5Bcf1mHteWYOmkrVbAITr5U/h9Htsxe7lw=;
	b=jm+xDugZRlxZxXeFfnO/29VR3S0jYkzRiXiN24l+KH0e5fRFugtLk7eoA1E0PcqCEj
	QBHmXWf9KnkKBYbrXJc8QKpz9takqYebO022sfKAha9hfrYie2OkPFL8rri+SoZHct8X
	43Z31K8VOdSkzWZJGlBlABItpAoKUmhxYxyT8+UTawd9mhxXBsmZzDSRwbWNeRXeTxXM
	0Pm9rLEkVTQCVPdV97wxjBdRoHy8yqe2kJeNgwR+iopAAY8NFDZCQ2DRG7jCEZnUd4OF
	nJZr+B9PfJDzZSqbyvxkkFi1XpKsgRUhfI1UQIw3NKtezvzBLnBOV+7VGVFYVJM2+wwZ
	kUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o1rFnjXZY5Bcf1mHteWYOmkrVbAITr5U/h9Htsxe7lw=;
	b=JhDpQi/LdVgejaEkRGRo6UkHAqm+9ti3hMfvJKn8B7ivV5Le7xPuEWHUGjzDi29f3D
	d9R6NgeZCZXA/dNglfUFuh9ZhCwM9fR7nflmifbkACuPlFIenMtx8b+sGlQiz6y6FEWX
	npoQf/qi1rGvMP6hMXtpn85eEPHbdfhmZjz79TAyHrioCyasQcCNW14D9Yj8AFQlf2xQ
	ZWCmTKpfeMXFdJYzcGG8a6YiiKx9KyialJWm+O/98s1W4UAHBOc4p9l2IP5j45HfH/kE
	rHL07Rf5kNdKeidXmlJLxQHNk2xKa8fu3XyYJhy75Fp9Zc2wEKOiVjV3+EPaGO0K277O
	dGfQ==
X-Gm-Message-State: AHPjjUgBsT2d2pDTTRrnWCw3b0qJuZLcGeDjki3X2Uv/LgyAsgvSP90G
	g5uO13i6PMq9dIGPfS8qHhN5ZNuwsg==
X-Google-Smtp-Source: ADKCNb7q9UUGVx1BUr5X3F4G+fXdnwT2eyp23ZyYB/iu4pbjNhwwOiON6ueS/7kB41tDbVDFF+WJcYL9Z/quZjssMVw=
X-Received: by 10.31.224.134 with SMTP id x128mr960876vkg.1.1504772909039;
	Thu, 07 Sep 2017 01:28:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 7 Sep 2017 01:28:28 -0700 (PDT)
In-Reply-To: <20170907035758.41689-3-raj.khem@gmail.com>
References: <20170907035758.41689-1-raj.khem@gmail.com>
	<20170907035758.41689-3-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Sep 2017 10:28:28 +0200
Message-ID: <CA+chaQcj3sq+QExd4WeAO5P-Wr-3bfHCA8xPnmbQjGRnNteRBw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/5] pm-qa: Upgrade to 0.5.2
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
X-List-Received-Date: Thu, 07 Sep 2017 08:28:28 -0000
Content-Type: text/plain; charset="UTF-8"

I'll remove the comment above SRCREV, because it hopefully isn't correct
anymore.

On Thu, Sep 7, 2017 at 5:57 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> index 7322df8e7..315ab2115 100644
> --- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> @@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/
> WorkingGroups/PowerManagement/Resources/Test
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -PV = "0.4.14"
> +PV = "0.5.2"
>
>  BRANCH ?= "master"
>
>  # Corresponds to tag pm-qa-v0.4.14
> -SRCREV = "9111d1930f02337394cf16e84ad2a27f33607cbb"
> +SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
>
>  SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=
> ${BRANCH}"
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

