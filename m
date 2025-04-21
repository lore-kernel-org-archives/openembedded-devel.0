Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFD4C369D3
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 20:54:29 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.25188.1745268862930972826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 13:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgUCiiqi;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-400fa6b3012so2085222b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745268862; x=1745873662; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc7csS4MrtgzPPpw/vt9CeHg1rZxrbU5Oax3bVd+UnE=;
        b=FgUCiiqiSApq2qqplC/C4FcpO+8auQj4ORfKpgXCI0HgHToRUBw11QjPdtfbLXFIlY
         Lh9db8oQkLu9SViRbTpq/Cy8Wc7KclQHK2TPghs3BCrujvtt/aMBqGGreajSJBON5FpX
         fEcI/uvZD9DdiMDqQhuDgFQICl+VKDr4e2VZ567QY8Hf9Id1wDe2TH+BFxHxlq+bTrip
         nXU3YH9yERzeZvwbE3XU8Yph3um3T7c2Z9rRsc7WF40E1ovVQ+JUdzxAgsG7/fcKQEpJ
         5Ltz3RVKAQt+LlTDAzdxXc1RrOnuJQxTtgYas6lCF94bKNtNs5FKuILFoKJzjETRdjKF
         gNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745268862; x=1745873662;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lc7csS4MrtgzPPpw/vt9CeHg1rZxrbU5Oax3bVd+UnE=;
        b=R3vDcw75NDTUgCkBRMWjyN48Ow285m0inOa+wczkdWW8hltgBjfHZpY/CbO0WU8QWd
         VAts7gLVavh+HMn7lRCLZevQ0wCp0DIDsf7jrjC0LPsRKSQe38gZKBYEujtm8C15qw34
         m4db4f9VvOS1GdaukrEMKQQTg9NhMryQE2c43eft+ggZRy+yCPIuIclcZSHH8/uAQkxJ
         R6+u8orQ0GEivNSGENnN+PGAZ3jw+2XYmGseiCl/2daRitMyMwsvSAcLsbuWBrWlt/pM
         2mKN0o/e68MLVgv6ozVGjZVZNbZOkPnMzFWXV9dkcSHseKr5+T4/ZA+NXJDE6yaqYJoc
         Vt3A==
X-Forwarded-Encrypted: i=1; AJvYcCWVy6mBdoOxxwHcPfKySd66nKxXN7mJ/L1rtGfvOc4NIrbGe3rcgIV3MiWCDIBeGqxNGRHLo5CGWA71rDgYAMXEP50=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxgpuu0FtFtXU9JU5ee64VrAhp0LZUGu1RjN3Lgi/7DbkcMHzjQ
	nmYDykKpFF254/Y9pBvvNml6uGiKihVG34tLgGxLTnXHjmP2R3Rj
X-Gm-Gg: ASbGnct6/G86Ui+QQF+Exv3Payhv36iwsaVfpYfeETUTEhsqfPRO3p5xeRoGT1isfWe
	oeFljTMgYShK6eYoFruUHOrzO6LlBpEGvCPP+OHAcZwFGRDHA2o+jwy600Cp3ftfX6nugHpYByI
	mALg4ve/TxK5Z3hVFw5zjLgds/X81/EnR4stErIsB+6eLCe/GwuB1axK1kuosPTtb/RtiBiATz0
	lDpDukjgRpMC2ajkJ9fvRE0Lcv6D2/0cGcfne4p2KxvBLglzBZD6RrpR3J9KYzuiSdvre3vcLje
	GIdS6faYKxnTXQ7WpDA9GBHgOqdFX9eA29hnvTlQi1K+8Z8pGTj15kAm/hRh29t5Qptl6XUMFTq
	4e3UrTy4CaotIMeNdyP1w0/iDwuKk
X-Google-Smtp-Source: AGHT+IGnY4W9JVqpYpU6AIydqz4LkSgTuzPLAS9CKoDEii2RQbiwh0nGKEwuPVW47YnXtoP6LIhAlg==
X-Received: by 2002:a05:6808:3c4b:b0:401:16e:951a with SMTP id 5614622812f47-401bcccafa6mr8383738b6e.5.1745268862071;
        Mon, 21 Apr 2025 13:54:22 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:5165:5b01:68ad:eb5f? ([2601:646:8201:fd20:5165:5b01:68ad:eb5f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401bf081e2asm1702194b6e.36.2025.04.21.13.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 13:54:21 -0700 (PDT)
Message-ID: <1179f882-e39c-4943-a1d6-91a52cc82c4d@gmail.com>
Date: Mon, 21 Apr 2025 13:54:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 3/9] libsdl2-image: build with cmake
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250421094832.67450-1-f_l_k@t-online.de>
 <20250421094832.67450-3-f_l_k@t-online.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20250421094832.67450-3-f_l_k@t-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------McOaE4ou48yCkmhFRr6oIEEn"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 20:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117009

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------McOaE4ou48yCkmhFRr6oIEEn
Content-Type: multipart/mixed; boundary="------------vEy5WvNHfXJWsMOoTjLPNDTh";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-ID: <1179f882-e39c-4943-a1d6-91a52cc82c4d@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/9] libsdl2-image: build with cmake
References: <20250421094832.67450-1-f_l_k@t-online.de>
 <20250421094832.67450-3-f_l_k@t-online.de>
In-Reply-To: <20250421094832.67450-3-f_l_k@t-online.de>

--------------vEy5WvNHfXJWsMOoTjLPNDTh
Content-Type: multipart/mixed; boundary="------------KtWXyrF640tE3NAjvJ8t0RC0"

--------------KtWXyrF640tE3NAjvJ8t0RC0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMS8yNSAyOjQ4IEFNLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyB3cm90ZToNCj4gVGhpcyBhbGxvd3MgdG8gdXNlIHdpdGggbGlic2RsMi1jb21wYXQN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4N
Cj4gLS0tDQo+ICAgLi4uL2xpYnNkbC9saWJzZGwyLWltYWdlXzIuOC44LmJiICAgICAgICAg
ICAgICB8IDE4ICsrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwvbGlic2RsMi1pbWFnZV8yLjguOC5iYiBiL21l
dGEtb2UvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwvbGlic2RsMi1pbWFnZV8yLjguOC5iYg0K
PiBpbmRleCBiY2Q4ZTM1YjI3Li4xNWY3YjZmNGI3IDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9l
L3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsL2xpYnNkbDItaW1hZ2VfMi44LjguYmINCj4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbC9saWJzZGwyLWltYWdlXzIuOC44
LmJiDQo+IEBAIC0xMSwyMCArMTEsNiBAQCBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjIxM2I1
NmZkYWZmMjIyMGQwZTM4YzhlNDIwY2JlMWE4M2M4NzM3NDE5MGNiYThjNzBhZjIxNTYwOQ0K
PiAgIA0KPiAgIFMgPSAiJHtXT1JLRElSfS9TREwyX2ltYWdlLSR7UFZ9Ig0KPiAgIA0KPiAt
aW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ICtpbmhlcml0IGNtYWtlIHBrZ2NvbmZp
Zw0KPiAgDQoNCmZhaWxzIHRvIGNvbmZpZ3VyZSBzZWUgaHR0cDovLzB4MC5zdC84Vno0Ljc4
MDUNCg0KDQo+IC0jIERpc2FibGUgdGhlIHJ1bi10aW1lIGxvYWRpbmcgb2YgdGhlIGxpYnMg
YW5kIGJyaW5nIGJhY2sgdGhlIHNvbmFtZSBkZXBlbmRlbmNpZXMuDQo+IC1FWFRSQV9PRUNP
TkYgKz0gIi0tZGlzYWJsZS1qcGctc2hhcmVkIC0tZGlzYWJsZS1wbmctc2hhcmVkIC1kaXNh
YmxlLXRpZi1zaGFyZWQiDQo+IC0NCj4gLWRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgew0KPiAt
ICAgICMgbWFrZSBhdXRvcmVjb25mIGhhcHB5DQo+IC0gICAgdG91Y2ggJHtTfS9ORVdTICR7
U30vUkVBRE1FICR7U30vQVVUSE9SUyAke1N9L0NoYW5nZUxvZw0KPiAtICAgICMgUmVtb3Zp
bmcgdGhlc2UgZmlsZXMgZml4ZXMgYSBsaWJ0b29sIHZlcnNpb24gbWlzbWF0Y2guDQo+IC0g
ICAgcm0gLWYgJHtTfS9hY2luY2x1ZGUvbGlidG9vbC5tNA0KPiAtICAgIHJtIC1mICR7U30v
YWNpbmNsdWRlL3NkbDIubTQNCj4gLSAgICBybSAtZiAke1N9L2FjaW5jbHVkZS9wa2cubTQN
Cj4gLSAgICBybSAtZiAke1N9L2FjaW5jbHVkZS9sdH5vYnNvbGV0ZS5tNA0KPiAtICAgIHJt
IC1mICR7U30vYWNpbmNsdWRlL2x0b3B0aW9ucy5tNA0KPiAtICAgIHJtIC1mICR7U30vYWNp
bmNsdWRlL2x0c3VnYXIubTQNCj4gLSAgICBybSAtZiAke1N9L2FjaW5jbHVkZS9sdHZlcnNp
b24ubTQNCj4gLX0NCj4gK0ZJTEVTOiR7UE59ICs9ICIke2RhdGFkaXJ9L2xpY2Vuc2VzIg0K
PiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJl
Y2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBP
bmxpbmUgKCMxMTY5OTcpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTY5OTcNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTEyMzcyNDg5LzE5OTc5MTQNCj4gR3Jv
dXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------KtWXyrF640tE3NAjvJ8t0RC0
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------KtWXyrF640tE3NAjvJ8t0RC0--

--------------vEy5WvNHfXJWsMOoTjLPNDTh--

--------------McOaE4ou48yCkmhFRr6oIEEn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAawfAUDAAAAAAAKCRC7BTNVkZ0zFPHk
AJwM0BFpE4fIhy1EzaS/VanE04GmbQCePXWlGOSgcJMNetT8DSl0n0OtqAk=
=PeSO
-----END PGP SIGNATURE-----

--------------McOaE4ou48yCkmhFRr6oIEEn--

