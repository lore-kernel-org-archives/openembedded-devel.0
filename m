Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F16661687
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 17:08:47 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q4so44372pls.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=kEP0ZzAPcbfvjlqie9GbewpTYNdwbdGjK50O7qmdsfg=;
	b=jIf4Tf/MVV8D3xE8+YOBOZL9lgGjQxg2bQ3qjwtzFH/sz42Yezg3YgdmbsPBMSaHin
	pEYCRkHtaRVoBaPMBXA6p/q7eFopmcECcxV2sFnNOepp2lvjVgPim7/U3Q4OO0sEyZlX
	IBuj8cZKj11HsiD9XhvEGtoHjq5QQnfEMGzWo2pcBwm03Ar+11wW8J5q5mmzDgvmj8ox
	HEcMUkK5dqnHKv7bNjvcVGFg93ueU2IAEu8AtGn7usMoP8lbsxmuMNher4oFYnGNlW32
	JfRlxXRoS7h3lZ9HbAD+XwlIjZD2OU62J9VbY84uMlQIKH4w1jUiRNoq50HiEQmTn3Tz
	ZZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kEP0ZzAPcbfvjlqie9GbewpTYNdwbdGjK50O7qmdsfg=;
	b=Yn2Q63WZJBj2ydolkXO15hFQx4+7D0THbzLhX+QdsRou5CvsSCV63QEkpL7zqvyg8W
	lgvooZoaA0nYCpV1cV/sLShIHWJVzDpffXsEDew8vie1NdqP5dOSuP9EvCXf1ZJje5Jm
	0mHF200GtbED/Nkfw6xHWr6LxTBDv6GfFnrI0rdi4GwX4/IlJC06jDc2fQt26T0p5EIO
	2lTpVHKkVzsAUyd53NKTNcZzOYosHNyLbeGlRz02yLp+xqIQ4vam27MnkgnKt+cKvwnY
	nycpwXaGXqRbd/GnL3YjgotSaUNpRUjlEGGU6YBDkwMNLHgfaFIbpRGALmIDrEy07fF1
	/Ocw==
X-Gm-Message-State: APjAAAVv0cK6UKNS9nXxmkzDppxGuHXpsvLoKa3sqytWaAYrN8s5mVcG
	0OtzBW6qtKmPwum7UXfbfyhOHzbGL4U=
X-Google-Smtp-Source: APXvYqzLO1x6izd+RISvz3+oC+2ncYiZemLrtnqz2O8fsFKaADLNpqJmvrA7tFjXj2TPypio6w0Qqw==
X-Received: by 2002:a17:90b:f0f:: with SMTP id
	br15mr714909pjb.138.1582823328187; 
	Thu, 27 Feb 2020 09:08:48 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
	([2601:646:9200:4e0:19c7:2796:79bc:80ea])
	by smtp.gmail.com with ESMTPSA id
	a10sm7116403pgk.71.2020.02.27.09.08.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 09:08:47 -0800 (PST)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <20200227164143.24022-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <903a8d79-9298-5f7e-db68-d3e15c62121e@gmail.com>
Date: Thu, 27 Feb 2020 09:08:46 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227164143.24022-1-git@andred.net>
Subject: Re: [meta-multimedia][PATCH] meta-multimedia: s|${COREBASE}/meta/files/common-licenses|${COMMON_LICENSE_DIR}
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
X-List-Received-Date: Thu, 27 Feb 2020 17:08:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi André

Thanks for doing this cleanup, but perhaps subject could be more simple 
and readable and this detail of sed operation could be in details.

On 2/27/20 8:41 AM, André Draszik wrote:
> Signed-off-by: André Draszik <git@andred.net>
> ---
>   .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
>   .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 +-
>   .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 +-
>   .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb     | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> index cee386c2a..70eb6e4be 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Big Buck Bunny movie - 1080P"
>   LICENSE = "CC-BY-3.0"
>   # http://www.bigbuckbunny.org/index.php/about/
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
>   
>   SRC_URI = "http://themazzone.com/big_buck_bunny_1080p_surround.avi"
>   SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> index d395b9206..df2368996 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Big Buck Bunny movie - 480P"
>   LICENSE = "CC-BY-3.0"
>   # http://www.bigbuckbunny.org/index.php/about/
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
>   
>   SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_480p_surround-fix.avi"
>   SRC_URI[md5sum] = "ed7ed01e9aefba8ddd77c13332cec120"
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> index 20d562749..cb8ece0cb 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Big Buck Bunny movie - 720P"
>   LICENSE = "CC-BY-3.0"
>   # http://www.bigbuckbunny.org/index.php/about/
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
>   
>   SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_720p_surround.avi"
>   SRC_URI[md5sum] = "0da8fe124595f5b206d64cb1400bbefc"
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> index 0582a4856..04cbd2e34 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Tears of Steel movie - 1080P"
>   LICENSE = "CC-BY-3.0"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
>   
>   SRC_URI = "http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/ToS-4k-1920.mov"
>   SRC_URI[md5sum] = "e3fee55b1779c553e37b1d3988e6fad6"
> 

