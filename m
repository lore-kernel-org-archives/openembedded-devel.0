Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC4B77C156
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 22:20:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b3so6139535plr.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oI3PdnuNGTfYA85QVsqJ1gdRaIV5WsG6Q2/+IRaxJzM=;
	b=oKuBS+5FGf+yH7K0ONnCNhbGN/r6TyyxfLoaStzPuQ93zQb5vPX44YdTkFjyTJzzU4
	oKoRSZIAkQ7jllY7HwzVSfyXvW3/0mLOhiAn7TapPn4u7LhlLYsRpxtef60t507yc/ZJ
	TNrsgvKGi7GxUAEwmh9ttQu26Bf+lrvh7/0uj0NF+wxujQqoMCtpXIWmOvk3S2AlNfW2
	MrPM7fA6vcffuE/oBpVrOpEosp0sfRBLl3mn7WdmjTq/nhfsceFEejyodn73h1ZdQE4l
	aAv/rGCT4mLL4urk3wGUTbAH5iJ31qYmfHxgLR4qkxPefTJg0uLjAG3JfvTkJzL3bxo0
	lCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=oI3PdnuNGTfYA85QVsqJ1gdRaIV5WsG6Q2/+IRaxJzM=;
	b=JlXk1xYTgMFXMfmJCYYeXbXJ3/6mC/hZefs7OExNw9HsIEsEVmyYF2rFX3SlUH55fY
	NtPGFqXdFqDIeodTGwUkOsnLVYJMHI9XKGW6tRhRnEEc9qTf84X7o5Z1uPRompLl54PZ
	9uh9eCdPh5U2EETi7/onhaKVpIELzQWNEBWK2qnCpdgw7AEizihRGjqCNnidcoMfogab
	y2s5lH0GsLqxsltDQrbDpU4pukL3k0ZbueuCwaiAUvvjm8biuNgwwGELCS8fUHrKNj41
	sQile2I2ariklrio+LKlEl1jKBV/Y3zhYjWvAQSlGnjdNkiV040ZsLNaRcxFz5mIM1N5
	KBLQ==
X-Gm-Message-State: APjAAAVYwwXO1hzLeIb9Ns4gVOhTXOyz/YDbV8jAUMQObMlgfb52FP7l
	6fgtdZf6Gjt8eMN/gOjTzd9BHgsGc6I=
X-Google-Smtp-Source: APXvYqwI0tHrN/T27bF1qlA60cwqpHnV4Ek5baVFLvK+83Y3oAKbPn8jWJAB1P44U05x1BtnvaOU3w==
X-Received: by 2002:a17:902:703:: with SMTP id
	3mr26883630pli.224.1554675624559; 
	Sun, 07 Apr 2019 15:20:24 -0700 (PDT)
Received: from [10.240.241.171] ([116.212.180.67])
	by smtp.gmail.com with ESMTPSA id
	s15sm32601013pga.71.2019.04.07.15.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 15:20:23 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190407151106.19592-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d13e7125-b788-28e8-399f-8bf2e0babf5c@gmail.com>
Date: Mon, 8 Apr 2019 03:50:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190407151106.19592-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-networking 1/2] drbd-utils: update to 9.8.0
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
X-List-Received-Date: Sun, 07 Apr 2019 22:20:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/7/19 8:41 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...tools-only-rmmod-if-DRBD-is-a-module.patch | 43 -------------------

missing not about the above patch being removed.
>  ...rbd-utils_9.5.0.bb => drbd-utils_9.8.0.bb} |  7 ++-
>  2 files changed, 3 insertions(+), 47 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
>  rename meta-networking/recipes-support/drbd/{drbd-utils_9.5.0.bb => drbd-utils_9.8.0.bb} (91%)
>
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
> deleted file mode 100644
> index c0f3adf24..000000000
> --- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Subject: drbd-tools: only rmmod if DRBD is a module
> -
> -Account for the case if the DRBD drive is built into
> -the kernel. Otherwise, errors, like the following,
> -will occur:
> -
> -root@localhost:~# /etc/init.d/drbd stop
> -    Stopping all DRBD resources: ERROR: Module drbd 
> -    does not exist in /proc/modules
> -
> -Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/2]
> -
> -Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> -Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> -
> -[ refresh to 8.4.4: squash Aws' and Jason's patches ]
> -Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> ----
> - scripts/drbd | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/scripts/drbd b/scripts/drbd
> -index 20bf628..de589dc 100755
> ---- a/scripts/drbd
> -+++ b/scripts/drbd
> -@@ -241,7 +241,9 @@ case "$1" in
> - 		if [ -d /sys/module/drbd/holders ]; then
> - 			(cd /sys/module/drbd/holders; for tr in *; do [ -d ${tr} ] && ${RMMOD} ${tr}; done)
> - 		fi
> --		$RMMOD drbd && break
> -+		if [ ! -z "$(cat /proc/modules | grep -w drbd)" ]; then
> -+			$RMMOD drbd && break
> -+		fi
> - 	    fi
> - 	done
> - 	run_hook stop
> --- 
> -1.9.1
> -
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
> similarity index 91%
> rename from meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
> rename to meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
> index bd1e8576f..a781e2791 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
> @@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>  
>  SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
>             git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
> -           file://0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch \
>            "
> -# v9.5.0
> -SRCREV_drbd-utils = "ee126652638328b55dc6bff47d07d6161ab768db"
> -SRCREV_drbd-headers = "b47cc11bcabe1a65c40ad23f71dcaf2da6419630"
> +# v9.8.0
> +SRCREV_drbd-utils = "c30216b49330216bf8a567b7727da6e24f099f08"
> +SRCREV_drbd-headers = "2357a11fb49bcbadf6b490e6d4cfe982a3d24813"
>  
>  S = "${WORKDIR}/git"
>  


