Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id E4EA275D07
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 15:19:40 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so133261912pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=D5xj+2C5GECQb7Bv99kJoZNil9tUViGHfck0YHlBOqc=;
	b=ww8wueoP8CB+38ePZoh0IvYxD+aa2nK1MUBxzfSHmIAUDS2I8O0Wwqv7E1/EOn1WTE
	C7Bmgob3sgYCdAxG3VFbYV/G4p0TbtaBN6qnXltGx42rKwdo1RyTukZtjDNqCh1GCtfm
	bygfxb9Ezh93jZv66V24LV20UJQIBx8fuNNDo1NWA4svSRhTvadzjtLGP4ISFk78aUsm
	CL2AT/3J9CZVsXuxt0+o+0tlYjG+EN7b78uIJGGKIgME1R0hlupwoBax/LqkLCPIGAhV
	7O++Y4LiDWAZKyU7JKIwtSkJAhckL/wciAo/fJeKXoq7UpFL0xpTV7NVQPfxiCq6ZJoa
	9RtA==
X-Received: by 10.70.130.34 with SMTP id ob2mr3385138pdb.15.1436368780556;
	Wed, 08 Jul 2015 08:19:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:202d:ddf7:682b:65c6?
	([2601:202:4000:1239:202d:ddf7:682b:65c6])
	by smtp.googlemail.com with ESMTPSA id
	vl1sm2870198pab.21.2015.07.08.08.19.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 08:19:39 -0700 (PDT)
Message-ID: <559D3F89.7020106@gmail.com>
Date: Wed, 08 Jul 2015 08:19:37 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1436341215-1648-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1436341215-1648-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] libssh2: upgrade 1.4.3 -> 1.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jul 2015 15:19:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

is is possible to include a reference to the security fix?

1.5.0 release
Security Advisory: Using `SSH_MSG_KEXINIT` data unbounded, CVE-2015-1782


On 07/08/2015 12:40 AM, Li xin wrote:
> Update the checksum of COPYING,since the date in it has been changed,
> but the LICENSE has not been changed.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>   .../recipes-support/libssh2/{libssh2_1.4.3.bb => libssh2_1.6.0.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-support/libssh2/{libssh2_1.4.3.bb => libssh2_1.6.0.bb} (60%)
>
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> similarity index 60%
> rename from meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> rename to meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> index b537663..022482c 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> @@ -5,11 +5,11 @@ SECTION = "libs"
>   DEPENDS = "zlib openssl"
>
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d00afe44f336a79a2ca7e1681ce14509"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
>
>   SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
> -SRC_URI[md5sum] = "071004c60c5d6f90354ad1b701013a0b"
> -SRC_URI[sha256sum] = "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad7d6dc1d5d021b96d"
> +SRC_URI[md5sum] = "00aabd6e714a5f42a4fb82ace20db1dd"
> +SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215"
>
>   inherit autotools pkgconfig
>
>

