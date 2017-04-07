Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id D3A2777E44
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 19:16:01 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id s141so11270816lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 12:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=gTmkj+rpo5WVSblTNercFBGaa0s3ekvdPWROPzNogSQ=;
	b=bKxuVCLverDnqg4SZwrVxOUz0laHE2FZPQsf+UKG89KnkUJ+9Pr/4GJmxVMnw2owH5
	+4u88beNrshoYfxcgLpJOs9ppC1Gy0XLVC2tuG4PEy/Ga4POkPnekacG73dSK+/do2th
	5lUm9TiqJRngHlPJdaLlakuTzq/sfv9OFUhJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gTmkj+rpo5WVSblTNercFBGaa0s3ekvdPWROPzNogSQ=;
	b=g67HJwlmqyPZ143ez6efSKTASJBIdMo7iMv7tK5yWCcDQcsyNGjjoAZlEmbC2yScVQ
	aZFl5AJcMIji3NUrQ7aFEjRXWOOs1Rx0yvwVA2zuePxuDvoVY1toY/Mm3SHGITnsxQ4L
	+1SFmuZNepjjMXjolF88+s/N8NyPxnUq/H3Iyeym6VFMAwK5Yf4dZV/nQZ59MkqYHvey
	2t/Ug3fZbim/QUxG4BbiYqkHi7vdz9eCgyxRT6bUdIyDiknOEYoRcA7/4UctruauEltP
	2NmJ+ceOYod1F6gP3Ao0Yfm9tb59PqcbwZWXkW2vayTMo2I1tH9wH2XHQy/hhMSiTnoB
	nyqA==
X-Gm-Message-State: AFeK/H1ymZ8qaLyAa7bCdHLiWZjyZ+B4nSohla9kw6KxqTksY7jvkrc+GrH7cMjASD6+Jwz8
X-Received: by 10.25.77.2 with SMTP id a2mr14836623lfb.143.1491592561975;
	Fri, 07 Apr 2017 12:16:01 -0700 (PDT)
Received: from [192.168.11.27] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	i1sm1129221ljd.47.2017.04.07.12.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 12:16:01 -0700 (PDT)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <58E7E570.6070406@linaro.org>
Date: Fri, 7 Apr 2017 22:16:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
Subject: Re: [meta-browser] [PATCH] chromium: fix null pointer dereference in V8 with gcc-6
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
X-List-Received-Date: Fri, 07 Apr 2017 19:16:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2017 09:40 PM, Andrey Konovalov wrote:
> This patch prevents "Aw Snap" error when loading a page with JavaScript.
>
> Tested by running:
> - chromium-wayland on Beagle X15
> - chromium-wayland on HiKey (with a separate patch to enable aarch64 build)
> - cromium on dragonboard-410c (with a separate patch to enable aarch64 build)
>
> Based on the fix for Gentoo's bug 588596:
> https://bugs.gentoo.org/show_bug.cgi?id=588596#c10
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>   recipes-browser/chromium/chromium.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
> index 60edccb..7e057ec 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -15,7 +15,8 @@ CHROMIUM_BUILD_TYPE ??= "Release"
>   inherit gettext pythonnative
>
>   ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
> -GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
> +GYP_DEFINES += " ${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \

Oops, by occasion I've added an extra space before ${ARMFPABI}. I updated the pull request in github, and
can send an updated patch to the list if needed.

Thanks,
Andrey

> +	${@bb.utils.contains("AVAILTUNES", "mips", "", "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"
>   GYP_DEFINES_append_x86 = " generate_character_data=0"
>
>   do_configure() {
>


