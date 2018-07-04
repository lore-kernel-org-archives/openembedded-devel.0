Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8E078AA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 16:16:13 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bi1-v6so1064plb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=M7LIBfZTx7EhE4CIr1pZuKkNMVtwxzNBi3lwXuVF4hE=;
	b=DcvMdr0ksMfDQgFa30Y8iko0+WpBlRjvVR23+7nvGjZvKmyzrf39U52zEtGtOZ8qWm
	dn71JidVNeH5rpS2WA/1ciba90XFz12YD4MMe5/uu5OBozZcyokt1LEQFestOQt3LBYT
	u1C9My436btDKTnmZmLDIgPXX0NH91B/AGlMjVxOZu06xMlK88GaDc3SbfVdxn0J+H0l
	PlGdXUuPigm3oNoNZVeYxl6oZ2zb6PHgMAHAhkITWs3RqiD84NbjV9Bb7VsGwIFwfrqm
	nrhAFp0ZWIVRPg03yww1vAeD4GQiI5LDRQiFOchZQXbxctywcW9tGWIfyZvdmEaLFcPj
	Q32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=M7LIBfZTx7EhE4CIr1pZuKkNMVtwxzNBi3lwXuVF4hE=;
	b=MU6HXf0MjE5vVtghEcDzOqeYK2KiV48pZS15XDqh9tqzBHJDKn01P0LS4k+Trv2FLu
	IjyxnwzJp/7jftLIyBpCnuER4KTMe8F9Z72zMf6n9iVMNNLFOLxYu6T3y0hMkcAshLMq
	ijs3P8kR2eYrNoCr4wIvjh6gFBdgBZlCqhrIbjDnapwNzj+NIb/dKbSQIc1WTQBtDFjs
	bbH7QQ/fpKVNPM/h+LEaffY1rG6L7oUzlQr7G8JkyS0Hy8B2VM10XgckarVnxdr/GhSk
	Baec3WzLU87FpwDqVZ/qtuT1MsJJAIXXCfQcuQkQ0WQPzgXiZJqoByPe/WSfiy8Dgsc3
	PbAg==
X-Gm-Message-State: APt69E1X3VGSPKSo10rkxIwWR2l07pNenklVgdbmiqY0XUW540ClZBq8
	pUhBoM6mtgvHwEnUPE6LAxCm+h2C
X-Google-Smtp-Source: AAOMgpfv7w3tZ1Klp7PVG9qmS/QNVMVQ+7h5RrnRy9Dn4ObKYvkKQfdbh/dwqcAdXlQkHWxr8QO93A==
X-Received: by 2002:a17:902:e3:: with SMTP id
	a90-v6mr2756671pla.227.1530720972768; 
	Wed, 04 Jul 2018 09:16:12 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:1caa:7afc:f307:5930])
	by smtp.gmail.com with ESMTPSA id
	81-v6sm9625514pfl.125.2018.07.04.09.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 09:16:12 -0700 (PDT)
To: Alexandru Vasiu <alexandru.vasiu@ni.com>,
	openembedded-devel@lists.openembedded.org
References: <20180704145552.29673-1-alexandru.vasiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6b1dd460-2923-1ef5-14a4-02884b1324d0@gmail.com>
Date: Wed, 4 Jul 2018 09:15:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180704145552.29673-1-alexandru.vasiu@ni.com>
Subject: Re: [meta-oe][meta-python][PATCH v4] python-pyiface: Upgrade to 0.0.7
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
X-List-Received-Date: Wed, 04 Jul 2018 16:16:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/4/18 7:55 AM, Alexandru Vasiu wrote:
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>   meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
>   .../{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb}    | 0
>   .../{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb}  | 0
>   3 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb} (100%)
>   rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb} (100%)
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
> index 8e464a83f..895a0ae09 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -3,9 +3,9 @@ SECTION = "devel/python"
>   HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
>   LICENSE = "GPLv3+"
>   
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
>   

Please describe the change in commit message as well.

> -SRC_URI[md5sum] = "2379d8d4506e6c4d83cf3d4824abce8b"
> -SRC_URI[sha256sum] = "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6e4cf2d708dcd86f2"
> +SRC_URI[md5sum] = "1bbc53c281925eae5f508b8b1a1f8259"
> +SRC_URI[sha256sum] = "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed4f6987322051928d"
>   
>   inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> rename to meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> 

