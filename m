Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D106746D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 14:39:07 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bj1-v6so6635652plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sTGbn5J7yzEPHS/AivLoTpBbymeUiFh14b7ch1SksIA=;
	b=jgYzMTO80ni02V91Vf0wJwWi+xjb7HoI8JizW5BAdda6rwid6yqJu414ILkeTlLQI5
	l+P8QZo43/P1URNppJBzSswOUl+OE8cBi5emgwwWfc0JXT502fV5+7uwGZ/wm65HvaCh
	3aTjJNExMz6f6uxIZOY0oic50rWWhEOMJR9T6X2fjRp7K95r6Zj5VHSOwbr02WjKNotT
	38pSy+cQMRKJIMOUWsnVy2SjGu1gsoCFCvtbncHmehJF4eqr/WwAf8l/JpyUUdhCzWiQ
	FmlIxUtjjNTY3+PejJNkHrbsVD51lbHEPFnF0zFs0l6tzSeGCV7C/LpgU42bOT3S2MYX
	ysiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=sTGbn5J7yzEPHS/AivLoTpBbymeUiFh14b7ch1SksIA=;
	b=Npf/AiPgf372L6t+h2/VxpgASqqAeat+dQvw4USGF/TOjJHHpB/KlxAW0kk/aKySq2
	D6aqL9NrXquAaF+Cq78aeJ/0yRL/qam1oqm/j6y8qn82jh199gA8SO21qkPe/I2r78eL
	8v6CDWHVhO6owvRbgKzMDJUTVMbBpod3hoW4NsxKFWzj9YsAr1TeJgXZpIxCjRzF1tWY
	GY1wT/GZAYQ3g7VhEobtWDJlYwp4PVgUGeJ1k/xAbdvFeggWhlHG21Esw/vZ6fPXUuPw
	XNANf+uXE1eQvZMwKcZFTpCwX7N6ezk9l/+atUdPeAamIHrsqdq6JHx+mh6yys1BAWzt
	YWZQ==
X-Gm-Message-State: AElRT7E2SnNe6l7Uj3Vg9+eaSzPIF4EItyji4NAAnN2jJKtdnsyIE/QZ
	+lqVjU8J3/keFMT3T5KNNMUTBg==
X-Google-Smtp-Source: AIpwx4/uvZbn6HiV85kzL0j4YfG+t8ThZwc+b9Z3P4I0wiIng4msVeqMB8uNy34d5Z1aMtkzhiftVw==
X-Received: by 2002:a17:902:9a96:: with SMTP id
	w22-v6mr14269399plp.209.1522766348098; 
	Tue, 03 Apr 2018 07:39:08 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a4f3:7c10:9123:63ea?
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	l8sm5148808pff.126.2018.04.03.07.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Apr 2018 07:39:07 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1522740633-13532-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; keydata=
	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
	8CS2NxU=
Message-ID: <edd3c873-d4ea-b162-c933-090b4cebc2d3@gmail.com>
Date: Tue, 3 Apr 2018 07:39:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1522740633-13532-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] wireshark: 2.2.11 -> 2.4.5
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
X-List-Received-Date: Tue, 03 Apr 2018 14:39:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/03/2018 12:30 AM, Huang Qiyu wrote:
> 1.Upgrade wireshark from 2.2.11 to 2.4.5.
> 2.Delete one configure option "--with-gcrypt", since it has been not supported in 2.4.5.
> 3.Add 0001-use-pkgconfig-to-check-libgcrypt.patch, since libgcrypt does no longer provide
>   libgcrypt-config, and provide *.pc, so we should use pkgconfig to check.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
thanks for the patch. This update it sitting in master-next

http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=2442326943253afe678b1653316b8453ed7ca865
> ---
>  .../0001-use-pkgconfig-to-check-libgcrypt.patch    | 29 ++++++++++++++++++++++
>  .../{wireshark_2.2.11.bb => wireshark_2.4.5.bb}    | 11 ++++----
>  2 files changed, 35 insertions(+), 5 deletions(-)
>  create mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.2.11.bb => wireshark_2.4.5.bb} (91%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch
> new file mode 100644
> index 0000000..c2cb078
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch
> @@ -0,0 +1,29 @@
> +Subject: [PATCH] use pkgconfig to check libgcrypt
> +
> +Upstream-status: Inappropriate [configuration]
> +
> +libgcrypt does no longer provide libgcrypt-config, and provide
> +*.pc, so we should use pkgconfig to check
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4b8654a..4182875 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -303,8 +303,8 @@ if test "x$with_gnutls" = "xyes"; then
> + fi
> +
> + # libgrypt (for decryption, MAC, etc. functionality).
> +-AM_PATH_LIBGCRYPT(1.4.2, [ ] , [
> +-  AC_MSG_ERROR([[libgcrypt not installed for development; install libgcrypt, including any development package, for your system]])
> ++PKG_CHECK_MODULES([LIBGCRYPT], [libgcrypt >= 1.4.2], [ ],
> ++[AC_MSG_ERROR([libgcrypt not installed for development; install libgcrypt, including any development package, for your system])
> + ])
> +
> + AC_ARG_WITH(libnl,
> +--
> +2.7.4
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
> similarity index 91%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
> index 5eb372e..d6669b7 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
> @@ -4,14 +4,16 @@ SECTION = "net"
>  LICENSE = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
>  
> -DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
> +DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt"
>  
> -SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
> +SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
> +	   file://0001-use-pkgconfig-to-check-libgcrypt.patch \
> +"
>  
>  PE = "1"
>  
> -SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
> -SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
> +SRC_URI[md5sum] = "2b6f1f37c72fa15a0a1863016a0abcc0"
> +SRC_URI[sha256sum] = "b3b2ec29fba0f4a3a590438abe4054e56f19108d440fc2d61492db9d8ff16fd7"
>  
>  inherit autotools pkgconfig perlnative
>  
> @@ -30,7 +32,6 @@ PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
>  PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
>  PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
>  PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
> -PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>  PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
>  PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
>  PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"


