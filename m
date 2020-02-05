Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF9D60CAC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 15:57:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j15so1164850pgm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=TF4276Dfn6bf6IX0DLsAOWt16B9eFKR9+o1FiVhJKzM=;
	b=pjQbzX5BIElX8zcRCbHTHbBJ0G7w9ILhaX/3sacz2WGackMwWtG++gBVXT54G/4Rp/
	lSCERIncTwqrvESrO1Pln+ME1OW7og12xvmQ8fMddD95m+SAEZ1SbIQJFKR8EYqYkVtl
	pJyLPoIrWaN3FbqjuDU2E7ojrFhQs5E0C9gA3MGzQ+BD3c6iZrqM137udGuPLhKNv1my
	YUgkQWt0YoKoPZboctY28zpmJuNhemTzhSwJ9uCzOQVSUDjbYFBX+ao3VVQwWntfv3WX
	eGp/Qfo/QITDmNUd/HbuB8y0EP8xvhHJHq7IKYjngDhf2S1jHwpuux9wAHKFULXSS33H
	VpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TF4276Dfn6bf6IX0DLsAOWt16B9eFKR9+o1FiVhJKzM=;
	b=KANGhNoYZmycXVzbpcnT2roEfFxTdPSz76ZhM2N5SGSW+jgAjOMADE3pqKO8ylIPVT
	LZFDNc4PAUZULJgyIBjsYmWiqZWA8axcwxn5T6bxvXN+eb+gPqewQwpiKwEmMQLe2ySy
	/oeVgBASWdsYN9rB3guhG7WTLUni/M2uQQIbimw+HX3ReNbuCQsE9szS1xxlnAPGO4RZ
	godYxTbnqZbdvkx8nGsn4jnpWCbPPtkZ2Ff1Bv5b8R1nm792QqR4i/3MYtdIosJDJOQV
	JCFHdcj37X7A5OmRUwVPQi+1IaOwuV7WGOhFECTzvr2AfZtl2qo2kBTWRjPobykC+tFf
	hkDQ==
X-Gm-Message-State: APjAAAU3t88dfr+dRXrTK2T2579rb6jKQhhVnsCLvYUWAaLCmTWUonjE
	d6RDQLEDpXEY7A+rNgy8ZHmCHNpI
X-Google-Smtp-Source: APXvYqwG4cmwcsVh11xiifQ0cjVSghyou/v5TeUbyz2MqbXk2MbbKzEaXzYXbyqK788//3Y4azgguw==
X-Received: by 2002:a63:f70e:: with SMTP id x14mr24237235pgh.71.1580918224008; 
	Wed, 05 Feb 2020 07:57:04 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:e0e6:3e38:df8b:421b?
	([2601:202:4180:a5c0:e0e6:3e38:df8b:421b])
	by smtp.gmail.com with ESMTPSA id 3sm198288pjg.27.2020.02.05.07.57.03
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 05 Feb 2020 07:57:03 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20200205092500.23165-1-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7ba13841-f2da-b42c-e25a-7cb00c8a53d3@gmail.com>
Date: Wed, 5 Feb 2020 07:57:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205092500.23165-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH][zeus] libldb: upgrade 1.5.5 -> 1.5.6
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
X-List-Received-Date: Wed, 05 Feb 2020 15:57:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/5/20 1:25 AM, Andreas Müller wrote:
> From: Yi Zhao <yi.zhao@windriver.com>
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> (cherry picked from commit 2b3fd534874aee125a6c79c70c93b1aa498fda3f)
>
> This is necessary for zeus to fix samba build as reported in [1]
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2020-January/204168.html

I already have this 
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/zeus-nut&id=f64c2d691ea597aa6221e3d7706a4d022e07bfea

thanks for sending the patch.

- armin
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> similarity index 95%
> rename from meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> rename to meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> index b19c964d8..99eb6f9ce 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> @@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>                      file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>                      file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>  
> -SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
> -SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
> +SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
> +SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
>  
>  inherit waf-samba distro_features_check
>  REQUIRED_DISTRO_FEATURES = "pam"


