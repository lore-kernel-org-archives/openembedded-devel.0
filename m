Return-Path: <paolo.valente@linaro.org>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id B12227D2FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:45:09 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id b3so8274016pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=PsnH3Mkdx1fd3InYYxPwSjEnMK7LdLYP4pRLb5d/OGg=;
	b=G1hAuBQJRejD5pn2O8zdtU2tOQZXXzOyi2x9vcP3sGxByAJ1Tj7BdMhDq2EskQkh30
	FiSuvk+4noZ4FsOzcId+o7F7Zs/W4S1MfRRXo0Exlv8Q4dqqwWGVFTOj9rBrtmxXX83f
	Ne4+pGISS6N6kEmPF3kK8DasYwXfeWqStzDzwpYQ1FkgD4JdwWDZFn9D80hXhjxKRVbF
	DFbjSF9PdEsm11AK9gtfcG3VKdvT2aEqHUDmWv8lfo4qe8Ay5asv3Qn6YA0PnItyZoUH
	RaNtkoFJ8UhM6vG2zSbQSPATDyP/9uG9C0Dx1p29Tg/JcanZbwqDL7JgxGExWYVVs7Yk
	DkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=PsnH3Mkdx1fd3InYYxPwSjEnMK7LdLYP4pRLb5d/OGg=;
	b=kPHkVhD/K70zR7nOITCIGQL0og1UpGbSjkO8M3AV3Y62wmrxQkAIT69G48gYdHVSiA
	iFoOem5wqvRLtLOE2EItk+uRIfRDG7pMiUqgibEIhxwVydx8xLOCaqXkq3PIcNF7/LBT
	jtjSe8whtxoWP88+TglhYt75HcBeDlpzqFTTBkogpwT57PIlE4pAVfesWFeyqBrlJH/Y
	3xCARBvvCPKBZZ4Uxl1Pc1UyXzg+ON3nIJNe0Qxl/tmElFMXN6bu2tnrB4vTH7rpF0AW
	j63BABwjTzvoKAKpY5JPh1FuwpJzNNx11c22DxW1RQS5eXb8yCd/Rqkfa39UtSdq8sU4
	wr1A==
X-Gm-Message-State: APjAAAXbuaSDnnhnieYLvPcxOa7eqdeKsD6GOPE6cbm8sZ8F6MNLiCqH
	ILuZDnD8mQDwyvs/oPf0IMAIE2IthkE=
X-Google-Smtp-Source: APXvYqx2LLNnBpXNVFtqfU0Tji6YaLHdjF1b7jHE1M7fkOWc4y9c9cgnW4ihB5KUw9dEAY71XC5BGg==
X-Received: by 2002:a63:4819:: with SMTP id v25mr21315pga.412.1554302710288;
	Wed, 03 Apr 2019 07:45:10 -0700 (PDT)
Received: from [10.71.8.133] ([147.50.13.10]) by smtp.gmail.com with ESMTPSA id
	e123sm28064595pgc.14.2019.04.03.07.45.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 07:45:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <20190328160450.92438-1-paolo.valente@linaro.org>
Date: Wed, 3 Apr 2019 21:45:06 +0700
Message-Id: <5940843B-7679-4B79-88E1-9219EC261669@linaro.org>
References: <20190328160450.92438-1-paolo.valente@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3445.102.3)
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 14:45:09 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
have you guys had time to look into this?

Thanks,
Paolo

> Il giorno 28 mar 2019, alle ore 23:04, Paolo Valente =
<paolo.valente@linaro.org> ha scritto:
>=20
> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> ---
> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> index 8bd0afc49..47d21d36c 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>=20
> -SRCREV =3D "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
> +SRCREV =3D "d05006865f68829fa7603bdb92bd51649f5ba1b6"
> PV =3D "0.0+git${SRCPV}"
> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>=20
> --=20
> 2.20.1
>=20


