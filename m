Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D753797C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 14:59:36 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id f62-v6so3175713qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5h+2qOqts3e3myrw+ZJWF11CUiB+keA1NxHXs0rStCc=;
	b=qhL8yg2MGjvuMrKXqdyec0T2DwnycjtrKRDQcihl/B0UMiG/hYgAc2xCKy/b4V/E/k
	F5XuaxhqB6d8gudKcd6DPhvkpThJ1nrrfDVn7z4CUEcrDbE/hM02KT6nhg0oBTMXRpt2
	Y4wcNpY3UwJ5n+u1wjPM7itvUh+iw2hVLCkQYNx5Xk8AZHKJSmg8WiTQqsz9MKi/Dz2i
	dPZbTp/u8lIvU7apmSfMLto5CDjO/PdYC9/M3T3b54w8PiKDqMOY+Vf4SvQZ+lrN64xU
	Ih6NIzQlPNRyq5/ireR+4aIeQrms9WdDEKqaEI+xlbIKVk74fl8cACSN/itJNRqZ+oTN
	d+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5h+2qOqts3e3myrw+ZJWF11CUiB+keA1NxHXs0rStCc=;
	b=pZbVD0+PcnDFaWMsoJZQusf866omWftYW98/tfjibRBjIBTqsDPYtK6rFwOv3UnR6E
	77dtnlTym3Vu51NT3yz1ZXtDQqZghShXcH4eavWRtIzLv6y1CB1Xo6qDOaZ9o0K8foc8
	QdxdiERJWrfTAlmYthBV/bADVB5wJeHLOEgAfKM5MXAQmoMkjbLPBElGWDg69yaxqJ70
	qHTTNVKGRprumCoZd28Z734v6T2Mac+FE57LrS5NUdiTstNgtvcwtf+T71el896smub5
	iVmq9Vo1Jnh8oYyKbN07TnkMLPiXSDj12Oi5VugyMJ+ntiGYFdFhC0mAqk0P7TOVe/sd
	ogFw==
X-Gm-Message-State: APzg51ARDkpJt2TlLMlNwQPGsIsj8VFBRP9zWiC8os2rCJJINJeVnMeX
	Qj1bHzbMPiHPSckSQHhN86v67gWSgaf5duWfr7Ei2wDIqCk=
X-Google-Smtp-Source: ANB0VdbgELCyoQbaGVoKLnQyrnBGkc7knwU6H93yo5sqagZoM0ruyWQscLi74vMPlAdtXWZOmlfToEQWNLixC8b2yz8=
X-Received: by 2002:a37:2915:: with SMTP id
	p21-v6mr4664888qkh.206.1537369176930; 
	Wed, 19 Sep 2018 07:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2018 07:59:10 -0700
Message-ID: <CAMKF1sq73oTGHg8hpgX3=6TnrhkOr1Lb9mOBRFRPTFv3GB69dw@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH 1/2] python-cryptography:2.3 -> 2.3.1
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
X-List-Received-Date: Wed, 19 Sep 2018 14:59:36 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: python3-cryptography-2.3.1-r0 do_fetch: Fetcher failure for
URL: 'https://files.pythonhosted.org/packages/source/c/cryptography/crypto
File: '/mnt/a/oe/downloads/cryptography-2.3.1.tar.gz' has md5 checksum
2b5e8269c43c9b9ab54fc8c75ba3c7ac when a0f3f563ab1c5c3bc02fae8d4aa3ad16
File: '/mnt/a/oe/downloads/cryptography-2.3.1.tar.gz' has sha256
checksum 8d10113ca826a4c29d5b85b2c4e045ffa8bad74fb525ee0eceb1d38d4c70dfd6
wh
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the r
SRC_URI[md5sum] = "2b5e8269c43c9b9ab54fc8c75ba3c7ac"
SRC_URI[sha256sum] =
"8d10113ca826a4c29d5b85b2c4e045ffa8bad74fb525ee0eceb1d38d4c70dfd6"
On Tue, Sep 18, 2018 at 2:35 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-cryptography from 2.3 to 2.3.1
>
> 2.Upgrade python3-cryptography from 2.3 to 2.3.1
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-cryptography_2.3.bb => python-cryptography_2.3.1.bb}   | 0
>  .../python/{python3-cryptography_2.3.bb => python3-cryptography_2.3.1.bb} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cryptography_2.3.bb => python-cryptography_2.3.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-cryptography_2.3.bb => python3-cryptography_2.3.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography_2.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cryptography_2.3.bb
> rename to meta-python/recipes-devtools/python/python-cryptography_2.3.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.3.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-cryptography_2.3.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_2.3.1.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

