Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 74F857E415
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 13:19:20 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id a186so3260423pfa.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NA6S0dPRfBxQS/LuNYVTaLms5Ydgm3wBeSa0zAMX9VM=;
	b=Z8NpdEAiYAMLobtc6Uruz6bot5WDvvdA/m+P6Pu13dpruLBEJUB6W8N0KW2xblo3nk
	+OmLXQ1fLO6WtWFUNoT/cDU+3u1PCdFxSAx7SnD3ZQupNLTpnQyxEkUidEinDYrBHyvT
	QQj2odOpISsBLyLg+LLtD4JI6ZeCo5wLzcSZOzhdAFJHqcNaqv+AoDRIh5kzqHNObu0f
	W/byc8ht4uAWEimsP+r3hITFBLJ8scD3FdVVr50xSgbfES1blxpivohQzKxqVAOBLInP
	ZmHnAjcBZwtp75Iq5V9CNFMLhlhZq5YIgjJp8pe+sQqcCYrqngTiJxPsI+yG1bmmjk5y
	bRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NA6S0dPRfBxQS/LuNYVTaLms5Ydgm3wBeSa0zAMX9VM=;
	b=J52m/iIgDtwid+CxGfoBeifVccoUnpTz/ellE0I/cUZGnApbjbURibSvAWXt4BCfZp
	Ty3mrrBVun+0Wz+vAW94HngJnNP6x+te/uf7hJC3H/Ck6Dbkaj9Zd8BTMlRklHGGHL2p
	n31AZgk5lUA9Xis8+KFGUzlDmNOCkGwlSzuQgoU8H8PKolpS5dI3gxUsFXWN1dDbSNxg
	RIByCB5jXGd8+3E7o9NkJA0qWmSU18b+QKiNub7MNUkNg1wwMZC+U9ta49SHLIvnzJ/U
	4G5Em/C04ts1Sy6oLA17jGUM5Dn1dGywXMTK3avpSClAdo3lpxnrdNic7sgtxUVkz+Xq
	8CSw==
X-Gm-Message-State: APjAAAV6eew9c6j1qHZMtcX5BenO9HZIM0MdusKBlb/5/beXg72z7v6/
	3CMikIKcU6H2vuRHuUnkjB6YxCX7
X-Google-Smtp-Source: APXvYqyhwk1oS803qnxkQ3eTC1Wob35hnbZ6aIWBGPpvqMAK9vUW0iy4k5qhbg2w2hs3QzeFd+N1GA==
X-Received: by 2002:aa7:9104:: with SMTP id 4mr3704387pfh.66.1559222361334;
	Thu, 30 May 2019 06:19:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4865:9151:ec2:e220?
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id o2sm2402415pgq.50.2019.05.30.06.19.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 06:19:20 -0700 (PDT)
To: Geoff Parker <geoffhp@gmail.com>, openembedded-devel@lists.openembedded.org
References: <CAHNuFGLy41mmeMnR2iRbJWYQSU9egnv9bNuF_hUoBhpUH7p+tQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d8c5976a-9691-290d-fdec-4a8eedd90fb4@gmail.com>
Date: Thu, 30 May 2019 06:19:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHNuFGLy41mmeMnR2iRbJWYQSU9egnv9bNuF_hUoBhpUH7p+tQ@mail.gmail.com>
Subject: Re: [meta-python][warrior] update python3-websockets from v4.0.1 to 5.0.1
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
X-List-Received-Date: Thu, 30 May 2019 13:19:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/29/19 11:13 AM, Geoff Parker wrote:
> python3-websockets version 4.01 will throw this error
> when used with Python 3.7.
>
>  File "/usr/lib/python3.7/site-packages/websockets/compatibility.py", line 15
>    asyncio_ensure_future = asyncio.async           # Python < 3.5
>                                        ^
>    SyntaxError: invalid syntax
>
> This was fixed upstream in a commit applied 3 commits since the 4.0.1 tag.

Fix needs to be in master first before any consideration for backport.

- armin
>
>  https://github.com/aaugustin/websockets/commit/9f566c5d12eae1258aa6f1991fe8cf0a7d390f97
>
> Signed-off-by: Geoff Parker <geoffhp@gmail.com>
> ---
> ...ython3-websockets_4.0.1.bb => python3-websockets_5.0.1.bb} | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> rename meta-python/recipes-devtools/python/{python3-websockets_4.0.1.bb
> => python3-websockets_5.0.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> b/meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
> index 414129c59..151dee2d5 100644
> --- a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"
>
> inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
> -SRC_URI[sha256sum] =
> "da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
> +SRC_URI[md5sum] = "cd2f92f07bca588acd9238b18f6cfbcf"
> +SRC_URI[sha256sum] =
> "a49d315db5a7a19d55422e1678e8a1c3b9661d7296bef3179fa620cf80b12674"
>
> BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.20.1


