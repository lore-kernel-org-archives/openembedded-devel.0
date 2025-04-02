Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A39CC36017
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:27:21 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.9911.1743604031650441152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 07:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hkjz9RtA;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b98acaadso254921b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743604031; x=1744208831; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9+wLsCgI4de6uzbRwfnlO7cihUXXs094xZx8bc0VYM=;
        b=Hkjz9RtAnxrVor2BiDgQzqHLlqG+JK3TObHQ/KFxR4UVFO8VzbejgH7XgZZe9H/DTa
         6T8Bw/UOJQECP0QEX9AuZEiUtO6oVffaSnBdvPkN10fB6SJbudW8t7sxnTMHpFTbZbC6
         YEW6aZ8LO3yfhPXJp95F2K0IlhJe33++MeiTFOnwpIxDRUGUS+76kdbw1EnZ9U0unFsk
         yZKeIqC+gNOlb1e7kRZAK6GGj/CYSPxqSEsty+60cNnA1yyWwAMcyyq2cVC+c4R1y3pl
         1O7vAMhY9hq+DYFJHfRQxLgD+fo7JK5q/LwyTS4DkEEiwIEOResJOtaM0sPaW4u/zDY0
         c60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604031; x=1744208831;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W9+wLsCgI4de6uzbRwfnlO7cihUXXs094xZx8bc0VYM=;
        b=BgAV70J2zNkAoScvALEzrkbOh0hP/ZshBu87QLYLpKotGzRbQS4JNiX1yJRT/HXuup
         b/BJ117DONha25BWJOQ05LxBGi3tNTs5qJ5vUBtZ+B7gtRy6tE9Lt2gYu3jCA5hwmPlI
         /c8j3V7bn1sudzYdtI2rd7GvtS/Q9PCBsm0r6k6X0IYUebox4mGNbE7mNgxDNsR+ICTP
         xkN1J9C/85dOfhyMX7QAXdQS/WycH3swo2H8lLga5RkHZV4fg61i662y0F1xJju1Kvjq
         4TkEGUnj+Uar0/DWRUw9ZCeP4ZR30rdbXz1weSwQaZJ3510YXB6yL581i1gRCK2VFI0e
         1CXg==
X-Forwarded-Encrypted: i=1; AJvYcCXlZWfdpcxv8gNJJI5KYHhYD09r1YTyS9iTp0bG3zv9P3akTY16RLOGNg52WLFywzO1XNNMy9JVzi6mCkcATWZSPqU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNifTdPjP0Yj1tK2295sr31lHayO1IX+BUesf4JlYoi/7CzKTS
	Sg+Buxjg7i30peLqq7pawSqu7vOrw1M4FoDxhEpYLpScXOsCxFzDcbs9IIeu
X-Gm-Gg: ASbGncuPd2n9gydYz/kqgFtnbr5JwGEekWICWRljqhutNgYWtCrWbohQOJOljhCzfUF
	2lzlFRNf7ALfT26dYm09Sog4uKWStAyyDci3Gb2r8ntpuUEgs067S2n1GwCQcQDXblQfK4+yPXm
	BzRMIcVwWq4nRRUaXv/rVHfX63Rg3w5X+7RvQBsWTCB4aX2nLg7UENuzq7DL3cVQxV8N2dLwaLq
	mwFq68YTyi9OcWCLmcRgzuzgM5YGzwRi/iTRrQrIod0WBXb8r9WqxDy7KYyRclvkmcEoA/nKppi
	uWON346HkEDycckXLcNHZNQFY1ZsWBV4cXjkSmEIgOibWWKdhEd80/ApGYeB8YgzZpPmj6qgTOF
	bAY4NVRmUC5KZ/f8znbT9dDCrtOCM+TcGecb+fA==
X-Google-Smtp-Source: AGHT+IG5IKuDNZUsOBCeJt1UAKIPKp5pIBIyL+MClZSgdz7TWTBa8ACSz84uFusR/5ZdAG3AWSLuUw==
X-Received: by 2002:a05:6a00:3a11:b0:739:4a93:a5df with SMTP id d2e1a72fcca58-739c78b093bmr3562461b3a.12.1743604030819;
        Wed, 02 Apr 2025 07:27:10 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:ad56:4c5a:38a1:eb4b? ([2601:646:8201:fd20:ad56:4c5a:38a1:eb4b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710acd6esm11354293b3a.145.2025.04.02.07.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 07:27:10 -0700 (PDT)
Message-ID: <f6b6ca1f-8792-4f99-84cf-bf6f82631576@gmail.com>
Date: Wed, 2 Apr 2025 07:27:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] sdbus-c++: Support using alternative
 runtime D-Bus
To: niko.mauno@vaisala.com, openembedded-devel@lists.openembedded.org
References: <20250402112901.3804235-1-niko.mauno@vaisala.com>
 <20250402112901.3804235-2-niko.mauno@vaisala.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20250402112901.3804235-2-niko.mauno@vaisala.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0dEinHaScI0TqHW0AWhU4b7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 14:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116525

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L0dEinHaScI0TqHW0AWhU4b7
Content-Type: multipart/mixed; boundary="------------uHxYT8VS7u2o0WN1hLLpZBbu";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: niko.mauno@vaisala.com, openembedded-devel@lists.openembedded.org
Message-ID: <f6b6ca1f-8792-4f99-84cf-bf6f82631576@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] sdbus-c++: Support using alternative
 runtime D-Bus
References: <20250402112901.3804235-1-niko.mauno@vaisala.com>
 <20250402112901.3804235-2-niko.mauno@vaisala.com>
In-Reply-To: <20250402112901.3804235-2-niko.mauno@vaisala.com>

--------------uHxYT8VS7u2o0WN1hLLpZBbu
Content-Type: multipart/mixed; boundary="------------00WY0HCzPUeXQot5SPkRbw2F"

--------------00WY0HCzPUeXQot5SPkRbw2F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yLzI1IDQ6MjkgQU0sIE5pa28gTWF1bm8gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgd3JvdGU6DQo+IEluIG9yZGVyIHRvIGZhY2lsaXRhdGUgdXNpbmcgZS5nLiBkYnVzLWJy
b2tlciBhcyBydW50aW1lIEQtQnVzDQo+IGltcGxlbWVudGF0aW9uLCBjaGFuZ2UgdGhlIEZy
ZWVkZXNrdG9wLm9yZyBzcGVjaWZpYyBELUJ1cyBydW50aW1lDQo+IGRlcGVuZGVuY3kgZGVj
bGFyYXRpb24gdG8gaG9ub3Igb2UtY29yZSdzIG5ldyBWSVJUVUFMLVJVTlRJTUVfZGJ1cw0K
PiB2YXJpYWJsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pa28gTWF1bm8gPG5pa28ubWF1
bm9AdmFpc2FsYS5jb20+DQo+IC0tLQ0KPiAgIG1ldGEtb2UvcmVjaXBlcy1jb3JlL3NkYnVz
LWMrKy9zZGJ1cy1jKytfMi4wLjAuYmIgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9yZWNpcGVzLWNvcmUvc2RidXMtYysrL3NkYnVzLWMrK18yLjAuMC5iYiBiL21ldGEtb2Uv
cmVjaXBlcy1jb3JlL3NkYnVzLWMrKy9zZGJ1cy1jKytfMi4wLjAuYmINCj4gaW5kZXggMmI2
YmIxMDExYS4uYTNlN2M5YWI1NCAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNv
cmUvc2RidXMtYysrL3NkYnVzLWMrK18yLjAuMC5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lw
ZXMtY29yZS9zZGJ1cy1jKysvc2RidXMtYysrXzIuMC4wLmJiDQo+IEBAIC00Niw2ICs0Niw2
IEBAIGRvX2luc3RhbGxfcHRlc3QoKSB7DQo+ICAgRklMRVM6JHtQTn0tcHRlc3QgPSsgIiR7
c3lzY29uZmRpcn0vZGJ1cy0xL3N5c3RlbS5kLyINCj4gICBGSUxFUzoke1BOfS1kZXYgKz0g
IiR7YmluZGlyfS9zZGJ1cy1jKysteG1sMmNwcCINCj4gICANCj4gLVJERVBFTkRTOiR7UE59
LXB0ZXN0ICs9ICJkYnVzIg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gIiR7VklSVFVB
TC1SVU5USU1FX2RidXN9Ig0KPiAgICMgSXQgYWRkcyAtaXN5c3RlbSB3aGljaCBpcyBzcHVy
aW91cywgbm8gaWRlYSB3aGVyZSBpdCBnZXRzIGl0IGZyb20NCj4gICBDQ0FDSEVfRElTQUJM
RSA9ICIxIg0KPiANCg0KVGhhbmtzIGZvciB0aGVzZSBwYXRjaGVzLCBhcyBJIHVuZGVyc3Rh
bmQgdGhleSBkZXBlbmQgdXBvbiB0aGUgY2hhbmdlcyANCmluIGZsaWdodCBmb3Igb2UtY29y
ZSwgc28gZG8gbWUgZmF2b3IsIGNvbnNvbGlkYXRlIGFsbCB0aGUgcGF0Y2hlcyANCm5lZWRl
ZCBpbiBtZXRhLW9wZW5lbWJlZGRlZCBsYXllciBpbnRvIGEgc2luZ2xlIHNlcmllcyBhbmQg
c2VuZCBpdCANCnRvZ2V0aGVyIGFuZCBwZXJoYXBzIHNlbmQgYSByZW1pbmRlciBvbmNlIGl0
IGdldHMgbWVyZ2VkIGludG8gb2UtY29yZS4NCg0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExNjUyMyk6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExNjUy
Mw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
dC8xMTIwNDQ1NzYvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVs
K293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBbcmFq
LmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------00WY0HCzPUeXQot5SPkRbw2F
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------00WY0HCzPUeXQot5SPkRbw2F--

--------------uHxYT8VS7u2o0WN1hLLpZBbu--

--------------L0dEinHaScI0TqHW0AWhU4b7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZ+1JPAUDAAAAAAAKCRC7BTNVkZ0zFPn8
AJ9qPrnDdzZkxIW1LsS092T9Z8B7TgCfZzoxGJrIYmh5tQMRp1myys9tBMI=
=NmKB
-----END PGP SIGNATURE-----

--------------L0dEinHaScI0TqHW0AWhU4b7--

