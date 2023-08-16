Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42813EB64DD
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:52:00 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.165767.1692204718731225769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=V15ImzW0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-687ca37628eso6400782b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692204718; x=1692809518;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EUlVMqLb5dIT0cdA4RTQZEQrzN/7qX/i7iFJNELtFn0=;
        b=V15ImzW0AMUZcdA5qqInO8b2tmg/3dhpZ6Ufs8huSjQccciF2+jOe6+HwUNhCPusmN
         /NfkybwgvRgH71Q/N1uMExQDKMdejX9iy6/9GFvKL4j4q/RrgvM4hq6DjulI+eTO6Hce
         5zJFBbMWQELvWM5a4dDedmUAss34hhSBkI3zgivBaBOqV4j5KMIFfur4rMKH+cjrVyZ1
         GlaEXdO130/gKla45YGyrk1q3bNGaJpA8r6owYkWclyqdfqPP6S86JbWe4TvT0TLlRLA
         zY4PWUvR3tx102veddGEW6myRu/INB08FNXk4kaZxsf7GoOzoKPu18LoZaWRBLn/ZQMA
         HRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204718; x=1692809518;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUlVMqLb5dIT0cdA4RTQZEQrzN/7qX/i7iFJNELtFn0=;
        b=T8lL0k5gCOheqAgY9fW0HifuSqKsh0ezej18UC6uA5KfjAdqyN7KcljrF50LQ1IqyP
         6+tGjnrGiv47b6j/3BJQ5LN9shhYmnVpydgvuUpAJwjr0v5q2dZNh/M6InbqlPvOBfRl
         IxGm2GHODNhcbF97dCR9cNXaQr75cW/nKaBatsXeNeSdwwJ41oM7DQBtwsbb5fTe19Og
         3lRzh6QIW+ePDe46TMYH+uugosnUsMZkGCa48DPwf63VEkoqkbPUdQrpNfoiC03ZvLQ1
         48zA2+ffag64iEfIfSTxn2Dm4J7mI02D6Unqlm2Df06ttSOVQj96gngFVpV+CNQTIdLr
         JI3A==
X-Gm-Message-State: AOJu0YzlHST646tFHlAUOJjQ3GJLjxC4aNSNTCq52yILQETJy+Ul+3sA
	HrhcVD7+cSsmy8jrhz1qz4E=
X-Google-Smtp-Source: AGHT+IHAzHVT/ldWRUWDBnPU6srkouoEs4RSLKqJKvrnwVC2uvxRZPB8CDh2XyUwizEbG0ZAU5stlA==
X-Received: by 2002:a05:6a20:8e02:b0:138:1980:1837 with SMTP id y2-20020a056a208e0200b0013819801837mr3678288pzj.13.1692204717968;
        Wed, 16 Aug 2023 09:51:57 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b192:e884:f5f4:7725? ([2601:646:9100:2cb0:b192:e884:f5f4:7725])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7874f000000b0068875a862adsm2215119pfo.98.2023.08.16.09.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:51:57 -0700 (PDT)
Message-ID: <276501b7-8461-43bb-9473-bab1ed07397d@gmail.com>
Date: Wed, 16 Aug 2023 09:51:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] recipes-extended: add qcbor recipe
Content-Language: en-US
To: Pawel Langowski <pawel.langowski@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
References: <20230816084754.1399376-1-pawel.langowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230816084754.1399376-1-pawel.langowski@3mdeb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RDP2gXJVZWKd0nSNBchcHksb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104438

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RDP2gXJVZWKd0nSNBchcHksb
Content-Type: multipart/mixed; boundary="------------pmnqWCEuEgBqf8ZGVDII38rv";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Pawel Langowski <pawel.langowski@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
Message-ID: <276501b7-8461-43bb-9473-bab1ed07397d@gmail.com>
Subject: Re: [oe] [PATCH] recipes-extended: add qcbor recipe
References: <20230816084754.1399376-1-pawel.langowski@3mdeb.com>
In-Reply-To: <20230816084754.1399376-1-pawel.langowski@3mdeb.com>

--------------pmnqWCEuEgBqf8ZGVDII38rv
Content-Type: multipart/mixed; boundary="------------LFfCgq4CGyBT8A6hj37P0c07"

--------------LFfCgq4CGyBT8A6hj37P0c07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpTdWJqZWN0IGNhbiBiZSBpbXByb3ZlZCBhcyBwZXIuDQoNCmh0dHBzOi8vd3d3Lm9wZW5l
bWJlZGRlZC5vcmcvd2lraS9Ib3dfdG9fc3VibWl0X2FfcGF0Y2hfdG9fT3BlbkVtYmVkZGVk
DQoNCk9uIDgvMTYvMjMgMTo0NyBBTSwgUGF3ZWwgTGFuZ293c2tpIHdyb3RlOg0KPiAtLS0N
Cj4gICBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcWNib3IvcWNib3JfZ2l0LmJiIHwgMzIg
KysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L3FjYm9yL3FjYm9yX2dpdC5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy1leHRlbmRlZC9xY2Jvci9xY2Jvcl9naXQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5k
ZWQvcWNib3IvcWNib3JfZ2l0LmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uNmU4NzQ1OGMzYTNlDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3FjYm9yL3FjYm9yX2dpdC5iYg0KPiBAQCAtMCww
ICsxLDMyIEBADQo+ICtERVNDUklQVElPTiA9ICIgXA0KPiArICAgIFFDQk9SIGlzIGEgcG93
ZXJmdWwsIGNvbW1lcmNpYWwtcXVhbGl0eSBDQk9SIGVuY29kZXIvZGVjb2RlciB0aGF0IFwN
Cj4gKyAgICBpbXBsZW1lbnRzIHRoZXNlIFJGQ3M6IFJGQzg5NDksIFJGQzcwNDksIFJGQzg3
NDIsIFJGQzg5NDMgXA0KPiArIg0KPiArDQo+ICtIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vbGF1cmVuY2VsdW5kYmxhZGUvUUNCT1IiDQo+ICsNCj4gK0xJQ0VOU0UgPSAiQlNE
LTMtQ2xhdXNlIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLm1kO2Jl
Z2lubGluZT00NDI7ZW5kbGluZT00NjM7bWQ1PWI1NTY0MzI2MWQ2ZDIyMWRhYzJiN2EzOTUx
MDVhZjYyIg0KPiArDQo+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGF1cmVuY2Vs
dW5kYmxhZGUvUUNCT1I7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciINCj4gKw0KPiAr
U1JDUkVWID0gIjQ0NzU0ZjczOGM2NTM0YTQzMDRhODNkNGM2ZTk3YjNkMzE5M2Q4ODciDQo+
ICsNCj4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQo+ICsNCj4gK0lOU0FORV9TS0lQOiR7UE59
LWRldiArPSAibGRmbGFncyINCg0Kd2h5IGlzIHRoaXMgbmVlZGVkLg0KDQo+ICsNCj4gK2lu
aGVyaXQgcGtnY29uZmlnDQo+ICsNCj4gK0NGTEFHUyArPSAiIFwNCj4gKyAgICAtRFVTRUZV
TEJVRl9ESVNBQkxFX0FMTF9GTE9BVCBcDQo+ICsiDQo+ICsNCj4gK2RvX2luc3RhbGwoKXsN
Cj4gKyAgICBpbnN0YWxsIC1kICR7RH0ke2xpYmRpcn0NCj4gKyAgICBpbnN0YWxsIC1tIDc1
NSAke1N9L2xpYnFjYm9yLmEgJHtEfSR7bGliZGlyfS8NCj4gKyAgICBpbnN0YWxsIC1kICR7
RH0ke2luY2x1ZGVkaXJ9L3FjYm9yDQo+ICsgICAgaW5zdGFsbCAtbSA2NDQgJHtTfS9pbmMv
Ki5oICR7RH0ke2luY2x1ZGVkaXJ9DQo+ICsgICAgaW5zdGFsbCAtbSA2NDQgJHtTfS9pbmMv
cWNib3IvKi5oICR7RH0ke2luY2x1ZGVkaXJ9L3FjYm9yDQo+ICt9DQo+ICsNCj4gDQo+IA0K
PiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgj
MTA0NDIwKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWRldmVsL21lc3NhZ2UvMTA0NDIwDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDc3NTcxNS8xOTk3OTE0DQo+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IA0K
--------------LFfCgq4CGyBT8A6hj37P0c07
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------LFfCgq4CGyBT8A6hj37P0c07--

--------------pmnqWCEuEgBqf8ZGVDII38rv--

--------------RDP2gXJVZWKd0nSNBchcHksb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZNz+rAUDAAAAAAAKCRC7BTNVkZ0zFMk1
AJ9uW3+RV32chungrayiLZZukNwUqwCcClKrhrm9pO3CI1pILNVHqVmeRb4=
=MqvR
-----END PGP SIGNATURE-----

--------------RDP2gXJVZWKd0nSNBchcHksb--

