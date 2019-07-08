Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1ACA7D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 02:47:36 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id x3so3870584lfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 19:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=4kj1pB513QBISU1ahOyYHmUQX1h5/mB7buConoUcrbk=;
	b=F2tsrZXR/tgn3GQLPFvTgOlwRT7V9E6XtgnW+Zb0ZqegnC3vpqcewC7SfL/+tWj2LG
	8CbvUqD0OF650ESQcG5IXWzd7/hbbsRSUsAYAC/cHQBHIA1DSli+pKKQp4CJZ/U35esN
	8+yiIBCWDXWYG5j8MZhWwukXUGqx2YbOdKTmPFaDqSaepe43Bo3R/2sTf1KOI3JO9CXV
	8fLcKih+NlLSY2BseROKcKdv+cP7ySMjiBJAum1DuxXFX951cQTKeGz4g2FSDMsTyu41
	gfPXPWfr8saYnO6BUpgGTVNt7DLYqIPP0/dg84Xdp6BHLwaXrvfvLT3TH5Z8aWJ6ZgdV
	mY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4kj1pB513QBISU1ahOyYHmUQX1h5/mB7buConoUcrbk=;
	b=CaDhc5cSJBQnX5tKMU8NnOaTbgjwiI5LEV2/dKmpVPl7ua4vktmPdRKAWz4sPwx9vv
	OQCeRDL6Zk0UGoK3ZvnC52cuaTfPqA96QCxbNGLeGEn0EnA3tn72djILkZaBYb0zVtAG
	vJ60MmCgndDg4FcE4wcTNznMyL/Uu7zmHfQ2dOhbLqXyYqMC70NhXU/bKbXwiGGXKGvO
	K2SnwggOvfQmryzhc2wQAIBGmsIj3/GqaEyJWqnmiQqUN5R+mD8y0lty2145BdIs0v8t
	5w2gy21dMvGThPW0Wp7vhGc8W6ArCQhKRGl80rIj/i7yYaHLflN6qqs5Py2FbPlcnxbG
	fbLQ==
X-Gm-Message-State: APjAAAWcxmldgSfykEE8huzQI9F+W8NGRW8y89f7U/X/i2oeM09RgFeF
	rYi4mTVAywJxdimsXVNa06S9fXTjU0Q=
X-Google-Smtp-Source: APXvYqxq0cnr/a7b/yTkhcqhZemfeuHBfRHQnTPsfVXvQJDXYYUIymlo1NoLsOccdFPZDPtjZqyPNQ==
X-Received: by 2002:a19:5e4e:: with SMTP id z14mr7089741lfi.11.1562554057038; 
	Sun, 07 Jul 2019 19:47:37 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r17sm3338955ljc.85.2019.07.07.19.47.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jul 2019 19:47:36 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190708005345.6211-1-open.source@oleksandr-kravchuk.com>
	<02e59b59-5d3c-0c7e-6259-0caebbbf6e6c@gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <94fab41a-9fb7-e3c1-40ba-537c41f059e6@oleksandr-kravchuk.com>
Date: Mon, 8 Jul 2019 04:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <02e59b59-5d3c-0c7e-6259-0caebbbf6e6c@gmail.com>
Subject: Re: [PATCH][meta-networking] ipvsadm: update to 1.30
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
X-List-Received-Date: Mon, 08 Jul 2019 02:47:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 08/07/2019 04:44, akuster808 wrote:
>
> On 7/7/19 5:53 PM, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../ipvsadm/{ipvsadm_1.29.bb => ipvsadm_1.30.bb}            | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-networking/recipes-support/ipvsadm/{ipvsadm_1.29.bb => ipvsadm_1.30.bb} (90%)
>>
>> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
>> similarity index 90%
>> rename from meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
>> rename to meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
>> index 4f3c16dc3..22cb88ac1 100644
>> --- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
>> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
>> @@ -16,14 +16,14 @@ LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=b4e40069f15598d0e3
>>  
>>  DEPENDS += "libnl popt"
>>  
>> -SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.gz \
>> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.xz \
> Is the src uri dropping gz files?
>
> - armin
No, it is not. xz is almost always smaller, so I thought it's better to
use it. Any reasons I shouldn't?
>>          file://0001-Modify-the-Makefile-for-cross-compile.patch \
>>          file://0003-ipvsadm-remove-dependency-on-bash.patch \
>>          file://makefile-add-ldflags.patch \
>>  "
>>  
>> -SRC_URI[md5sum] = "88b35030b4766b3e44ad15aacdef65c4"
>> -SRC_URI[sha256sum] = "297f5cd459c3eef81ed0ca32e53bf320ed6b132fe7ed6ea5e44aa6b1fbd2a7de"
>> +SRC_URI[md5sum] = "97f11b6af1920fde5a9d9eac0d7f9e50"
>> +SRC_URI[sha256sum] = "95573d70df473c9f63fc4ac496c044c69e3a6de7ccac119922210c0b44cd7a0c"
>>  
>>  UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
>>  

