Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00668C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 18:38:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.67375.1723142321248539412
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 11:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e9rRTJL/;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd9e6189d5so12244715ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723142320; x=1723747120; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOEfSknHwU1wFEp9FR67w3hf6R3REHnep7SKW4ie5mw=;
        b=e9rRTJL/O6/H9DkgQJ+GHCLyRYTJg0soAre5G4omWFFvi+wyrZkLOF1tWh5BWpM5fz
         h5Ae2S3Qt8UssKtm98oGodMmHA8GC3TvrTfLP4rcaSKG36PXRf76BVaSh15EXiwUSfqX
         Pg0lNfijAtram3b/tcakTeGDfswZxWZHZLjwvSLWSlUigQVnAdz2s6njJ4ZxA+mc5fYd
         I6nA4kee8T6KIByZIVRXoet6TTMZjMlnBOIzdFjdniEYHWqkg0oXogtWLRKlYL1V5a6p
         2p6SN7/BvAx5oRGZDzU4lrdRaA1y8MkOZflDkKZJMUICNhPEHoX8tdd/Hp1Y8NDaI0xD
         tVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723142320; x=1723747120;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NOEfSknHwU1wFEp9FR67w3hf6R3REHnep7SKW4ie5mw=;
        b=Wyv33PFPZ02O/8yKdBHqMswmqnhqOU2FI9Pg+HC4MBfMCdwRQgsXuAJP7gEKfdkj4H
         28UVgQNcqAKWgMNQ7VFNT4Ro+UcdtBub2ugChjn9yj0qsAcLCFDtG8EjSbfEI1bvMH4Q
         irtqYeFKRGhpE/s1HIcXBASbLPpyPD/upcAmYMcX9F3eHCFyZAWoGf+FBUhMWmi1jGer
         lYB06ZEWVtsznC0QfZ5lIqephtAcc7nTYPQErVPjUiKGv4rTX6u8fDxf7jbR7rhJi/nb
         8Hrnp61/7DA/Dbg7oOPNRv80bXenQZBqhYXsM0nYAc+lomloE2r7vcd9H1pBEIyBwWhq
         y+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY64QQUM/d7Mr7WsbyZAIui4190LoVd3heM48yHHVJ1ogJpyfhG4t6WIuQsPcD2gHVuUGmn4iBUneEGnkFNkGtuULPgGh3mJki1WGRIwrGhokKHiAnk9LSow==
X-Gm-Message-State: AOJu0YwtYjWw9kWkT1pW2ezZNeZJK5FO4MAWCtEtmtfYZ5k1JnJeEN3e
	3KjRKomzjOCdTgtoMXSMsBhKkZ2fOdZQzgOhZaEzkiOkrICUaXWRr41j5cU4
X-Google-Smtp-Source: AGHT+IFIyVQMl2jhzsdhxp7f6JecCTgCG6W7lXMbd+PoNbvwsAMcjg7/W/1efHGbMBj8IS0uXgJS3g==
X-Received: by 2002:a17:902:ec8b:b0:1fb:58e3:7195 with SMTP id d9443c01a7336-2009522905emr36859675ad.11.1723142320235;
        Thu, 08 Aug 2024 11:38:40 -0700 (PDT)
Received: from ?IPV6:2601:646:9d80:4380:539:eac:bbcc:86bd? ([2601:646:9d80:4380:539:eac:bbcc:86bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19e68sm127981185ad.45.2024.08.08.11.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 11:38:39 -0700 (PDT)
Message-ID: <adc6a5be-ed84-48b5-865c-b14cd8495023@gmail.com>
Date: Thu, 8 Aug 2024 11:38:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 0/5] Upgrade python3-pydantic-*
To: tim.orling@konsulko.com, openembedded-devel@lists.openembedded.org
References: <cover.1723134758.git.tim.orling@konsulko.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ihKSGrQvWnkujUa0ikAu93KO"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 18:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111681

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ihKSGrQvWnkujUa0ikAu93KO
Content-Type: multipart/mixed; boundary="------------8PFn6yz2Fyh1XyRg4Lbjgcni";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: tim.orling@konsulko.com, openembedded-devel@lists.openembedded.org
Message-ID: <adc6a5be-ed84-48b5-865c-b14cd8495023@gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/5] Upgrade python3-pydantic-*
References: <cover.1723134758.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>

--------------8PFn6yz2Fyh1XyRg4Lbjgcni
Content-Type: multipart/mixed; boundary="------------k66ZLMhAR2TM6X8mtT75XwzV"

--------------k66ZLMhAR2TM6X8mtT75XwzV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

ZG9lcyBpdCBhZGRyZXNzIHRoZSBidWlsZHBhdGhzIGlzc3VlID8gb3Igc2hvdWxkIHRoYXQg
cGF0Y2ggYmUgcmViYXNlZCANCm9uIHRvcCBvZiB0aGlzLg0KDQpPbiA4LzgvMjQgOTozOCBB
TSwgVGltIE9ybGluZyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gRnJv
bTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+DQo+IA0KPiBXZSd2ZSBo
YWQgc29tZSB0cm91YmxlIHdpdGggcHl0aG9uMy1weWRhbnRpYyBiZWluZyB1cGdyYWRpbmcg
d2l0aG91dCB0aGUNCj4gcmVxdWlyZWQgdmVyc2lvbiBvZiBweXRob24zLXB5ZGFudGljLWNv
cmUgYmVpbmcgYXZhaWxhYmxlLiBUbyBlbnN1cmUgd2UNCj4gZG8gbm90IGtlZXAgaGF2aW5n
IHRoaXMgaGFwcGVuLCB0aGlzIHNlcmllcyBzZXRzIFJFQ0lQRV9OT19VUERBVEVfUkVBU09O
DQo+IGluIHB5dGhvbjMtcHlkYW50aWMuDQo+IA0KPiBUaGVyZSB3ZXJlIGEgbnVtYmVyIG9m
IG1pc3NpbmcgcHRlc3QgZGVwZW5kZW5jaWVzLCBpbmNsdWRpbmcgcHl0aG9uMy10emRhdGEN
Cj4gd2hpY2ggd2UgZGlkIG5vdCBoYXZlIGEgcmVjaXBlIGZvciB5ZXQuIFRoaXMgc2VyaWVz
IGFkZHMgdGhpcyBuZXcgcmVjaXBlLg0KPiANCj4gVXBzdHJlYW0gaGFzIGEgcGF0Y2gsIG5v
dCB5ZXQgaW4gYSByZWxlYXNlLCBmb3IgdGhlIFRNUERJUiBbYnVpbGQtcGF0aHNdDQo+IGNv
bnRhbWluYXRpb24gd2hpY2ggd2FzIGluamVjdGluZyBSVVNURkxBR1MgaW50byB0aGUgX3B5
ZGFudGljLWNvcmUuKi5zby4NCj4gVGhpcyBzZXJpZXMgYmFja3BvcnRzIHRoYXQgcGF0Y2gu
DQo+IA0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDQ5ZDcwN2UwMzAx
ZDdiY2JhZDM4NmNiZjNkZDIwNWVmNmZkYzU2MWM6DQo+IA0KPiAgICBweXRob24zLWNhY2hl
dG9vbHM6IFVwZ3JhZGUgNS4zLjMgLT4gNS40LjAgKDIwMjQtMDgtMDIgMDg6NTI6NTMgLTA3
MDApDQo+IA0KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4g
DQo+ICAgIGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQt
Y29udHJpYiB0aW1vL3B5dGhvbjMtcHlkYW50aWMtdXBncmFkZQ0KPiAgICBodHRwczovL2dp
dC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkLWNvbnRyaWIvbG9nLz9oPXRp
bW8vcHl0aG9uMy1weWRhbnRpYy11cGdyYWRlDQo+IA0KPiBUaW0gT3JsaW5nICg1KToNCj4g
ICAgcHl0aG9uMy10emRhdGE6IGFkZCByZWNpcGUgZm9yIHYyMDI0LjENCj4gICAgcHl0aG9u
My10emRhdGE6IGVuYWJsZSBwdGVzdA0KPiAgICBweXRob24zLXB5ZGFudGljLWNvcmU6IHVw
Z3JhZGUgMi4xOC40IC0+IDIuMjEuMA0KPiAgICBweXRob24zLXB5ZGFudGljOiB1cGdyYWRl
IDIuNy4zIC0+IDIuOC4yDQo+ICAgIHB5dGhvbjMtcHlkYW50aWMtY29yZTogYmFja3BvcnQg
cGF0Y2gNCj4gDQo+ICAgLi4uL3B0ZXN0LXBhY2thZ2VsaXN0cy1tZXRhLXB5dGhvbi5pbmMg
ICAgICAgIHwgICAxICsNCj4gICAuLi4vcHl0aG9uL3B5dGhvbjMtcHlkYW50aWMtY29yZS1j
cmF0ZXMuaW5jICAgfCAyODAgKysrKysrKysrKy0tLS0tLS0tDQo+ICAgLi4uc2lvbi1mcm9t
LTEuNzYtdG8tMS43NS1pbi1DYXJnby50b21sLnBhdGNoIHwgIDI5IC0tDQo+ICAgLi4uOC40
LmJiID0+IHB5dGhvbjMtcHlkYW50aWMtY29yZV8yLjIxLjAuYmJ9IHwgIDE2ICstDQo+ICAg
Li4udGljXzIuNy4zLmJiID0+IHB5dGhvbjMtcHlkYW50aWNfMi44LjIuYmJ9IHwgICA4ICst
DQo+ICAgLi4uL3B5dGhvbi9weXRob24zLXR6ZGF0YS9ydW4tcHRlc3QgICAgICAgICAgIHwg
ICAzICsNCj4gICAuLi4vcHl0aG9uL3B5dGhvbjMtdHpkYXRhXzIwMjQuMS5iYiAgICAgICAg
ICAgfCAgMjQgKysNCj4gICA3IGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCspLCAx
NjMgZGVsZXRpb25zKC0pDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlkYW50aWMtY29yZS8wMDAxLVNldC1y
dXN0LXZlcnNpb24tZnJvbS0xLjc2LXRvLTEuNzUtaW4tQ2FyZ28udG9tbC5wYXRjaA0KPiAg
IHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1w
eWRhbnRpYy1jb3JlXzIuMTguNC5iYiA9PiBweXRob24zLXB5ZGFudGljLWNvcmVfMi4yMS4w
LmJifSAoODAlKQ0KPiAgIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1weWRhbnRpY18yLjcuMy5iYiA9PiBweXRob24zLXB5ZGFudGljXzIu
OC4yLmJifSAoODclKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR6ZGF0YS9ydW4tcHRlc3QNCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10emRhdGFfMjAyNC4xLmJiDQo+IA0KDQoNCg0KPiANCj4gDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExMTY2OSk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEx
MTY2OQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC8xMDc3OTMyMzcvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRl
dmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBb
cmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==

--------------k66ZLMhAR2TM6X8mtT75XwzV
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------k66ZLMhAR2TM6X8mtT75XwzV--

--------------8PFn6yz2Fyh1XyRg4Lbjgcni--

--------------ihKSGrQvWnkujUa0ikAu93KO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZrUQrgUDAAAAAAAKCRC7BTNVkZ0zFBN1
AJwOGuNJemLhP0r5lv9ZgvJHWouJugCfbwgqlfx8LTxAwZ6BBK4FT9Phvg0=
=4KJo
-----END PGP SIGNATURE-----

--------------ihKSGrQvWnkujUa0ikAu93KO--

