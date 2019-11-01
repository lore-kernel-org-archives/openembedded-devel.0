Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 50A9B7FCA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 15:40:27 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 21so7316611pfj.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7/ajHB3ycWIYJBImZH7iAIbyPObGCaiY8SoXfSPzqOc=;
	b=KRn7/t9Ws8o3iXBvFM66+bRfs/WoYmo16GCfjQnx6Y0i1eiCrvRjpHEQ25kHTpAxhM
	cpesWlgP/tLpyW4SrWWWIGflg/Ecpx+lGzTQy6wSbiSYzgoxAq5WCHvow1iA0l0YLRw7
	Flv2lopoTlP3tHB2DWbgkXBFIAYgC2m/zKiqjZmOY6NmNDlYzyhGV/uDbrVk6T3pVXHM
	fxKOsaNN2tDOt5Mt6FaGEE03Fpd3gDnbFj0gOxgxRYkWT1xTlNNkTGDpb9G/gOt2rlFY
	LE/O1vVyPxKjYj2bluwqeHozVjJEAnY4L3YQlG8sPGD4BM92IjLGKdUGKzEPr+k7rmVh
	88kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=7/ajHB3ycWIYJBImZH7iAIbyPObGCaiY8SoXfSPzqOc=;
	b=Fk46HQLByVJs5vTs6AWUFliR6YS4Z230HyrtcsSFWY+0e/xUY7LVXcLBbiJL4LFT/X
	zaQzUQNJqWuEGm8pKz9u7QgBHKSZJSc+grbo5x6eaXtr5hXa6+6tf6R8misBrwm4hzFm
	11AemibO0z9ZZdqp7X9FJ/56ggxkOFt5KDKSCknBgM4xj+t9Hd4VUBpmX5jh5HgFNVfy
	ZNsqvXKgl+JY4p9hzo+2xn4OhJQ6eMprbKHdyu2ViMgsNU22rbbhdE9O3TDBps9EEr4W
	RbikbN0b2tu9fNyZZY13rvy89wX5uEb+lCkQUIq8UjQlEnlLgtRi78LbditTZazjA/bQ
	gXTQ==
X-Gm-Message-State: APjAAAVecivQZg8AINSd60px5ixsSF6e+5Vce5g8BWv0RYAGesXRKgjR
	2wXjhIfW1s/46YrFKWV8YyGSNBuS
X-Google-Smtp-Source: APXvYqz0497W0TfjOyQ2DVW4P+IG8iXXpfKN14GzOwxew5q5z9QXPBz4MdnJGzqzHplwv82/ByTCVQ==
X-Received: by 2002:a17:90a:d989:: with SMTP id
	d9mr16069893pjv.90.1572622828062; 
	Fri, 01 Nov 2019 08:40:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:e96b:2d4c:84be:986f?
	([2601:202:4180:a5c0:e96b:2d4c:84be:986f])
	by smtp.gmail.com with ESMTPSA id i2sm2159380pgt.34.2019.11.01.08.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2019 08:40:27 -0700 (PDT)
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20191031184223.14080-1-Trevor.Gamblin@windriver.com>
	<20191031184223.14080-3-Trevor.Gamblin@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <84a3f2b5-264d-3f50-1fea-c6b8f6c292b5@gmail.com>
Date: Fri, 1 Nov 2019 08:40:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031184223.14080-3-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH 2/4] python-h2: add recipe
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
X-List-Received-Date: Fri, 01 Nov 2019 15:40:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

are these V2 or just a miss fire?



On 10/31/19 11:42 AM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../recipes-connectivity/python-h2/python-h2.inc       | 10 ++++++++++
>  .../recipes-connectivity/python-h2/python-h2_3.1.1.bb  |  3 +++
>  .../recipes-connectivity/python-h2/python3-h2_3.1.1.bb |  3 +++
>  3 files changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc
>  create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
>  create mode 100644 meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
>
> diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
> new file mode 100644
> index 000000000..42629c261
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-h2/python-h2.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
> +HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
> +
> +SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
> +SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
> new file mode 100644
> index 000000000..b84129742
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
> @@ -0,0 +1,3 @@
> +require python-h2.inc
> +
> +inherit setuptools
> diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> new file mode 100644
> index 000000000..7230a27e8
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> @@ -0,0 +1,3 @@
> +require python-h2.inc
> +
> +inherit setuptools3


