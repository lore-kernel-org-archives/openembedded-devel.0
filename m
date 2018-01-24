Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9075565D00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 18:46:34 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id p36so4479801otd.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=RxGR7wFlh1eLyYhnZ7fw87eSc3mvopfBN8muUHPeOxw=;
	b=QQJB6kft6CIk0HfH4yT3DJgiSTpwGjiTRILK40H91ypw+f/AWzi+V64TE+9WjVCq3F
	sqfsDSkLZ+Ar7Nnf1PG5vAazWh+vRg40xsxDcIgViekK0lxSY4Y2VeM9BjU5KeoyPdGl
	rCTtSPstJjWrHktdvURJV9EBKd97giHulPNQxXkfYZLJMUypVyvCfNX9JAczQSCX6uWA
	7xpwIy+hIWkL8/ibDM1wK08vtN35ypOk7b27uBNs5aaYFidlnBl8S5pTn6tkG9XmZplx
	5DdYUmQIQwbD3ZEDrORsfVpzRnelmZ2KQeLfX1759CoYJ9vxdU8t57f4CtAx1VDubKPg
	JRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RxGR7wFlh1eLyYhnZ7fw87eSc3mvopfBN8muUHPeOxw=;
	b=M7B4KadrRYgNJfZDQ+7MDpPvWVq9DxWH7iWCz5ax85A+F8jcSRLA7SZrmZMXjVqEKC
	BiVbEx9AWmOOtJQlx4Ym9kZ2TK0vbfQjV7R4JDGppFO5AJF72iXT1/50TZVyMFDSfwPm
	BFdj4PjZaC7vUTRXVQSxFmknqpbR9Kwn7Geoz/4oK6BPrJeyoutkDc24QRWgKT+ehPts
	8MkpbcelDHLmFmZR9lfPnDzSOwu3RN8PnDlptK5vCvcGJNvJGNfA0RjhSnNwBY7zEIAC
	4AXuEdtr2Gec9IxUsqVZw4FzON6vdW5N9mQ8eZSOiQQxf5l2hiS8nABvnuAoeQep9noW
	bytw==
X-Gm-Message-State: AKwxytfHfJVskfM64ts3qUct/htfxi7DQ9AIZ2F+HfQZiiOZ2ueRXHPg
	jziYhbWmh8073UU1Y9XJ4VapgraL
X-Google-Smtp-Source: AH8x224IX5gdPa7Fpfjq8OEbDGOwLpaVHkxIIst+efNVYY6LHiQpim/7l8q8B7aJRVZV1Lv+FRUNiA==
X-Received: by 10.157.63.248 with SMTP id i53mr9950604ote.51.1516819595029;
	Wed, 24 Jan 2018 10:46:35 -0800 (PST)
Received: from [172.27.88.46] ([217.140.111.136])
	by smtp.gmail.com with ESMTPSA id
	j126sm2320454oih.14.2018.01.24.10.46.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jan 2018 10:46:34 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20180124131759.5884-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <86d7223c-86f9-0283-c286-17803430e083@gmail.com>
Date: Wed, 24 Jan 2018 12:46:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180124131759.5884-1-twoerner@gmail.com>
Subject: Re: [meta-oe][PATCH v2] uriparser: add
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
X-List-Received-Date: Wed, 24 Jan 2018 18:46:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/24/18 7:17 AM, Trevor Woerner wrote:
> Currently I'm aware of the following layers/recipes which depend on uriparser:
> 	- meta-measured/recipes-tpm/tpm2-tss
> 	- meta-webos-ports/meta-luneos/recipes-webos/luna-sysservice
> 	- meta-webos-ports/meta-luneos/recipes-webos/libpbnjson
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> 
> changes in v2:
> 	- update license from "BSD" to "BSD-3-Clause"
> 

this one looks good.

>  meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
> 
> diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
> new file mode 100644
> index 0000000000..b4be853ddb
> --- /dev/null
> +++ b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "RFC 3986 compliant URI parsing library"
> +HOMEPAGE = "https://uriparser.github.io"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=72b0f9c74ae96eeab8cf1bf3efe08da2"
> +
> +SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-test --disable-doc"
> +
> +SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
> +SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
> 


