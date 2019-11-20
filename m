Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0B5605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:57:15 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o17so8566qko.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kp8G2SZ0N22v491dHBFnoOnHpBy6VexOJKCCO8nzmdI=;
	b=AfTO5XC9n3XqyHo3yi2fOb1fB2BXk2oCCOGs3ABzG1sgJbRCsUTRAHdoaEET/Ghh8S
	lzY9ofs/yj+j6nlwy7kykKbHtAIU3VeD5i03GfwCw1TXll6OWCEe8USBqkuVnR6yinUD
	tl7cPn9DBC54AnSW8wUuY6DNgJsBGCcA+qRtEyfsClbJuXOqcd+WPvF0nYtrs4XtoSuO
	XA2t/PJZC2R+hJ5VSRDMk0xgO+0kUrC/mD1Q4VqGgEYkBp1iJwHVfA4Z14K9rVYH70lo
	TBxrBVOWdV8+j81J3hCMkFs+eAQVAj3vOmbAMY4+d3kS3UqnCCa3IN7IoRd1QorxqepL
	qDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kp8G2SZ0N22v491dHBFnoOnHpBy6VexOJKCCO8nzmdI=;
	b=oSNe5hvMKE9lc2kSCG4SBIIZUACPPg/SFOGyxjo2yFIRrLOU3sqxaCsCneJ1xmszuU
	clk1zmYeaAqftOf0XWz6YT223mntP9lHqn8Ut+jN1/uXufhTX/XDUOzK7eUi5Vk667XC
	NgGNNt5G+ZGJW7Zih14IcVniX2gb+SFM2Qzt9w1ynArYHhjHhhScbOn1j7AHx80CbXX1
	egcCWu2Wvasu7+4QMupHJR8ABfCWZoyAC3eNLIkdsuAYH45QqLmCqs+mTM9FbAECdLBR
	/Ulo5gUxMGw2jubGlIq3gc1HPZl3mvyAkh7KfUybXxzYjtBSOQScxoQdKH+msXYWHea5
	CclA==
X-Gm-Message-State: APjAAAWfAHu6Lno1NrE9+oiKhKZpBPoOlysj8a3wYsQtxvCtiEuBkxve
	brTQqNGadfnYVVXva6jvrffnIA7kAVH7Smfu274=
X-Google-Smtp-Source: APXvYqyvDIc2TBE5uEpd2jBA/K2rpDKM9aMvdDzsqKwFFXlyXN6ed5aQyHC12585icTXuVA9vQFFByhJKhxgXbtMz9Q=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr2464663qke.9.1574261835568; 
	Wed, 20 Nov 2019 06:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20191120072939.29856-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191120072939.29856-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2019 06:56:48 -0800
Message-ID: <CAMKF1sqw+V_snY4jWJpv3+PWnHT=Sh+QZUbPKd4tSiEvztT1kg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-tzlocal: upgrade 1.5.1 -> 2.0.0
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
X-List-Received-Date: Wed, 20 Nov 2019 14:57:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 19, 2019 at 11:29 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-tzlocal.inc        | 4 ++--
>  .../{python-tzlocal_1.5.1.bb => python-tzlocal_2.0.0.bb}      | 0
>  .../{python3-tzlocal_1.5.1.bb => python3-tzlocal_2.0.0.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-tzlocal_1.5.1.bb => python-tzlocal_2.0.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-tzlocal_1.5.1.bb => python3-tzlocal_2.0.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-tzlocal.inc b/meta-python/recipes-devtools/python/python-tzlocal.inc
> index 42f93e6a5..7c2ad2471 100644
> --- a/meta-python/recipes-devtools/python/python-tzlocal.inc
> +++ b/meta-python/recipes-devtools/python/python-tzlocal.inc
> @@ -3,6 +3,6 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
>
> -SRC_URI[md5sum] = "4553be891efa0812c4adfb0c6e818eec"
> -SRC_URI[sha256sum] = "4ebeb848845ac898da6519b9b31879cf13b6626f7184c496037b818e238f2c4e"
> +SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"

trailing whitespaces in above line, i fixed it this time  during git am

> +SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590"
>
> diff --git a/meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb b/meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
> diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

