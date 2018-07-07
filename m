Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F78974596
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 01:15:56 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so26660139ois.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lsW99VfaxYyZw4m4HYYY7HuFj3UfICDGH0Yltn+N+Hs=;
	b=e2h8kqdnkncehmjSD+udlqOfZmDwbVcuvsUpaPXgJJiQCYs8/msRe1+m5tykDc7qY7
	QOynoDdq76t5YEV9RbGgcEuRYxy98knvMkNNhbO6Z+qlY2GsgIkWApUx+o9GgL0CwRs9
	VIL51FOj/G5ytmKpdIT7n0IoqJh+d4iP8RbCXTn8thUiA+280gRM1Fbr/3vX2L60U6N6
	bNq/fnWWOXVRf69IwyrbTjREG8dGuJ8Ih33icB4Bu8YJCor4a0dRE6MO6NV21n1bdvjJ
	wZfXGFlLI9fX77N+oxhYvj90BD9yHphlnLodw/3U1w4XF50glcWVFRWUY4YEA/xdbxR8
	Xf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=lsW99VfaxYyZw4m4HYYY7HuFj3UfICDGH0Yltn+N+Hs=;
	b=HvfyqCe/nUnDqYeS3HGELUGNqOxkoAD8LQf7HTwOqhK16xipMDn7A8tZ47g92vCVx0
	xzbAEVggckyYUY3btApKCHjbj0kM8ulP+DbawqVy745fBQM2RW0F8hAxuInfkpPCE8gS
	VJvxa76B1NyLcL/t0CR+hB+Tr6xAh2bRdiWtbUGOtaSo/A6pMARDuxI6ZYD6a8isv6yk
	paiKKbjXzMdIkwICCnAFc/pHQ0A41zALBnYp8974WqZOz7drZpD7/IVx6S3tsxsOf8GD
	SG9LwtVf64yvEqSKXFrCsgwyhKEUX/q5dTpf5V2zuyJhnbRH+KVUAPXPyp2I6bKax+4X
	m5xw==
X-Gm-Message-State: APt69E3Dt1wLVRbnoGKzfXoFXyDwSQBAp85pt+Yer7kXNejyCgKvqref
	08ChiQBSpw0OwGI5NWGJrwtMjQ==
X-Google-Smtp-Source: AAOMgpdydW3CPifxMC3ljYQMudCNVr5mnDQzKZXQuRwklnLOtBC0rk2E0amflM3Y0KhIN99/93lmXw==
X-Received: by 2002:aca:758c:: with SMTP id
	q134-v6mr14771264oic.334.1530926157411; 
	Fri, 06 Jul 2018 18:15:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:41a9:b69d:a923:c699?
	([2601:202:4000:1184:41a9:b69d:a923:c699])
	by smtp.gmail.com with ESMTPSA id
	z196-v6sm16635530oig.12.2018.07.06.18.15.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 18:15:56 -0700 (PDT)
To: Takuma Ueba <ueba.takuma@jp.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
Date: Fri, 6 Jul 2018 18:15:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
Subject: Re: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Sat, 07 Jul 2018 01:15:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/05/2018 11:26 PM, Takuma Ueba wrote:
> Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
> index 5c379956f..660bf09a7 100644
> --- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
> +++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
>  HOMEPAGE = "https://github.com/pyca/pynacl"
>  SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> +LICENSE = "MIT"

Why did the LICENSE change? maybe not that in the commit message. It
helps the stable branch maintainer to decide if this needs to propagate
to other branches.

- armin
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
>  
>  PYPI_PACKAGE = "asn1crypto"


