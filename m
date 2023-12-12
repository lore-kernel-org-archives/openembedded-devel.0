Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBDFC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 16:19:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.540.1702397974864919129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 08:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQ8TCmsP;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28ab4348bbcso798595a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 08:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702397974; x=1703002774; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0bkzRaZCWAauN0nY8ife3AvYtauXKkFmHhdaW89XSw=;
        b=UQ8TCmsP7FLES+gj4R1Q6avKKHaC6Q21z2mP6VtUyqLOBZtNpHIfct4cKlMlQYH6ZA
         Eh66EBDXP/k0bwydRBgY2FOvf5g8HBr7cSmYaxALul2TTm1WlWJfxImq4Tw2qKFSskXP
         p1cF6IHQC+WMqT1HIneD/INgH07nGjeZaeWfOZuRXhb6h/ZI9V/LZFeSSwkKZdU3Sdqo
         /0w1HmJNwezLDjq6fkd31RGkPmSBSZGSssuTjJHpc4R3atWSAzSkj/510H50D3ol9pBO
         tzPLo77srCrjyqUjC60dfuJHdf3R/d4/n0xDM+TkR8M6eGrNzBjry/yz5kH8p0/lgeK1
         osnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702397974; x=1703002774;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0bkzRaZCWAauN0nY8ife3AvYtauXKkFmHhdaW89XSw=;
        b=T8gRcZePHXPqyvAqs3I7sjZcAGm6dr7YWznbwnSRAL5wF6bMzEXn+JhKZv9+kMS8gZ
         7T0PSVQR1x7nNTKQ4m2W7Ul6xUYIWUqSDtUuCozGnLQMy80WeRt3GBLrrI0mjlCdv15r
         kZDoezjAbSvJMamG7N522FqbSvXH0gz7qZ9ZNNnnPRv6gFiq2JuG7se0SwVzFW/E61DL
         fV9e0Xx5/dlG+AUTt1O6Uhk+izIKszRZUvuLEqCcu7JQfRteTCfn33Ko18FuGmEgLuW9
         of9tk5i5YwvNp8ZeR2t/f6vnjZe4f4TT0TbKNEPAfvLtWSuVHfsFv7+C+X1cpGC8HwZG
         eHkg==
X-Gm-Message-State: AOJu0YxwT1cVZYpguIlevtBvtKMRP7ZW0xcZsTcDRsH/3LzqPUnrHiRC
	/+6cOgUXd+b0HCZXBfH4/cc=
X-Google-Smtp-Source: AGHT+IHYCRk2fhG9/6+uknjj2mJ/DqgygdgdLjyx9wpqlrWxkJUGHwEW0rz759lzCzZEeCRtkP8c9w==
X-Received: by 2002:a17:90a:de0f:b0:285:9a34:5b40 with SMTP id m15-20020a17090ade0f00b002859a345b40mr2704388pjv.40.1702397974025;
        Tue, 12 Dec 2023 08:19:34 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:6c5b:e8d6:db01:badf? ([2601:646:9d80:4380:6c5b:e8d6:db01:badf])
        by smtp.gmail.com with ESMTPSA id nu4-20020a17090b1b0400b0028865708d09sm10585161pjb.29.2023.12.12.08.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 08:19:33 -0800 (PST)
Message-ID: <6530e10a-66ca-46f6-bc03-fc3b7922a5a6@gmail.com>
Date: Tue, 12 Dec 2023 08:19:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
To: liezhi.yang@windriver.com, openembedded-devel@lists.openembedded.org
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20231212093804.1012506-1-liezhi.yang@windriver.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------q07IiW0OUtoBGuBagYNPnCH0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 16:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107335

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------q07IiW0OUtoBGuBagYNPnCH0
Content-Type: multipart/mixed; boundary="------------7BOiVpHtiFS0aF3MTeAxXFIK";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: liezhi.yang@windriver.com, openembedded-devel@lists.openembedded.org
Message-ID: <6530e10a-66ca-46f6-bc03-fc3b7922a5a6@gmail.com>
Subject: Re: [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
In-Reply-To: <20231212093804.1012506-1-liezhi.yang@windriver.com>

--------------7BOiVpHtiFS0aF3MTeAxXFIK
Content-Type: multipart/mixed; boundary="------------XCO0tqOeUgLkyVNDNcf7X7oW"

--------------XCO0tqOeUgLkyVNDNcf7X7oW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMTIvMjMgMTozOCBBTSwgbGllemhpLnlhbmdAd2luZHJpdmVyLmNvbSB3cm90ZToN
Cj4gRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQo+IA0K
PiBGaXhlZCBkb19jb25maWd1cmUgZXJyb3Igd2hlbiBidWlsZCBvbiBhYXJjaDY0IGhvc3Q6
DQo+IGVycm9yOiBjYW5ub3QgZ3Vlc3MgYnVpbGQgdHlwZTsgeW91IG11c3Qgc3BlY2lmeSBv
bmUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5k
cml2ZXIuY29tPg0KPiAtLS0NCj4gICAuLi5vbmZpZy5ndWVzcy1TdXBwb3J0LWJ1aWxkLW9u
LWFhcmNoNjQucGF0Y2ggfCAzMSArKysrKysrKysrKysrKysrKysrDQo+ICAgLi4uL21pbmlm
aS1jcHAvbWluaWZpLWNwcF8wLjcuMC5iYiAgICAgICAgICAgIHwgIDEgKw0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWZpLWNwcC9maWxlcy8wMDAxLWNvbmZpZy5n
dWVzcy1TdXBwb3J0LWJ1aWxkLW9uLWFhcmNoNjQucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWZpLWNwcC9maWxlcy8wMDAxLWNvbmZp
Zy5ndWVzcy1TdXBwb3J0LWJ1aWxkLW9uLWFhcmNoNjQucGF0Y2ggYi9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvbWluaWZpLWNwcC9maWxlcy8wMDAxLWNvbmZpZy5ndWVzcy1TdXBwb3J0
LWJ1aWxkLW9uLWFhcmNoNjQucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMC4uMzA4NmE3MDQ1NQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21l
dGEtb2UvcmVjaXBlcy1leHRlbmRlZC9taW5pZmktY3BwL2ZpbGVzLzAwMDEtY29uZmlnLmd1
ZXNzLVN1cHBvcnQtYnVpbGQtb24tYWFyY2g2NC5wYXRjaA0KPiBAQCAtMCwwICsxLDMxIEBA
DQo+ICtGcm9tIDkyZmRiZmRkNmI1NWZmMGI2NWVkZDlhMjgzYWM4NWFkMzQ5ZTMyNWIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQo+ICtGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlh
bmdAd2luZHJpdmVyLmNvbT4NCj4gK0RhdGU6IFR1ZSwgMTIgRGVjIDIwMjMgMDc6Mjc6NTIg
KzAwMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gY29uZmlnLmd1ZXNzOiBGaXggZG9fY29uZmln
dXJlIGVycm9yIGJ1aWxkZXIgYWFyY2g2NA0KPiArDQo+ICtGaXhlZCBjb25maWd1cmUgZXJy
b3Igd2hlbiBidWlsZCBvbiBhYXJjaDY0IGhvc3Q6DQo+ICtlcnJvcjogY2Fubm90IGd1ZXNz
IGJ1aWxkIHR5cGU7IHlvdSBtdXN0IHNwZWNpZnkgb25lDQo+ICsNCj4gK1Vwc3RyZWFtLVN0
YXR1czogUGVuZGluZw0KDQp3b3VsZCB5b3UgbWluZCBwb3N0aW5nIGl0IHVwc3RyZWFtIGFz
IHdlbGwgPyBJSVJDIHdlIHdlcmUgc3R1Y2sgb24gYW4gDQpvbGRlciB2ZXJzaW9uIG9mIG1p
bmlmaS1jcHAgcGVyaGFwcyBpdCBuZWVkcyBidW1waW5nIHRvIGxhdGVzdCBhcyB3ZWxsLg0K
DQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5k
cml2ZXIuY29tPg0KPiArLS0tDQo+ICsgY29uZmlnLmd1ZXNzICAgICAgfCAgIDIgKy0NCj4g
KyAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ICsN
Cj4gK2RpZmYgLS1naXQgYS90aGlyZHBhcnR5L3V1aWQtMS42LjIvY29uZmlnLmd1ZXNzIGIv
dGhpcmRwYXJ0eS91dWlkLTEuNi4yL2NvbmZpZy5ndWVzcw0KPiAraW5kZXggY2EyYTAzYy4u
YTg1OGJmZCAxMDA3NTUNCj4gKy0tLSBhL3RoaXJkcGFydHkvdXVpZC0xLjYuMi9jb25maWcu
Z3Vlc3MNCj4gKysrKyBiL3RoaXJkcGFydHkvdXVpZC0xLjYuMi9jb25maWcuZ3Vlc3MNCj4g
K0BAIC04MzUsNyArODM1LDcgQEAgRU9GDQo+ICsgICAgIGkqODY6TWluaXg6KjoqKQ0KPiAr
IAllY2hvICR7VU5BTUVfTUFDSElORX0tcGMtbWluaXgNCj4gKyAJZXhpdCA7Ow0KPiArLSAg
ICBhcm0qOkxpbnV4Oio6KikNCj4gKysgICAgYXJtKjpMaW51eDoqOip8YWFyY2g2NDpMaW51
eDoqOiopDQo+ICsgCWV2YWwgJHNldF9jY19mb3JfYnVpbGQNCj4gKyAJaWYgZWNobyBfX0FS
TV9FQUJJX18gfCAkQ0NfRk9SX0JVSUxEIC1FIC0gMj4vZGV2L251bGwgXA0KPiArIAkgICAg
fCBncmVwIC1xIF9fQVJNX0VBQklfXw0KPiArLS0NCj4gKzIuMzQuMQ0KPiArDQo+IGRpZmYg
LS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWZpLWNwcC9taW5pZmktY3Bw
XzAuNy4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL21pbmlmaS1jcHAvbWluaWZp
LWNwcF8wLjcuMC5iYg0KPiBpbmRleCA2N2EyZDlmYTVmLi41MDU5YjYzMjEyIDEwMDY0NA0K
PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWZpLWNwcC9taW5pZmktY3Bw
XzAuNy4wLmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9taW5pZmktY3Bw
L21pbmlmaS1jcHBfMC43LjAuYmINCj4gQEAgLTQwLDYgKzQwLDcgQEAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL2FwYWNoZS9uaWZpLW1pbmlmaS1jcHAuZ2l0O2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHQNCj4gICAgICAgICAgICAgICBmaWxlOi8vbWluaWZpLnNlcnZpY2Ug
XA0KPiAgICAgICAgICAgICAgIGZpbGU6Ly9zeXN0ZW1kLXZvbGF0aWxlLmNvbmYgXA0KPiAg
ICAgICAgICAgICAgIGZpbGU6Ly9zeXN2aW5pdC12b2xhdGlsZS5jb25mIFwNCj4gKyAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZy5ndWVzcy1TdXBwb3J0LWJ1aWxkLW9uLWFhcmNo
NjQucGF0Y2ggXA0KPiAgICAgICAgICAgICAgICINCj4gICANCj4gICBTUkNfVVJJW2N1cmwu
bWQ1c3VtXSA9ICJkMGJjYzU4Njg3M2NmZWYwOGI0Yjk1OTRlNTM5NWEzMyINCg==
--------------XCO0tqOeUgLkyVNDNcf7X7oW
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------XCO0tqOeUgLkyVNDNcf7X7oW--

--------------7BOiVpHtiFS0aF3MTeAxXFIK--

--------------q07IiW0OUtoBGuBagYNPnCH0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZXiIFAUDAAAAAAAKCRC7BTNVkZ0zFLhM
AJ4hJqZXWd1IV3lWldhOh319YPV9egCeJRiIYzzGqI4f57JUHXXwkR+p4bo=
=sErq
-----END PGP SIGNATURE-----

--------------q07IiW0OUtoBGuBagYNPnCH0--

