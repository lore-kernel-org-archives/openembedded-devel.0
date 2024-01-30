Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5F0C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 17:28:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2192.1706635685197739477
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 09:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Afnk4ON4;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d70b0e521eso29846145ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706635684; x=1707240484; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DF1J+ZE28exdiM6UB6ixyH3tnz+8ud+KeVyUavyYvJU=;
        b=Afnk4ON4Y3EyAyr3I1HHSbeio3MC0P+j0EabGrRBC0jPwdaWCRT+33EmoZQ/tZJEVH
         AfMJZ/kYEJv8Z+FTPubiMhkTjz4K7FZHzVUWqzjCVPrmakuEVOPP9ykCUfYujkmLCPzA
         WOGa+vSqk4JWObc90IctftrD54sOHsU2zZsKm8XgDh0QC5g/PTMkfbM3bFIaUHw85LnE
         ZEyJ8aIv/0ovE1PUk2a2n6adabZfKMWapbPKv9wiofLytJAmhNQ5WNJV9Igo57snBw/G
         exgkIpOHiBxFnktYY/8n+LgPSHS1hO+jJrFrJHM9hZaF9Xqt7ePMNai/edJkv7krW3Jp
         HnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706635684; x=1707240484;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DF1J+ZE28exdiM6UB6ixyH3tnz+8ud+KeVyUavyYvJU=;
        b=eqOpN32QND381gT1Xp4RPc7bqz0BJeYNkgCuYy0I38/OMO+VZVOtCOjk2xggI3fckn
         R/yElFU9w6z14A9LrncOfaDJShm+oApeaNZ3Y+DpQwl5TYwaCKmk8RFQ8R1//j4xb/ii
         bzS14IWUQnCtptlJHixOe5ZhXT3/JfV29OZYqb3Re+VIjwWTprszKE5uxW3zjSc4pmXU
         mteR3OCCCkgCUF+UfObZXUiqmMFo+k8u+5kQJ4bo8zD8+PpbkAajiKFu7rnbTKqYOzfV
         C8fkFxqJZpuxWq5/96YS+wYy7jwfYUAjgX9nV+6cQsm1EDtpxZG8JJWcVTHfnXTW0Flz
         E5qA==
X-Gm-Message-State: AOJu0YzJ9Y5xkOGWUHieJ8Mu9jkymJKdyZmU1M0pt8CGE3mkBM0VqTcR
	aq6HJSOu/2B3uTyJjoRVGUvvnX9bBkCisJwUop21+XQPmHX1knmO
X-Google-Smtp-Source: AGHT+IFajBHyJWQ6A5UMwsfqM3DAyShMOzygtRzynzRwAT4LzuymMWkXojCjcGYGSi+ZAWTJ8fEYJw==
X-Received: by 2002:a17:902:e844:b0:1d7:5943:21b8 with SMTP id t4-20020a170902e84400b001d7594321b8mr9773788plg.16.1706635684439;
        Tue, 30 Jan 2024 09:28:04 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:71cb:ba06:93a0:8d09? ([2601:646:9d80:4380:71cb:ba06:93a0:8d09])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902ee4400b001d8ceaa1a5bsm4640624plo.304.2024.01.30.09.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 09:28:04 -0800 (PST)
Message-ID: <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com>
Date: Tue, 30 Jan 2024 09:28:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] redis: restore Upstream-Status
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com
References: <20240130103458.819774-1-martin.jansa@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20240130103458.819774-1-martin.jansa@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o91Xw9yFz0N3a72fHFNddcZa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 17:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108495

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o91Xw9yFz0N3a72fHFNddcZa
Content-Type: multipart/mixed; boundary="------------KaMuMjzCs3e6ZMVTl3HWLWSU";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com
Message-ID: <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] redis: restore Upstream-Status
References: <20240130103458.819774-1-martin.jansa@gmail.com>
In-Reply-To: <20240130103458.819774-1-martin.jansa@gmail.com>

--------------KaMuMjzCs3e6ZMVTl3HWLWSU
Content-Type: multipart/mixed; boundary="------------okCJc0bTz7S5XhJPpXRAt7Re"

--------------okCJc0bTz7S5XhJPpXRAt7Re
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS8zMC8yNCAyOjM0IEFNLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+ICogYWNjaWRlbnRh
bGx5IGRyb3BwZWQgaW46DQo+ICAgIGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvbWV0
YS1vcGVuZW1iZWRkZWQvY29tbWl0Lz9pZD1lOTFmYTY2OGVkMWRkNGEzZjZiMDZiY2IwOTlm
NzBkYmRkMmE1MGI0DQo+IC0tLQ0KPiAgIC4uLi9sdWEtdXBkYXRlLU1ha2VmaWxlLXRvLXVz
ZS1lbnZpcm9ubWVudC1idWlsZC1zZXR0aW5nLnBhdGNoICB8IDIgKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi40L2x1YS11cGRhdGUtTWFrZWZpbGUt
dG8tdXNlLWVudmlyb25tZW50LWJ1aWxkLXNldHRpbmcucGF0Y2ggYi9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjQvbHVhLXVwZGF0ZS1NYWtlZmlsZS10by11
c2UtZW52aXJvbm1lbnQtYnVpbGQtc2V0dGluZy5wYXRjaA0KPiBpbmRleCBiNTYyZTI1MjJj
Li40OGE4YmI1YjRiIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQv
cmVkaXMvcmVkaXMtNy4yLjQvbHVhLXVwZGF0ZS1NYWtlZmlsZS10by11c2UtZW52aXJvbm1l
bnQtYnVpbGQtc2V0dGluZy5wYXRjaA0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5k
ZWQvcmVkaXMvcmVkaXMtNy4yLjQvbHVhLXVwZGF0ZS1NYWtlZmlsZS10by11c2UtZW52aXJv
bm1lbnQtYnVpbGQtc2V0dGluZy5wYXRjaA0KPiBAQCAtMTYsNiArMTYsOCBAQCB1cGRhdGVk
IHRvIHdvcmsgd3RpaCA2LjIuMQ0KPiAgIFNpZ25lZC1vZmYtYnk6IFlpIEZhbiBZdSA8eWlm
YW4ueXVAd2luZHJpdmVyLmNvbT4NCj4gICANCj4gICAtLS0NCj4gK1Vwc3RyZWFtLVN0YXR1
czogUGVuZGluZw0KDQpJIHRoaW5rIGl0IG1pZ2h0IGJlIGJldHRlciB0byBtb3ZlIGl0IGFi
b3ZlIHRoZSBzY2lzc29yIHRvIGF2b2lkIGdldHRpbmcgDQpsb3N0IGluIG5leHQgZGV2dG9v
bCBiYXNlZCB1cGdyYWRlLg0KDQo+ICsNCj4gICAgZGVwcy9NYWtlZmlsZSAgICAgICAgIHwg
IDEgLQ0KPiAgICBkZXBzL2x1YS9NYWtlZmlsZSAgICAgfCAgMSAtDQo+ICAgIGRlcHMvbHVh
L3NyYy9NYWtlZmlsZSB8IDE2ICsrKysrKy0tLS0tLS0tLS0NCj4gDQo+IA0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA4NDkyKTog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21l
c3NhZ2UvMTA4NDkyDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL210LzEwNDA1MTA5NS8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmli
ZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVs
L3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IA0K
--------------okCJc0bTz7S5XhJPpXRAt7Re
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------okCJc0bTz7S5XhJPpXRAt7Re--

--------------KaMuMjzCs3e6ZMVTl3HWLWSU--

--------------o91Xw9yFz0N3a72fHFNddcZa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZbkxogUDAAAAAAAKCRC7BTNVkZ0zFLS6
AJ4zNr3q9UE/Yjr+BOBjkx36yoasJgCbBYxEyIWJlwRdtwfR9p19bb22ckE=
=qziJ
-----END PGP SIGNATURE-----

--------------o91Xw9yFz0N3a72fHFNddcZa--

