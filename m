Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 791BC7F344
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:51:25 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b13so39207224pfo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=wypm9DgdPMeYPw6lHIBAgq09cSxFE8Anc9isylgNC0w=;
	b=fgWu8EJ3eUa1YKTGsjZKmCcmEbX7Z6KPUXOen4aymprwRBBVwIJrX2s4AutHc9Z2gF
	2wwyLjy1kh4dQl6WS5FZ3Kh/zXbYiTIl4ZZ3fWg3aE6FXXhceosVR30kFCBkm9cOuzre
	C7JUWCNtc8jdRgPpstWZOQAv8+k3ASoIRsHeBOu/N7c6Bg9wlXapk7z0PN+7gdySDfct
	eX/lz5s+1KsjHqysNiYNFoJbWAWBLLHU2vV749N7qI2Ti/o47ZKJOmsgrV5gFo7Pt4fD
	FwTx+Es2ehSRxsgJ+5N/pJkbK53zWVkT9/ithvO4XbWlKjnpGtJIh1CQhqq2M+o+V2hn
	p4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=wypm9DgdPMeYPw6lHIBAgq09cSxFE8Anc9isylgNC0w=;
	b=Fyr0O3tMucS/jTNj6BVepvJbiLCy8gUZQtVdOvVI0IClKhgYq2YF++TOGy9yY2/AJ9
	KKUEpSHOb17pVLzvT0m60GjyoEk9ZXx8ktw6ErHeMhxEeYvezAj49VM/w55nQHTWW0vT
	8bxEB9zeLz6vlH4n1u65x7iSbyx3XVnYneHwnA6FK+al7zK7F3/YnI0wQ/hdfD/ALGVi
	IcaHkdEYJJKl17ADdmMFausKriZMEfDXeXgZJi0uHgEW2VfgjQ85WpRact4qMkM6+SrU
	cw5Ur5Uuv7RSCFScIsMrWBVDWAd2XTpAvviA/5XEOCJFdsMBVEUZug/125QuN92GWFIQ
	4J6g==
X-Gm-Message-State: APjAAAV4e9uG0iwWqXcw9/0PsGqqc8x8fF5S3aU3u4CBLM1JDVZoH2if
	+k107NpYbpZZgkgjm6IJBY5ZVHGWOD8=
X-Google-Smtp-Source: APXvYqw7tevK3oDHmTglfn1ygGkj1hKM3e5ZuHMz+5hUR5Idu4R90FpxI9mwhSxsuRtwGwDUoyiFhw==
X-Received: by 2002:a65:6114:: with SMTP id
	z20mr137422013pgu.141.1564991485961; 
	Mon, 05 Aug 2019 00:51:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::31f9? ([2601:646:8500:6bc6::31f9])
	by smtp.gmail.com with ESMTPSA id
	y23sm85322078pfo.106.2019.08.05.00.51.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 00:51:25 -0700 (PDT)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <20190805070843.30763-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <95a53502-0397-c11e-68d4-0676599ace8e@gmail.com>
Date: Mon, 5 Aug 2019 00:51:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805070843.30763-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [meta-python] [PATCH] python-jsonpatch: upgrade 1.23 -> 1.24
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
X-List-Received-Date: Mon, 05 Aug 2019 07:51:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

its already applied

On 8/5/19 12:08 AM, Zang Ruochen wrote:
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>   meta-python/recipes-devtools/python/python-jsonpatch.inc              | 4 ++--
>   .../python/{python-jsonpatch_1.23.bb => python-jsonpatch_1.24.bb}     | 0
>   .../python/{python3-jsonpatch_1.23.bb => python3-jsonpatch_1.24.bb}   | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python-jsonpatch_1.23.bb => python-jsonpatch_1.24.bb} (100%)
>   rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.23.bb => python3-jsonpatch_1.24.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> index 409c09a..8f64c2a 100644
> --- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
>   
>   inherit pypi
>   
> -SRC_URI[md5sum] = "83c4c9faccb4a2ff8c1db80cbddc590d"
> -SRC_URI[sha256sum] = "49f29cab70e9068db3b1dc6b656cbe2ee4edf7dfe9bf5a0055f17a4b6804a4b9"
> +SRC_URI[md5sum] = "e86503f05fa192fa870d7004b8ce929a"
> +SRC_URI[sha256sum] = "cbb72f8bf35260628aea6b508a107245f757d1ec839a19c34349985e2c05645a"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
>   
> diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb
> rename to meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.23.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.24.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.23.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.24.bb

