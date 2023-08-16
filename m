Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483C1C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:39:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.165415.1692203943251380847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=osHbg9R2;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6889656eb58so314647b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692203942; x=1692808742;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjCfkJ5NrTaVqvW5KXL2InTSRqf72hNjd8tySpFaqkQ=;
        b=osHbg9R2ZN3XCqQHnUkuxMfi1F/SYlNv535jBRCtWi7FYjv4a8WqB0/K/DQTU0V0d1
         D4jE6ErE9Qxx7b3O2yn5BbV1hbiOUiVnfocL98ZBU03oXkCAM0LYCVyhVYOGW8//KFIq
         014Qgg+MkkTEX1v+AeHZVX1rEPWPx6hmgJqDos4ejEDxBhrRW9KVh1jmYET3txjstDGU
         OcJOnFP97sy6nroW72YJO5mNfp6YNswq0FTnDIIdykl5SQ9QxaBjnWpZTZ1VPKjUqERS
         x8d8mcMavmK8+kJgWsMQ/rvQCs1ONtx9/xxeIpQErUGfN8ALg7FSRRNTAl7xmP/mEVUS
         GTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692203942; x=1692808742;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjCfkJ5NrTaVqvW5KXL2InTSRqf72hNjd8tySpFaqkQ=;
        b=WvlK5tjbwvPP8CrgmSwrc0xi/+qwzfGqvXP70TbL1+ch2vG37EpUphdug3d7/Q6G4N
         GQMfmVkvDDVXw69TvSDxlk4yD4Zv1XDCZ8eKi1Z9lJG2rYw+RJ8As9YJBDeYyA7G3w3g
         I99xq3LPY98AhGjKcb/bBKKn6YPXG2MJcN91hZJ22tMh1bpBO8v34ILnUH3SputLH2FP
         Fg/rMDSqCA/zuB5pv+6TK/I3d1tHzyrkBCPDrTEy9622h5RRTv5vgDWmXTPY4dW2+stL
         0w8QOvhlOYPNfs7tUpMv0PR70iq8zgq/welnDlU56Tp7tLwZCkLcDwNgaLBln6w5Ia41
         JkpA==
X-Gm-Message-State: AOJu0YyZ42htUAeXTZzeLYfORSei+Brlc7ThQUASlPIrW8LGadA2OWQ7
	90dnNV3MLQXeo/EUq0kKer5xTBAjxDbJ8g==
X-Google-Smtp-Source: AGHT+IFJNWH/gZ2SuhObQZ6kbNYKYmalcckvhcA1naZXv1dctae8buu9jkys2kUyxTVI2yEu4u4yWQ==
X-Received: by 2002:a05:6a20:3218:b0:132:a85f:b2e7 with SMTP id hl24-20020a056a20321800b00132a85fb2e7mr2280738pzc.53.1692203942307;
        Wed, 16 Aug 2023 09:39:02 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b192:e884:f5f4:7725? ([2601:646:9100:2cb0:b192:e884:f5f4:7725])
        by smtp.gmail.com with ESMTPSA id e22-20020a62aa16000000b006877a17b578sm11241175pff.40.2023.08.16.09.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:39:01 -0700 (PDT)
Message-ID: <7af85e06-7968-43d1-96e5-3a5093b62403@gmail.com>
Date: Wed, 16 Aug 2023 09:39:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH] recipes-devtools/python3-gspread:
 interface for google spreadsheet
Content-Language: en-US
To: Danik <daniil.klimuk@3mdeb.com>, openembedded-devel@lists.openembedded.org
References: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>
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
In-Reply-To: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qTi4zRVkezGJPWclF4UyEC0e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104434

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qTi4zRVkezGJPWclF4UyEC0e
Content-Type: multipart/mixed; boundary="------------T7mVadvKfhEEJFIjzXAeasrB";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Danik <daniil.klimuk@3mdeb.com>, openembedded-devel@lists.openembedded.org
Message-ID: <7af85e06-7968-43d1-96e5-3a5093b62403@gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] recipes-devtools/python3-gspread:
 interface for google spreadsheet
References: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>
In-Reply-To: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>

--------------T7mVadvKfhEEJFIjzXAeasrB
Content-Type: multipart/mixed; boundary="------------AbD0jtiGRQMItJA39Q4M9Mnw"

--------------AbD0jtiGRQMItJA39Q4M9Mnw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8xNi8yMyAxOjQzIEFNLCBEYW5payB3cm90ZToNCj4gQXV0aG9yOiBEYW5paWwgS2xp
bXVrIDxkYW5paWwua2xpbXVrQDNtZGViLmNvbT4NCj4gRGF0ZTrCoMKgIE1vbiBBdWcgMTQg
MTU6NDY6NDAgMjAyMyArMDIwMA0KPiANCj4gIMKgwqDCoCByZWNpcGVzLWRldnRvb2xzL3B5
dGhvbjMtZ3NwcmVhZDogaW50ZXJmYWNlIGZvciBnb29nbGUgc3ByZWFkc2hlZXQNCg0KU3Vi
amVjdCBzaG91bGQgYmUNCg0KcmVjaXBlOiBTaG9ydCBzdW1tYXJ5DQoNCkRlc2NyaXB0aW9u
IG9mIHBhdGNoDQoNClNpZ25lZC1vZmYtYnk6DQoNCg0KVGhpcyBsaW5rIGhlcmUgWzFdIGlz
IGhhbmR5IHRvIGxlYXJuIGFib3V0IHN1Ym1pdHRpbmcgcGF0Y2hlcyB0byBPRQ0KDQo+IA0K
PiAgwqDCoMKgIFNpbXBsZSBpbnRlcmZhY2UgZm9yIHdvcmtpbmcgd2l0aCBHb29nbGUgU2hl
ZXRzLg0KPiANCj4gIMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBEYW5paWwgS2xpbXVrIDxkYW5p
aWwua2xpbXVrQDNtZGViLmNvbT4NCj4gDQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24zLWdzcHJlYWQvcHl0aG9uMy1nc3ByZWFkXzUu
MTAuMC5iYiANCj4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbjMtZ3Nw
cmVhZC9weXRob24zLWdzcHJlYWRfNS4xMC4wLmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTEzZTQ1MjM1M2NkDQo+IC0tLSAvZGV2L251bGwN
Cj4gKysrIA0KPiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uMy1nc3By
ZWFkL3B5dGhvbjMtZ3NwcmVhZF81LjEwLjAuYmINCj4gQEAgLTAsMCArMSwxNSBAQA0KPiAr
U1VNTUFSWSA9ICJHb29nbGUgU3ByZWFkc2hlZXRzIFB5dGhvbiBBUEkiDQo+ICtIT01FUEFH
RSA9ICJodHRwczovL2dpdGh1Yi5jb20vYnVybmFzaC9nc3ByZWFkIg0KPiArQVVUSE9SID0g
IkFudG9uIEJ1cm5hc2hldiA8ZnVzcy5oZXJlQGdtYWlsLmNvbT4iDQoNCkRyb3AgQVVUSE9S
IGZpZWxkLCB3ZSBkbyBub3QgdXNlIGl0IGFueW1vcmUNCg0KPiArTElDRU5TRSA9ICJNSVQi
DQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gDQo+ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTk0
ODhlMjE5ODM2NzVmYTU2ZGMwNWFmNTU4YjgzZTJmIg0KPiArDQo+ICtTUkNfVVJJID0gDQo+
ICJodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYjQvNGYvMDMzZWJm
MzQ3Nzg3NDUwNjFiNjdiMTA0ZWYyMTJlZDViMDVmYTY1YTUzMGYzNDVmODhjNDM1NWZkY2Mz
L2dzcHJlYWQtNS4xMC4wLnRhci5neiINCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICJmMjExOThl
ODBhNTBkMGU2ZDU1N2Q5ZmVhNmE3OWU4ZSINCg0KZHJvcCBkbTVzdW0sIGl0cyBkZXByZWNh
dGVkLg0KDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSANCj4gIjJiNmJiYTZkYzExMTU4MDE3
MDM0NmE5YmNkMTg5M2UwZThjNTJmNjdhOWU1MzdjYWVjN2I3YTFlMjdjMTQ0MzUiDQo+ICsN
Cj4gK1MgPSAiJHtXT1JLRElSfS9nc3ByZWFkLTUuMTAuMCINCg0KdXNlIFBWIGluc3RlYWQg
b2YgNS4xMC4wIGhlcmUNCg0KPiArDQoNClsxXSBodHRwczovL3d3dy5vcGVuZW1iZWRkZWQu
b3JnL3dpa2kvSG93X3RvX3N1Ym1pdF9hX3BhdGNoX3RvX09wZW5FbWJlZGRlZA0KDQo=
--------------AbD0jtiGRQMItJA39Q4M9Mnw
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnm
DLpLSdfvZw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8
itwOoVR41DOBkftVmiO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXP
WndN1Ka4M/hzt7g+FmeyEssD/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e
1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/B
h0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuKER4Y8ycTq3gbIGJtVrIJjWPC
zWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6QjnIlzzcuMvRdZn2I
rnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN6g3vSlrR
JqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQII
AwQWAgMBAh4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0g
AJ9wRt36PqfjNe904evWolFf5cMmp8JgBBMRCgAgAhsDBgsJCAcDAgQVAggDBBYC
AwECHgECF4AFAlMELRoACgkQuwUzVZGdMxS6XgCfbzYVo3uhhczYDwnNC3VlZ5RO
UlkAnR46C6nYSrHHqBkU5ATsSRGY5vqIzsNNBEqXaJEQEACONtVDnlECi4B7SXSc
+wqRZ20y5QfAF0sGSkXesYz9/S4OU9pDNgYuMpPvEOjJGHzHa0XBa85+KqtkUCvF
fx7h+wAKYl0vSRqFNvEL/xKZJZUdeLXQlRfZ+Znm5/OVcCeXSK9eRaetR8tf0N03
AvoNHgN4Ur2oEWq0eYrlNBcy7zsb4wnCA0kjAIpBfiIj1gkgsy6oidXBrGDn8At0
p8TdA+a1p2cpv9y5SbiAgJ1ol7JB8jqp1gtxK7IFYJsAQwzXCaFECHDlGDMxFEiq
5mXE+3uVmRdeNqWzszqO6HztUZGggnBihCL3tDVkfM8GjcCUw97eFo2KGR3oPeXC
90HimaNgbgjpscKC0SESyzeEe+wFqpX2NXV0xRKz3lnFC1P2q2Q7HJ0eA6XBFfcI
b6vnzgn+zi9ab6I9C0u8NjW7hQXA4uMI4V7vT0Fwsl09HYZCI4+jJkXuVVjye792
1OsAS6JkWTgcPtp9SVyv8grA9YgPVX2REugOXN1s26hTL9d9USsrzByiIajB6sQx
53hqM2grELEHB4iSPGooy3wIqCnfSf1TGWOCURyB/79S6bBIfGplwI9VtZe12HL+
HAyTbuyE51S9qLKd6nw6xUaoDNKx4vipkgnlfMJzJXgokKbCZ1DO3n5nKVxWZ6rp
Hihv53wkgNTQQup3DHAgOJOPRwADBQ/+Kc3f+vwgUOaziDnFp8+sLDfWjaMhhqGQ
h83RZU9Yjkr+EUKjY9zM9K3MNxOxnHuY3arCkY57cvP3/SStl6SyvPVkgc2LktNq
y7NfIUls7Tlj56IeBXWtXtVUSKk6ulXXj3rDXXZj/RJn8WE58SYQDVN4N6PLaxmJ
M5RbiDLN7BscykTTt3bsXaozY18wyEpAJy/Ov43RUmYA54BMSK/E9Qef4Olf82eI
FY5xa/77AeXG/RevreCxEpK3rZ4UoaOAXnSEcPmUzfXOKrJxzjaxuByoBn6tgWVv
2TTclwrKrVd1VRKb7FwLYMxKy1MjqKoUwajoWcQ76DITlV1x5qNu5nUY6YlclQLJ
gh0a68LIigqNMT2VwhhIQQNlB6PnF2IaT15TPQw+ZkRTBJH+cuabCMcMmLSmtW+z
3Gp7lu9Ld108Cp6m9nlSuKyC1YP5MMjyS2S3lUuHdewb0W5dRUBpqE68UwaJm2yK
gNdOisvgB8x64D1/7IvCsJVA7fGYf9YDROB//mBgHe30qgc+MsE2u5U65BsCO5uL
Sm9EA5Rwx0F+Y+h+Swri5ZLXMa09ZLtS7Vyy6rsedvu+zOUVh1vN6qNjzUtLLEDS
RymAnF0u/2jtS4ISccNks9sd1Dzc+bLIEpIjfUAp7tFeVA2UHmCvAf2jq4209tXu
r+5GqYqrkSLCSQQYEQIACQUCSpdokQIbDAAKCRC7BTNVkZ0zFHVUAJ9IDpNFYVZL
U2T1aHmEmAcFBe5D5wCbBVUufOp45pebD9wGNMgoKf5XVr/CSQQYEQIACQUCSpdo
kQIbDAAKCRC7BTNVkZ0zFHVUAJwKR1o7etvz+BGmuV2YAfp5Hj16jgCeMPeHdpPC
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------AbD0jtiGRQMItJA39Q4M9Mnw--

--------------T7mVadvKfhEEJFIjzXAeasrB--

--------------qTi4zRVkezGJPWclF4UyEC0e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZNz7pAUDAAAAAAAKCRC7BTNVkZ0zFAS+
AJ9LLJlmu19vKRlaKccJil4yyIiZcACfQxAYLU/+fnotRdDIuSp+QQwuWF0=
=D9O6
-----END PGP SIGNATURE-----

--------------qTi4zRVkezGJPWclF4UyEC0e--

