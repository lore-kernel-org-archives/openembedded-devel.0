Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3853EEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:34:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.1369.1692808454656407801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EVMyNQV2;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bc83a96067so35918945ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692808454; x=1693413254;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcCTC80sJHWLKKQYG3k9lWV1zUIb7AzD2BI+8YuqKag=;
        b=EVMyNQV2QIHCesvkHDwS9jsO/PMlfvZqwgceMFJm6+w5M4/rxqHh00PgenFKWZuYzb
         LVpOoqghQnyxfsQ70wbrxCFcAFJxLJhqYEOokbIqLwgcEoBmJEpAooGRdAfa/JVDVHAK
         PdUtp5+GbqHfDciPdO8uJs5v4RQQjc3zXKLvUXkSLdc2/hGefS2xpwyo1eMMaQCWsdjD
         R2N7HMv8VeBGbKFO8wPkM8TSRRcy7OpmPC3LOYFL9+A+VwqWfzNgOxERvoji9vEynB2b
         itvqGnFRlQsWHVOYvFegvTEI5kX9Xm9+eAY/fCR6TKnzgUrqfz4tiPYpbJDWb2AOY3Is
         LaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692808454; x=1693413254;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZcCTC80sJHWLKKQYG3k9lWV1zUIb7AzD2BI+8YuqKag=;
        b=YobTlWLDxEg+lohMdJVHm4j8JptBLzfQUbC7KM1TMwwv+zsAuidCWJ77tRe9wP4JsN
         3H1Mt5w18PZW/6mVXl18UuOamhCrzkw+PHvtP5ndOmIF06w07IgKy6Kntoqp8a+8gmKx
         34hDbcSKcrjdoDoR+Ao5AerpEsbPdWhl69fxacfh94U0glG//6ydDJx9lXFEKkmvvhP7
         6NuE8bCi+J5Grfed7qmWaERHbMS59J6zs5EsodCIfbj/S6eKLW7pf8W34RRUbGe3wYQG
         W1GauVeH9MUnF8bhTCOorQgPDMICBZZMFqPkqLRosTCMqf4nTCgMASnKfq8txSBghVqk
         3zBA==
X-Gm-Message-State: AOJu0YxY1CYl7DKZWdaC+NRZlaP05Vf/GnHbde8Lwb+M145SucjAiKpk
	KC+fls+3bRWHGc8iOZtMSfo=
X-Google-Smtp-Source: AGHT+IEntgN1nQ02UyckGhaTXZxX7aZTHvgJgqdgiH6rco8tLzCI022sI93OchSukSkvOVfLSUYuOQ==
X-Received: by 2002:a17:902:bb8f:b0:1bd:bba1:be7e with SMTP id m15-20020a170902bb8f00b001bdbba1be7emr8952967pls.52.1692808453757;
        Wed, 23 Aug 2023 09:34:13 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:866:771f:7919:23c5? ([2601:646:9100:2cb0:866:771f:7919:23c5])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902e80100b001b51b3e84cesm11120149plg.166.2023.08.23.09.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 09:34:13 -0700 (PDT)
Message-ID: <c50910ea-a234-4db3-ac1c-8ed6aa009b6a@gmail.com>
Date: Wed, 23 Aug 2023 09:34:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 5/5] libosinfo: add recipe
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20230823121957.5626-1-f_l_k@t-online.de>
 <20230823121957.5626-5-f_l_k@t-online.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230823121957.5626-5-f_l_k@t-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z9oYSn7dWv8g2D1GdiGR6eKe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 16:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104553

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z9oYSn7dWv8g2D1GdiGR6eKe
Content-Type: multipart/mixed; boundary="------------jQpdUrfqakDoMiDGFeq5JuLe";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-ID: <c50910ea-a234-4db3-ac1c-8ed6aa009b6a@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 5/5] libosinfo: add recipe
References: <20230823121957.5626-1-f_l_k@t-online.de>
 <20230823121957.5626-5-f_l_k@t-online.de>
In-Reply-To: <20230823121957.5626-5-f_l_k@t-online.de>

--------------jQpdUrfqakDoMiDGFeq5JuLe
Content-Type: multipart/mixed; boundary="------------lq1fX1jTccAS7V80So0ZfFuu"

--------------lq1fX1jTccAS7V80So0ZfFuu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yMy8yMyA1OjE5IEFNLCBNYXJrdXMgVm9sayB3cm90ZToNCj4gbGlib3NpbmZvDQo+
ID09PT09PT09PQ0KPiANCj4gbGlib3NpbmZvIGlzIGEgR09iamVjdCBiYXNlZCBsaWJyYXJ5
IEFQSSBmb3IgbWFuYWdpbmcgaW5mb3JtYXRpb24gYWJvdXQNCj4gb3BlcmF0aW5nIHN5c3Rl
bXMsIGh5cGVydmlzb3JzIGFuZCB0aGUgKHZpcnR1YWwpIGhhcmR3YXJlIGRldmljZXMgdGhl
eSBjYW4NCj4gc3VwcG9ydC4gSXQgaW5jbHVkZXMgYSBkYXRhYmFzZSBjb250YWluaW5nIGRl
dmljZSBtZXRhZGF0YSBhbmQgcHJvdmlkZXMgQVBJcw0KPiB0byBtYXRjaC9pZGVudGlmeSBv
cHRpbWFsIGRldmljZXMgZm9yIGRlcGxveWluZyBhbiBvcGVyYXRpbmcgc3lzdGVtIG9uIGEN
Cj4gaHlwZXJ2aXNvci4gVmlhIHRoZSBtYWdpYyBvZiBHT2JqZWN0IEludHJvc3BlY3Rpb24s
IHRoZSBBUEkgaXMgYXZhaWxhYmxlIGluIGFsbA0KPiBjb21tb24gcHJvZ3JhbW1pbmcgbGFu
Z3VhZ2VzIHdpdGggZGVtb3MgZm9yIGphdmFzY3JpcHQgKEdKUy9TZWVkKSBhbmQgcHl0aG9u
DQo+IChQeUdPYmplY3QpLiBWYWxhIGJpbmRpbmdzIGFyZSBhbHNvIHByb3ZpZGVkLg0KPiAN
Cj4gbGlib3NpbmZvIGlzIGEgcmVxdWlyZWQgZGVwZW5kZW5jeSBmb3IgZ25vbWUtYm94ZXMN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4N
Cj4gLS0tDQo+ICAgLi4ubWVzb24uYnVpbGQtYWxsb3ctY3Jvc3Njb21waWxpbmctZ2lyLnBh
dGNoIHwgMjYgKysrKysrKysrKysrKysrDQo+ICAgLi4uL2xpYm9zaW5mby9saWJvc2luZm9f
MS4xMC5iYiAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKw0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJvc2luZm8vbGlib3NpbmZvLzAwMDEtbWVz
b24uYnVpbGQtYWxsb3ctY3Jvc3Njb21waWxpbmctZ2lyLnBhdGNoDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYm9zaW5mby9saWJvc2luZm9f
MS4xMC5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xp
Ym9zaW5mby9saWJvc2luZm8vMDAwMS1tZXNvbi5idWlsZC1hbGxvdy1jcm9zc2NvbXBpbGlu
Zy1naXIucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJvc2luZm8vbGlib3Np
bmZvLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ctY3Jvc3Njb21waWxpbmctZ2lyLnBhdGNoDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmUyOTFlY2RlOGYN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJv
c2luZm8vbGlib3NpbmZvLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ctY3Jvc3Njb21waWxpbmct
Z2lyLnBhdGNoDQo+IEBAIC0wLDAgKzEsMjYgQEANCj4gK0Zyb20gMTIzYjVhNGM1ZTA5ZjQy
NjJkNDU0NWEwYmM1ZWRiMDFhMTliNmI3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4g
K0Zyb206IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4NCj4gK0RhdGU6IE1vbiwg
MjEgQXVnIDIwMjMgMTA6MDY6NTUgKzAyMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gbWVzb24u
YnVpbGQ6IGFsbG93IGNyb3NzY29tcGlsaW5nIGdpcg0KDQpDYW4geW91IGFkZCBzb21ldGhp
bmcgb24gVXBzdHJlYW0tU3RhdHVzID8NCg0KPiArDQo+ICtTaWduZWQtb2ZmLWJ5OiBNYXJr
dXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+DQo+ICstLS0NCj4gKyBtZXNvbi5idWlsZCB8
IDIgKy0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQNCj4g
K2luZGV4IDM5YjczOWUuLjQ2ZjIyNTIgMTAwNjQ0DQo+ICstLS0gYS9tZXNvbi5idWlsZA0K
PiArKysrIGIvbWVzb24uYnVpbGQNCj4gK0BAIC0yOSw3ICsyOSw3IEBAIGxpYm9zaW5mb19w
a2djb25mZGlyID0gam9pbl9wYXRocyhsaWJvc2luZm9fbGliZGlyLCAncGtnY29uZmlnJykN
Cj4gKw0KPiArICMgZ29iamVjdCBpbnRyb3NwZWN0aW9uDQo+ICsgZ2lyID0gZmluZF9wcm9n
cmFtKCdnLWlyLXNjYW5uZXInLCByZXF1aXJlZDogZ2V0X29wdGlvbignZW5hYmxlLWludHJv
c3BlY3Rpb24nKSkNCj4gKy1lbmFibGVfaW50cm9zcGVjdGlvbiA9IGdpci5mb3VuZCgpIGFu
ZCBub3QgbWVzb24uaXNfY3Jvc3NfYnVpbGQoKQ0KPiArK2VuYWJsZV9pbnRyb3NwZWN0aW9u
ID0gZ2lyLmZvdW5kKCkNCj4gKw0KPiArICMgdmFsYQ0KPiArIHZhcGlfb3B0ID0gZ2V0X29w
dGlvbignZW5hYmxlLXZhbGEnKQ0KPiArLS0NCj4gKzIuNDEuMA0KPiArDQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJvc2luZm8vbGlib3NpbmZvXzEuMTAu
YmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJvc2luZm8vbGlib3NpbmZvXzEuMTAu
YmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uODc1ZDYx
MmM5OA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2xpYm9zaW5mby9saWJvc2luZm9fMS4xMC5iYg0KPiBAQCAtMCwwICsxLDMyIEBADQo+ICtT
VU1NQVJZID0gIkFQSSBmb3IgbWFuYWdpbmcgaW5mb3JtYXRpb24gYWJvdXQgb3BlcmF0aW5n
IHN5c3RlbXMsIGh5cGVydmlzb3JzIGFuZCB0aGUgKHZpcnR1YWwpIGhhcmR3YXJlIGRldmlj
ZXMuIg0KPiArSE9NRVBBR0UgPSAiaHR0cHM6Ly9saWJvc2luZm8ub3JnIg0KPiArDQo+ICtM
SUNFTlNFID0gIkxHUEwtMi4xLW9ubHkgJiBHUEwtMi4wLW9ubHkiDQo+ICtMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yYjBlOTkyNjUzMGMyNjlmNWFlOTU1NjAz
NzAxOTVhZiINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuTElCO21k
NT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyINCj4gKw0KPiArU1JDX1VSSSA9
ICIgXA0KPiArCWdpdDovL2dpdGxhYi5jb20vbGlib3NpbmZvL2xpYm9zaW5mby5naXQ7YnJh
bmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXA0KPiArCWZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxk
LWFsbG93LWNyb3NzY29tcGlsaW5nLWdpci5wYXRjaCBcDQo+ICsiDQo+ICtTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZGU0MTlkMjllMjViNDViMzZmZDgxMzIzNmNmYzQxZjM0OWJlY2UxYTMx
N2I4ZDBlN2Y2M2Y2ZGQ3ODY0MTdiZiINCg0KdGhpcyBpcyByZWR1bmRhbnQgd2l0aCBnaXQg
ZmV0Y2ggdXJpLg0KDQo+ICsNCj4gK1NSQ1JFViA9ICJmNTAzZmY3YTllMTM5NjNiY2YzOTY3
NzZiY2UwYjIwOWE4MTliYTliIg0KPiArDQo+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiAr
DQo+ICtpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBndGstZG9jIGdvYmplY3QtaW50cm9zcGVj
dGlvbiB2YWxhDQo+ICsNCj4gK0RFUEVORFMgPSAiZ2xpYi0yLjAgbGlic291cCBsaWJ4c2x0
Ig0KPiArUkRFUEVORFM6JHtQTn0gPSAicGNpdXRpbHMtaWRzIHVzYmlkcyINCg0KVXN1YWxs
eSBSKiBhc3NpbmdtZW50cyBnbyB0byBlbmQgb2YgcmVjaXBlIGFzIGEgY29kaW5nIGd1aWRl
bGluZQ0KaHR0cHM6Ly93d3cub3BlbmVtYmVkZGVkLm9yZy93aWtpL1N0eWxlZ3VpZGUNCg0K
PiArDQo+ICtHSVJfTUVTT05fT1BUSU9OID0gImVuYWJsZS1pbnRyb3NwZWN0aW9uIg0KPiAr
R0lSX01FU09OX0VOQUJMRV9GTEFHID0gJ2VuYWJsZWQnDQo+ICtHSVJfTUVTT05fRElTQUJM
RV9GTEFHID0gJ2Rpc2FibGVkJw0KPiArR1RLRE9DX01FU09OX09QVElPTiA9ICJlbmFibGUt
Z3RrLWRvYyINCj4gKw0KPiArRVhUUkFfT0VNRVNPTiA9ICIgXA0KPiArCS1Ed2l0aC1wY2kt
aWRzLXBhdGg9JHtkYXRhZGlyfS9wY2kuaWRzIFwNCj4gKwktRHdpdGgtdXNiLWlkcy1wYXRo
PSR7ZGF0YWRpcn0vdXNiLmlkcyBcDQo+ICsJLURlbmFibGUtdmFsYT1lbmFibGVkIFwNCj4g
KyINCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlv
dSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVw
bHkgT25saW5lICgjMTA0NTQ1KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA0NTQ1DQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDkxMzMyMi8xOTk3OTE0DQo+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09
LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------lq1fX1jTccAS7V80So0ZfFuu
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------lq1fX1jTccAS7V80So0ZfFuu--

--------------jQpdUrfqakDoMiDGFeq5JuLe--

--------------z9oYSn7dWv8g2D1GdiGR6eKe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZOY1AwUDAAAAAAAKCRC7BTNVkZ0zFL9/
AKCU/KkPQWCaitPgU+Dqtc9kFnNsqACfTycZ0BBIgZllNEUcVuJpoVXNa7M=
=+L98
-----END PGP SIGNATURE-----

--------------z9oYSn7dWv8g2D1GdiGR6eKe--

