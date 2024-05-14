Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90748C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 11:44:23 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.13199.1715687053309210554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 04:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fX2nwgG0;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c9936cb7a8so2529366b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715687052; x=1716291852; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp++Ak0AIxzqJXF0H8g7eUch1EdwQxglSKLbZdgfAQE=;
        b=fX2nwgG0tdCFgREFB6QGo6yuxPyVPml3OmCA7wlmUPDCjnBsINn+AP+4bzi5dky5+M
         FZz3xmQZR3zm8AuyF9rz84DuhHQnm/NnPAEEHJFIdz+lzzSODD4V9zgy+XTgz+50I5e0
         Qi80zhS+pZopEVXBqlBoNvWhImY55YqaBdWHHBY5laJe4tnjC7sISHv4RC2RKixNnLc0
         l2AGoctG9c2NmYLEN7mCaFXMlDEB9Rvd9nuNOEY0tK8WRauX6YfNbZr2jN7KiEMxctZu
         upahaQoE/f3IJj4i4d82bmEUwXpSDxLTpWozvbino4zslU572Z0QZhLD5w3xk+L4tC18
         ygDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715687052; x=1716291852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yp++Ak0AIxzqJXF0H8g7eUch1EdwQxglSKLbZdgfAQE=;
        b=qDAYl9bzu1o2prfXPCWZzC7IUBfI5RQi7DlT0V4TdEYjDSJsdJiRo1rM7Xnz2WI8a5
         SpnvHpwfjPJXfhiny6jgb2+tbpLGI6lsXZAj72F9L1tOdoT4VaXFdmLuR/YbUbXZotgo
         wzw1MU0R3U8gSMtvaM/osAhZHOgG+YhSh4te26pDz3Gnn8kXVbCqEcA4MfT1bbEb3pWi
         g12r/RVFjuzefyyDFbJ2PqT3CzwRP0lKAbso+i6aJVMGkla7tuAtjPm3ErHzhvqjksC3
         1aP4TTnXrYJhfz6Iq/KkaQsft6LwlTopweLRcQc287fJ5eZNgRFMagjE/fs9IzOsZAgZ
         wwIA==
X-Forwarded-Encrypted: i=1; AJvYcCUcUVVdn9xBY+oLveg3XI3WtaoPoykxy3HPjFu7Tyf+SyuIZc7qSdHpPcoHrTv20cDfOmuBqQ8xTPFhez/4wwHVnYt+r+NmsLE6h5VVaV3hg7TuVviH37RI+A==
X-Gm-Message-State: AOJu0YyI7EtfAtn/3fxOPIuhlwqPGoRA0v1LqzzR8360sAslVs2IDu8H
	7nj3kzsuAiOIqMGw1WWKiNeBezwFk2+Co4pNo/0wtVUiajE87/jXw11qWA==
X-Google-Smtp-Source: AGHT+IHbkLit6P++sqdSRNItekoA4VUXB7HquoZwdHED4JLKA942YppnlLkE0tDTO53T5OYg56L1Yg==
X-Received: by 2002:a05:6808:2186:b0:3c9:66bf:870a with SMTP id 5614622812f47-3c9970b9c13mr15734163b6e.46.1715687052423;
        Tue, 14 May 2024 04:44:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:6fe3:6698:9ae1:494a? ([2600:1700:45dd:7000:6fe3:6698:9ae1:494a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3c9938915e5sm1666419b6e.52.2024.05.14.04.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 04:44:11 -0700 (PDT)
Message-ID: <4d9f62b3-747f-4d43-ab1f-17b50cf60d75@gmail.com>
Date: Tue, 14 May 2024 07:44:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH V1] ITS#10094 libldap/OpenSSL:
 fix setting ciphersuites
To: pdoshi@mvista.com, openembedded-devel@lists.openembedded.org
References: <1715602845-8547-1-git-send-email-pdoshi@mvista.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <1715602845-8547-1-git-send-email-pdoshi@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 11:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110392

Priyal,

What versions of openldap does this affect? Do we need this in other 
branches like master or scarthgap?

- armin

On 5/13/24 8:20 AM, Priyal Doshi via lists.openembedded.org wrote:
> From: Priyal Doshi <pdoshi@mvista.com>
>
> Backport-from: https://git.openldap.org/openldap/openldap/-/merge_requests/654/diffs?commit_id=8c482cec9a68e74b3609b1e44738bee352f6577a
>
> Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> ---
>   ...-libldap-OpenSSL-fix-setting-ciphersuites.patch | 69 ++++++++++++++++++++++
>   .../recipes-support/openldap/openldap_2.5.16.bb    |  1 +
>   2 files changed, 70 insertions(+)
>   create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch
>
> diff --git a/meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch b/meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch
> new file mode 100644
> index 0000000..211dbe9
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch
> @@ -0,0 +1,69 @@
> +From 7cee69298857e2393799780ee472dfe0a378ee2d Mon Sep 17 00:00:00 2001
> +From: Howard Chu <hyc@openldap.org>
> +Date: Thu, 12 Oct 2023 17:22:48 +0100
> +Subject: [PATCH] ITS#10094 libldap/OpenSSL: fix setting ciphersuites
> +
> +Don't try old-style ciphersuite list if only v1.3 or newer ciphers were specified
> +
> +Upstream-Status: Backport from https://git.openldap.org/openldap/openldap/-/merge_requests/654/diffs?commit_id=8c482cec9a68e74b3609b1e44738bee352f6577a
> +
> +Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> +---
> + libraries/libldap/tls_o.c | 16 +++++++++++++---
> + 1 file changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/libraries/libldap/tls_o.c b/libraries/libldap/tls_o.c
> +index d6405bc..4123a9b 100644
> +--- a/libraries/libldap/tls_o.c
> ++++ b/libraries/libldap/tls_o.c
> +@@ -294,7 +294,7 @@ tlso_stecpy( char *dst, const char *src, const char *end )
> +  * Try to find any TLS1.3 ciphers in the given list of suites.
> +  */
> + static void
> +-tlso_ctx_cipher13( tlso_ctx *ctx, char *suites )
> ++tlso_ctx_cipher13( tlso_ctx *ctx, char *suites, char **oldsuites )
> + {
> + 	char tls13_suites[1024], *ts = tls13_suites, *te = tls13_suites + sizeof(tls13_suites);
> + 	char *ptr, *colon, *nptr;
> +@@ -303,6 +303,8 @@ tlso_ctx_cipher13( tlso_ctx *ctx, char *suites )
> + 	SSL *s = SSL_new( ctx );
> + 	int ret;
> +
> ++	*oldsuites = NULL;
> ++
> + 	if ( !s )
> + 		return;
> +
> +@@ -334,8 +336,15 @@ tlso_ctx_cipher13( tlso_ctx *ctx, char *suites )
> + 					if ( tls13_suites[0] )
> + 						ts = tlso_stecpy( ts, ":", te );
> + 					ts = tlso_stecpy( ts, nptr, te );
> ++				} else if (! *oldsuites) {
> ++					/* should never happen, set_ciphersuites should
> ++					 * only succeed for TLSv1.3 and above
> ++					 */
> ++					*oldsuites = ptr;
> + 				}
> + 			}
> ++		} else if (! *oldsuites) {
> ++			*oldsuites = ptr;
> + 		}
> + 		if ( !colon || ts >= te )
> + 			break;
> +@@ -415,10 +424,11 @@ tlso_ctx_init( struct ldapoptions *lo, struct ldaptls *lt, int is_server )
> + 	}
> +
> + 	if ( lo->ldo_tls_ciphersuite ) {
> ++		char *oldsuites = lt->lt_ciphersuite;
> + #if OPENSSL_VERSION_NUMBER >= 0x10101000
> +-		tlso_ctx_cipher13( ctx, lt->lt_ciphersuite );
> ++		tlso_ctx_cipher13( ctx, lt->lt_ciphersuite, &oldsuites );
> + #endif
> +-		if ( !SSL_CTX_set_cipher_list( ctx, lt->lt_ciphersuite ) )
> ++		if ( oldsuites && !SSL_CTX_set_cipher_list( ctx, oldsuites ) )
> + 		{
> + 			Debug1( LDAP_DEBUG_ANY,
> + 				   "TLS: could not set cipher list %s.\n",
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
> index 9e9d059..7e1c8fd 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>       file://slapd.service \
>       file://remove-user-host-pwd-from-version.patch \
>       file://0001-build-top.mk-unset-STRIP_OPTS.patch \
> +    file://0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch \
>   "
>   
>   SRC_URI[sha256sum] = "546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110338): https://lists.openembedded.org/g/openembedded-devel/message/110338
> Mute This Topic: https://lists.openembedded.org/mt/106071184/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


