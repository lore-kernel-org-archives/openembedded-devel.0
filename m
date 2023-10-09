Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B880CD610B
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:41:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.68229.1696869708901382925
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mD6Z8qSH;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c60cec8041so27893405ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Oct 2023 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696869708; x=1697474508; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gmBaV29TOu6e5LVj4Fc+gJRegH4cf+KVjYoCRllMJjg=;
        b=mD6Z8qSHX8jP5kr+fsz4iAaYrx/gj94Y5N9KK5Tr5bIDf6TpIrcbJ4JQiKdJid625j
         gjZWEEd64rnsYsffdn4Ld5rlfLNyfXjXaMsuA7WNw/C+t8a+pfL1fjlJzBHY/erzP4k6
         iLTcCMdUKTiKbgV040GAYl3v4OjYS5pLszUbXaNwCBvluQC8QTZDfdU+Rbg3ZeFRnxnv
         Qe9tvUhAYawE+bGGfMH25AoH0aSfAKLu7upfJL+bg7+mzf26YoYzTqR3bRNy9ZLkS5cc
         vvynxtfhLeZpWPI3vIdU2X2IB7FXN0s+BekwJNGshsjgy6yFmUq42pL60rIwA005/m/i
         LrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696869708; x=1697474508;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmBaV29TOu6e5LVj4Fc+gJRegH4cf+KVjYoCRllMJjg=;
        b=uFg3xo4L+nG5tdw9ga+qKUMmZ2ENhr18royC+5Oz78EWHT/zptDP73/4pd8T/3fkTe
         KXz/sAE/ptOPIm7tCHEqsaZNGDaq7C6SqC6kRdbr8YnXIeuR6hPOQrM9KZz8up9rC1bu
         w1d2NDkXBGnfRl4EXcYwPI6Dt/ItJcNpGAWgN4P4ibotfUDyV2J85VbYBRxwKMH3uwbd
         6/10UID8EVz2pZ0tq0EQe08IkG7V1iiTfcGJY9+tfllR9JaaTd6HFzAspj8GFIXXq0LA
         pyR7c1AVHjGFnK5fp4j94asjuw7pPjJaK7//9D1cRFJKRSY3jmkoDuvUoJDPMVEdZS98
         aO+w==
X-Gm-Message-State: AOJu0YyDe8lChn4X1PxGNbS+DqGs5dgi4L7pyXx4W13dRWNvW7FuyJVq
	RPHKH1JUABo1iHNoWPu1L+Q=
X-Google-Smtp-Source: AGHT+IFOhYZRBnYyrqOtMT8+61IqXMZX3OOHecpf4AZbMJ6zYFwB0ANiZqfgH0GlyLlhnGrSD58TNw==
X-Received: by 2002:a17:903:1d0:b0:1bc:844:5831 with SMTP id e16-20020a17090301d000b001bc08445831mr16139826plh.57.1696869708156;
        Mon, 09 Oct 2023 09:41:48 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:a9f6:8efc:88d7:f84b? ([2601:646:9100:2cb0:a9f6:8efc:88d7:f84b])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902ed4d00b001c898328289sm6128563plb.158.2023.10.09.09.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 09:41:47 -0700 (PDT)
Message-ID: <3a4dea33-b94e-4646-8ffe-a7e12f41898f@gmail.com>
Date: Mon, 9 Oct 2023 09:41:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] libnvme: upgrade 1.5 -> 1.6
To: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
References: <20231008155205.267182-1-cvubrugier@fastmail.fm>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20231008155205.267182-1-cvubrugier@fastmail.fm>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p1CYew3FYVn7kr0xEDJlwNoJ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Oct 2023 16:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105391

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p1CYew3FYVn7kr0xEDJlwNoJ
Content-Type: multipart/mixed; boundary="------------a6HVsHyvcm0PQspoCpIulXVB";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Message-ID: <3a4dea33-b94e-4646-8ffe-a7e12f41898f@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] libnvme: upgrade 1.5 -> 1.6
References: <20231008155205.267182-1-cvubrugier@fastmail.fm>
In-Reply-To: <20231008155205.267182-1-cvubrugier@fastmail.fm>

--------------a6HVsHyvcm0PQspoCpIulXVB
Content-Type: multipart/mixed; boundary="------------Rd1diChu6F0HbAILtqbJ0Jkj"

--------------Rd1diChu6F0HbAILtqbJ0Jkj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOC8yMyA4OjUyIEFNLCBDaHJpc3RvcGhlIFZ1LUJydWdpZXIgd3JvdGU6DQo+IEZy
b206IENocmlzdG9waGUgVnUtQnJ1Z2llciA8Y2hyaXN0b3BoZS52dS1icnVnaWVyQHNlYWdh
dGUuY29tPg0KPiANCj4gQmFja3BvcnQgdXBzdHJlYW0gcGF0Y2ggdG8gZml4IGJ1aWxkIHdp
dGggbXVzbC4NCj4gDQoNClRoaXMgc2VlbXMgYW4gaW1wcm92ZW1lbnQgb3ZlciB3aGF0IEkg
YXBwbGllZCB0byBtYXN0ZXIgYWxyZWFkeS4gU28gDQpwbGVhc2UgcmViYXNlIHlvdXIgcGF0
Y2ggb24gdG9wIG9mIGxhdGVzdCBtYXN0ZXIgYW5kIHJlc2VuZCBwbGVhc2UuDQoNCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBWdS1CcnVnaWVyIDxjaHJpc3RvcGhlLnZ1LWJydWdp
ZXJAc2VhZ2F0ZS5jb20+DQo+IC0tLQ0KPiAgIC4uLjAxLXRlc3QtaGFuZGxlLVBPU0lYLWlv
Y3RsLXByb3RvdHlwZS5wYXRjaCB8IDY4ICsrKysrKysrKysrKysrKysrKysNCj4gICAuLi4v
e2xpYm52bWVfMS41LmJiID0+IGxpYm52bWVfMS42LmJifSAgICAgICAgfCAgMiArLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJudm1lL2xp
Ym52bWUvMDAwMS10ZXN0LWhhbmRsZS1QT1NJWC1pb2N0bC1wcm90b3R5cGUucGF0Y2gNCj4g
ICByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlibnZtZS97bGlibnZtZV8xLjUu
YmIgPT4gbGlibnZtZV8xLjYuYmJ9ICg5NCUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvbGlibnZtZS9saWJudm1lLzAwMDEtdGVzdC1oYW5kbGUtUE9T
SVgtaW9jdGwtcHJvdG90eXBlLnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGli
bnZtZS9saWJudm1lLzAwMDEtdGVzdC1oYW5kbGUtUE9TSVgtaW9jdGwtcHJvdG90eXBlLnBh
dGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uZWY5Y2M0
N2QyDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
bGlibnZtZS9saWJudm1lLzAwMDEtdGVzdC1oYW5kbGUtUE9TSVgtaW9jdGwtcHJvdG90eXBl
LnBhdGNoDQo+IEBAIC0wLDAgKzEsNjggQEANCj4gK0Zyb20gY2E0N2JhMzExOTM2NWVhZmFj
MGFiMjVhODZjYWI5ZDlhMWIyOWJkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zy
b206IFNhbSBKYW1lcyA8c2FtQGdlbnRvby5vcmc+DQo+ICtEYXRlOiBTYXQsIDMwIFNlcCAy
MDIzIDA2OjM4OjUzICswMTAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIHRlc3Q6IGhhbmRsZSBQ
T1NJWCBpb2N0bCBwcm90b3R5cGUNCj4gKw0KPiArZ2xpYmMgaGFzIHRoZSBmb2xsb3dpbmcg
cHJvdG90eXBlIGZvciBpb2N0bDogaW50IGlvY3RsKGludCBmZCwgdW5zaWduZWQgbG9uZyBy
ZXF1ZXN0LCAuLi4pDQo+ICtQT1NJWCAoaW5jLiBtdXNsKSBoYXMgdGhlIGZvbGxvd2luZyBm
b3IgaW9jdGw6IGludCBpb2N0bChpbnQgZmQsIGludCByZXF1ZXN0LCAuLi4pDQo+ICsNCj4g
K0NoZWNrIHdoaWNoIHByb3RvdHlwZSBpcyB1c2VkIGluIDxzeXMvaW9jdGwuaD4gdG8gYXZv
aWQgYSBjb25mbGljdCBhbmQgY29uZGl0aW9uYWxseQ0KPiArZGVmaW5lIHRoZSByaWdodCBv
bmUgZm9yIHRoZSBzeXN0ZW0uDQo+ICsNCj4gK0J1ZzogaHR0cHM6Ly9idWdzLmdlbnRvby5v
cmcvOTE0OTIxDQo+ICtTaWduZWQtb2ZmLWJ5OiBTYW0gSmFtZXMgPHNhbUBnZW50b28ub3Jn
Pg0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4LW52bWUvbGlibnZtZS9jb21taXQvY2E0N2JhMzExOTM2NWVhZmFjMGFiMjVhODZjYWI5
ZDlhMWIyOWJkNF0NCj4gKy0tLQ0KPiArIG1lc29uLmJ1aWxkICAgICAgIHwgMTAgKysrKysr
KysrKw0KPiArIHRlc3QvaW9jdGwvbW9jay5jIHwgIDYgKysrKystDQo+ICsgMiBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2RpZmYg
LS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkDQo+ICtpbmRleCA2ZmNmMWRhLi4y
Yzk3OWNjIDEwMDY0NA0KPiArLS0tIGEvbWVzb24uYnVpbGQNCj4gKysrKyBiL21lc29uLmJ1
aWxkDQo+ICtAQCAtMjMwLDYgKzIzMCwxNiBAQCBjb25mLnNldCgNCj4gKyAgICAgKSwNCj4g
KyAgICAgZGVzY3JpcHRpb246ICdJcyBuZXR3b3JrIGFkZHJlc3MgYW5kIHNlcnZpY2UgdHJh
bnNsYXRpb24gYXZhaWxhYmxlJw0KPiArICkNCj4gKytjb25mLnNldCgNCj4gKysgICAgJ0hB
VkVfR0xJQkNfSU9DVEwnLA0KPiArKyAgICBjYy5jb21waWxlcygNCj4gKysgICAgICAgICcn
JyNpbmNsdWRlIDxzeXMvaW9jdGwuaD4NCj4gKysgICAgICAgIGludCBpb2N0bChpbnQgZmQs
IHVuc2lnbmVkIGxvbmcgcmVxdWVzdCwgLi4uKTsNCj4gKysgICAgICAgICcnJywNCj4gKysg
ICAgICAgIG5hbWU6ICdpb2N0bCBoYXMgZ2xpYmMtc3R5bGUgcHJvdG90eXBlJw0KPiArKyAg
ICApLA0KPiArKyAgICBkZXNjcmlwdGlvbjogJ0lzIGlvY3RsIHRoZSBnbGliYyBpbnRlcmZh
Y2UgKHJhdGhlciB0aGFuIFBPU0lYKScNCj4gKyspDQo+ICsNCj4gKyBpZiBjYy5oYXNfZnVu
Y3Rpb25fYXR0cmlidXRlKCdmYWxsdGhyb3VnaCcpDQo+ICsgICBjb25mLnNldCgnZmFsbHRo
cm91Z2gnLCAnX19hdHRyaWJ1dGVfXygoX19mYWxsdGhyb3VnaF9fKSknKQ0KPiArZGlmZiAt
LWdpdCBhL3Rlc3QvaW9jdGwvbW9jay5jIGIvdGVzdC9pb2N0bC9tb2NrLmMNCj4gK2luZGV4
IGU5MTcyNDQuLjVkMmFjOTQgMTAwNjQ0DQo+ICstLS0gYS90ZXN0L2lvY3RsL21vY2suYw0K
PiArKysrIGIvdGVzdC9pb2N0bC9tb2NrLmMNCj4gK0BAIC0xMTQsNyArMTE0LDExIEBAIHZv
aWQgZW5kX21vY2tfY21kcyh2b2lkKQ0KPiArIAl9IFwNCj4gKyB9KQ0KPiArDQo+ICsrI2lm
ZGVmIEhBVkVfR0xJQkNfSU9DVEwNCj4gKyBpbnQgaW9jdGwoaW50IGZkLCB1bnNpZ25lZCBs
b25nIHJlcXVlc3QsIC4uLikNCj4gKysjZWxzZQ0KPiArK2ludCBpb2N0bChpbnQgZmQsIGlu
dCByZXF1ZXN0LCAuLi4pDQo+ICsrI2VuZGlmDQo+ICsgew0KPiArIAlzdHJ1Y3QgbW9ja19j
bWRzICptb2NrX2NtZHM7DQo+ICsgCWJvb2wgcmVzdWx0NjQ7DQo+ICtAQCAtMTQxLDcgKzE0
NSw3IEBAIGludCBpb2N0bChpbnQgZmQsIHVuc2lnbmVkIGxvbmcgcmVxdWVzdCwgLi4uKQ0K
PiArIAkJcmVzdWx0NjQgPSB0cnVlOw0KPiArIAkJYnJlYWs7DQo+ICsgCWRlZmF1bHQ6DQo+
ICstCQlmYWlsKCJ1bmV4cGVjdGVkICVzICVsdSIsIF9fZnVuY19fLCByZXF1ZXN0KTsNCj4g
KysJCWZhaWwoInVuZXhwZWN0ZWQgJXMgJWx1IiwgX19mdW5jX18sICh1bnNpZ25lZCBsb25n
KSByZXF1ZXN0KTsNCj4gKyAJfQ0KPiArIAljaGVjayhtb2NrX2NtZHMtPnJlbWFpbmluZ19j
bWRzLA0KPiArIAkgICAgICAidW5leHBlY3RlZCAlcyBjb21tYW5kIiwgbW9ja19jbWRzLT5u
YW1lKTsNCj4gKy0tDQo+ICsyLjQwLjENCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLXN1cHBvcnQvbGlibnZtZS9saWJudm1lXzEuNS5iYiBiL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L2xpYm52bWUvbGlibnZtZV8xLjYuYmINCj4gc2ltaWxhcml0eSBpbmRleCA5
NCUNCj4gcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlibnZtZS9saWJu
dm1lXzEuNS5iYg0KPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlibnZt
ZS9saWJudm1lXzEuNi5iYg0KPiBpbmRleCA0YjZmMWUzMGIuLjM3ZTVkNjMwMSAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlibnZtZS9saWJudm1lXzEuNS5i
Yg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJudm1lL2xpYm52bWVfMS42
LmJiDQo+IEBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwNCj4gICAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9jY2FuL2xpY2Vuc2VzL0NDMDttZDU9YzE3YWY0M2Iw
NTg0MDI1NWE2ZmVkYzVlZGE5ZDU2Y2MgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL2NjYW4vbGljZW5zZXMvQlNELU1JVDttZDU9ODM4YzM2NmY2OWI3MmM1ZGYwNWM5NmRm
Zjc5YjM1ZjIiDQo+ICAgREVQRU5EUyA9ICJqc29uLWMiDQo+IC1TUkNSRVYgPSAiNGZlYTgz
ZGI4MzI4ZWE3ODhlYThmMTAwMWU4Y2UxY2I4MGVmNWZhZSINCj4gK1NSQ1JFViA9ICIzN2E4
MDNjZjc3ZTIyNGY2NmQ4NmIxZTFkOWU3NGExNWY1NWVhNjAwIg0KPiAgIA0KPiAgIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saW51eC1udm1lL2xpYm52bWU7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3RlciINCj4gICANCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA1Mzg3KTogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA1Mzg3
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210
LzEwMTgzNTA5OS8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyYWou
a2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------Rd1diChu6F0HbAILtqbJ0Jkj
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------Rd1diChu6F0HbAILtqbJ0Jkj--

--------------a6HVsHyvcm0PQspoCpIulXVB--

--------------p1CYew3FYVn7kr0xEDJlwNoJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZSQtSgUDAAAAAAAKCRC7BTNVkZ0zFGlV
AKCBIXzrMmpy0C35STRwuQkB12++XACePrZD5LJUSMJdaaNyN/riYuOWG7M=
=10Zs
-----END PGP SIGNATURE-----

--------------p1CYew3FYVn7kr0xEDJlwNoJ--

