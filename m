Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C341C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:44:40 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.165764.1692204272179377574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IeXl4U4C;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-565403bda57so4147092a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692204271; x=1692809071;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1NbMWlxXkY3eqLzkJz4fitHzJJpGQSQPwNrymrjDHXw=;
        b=IeXl4U4C5kE1Kh1DfaebxaiggkBF5PVD0Jwha3AVl8kwTAQAlCLhJEyEnnpxk0vqil
         bYb4ZgBNusxuEgK6LEdv44RHJCn1xCQKMoZUrKh3dgyyEMErN/EUVbthAYZI7qjIta5i
         ySYUoAhmNjCgeT1ze9cACuSCkeqXT5gfeUW7FXArALLtfYHputnxEpIRDlu8TGBKqMLl
         rWKDk3xjOchBJi90xpH3bxx4W/yZrUfXP4+2i/ODIkVdarX3XPhF3YcDodbUO9I4kahy
         XvEt/nkem/793/vd4nlOLNE/g2oo+zqS6CHYtUWxpvhQbdaphC6+ZFu/tYrw8jR720B3
         qjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204271; x=1692809071;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NbMWlxXkY3eqLzkJz4fitHzJJpGQSQPwNrymrjDHXw=;
        b=UD/5+z4WYKVda1NDX1cJ70oXZmsj2WVodqVkmR8+Zc2fJONpWNryGC8sb6ljdD89Uu
         7u1rraSSlrNLTSWdQP69kTndUqYHJJvCas+FQA1sn0gRwKzVq+yE9kat7ceSp+RMn+r4
         WRhi9OaGSCmIXz7TMP2lr8cUi80MAui41hX6GnGwfbqroOZBdnQ+UsWTNRvlKROCt5mi
         PDgL03/zC1+ApOCbPuGYEh1OL7BOJkzLVnyxQl068CO8PvSDsheo6g+wM0PiuIP+A26P
         4YGdC5LZeme5EOyMmSPdxitQCib3JiUdqKZB777LwAYqLSUI8SW930DNXzgkQxpjAPO5
         u7Dw==
X-Gm-Message-State: AOJu0YyquvX+UIrH+cLQGuQmuVlX7DZN6vsON0bZlcuVAGQ+CQaDf+s2
	zAJ2wO8IPR+sUNYbDSXeiMYpKEtDo4PHGA==
X-Google-Smtp-Source: AGHT+IFgzK1/7gfXDis023ujcJNrUosuLt8TsRs0rZATHn/Gcrp0RMeBodoovgzr4GOnAJjddrQmKQ==
X-Received: by 2002:a17:90a:f405:b0:268:1355:b03e with SMTP id ch5-20020a17090af40500b002681355b03emr1909874pjb.38.1692204271447;
        Wed, 16 Aug 2023 09:44:31 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b192:e884:f5f4:7725? ([2601:646:9100:2cb0:b192:e884:f5f4:7725])
        by smtp.gmail.com with ESMTPSA id nu12-20020a17090b1b0c00b0026b6d0a68c5sm3865456pjb.18.2023.08.16.09.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:44:30 -0700 (PDT)
Message-ID: <8b137183-2fed-4867-ab21-f470a41d96fb@gmail.com>
Date: Wed, 16 Aug 2023 09:44:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH]
 recipes-devtools/python/python3-libusb1_1.7.1.bb: recipe added
Content-Language: en-US
To: Ewa Kujawska <ewa.kujawska@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
References: <20230816063717.3305497-1-ewa.kujawska@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230816063717.3305497-1-ewa.kujawska@3mdeb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lT9XNtXv08kxXQbswhX0Lh0H"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104435

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lT9XNtXv08kxXQbswhX0Lh0H
Content-Type: multipart/mixed; boundary="------------9V5QiXPcPNcvOyyFE9jcicu9";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ewa Kujawska <ewa.kujawska@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
Message-ID: <8b137183-2fed-4867-ab21-f470a41d96fb@gmail.com>
Subject: Re: [oe] [meta-python][PATCH]
 recipes-devtools/python/python3-libusb1_1.7.1.bb: recipe added
References: <20230816063717.3305497-1-ewa.kujawska@3mdeb.com>
In-Reply-To: <20230816063717.3305497-1-ewa.kujawska@3mdeb.com>

--------------9V5QiXPcPNcvOyyFE9jcicu9
Content-Type: multipart/mixed; boundary="------------RMmDsrt2K1NYHZ0sxRUH7ZK0"

--------------RMmDsrt2K1NYHZ0sxRUH7ZK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRXdhDQoNClRoYW5rcyBmb3IgeW91ciBwYXRjaGVzDQoNCkkgc2VlIHN1YmplY3QgZmll
bGQgaXMgbm90IGFzIHJlY29tbWVuZGVkIHBsZWFzZSByZWFkIHRocm91Z2ggdGhpcyBndWlk
ZSANCndoaWNoIGlzIGhhbmR5IHRvIGZpbmQgb3V0IHN1Ym1pdHRpbmcgZ3VpZGVsaW5lcw0K
DQpodHRwczovL3d3dy5vcGVuZW1iZWRkZWQub3JnL3dpa2kvSG93X3RvX3N1Ym1pdF9hX3Bh
dGNoX3RvX09wZW5FbWJlZGRlZA0KDQpyZXN0IG9mIGNvbW1lbnRzIGFyZSBpbmxpbmUuDQoN
Ck9uIDgvMTUvMjMgMTE6MzYgUE0sIEV3YSBLdWphd3NrYSB3cm90ZToNCj4gLS0tDQo+ICAg
Li4uL3B5dGhvbi9weXRob24zLWxpYnVzYjFfMS43LjEuYmIgICAgICAgICAgICAgICB8IDE1
ICsrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbGlidXNiMV8xLjcuMS5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGlidXNiMV8xLjcu
MS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGli
dXNiMV8xLjcuMS5iYg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjQ3Njk2NmMyMTc4Yg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGlidXNiMV8xLjcuMS5iYg0K
PiBAQCAtMCwwICsxLDE1IEBADQo+ICtTVU1NQVJZID0gIlB1cmUtcHl0aG9uIHdyYXBwZXIg
Zm9yIGxpYnVzYi0xLjAiDQo+ICtIT01FUEFHRSA9ICJodHRwOi8vZ2l0aHViLmNvbS92cGVs
bGV0aWVyL3B5dGhvbi1saWJ1c2IxIg0KPiArQVVUSE9SID0gIlZpbmNlbnQgUGVsbGV0aWVy
IDxwbHIudmluY2VudEBnbWFpbC5jb20+Ig0KDQpEcm9wIHNldHRpbmcgQVVUSE9SLCBpdHMg
dW51c2VkDQoNCj4gK0xJQ0VOU0UgPSAiTEdQTC0yLjEiDQoNClBsZWFzZSB1c2UgU1BEWCBz
dHJpbmdzIGZvciBMSUNFTlNFDQoNCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTc1MTQxOTI2MGFhOTU0NDk5ZjdhYmFhYmFhODgyYmJlIg0KPiArDQo+ICtT
UkNfVVJJID0gImh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy84MC9i
Yi80ZWU5ZDc2MGRkMjk0OTlkODc3ZWUzODRmMWQyYmM2YmI5OTIzZGVmZDRjNjk4NDNhZWY1
ZTcyOTk3MmQvbGlidXNiMS0xLjcuMS50YXIuZ3oiDQoNClRyeSB0byB1c2UgYml0YmFrZSB2
YXJpYWJsZXMgYXMgbXVjaCBhcyBwb3NzaWJsZS4gRS5nLiBQViBpbnN0ZWFkIG9mIA0KMS43
LjEgaGVyZQ0KDQo+ICtTUkNfVVJJW21kNXN1bV0gPSAiY2I0MDczMTgyZmVmNGNlZTZhYjlj
NjY2NmI0OGQxYTEiDQoNCkRyb3Agc2V0dGluZyBtZDVzdW0sIGl0cyBub3QgbmVlZGVkIGFu
eW1vcmUuDQoNCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhZGY2NGE0ZjNmNWM5NDY0M2Ex
Mjg2ZjgxNTNiY2Y0YmM3ODdjMzQ4YjM4OTM0YWFjZDdmZTE3ZmJlZWJjNTcxIg0KPiArDQo+
ICtTID0gIiR7V09SS0RJUn0vbGlidXNiMS0xLjcuMSINCj4gKw0KDQpVc2UgUFYgaW5zdGVh
ZCBvZiBoYXJkaW5nIDEuNy4xDQoNCj4gK1JERVBFTkRTXyR7UE59ID0gImxpYnVzYjEiDQoN
Ck92ZXJyaWRlIHNlcGFyYXRvciBpcyAnOicgYW5kIG5vdCAnXycgYW55bW9yZSwgdGhpcyBt
YWtlcyBtZSB3b25kZXIgaWYgDQp0aGlzIHBhdGNoIHdhcyB0ZXN0ZWQgYWdhaW5zdCBtYXN0
ZXIgb3Igbm90Lg0KDQo+ICsNCj4gK2luaGVyaXQgc2V0dXB0b29sczMNCj4gDQo+IA0KPiAN
Cj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBt
ZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA0
NDEzKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL21lc3NhZ2UvMTA0NDEzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL210LzEwMDc3NDY4Ni8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IA0K
--------------RMmDsrt2K1NYHZ0sxRUH7ZK0
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------RMmDsrt2K1NYHZ0sxRUH7ZK0--

--------------9V5QiXPcPNcvOyyFE9jcicu9--

--------------lT9XNtXv08kxXQbswhX0Lh0H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZNz87QUDAAAAAAAKCRC7BTNVkZ0zFPdI
AJ9Y4RBMqcqs0Xyz3VW7lk2JCoNTlACfVdjkcwxA65Odr1g0QDvf+NYyZ4E=
=Ga2W
-----END PGP SIGNATURE-----

--------------lT9XNtXv08kxXQbswhX0Lh0H--

