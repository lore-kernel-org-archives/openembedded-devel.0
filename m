Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEACCA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 15:43:15 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.421.1693582987130365275
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Sep 2023 08:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PXAH7Bug;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so1784216b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693582986; x=1694187786; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leOSA23MOE8wk60AkjA6qF6xbn7OyVEf/WH4oz0sNsY=;
        b=PXAH7BugpPY4cCLUrfmcCvtlrI+pIAXzxqvFoyynp9HRBMDZUtICnwAjLu01Q3g6OZ
         zmPm7FY6Ekm4F0ReHn85ntwkdA+39eEGfP26mBHKxXycN/cvUU1R391Eme7a3qRZGFkI
         yp9IeD9EXfKgD7fszuU3WMqOClX8CRygaoXmGqDw0S5E8e5631/kjWZROZr/B2BbAJ8B
         1UjHQ5SPYcWD5JWAqnaY/4CCSIHCqd4Xz6p3u8W7DAiKKLchGvhlFadHr6GgrU0dCme7
         8KSLDuk5jDUaj+hxKkQoVzci97JxhbL8+ECVKSqMPnwbx4nSB7IlVYX0wyuXOtqDQZze
         l1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693582986; x=1694187786;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=leOSA23MOE8wk60AkjA6qF6xbn7OyVEf/WH4oz0sNsY=;
        b=gM5xKaR9Fhoot2MuB/NkmMJhVY3D99GZLU686JlFLAztQVE0g72TNKMVu3xchuX6y5
         0JqTmrEYOubSeAfXDK8DpcaTTbB4B+MdT8fd4R0O69cmloAc/jbBW5oYNUnW07opzQRi
         8FEFgIlWqVSCv54HLLyV7mDmqnwRS0+kgw8P2vBdN5IneUwo//1Qs2IAO2lT65ld6YNz
         k7LFTHKiML2FybPI7EuxMJVqRwShHC8sl35oI/+W2n7GwKFlRp9sFmtXMMHDfE9iHLXf
         Nd1lMx1jEq4WGlmOJ4cPHIlXxfWa0X64eItifo1W/FuUEgnVbAXTAUbDdy6dDpWvFouc
         lr/Q==
X-Gm-Message-State: AOJu0YyW/LHVlH3w227Tn4pMKSofdggTn93YnLv2ruxbjYzKQffM2ygy
	HLpli5sj1CzUmjaPZapyMs4=
X-Google-Smtp-Source: AGHT+IHtqbnOVGdvjjFBE17YWCwT/FUDaYTB8OqvxbpkY13o9wlu4qa6tx6hw/h0d9ehxlhKFTgBDA==
X-Received: by 2002:a05:6300:8002:b0:140:8537:85c1 with SMTP id an2-20020a056300800200b00140853785c1mr2936911pzc.28.1693582986357;
        Fri, 01 Sep 2023 08:43:06 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:ac0c:6b51:b136:ec53? ([2601:646:9100:2cb0:ac0c:6b51:b136:ec53])
        by smtp.gmail.com with ESMTPSA id a17-20020aa780d1000000b00689f3d73639sm3104709pfn.65.2023.09.01.08.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 08:43:05 -0700 (PDT)
Message-ID: <e37c6b57-90fe-4d77-bdbd-aabd0fb01b1a@gmail.com>
Date: Fri, 1 Sep 2023 08:43:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] collectd: build with rrdcached plugin
To: Aikaterini Voulgari <Aikaterini.Voulgari@softcom-int.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <DB4PR02MB9598929FA2C57B34DAC69283B8E4A@DB4PR02MB9598.eurprd02.prod.outlook.com>
Content-Language: en-US
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
In-Reply-To: <DB4PR02MB9598929FA2C57B34DAC69283B8E4A@DB4PR02MB9598.eurprd02.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------adsaDx0hFw8gFmugdsSmchz3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104692

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------adsaDx0hFw8gFmugdsSmchz3
Content-Type: multipart/mixed; boundary="------------Nlbe81s3gn3eao3V8t025etj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Aikaterini Voulgari <Aikaterini.Voulgari@softcom-int.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Message-ID: <e37c6b57-90fe-4d77-bdbd-aabd0fb01b1a@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] collectd: build with rrdcached plugin
References: <DB4PR02MB9598929FA2C57B34DAC69283B8E4A@DB4PR02MB9598.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB9598929FA2C57B34DAC69283B8E4A@DB4PR02MB9598.eurprd02.prod.outlook.com>

--------------Nlbe81s3gn3eao3V8t025etj
Content-Type: multipart/mixed; boundary="------------bwhgAkjkxQv11HQ2hnESUa3o"

--------------bwhgAkjkxQv11HQ2hnESUa3o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8xLzIzIDc6NDMgQU0sIEFpa2F0ZXJpbmkgVm91bGdhcmkgd3JvdGU6DQo+ICBGcm9t
IGNkOGIxZmViZTViMzMzYTFkMzhhODM5ZWJiOTA0Yzc2OGMxOTRjNjEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxDQo+IA0KPiBGcm9tOiA9P1VURi04P3E/PUNFPTkyPUNFPUJGPUNGPThE
PUNFPUJCPUNFPUIzPUNFPUIxPUNGPTgxPUNFPUI3PTIwPUNFPTkxPz0NCj4gDQo+ID0/VVRG
LTg/cT89Q0U9Qjk9Q0U9QkE9Q0U9QjE9Q0Y9ODQ9Q0U9QjU9Q0Y9ODE9Q0U9QUY9Q0U9QkQ9
Q0U9Qjc/PQ0KPiANCg0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaCBhbmQgdHJ5aW5nIHRvIG1h
a2UgT0UgYmV0dGVyLCBzYWRseSB0aGlzIHBhdGNoIGRvZXMgDQpub3QgYXBwbHkNCg0KKFN0
cmlwcGluZyB0cmFpbGluZyBDUnMgZnJvbSBwYXRjaDsgdXNlIC0tYmluYXJ5IHRvIGRpc2Fi
bGUuKQ0KcGF0Y2hpbmcgZmlsZSBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvY29sbGVjdGQv
Y29sbGVjdGRfNS4xMi4wLmJiDQpwYXRjaDogKioqKiBtYWxmb3JtZWQgcGF0Y2ggYXQgbGlu
ZSAxNzE6ICxsaWJtbmwiDQoNClBsZWFzZSBnZW5lcmF0ZSBpdCB3aXRoIGdpdCBmb3JtYXQt
cGF0Y2ggYW5kIHNlbmQgaXQgdXNpbmcgZ2l0IA0Kc2VuZC1lbWFpbCBmb3IgYmVzdCByZXN1
bHRzIG9mIGl0IG5vdCBiZWluZyBhbHRlcmVkIGJ5IHlvdXIgZW1haWxlci4NCg0KPiBhaWth
dGVyaW5pLnZvdWxnYXJpQHNvZnRjb20taW50LmNvbSANCj4gPG1haWx0bzphaWthdGVyaW5p
LnZvdWxnYXJpQHNvZnRjb20taW50LmNvbT4NCj4gDQo+IERhdGU6IEZyaSwgMSBTZXAgMjAy
MyAxNzo0MDoxMyArMDMwMA0KPiANCj4gU3ViamVjdDogW1BBVENIXSBjb2xsZWN0ZDogYnVp
bGQgd2l0aCBycmRjYWNoZWQgcGx1Z2luDQo+IA0KPiBNSU1FLVZlcnNpb246IDEuMA0KPiAN
Cj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04DQo+IA0KPiBDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0DQo+IA0KPiBycmRjYWNoZWQgcGFja2FnZSBp
cyBwcm92aWRlZCBieSBycmR0b29sIHJlY2lwZS4gVGhlIGJ1aWxkIGRlcGVuZGVuY3kgaW4g
DQo+IFBBQ0tBR0VDT05GSUcgaXMgY2hhbmdlZCB0byBycmR0b29sLg0KPiANCj4gIMKgwqDC
oCBUaGUgZXJyb3Igd2FzOg0KPiANCj4gIMKgwqDCoMKgIE5vdGhpbmcgUFJPVklERVMgJ3Jy
ZGNhY2hlZCcgYnV0IC4uL2NvbGxlY3RkXzUuMTIuMC5iYiBERVBFTkRTIG9uIA0KPiBvciBv
dGhlcndpc2UgcmVxdWlyZXMgaXQpLiBDbG9zZSBtYXRjaGVzOg0KPiANCj4gIMKgwqDCoMKg
wqAgcnJkdG9vbCBSUFJPVklERVMgcnJkY2FjaGVkDQo+IA0KPiAgwqDCoMKgIEVSUk9SOiBS
ZXF1aXJlZCBidWlsZCB0YXJnZXQgJ2NvbGxlY3RkJyBoYXMgbm8gYnVpbGRhYmxlIHByb3Zp
ZGVycy4NCj4gDQo+ICDCoMKgwqAgTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5
IGNoYWluIHdhczogWydjb2xsZWN0ZCcsICdycmRjYWNoZWQnXQ0KPiANCj4gIMKgwqDCoCBX
aXRoIHRoZSBwYXRjaCwgY29sbGVjdGQgYnVpbGRzIHdpdGggbm8gZXJyb3JzIGFuZCB0aGUg
ZmluYWwgaW1hZ2UgDQo+IEkgdGVzdGVkIGluY2x1ZGVzIGNvbGxlY3RkIHdpdGggcnJkY2Fj
aGVkIHBsdWdpbi4NCj4gDQo+ICDCoMKgwqAgVGVzdGVkIG9uIGN1c3RvbSBpbWFnZSB3aXRo
IGNvbGxlY3RkXzUuMTIuMC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IM6Szr/Pjc67zrPOsc+B
zrcgzpHOuc66zrHPhM61z4HOr869zrcgYWlrYXRlcmluaS52b3VsZ2FyaUBzb2Z0Y29tLWlu
dC5jb20gDQo+IDxtYWlsdG86YWlrYXRlcmluaS52b3VsZ2FyaUBzb2Z0Y29tLWludC5jb20+
DQo+IA0KPiAtLS0NCj4gDQo+IG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9jb2xsZWN0ZC9j
b2xsZWN0ZF81LjEyLjAuYmIgfCAyICstDQo+IA0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3Jl
Y2lwZXMtZXh0ZW5kZWQvY29sbGVjdGQvY29sbGVjdGRfNS4xMi4wLmJiIA0KPiBiL21ldGEt
b2UvcmVjaXBlcy1leHRlbmRlZC9jb2xsZWN0ZC9jb2xsZWN0ZF81LjEyLjAuYmINCj4gDQo+
IGluZGV4IDVkYzY0NTg4ZC4uNDc5YzEyZDZhIDEwMDY0NA0KPiANCj4gLS0tIGEvbWV0YS1v
ZS9yZWNpcGVzLWV4dGVuZGVkL2NvbGxlY3RkL2NvbGxlY3RkXzUuMTIuMC5iYg0KPiANCj4g
KysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2NvbGxlY3RkL2NvbGxlY3RkXzUuMTIu
MC5iYg0KPiANCj4gQEAgLTUwLDcgKzUwLDcgQEAgUEFDS0FHRUNPTkZJR1tsaWJtbmxdID0g
DQo+ICItLXdpdGgtbGlibW5sLC0td2l0aG91dC1saWJtbmwsbGlibW5sIg0KPiANCj4gUEFD
S0FHRUNPTkZJR1tsaWJhdGFzbWFydF0gPSANCj4gIi0td2l0aC1saWJhdGFzbWFydCwtLXdp
dGhvdXQtbGliYXRhc21hcnQsbGliYXRhc21hcnQiDQo+IA0KPiBQQUNLQUdFQ09ORklHW2xk
YXBdID0gIi0tZW5hYmxlLW9wZW5sZGFwIA0KPiAtLXdpdGgtbGlibGRhcCwtLWRpc2FibGUt
b3BlbmxkYXAgLS13aXRob3V0LWxpYmxkYXAsIG9wZW5sZGFwIg0KPiANCj4gUEFDS0FHRUNP
TkZJR1tycmR0b29sXSA9ICItLWVuYWJsZS1ycmR0b29sLC0tZGlzYWJsZS1ycmR0b29sLHJy
ZHRvb2wiDQo+IA0KPiAtUEFDS0FHRUNPTkZJR1tycmRjYWNoZWRdID0gDQo+ICItLWVuYWJs
ZS1ycmRjYWNoZWQsLS1kaXNhYmxlLXJyZGNhY2hlZCxycmRjYWNoZWQiDQo+IA0KPiArUEFD
S0FHRUNPTkZJR1tycmRjYWNoZWRdID0gIi0tZW5hYmxlLXJyZGNhY2hlZCwtLWRpc2FibGUt
cnJkY2FjaGVkLHJyZHRvb2wiDQo+IA0KPiBQQUNLQUdFQ09ORklHW3B5dGhvbl0gPSAiLS1l
bmFibGUtcHl0aG9uLC0tZGlzYWJsZS1weXRob24iDQo+IA0KPiAgwqBFWFRSQV9PRUNPTkYg
PSAiIFwNCj4gDQo+IC0tIA0KPiANCj4gMi4zNC4xDQo+IA0KPiANCj4gDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEwNDY5MSk6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdl
LzEwNDY5MQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC8xMDEwOTY2MzQvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVk
LWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1
YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiAN
Cg==
--------------bwhgAkjkxQv11HQ2hnESUa3o
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------bwhgAkjkxQv11HQ2hnESUa3o--

--------------Nlbe81s3gn3eao3V8t025etj--

--------------adsaDx0hFw8gFmugdsSmchz3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZPIGiAUDAAAAAAAKCRC7BTNVkZ0zFHV3
AJ9v3USRgSYZ410GDMqa0zEhRrQ0hACfT672Ni47bgFNCRlQMzN+ahrj1TI=
=o0X/
-----END PGP SIGNATURE-----

--------------adsaDx0hFw8gFmugdsSmchz3--

