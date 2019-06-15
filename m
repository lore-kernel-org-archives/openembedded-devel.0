Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 69D027E9E1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 18:08:01 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l19so3409912pgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 11:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=MRkGG3aPqRuXBbcy2LuCWVgciRW/cUUFG94aCAiH4h8=;
	b=pyJtxdJJAVIWEN/eelqTC3NoDhFHAF5q0R/mKCJNhS8+DrDGabFavgv7Ajcbogp1hr
	1c2oRmL1taxUDSjD9pOYc6tT/3VRLaiLgWvSUoFlDj8zgUVd3Gxp47k0NaZMuawsadcm
	nMohVsP651e1tTE8NceqE0L0tZFtYmCkJvMGJ91dQIPp4155wELtaqk8b34Lv45wPOVt
	NrXbTXnejdgLBgLL26T5SpHf+EM9kFcGZjxLM4naPMpsxr2GVM5xGuJ30OLl/Xq1R9qZ
	nRK8OBdg700WhiMAjIyNYclGdgns5PpVSAdhR1p5rmHOQldyZnXU2vsFX5/6UTt4htVu
	zk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=MRkGG3aPqRuXBbcy2LuCWVgciRW/cUUFG94aCAiH4h8=;
	b=rsuAhA1/6sDHwdx3u+n4ycCFO4ZLCYe4bONkSkWfp9giTlFpaqZ+IAknjZTup5g6m2
	kpkpxCEkP/QgNFNUItJkVDNv0dm8Jjm24AWnw34ZSBgnvNDmsccjDz8jDb4Ub+9jr521
	WgOt46Xxp7DvVc8afGpyfNiM+ZVz73shZgsNM5/x4Xi1D/dgXAh/KFc0zVV9G/e6Yots
	QSkUijgyOTqzUqZ5bOgsF71p5bSFOt7oAda8OmGt64FMAGzk4oLeMnLN9pPW0ZprrQgZ
	ABJoUCxxMuRyqaULO5Iep3M13vdeGD34sqs3jy8IxAR7NznUv88Ay+fV5hCE/gIaqNYf
	VG5A==
X-Gm-Message-State: APjAAAVYgA5xmVvorshZ9g+4TDqoSRpGb5H2JBaOL51d1B3x/xo5M6OT
	VmcPhLfh7a24NJSlC+a2umLP+Y+4
X-Google-Smtp-Source: APXvYqy2E+BLEfVZoYTFHY9+b4/PHkWXa7N/GJPPdr1wea9l0JwDYzP96OrBUjcTHeiO+VxavRyR/A==
X-Received: by 2002:aa7:9ad2:: with SMTP id x18mr25220091pfp.192.1560622081977;
	Sat, 15 Jun 2019 11:08:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5942:80bf:dc9c:15ab?
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id m6sm7755837pgr.18.2019.06.15.11.08.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Jun 2019 11:08:01 -0700 (PDT)
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <1560475578-28568-1-git-send-email-yi.zhao@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dfda746c-9a6c-6d06-8d2a-38256bccb179@gmail.com>
Date: Sat, 15 Jun 2019 11:08:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560475578-28568-1-git-send-email-yi.zhao@windriver.com>
Subject: Re: [meta-filesystems][PATCH 1/3] fuse: upgrade 2.9.8 -> 2.9.9
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
X-List-Received-Date: Sat, 15 Jun 2019 18:08:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/13/19 6:26 PM, Yi Zhao wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

is this a bug fix only update?
> ---
>  .../recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb} (94%)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> similarity index 94%
> rename from meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
> rename to meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> index caa75c7..c83e7f6 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> @@ -16,8 +16,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
>             file://0001-fuse-fix-the-return-value-of-help-option.patch \
>             file://fuse.conf \
>  "
> -SRC_URI[md5sum] = "f365e848a82504edb0b7a33df790ca78"
> -SRC_URI[sha256sum] = "5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3"
> +SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
> +SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
>  UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"


