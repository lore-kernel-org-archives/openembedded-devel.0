Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473A0EB64DD
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:49:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.165897.1692204584552205424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CPO6HMIK;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-26b4cf4f7b9so2216953a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692204584; x=1692809384;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Rv3XBzy1vT1WsQmng5MBOY0r4R5usU6bD14HIj63J8=;
        b=CPO6HMIKUvV6tqBjIYMfTK3Kujcc/JmKu/eMrK4W9M2g0Kh48/57Rx/ZFyrLWopKYN
         TNPGNllDb6Mcs3OmDY15x03jbW9i2fzJlNtdrVF+Ebvh3m5i0cCT5j+msuV3zGqoByzt
         l6xs7wTx3xN04Kq/boIw04svRQcZ1ijrppOMauqoagAjYiRG+q6Wk74xdLepfLmAPUgI
         9c+eoqNvMUi8US+jBw2wCT6pHvGpIwjZoYXwjq+7kQbBTHUcs27l8xjqGT1OLdK8Ub3K
         sPmztbbO+n5JO7e2N/OTyvZ+bl0pcLo8fo9TyEZPCiQiOrfIXlVWkH6L/8DPai1Oq53F
         TfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204584; x=1692809384;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Rv3XBzy1vT1WsQmng5MBOY0r4R5usU6bD14HIj63J8=;
        b=k+kY7aLp/zt0zGeVZS+GIgPytSV7KT7FSa32z0GTbz9uu9nkXNZBhM2AN4E+lP+Yiu
         tTEPaRTE4G2CIG46DIMXA3ye8sEmzCWBbHZhMS74NMzlz61tTXKrKotqZ/ljSiWqCxB6
         eM2ZRIbvDGiikl5556bThjnoT6E1WGJAGdaB3ZnWWI+G9lofyA9YuOgN85xrWA3C+L7/
         AkC4wmfkeB7PBo3NG4PQMqQAS9R4erJV73OwJYN6wP/gBNXKq5XWKhjxDKfShCC/2tLU
         F4UcSZscx0WoyEiB+YXY/uZKgWbuG1WAYrw7CAjG+Hc+M9Obugsq1TSaBXNqbHxXTc28
         4jAQ==
X-Gm-Message-State: AOJu0YzzZvMHD5mII7bGcAqSc6PXx3L1QxJY7ot4P2mIk3/QgGwxZxru
	z553YZvKfopX9Aa2seEB+ck=
X-Google-Smtp-Source: AGHT+IHceQvtxid/ZaFg24kYhtRVzPW8dWC6biKzAL8Sf9b87zxFQhb62oYcSyOwSRvC9UxH9BSWrA==
X-Received: by 2002:a17:90a:7bca:b0:269:3771:7342 with SMTP id d10-20020a17090a7bca00b0026937717342mr1710899pjl.18.1692204583949;
        Wed, 16 Aug 2023 09:49:43 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b192:e884:f5f4:7725? ([2601:646:9100:2cb0:b192:e884:f5f4:7725])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a001b00b0025be7b69d73sm12485937pja.12.2023.08.16.09.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:49:43 -0700 (PDT)
Message-ID: <94bb08fa-ccd7-48b7-89a1-fdc069f8ee11@gmail.com>
Date: Wed, 16 Aug 2023 09:49:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [[meta-python][PATCH] 2/2]
 recipes-devtools/python3-oauth2client/python3-oauth2client.inc: OAuth 2.0
 client library added
Content-Language: en-US
To: Ewa Kujawska <ewa.kujawska@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
References: <20230816061437.3303787-1-ewa.kujawska@3mdeb.com>
 <20230816061437.3303787-2-ewa.kujawska@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230816061437.3303787-2-ewa.kujawska@3mdeb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y06wrAjdJ9sXJCIC01KICbjS"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104437

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y06wrAjdJ9sXJCIC01KICbjS
Content-Type: multipart/mixed; boundary="------------0Rh9bwQK52KE30YxAbCL0Zto";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ewa Kujawska <ewa.kujawska@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
Message-ID: <94bb08fa-ccd7-48b7-89a1-fdc069f8ee11@gmail.com>
Subject: Re: [oe] [[meta-python][PATCH] 2/2]
 recipes-devtools/python3-oauth2client/python3-oauth2client.inc: OAuth 2.0
 client library added
References: <20230816061437.3303787-1-ewa.kujawska@3mdeb.com>
 <20230816061437.3303787-2-ewa.kujawska@3mdeb.com>
In-Reply-To: <20230816061437.3303787-2-ewa.kujawska@3mdeb.com>

--------------0Rh9bwQK52KE30YxAbCL0Zto
Content-Type: multipart/mixed; boundary="------------axSB0yPc5hhnhdT00L00cscR"

--------------axSB0yPc5hhnhdT00L00cscR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

c3ViamVjdCBhbmQgZGVzY3JpcHRpb24gb2YgcGF0Y2ggY2FuIGJlIG1hZGUgaW5saW5lIHdp
dGggcmVjb21tZW5kYXRpb25zIGluDQoNCmh0dHBzOi8vd3d3Lm9wZW5lbWJlZGRlZC5vcmcv
d2lraS9Ib3dfdG9fc3VibWl0X2FfcGF0Y2hfdG9fT3BlbkVtYmVkZGVkDQoNCk9uIDgvMTUv
MjMgMTE6MTQgUE0sIEV3YSBLdWphd3NrYSB3cm90ZToNCj4gLS0tDQo+ICAgLi4uL3B5dGhv
bi1vYXV0aDJjbGllbnQuaW5jICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysr
KysrKysrKw0KDQoNCmlzIHRoZXJlIGEgcmVhc29uIGZvciB0aGlzIHRvIGJlIHB1dCBpbnRv
IGEgLmluYyBmaWxlLCB1c3VhbGx5IGl0cyBkb25lIA0Kd2hlbiBtb3JlIHRoYW4gMSByZWNp
cGUgY2FuIHNoYXJlIGV4YWN0IHNhbWUgY29kZS4gT3RoZXJ3aXNlIG1lcmdlIGl0IA0KaW50
byB0aGUgcHJldmlvdXMgcGF0Y2gNCg0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uMy1vYXV0aDJjbGllbnQvcHl0aG9uLW9hdXRoMmNsaWVudC5pbmMNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMt
b2F1dGgyY2xpZW50L3B5dGhvbi1vYXV0aDJjbGllbnQuaW5jIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24zLW9hdXRoMmNsaWVudC9weXRob24tb2F1dGgyY2xpZW50
LmluYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQw
YTk2MGUyZDJjMQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uMy1vYXV0aDJjbGllbnQvcHl0aG9uLW9hdXRoMmNsaWVudC5p
bmMNCj4gQEAgLTAsMCArMSwxOCBAQA0KPiArREVTQ1JJUFRJT04gPSAiT0F1dGggMi4wIGNs
aWVudCBsaWJyYXJ5Ig0KPiArQVVUSE9SID0gIkdvb2dsZSBJbmMuIg0KDQpkcm9wIGl0DQoN
Cj4gK0hPTUVQQUdFID0gImh0dHA6Ly9naXRodWIuY29tL2dvb2dsZS9vYXV0aDJjbGllbnQv
Ig0KPiArTElDRU5TRSA9ICJBcGFjaGUtMi4wIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9MDM4ZTEzOTBlOTRmZTYzNzk5MWZhNTU2OWRhYTYyYmMiDQo+
ICsNCj4gK2luaGVyaXQgcHlwaQ0KPiArDQo+ICtTUkNfVVJJW21kNXN1bV0gPSAiYmMzMDk3
NmNkMWU4NTljZDYxOTkyNjRhNTBjNWJhNzIiDQoNCkRyb3AgdGhpcyB0b28uDQoNCj4gK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJiZDMwNjJjMDZmOGIxMGM2ZWY3YTg5MGIyMmMyNzQwZTVm
ODdkNjFiNmUxZjRiMWM5MGQwNjljZGZjOWRhZGI1Ig0KPiArDQo+ICtSREVQRU5EUzoke1BO
fSArPSAiIFwNCj4gKyAgICAgICAgJHtQWVRIT05fUE59LWh0dHBsaWIyIFwNCj4gKyAgICAg
ICAgJHtQWVRIT05fUE59LXB5YXNuMSBcDQo+ICsgICAgICAgICR7UFlUSE9OX1BOfS1weWFz
bjEtbW9kdWxlcyBcDQo+ICsgICAgICAgICR7UFlUSE9OX1BOfS1yc2EgXA0KPiArICAgICAg
ICAke1BZVEhPTl9QTn0tc2l4IFwNCj4gKyAgICAgICAgIg0KPiANCj4gDQo+IA0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMDQ0MTIpOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVz
c2FnZS8xMDQ0MTINCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbXQvMTAwNzc0NTAxLzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJl
ZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJl
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwv
dW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gDQo=
--------------axSB0yPc5hhnhdT00L00cscR
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------axSB0yPc5hhnhdT00L00cscR--

--------------0Rh9bwQK52KE30YxAbCL0Zto--

--------------Y06wrAjdJ9sXJCIC01KICbjS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZNz+JgUDAAAAAAAKCRC7BTNVkZ0zFJHd
AJ0Qwb1hKYE4Dm/1z7JGzPZE9/teuwCgjJSBBcBhx47QJsGPW0j9tFdgc00=
=9GAt
-----END PGP SIGNATURE-----

--------------Y06wrAjdJ9sXJCIC01KICbjS--

