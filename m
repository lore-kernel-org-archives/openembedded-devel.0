Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD62700F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:13:41 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id w16so829318pgv.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 18:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=kY1WjPbcidqvoXzWXu7tXPHHiEDkPBRqkGaBAuc7Zkg=;
	b=Izybj7sWWWiQeH+Pz0zEVOyvPn48HOritxs3Xq2+TaHJ/BN9IuGiNscgBnMO+PDm8c
	zrfLJYFUR0P4J2+OH2w5Rc+KaNCM5DZF/IOHRfqDTNnEYKzeEvN6bDKQvn10joneVwc3
	+YzLCIKCL0OiCvs0iBnryHLsjk8lr3oHegl9DtVVObAQu7zybovdwzYyLPRC1dN425yk
	PQmyLMFuC8/1E1ayl0ntO9UXmJ0cYb42/dBr/mN3B9/V1d5DsaPVgAKqEOcgg0r5D8AB
	ywzdHtTOdXbg7/Ie8lKJ+aYoeT1lqLQXo+JEdJWwviUyVVqWAye/oXyD0Xd+yP4L4XSm
	akZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kY1WjPbcidqvoXzWXu7tXPHHiEDkPBRqkGaBAuc7Zkg=;
	b=SiL+dP9i+otAT4F9tmiMy4y7nHUcj3fSLJs4K3cf/wm/L2hTCVvIFU5z+EBCSZiW/q
	6kjO9GI3J6WFhh7XDt21w/WZEwmHtim+9j8ekO7Kdn+Wox1aPnMrAzD9pCdEmZ+GKvqL
	d4tPtA2DGohpNV5g9Lw6FKAYkEEmitzNOl6M/uSKFxIedOCPC+dB8WsNEamxkQMM/kde
	iiatBROF4AgiPOEAMV6z4GsMl5O9INdEe6l70KW+CYlseg/HOgyI6A6S0b0qAbV1t9do
	QKbh4zpnOHPe21484Hq1AIux4dzJi6ezKwL8dgofDj4xSPrxrcTSUlBhGdhyWszg7scr
	h/Hw==
X-Gm-Message-State: APf1xPAotAfIAcuKfKZknfH1Y2UOp6UabqgHWFg7EYbOVStog/RCoDP1
	QrRJXxdL53nBq5TZuhP9mHNaE/Z0
X-Google-Smtp-Source: AG47ELtUIAhzHK6j1XQGKqI0wzsbelaumEFVrlwgKvVKCtwSb+MHxUO2oEgMB6TFavt31R++WUYqdg==
X-Received: by 10.98.11.19 with SMTP id t19mr253442pfi.70.1519870422469;
	Wed, 28 Feb 2018 18:13:42 -0800 (PST)
Received: from [10.238.241.18] ([73.93.153.50])
	by smtp.gmail.com with ESMTPSA id m3sm4746600pgs.90.2018.02.28.18.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Feb 2018 18:13:41 -0800 (PST)
To: ZhangXiao <xiao.zhang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <5A9676C2.9030208@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <52061e9a-5cbf-57c4-5a13-1f83394a54b2@gmail.com>
Date: Wed, 28 Feb 2018 18:13:40 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <5A9676C2.9030208@windriver.com>
Subject: Re: multilib SDK issue
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
X-List-Received-Date: Thu, 01 Mar 2018 02:13:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/28/18 1:30 AM, ZhangXiao wrote:
> Hi All,
> 
> With below settings on my local.conf, I get several errors when
> extracting SDK:
> 
> Modify local.conf as the example of section 4.10.2.2 of
> http://www.yoctoproject.org/docs/2.4.1/mega-manual/mega-manual.html#combining-multiple-versions-library-files-into-one-image
> 
> ...
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> IMAGE_INSTALL_append = " lib32-glib-2.0"
> ..
> 
> # bitbake core-image-minimal -c populate_sdk
> 
> ...
> Transaction Summary
> ================================================================================
> Install  416 Packages
> 
> Total size: 57 M
> Installed size: 276 M
> Downloading Packages:
> Running transaction check
> Transaction check succeeded.
> Running transaction test
> Error: Transaction check error:
>   file /usr/include/gmp.h conflicts between attempted installs of
> libgmp-dev-6.1.2-r0.core2_64 and lib32-libgmp-dev-6.1.2-r0.x86

this means we need to install gmp.h as multilib header during do_install
in recipe

e.g.

oe_multilib_header gmp.h

>   file /usr/bin/python3.5m-config conflicts between attempted installs
> of python3-dev-3.5.4-r1.0.core2_64 and lib32-python3-dev-3.5.4-r1.0.x86
>   file /usr/share/pkgconfig/xtrans.pc conflicts between attempted
> installs of lib32-xtrans-dev-1:1.3.5-r0.x86 and
> xtrans-dev-1:1.3.5-r0.core2_64
> 
> Error Summary
> -------------
> 
> Any advices?
> 
> Thanks a lot!
> Xiao
> 


