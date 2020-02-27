Return-Path: <raj.khem@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id EDEDF608AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 01:39:18 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id i7so937296ilr.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/1RCgFKSF+mTbCBMpcRn8bub44AsgKF9IMmQqiyp+nM=;
	b=Xo2teRSfr9A8bx8/s+FeQF/Iux81A9hfGSFhZ1f9GYJHfyR2jy5XBy2BAWwdrFKLzW
	IqpRanfrXGYt8GkrOv2OzcHyJKu/BmoHjPewPSNIkMck2fgWApeTzALXQZqBOw6NR/3g
	B8tJdcS+QCCq5hzv7lEHfmn6jQYuuG2wqJXdOq9SwEzNEhu21NtfhcSkBMlAMhQkgmVc
	frk6s188gggwN6mq0fSeSRCCYQ7m7MJfZjlwIT448DDXiKdE1QteRHKP/CJMCp4O3dUQ
	n98WdcsjrSvpHjwwMlEKAHd3vNUAmwA5l8gq5XibvRopG96Q/3smw55IASTUzCDy5ny9
	9q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/1RCgFKSF+mTbCBMpcRn8bub44AsgKF9IMmQqiyp+nM=;
	b=Z22/5NcGNYLu07dphztExOMAGhVg6N59LzwqUdHKTv1ZcV39aVu3eijLIOANQs0A11
	5Ztfmd9mKnjAUCxtpuRHxnv0pZkrGgJ3SASNe2KEqQ/d7m2xcTpBBa676PgR3wjPg5Cj
	hB1ZC//cp1165ah2Fc1SWlzUmjEKpbDJPSfhSEmqKSSMo1is+WPOFvtwNtVR6YpiLDrt
	JU1UIYMiIVgwRfqBXFZ0xfcPftkn88CzS36iundCxwHG6SM7iRMkT6RbjRUqAD2/vOaJ
	8BnpyhjPx7yM7RTofinHudTmyIERsJUFdlK5hInW/YpFhad9voZvxJPVoQprlkcuz/Bu
	3j0A==
X-Gm-Message-State: APjAAAXyGsFEM9mVGkcl77MEWLLieJi4fkZsXbXERlRJsHMSzMIQVgpU
	aLWr0oZ4d6rvq9TU76x4Kpe4x6XXsLE=
X-Google-Smtp-Source: APXvYqyvvUlazJ21CL5Nc7PsXtcm7Fyux9Rf74AFE5+yRcsYeQKZHUmo00E6Pypq9BKuSCMwINc9wA==
X-Received: by 2002:a92:aa0d:: with SMTP id j13mr2120909ili.205.1582767559448; 
	Wed, 26 Feb 2020 17:39:19 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
	([2601:646:9200:4e0:19c7:2796:79bc:80ea])
	by smtp.gmail.com with ESMTPSA id
	u14sm1008854iob.82.2020.02.26.17.39.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 26 Feb 2020 17:39:18 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org
References: <1582765387-17990-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <2688512e-5b56-9881-8b8b-d5d215453587@gmail.com>
Date: Wed, 26 Feb 2020 17:39:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582765387-17990-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] can-utils: update to v2020.02.04
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
X-List-Received-Date: Thu, 27 Feb 2020 01:39:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/26/20 5:03 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> https://github.com/linux-can/can-utils/releases/tag/v2020.02.04
> 
> This version is required to build against kernel > 5.2
> 
> While at it, drop redundant DESCRIPTION and branch=master
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta-oe/recipes-extended/socketcan/can-utils_git.bb | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> index e2609d4..6114bda 100644
> --- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> @@ -1,17 +1,15 @@
>   SUMMARY = "Linux CAN network development utilities"
> -DESCRIPTION = "Linux CAN network development"
>   LICENSE = "GPLv2 & BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
>   
>   DEPENDS = "libsocketcan"
>   
> -SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
> +SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
>   
> -SRCREV = "665d8699ebe728bf48e63e8ae58d2482db72f954"
> +SRCREV = "da65fdfe0d1986625ee00af0b56ae17ec132e700"
>   
> -PV = "0.0+gitr${SRCPV}"
> +PV = "2020.02.04+gitr${SRCPV}"

Since SRCREV is pointing to exact 2020.02.04 release we can drop gitr+...

>   
>   S = "${WORKDIR}/git"
>   
>   inherit autotools pkgconfig
> -
> 

