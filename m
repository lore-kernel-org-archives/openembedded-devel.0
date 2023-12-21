Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C638C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:25:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1347.1703183118832282862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XAoaWs86;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d6d48354ccso681433b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703183118; x=1703787918; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/QrU3FFjC+3f5jlWwInPGUn1ViY1w7OMawRVTKoxH+0=;
        b=XAoaWs86dApqprIgdWTvaSBo3uSrFidgQHgs7pvgdTb/AQZpz0AwA1yku//w/VO9DI
         bfwu6E/z7Q//tLy2UKXW7/tOoGUWpL31EXlEZyKCPVbkQ9URnGcyZja6zFU7AUpItvWp
         fmm0v690gv8jkyg3YRADw9APUYvDuEsGHB8rbzkkANiLzMpqh2TE97zB7foLPmLh/6FQ
         8AK36thyMTt/Y5LDw3vJYGnOg8FYF3s1iBLRPQIKe4JPyJ9ly2ZF/pbPg8qVegChirzV
         eZGWM3USgPZh+0Zp42vAYVyqxbKvipRKsSOlD6HmLgTaDrND8JEA3I8V84ko58gR+x2r
         JSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183118; x=1703787918;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QrU3FFjC+3f5jlWwInPGUn1ViY1w7OMawRVTKoxH+0=;
        b=A8HE8Q23w7UoirDtEs0narxQ5PHlmmSNH3NYhPh0M2TdXk31iDJsCySb+Wsk5gLL38
         7+ntRLwkF5sLNQyGigs2JHnKbuAC+1Fn/l7VHiS50MkdtpHaAwLaCRIMcGOEyaLDeMDG
         yOw5PG17z0zwicpidalnAx0hxpVA6fPPOMVN6YectHqpi5wXjoJ40msYPpeHV8+8oVGz
         wFOpSeSnzjyDMsH2zLCkCSAJRWwaI5wmXJCFM7N9h4+/cXGXGUkSGNDTX2lhJRvKxfmS
         HYvlePS6Ghw1QSpY/IYiINQojj3BRcdivlWbLXv7YUEkaloDfGidLm+51DUzqlB1PJTh
         wZhA==
X-Gm-Message-State: AOJu0YxIMCcDnUzuPSpYK3E1H6/kDl3dxPzdI+gmJSr7K7sHVyGGnqZ/
	ZwL2V8SfGPT+hl9bYGaMovk=
X-Google-Smtp-Source: AGHT+IGexrDsFCdOK+ipRIEfaso+1oICACrfBDqPlGoakvHw3yCBA14OFAakVUDkSAcr45G7iKtUpg==
X-Received: by 2002:aa7:844b:0:b0:6d8:1522:1ae5 with SMTP id r11-20020aa7844b000000b006d815221ae5mr76628pfn.52.1703183117856;
        Thu, 21 Dec 2023 10:25:17 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:19f6:1dc9:af9a:71f0? ([2601:646:9d80:4380:19f6:1dc9:af9a:71f0])
        by smtp.gmail.com with ESMTPSA id j20-20020a056a00235400b006d6b6c0b569sm1898321pfj.219.2023.12.21.10.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 10:25:17 -0800 (PST)
Message-ID: <8210e170-1aac-49aa-988c-1da6d6bde261@gmail.com>
Date: Thu, 21 Dec 2023 10:25:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/2] opensc: Fix CVE-2023-40660
Content-Language: en-US
To: virendra thakur <thakur.virendra1810@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: virendra thakur <virendrak@kpit.com>
References: <20231221121509.1880592-1-thakur.virendra1810@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20231221121509.1880592-1-thakur.virendra1810@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ph0AHcO9ApPjEhTPKoRYzzfc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107731

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ph0AHcO9ApPjEhTPKoRYzzfc
Content-Type: multipart/mixed; boundary="------------ryGFoEMu3ppyPN4gp0Fer9QQ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: virendra thakur <thakur.virendra1810@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: virendra thakur <virendrak@kpit.com>
Message-ID: <8210e170-1aac-49aa-988c-1da6d6bde261@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] opensc: Fix CVE-2023-40660
References: <20231221121509.1880592-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20231221121509.1880592-1-thakur.virendra1810@gmail.com>

--------------ryGFoEMu3ppyPN4gp0Fer9QQ
Content-Type: multipart/mixed; boundary="------------Vk4utuVlW1P9g9wpC9ACWlRO"

--------------Vk4utuVlW1P9g9wpC9ACWlRO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMjEvMjMgNDoxNSBBTSwgdmlyZW5kcmEgdGhha3VyIHdyb3RlOg0KPiBGcm9tOiB2
aXJlbmRyYSB0aGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4NCj4gDQo+IFVwc3RyZWFtLVN0
YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9vcGVuc2MtdGVhbS9v
cGVuc2MvLS9jb21taXQvOTQwZThiYzc2NDA0N2M4NzNmODhiYjEzOTY5MzNhNTM2OGQwMzUz
M10NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IHZpcmVuZHJhIHRoYWt1ciA8dmlyZW5kcmFrQGtw
aXQuY29tPg0KDQpQbGVhc2UgaW5kaWNhdGUgdGhlIGJyYW5jaCBpdCBpcyBpbnRlbmRlZCBm
b3IgaW4gdGhlIHN1YmplY3QgZmllbGQgdG8gDQpnZXQgcHJvcGVyIGF0dGVudGlvbiwgc29t
ZXRoaW5nIGxpa2UgLi4uDQoNClticmFuY2hdW2xheWVyXSByZWNpcGU6IFN1bW1hcnkgb2Yg
Y2hhbmdlIC4uLi4NCg0KDQoNCj4gLS0tDQo+ICAgLi4uL29wZW5zYy9vcGVuc2MvQ1ZFLTIw
MjMtNDA2NjAucGF0Y2ggICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKw0KPiAgIC4u
Li9yZWNpcGVzLXN1cHBvcnQvb3BlbnNjL29wZW5zY18wLjIwLjAuYmIgICB8ICAxICsNCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbnNjL29wZW5zYy9DVkUtMjAyMy00
MDY2MC5wYXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L29wZW5zYy9vcGVuc2MvQ1ZFLTIwMjMtNDA2NjAucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC9vcGVuc2Mvb3BlbnNjL0NWRS0yMDIzLTQwNjYwLnBhdGNoDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uNzRlNTQ3Mjk4DQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbnNjL29wZW5zYy9D
VkUtMjAyMy00MDY2MC5wYXRjaA0KPiBAQCAtMCwwICsxLDU1IEBADQo+ICtPcmlnaW46IGh0
dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDL2NvbW1pdC84NjhmNzZmYjMxMjU1ZmQz
ZmRhY2ZjM2U0NzY0NTJlZmViNjFjM2U3DQo+ICtGcm9tOiBGcmFuayBNb3JnbmVyIDxmcmFu
a21vcmduZXJAZ21haWwuY29tPg0KPiArRGF0ZTogV2VkLCAyMSBKdW4gMjAyMyAxMjoyNzoy
MyArMDIwMA0KPiArU3ViamVjdDogRml4ZWQgUElOIGF1dGhlbnRpY2F0aW9uIGJ5cGFzcw0K
PiArDQo+ICtJZiB0d28gcHJvY2Vzc2VzIGFyZSBhY2Nlc3NpbmcgYSB0b2tlbiwgdGhlbiBv
bmUgcHJvY2VzcyBtYXkgbGVhdmUgdGhlDQo+ICtjYXJkIHVzYWJsZSB3aXRoIGFuIGF1dGhl
bnRpY2F0ZWQgUElOIHNvIHRoYXQgYSBrZXkgbWF5IHNpZ24vZGVjcnlwdCBhbnkNCj4gK2Rh
dGEuIFRoaXMgaXMgZXNwZWNpYWxseSB0aGUgY2FzZSBpZiB0aGUgdG9rZW4gZG9lcyBub3Qg
c3VwcG9ydCBhIHdheSBvZg0KPiArcmVzZXR0aW5nIHRoZSBhdXRoZW50aWNhdGlvbiBzdGF0
dXMgKGxvZ291dCkuDQo+ICsNCj4gK1dlIGhhdmUgc29tZSB0cmFja2luZyBvZiB0aGUgYXV0
aGVudGljYXRpb24gc3RhdHVzIGluIHNvZnR3YXJlIHZpYQ0KPiArUEtDUyMxMSwgTWluaWRy
aXZlciAob3Mtd2lzZSkgYW5kIENyeXB0b1Rva2VuS2l0LCB3aGljaCBpcyB3aHkgYQ0KPiAr
UElOLXByb21wdCB3aWxsIGFwcGVhciBldmVuIHRob3VnaCB0aGUgY2FyZCBtYXkgdGVjaG5p
Y2FsbHkgYmUgdW5sb2NrZWQNCj4gK2FzIGRlc2NyaWJlZCBpbiB0aGUgYWJvdmUgZXhhbXBs
ZS4gSG93ZXZlciwgYmVmb3JlIHRoaXMgY2hhbmdlLCBhbiBlbXB0eQ0KPiArUElOIHdhcyBu
b3QgdmVyaWZpZWQgKGxpa2VseSB5aWVsZGluZyBhbiBlcnJvciBkdXJpbmcgUElOLXZlcmlm
aWNhdGlvbiksDQo+ICtidXQgaXQgd2FzIGp1c3QgY2hlY2tlZCB3aGV0aGVyIHRoZSBQSU4g
aXMgYXV0aGVudGljYXRlZC4gVGhpcyBkZWZlYXRzDQo+ICt0aGUgcHVycG9zZSBvZiB0aGUg
UElOIHZlcmlmaWNhdGlvbiwgYmVjYXVzZSBhbiBlbXB0eSBQSU4gaXMgbm90IHRoZQ0KPiAr
Y29ycmVjdCBvbmUuIEVzcGVjaWFsbHkgZHVyaW5nIE9TIExvZ29uLCB3ZSBkb24ndCB3YW50
IHRoYXQga2luZCBvZg0KPiArc2hvcnRjdXQsIGJ1dCB3ZSB3YW50IHRoZSB1c2VyIHRvIHZl
cmlmeSB0aGUgY29ycmVjdCBQSU4gKGV2ZW4gdGhvdWdoDQo+ICt0aGUgdG9rZW4gd2FzIGxl
ZnQgdW5hdHRlbmRlZCBhbmQgYXV0aGVudGljYXRpb24gYXQgdGhlIGNvbXB1dGVyKS4NCj4g
Kw0KPiArVGhpcyBlc3NlbnRpYWxseSByZXZlcnRzIGNvbW1pdCBlNmY3MzczZWYwNjZjZmFi
NmUzMTYyZThiNWY2OTI2ODNkYjIzODY0Lg0KPiArDQo+ICtDVkU6IENWRS0yMDIzLTQwNjYw
DQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3NhbHNhLmRlYmlhbi5v
cmcvb3BlbnNjLXRlYW0vb3BlbnNjLy0vY29tbWl0Lzk0MGU4YmM3NjQwNDdjODczZjg4YmIx
Mzk2OTMzYTUzNjhkMDM1MzNdDQo+ICtTaWduZWQtb2ZmLWJ5OiBWaXJlbmRyYSBUaGFrdXIg
PHZpcmVuZHJha0BrcGl0LmNvbT4NCj4gKy0tLQ0KPiArIHNyYy9saWJvcGVuc2MvcGtjczE1
LXBpbi5jIHwgMTMgLS0tLS0tLS0tLS0tLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxl
dGlvbnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL3NyYy9saWJvcGVuc2MvcGtjczE1LXBp
bi5jIGIvc3JjL2xpYm9wZW5zYy9wa2NzMTUtcGluLmMNCj4gK2luZGV4IDgwYTE4NWZlY2Qu
LjM5MzIzNGVmZTQgMTAwNjQ0DQo+ICstLS0gYS9zcmMvbGlib3BlbnNjL3BrY3MxNS1waW4u
Yw0KPiArKysrIGIvc3JjL2xpYm9wZW5zYy9wa2NzMTUtcGluLmMNCj4gK0BAIC0zMDcsMTkg
KzMwNyw2IEBADQo+ICsgCQlMT0dfRlVOQ19SRVRVUk4oY3R4LCBTQ19FUlJPUl9JTlZBTElE
X1BJTl9SRUZFUkVOQ0UpOw0KPiArIAlhdXRoX2luZm8gPSAoc3RydWN0IHNjX3BrY3MxNV9h
dXRoX2luZm8gKilwaW5fb2JqLT5kYXRhOw0KPiArDQo+ICstCS8qDQo+ICstCSAqIGlmIHBp
biBjYWNoZSBpcyBkaXNhYmxlZCwgd2UgY2FuIGdldCBoZXJlIHdpdGggbm8gUElOIGRhdGEu
DQo+ICstCSAqIGluIHRoaXMgY2FzZSwgdG8gYXZvaWQgZXJyb3Igb3IgdW5uZWNlc3Nhcnkg
cGluIHByb21wdGluZyBvbiBwaW5wYWQsDQo+ICstCSAqIGNoZWNrIGlmIHRoZSBQSU4gaGFz
IGJlZW4gYWxyZWFkeSB2ZXJpZmllZCBhbmQgdGhlIGFjY2VzcyBjb25kaXRpb24NCj4gKy0J
ICogaXMgc3RpbGwgb3BlbiBvbiBjYXJkLg0KPiArLQkgKi8NCj4gKy0JaWYgKHBpbmxlbiA9
PSAwKSB7DQo+ICstCSAgICByID0gc2NfcGtjczE1X2dldF9waW5faW5mbyhwMTVjYXJkLCBw
aW5fb2JqKTsNCj4gKy0NCj4gKy0JICAgIGlmIChyID09IFNDX1NVQ0NFU1MgJiYgYXV0aF9p
bmZvLT5sb2dnZWRfaW4gPT0gU0NfUElOX1NUQVRFX0xPR0dFRF9JTikNCj4gKy0JCUxPR19G
VU5DX1JFVFVSTihjdHgsIHIpOw0KPiArLQl9DQo+ICstDQo+ICsgCXIgPSBfdmFsaWRhdGVf
cGluKHAxNWNhcmQsIGF1dGhfaW5mbywgcGlubGVuKTsNCj4gKw0KPiArIAlpZiAocikNCj4g
Kw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbnNjL29wZW5z
Y18wLjIwLjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVuc2Mvb3BlbnNjXzAu
MjAuMC5iYg0KPiBpbmRleCBiOGNmMjAzYjcuLjNlNzdiODg4NCAxMDA2NDQNCj4gLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbnNjL29wZW5zY18wLjIwLjAuYmINCj4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbnNjL29wZW5zY18wLjIwLjAuYmINCj4g
QEAgLTE0LDYgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9N2ZiYzMzODMwOWFjMzhmZWZjZDY0YjA0YmI5MDNlMzQiDQo+ICAgI3YwLjE5LjANCj4g
ICBTUkNSRVYgPSAiNDVlMjkwNTZjY2RlNDIyZTcwZWQzNTg1MDg0YTdmMTUwYzYzMjUxNSIN
Cj4gICBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vT3BlblNDL09wZW5TQzticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwNCj4gKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDIz
LTQwNjYwLnBhdGNoIFwNCj4gICAgICAgICAgICAgIg0KPiAgIERFUEVORFMgPSAidmlydHVh
bC9saWJpY29udiBvcGVuc3NsIg0KPiAgIA0K
--------------Vk4utuVlW1P9g9wpC9ACWlRO
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------Vk4utuVlW1P9g9wpC9ACWlRO--

--------------ryGFoEMu3ppyPN4gp0Fer9QQ--

--------------ph0AHcO9ApPjEhTPKoRYzzfc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZYSDDAUDAAAAAAAKCRC7BTNVkZ0zFKq2
AJ98tc09/ImM7qkslkkfrAF2Gp7XlQCbB3WNqTigDoubCGN/iPAd+qjCsGo=
=H5kK
-----END PGP SIGNATURE-----

--------------ph0AHcO9ApPjEhTPKoRYzzfc--

