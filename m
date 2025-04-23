Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F436C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:55:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.12387.1745423722884097340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 08:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EzoDHR+2;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73972a54919so7001808b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423722; x=1746028522; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HJmOWQmtNIjX0vNtB+mZItKRd+mqSQjnMj8B3I1x5o=;
        b=EzoDHR+2xPJiJdnTzu7RTHMlSSILIhg+pSMwYx6GV8ZuWIiBNnFbe1rPEudHYTC6cu
         yF+d0oBf8BVFjRQmU1l2vVG/ZjlTH2N+ETsrCgpFY2Zph/fEvbtdCX8RSU7b1ZvCpFIr
         izUR8rxhhAigvYTnD/y2cJm2PtnYvLtVz8XFERq/Fv3ihoqOO1JkQR45MCDmBNrsSEKI
         uSz7cQtA3gfpkGIE/tZ7zrUamXwysaTlzcclllwXupkRA7D8OVklJJ3fjkJSJQ+KeT8v
         d0u3WoxGxeeo+0rO3bveX2CAN9e19I9bDmh/PJ7UycNZzgLpyIMSPz22vED/SdZe9Ycj
         QCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423722; x=1746028522;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1HJmOWQmtNIjX0vNtB+mZItKRd+mqSQjnMj8B3I1x5o=;
        b=Sb8ollQKTBWy6nZCd9TtztD823wy5UnenJd+M6II62Fgz4G3ynWcRS57EmwOm3Iwtv
         /VtBFFHzM3HIzujZWA+CqOYez/sIGZo3TvwAyxR/HM/C26IPvMwvSutN4tPHK2aN9uSw
         /bSO0LBxbjQ/+E+4FmXwqYgsYAirBZp+AX9VQY2LWdOUh4wPFDkWs9cZ5CM9aGj8XMxz
         cPM9PPCH3RNntbn1C4T3VW3xLl5cyDlUKj+qzGB0qnD6pJOe+5F1GFQ6+ekjwWJjdWH5
         mmyDRqRcJJUufGiFyM8tth65V63OPghqsRpkVsYWDGv8EX/Zs443gr3eXxnR6m79AUxB
         UABw==
X-Gm-Message-State: AOJu0Yx8jG0mI1zz6mcfxSd+q363FcJXpRL7IxOshOcOBfbNUXH46dhB
	4q21d+hdcP7GKwvzL/nv+ns/SLFdQZBAXmnKGD/E96GDDSqUMAuACrX+Thaq
X-Gm-Gg: ASbGncuUNFSJ4m9SS5brCao66QanROb2Rbyg55C4NzG1B7GnTozKZQdFXG/PCoSSuvq
	5jifRn7IHSkcczCxv6KDygwFquSXakpRGP8vvk1T009wK8n4ogwc+VguAN2aFpHY2UCkylOcMp0
	huUC/mnG2s57D/g68hCrSbk4hFbeK9323B+pPXRKDmaenODgCXMofMxPbgXVyzlC6cQv7u12NPU
	3zjPDOXG/+H/chZNhP30ndt4NGR79kdBZm4Q402uc8YJO++CV2jv3QCorBxU2jmoWuZ3TF7PyvZ
	3tpNXPYDFlv3go+4uYCqpf5ZMzo4pYqiF0837ipGG756Skn3qGGuKfvg53S06DivkO/xbiJhtjI
	EvA7M9C5C/ZB1VbXjqXZ8xE4YzVUeRt0Zi7PVJ1Y=
X-Google-Smtp-Source: AGHT+IGRYG0K2j2vxSejvNhjbVFBwMs24YzcQ6iQP5XYhhGKGL/zZprqUTdBj1Husuaju9FUYDyN2Q==
X-Received: by 2002:a05:6a21:1193:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-203cbc75397mr29784741637.25.1745423721854;
        Wed, 23 Apr 2025 08:55:21 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d47a:b503:3958:9e47? ([2601:646:8201:fd20:d47a:b503:3958:9e47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0fd23599cesm6248287a12.59.2025.04.23.08.55.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:55:21 -0700 (PDT)
Message-ID: <87f53b1d-2646-4bf9-87db-34a4d0bc275a@gmail.com>
Date: Wed, 23 Apr 2025 08:55:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
To: openembedded-devel@lists.openembedded.org
References: <20250423143607.453363-1-fleuryhugo7@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20250423143607.453363-1-fleuryhugo7@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iy7uTIH8flaEIOXSOqAfsI2P"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 15:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117084

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iy7uTIH8flaEIOXSOqAfsI2P
Content-Type: multipart/mixed; boundary="------------0h7uCCwqHI2ofKiP06GfZUTF";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <87f53b1d-2646-4bf9-87db-34a4d0bc275a@gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
References: <20250423143607.453363-1-fleuryhugo7@gmail.com>
In-Reply-To: <20250423143607.453363-1-fleuryhugo7@gmail.com>

--------------0h7uCCwqHI2ofKiP06GfZUTF
Content-Type: multipart/mixed; boundary="------------MK0pTSb6VyE5dtKVb1bqvwz6"

--------------MK0pTSb6VyE5dtKVb1bqvwz6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMy8yNSA3OjM2IEFNLCBIdWdvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPiBGYXN0QVBJIGlzIGEgbW9kZXJuLCBoaWdoLXBlcmZvcm1hbmNlIHdlYiBmcmFt
ZXdvcmsgZm9yIGJ1aWxkaW5nIEFQSXMgd2l0aCBQeXRob24gMy43KyBiYXNlZCBvbiBzdGFu
ZGFyZCBQeXRob24gdHlwZSBoaW50cy4NCj4gDQo+IFRoaXMgYWRkcyB0aGUgRmFzdEFQSSBy
ZWNpcGUgdG8gbWV0YS1weXRob24sIGFsb25nIHdpdGggaXRzIGRlcGVuZGVuY2llcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEh1Z28gRkxFVVJZIDxmbGV1cnlodWdvN0BnbWFpbC5jb20+
DQo+IC0tLQ0KPiAgIC4uLi9weXRob24vcHl0aG9uMy1mYXN0YXBpXzAuMTE1LjEyLmJiICAg
ICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZhc3RhcGlfMC4xMTUuMTIuYmINCj4gDQo+
IGRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWZhc3RhcGlfMC4xMTUuMTIuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWZhc3RhcGlfMC4xMTUuMTIuYmINCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uZTAzYWEwOGM1ZA0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
ZmFzdGFwaV8wLjExNS4xMi5iYg0KPiBAQCAtMCwwICsxLDIzIEBADQo+ICtTVU1NQVJZID0g
IkZhc3RBUEkgLSBoaWdoIHBlcmZvcm1hbmNlIEFQSSBmcmFtZXdvcmsiDQo+ICtIT01FUEFH
RSA9ICJodHRwczovL2Zhc3RhcGkudGlhbmdvbG8uY29tLyINCj4gK0xJQ0VOU0UgPSAiTUlU
Ig0KPiArDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT05NTc5
MmZmM2ZlOGUxMWFhNDljZWIyNDdlNjZlNDgxMCINCj4gKw0KPiArU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjFlMmMyYTI2NDY5MDVmOWU4M2QzMmYwNGEzZjg2YWZmNGEyODY2NjljNmM5NTBj
YTk1YjVmZDY4YzI2MDI2ODEiDQo+ICsNCj4gK2luaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhDQo+ICsNCj4gK0RFUEVORFMgKz0gIiBcDQo+ICsgICAgJHtQWVRI
T05fUE59LXBkbS1uYXRpdmUgXA0KPiArICAgICR7UFlUSE9OX1BOfS1wZG0tYmFja2VuZC1u
YXRpdmUgXA0KPiArIg0KPiArDQo+ICtSREVQRU5EUzoke1BOfSArPSAiIFwNCj4gKyAgICAk
e1BZVEhPTl9QTn0tcHlkYW50aWMgXA0KPiArICAgICR7UFlUSE9OX1BOfS1weWRhbnRpYy1j
b3JlIFwNCj4gKyAgICAke1BZVEhPTl9QTn0tc3RhcmxldHRlIFwNCj4gKyAgICAke1BZVEhP
Tl9QTn0tdHlwaW5nLWV4dGVuc2lvbnMgXA0KPiArIg0KDQpQbGVhc2UgcmVtb3ZlIFBZVEhP
Tl9QTiBoZXJlLCByZXBsYWNlIGl0IHdpdGggcHl0aG9uMy0NCg0KPiArDQo+ICtQWVBJX1BB
Q0tBR0UgPSAiZmFzdGFwaSINCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE3MDgwKTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE3MDgwDQo+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjQx
NTIyMS8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBn
bWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------MK0pTSb6VyE5dtKVb1bqvwz6
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

--------------MK0pTSb6VyE5dtKVb1bqvwz6--

--------------0h7uCCwqHI2ofKiP06GfZUTF--

--------------iy7uTIH8flaEIOXSOqAfsI2P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAkNaAUDAAAAAAAKCRC7BTNVkZ0zFPFx
AJ0ZoWnKMNRwU001Ahgd4PZ0OciKBQCeM7WrY0GmeZBpbchaL2dATb7Lv00=
=ZvFD
-----END PGP SIGNATURE-----

--------------iy7uTIH8flaEIOXSOqAfsI2P--

