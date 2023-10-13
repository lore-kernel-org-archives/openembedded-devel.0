Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C549CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:33:42 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.44973.1697218418456500664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f5JOJ6h9;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c7373cff01so26881405ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697218418; x=1697823218; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S2BzEoEce4mGaiPuJRrc7vWyEn5wDZiUv+ZUiOOx6hg=;
        b=f5JOJ6h9b0DarOToLQntRe57O23Rc3LDESO5Key0qaz1MaWjKdlfFtiM7DgInAz55Z
         ZltTecMPJ/ek9fAGsaM7EOscPxuAbKrFNgsqWPZr9LGmf0H20oQ+V+9DZ8P6vCzfZk5T
         oHFIlpl24lnSDjo4eoBqQmJCZ676f3zpqTmghSYmVp5VXIZDqEUf0HxCVUIvuEuxKV40
         5hrKxFGdqxgBwp2GSF0m6dNs9liS4YZ8pF7jOF2FlRv3qZbUYj9bc9mN7OzbFq84g4uc
         H93FiI8eXQuTaizLhTn/ufzjH0JmVaICxuegQWrg6/SfGCsvS+UTxPBo7RUgYIznCq1l
         WjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697218418; x=1697823218;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2BzEoEce4mGaiPuJRrc7vWyEn5wDZiUv+ZUiOOx6hg=;
        b=uF23i3THn7b5gtT1NnegcIJHXXNwXBizhloBdXO7KPyOwkzB/1j1q43PWI6YqFquvR
         oCG8rsMGSR3s+aA++RMewMbUOFQRQdnlCG6xss7yj5EtNLNecQWZ9pm/lGphL1taXgpD
         Bn9QmjmclOruWKbSk7pMNW1+e4HF75SPFhJhQvEYNMKV9DLk1LSAo+4SGiJPWKLd4UpB
         anzp7Dx1pdo4jd9+OQuoUp0ECFOhztzy03f7TmmSSKLVDKTSEAqpzbpRB4TlnvVGnrix
         h7JRlLXOxT/EEwqsetJ8dR9aILo72ylAH8nN9TrKZpo7oXWDUs+Gdp81FjOGDz5yBW5Q
         Z4Rw==
X-Gm-Message-State: AOJu0Yw848K9duejpY/m9/pBJkvKxzBsdyaYCOMzNWPaIvR37/1wFLDu
	Hi0XqyFSNTLxCWYQMhK9Kgk=
X-Google-Smtp-Source: AGHT+IGnTYcbEpjcukUr83SaJh4JzkjDz5wP90Yz5OFQ3zUcBGAeJ7bjb7hzfTlIUeq+zK4Nb4ACgg==
X-Received: by 2002:a17:903:2301:b0:1ca:119f:2686 with SMTP id d1-20020a170903230100b001ca119f2686mr1119348plh.16.1697218417534;
        Fri, 13 Oct 2023 10:33:37 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b088:157:7478:e363? ([2601:646:9100:2cb0:b088:157:7478:e363])
        by smtp.gmail.com with ESMTPSA id l2-20020a170902ec0200b001b7fd27144dsm4165928pld.40.2023.10.13.10.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 10:33:37 -0700 (PDT)
Message-ID: <9a8c5041-6e21-4bb9-91cc-a6bd3b931d47@gmail.com>
Date: Fri, 13 Oct 2023 10:33:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-pytest-mock: disable broken
 ptests
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20231013170801.3966008-1-tgamblin@baylibre.com>
 <20231013170801.3966008-4-tgamblin@baylibre.com>
 <CAMKF1sosN6zU2raudiYFbDwCAixjdqApWPWR2yYDBpdY-2egMw@mail.gmail.com>
 <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yyeRAQQFCwlE4fyo16FRTvma"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105489

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yyeRAQQFCwlE4fyo16FRTvma
Content-Type: multipart/mixed; boundary="------------Jdn3EIwKDujKUzaec546SDxP";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <9a8c5041-6e21-4bb9-91cc-a6bd3b931d47@gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-pytest-mock: disable broken
 ptests
References: <20231013170801.3966008-1-tgamblin@baylibre.com>
 <20231013170801.3966008-4-tgamblin@baylibre.com>
 <CAMKF1sosN6zU2raudiYFbDwCAixjdqApWPWR2yYDBpdY-2egMw@mail.gmail.com>
 <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com>
In-Reply-To: <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com>

--------------Jdn3EIwKDujKUzaec546SDxP
Content-Type: multipart/mixed; boundary="------------UKsNTgLbSxFLPLbStgM8ZWzK"

--------------UKsNTgLbSxFLPLbStgM8ZWzK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTMvMjMgMTA6MzAgQU0sIFRyZXZvciBHYW1ibGluIHdyb3RlOg0KPiANCj4gT24g
MjAyMy0xMC0xMyAxMzoxNSwgS2hlbSBSYWogd3JvdGU6DQo+PiBPbiBGcmksIE9jdCAxMywg
MjAyMyBhdCAxMDowOOKAr0FNIFRyZXZvciBHYW1ibGluIA0KPj4gPHRnYW1ibGluQGJheWxp
YnJlLmNvbT4gd3JvdGU6DQo+Pj4gVHdvIGludHJvc3BlY3Rpb24tcmVsYXRlZCBwdGVzdHMg
YXJlIGNvbnNpc3RlbnRseSBmYWlsaW5nLiBGb3Igbm93LA0KPj4+IGRpc2FibGUgdGhlbSBz
byB0aGF0IGEgY2xlYW4gcHRlc3QgcnVuIGlzIGF2YWlsYWJsZS4NCj4+Pg0KPj4gRm9yIHJl
Z3VsYXIgcnVucyBjYW4gd2XCoCBtb3ZlIGl0IG91dCBvZiBQVEVTVFNfUFJPQkxFTVNfTUVU
QV9QWVRIT04gaW50bw0KPj4gZWl0aGVyIFBURVNUU19GQVNUX01FVEFfUFlUSE9OIG9yIFBU
RVNUU19TTE9XX01FVEFfUFlUSE9ODQo+IERvbmUsIHNlbnQgYSBwYXRjaCB0byBtb3ZlIGJv
dGggcmVjaXBlcy4NCg0KVGhhbmtzLCBpdCB3aWxsIHN0YXJ0IHJ1bm5pbmcgaW4gbXkgcmVn
dWxhciBDSSBqb2JzIG5vdy4NCg0KPj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2Ft
YmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPg0KPj4+IC0tLQ0KPj4+IMKgIC4uLnRfbW9j
ay1za2lwLWFyZ3MtaW50cm9zcGVjdGlvbi10ZXN0cy5wYXRjaCB8IDM4ICsrKysrKysrKysr
KysrKysrKysNCj4+PiDCoCAuLi4vcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LW1vY2tfMy4xMS4x
LmJiwqDCoMKgwqDCoCB8wqAgMSArDQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspDQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPj4+IG1ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LW1vY2svMDAwMS10ZXN0
X3B5dGVzdF9tb2NrLXNraXAtYXJncy1pbnRyb3NwZWN0aW9uLXRlc3RzLnBhdGNoDQo+Pj4N
Cj4+PiBkaWZmIC0tZ2l0IA0KPj4+IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weXRlc3QtbW9jay8wMDAxLXRlc3RfcHl0ZXN0X21vY2stc2tpcC1h
cmdzLWludHJvc3BlY3Rpb24tdGVzdHMucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdC1tb2NrLzAwMDEtdGVzdF9weXRlc3RfbW9j
ay1za2lwLWFyZ3MtaW50cm9zcGVjdGlvbi10ZXN0cy5wYXRjaA0KPj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uZjAyNGU3OWQ5Mw0KPj4+IC0tLSAv
ZGV2L251bGwNCj4+PiArKysgDQo+Pj4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5dGVzdC1tb2NrLzAwMDEtdGVzdF9weXRlc3RfbW9jay1za2lw
LWFyZ3MtaW50cm9zcGVjdGlvbi10ZXN0cy5wYXRjaA0KPj4+IEBAIC0wLDAgKzEsMzggQEAN
Cj4+PiArRnJvbSBlMTg0ZmI5NTBhZDNiNTJjNWMxNjQzOGQzOWZlNGQ1MTZjNzg0ZTMwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPj4+ICtGcm9tOiBUcmV2b3IgR2FtYmxpbiA8dGdh
bWJsaW5AYmF5bGlicmUuY29tPg0KPj4+ICtEYXRlOiBUaHUsIDEyIE9jdCAyMDIzIDE3OjMy
OjQwIC0wNDAwDQo+Pj4gK1N1YmplY3Q6IFtQQVRDSF0gdGVzdF9weXRlc3RfbW9jazogc2tp
cCBhcmdzIGludHJvc3BlY3Rpb24gdGVzdHMNCj4+PiArDQo+Pj4gK0Rpc2FibGUgdGhlc2Ug
dHdvIHRlc3RzIGZvciBub3cgc28gdGhhdCBweXRob24zLXB5dGVzdC1tb2NrIGNhbiBoYXZl
DQo+Pj4gK3N1Y2Nlc3NmdWwgcHRlc3QgcnVucy4NCj4+PiArDQo+Pj4gK1Vwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbT0UtU3BlY2lmaWNdDQo+Pj4gKw0KPj4+ICtTaWduZWQt
b2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPg0KPj4+ICst
LS0NCj4+PiArIHRlc3RzL3Rlc3RfcHl0ZXN0X21vY2sucHkgfCAyICsrDQo+Pj4gKyAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pj4gKw0KPj4+ICtkaWZmIC0tZ2l0IGEv
dGVzdHMvdGVzdF9weXRlc3RfbW9jay5weSBiL3Rlc3RzL3Rlc3RfcHl0ZXN0X21vY2sucHkN
Cj4+PiAraW5kZXggM2Q1MzI0MS4uMTU3YjZjMyAxMDA2NDQNCj4+PiArLS0tIGEvdGVzdHMv
dGVzdF9weXRlc3RfbW9jay5weQ0KPj4+ICsrKysgYi90ZXN0cy90ZXN0X3B5dGVzdF9tb2Nr
LnB5DQo+Pj4gK0BAIC01ODEsNiArNTgxLDcgQEAgZGVmIHRlc3RfYXNzZXJ0X2NhbGxlZF93
cmFwcGVyKG1vY2tlcjogDQo+Pj4gTW9ja2VyRml4dHVyZSkgLT4gTm9uZToNCj4+PiArwqDC
oMKgwqAgc3R1Yi5hc3NlcnRfY2FsbGVkKCkNCj4+PiArDQo+Pj4gKw0KPj4+ICsrQHB5dGVz
dC5tYXJrLnNraXAoIkFzeW5jIG5vdCBjb3JyZWN0bHkgZGV0ZWN0ZWQsIHNraXAgZm9yIG5v
dyIpDQo+Pj4gKyBAcHl0ZXN0Lm1hcmsudXNlZml4dHVyZXMoIm5lZWRzX2Fzc2VydF9yZXdy
aXRlIikNCj4+PiArIGRlZiB0ZXN0X2Fzc2VydF9jYWxsZWRfYXJnc193aXRoX2ludHJvc3Bl
Y3Rpb24obW9ja2VyOiANCj4+PiBNb2NrZXJGaXh0dXJlKSAtPiBOb25lOg0KPj4+ICvCoMKg
wqDCoCBzdHViID0gbW9ja2VyLnN0dWIoKQ0KPj4+ICtAQCAtNTk3LDYgKzU5OCw3IEBAIGRl
ZiANCj4+PiB0ZXN0X2Fzc2VydF9jYWxsZWRfYXJnc193aXRoX2ludHJvc3BlY3Rpb24obW9j
a2VyOiBNb2NrZXJGaXh0dXJlKSAtPiANCj4+PiBOb25lOg0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgIHN0dWIuYXNzZXJ0X2NhbGxlZF9vbmNlX3dpdGgoKndyb25nX2FyZ3MpDQo+Pj4gKw0K
Pj4+ICsNCj4+PiArK0BweXRlc3QubWFyay5za2lwKCJBc3luYyBub3QgY29ycmVjdGx5IGRl
dGVjdGVkLCBza2lwIGZvciBub3ciKQ0KPj4+ICsgQHB5dGVzdC5tYXJrLnVzZWZpeHR1cmVz
KCJuZWVkc19hc3NlcnRfcmV3cml0ZSIpDQo+Pj4gKyBkZWYgdGVzdF9hc3NlcnRfY2FsbGVk
X2t3YXJnc193aXRoX2ludHJvc3BlY3Rpb24obW9ja2VyOiANCj4+PiBNb2NrZXJGaXh0dXJl
KSAtPiBOb25lOg0KPj4+ICvCoMKgwqDCoCBzdHViID0gbW9ja2VyLnN0dWIoKQ0KPj4+ICst
LQ0KPj4+ICsyLjQxLjANCj4+PiArDQo+Pj4gZGlmZiAtLWdpdCANCj4+PiBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LW1vY2tfMy4xMS4x
LmJiIA0KPj4+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXRlc3QtbW9ja18zLjExLjEuYmINCj4+PiBpbmRleCA2OWQ3NDU2N2MzLi43ZmQ5OThl
ZGM2IDEwMDY0NA0KPj4+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHl0ZXN0LW1vY2tfMy4xMS4xLmJiDQo+Pj4gKysrIGIvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3QtbW9ja18zLjExLjEu
YmINCj4+PiBAQCAtOCw2ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICIgXA0KPj4+IMKg
IFNSQ19VUkkgPSAiIFwNCj4+PiAgICAgICANCj4+PiBnaXQ6Ly9naXRodWIuY29tL3B5dGVz
dC1kZXYvcHl0ZXN0LW1vY2s7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXA0KPj4+IMKg
wqDCoMKgwqAgZmlsZTovL3J1bi1wdGVzdCBcDQo+Pj4gK8KgwqDCoCBmaWxlOi8vMDAwMS10
ZXN0X3B5dGVzdF9tb2NrLXNraXAtYXJncy1pbnRyb3NwZWN0aW9uLXRlc3RzLnBhdGNoIFwN
Cj4+PiDCoCAiDQo+Pj4NCj4+PiDCoCBTUkNSRVYgPz0gImQzZTczZjJlOTNmN2I5M2ViYTBh
MzZlMTdlNDNiYWZkOTY5ZGE0ZmUiDQo+Pj4gLS0gDQo+Pj4gMi40MS4wDQo+Pj4NCj4+Pg0K
Pj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+Pj4gVmlldy9SZXBseSBPbmxpbmUg
KCMxMDU0ODMpOiANCj4+PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMDU0ODMNCj4+PiBNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDE5NDQ3NTgvMTk5NzkxNA0KPj4+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPj4+IFVuc3Vic2NyaWJlOiANCj4+PiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgDQo+Pj4gW3Jhai5raGVtQGdt
YWlsLmNvbV0NCj4+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4+DQo=
--------------UKsNTgLbSxFLPLbStgM8ZWzK
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------UKsNTgLbSxFLPLbStgM8ZWzK--

--------------Jdn3EIwKDujKUzaec546SDxP--

--------------yyeRAQQFCwlE4fyo16FRTvma
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZSl/bwUDAAAAAAAKCRC7BTNVkZ0zFDjo
AJ9heEAyAh6xawVmYkXa/WZoZWeY5gCfUdJp4mLtq3FNOSD2Oj0lRN/UJ4E=
=CXj8
-----END PGP SIGNATURE-----

--------------yyeRAQQFCwlE4fyo16FRTvma--

