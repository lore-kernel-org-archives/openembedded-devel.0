Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A28EC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:54:38 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.12222.1745423677852587878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 08:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBDI/VMk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5885644b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423677; x=1746028477; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJjVvktGVcIgIbVR1hjfzM6JsyoYbGsfXyz9QOD0WFs=;
        b=fBDI/VMk/5y0HCAP2UqDHPDdiCtmH93/bER+V8recUy6Ony/D9OcrqBVmUIHBqh4qj
         EqltUL8nr48gm+hHB7PPhr5LpzwgLtRjnI0M6F+IuvirGEGn38FqCYeC64I0Q/FKB+SV
         x0ILYtea0FoJuFZDHPBLNmYtghzLxut0iUF2wSrNF/85oCYG85IVv0msrikmbocOnmBb
         6HK6nhA9PaEciwlk/Yb10eYoq1+sCudBb8m0OMZeFJHAj4scoxkFrt1pajLbHEAch4cH
         mzkWs+3XYi38OjLO9KaGFoSG/DTQUpCHo+IN5hG1O/CiWdtk2jIBGjIXKyY6fW/eGdab
         LvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423677; x=1746028477;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJjVvktGVcIgIbVR1hjfzM6JsyoYbGsfXyz9QOD0WFs=;
        b=JunrIVgl274r34HB0+6qJKv/7nyai1aGBndv5cRQ1+KzWIl6cuyVlHZ+RbHpabz5Sd
         LGqs7Sy4+cM/pHDTE50C+z7kGXpTAmWN3ChsU5vmV7Dqs3z+1LwjY/Ufwsbn3/pspWHR
         guT9Im933JJS4pOl2bTjaXoZICsrKHES2U89wE0wxJKHpoigvRrUkIih9gehXjgd7Rnm
         knYXH1Jsfho+6O4UGcnfWIbFzNAOGSztjoV7tGC5avItcwtF//GAf1P141k9tNM+NH9c
         LoNuqca/eL17VEX73FvWCvgHZPzS7CUS/76V2muE6gzoqzs6pfLQMj3nDIQiYra38UfE
         GhDQ==
X-Gm-Message-State: AOJu0YzEysAWSvILn7igXQW+oJNS/S1NBJez9z70//wbLFX9qOMfNlfW
	7v3tGH+puzfgHg42PrFdfF60aL1oEjaiE0fk5VjdnilCsiCv60VSy6BfvAe+
X-Gm-Gg: ASbGncsxEkIC0c48MR8Jbetj6OSA+j5kmMYvsTCh5PcNpZ1Y5b4JunOx7JgoaP32GUX
	vQ1PHuTepyh4zk0UUYRcN/4u2aMmOfJg1/6URAidJGjPEW7v5V9n6vGO4kLkfa6MBeZ+ml4J6OY
	M+uQH1z6m9lPHj/bKuUt0tP9xrxmUsRF1+kfo1bjprK/7Pp6uJJXKfDdep4t9xzO6BerzdgHl9i
	UC+9x6f4zVjzvf6NCqTGnTQaQLgm5ZfTXfWggF/ieUc0ThGm4jEHVDjKRdME8HoMJ5vI+9ne+xm
	pSjJRs7/yYNkCYdqZqyQ8gwY7wN8bqqeObOhaHLLFg/BYTpklLM0Ler6f2Kln00iX3nn9gDKm06
	oXWS1cXash2/L2GMpt4E/bTK5LY0I
X-Google-Smtp-Source: AGHT+IFgsnY6r2UqQ+y1n38px983Bsyz0xfmrQ6WQsFXw4rimdyQU8dlzok0rHaFxIRBlxx0nfNbbQ==
X-Received: by 2002:a05:6a00:2182:b0:736:5dc6:a14b with SMTP id d2e1a72fcca58-73dc14c7f03mr23432724b3a.13.1745423676742;
        Wed, 23 Apr 2025 08:54:36 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d47a:b503:3958:9e47? ([2601:646:8201:fd20:d47a:b503:3958:9e47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa58360sm10769495b3a.111.2025.04.23.08.54.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:54:36 -0700 (PDT)
Message-ID: <a4c4954b-272b-444f-8dab-f7671b74acb5@gmail.com>
Date: Wed, 23 Apr 2025 08:54:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-uvicorn: add Uvicorn (0.34.2)
To: openembedded-devel@lists.openembedded.org
References: <20250423143540.453271-1-fleuryhugo7@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20250423143540.453271-1-fleuryhugo7@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kai28Xvn03xcjQqfAv7RAFjj"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 15:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117083

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kai28Xvn03xcjQqfAv7RAFjj
Content-Type: multipart/mixed; boundary="------------Rg1RGbL1Gkt10zQ0Ysh3v7Bj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <a4c4954b-272b-444f-8dab-f7671b74acb5@gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-uvicorn: add Uvicorn (0.34.2)
References: <20250423143540.453271-1-fleuryhugo7@gmail.com>
In-Reply-To: <20250423143540.453271-1-fleuryhugo7@gmail.com>

--------------Rg1RGbL1Gkt10zQ0Ysh3v7Bj
Content-Type: multipart/mixed; boundary="------------HYktt93xzbUTJp2IZCcvrnm5"

--------------HYktt93xzbUTJp2IZCcvrnm5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMy8yNSA3OjM1IEFNLCBIdWdvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgdmVyc2lvbiAwLjM0LjIgb2YgVXZpY29y
biB0byB0aGUgT3BlbkVtYmVkZGVkIGJ1aWxkIHN5c3RlbS4NCj4gDQo+IFRoZSBhZGRpdGlv
biBpbmNsdWRlcyB0aGUgbmVjZXNzYXJ5IHJlY2lwZSB0byBidWlsZCBVdmljb3JuIGZyb20g
UHlQSS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1Z28gRkxFVVJZIDxmbGV1cnlodWdvN0Bn
bWFpbC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9weXRob24vcHl0aG9uMy11dmljb3JuXzAuMzQu
Mi5iYiAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2aWNvcm5fMC4zNC4yLmJi
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11dmljb3JuXzAuMzQuMi5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXZpY29ybl8wLjM0LjIuYmINCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uMmIzYzM2MjQ2Mw0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXZpY29ybl8wLjM0LjIuYmINCj4gQEAgLTAsMCArMSwxOSBAQA0KPiArU1VNTUFSWSA9
ICJMaWdodG5pbmctZmFzdCBBU0dJIHNlcnZlciBpbXBsZW1lbnRhdGlvbi4iDQo+ICtIT01F
UEFHRSA9ICJodHRwczovL3d3dy51dmljb3JuLm9yZy8iDQo+ICtMSUNFTlNFID0gIkJTRC0z
LUNsYXVzZSINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1
PTVjNzc4ODQyZjY2YTY0OTYzNjU2MWM0MjNjMGVlYzJlIg0KPiArDQo+ICtTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMGU5Mjk4MjhmNjE4NjM1M2E4MGI1OGVhNzE5ODYxZDI2MjlkNzY2Mjkz
YjZkMTliYWYwODZiYTMxZDRmMzMyOCINCj4gKw0KPiAraW5oZXJpdCBweXBpIHB5dGhvbl9o
YXRjaGxpbmcgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQ0KPiArDQo+ICtQWVBJX1BB
Q0tBR0UgPSAidXZpY29ybiINCj4gKw0KPiArUkRFUEVORFM6JHtQTn0gKz0gIiBcDQo+ICsg
ICAgJHtQWVRIT05fUE59LXR5cGluZy1leHRlbnNpb25zIFwNCj4gKyAgICAke1BZVEhPTl9Q
Tn0tY2xpY2sgXA0KPiArICAgICR7UFlUSE9OX1BOfS1oMTEgXA0KPiArICAgICR7UFlUSE9O
X1BOfS1hbnlpbyBcDQo+ICsiDQoNClBZVEhPTl9QTiBpcyBkZXByZWNhdGVkIHRoZXNlIGRh
eXMsIGp1c3QgdXNlIHB5dGhvbjMtIGhlcmUNCnNlY29uZGx5LCBkb2VzIGl0IGhhdmUgdGVz
dHMgPyAgaWYgc28gSSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSB0aGVtIA0KZW5hYmxlZCB2aWEg
cHRlc3QNCg0KPiArDQo+ICtTID0gIiR7V09SS0RJUn0vdXZpY29ybi0ke1BWfSINCj4gDQo+
IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5l
ICgjMTE3MDc5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL21lc3NhZ2UvMTE3MDc5DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjQxNTIxMy8xOTk3OTE0DQo+IEdyb3VwIE93
bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IA0K
--------------HYktt93xzbUTJp2IZCcvrnm5
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------HYktt93xzbUTJp2IZCcvrnm5--

--------------Rg1RGbL1Gkt10zQ0Ysh3v7Bj--

--------------kai28Xvn03xcjQqfAv7RAFjj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAkNOwUDAAAAAAAKCRC7BTNVkZ0zFE1l
AKCNYRDFgR2U32aV+nP9Ak7YqZ4wWgCeISu95SnaJF0hhAg7GV6IpharpW8=
=pCFx
-----END PGP SIGNATURE-----

--------------kai28Xvn03xcjQqfAv7RAFjj--

