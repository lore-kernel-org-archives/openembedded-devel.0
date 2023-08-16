Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EB9C04E69
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:47:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.165819.1692204421150991898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cp/bJ2BP;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6887b3613e4so1012025b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692204420; x=1692809220;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAtzFdcmXbT8TpRqxTl3dOX0+JM8r0yBVOPM3Qc/1ss=;
        b=cp/bJ2BPJUuNbyD+Nmd72v3vzWkGDyWpXdXdZPsXiLaYVBFiSUleOkIXfi6uOnBty5
         U/m7cmGdwj13DwwZX6f0cB6mkzvlqXkNo9/3iHLGguQcYUWzDMMgw6ORhE3qY/hpKDoL
         oo/I8Jz24Ye1URqxyCnc0TPZ+Vo6zfRhWswnv5LCfcIvRNaTzSSZ4NuwTGwAdH93fAyB
         7KQx0E9gOqcIDUcMuGWFn4DDw9yvFLewokYR6k732+mAURXU5jZhE2qk95orkpyBCCcV
         TsXt17in1UBx8V8wi+qrOp817YkiIoQZl5Y+uhOXx74s3QZ9zDsvSJ2fxbt2ZR9ZEqEC
         LC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204420; x=1692809220;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAtzFdcmXbT8TpRqxTl3dOX0+JM8r0yBVOPM3Qc/1ss=;
        b=HMYByoLdf3KA7Rpj1RNmQErexnwIqdUV10iFeTUh9GuNKsXpPGlbzKK+qbl01m8Wm9
         nDBHL3cSh5MwNYd8G6ABXOzeLQgHltTtywLqDLS5MJUNNqoxMXYbDNbafm2m5RBAerhd
         OEnTkdzyYe5OJWdYXdbImYtMGdEmJLnGj4kZOTPLzE6EeA0aWW0xDP4nF72HukAEwltp
         TH0D0guE1Ey/zZRODri+DULHHCPrqz51+NM1G1Gq09tEakOuzodMK8V1BVFQxu9rYC3r
         l5AfcD7QIVgp872I7nto7oLL/Go+5QWqzk9WntuIQ/5PnVaPZSa6K8KSNoLCaeNWHdb/
         XSZA==
X-Gm-Message-State: AOJu0YynF/NY5DiTI6dpm0j8H+HIpX2HMMTlhfIshy/gW+pmZfPK+6W/
	ZloPy3/+4YIDcPk+NN4ap0kNEws5HJcSYQ==
X-Google-Smtp-Source: AGHT+IF3B+sorAnhvFrmFpIium6MW/6BTYk3lbVobujoDoB254ChJjbsmzzqHoIzx8se3PYHhwlsYw==
X-Received: by 2002:a05:6a00:1991:b0:687:20d6:fade with SMTP id d17-20020a056a00199100b0068720d6fademr2969197pfl.20.1692204420380;
        Wed, 16 Aug 2023 09:47:00 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b192:e884:f5f4:7725? ([2601:646:9100:2cb0:b192:e884:f5f4:7725])
        by smtp.gmail.com with ESMTPSA id s11-20020aa78d4b000000b006878f50d071sm11178841pfe.203.2023.08.16.09.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:46:59 -0700 (PDT)
Message-ID: <5be78ff9-598f-4630-ae4e-fe72ab964a2c@gmail.com>
Date: Wed, 16 Aug 2023 09:46:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH] recipes-devtools/python3-piccata:
 piccata - a simple CoAP toolkit added
Content-Language: en-US
To: Danik <daniil.klimuk@3mdeb.com>, openembedded-devel@lists.openembedded.org
References: <6a8f811d-0ce3-f95b-303c-a65830b0adb5@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
 FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
In-Reply-To: <6a8f811d-0ce3-f95b-303c-a65830b0adb5@3mdeb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l0g0mE0RJbhbnHmJJqcHTRuJ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104436

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l0g0mE0RJbhbnHmJJqcHTRuJ
Content-Type: multipart/mixed; boundary="------------0JQzkx0SiggRtxfPpME61rrK";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Danik <daniil.klimuk@3mdeb.com>, openembedded-devel@lists.openembedded.org
Message-ID: <5be78ff9-598f-4630-ae4e-fe72ab964a2c@gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] recipes-devtools/python3-piccata:
 piccata - a simple CoAP toolkit added
References: <6a8f811d-0ce3-f95b-303c-a65830b0adb5@3mdeb.com>
In-Reply-To: <6a8f811d-0ce3-f95b-303c-a65830b0adb5@3mdeb.com>

--------------0JQzkx0SiggRtxfPpME61rrK
Content-Type: multipart/mixed; boundary="------------CokC9kF69c7CqORRTVMD82AP"

--------------CokC9kF69c7CqORRTVMD82AP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8xNi8yMyAxOjMwIEFNLCBEYW5payB3cm90ZToNCj4gQXV0aG9yOiBEYW5paWwgS2xp
bXVrIDxkYW5paWwua2xpbXVrQDNtZGViLmNvbT4NCj4gRGF0ZTrCoMKgIFdlZCBBdWcgMTYg
MDg6NDc6NTggMjAyMyArMDIwMA0KPiANCj4gIMKgwqDCoCByZWNpcGVzLWRldnRvb2xzL3B5
dGhvbjMtcGljY2F0YTogcGljY2F0YSAtIGEgc2ltcGxlIENvQVAgdG9vbGtpdCANCj4gYWRk
ZWQNCj4gDQo+ICDCoMKgwqAgcGljY2F0YSBpcyBhIHNpbXBsZSBDb0FQIChSRkM3MjUyKSB0
b29sa2l0IGNvbXBhdGlibGUgd2l0aCBQeXRob24gMi43Lg0KPiANCj4gIMKgwqDCoCBUaGUg
dG9vbGtpdCBwcm92aWRlcyBiYXNpYyBidWlsZGluZyBibG9ja3MgZm9yIHVzaW5nIENvQVAg
aW4gYW4NCj4gIMKgwqDCoCBhcHBsaWNhdGlvbi4gcGljY2F0YSBoYW5kbGVzIG1lc3NhZ2lu
ZyBiZXR3ZWVuIGVuZHBvaW50cw0KPiAgwqDCoMKgIChyZXRyYW5zbWlzc2lvbiwgZGVkdXBs
aWNhdGlvbikgYW5kIHJlcXVlc3QvcmVzcG9uc2UgbWF0Y2hpbmcuDQo+IA0KPiAgwqDCoMKg
IEhhbmRsaW5nIGFuZCBtYXRjaGluZyByZXNvdXJjZXMsIGJsb2Nrd2lzZSB0cmFuc2ZlcnMs
IGV0Yy4gaXMgbGVmdCB0bw0KPiAgwqDCoMKgIHRoZSBhcHBsaWNhdGlvbiBidXQgZnVuY3Rp
b25zIHRvIGZhY2lsaWF0ZSB0aGlzIGFyZSBwcm92aWRlZC4NCj4gDQo+ICDCoMKgwqAgcGlj
Y2F0YSB1c2VzIGEgdHJhbnNwb3J0IGFic3RyYWN0aW9uIHRvIGZhY2lsaWF0ZSB1c2luZyB0
aGUgdG9vbGtpdCANCj4gZm9yDQo+ICDCoMKgwqAgY29tbXVuaWNhdGlvbiBvdmVyIGRpZmZl
cmVudCBsaW5rIHR5cGVzLiBUcmFuc3BvcnQgZm9yIGEgVURQIHNvY2tldCBpcw0KPiAgwqDC
oMKgIHByb3ZpZGVkLg0KPiANCj4gIMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBEYW5paWwgS2xp
bXVrIDxkYW5paWwua2xpbXVrQDNtZGViLmNvbT4NCj4gDQoNCmZvbGxvdyANCmh0dHBzOi8v
d3d3Lm9wZW5lbWJlZGRlZC5vcmcvd2lraS9Ib3dfdG9fc3VibWl0X2FfcGF0Y2hfdG9fT3Bl
bkVtYmVkZGVkDQoNCnN1YmplY3QgbGluZSBjYW4gYmUgbWFkZSBiZXR0ZXIuDQoNCj4gZGlm
ZiAtLWdpdCANCj4gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMtcGlj
Y2F0YS9weXRob24zLXBpY2NhdGFfMi4wLjMuYmIgDQo+IGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24zLXBpY2NhdGEvcHl0aG9uMy1waWNjYXRhXzIuMC4zLmJiDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODk4MDY5YjYw
MGY2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24zLXBpY2NhdGEvcHl0aG9uMy1waWNjYXRhXzIuMC4zLmJiDQo+IEBAIC0w
LDAgKzEsMTQgQEANCj4gK1NVTU1BUlkgPSAiUHl0aG9uIENvQVAgVG9vbGtpdCINCj4gK0hP
TUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9Ob3JkaWNTZW1pY29uZHVjdG9yL3BpY2Nh
dGEiDQo+ICtMSUNFTlNFID0gIk1JVCINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWU2NjRlYjc1ZTI3OTFjMmU1MDVlNmUxYzI3NGU2ZDRmIg0KPiArDQo+
ICtTUkNfVVJJID0gDQo+ICJodHRwczovL2dpdGh1Yi5jb20vTm9yZGljU2VtaWNvbmR1Y3Rv
ci9waWNjYXRhL2FyY2hpdmUvcmVmcy9oZWFkcy9tYXN0ZXIuemlwIg0KDQpVc2luZyBnaXRo
dWIgYXJjaGl2ZXMgaXMgbm90IHJlY29tbWVuZGVkIHNpbmNlIHRoZXkgYXJlIG5vdCBpbW11
dGFibGUgYXMgDQp0aGV5IGNhbiBiZSByZS1nZW5lcmF0ZWQgYW5kIGNoYW5nZSB0aGUgY2hl
Y2tzdW1zLiBQbGVhc2UgdXNlIGdpdCANCmZldGNoZXIgaW5zdGVhZA0KDQo+ICtTUkNfVVJJ
W21kNXN1bV0gPSAiNmQxOThjN2EwOWM2OWZmYTA4MGU0MTk0NzcyMzViZWEiDQo+ICtTUkNf
VVJJW3NoYTI1NnN1bV0gPSANCj4gIjAxN2E0ODM2Y2JhYzFlMTY5ODBhZGQ0OWM4N2UzNWJm
ZDQ4NzRlZDI1ZTdhYTkwYTViZGMyODBlYzgyNjNiZmUiDQo+ICsNCj4gK1MgPSAiJHtXT1JL
RElSfS9waWNjYXRhLW1hc3RlciINCj4gKw0KPiAraW5oZXJpdCBzZXR1cHRvb2xzMw0KPiAr
DQo+ICtSREVQRU5EUzoke1BOfSArPSAicHl0aG9uMy1jb3JlIHB5dGhvbjMtZGF0ZXRpbWUg
cHl0aG9uMy1pbyANCj4gcHl0aG9uMy1sb2dnaW5nIHB5dGhvbjMtbWF0aCINCj4gDQo+IA0K
PiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgj
MTA0NDE4KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWRldmVsL21lc3NhZ2UvMTA0NDE4DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDc3NTYyMy8xOTk3OTE0DQo+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IA0K
--------------CokC9kF69c7CqORRTVMD82AP
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------CokC9kF69c7CqORRTVMD82AP--

--------------0JQzkx0SiggRtxfPpME61rrK--

--------------l0g0mE0RJbhbnHmJJqcHTRuJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZNz9gwUDAAAAAAAKCRC7BTNVkZ0zFOP2
AJ94DUJIHFP1qvPtQRVVBOBDjGZqdQCfdgNmc2TXnKksfHMc3Pm2EcmgYJg=
=j2HD
-----END PGP SIGNATURE-----

--------------l0g0mE0RJbhbnHmJJqcHTRuJ--

