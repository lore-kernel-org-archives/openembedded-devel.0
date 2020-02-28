Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A647A6189A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:54:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t3so660014pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 17:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=C3YsZprKQik6Wy7Hk4RyAvJzSl+b8usKDP/zLfmQJtk=;
	b=lxfApLfdTHm6IHu7XgT0AL2tcpkHuYytBC98TqDlIqzqFavKWPepiPGJsbV59wKjRy
	f/sYSeSNA8BvpYIctUeW0DDjIJICi41iQ8BPp0Dqwx8zPEU37tFaWwI9ovCbUr+aDtwP
	DFdA1kZC1DMUUQYg91HHUIDqbiLwjei16Iubrm0XC1gbekvqtyt6QKqt7BQLISO7l3VZ
	Rr/bpiAEz65ENalCi7NUV7CguXVbvY5vZ0Gcwm4Lm2OIEUIsKVOUpqRBoJ2VgC/3JX6r
	iEt0mXGNyLOFrsZqdxYBUcKNljfTRwkh6mWMhhTNWSPwd8VAE//L8F7ztpKYpmPAeZvV
	Skbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C3YsZprKQik6Wy7Hk4RyAvJzSl+b8usKDP/zLfmQJtk=;
	b=nP1Bt/prRFtGn4W916fr3EYvSPpxQfFh0NcGsqKwmmMNGTLB+rz1uFEcnZDV5eXeQQ
	QwWqqQ6eEgytQkGeAqHfE44MVa9TWhP7wJARFHNuCG9cPWgkZ4djayl88rCgQgCoHNyg
	4xS5aboiTse3RUYIYEdkNz0LDs0G6FNC4Rg8we9qmJZ5KN8arHnsF86oJrjDN0kfLTam
	EKLNYPFIFJIojkTp2JmFBL1czW5wzAexBDIKDwIknPuzjV1hM28kmTmpDvfDBukZhYPo
	AzHAG4GjTXSDDC4EK/F16LOUIRWkSUCf1gGDpuOaW3DCsdbroaJQ5JW1Tts1v17VmR1a
	cNWw==
X-Gm-Message-State: APjAAAUsghc6O4ktEgFGLiITLDXxITFiHuF+TaNN1fADQ+Ji57vwPfL7
	oOx4tXDEvOz7G7fsK5sJMuvXh8kEA8w=
X-Google-Smtp-Source: APXvYqyop73dzHNyF+7ALt/SwiPqGnr2iTW/nEWMNh0YlA6+d3a0czS3Iu3T1DnY+3C+AHhmCc7yIA==
X-Received: by 2002:a63:40c3:: with SMTP id n186mr2075755pga.89.1582854888154; 
	Thu, 27 Feb 2020 17:54:48 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:98ae:deb2:aaad:7898?
	([2601:646:9200:4e0:98ae:deb2:aaad:7898])
	by smtp.gmail.com with ESMTPSA id
	p186sm4075216pfg.115.2020.02.27.17.54.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 17:54:47 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1582878704-30686-1-git-send-email-wangmy@cn.fujitsu.com>
	<1582878704-30686-2-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <b1800325-aee3-338b-73ac-88cfbdefaa39@gmail.com>
Date: Thu, 27 Feb 2020 17:54:46 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582878704-30686-2-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [meta-oe] [PATCH] libuv: upgrade 1.34.0 -> 1.34.2
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
X-List-Received-Date: Fri, 28 Feb 2020 01:54:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/28/20 12:31 AM, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>   .../libuv/{libuv_1.34.0.bb => libuv_1.34.2.bb}                  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-connectivity/libuv/{libuv_1.34.0.bb => libuv_1.34.2.bb} (90%)
> 
> diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
> similarity index 90%
> rename from meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
> rename to meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
> index b842bbda7..234cec37b 100644
> --- a/meta-oe/recipes-connectivity/libuv/libuv_1.34.0.bb
> +++ b/meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
> @@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
>   
> -SRCREV = "15ae750151ac9341e5945eb38f8982d59fb99201"
> +SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
>   SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
>   
>   S = "${WORKDIR}/git"
> 

this is already done.

