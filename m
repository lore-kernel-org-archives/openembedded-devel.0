Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E1D0B60116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 14:32:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u12-v6so4501432pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=5i5wpMf47V+SpTZCC07fRcCaNmzqQYQInRgcXM0DA2U=;
	b=GCxocqplL/36n3gU4N1lJTQ/FCsNFgXYtUKEVrENZyEvu40rtpxuMpS0nCQTJrqhle
	/16W+aENUmeZskQR5MbQ87OKnAhI3LA8ZTccpIHTvl/F8/AxWsXjg7//5M91tWGimO/i
	EhF+WY5d+/LdsGCmRGc1TGYGF4cO29bRwWVCbHZ0zQiPDEnIj438txwBJ2u2+i7bgZVL
	XAzcXiRzH+JMPFAFIAVDHNA4HQ2HwI6RKfq5fKB3CfGr2caQeI5ptgUBRX1arg+3ACap
	RkE4sSfHom8FhEW+pJib6z7mmNibCtB0Vo2njkTrBNaZPqVWtULzgQeAboT69NowBbjq
	LqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=5i5wpMf47V+SpTZCC07fRcCaNmzqQYQInRgcXM0DA2U=;
	b=oeiM5bMpEM5NiJX4SDJ7lzwq+1YiR0ATSuD4qwdmKGRijHZOsUHfQA71Ul329z7ZVA
	ibbvAV0LuetJwFxCIyR3Nbc3n3VrSBvXuyoyWRai3E/unMSEzWjBcae4WYtmxGyIOBDG
	9f0Zmsvb9/N5KIMbaHdgAwTapWDq2lMTrtC6vSNm6dy8xGeBY24Iy73gpI+pNVD/p9fu
	4eID+rJo+k3QR9tEzgl2DzkwlFRMxEN1YEI8Dg8em5nusjfv5Ru+hkAqMuZLsTluA6Dt
	zG5dV+P4GFlLh5OQ9bKnxwL9OiKJ3IpHMYcsTqn23p9iX0U9WTVkU97yA/DPrJlO1HoR
	Lchw==
X-Gm-Message-State: ABuFfogR1yluITTv7U9WryUSosoae6ogpisz3XRgXX5rQWo36PZmBb6D
	RbPDzKMBnAarvA+GkFNPTwQ=
X-Google-Smtp-Source: ACcGV60Flu2xXZ042UXEBjgxoBlmcsRtwIwBJC9U3/JOjD1ITs0unlkVlNaLwgDUS/FzlM1iHhWKMQ==
X-Received: by 2002:a63:3203:: with SMTP id
	y3-v6mr1676729pgy.101.1539268371741; 
	Thu, 11 Oct 2018 07:32:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c41b:76c5:1d80:6c9?
	([2601:202:4180:c33:c41b:76c5:1d80:6c9])
	by smtp.gmail.com with ESMTPSA id
	q24-v6sm25662063pff.83.2018.10.11.07.32.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 07:32:50 -0700 (PDT)
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Hiram Lew <lew@avast.com>, Jan Kaisrlik <jan.kaisrlik@avast.com>,
	Lukas Karas <karas@avast.com>
References: <20181011090824.21591-1-brgl@bgdev.pl>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5e1ac02a-64a1-5bec-b120-f286bc53545e@gmail.com>
Date: Thu, 11 Oct 2018 07:32:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181011090824.21591-1-brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [meta-oe][PATCH] catch2: new package
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
X-List-Received-Date: Thu, 11 Oct 2018 14:32:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/11/2018 02:08 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a recipe for the catch2 testing framework. There's a bug upstream
> which makes it impossible to build with gcc7 so include a patch.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../0001-internal-fix-build-in-GCC-7.patch    | 35 +++++++++++++++++++
>  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 25 +++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
>  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
>
> diff --git a/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
> new file mode 100644
> index 000000000..606398afa
> --- /dev/null
> +++ b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
> @@ -0,0 +1,35 @@
> +From 857bf7e83db330682a4c722d0b57be1e4481f4e2 Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +Date: Thu, 11 Oct 2018 09:44:24 +0200
> +Subject: [PATCH] internal: fix build in GCC 7
> +
> +The following error is emitted by gcc 7:
> +
> +include/internal/catch_tostring.cpp:217:21: error: comparison is always true due to limited range of data type [-Werror=type-limits]
> +|      } else if ('\0' <= value && value < ' ') {
> +|                 ~~~~~^~~~~~~~
> +| cc1plus: all warnings being treated as errors
> +
> +We can drop the first part of the if.

Please add the "Upstream-Status:" bits

please review
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> +
> +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +---
> + include/internal/catch_tostring.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/internal/catch_tostring.cpp b/include/internal/catch_tostring.cpp
> +index 4e0c027d..59cc8dec 100644
> +--- a/include/internal/catch_tostring.cpp
> ++++ b/include/internal/catch_tostring.cpp
> +@@ -214,7 +214,7 @@ std::string StringMaker<char>::convert(char value) {
> +         return "'\\n'";
> +     } else if (value == '\t') {
> +         return "'\\t'";
> +-    } else if ('\0' <= value && value < ' ') {
> ++    } else if (value < ' ') {
> +         return ::Catch::Detail::stringify(static_cast<unsigned int>(value));
> +     } else {
> +         char chstr[] = "' '";
> +-- 
> +2.19.1
> +
> diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> new file mode 100644
> index 000000000..ba14a362c
> --- /dev/null
> +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "A modern, C++-native, header-only, test framework for unit-tests, \
> +TDD and BDD - using C++11, C++14, C++17 and later."
> +AUTHOR = "Phil Nash, Martin Horenovsky and others"
> +HOMEPAGE = "https://github.com/catchorg/Catch2"
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +SRC_URI = "git://github.com/catchorg/Catch2.git \
> +           file://0001-internal-fix-build-in-GCC-7.patch"
> +SRCREV = "9e1bdca4667295fcb16265eae00efa8423f07007"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "python-native"
Don't need this if you inherit python3native
> +
> +inherit cmake python3native
> +
> +# Header-only library
> +ALLOW_EMPTY_${PN} = "1"
> +
> +do_install_append() {
> +    rm ${D}/usr/share/Catch2/lldbinit
> +    rm ${D}/usr/share/Catch2/gdbinit
> +    rmdir ${D}/usr/share/Catch2/

Please use the variable "datadir" instead of hard coding.

- armin
> +}


