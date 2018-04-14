Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC02747F1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 00:01:35 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id h69so7150882pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OM7m7vBbxKpi6el23zFeFwJ0PmbRNBCFcgtSXz0JtPg=;
	b=hS8vuRvZ5bB8VTaO5tJQyLYKtwhhf1jl5jc+6RFY9GwUq9xXbcnRYlFi35d9kkoC19
	EVJUa3q4KOBs0qXk6OPaT0QxcMKxTIDDzF3xrkKyofbOx2CtYnWvS3HZJU/MUR6BpTt3
	VOWTyjjHk7t0v9yoKILWEmrDIVwtnivMDteUwkQ4PN58vpXtg90fqyFT1iLjYug88AKK
	O5YLSmszSmoKb+7pe63KxLCuoW8kogMjn1MlW6ZViKhl/6vTLRJES5ndCFPZAoOUvmoy
	kkJIgmYp8vlpK9gkViIcNJZKMrM9RhLrbZDx3B83AcNs4S3Yk54v/pbd79+0D/i1SuiX
	rl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=OM7m7vBbxKpi6el23zFeFwJ0PmbRNBCFcgtSXz0JtPg=;
	b=RwIiQOg/zs/4BIaQOkrbUeMabNeP7GHQhUZlCb5uuttW8Jq+ooxJJXrG7vgP9g92w5
	dinQQzh4PmseB9nUYDrCaC8SW3vybZo3M1cnd3yrcowicmrBvabAz8zB8W9j6vmn2jGY
	KCZClYtXnmuQG+RNlyypET1zKd4QTXdt9Vx/lEs3+pxH1bx8upnrntYWZwIkS9E12y9u
	6PXFqqtOFys+D2c4zrPEYK46la27ZazenxWMa8mq33kg1NVaqATDHLl9aJzttLw/vdyN
	CgZsafM3aLPA/vrm88pu9Z/54wrlvFz/HBrI50AUQoO9P4Dkn0Rgq12Og0YwNtQqZo1F
	umNw==
X-Gm-Message-State: ALQs6tBwLack73rJomd8s3xxnZNd5S0ywf0Dn49SxV1Vb5nLTadEhlGy
	Cmr6IIDcPB7lLVstes/7Nz7P/T7m
X-Google-Smtp-Source: AIpwx4/aslUtLg9CFVPy3beoE3k0wDguRy0ke8Q+SNsVcMfB8n2AxfmMVJ3p1WC24Kx0563hbJagSw==
X-Received: by 10.101.88.196 with SMTP id e4mr5621702pgu.143.1523664096068;
	Fri, 13 Apr 2018 17:01:36 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:4caf:c486:61ac:d2f7])
	by smtp.gmail.com with ESMTPSA id 6sm11621756pgf.9.2018.04.13.17.01.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 17:01:35 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	openembedded-devel@lists.openembedded.org
References: <1523440301-20150-1-git-send-email-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b9684482-6999-45c7-1ece-ebc247abffd1@gmail.com>
Date: Fri, 13 Apr 2018 17:01:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1523440301-20150-1-git-send-email-krzk@kernel.org>
Subject: Re: [meta-python][PATCH] python3-websockets: Add new recipe for v4.0.1 version
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
X-List-Received-Date: Sat, 14 Apr 2018 00:01:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/11/18 2:51 AM, Krzysztof Kozlowski wrote:
> Add recipe for python3-websockets v4.0.1.  Strictly speaking the package
> does not require asyncio but instead builds on top of it and it is
> essential for any work.
> 
> Make this recipe a native one to allow usage for example in image tests
> as a websocket client talking to a device under test.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   .../recipes-devtools/python/python3-websockets_4.0.1.bb  | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb b/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> new file mode 100644
> index 000000000000..414129c59d2f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
> +HOMEPAGE = "https://github.com/aaugustin/websockets"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
> +SRC_URI[sha256sum] = "da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-asyncio \
> +"
> 

There are recipes in other layers whose maintainers should be CCed as 
well so they know its moving to a more common layer.

https://github.com/Wind-River/meta-device-cloud/blob/master/recipes-devtools/python/python3-websockets_3.3.bb

https://github.com/bachp/meta-homeassistant/blob/master/recipes-devtools/python/python3-websockets_3.2.bb


