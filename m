Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 056AC7CE53
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 02:24:08 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r124so9988847pgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 18:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sWh4JxY1rLSUt8aNGhHAQbPb96+i6FEGnGd4rq7iro4=;
	b=p4L+0sFSEfc1/SF1kFHLg44aTRVIjQsHSI0HoHo2ZYvt/6q+Elolid7JWnTB6vLJF2
	tIbXy6dyAs7EPMCDwFCm5h1r/akDIii1FI2Jh6R5mS6bZQ43U7qM8w16V1Zr7veNZP0L
	f5qv5Fnl0FBP5RdpAhLYWD+fTAVvTaX/80oj8YIu5lrvS4byzKeSVEo9iMbN7C+ApjlC
	qiznFEzGDO2Y9OJrkWoB6WejnFsveHkoOVvhlGbtYfpSD33/nSLuDmionwMtH676ZvgS
	q1gebKe6tAwFkzWHLSgd6Cpe8yxnOtuywqdaoIgJICQVxRmxM2uFgM/L36U4BE49Vux/
	+CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=sWh4JxY1rLSUt8aNGhHAQbPb96+i6FEGnGd4rq7iro4=;
	b=XbrXUWk0GqWa6RWp0gasgOh61rIkoHHFb9iKqs3A26dsN2+cvcaFyeviakxAOmS7NM
	AZ21xu/waRq01ZTEQphaaggW5+P6aGyT8WoqwotZAUPjGleIF2/gw4tvtPMg7B32JJGm
	csM0TXzpoFRTTikcIaAnLYoXn5FvpNZ5QrNOtVLARyEPEJcgxMAa/raHSatX2q8Nn79H
	JbJhckyLw17IKAJ+vvyAH9LVZdBXYXLLIUABN5d8LBgjWy0b74yhCdwwsNAUVJUi9Hh5
	qCFpgbnattY1lufTl4nfCZHj3i/gV5XUS/0m5MxK5GNgZc/vDr0T26yPafZC96mbjJL1
	HAFw==
X-Gm-Message-State: APjAAAUnJgMusz9oxrXQLmD85xOOSOwR7i2ocwus3qaGB6vM6CwDoYxg
	89BwPTBfKFTUJ4hlHbyXyRjz9m/r
X-Google-Smtp-Source: APXvYqyydkasg5wISuRq3dGJvOXkaSB6+IFfhEr4uhn5DscAgmXCFu2LlcVmDvqcGjCoplEIr5g59Q==
X-Received: by 2002:a63:1625:: with SMTP id w37mr9156745pgl.13.1551925449693; 
	Wed, 06 Mar 2019 18:24:09 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:812:f55f:93a9:af21?
	([2601:202:4180:c33:812:f55f:93a9:af21])
	by smtp.gmail.com with ESMTPSA id
	m64sm8338076pfi.149.2019.03.06.18.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 18:24:09 -0800 (PST)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190307015059.18407-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1d61aad4-7280-34c0-0f4d-753eec59419d@gmail.com>
Date: Wed, 6 Mar 2019 18:24:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307015059.18407-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Thu, 07 Mar 2019 02:24:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/6/19 5:50 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Nack.  3.0 only supports QT5 as a gui, please remove GTK support.
Why does this need git as a depends?


> ---
>  .../{wireshark_2.6.6.bb => wireshark_3.0.0.bb}       | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_3.0.0.bb} (89%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> similarity index 89%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> index 4699f6798..d940a4567 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
> @@ -4,22 +4,20 @@ SECTION = "net"
>  LICENSE = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
>  
> -DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native"
> +DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native git"
>  
>  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
>  
> -SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
> -           file://0001-Add-libm-to-link-for-fmod-API.patch \
> -          "
> +SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
>  
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>  
> -SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
> -SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
> +SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
> +SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
>  
>  PE = "1"
>  
> -inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
> +inherit cmake pkgconfig python3native perlnative upstream-version-is-even
>  
>  ARM_INSTRUCTION_SET = "arm"
>  


