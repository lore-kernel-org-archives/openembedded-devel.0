Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1847CC369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 16:43:21 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.10974.1745599397737138388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 09:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C/maublo;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3420558b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745599397; x=1746204197; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEBNjf0rnIGpAMk7cfaV0fYLTEynmgyP8TyG2F4zRbE=;
        b=C/maubloB9extJn77fDcCj2ickiGL0F6rKCcsVUo3ejgP5zo4uGwNGyFIojMSkoWnh
         5imqpRny8UQGm4irMtsoHAHhbWseau1hPd+u+V6Xnjm90VNyj7+mFT+Y3jM/y/v+Ujcy
         YlS7P1TPUrPjJUjgCms4odySruaeEDvr3joT8Ym57+V+/NJXlgdQh3dX6H1uIZA+gWV8
         EXEQZmbgCxiLoSNRJ+tMlOkq6bXrfH5SVYAlU5vnlXgFeLDhDsP1jjtn5uzv+feWFWTw
         Coub/7Uhb/ci1bvjCXR99M4ylF+rgN9ymfAz9JtVhhl3l8fcGO3jS7/EJGV0bn5hCA0U
         vfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599397; x=1746204197;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rEBNjf0rnIGpAMk7cfaV0fYLTEynmgyP8TyG2F4zRbE=;
        b=FG1eyeJT64DVTJvmnZ/z4VQCNwHgNXvxVDK7vyr8EbYs8GNnKPPFvaJ7qTrFoWaWTP
         yJihoTAYAw33Xx2Y0a4tqmh849Vz26QpUxxEwScui8zbW4VRafBvhMkIv9vEu/jFVQOD
         1G3kBV4Y36T4W2tj/hc0DwNfGBie8j1NP8EaxAHfyFQ5ypcLYXBERA3sZLXwwJ2YvIg7
         Otht9MHj0laTbSQHM6UZ00nm01Ni9BbxcsT14ZwTTSR3bXOY1ZTvPLETZUy8AAIL8xF3
         FUAibbvw1qDeWIbhSkOC3g+wdDqWKhPIGoPdiOR+dhFQZTw41jYbwRRBC1frMtXgZcrq
         Kxcw==
X-Forwarded-Encrypted: i=1; AJvYcCVdoDCeed39HcNqaKvlRRZpub9HgVaC15zwYPbn0lBxaqKrclwfcpJKPf3gOLAf40xhLiL9Y8MZlI1fBwImXmf4/dU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHWHonIDaRkHEtbdGBj0Mq7/Jdfsi4wH3asVm9BFKbvVZ7WXDI
	oLt8RSV1ed7ZmKTE/kAEitKVsjnGilQu8alDa1uxPez8kjIFtXxX
X-Gm-Gg: ASbGnct7bomnF9QuYBySjCDNBcOmrY4oZD+1vst58HFQgOLLJBpdtgzsnDFVfbihO/F
	3f32NS5eJwOp9tukrFB9apNM6N8kPzIXwEJm1jv4dhec3NEBSxChsoeIUgw3PNnMgmwyOIx6O6O
	doz1MpsNNeUjp721oz756T3guFVRTW3mbK82wHcGp/mrkZ1bdURLZznSkI5Ntc8h+8t9HktzlVC
	8QsCFTp5/ODz5IF54sNkZjxXTrJNopy5eHTMhYgqvZ+8uvDVtz7MS0CbYUPPYca+bjZlOvgXJxg
	k6sTEukdAR9wVWmJOINg4fFtZTRq6x18BYgM432S14WLzQTOYsQGzTwIA7pAhe4hfShwQ7WADFl
	R5iotPpxeikgCVpejYypeVzUBEP+4GvHF7A==
X-Google-Smtp-Source: AGHT+IGcSH3ZolVlUUeAt0A6X+7dpIKJm5F8wFsTRvEit4kgq2z+p+Bgh0c0rUmCxCXId5p+koJFvA==
X-Received: by 2002:a05:6a21:8ccc:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-2045b9f2675mr4408064637.42.1745599397008;
        Fri, 25 Apr 2025 09:43:17 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f898:7ed7:5763:ec63? ([2601:646:8201:fd20:f898:7ed7:5763:ec63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7ec1faasm2618096a12.29.2025.04.25.09.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:43:16 -0700 (PDT)
Message-ID: <62c3c5ed-878b-4498-bd18-6fc487051245@gmail.com>
Date: Fri, 25 Apr 2025 09:43:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] libsdl3-ttf: make use of
 virtual/libsdl3
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250424210659.2282492-1-f_l_k@t-online.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20250424210659.2282492-1-f_l_k@t-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WIun2sLsD30kfjcsVsfo88uD"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 16:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117132

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WIun2sLsD30kfjcsVsfo88uD
Content-Type: multipart/mixed; boundary="------------O4N5cpjZSPr07qPhwRzY9f89";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-ID: <62c3c5ed-878b-4498-bd18-6fc487051245@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libsdl3-ttf: make use of
 virtual/libsdl3
References: <20250424210659.2282492-1-f_l_k@t-online.de>
In-Reply-To: <20250424210659.2282492-1-f_l_k@t-online.de>

--------------O4N5cpjZSPr07qPhwRzY9f89
Content-Type: multipart/mixed; boundary="------------0NLzDZFLRsSLs8cXN4q2OBRD"

--------------0NLzDZFLRsSLs8cXN4q2OBRD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNC8yNSAyOjA2IFBNLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25s
aW5lLmRlPg0KPiAtLS0NCj4gICBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMy9s
aWJzZGwzLXR0Zl8zLjIuMi5iYiB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlic2RsMy9saWJzZGwzLXR0Zl8zLjIuMi5iYiBiL21ldGEtb2Uv
cmVjaXBlcy1ncmFwaGljcy9saWJzZGwzL2xpYnNkbDMtdHRmXzMuMi4yLmJiDQo+IGluZGV4
IGY5MTRkMWRjZmYuLjRiYzg0ZWM2ZWUgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBl
cy1ncmFwaGljcy9saWJzZGwzL2xpYnNkbDMtdHRmXzMuMi4yLmJiDQo+ICsrKyBiL21ldGEt
b2UvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwzL2xpYnNkbDMtdHRmXzMuMi4yLmJiDQo+IEBA
IC0xLDYgKzEsNiBAQA0KPiAgIFNVTU1BUlkgPSAiU2ltcGxlIERpcmVjdE1lZGlhIExheWVy
IHRydWV0eXBlIGZvbnQgbGlicmFyeSINCj4gICBTRUNUSU9OID0gImxpYnMiDQo+IC1ERVBF
TkRTID0gImxpYnNkbDMgZnJlZXR5cGUiDQo+ICtERVBFTkRTID0gInZpcnR1YWwvbGlic2Rs
MyBmcmVldHlwZSINCg0KSSBzZWUgdGhhdCBsaWJzZGwzIHJlY2lwZSBkb2VzIFBST1ZJREUg
dmlydHVhbC9saWJzZGwzIGJ1dCBpcyBpdCANCnJlcXVpcmVkID8gYXJlIHRoZXJlIG11bHRp
cGxlIHByb3ZpZGVycyBmb3IgbGlic2RsMyBhdmFpbGFibGUgdG8gY2hvb3NlIA0KZnJvbSA/
DQoNCj4gICBMSUNFTlNFID0gIlpsaWIiDQo+ICAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PWZiYjAwMTBiMmY3Y2Y2ZThhMTNiY2FjMWVmNGQyNDU1Ig0K
PiAgIA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9S
ZXBseSBPbmxpbmUgKCMxMTcxMTgpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTcxMTgNCj4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTEyNDQxMDk1LzE5OTc5MTQN
Cj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------0NLzDZFLRsSLs8cXN4q2OBRD
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------0NLzDZFLRsSLs8cXN4q2OBRD--

--------------O4N5cpjZSPr07qPhwRzY9f89--

--------------WIun2sLsD30kfjcsVsfo88uD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAu7owUDAAAAAAAKCRC7BTNVkZ0zFIJK
AJ4sZ4I2kxIGM7CKK8nbKzPg6ETBaACeOINqZoZ9OGW1ClzXkbvE6+K8c+w=
=t5XC
-----END PGP SIGNATURE-----

--------------WIun2sLsD30kfjcsVsfo88uD--

