Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 358C67EE2C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:27:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id g18so26879144qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u/MZ5sbiHqHLNYXDhspo/mSJsrr333zfjdc6uEGgHEE=;
	b=aJbdkSvyNP4qjLSmeCUSrBF5jWNvt7tyiekB/0btmuRTvB5uffkoZlvb2j/ZPvo39m
	lMAoi78n0vsgrpNsKALxs88LZcS5nddnzyIFw0niz8UcdNtoMgUtub6/Qnp/FnlaFHkA
	h7hbZX+nl7B6TfX+KKrwqYjmB4llpro8B7oisxmMGh03VhKmXLnty9knUmG3Ip5cuR16
	sgkRiGoJs1BQEtBMPhfOwmHk748ZDGtCJbwzudOJbnkohNNSDI3B/ar5OB/7pr5dKgFq
	llZpi96QpPpz7SqV2sZmQGolSavClHAdjDH/8+JukJPloQ0bk9o28scFkLtYj3pUxJY7
	jRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u/MZ5sbiHqHLNYXDhspo/mSJsrr333zfjdc6uEGgHEE=;
	b=MpSyH8kwoWuSJ1deLM/neuXaNLCUPFsx1nTmQNWSwLryy73JAAzTG7tKIrZAkiyzQc
	pH3EfZKVyCFArxUPR3BLAwS72Pv/1JRuvz3vxlErAj50B4mx+Edkd92QnDJLYfrMvy1a
	wjHsJTK04+Lyl/KOmsZnke1aDOhIMHDPXA3bjzmnN6lYaTB9IjVCNwPj5Jx9Tf9Ke+jK
	vtzY/WzfLVugG9nfgOxX5QlknoQuPPAPRzcwZHlCsuaHkfYWmGZ6gCYYlOVbNyS4QjkC
	hi9Qa9D+s6Uz9RX9lTkL1SpOb0YKmZBmCPcnIP1QQQhxMRaTMsqdjVZVMNuJSxpLTChH
	ImsQ==
X-Gm-Message-State: APjAAAVFuQZIoroBdZJbRXwEuwEh3FzIp3SrFiz+eWkYn+BAkkxgtlpV
	/006anfON+RcGLTOfQY0Hp/XQeUJDs9jr+H57fM=
X-Google-Smtp-Source: APXvYqzg3MfZrWbxiCivAMOKaODH6S8yaGqn5T1V/BxeJ+A54iS1WqgLj+Er1AAR2sC27apdPUx5uZIwqB96ubDfSao=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr10161924qkg.337.1563726479782; 
	Sun, 21 Jul 2019 09:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190718042123.61092-1-mingli.yu@windriver.com>
	<20190718042123.61092-2-mingli.yu@windriver.com>
In-Reply-To: <20190718042123.61092-2-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jul 2019 09:27:33 -0700
Message-ID: <CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.4
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
X-List-Received-Date: Sun, 21 Jul 2019 16:27:59 -0000
Content-Type: text/plain; charset="UTF-8"

seeing gold linker crash on arm

https://errors.yoctoproject.org/Errors/Details/253440/

however, this is a linker problem which is latent until this, I would
like to see if we can find a solution
before applying this patch

On Wed, Jul 17, 2019 at 9:21 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../log4cplus/{log4cplus_2.0.3.bb => log4cplus_2.0.4.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.3.bb => log4cplus_2.0.4.bb} (81%)
>
> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> similarity index 81%
> rename from meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
> rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> index 56c62f1f2..d86521aba 100644
> --- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> @@ -7,8 +7,8 @@ LICENSE = "Apache-2.0 & BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
> -SRC_URI[md5sum] = "20a87090cd8ec34ea11b3e59954234cb"
> -SRC_URI[sha256sum] = "2d8f627aa6417e6c6a100bc09dc407684ca4605c929defc1690ee7d6a575ce6a"
> +SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
> +SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
>
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
>  UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

