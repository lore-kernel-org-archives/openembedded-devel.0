Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4200F610DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:02:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p14so5581301pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8wUl1+64WssFM+yEPTI8u9TQqfrI6joxsMsvwpRNasA=;
	b=rWhSEn8t5N4M76rS1Sc4up+Q92ByQRMElwrbzFDKwThdGyg0pUDCvzdeNBgQFacdHF
	fDo8p4Cc/6tHTvSoCYuI9ryLHBd+AXHzkK0p8/vvB+3vJ96NW+o+qaxkW2GK94+cZEVi
	fx1vOxQBE+StiN773Bimpd2UvM5mv+84VZLt7/Vr6KJCq7NMy7Sl37hMlviLPc5UKcXZ
	UVTc+5kxI5dzOg09A5IfBExRQpwRn5gXf7MWC3ZBI57f/kYrTealvBSd7SPjQmmpUdTt
	ZAdcsZI8QIw7UdTmxUKZKrQ9AKfYYuFZmmJXdriNocWJKP4jCn4sCyCbBkmIkmhGrsM0
	efjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8wUl1+64WssFM+yEPTI8u9TQqfrI6joxsMsvwpRNasA=;
	b=aED3/tXXaG0ib2H5GFmOASERl7bRBI3QK/193kXubaNYBKE2PHWRvZCoV9fEuENPTM
	BvoBoZXsR+S1A1n/CCCDHyMk1xy+QCutTGH+I+BkjXMYVRSMiS4R8kUVNHHbeiCfpVNI
	33ow4gJT2X5XFRLN6jXbGrsYg9wG6wQsr/GO6Uk7UQiABhk4/73zNaTrOFcfbtyB9b69
	LHNQrhBzmfZazeUr1U+W0FT0uyCRoABvip4FLZryQmt/N8pcHHcwfmqmxiB88xw0qSCH
	KV5DvhOdj7LNrC9qoK0JKHdyd2QNipmo3o8uNgEk/iBKNurmWyXFZj1CoU6T2Ij2CWYn
	XnXw==
X-Gm-Message-State: APjAAAWjrzA/2TuXx3+fOlhTmuBB8OHwxi6MHksCv1y4epOKghAnwjrX
	3JdSX3VICVEEGew0WM4BnTWKPREDHGU=
X-Google-Smtp-Source: APXvYqxPbXHg3Rq/pptK9hFaREKVlg7c34T9ZRiZQ5nAM6aDdOt+mpEGSD5IofOS+vPq1A4/6bsXSg==
X-Received: by 2002:a63:4a47:: with SMTP id j7mr5865383pgl.196.1581721344492; 
	Fri, 14 Feb 2020 15:02:24 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:24fa:ebe1:e23c:267a?
	([2601:646:9200:4e0:24fa:ebe1:e23c:267a])
	by smtp.gmail.com with ESMTPSA id l5sm8032065pgu.61.2020.02.14.15.02.23
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 14 Feb 2020 15:02:24 -0800 (PST)
To: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
References: <20200214223751.16148-1-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4316c976-5fda-d89c-70a1-729496c0e98b@gmail.com>
Date: Fri, 14 Feb 2020 15:02:23 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214223751.16148-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-cffi: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 23:02:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/14/20 2:37 PM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   .../recipes-devtools/python/python-cffi.inc   | 17 -----------------
>   .../python/python3-cffi_1.13.2.bb             | 19 ++++++++++++++++++-
>   2 files changed, 18 insertions(+), 18 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-cffi.inc
> 
> diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
> deleted file mode 100644
> index a2b0c3bb0c..0000000000
> --- a/meta-python/recipes-devtools/python/python-cffi.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "Foreign Function Interface for Python calling C code"
> -HOMEPAGE = "http://cffi.readthedocs.org/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
> -DEPENDS += "libffi ${PYTHON_PN}-pycparser"
> -
> -SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
> -SRC_URI[sha256sum] = "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
> -
> -RDEPENDS_${PN}_class-target = " \
> -    ${PYTHON_PN}-ctypes \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-pycparser \
> -    ${PYTHON_PN}-shell \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> index e888084347..6156081126 100644
> --- a/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> @@ -1,2 +1,19 @@
> +SUMMARY = "Foreign Function Interface for Python calling C code"
> +HOMEPAGE = "http://cffi.readthedocs.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
> +DEPENDS += "libffi ${PYTHON_PN}-pycparser"
> +
> +SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
> +SRC_URI[sha256sum] = "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
> +
>   inherit pypi setuptools3
> -require python-cffi.inc
> +
> +RDEPENDS_${PN}_class-target = " \
> +    ${PYTHON_PN}-ctypes \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-pycparser \
> +    ${PYTHON_PN}-shell \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 

this patch does not apply cleanly on master-next, can you rebase and 
send v2 please ?

