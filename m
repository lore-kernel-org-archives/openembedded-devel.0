Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.33920.1613996196438143078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=Cx93YssF;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [192.168.100.10] (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id BB4FC10226EE;
	Mon, 22 Feb 2021 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1613996193; bh=fqnqcv9REAE9zHkemvkFSOHXD39YFf/rmyv4xwsQVyM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Cx93YssFRhBsFE1vB/NqKDlmacHmPsyaCbO7FByFpfr9o2nWfgTGDX8GqZRI4nNLl
	 yg69h4CLFTBWI/603NovC5R0SUIe9jfa/pmyZDHhY7zXad4Ly5UX8AlKAMlh6PhOFp
	 aRDh9+OQRJhGtvpPw2n0bv1pWWlHST/n++C8LyaqyucvS2dBW76mYjC9+VDRJrD8F5
	 Dp+AUkFFk6YofzFA+/D8DQDVTrz7++lxNdPp/K1UbUaeoQcNZQ7zW9svyvBk7Ev2De
	 /5SLC6FmCcrZ2fyzZGaQQ+Cl13tGPhCaTuqJjl/OZ4YAH3kg9T5kCv1S2AuJSAF2n7
	 FXHD7KAgXDzOQ==
Subject: Re: [oe][meta-oe][PATCH] nodejs: 12.20.1 -> 12.20.2
To: openembedded-devel@lists.openembedded.org,
 akuster808 <akuster808@gmail.com>
References: <16651F280A12E67B.15628@lists.openembedded.org>
From: "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <4c4af3ca-b270-bb75-c221-6b3edb9f21ed@geanix.com>
Date: Mon, 22 Feb 2021 13:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <16651F280A12E67B.15628@lists.openembedded.org>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 93bd6fdb21b5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 19/02/2021 11.24, Sean Nyekjaer wrote:
> ---
>   .../nodejs/{nodejs_12.20.1.bb => nodejs_12.20.2.bb}             | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb => nodejs_12.20.2.bb} (98%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
> index 0673a3202..6acc36b4f 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
> @@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>   SRC_URI_append_class-target = " \
>              file://0002-Using-native-binaries.patch \
>              "
> -SRC_URI[sha256sum] = "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853"
> +SRC_URI[sha256sum] = "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7774796756eec6d3c"
>   
>   S = "${WORKDIR}/node-v${PV}"
>   
>
> 
>
Hi Armin,

Will you include this in gategarth( and dunfell) ?

/Sean
