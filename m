Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0B977D16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 18:03:25 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id t78so3439025oih.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=0grGnoxrUjs05gV2MkFO/E6Ni2aKwn4Ju2//RXNIekc=;
	b=boZm0yHxfKyMor1hzgN+sKlLIAjmYKNqZ92kiiRHNrCc1fB0Ze+KRCESvDbg3xjB3Z
	FhrL+o/jEWHwKCSyenJSezfK6Q4D8e/hMryV9mgfZU8YgkDITf3+P0lSUe+vje0Mngsv
	t1S/ON5WmGmfKd4g9xwPa4eVd5sHWH1SjkCt5HTxKSixKjK4exN8YHHxhfiRJ5bsvsl/
	d3WPe2cO5+fhzSUfuwJDPpYsuygWn+bXmCGbXKC0Y6WbIPo8FKuDu3FR3318VqusvOKb
	uwphzoJEIuJOB524CfqRyAoaRMJfhZK6uRYiZQJLXV+XGfRNG6UFihyVgxnXR64RQLII
	SpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0grGnoxrUjs05gV2MkFO/E6Ni2aKwn4Ju2//RXNIekc=;
	b=ewusP1VSflu8183Ivj7d4ZS/uCqNOnWrOhxmLgkBnzymKodhDyhf2uSgFFNLht0gLM
	KJmwK1dr3+Qy2dWub5PGMbxGZuukQX9kguiXH3tw6tTQEnLYszvj63Cvmgsfg5AdpsGS
	Ev0zFVlOabkyl4BMO+4MefTagvAbaU3I2TQ9a0+uK8PUwLA+d/SxPg4VMsXuH1bXaXql
	zP1EZFcfDbbeYcHCHJG6TLYLw0cTMDus0y5JSnh9AyJUI+QmpN7oCwnMUd+D3j0jyAht
	XrFYi1G1cizKnEtX4p+7Nd4Vqx1r5rxSUvyyUtpPEYaf9h71t9RMRUfAjH7E1X4MayMO
	oh1Q==
X-Gm-Message-State: AKwxyteYovV6r80NP/nBZkKc37pGsi4IbkP+PGHgkKtA+DXoKnvIUhx5
	V28smDtqX6ewk79pSWiNc/UNw8RD
X-Google-Smtp-Source: AH8x2266RyH/XJe6Znzm27cGnGyXdMau9Al7LvI7bNR2MKniA6xdiyPvaDKcwbyrIfI2Wo7VJ6Uo3g==
X-Received: by 10.202.46.70 with SMTP id u67mr9032508oiu.267.1516817006040;
	Wed, 24 Jan 2018 10:03:26 -0800 (PST)
Received: from [172.27.88.46] ([217.140.111.136])
	by smtp.gmail.com with ESMTPSA id
	z94sm1515789ota.26.2018.01.24.10.03.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jan 2018 10:03:25 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20180124104215.5132-1-hainsvdbosch@ziggo.nl>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <69e8f774-6239-2372-53b4-cfaefe4e1d3c@gmail.com>
Date: Wed, 24 Jan 2018 12:03:24 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180124104215.5132-1-hainsvdbosch@ziggo.nl>
Subject: Re: [meta-oe][PATCH 1/2] smbnetfs: update to version 0.6.1
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
X-List-Received-Date: Wed, 24 Jan 2018 18:03:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/24/18 4:42 AM, Hains van den Bosch wrote:
> ---
>  .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch             | 2 +-
>  meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
> index 152507cf3..55275669b 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
> @@ -3,7 +3,7 @@ Index: git/configure.in
>  --- git.orig/configure.ac	2014-06-18 16:06:16.040721349 +0000
>  +++ git/configure.ac	2014-07-18 07:49:17.085552256 +0000
>  @@ -1,5 +1,5 @@
> - AC_INIT([SMBNetFS],[0.6.0])
> + AC_INIT([SMBNetFS],[0.6.1])
>  -AM_INIT_AUTOMAKE
>  +AM_INIT_AUTOMAKE([foreign])
>   AC_CONFIG_HEADERS([src/config.h])
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> index 0fcfd6ae7..fefc04538 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> @@ -15,14 +15,14 @@ inherit autotools gitpkgv pkgconfig
>  
>  PKGV = "${GITPKGVTAG}"
>  
> -SRCREV = "21c63ed60202e5540613d4c822a57a0b81764499"
> +SRCREV = "bc6b94b015fdaf7c4dab56ccb996eecea8bc4373"
>  
>  SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
>             file://configure.patch \
>             file://Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch"
>  
>  PACKAGECONFIG ??= ""
> -PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"

you need to mention why this is dropped

> +PACKAGECONFIG[libsecret] = "--with-libsecret=yes,--with-libsecret=no,libsecret"
>  
>  S = "${WORKDIR}/git"
>  
> 


