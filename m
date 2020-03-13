Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC0261CA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:37:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l184so5423572pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=i711/TNtn/3H7r753LA0bHS3RkDan/waG2e2BXRBi9M=;
	b=Ewj9a8s3Jt6bm0taEuV8SdfvCSn31BqttomGlnOw1zjAIFMP6awsbgPAbxiSHbSe17
	xIMYNgSUZog10LUQPJ3yPWyxm6UYVqF4P3LZ9nUzLJud3by4MtiPUgAUJHaq7uM543X/
	0eN/GDN+UATxC3z0IcuXwRFLFQMPu+X51fHFxM8Uy016uXEcWlcsGL0AJbnhO8mRH6+y
	X4Dd8jekuMmvhFqwIDmLwgYsW+aF4hp73o7cBDR+4ngQ0Bhro3WV3Lfhi77XZZfyOOsj
	0S6Sde1PqJSrMcSx2poEZf3iR/t4ntCf2vYsgjmJ6nvDpn1wk1z1+eA2lxXewGjF7d/I
	FKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=i711/TNtn/3H7r753LA0bHS3RkDan/waG2e2BXRBi9M=;
	b=XjYVZr/Cmy2hKE+tTUMcPrGDaAH0U0BxgoxMojulB0zovM98IVP6Mx5L97dlA0NGvA
	hGZvRZ0spRWoie2B2tFQVa6lb7F2zt8wX8UVkJoeBhtwWE3J6uyRZMlyre3+pJoHRudO
	Z9GFEJdWOsNik5WC9pnQExl5g0PHGZT6RiIHRsTpWrrUIjbHfkswjaEZ4L4OTcuRexbD
	o+o6O215T4Ee+Gwa5onpO1waU8+FryKa6T3Aa+pb9c4cEUCSOHooRyxw8YpsBAd1tkha
	a1dSQN7ZpzONrpvMbr6zE1pqXT0aaw0eIEPqlCd5mZpeDTE1jdr23jsrplgNzCMw+f5M
	lTFQ==
X-Gm-Message-State: ANhLgQ1HjeByu89PdK+qv09eDQB9aL2V+mQuIMDFBeA1LAec/eR7zCQO
	Qg82MemgD+bV8PjHA2Ou20tVNIex
X-Google-Smtp-Source: ADFU+vuEB0hqB821Hn0kZiCo7wkrcVlQFkq0qXCVGcUJZADfpvUfxaGOzG8dpEaV/I7jb6t1JtMmsA==
X-Received: by 2002:a63:5c18:: with SMTP id q24mr13964752pgb.322.1584113856246;
	Fri, 13 Mar 2020 08:37:36 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:b971:4aa1:90b2:e851?
	([2601:202:4180:a5c0:b971:4aa1:90b2:e851])
	by smtp.gmail.com with ESMTPSA id f68sm9414240pje.0.2020.03.13.08.37.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Mar 2020 08:37:35 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584097824-54462-2-git-send-email-wangmy@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <230ee0cf-428b-7c16-50c9-ec699e390d5f@gmail.com>
Date: Fri, 13 Mar 2020 08:37:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1584097824-54462-2-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [meta-oe][zeus][PATCH] opensc: CVE-2019-19479 CVE-2019-19480
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
X-List-Received-Date: Fri, 13 Mar 2020 15:37:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/13/20 4:10 AM, Wang Mingyu wrote:
> Security Advisory
>
> References
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19479
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19480

Is this fix in master?

>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../opensc/opensc/CVE-2019-19479.patch        | 30 ++++++++++++++++
>  .../opensc/opensc/CVE-2019-19480.patch        | 34 +++++++++++++++++++
>  .../recipes-support/opensc/opensc_0.19.0.bb   |  2 ++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
>
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
> new file mode 100644
> index 000000000..73222ee1a
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
> @@ -0,0 +1,30 @@
> +From c3f23b836e5a1766c36617fe1da30d22f7b63de2 Mon Sep 17 00:00:00 2001
> +From: Frank Morgner <frankmorgner@gmail.com>
> +Date: Sun, 3 Nov 2019 04:45:28 +0100
> +Subject: [PATCH] fixed  UNKNOWN READ
> +
> +Upstream-Status: Accepted <or Backport>
> +CVE: CVE-2019-19479 
> +   
> +Reported by OSS-Fuzz
> +https://oss-fuzz.com/testcase-detail/5681169970757632
> +
> +Reference to upstream patch:
> +https://github.com/OpenSC/OpenSC/commit/c3f23b836e5a1766c36617fe1da30d22f7b63de2
Missing signed-off-by
> +---
> + src/libopensc/card-setcos.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/libopensc/card-setcos.c b/src/libopensc/card-setcos.c
> +index 4cf328ad6a..1b4e8f3e23 100644
> +--- a/src/libopensc/card-setcos.c
> ++++ b/src/libopensc/card-setcos.c
> +@@ -868,7 +868,7 @@ static void parse_sec_attr_44(sc_file_t *file, const u8 *buf, size_t len)
> + 			}
> + 
> + 			/* Encryption key present ? */
> +-			iPinCount = iACLen - 1;		
> ++			iPinCount = iACLen > 0 ? iACLen - 1 : 0;
> + 
> + 			if (buf[iOffset] & 0x20) {
> + 				int iSC;
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
> new file mode 100644
> index 000000000..12c1f0b4a
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
> @@ -0,0 +1,34 @@
> +From 6ce6152284c47ba9b1d4fe8ff9d2e6a3f5ee02c7 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Wed, 23 Oct 2019 09:22:44 +0200
> +Subject: [PATCH] pkcs15-prkey: Simplify cleaning memory after failure
> +
> +https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=18478
> +
> +Upstream-Status: Accepted
> +CVE: CVE-2019-19480
> +
> +Reference to upstream patch:
> +https://github.com/OpenSC/OpenSC/commit/6ce6152284c47ba9b1d4fe8ff9d2e6a3f5ee02c7
> +---
> + src/libopensc/pkcs15-prkey.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/libopensc/pkcs15-prkey.c b/src/libopensc/pkcs15-prkey.c
> +index d3eee983..4b249582 100644
> +--- a/src/libopensc/pkcs15-prkey.c
> ++++ b/src/libopensc/pkcs15-prkey.c
> +@@ -258,6 +258,10 @@ int sc_pkcs15_decode_prkdf_entry(struct sc_pkcs15_card *p15card,
> + 	memset(gostr3410_params, 0, sizeof(gostr3410_params));
> + 
> + 	r = sc_asn1_decode_choice(ctx, asn1_prkey, *buf, *buflen, buf, buflen);
> ++	if (r < 0) {
> ++	        /* This might have allocated something. If so, clear it now */
> ++	        free(info.subject.value);
> ++        }
> + 	if (r == SC_ERROR_ASN1_END_OF_CONTENTS)
> + 		return r;
> + 	LOG_TEST_RET(ctx, r, "PrKey DF ASN.1 decoding failed");
> +-- 
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
> index bc1722e39..d26825a06 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
> @@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>  SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
>  SRC_URI = "git://github.com/OpenSC/OpenSC \
>             file://0001-Remove-redundant-logging.patch \
> +           file://CVE-2019-19479.patch \
> +           file://CVE-2019-19480.patch \
>            "
>  DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
>  


