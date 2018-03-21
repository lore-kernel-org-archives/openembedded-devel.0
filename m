Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 767A978991
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:48:26 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id c11-v6so3251589plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=HlgURkU6CZxXDMKP7yQR8xlyrdF7NNkvUk1ZyfW+KrU=;
	b=MIQKrBxQbIdlKEM9CqoCyTdGD/O3t7tqpQwUWXM8qkCqiL4WMkDnA+YL5O/ydY8qfB
	3pkohwdYIY7RH0V9BVzdVZzrd+QywbxuZzSKgXa99TkNiTulRg8zAISzHlcgTTB2hR/l
	3BLjR3o3FUvU72+jgIF6sEV3x6MLIW5xIQKuAodkZG0m/nV/mmNBqXYti6pEY18XMFXp
	4rSlmgXZon2db23V2UhMNU3o8Nde36tdnQQPpwDw4uybuVpANP9Jz/heMEFuTqjup+hx
	JjD5lrsYhshQK7bv8hODZpctsu62UP/lm6/JjpYxLMf9L40egYM2AquvY28agTaE5asg
	3H8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HlgURkU6CZxXDMKP7yQR8xlyrdF7NNkvUk1ZyfW+KrU=;
	b=DZzBduyT6TXGBLvIY/KUk+JyzBZAzspRS8WLQ4h308rgs1N6n/9XhPPNF94JzYZZ3V
	lBZtBIwVx28Y7YhHWiCpyoPKinGtExykkQQ4Y+n5gCkIW0AVY8TdttYMxvS5ebfB2DoB
	f7eaIA3pMYBW3moxYJM4WuFnX9be5yWGt4CRhHtuTkjBRYay4k+xPSj+qoKHk2oDNlI3
	89rNeSI2JOVN7d0PbA6cA1ORoqrC4LOfSkkNQQ4p8jyY0idTIsEQjFWLzSSuXrtYF0cJ
	AQ4LKNOGQe9Byd6iku792OWdSPeBaM66MatW2YuttMJleAXs63cFpC34ZYGVmLPYFWDl
	3udg==
X-Gm-Message-State: AElRT7ELz3nqYpgblWDTyLYZJuRevSXoT1xdr0Ww7I22eWTjughKk7OD
	XWYtc9/Py9+WTZxXxDl2IO4mUg==
X-Google-Smtp-Source: AG47ELsse3uk48cpuRa645qFm4hIAeG9NkD2D4CFng/CjlWU+FdGPWeXH9tK+6fdNJuhxVXd6Kg2LA==
X-Received: by 2002:a17:902:8c96:: with SMTP id
	t22-v6mr5364082plo.213.1521643708321; 
	Wed, 21 Mar 2018 07:48:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a1c1:eb3f:f249:aed1?
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	68sm8898475pfx.130.2018.03.21.07.48.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 07:48:27 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521603377-34881-7-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d7e16b7f-ce38-3233-f5b5-746a28a6274f@gmail.com>
Date: Wed, 21 Mar 2018 07:48:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521603377-34881-7-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-python][PATCH] python-cryptography-vectors: 2.1.4 -> 2.2
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
X-List-Received-Date: Wed, 21 Mar 2018 14:48:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/20/2018 08:36 PM, Huang Qiyu wrote:
> Upgrade python-cryptography-vectors from 2.1.4 to 2.2.

I am seeing:

ERROR: python3-cryptography-vectors-2.1.4-r0 do_fetch: Checksum failure
fetching
https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-2.1.4.tar.gz
ERROR: python3-cryptography-vectors-2.1.4-r0 do_fetch: Fetcher failure
for URL:
'https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-2.1.4.tar.gz'.
Checksum mismatch!
File: '/home/akuster/OE/downloads/cryptography_vectors-2.1.4.tar.gz' has
md5 checksum ef115b870cc8d8b9f0f4189b512bc170 when
303a08ff50a5590d0ba05252981417ee was expected
File: '/home/akuster/OE/downloads/cryptography_vectors-2.1.4.tar.gz' has
sha256 checksum
78c4b4f3f84853ea5d038e2f53d355229dd8119fe9cf949c3e497c85c760a5ca when
cf601c7d87ad6a938bcea29062375dce1d3e26dabd1db52bbc37eeaf4aac970d was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within the
recipe:
SRC_URI[md5sum] = "ef115b870cc8d8b9f0f4189b512bc170"
SRC_URI[sha256sum] =
"78c4b4f3f84853ea5d038e2f53d355229dd8119fe9cf949c3e497c85c760a5ca"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.


please double check

- armin
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
>  ...yptography-vectors_2.1.4.bb => python-cryptography-vectors_2.2.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.1.4.bb => python-cryptography-vectors_2.2.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> index 00bb87b..31461ec 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> +++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> @@ -8,8 +8,8 @@ DEPENDS += " \
>      ${PYTHON_PN}-cryptography \
>  "
>  
> -SRC_URI[md5sum] = "ef115b870cc8d8b9f0f4189b512bc170"
> -SRC_URI[sha256sum] = "78c4b4f3f84853ea5d038e2f53d355229dd8119fe9cf949c3e497c85c760a5ca"
> +SRC_URI[md5sum] = "303a08ff50a5590d0ba05252981417ee"
> +SRC_URI[sha256sum] = "cf601c7d87ad6a938bcea29062375dce1d3e26dabd1db52bbc37eeaf4aac970d"
>  
>  PYPI_PACKAGE = "cryptography_vectors"
>  
> diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb
> rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.bb


