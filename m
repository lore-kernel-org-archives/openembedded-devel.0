Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id DCC5A7D903
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:29:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y7so2932136wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=G/imzYFdc60JoLzMDH3kKL51u/h8MVGlGHwtd7QRquY=;
	b=cRtcIiMW3mIwkHjjU+SZXU8w16Fimq7Ido5P7lJUVrOLQduwYwZb34cl0UGnAQQ+EV
	6xLtJtF9xlHFfsaZDwyW3zitb3KWEwVgVXoALx+dISFeyWK1Krdr0lDwYZ12fCCkFrEB
	HQriljK05HWxITrSoU8U8jVnNuWAlhEijTx4CcXFzhgha1nWNpkT3SPB9lDZl4pUPjGa
	ciqqmDF5PV8a4w6tHYUDqtLhrUEliIs2F8q57zzc7MLbyI/wSq/uZPhnUonkSno5R8Zc
	GghWhKaMFQMtDRZQd4cVkeoEWrq0oNS3nnuSl/pIvR4DB6/JPelczPYnOQ90igp/9aH2
	R80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=G/imzYFdc60JoLzMDH3kKL51u/h8MVGlGHwtd7QRquY=;
	b=tXd805aWuC0LnZGRlkJAxDL7OMdV1nBUp7R70UWfylfjwgmrnf+x32PeD/8LXTwuAx
	iALsRvbfIqT4ZBKIJsrCximvEgtmlK7R6EuQMc9y07VegiAGKAns8tHBJfxy2g19O/Mh
	aTwp09zhesfPTeZTfxx/9u67Dtb1MroIr+pmIE83B3aQDcKgYpgVwIJiecDykoc+5Ns+
	a4o7npPIUigG5Pm8/YbLJiwjB8sC4M6dflSZwFtezVBrjl+NhGtqBK4CSzAZfbEDTADM
	melF1yso1Vi6zvm0RnJE+g1pRRFJbmIVPaG6uKu0EkI6nbZZl0WTHFfHfOwOiRaTNcSx
	iWwQ==
X-Gm-Message-State: APjAAAU/gHFMLI8lkEy4HrBvNgenuoHO1bMKQbqWzVrDpM/+nts9ANVm
	S7t3C8Pr0vl8NIINI/3jkCviRehDcso=
X-Google-Smtp-Source: APXvYqyQ8OI/5ByBlK/N5I4Neav64T9Y1k++u41pLCbNSGMOG2Nwu790uwP0f6OfxiR0uyVv4mr8AQ==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr28297275wrq.224.1554902955344;
	Wed, 10 Apr 2019 06:29:15 -0700 (PDT)
Received: from [172.16.50.58] ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id
	z13sm55219121wrw.36.2019.04.10.06.29.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Apr 2019 06:29:14 -0700 (PDT)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <20190410064405.28359-1-zangrc.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6082c069-8aa9-bbd5-7202-598800e7d43f@gmail.com>
Date: Wed, 10 Apr 2019 18:59:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190410064405.28359-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking] [PATCH] wireshark: upgrade 3.0.0 -> 3.0.1
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
X-List-Received-Date: Wed, 10 Apr 2019 13:29:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/10/19 12:14 PM, Zang Ruochen wrote:
> -Upgrade from wireshark_3.0.0.bb to wireshark_3.0.1.bb.
How is the graphical aspect of wireshark being tested?


>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../wireshark/{wireshark_3.0.0.bb => wireshark_3.0.1.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.0.bb => wireshark_3.0.1.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
> similarity index 95%
> rename from meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
> index dc55e3de0..572dc1a45 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
> @@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
>  
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>  
> -SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
> -SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
> +SRC_URI[md5sum] = "370a113e1c8ec240c4621cfb5abb0c52"
> +SRC_URI[sha256sum] = "86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c"
>  
>  PE = "1"
>  


