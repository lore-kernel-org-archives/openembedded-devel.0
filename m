Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.639.1617901040513907709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eF1G5OfE;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id w10so1830584pgh.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rKCD7R0V34bHP+PEIAVa+G3pzKzf5Hj2g4Il/OP3pjw=;
        b=eF1G5OfEDrmE5iEfVfVM3sY8AsJ6V7ljYNNv17+FXgTL3kw8OxP8ocl1gSHb1sfSNO
         fsn2As4Ze+5AEklDxjDLUlwbmHIrB9nCk4culQR+x18183Q6WI6Tg71Cw92iTevcHzG8
         kiguVzGrrc0dPcFNifWO0rSF6oMWFPIcjjES+G3134D2RE1bz+XwVM4iRQ80+jK8gasN
         nhadxav/33UYDGuW1hY1Daj8RrmlbzqN1lD94Owv1UD50nqsPPdAmr/6Dz+nMVqwvbuY
         S8t/LLvatHLFyw4CH3jBV79/EKS2nUUSXIYrsmoe4wri9PNRVuRgBB2fJYQge6LVSU8o
         nHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rKCD7R0V34bHP+PEIAVa+G3pzKzf5Hj2g4Il/OP3pjw=;
        b=qJYUKL0MDwJdmE/fnM5ql+KAFroS9+b0lgwJnqy0XS7FhzN+GzizyujEPMAgGNfRQz
         pWPycwZxcYknC+ILXymCWumPVOxkmcLKl8DBf+AYbBIMdCB7xWGHv+edWGUXzyYz5Viw
         FpAaWmOxwuxWi5gFZwpsNTDyg9xiss575f7r/njLnqmBbDMMTxKYayyUpzMZ1mei8FpJ
         Or/t2tYL2b6lZud2xqpM4pW3ROWyu/UemyYgBCz+NRStmPSvgFKYhza792R2JHlzEPYT
         b4MMlSvfU6F/38j9P0W+vS8qfxOfzabOqFMdNasGOX+goEpsBzaFBw7Exvbwc1COFpMc
         yBzg==
X-Gm-Message-State: AOAM532bQNXmyRz3k2Hgcfv2F1GImuTuxSl5Jkfs37PmXKN9+BYxbiRT
	IDZnExMiRPgKOtElJS6VZPRxS3y0GtFzbw==
X-Google-Smtp-Source: ABdhPJwSmSrrkaHfj6I6o5GANUn+kPFdqahC0fbEbrHn7+cM5CohvOv8gBLukAdTVeh3NYS5bqPSgg==
X-Received: by 2002:a62:5f47:0:b029:244:6648:a1e with SMTP id t68-20020a625f470000b029024466480a1emr3784018pfb.37.1617901039572;
        Thu, 08 Apr 2021 09:57:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6? ([2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6])
        by smtp.gmail.com with ESMTPSA id z23sm25614131pgn.88.2021.04.08.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 09:57:19 -0700 (PDT)
Subject: Re: [oe] [PATCH] [OE-devel] [meta-openembedded] hostapd: fix CVE-2021-30004
To: Stefan Ghinea <stefan.ghinea@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210408164421.21956-1-stefan.ghinea@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8027fa45-f14f-85c8-9d67-ffd30957937b@gmail.com>
Date: Thu, 8 Apr 2021 09:57:17 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408164421.21956-1-stefan.ghinea@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks for your contributioin Stefan, unfortunately this patch is not 
application on master, can you rebase and send again ?

On 4/8/21 9:44 AM, Stefan Ghinea wrote:
> In wpa_supplicant and hostapd 2.9, forging attacks may occur because
> AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c and
> tls/x509v3.c.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2021-30004
> 
> Upstream patches:
> https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15
> 
> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ---
>   .../hostapd/hostapd/CVE-2021-30004.patch      | 123 ++++++++++++++++++
>   .../hostapd/hostapd_2.9.bb                    |   1 +
>   2 files changed, 124 insertions(+)
>   create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
> 
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
> new file mode 100644
> index 000000000..e2540fc26
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
> @@ -0,0 +1,123 @@
> +From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 13 Mar 2021 18:19:31 +0200
> +Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
> +
> +The supported hash algorithms do not use AlgorithmIdentifier parameters.
> +However, there are implementations that include NULL parameters in
> +addition to ones that omit the parameters. Previous implementation did
> +not check the parameters value at all which supported both these cases,
> +but did not reject any other unexpected information.
> +
> +Use strict validation of digest algorithm parameters and reject any
> +unexpected value when validating a signature. This is needed to prevent
> +potential forging attacks.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-30004
> +
> +Reference to upstream patch:
> +[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
> +
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + src/tls/pkcs1.c  | 21 +++++++++++++++++++++
> + src/tls/x509v3.c | 20 ++++++++++++++++++++
> + 2 files changed, 41 insertions(+)
> +
> +diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
> +index 141ac50..e09db07 100644
> +--- a/src/tls/pkcs1.c
> ++++ b/src/tls/pkcs1.c
> +@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
> + 		os_free(decrypted);
> + 		return -1;
> + 	}
> ++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
> ++		    hdr.payload, hdr.length);
> +
> + 	pos = hdr.payload;
> + 	end = pos + hdr.length;
> +@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
> + 		os_free(decrypted);
> + 		return -1;
> + 	}
> ++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
> ++		    hdr.payload, hdr.length);
> + 	da_end = hdr.payload + hdr.length;
> +
> + 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
> +@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
> + 		os_free(decrypted);
> + 		return -1;
> + 	}
> ++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
> ++		    next, da_end - next);
> ++
> ++	/*
> ++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
> ++	 * omit the parameters, but there are implementation that encode these
> ++	 * as a NULL element. Allow these two cases and reject anything else.
> ++	 */
> ++	if (da_end > next &&
> ++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
> ++	     !asn1_is_null(&hdr) ||
> ++	     hdr.payload + hdr.length != da_end)) {
> ++		wpa_printf(MSG_DEBUG,
> ++			   "PKCS #1: Unexpected digest algorithm parameters");
> ++		os_free(decrypted);
> ++		return -1;
> ++	}
> +
> + 	if (!asn1_oid_equal(&oid, hash_alg)) {
> + 		char txt[100], txt2[100];
> +diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
> +index 1bd5aa0..bf2289f 100644
> +--- a/src/tls/x509v3.c
> ++++ b/src/tls/x509v3.c
> +@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
> + 		os_free(data);
> + 		return -1;
> + 	}
> ++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
> +
> + 	pos = hdr.payload;
> + 	end = pos + hdr.length;
> +@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
> + 		os_free(data);
> + 		return -1;
> + 	}
> ++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
> ++		    hdr.payload, hdr.length);
> + 	da_end = hdr.payload + hdr.length;
> +
> + 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
> +@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
> + 		os_free(data);
> + 		return -1;
> + 	}
> ++	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
> ++		    next, da_end - next);
> ++
> ++	/*
> ++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
> ++	 * omit the parameters, but there are implementation that encode these
> ++	 * as a NULL element. Allow these two cases and reject anything else.
> ++	 */
> ++	if (da_end > next &&
> ++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
> ++	     !asn1_is_null(&hdr) ||
> ++	     hdr.payload + hdr.length != da_end)) {
> ++		wpa_printf(MSG_DEBUG,
> ++			   "X509: Unexpected digest algorithm parameters");
> ++		os_free(data);
> ++		return -1;
> ++	}
> +
> + 	if (x509_sha1_oid(&oid)) {
> + 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
> index 1f38eee0f..16a75bc21 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
> @@ -13,6 +13,7 @@ SRC_URI = " \
>       file://hostapd.service \
>       file://CVE-2019-16275.patch \
>       file://CVE-2019-5061.patch \
> +    file://CVE-2021-30004.patch \
>   "
>   
>   SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
> 
> 
> 
> 
> 
