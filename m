Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id EEF326011B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 17:07:28 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id k187so248267vke.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x6f2/vKL1mus9Qvs0sP6BESDfjYGUIBI3hmJi5LBtZI=;
	b=D751XTFElnpgTPDcsn3fiWJKYUuTxMLcYJ/3RqGSsjDblS+Vo8WoDmfbZ5B1oFrE6k
	McwIXdac69TksDhaQ1ECATF84vMVrtnF4L33w/J9uEAB0kNqPWiua22g2VrY5qk+fE0E
	dm1MSrN5IqklaRkXeduCJYGv2WX2BUKq6EGkgwcbVLdiDU1Ap5Po3tdMBdYVh3Og1Rka
	wufAIU+m/jfudefYIcx4QBUofk0Nx8+mGzx5qYpBauYeES6fE4eLHNGlhf4Rh5I9VE+C
	f7+VN62Js/B09LxMvsWWb3I5etpLhjGGSnYOKR/bdrVCjEr1/VixeuYcP1LBbI+42EkK
	nqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x6f2/vKL1mus9Qvs0sP6BESDfjYGUIBI3hmJi5LBtZI=;
	b=umlfmbeletamb2FgzFAGNH2HxDvo/bGBH9tzOCIez9FNwTpUKvkPhkEUaYSsrflZh6
	v9yh1qWXNSLQsJhXEjl/xCniPzhf8yfWhaO57oiPkRx9Z2UEYJtGB0PinLSX/hqk+Rkp
	GnwJGtEUtJON9ZGnVA+SWlcO5LowXbPAWwLFkCXSUn5pUyvYuHJlsbRNbIvA0eM11JvT
	pgTkTQnfjFivoOvE4nLPrL50fbacNcz028Of9Bvb4Wlz6rXEYT+HZlk4bIpfAnNX+d37
	SROACaNXAvKwIiK4AYXBp+tRdGJiJwOl82+I/+OSos02K2bgYg3rJoAtErM0FdPcqWWe
	Sorw==
X-Gm-Message-State: APf1xPAZ/62QnUyyimvMpxhW8im5g0+RpIY5eVuFYbZjqv6Ilo2n3dvn
	se9h+55aJJ/M1cg9CBf+j1cTsnTXncPOoQA9IBo=
X-Google-Smtp-Source: AG47ELtstdUIxkS2y5sCOHqCKe3vC77MkUR/Ud6+G05QMbSyfNKDfqerWYujbnrYIn68yT2n6ElcmC/TjuP8gObMlBc=
X-Received: by 10.31.64.135 with SMTP id n129mr20609603vka.0.1520528849442;
	Thu, 08 Mar 2018 09:07:29 -0800 (PST)
MIME-Version: 1.0
References: <1520528098-8881-1-git-send-email-daniel.dragomir@windriver.com>
	<1520528098-8881-4-git-send-email-daniel.dragomir@windriver.com>
In-Reply-To: <1520528098-8881-4-git-send-email-daniel.dragomir@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 08 Mar 2018 17:07:18 +0000
Message-ID: <CANx9H-C_=ZE2TTssdn27dZtUe9rjNjiRmNP2HwWQRa4fFagj7A@mail.gmail.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH 4/4] python-robotframework: add recipe for 3.0.2 version
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
X-List-Received-Date: Thu, 08 Mar 2018 17:07:29 -0000
Content-Type: text/plain; charset="UTF-8"

This was on my todo list. Thank you.

On Thu, Mar 8, 2018 at 8:53 AM Daniel Dragomir <
daniel.dragomir@windriver.com> wrote:

> Robot Framework is a generic open source test automation framework
> for acceptance testing and acceptance test-driven development (ATDD).
> It has easy-to-use tabular test data syntax and it utilizes the
> keyword-driven testing approach. Its testing capabilities can be
> extended by test libraries implemented either with Python or Java,
> and users can create new higher-level keywords from existing ones
> using the same syntax that is used for creating test cases.
>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> ---
>  .../recipes-devtools/python/python-robotframework.inc     | 15
> +++++++++++++++
>  .../python/python-robotframework_3.0.2.bb                 |  2 ++
>  .../python/python3-robotframework_3.0.2.bb                |  2 ++
>  3 files changed, 19 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-robotframework.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python-robotframework_3.0.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-robotframework_3.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc
> b/meta-python/recipes-devtools/python/python-robotframework.inc
> new file mode 100644
> index 0000000..cc20d64
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-robotframework.inc
> @@ -0,0 +1,15 @@
> +SUMMARY = "A Python generic test automation framework"
> +DESCRIPTION = "Generic open source test atomation framework for
> acceptance\
> +testing and acceptance test-driven development (ATDD). It has easy-to-use\
> +tabular test data syntax and it utilizes the keyword-driven testing
> approach.\
> +Its testing capabilities can be extended by test libraries implemented
> either\
> +with Python or Java, and users can create new higher-level keywords from\
> +existing ones using the same syntax that is used for creating test cases."
> +HOMEPAGE = "http://robotframework.org"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +inherit pypi
> +
> +SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
> +SRC_URI[sha256sum] =
> "2018f233568227f9af8c366f93e243a157b742f3baf5b649ecc9750ac0ee1ff7"
> diff --git a/meta-python/recipes-devtools/python/
> python-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/
> python-robotframework_3.0.2.bb
> new file mode 100644
> index 0000000..16eaa78
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-robotframework.inc
> diff --git a/meta-python/recipes-devtools/python/
> python3-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/
> python3-robotframework_3.0.2.bb
> new file mode 100644
> index 0000000..8f613c3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-robotframework.inc
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

