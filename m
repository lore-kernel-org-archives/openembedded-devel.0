Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1EBA78EFF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 01:43:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x17-v6so648812pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jzDLHrC4GUK1jZ2T0+fG0wSrO3WfebLqZ6GGwEuayP0=;
	b=qfb/zB53xll+Cbd8oCoA7LWEFSlNK61GQwwdLllqs4uYH4LjgWoZ6IYg76GWjTQbTx
	x91AgYpnags4CoX6pI9P7yha/3b2YIkgPPW81aAyzMj4npmr6ZOGZjeKNuTvaIkJmzPj
	3uI4rbB6J453BCDsF84DewHyIrj3KGr4kau4nbacGi6glHa43dx7ecuJICeKF/kRytrk
	7TZtR4yOJdoTf7/UuNfZmn6a4yKPbwd3prA1lmGQN02RzLiPJIQP2MPX6abaCqVnspc/
	wohoO/tWThMuO3Qs+4Y7gG3abjAIg941PSdnDFoviDOJvMYx3RPR9+8CZj/sQvqe6R8D
	RQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=jzDLHrC4GUK1jZ2T0+fG0wSrO3WfebLqZ6GGwEuayP0=;
	b=Q3rVkSkop8QguKwNhml4v7gSCwDtfHfEG/WCbb1ZrNA4yGqjGGueXKZJ6qHT+YLzGL
	fK9+kJu8neXfeLn7XEDjhUKHIvptk2hsK0NS9xOSdoxKay5dCfpkWsyQRFtTzQTz5Vu9
	H8S9wZfT7umeGTFt4hUF6VoWtlGq1jgwBa7jZHYwsvU1DHEWVxUOROIw/6DIQhZtMpGj
	IqVovd2DHsDduz7imEzWB1n3zkww22wwgktxYfe/uWpPByX91Gy0WJ7HBHhFCgSeuGC9
	jT29GSCHjeIG9TGgJurXDzOzAw6FSM1VdLvVHKR1cYlO0t3gUOVcu+RgrMDIlJJbXATZ
	tXNA==
X-Gm-Message-State: ABuFfogbAr8fDowd3M1trL7tWbiCTm1/AX0PVYOktZwo/oNeNB1E2iQl
	bC/f4P/SPiq2gBUs6HkFR1V4on5y
X-Google-Smtp-Source: ACcGV62Eel5NSpR+EFZ/YOInh5D+Gr0xEsWUhaKqWUcP4xmDJryR4gIu03noL8/sJ6sHA9z1kBQ79A==
X-Received: by 2002:a62:4613:: with SMTP id
	t19-v6mr8844893pfa.118.1538012640445; 
	Wed, 26 Sep 2018 18:44:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:48c:9f78:37fc:8835?
	([2601:202:4180:c33:48c:9f78:37fc:8835])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm551917pfi.4.2018.09.26.18.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 18:43:58 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-devel@lists.openembedded.org
References: <20180926121806.30667-1-nicolas.dechesne@linaro.org>
	<20180926121806.30667-3-nicolas.dechesne@linaro.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <eee8496f-50ec-72c8-a4d9-6cafb9ee629d@gmail.com>
Date: Wed, 26 Sep 2018 18:43:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180926121806.30667-3-nicolas.dechesne@linaro.org>
Subject: Re: [meta-oe][sumo][PATCH 2/2] grpc: move it from oe to networking layer
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
X-List-Received-Date: Thu, 27 Sep 2018 01:43:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/26/2018 05:18 AM, Nicolas Dechesne wrote:
> From: Armin Kuster <akuster808@gmail.com>
>
> grpc has dependancy on meta-networking packages.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> (cherry picked from commit 251878e8b6b993b159c949f7e4860faf085e17f5)
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

this is already in sumo-next

- armin
> ---
>  ...001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 0
>  ...0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch | 0
>  .../0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch | 0
>  {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb  | 0
>  4 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
>  rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb (100%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
> rename to meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
> rename to meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch b/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
> rename to meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
> rename to meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb


