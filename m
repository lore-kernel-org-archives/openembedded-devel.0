Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9330E6FE54
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 15:18:18 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.197.1695395888558933313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 08:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NEZJVD5l;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-577a98f78b2so1587333a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695395888; x=1696000688; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpiITniKK2aFqch8UbXHFYqrJAJB/tgs0OK4BYVLjCI=;
        b=NEZJVD5l4qKUUjrtAZVQO9eC/UN2IQg21S6M9g8PmoBP1XT8EM7311exCnwBFgESI/
         +mET0JQq93N4UxKOxbM1qkkFdmOoOJULgyzYatwW2iJAyS8iVFrNUKRPL1FaJ5CqkIeW
         iORjdkk4toJ7HmH2/B2iNjwiSxwQtTeWDREXpMESz1DuIo8/s138UYp+wFrjLmqOPGdL
         Vi/PqQhmXThFHa7daygC0nda4CQ3VazqERlyE0kTqjY3hV3bLiCSlFOOqD6KoSgICWw1
         zHdstvanU42IYuTQczq/eE442i5TBT8x33snqzZ9gwPp1RtEXavf7fGgStQDdP2vdkn4
         oyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695395888; x=1696000688;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpiITniKK2aFqch8UbXHFYqrJAJB/tgs0OK4BYVLjCI=;
        b=p1esnFax15myjr1LfODPKVhkcNZonYNms+Cp+MK3BzYUdz023cP5bc0BHksIBbQhM3
         CnpeIrD6oA9xrszWadHuxFqF5/3vgCYTD+78C+4CwDWCbi4yykiYcZ6PCP5p03ZpWGwt
         aJE6IASDYjMypwridReHU7awfkH9K7lJYVEAxiVzZVERG4BHlZxe90mlU1WGk92kawsX
         8n0YFRqZMRrrFvdZiuYYoNpc3Wzx8TNzUP8HaU1JJ+fkoHAfCodIilN/VBZh2jiK6erQ
         XW70XYORAFWBkIJ2prREfSkjoCPJ48e8yffD5xRbGMKmqlugBrCJc3aVUnnGm7JgfaDx
         X6gg==
X-Gm-Message-State: AOJu0YzChd3nQja2g1Vy8v4ZIhzvBGcs9wX6EFne1cic/AAlCAGXbFMZ
	ntPFdVhZIxaokmEYCxMsOro=
X-Google-Smtp-Source: AGHT+IFlSJ1NemtJMpqbJnOuwACXCP4KpZyeFfEWuL4Q6NkXlVIXv1mH4oxXAqDuXef4YdPu5qzZKQ==
X-Received: by 2002:a05:6a21:2712:b0:153:6413:1089 with SMTP id rm18-20020a056a21271200b0015364131089mr7147828pzb.46.1695395887749;
        Fri, 22 Sep 2023 08:18:07 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:68a7:e86e:d0e8:e1f2? ([2601:646:9100:2cb0:68a7:e86e:d0e8:e1f2])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902d2cb00b001c06dcd453csm3589264plc.236.2023.09.22.08.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 08:18:07 -0700 (PDT)
Message-ID: <b02fb94e-0e2f-4cf3-b909-86db5db992f1@gmail.com>
Date: Fri, 22 Sep 2023 08:18:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] mongodb: Fix build on 32bit
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20230922141423.2672238-1-martin.jansa@gmail.com>
 <20230922141423.2672238-2-martin.jansa@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230922141423.2672238-2-martin.jansa@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NxtTvRtAQOTxLp1U5i9v06dG"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 15:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105072

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NxtTvRtAQOTxLp1U5i9v06dG
Content-Type: multipart/mixed; boundary="------------1A12NV03xw73vfobjQizUj1K";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <b02fb94e-0e2f-4cf3-b909-86db5db992f1@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] mongodb: Fix build on 32bit
References: <20230922141423.2672238-1-martin.jansa@gmail.com>
 <20230922141423.2672238-2-martin.jansa@gmail.com>
In-Reply-To: <20230922141423.2672238-2-martin.jansa@gmail.com>

--------------1A12NV03xw73vfobjQizUj1K
Content-Type: multipart/mixed; boundary="------------vkSNyFT7FbLGtMUHHggbDp6M"

--------------vkSNyFT7FbLGtMUHHggbDp6M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yMi8yMyA3OjE0IEFNLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+IFNpZ25lZC1vZmYt
Ynk6IE1hcnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAg
Li4uL21vbmdvZGIvMDAwMS1GaXgtYnVpbGQtb24tMzJiaXQucGF0Y2ggICAgIHwgMzggKysr
KysrKysrKysrKysrKysrKw0KPiAgIC4uLi9yZWNpcGVzLWRicy9tb25nb2RiL21vbmdvZGJf
Z2l0LmJiICAgICAgICB8ICAxICsNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlv
bnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9keW5hbWljLWxheWVycy9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRicy9tb25nb2RiL21vbmdvZGIvMDAwMS1GaXgtYnVpbGQt
b24tMzJiaXQucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL2R5bmFtaWMtbGF5
ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtZGJzL21vbmdvZGIvbW9uZ29kYi8wMDAxLUZpeC1i
dWlsZC1vbi0zMmJpdC5wYXRjaCBiL21ldGEtb2UvZHluYW1pYy1sYXllcnMvbWV0YS1weXRo
b24vcmVjaXBlcy1kYnMvbW9uZ29kYi9tb25nb2RiLzAwMDEtRml4LWJ1aWxkLW9uLTMyYml0
LnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjRh
YmMwNDQxNTENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLW9lL2R5bmFtaWMtbGF5
ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtZGJzL21vbmdvZGIvbW9uZ29kYi8wMDAxLUZpeC1i
dWlsZC1vbi0zMmJpdC5wYXRjaA0KPiBAQCAtMCwwICsxLDM4IEBADQo+ICtGcm9tIGIxNzJl
YmU3ZTcwOWIxMDMzOGMxYjI2MDMxMGRhY2MxNWM1NTdjZmYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxDQo+ICtGcm9tOiBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+
DQo+ICtEYXRlOiBGcmksIDIyIFNlcCAyMDIzIDE1OjM3OjI5ICswMjAwDQo+ICtTdWJqZWN0
OiBbUEFUQ0hdIEZpeCBidWlsZCBvbiAzMmJpdA0KPiArDQo+ICsqIGZpeGVzOg0KPiArICBz
cmMvbW9uZ28vdXRpbC9uZXQvaHR0cF9jbGllbnRfY3VybC5jcHA6IEluIGZ1bmN0aW9uICdz
aXplX3QgbW9uZ286Onthbm9ueW1vdXN9OjpSZWFkTWVtb3J5Q2FsbGJhY2soY2hhciosIHNp
emVfdCwgc2l6ZV90LCB2b2lkKiknOg0KPiArICBzcmMvbW9uZ28vdXRpbC9uZXQvaHR0cF9j
bGllbnRfY3VybC5jcHA6MTcyOjIxOiBlcnJvcjogbm8gbWF0Y2hpbmcgZnVuY3Rpb24gZm9y
IGNhbGwgdG8gJ21pbihzaXplX3QsIGxvbmcgdW5zaWduZWQgaW50KScNCj4gKyAgICAxNzIg
fCAgICAgICAgICAgICBzdGQ6Om1pbihzaXplICogbml0ZW1zLCBzdGF0aWNfY2FzdDx1bnNp
Z25lZCBsb25nPihidWZSZWFkZXItPnJlbWFpbmluZygpKSk7DQo+ICsgICAgICAgIHwgICAg
ICAgICAgICAgfn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ICsNCj4gKyogcmVwb3J0ZWQgaW46
DQo+ICsgIGh0dHBzOi8vamlyYS5tb25nb2RiLm9yZy9icm93c2UvU0VSVkVSLTczMDA3DQo+
ICsgIGJ1dCB3aWxsIHByb2JhYmx5IGdldCBjbG9zZWQgbGlrZToNCj4gKyAgbW9uZ29kYi8w
MDAxLUZpeC10eXBlLW1pc21hdGNoLW9uLTMyYml0LWFyY2hlcy5wYXRjaA0KPiArICBzdWJt
aXR0ZWQgaW46DQo+ICsgIGh0dHBzOi8vamlyYS5tb25nb2RiLm9yZy9icm93c2UvU0VSVkVS
LTc0NjMzDQo+ICsgIGFzIHRoZXkgZG9uJ3Qgc3VwcG9ydCAzMmJpdCBidWlsZHMNCj4gKw0K
DQpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIGl0LCBJIHdhcyBzZWVpbmcgdGhpcyBmYWls
dXJlIG9uIG15IENJIGZvciBvbiANCng4NiBidXQgaGFkIHRhYmxlZCBpdCBkb3duIGluIHRo
ZSBsb25nIGxpc3Qgb2YgVE9ETywgcmVhbGx5IGFwcHJlY2lhdGVkLg0KDQpZZWFoLCBwZXJo
YXBzIHdlIHNob3VsZCBqdXN0IGRpc2FibGUgaXQgZm9yIGFsbCAzMmJpdCBhcmNoZXMgYXMg
d2VsbC4NCg0KPiArU2lnbmVkLW9mZi1ieTogTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FA
Z21haWwuY29tPg0KPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+ICstLS0NCj4gKyBz
cmMvbW9uZ28vdXRpbC9uZXQvaHR0cF9jbGllbnRfY3VybC5jcHAgfCAyICstDQo+ICsgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2Rp
ZmYgLS1naXQgYS9zcmMvbW9uZ28vdXRpbC9uZXQvaHR0cF9jbGllbnRfY3VybC5jcHAgYi9z
cmMvbW9uZ28vdXRpbC9uZXQvaHR0cF9jbGllbnRfY3VybC5jcHANCj4gK2luZGV4IDU3Mjkw
ZDBmOGVkLi5mMjUxZmUyYTU1MCAxMDA2NDQNCj4gKy0tLSBhL3NyYy9tb25nby91dGlsL25l
dC9odHRwX2NsaWVudF9jdXJsLmNwcA0KPiArKysrIGIvc3JjL21vbmdvL3V0aWwvbmV0L2h0
dHBfY2xpZW50X2N1cmwuY3BwDQo+ICtAQCAtMTY5LDcgKzE2OSw3IEBAIHNpemVfdCBSZWFk
TWVtb3J5Q2FsbGJhY2soY2hhciogYnVmZmVyLCBzaXplX3Qgc2l6ZSwgc2l6ZV90IG5pdGVt
cywgdm9pZCogaW5zdHJlDQo+ICsNCj4gKyAgICAgaWYgKGJ1ZlJlYWRlci0+cmVtYWluaW5n
KCkgPiAwKSB7DQo+ICsgICAgICAgICBzaXplX3QgcmVhZFNpemUgPQ0KPiArLSAgICAgICAg
ICAgIHN0ZDo6bWluKHNpemUgKiBuaXRlbXMsIHN0YXRpY19jYXN0PHVuc2lnbmVkIGxvbmc+
KGJ1ZlJlYWRlci0+cmVtYWluaW5nKCkpKTsNCj4gKysgICAgICAgICAgICBzdGQ6Om1pbihz
aXplICogbml0ZW1zLCBzdGF0aWNfY2FzdDxzaXplX3Q+KGJ1ZlJlYWRlci0+cmVtYWluaW5n
KCkpKTsNCj4gKyAgICAgICAgIGF1dG8gYnVmID0gYnVmUmVhZGVyLT5yZWFkQnl0ZXMocmVh
ZFNpemUpOw0KPiArICAgICAgICAgbWVtY3B5KGJ1ZmZlciwgYnVmLnJhd0RhdGEoKSwgcmVh
ZFNpemUpOw0KPiArICAgICAgICAgcmV0ID0gcmVhZFNpemU7DQo+IGRpZmYgLS1naXQgYS9t
ZXRhLW9lL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtZGJzL21vbmdvZGIv
bW9uZ29kYl9naXQuYmIgYi9tZXRhLW9lL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGJzL21vbmdvZGIvbW9uZ29kYl9naXQuYmINCj4gaW5kZXggZjFhNTA4ZjNmMi4u
MDM3ZDU4Y2YxNyAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9keW5hbWljLWxheWVycy9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRicy9tb25nb2RiL21vbmdvZGJfZ2l0LmJiDQo+ICsrKyBiL21l
dGEtb2UvZHluYW1pYy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1kYnMvbW9uZ29kYi9t
b25nb2RiX2dpdC5iYg0KPiBAQCAtMzUsNiArMzUsNyBAQCBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vbW9uZ29kYi9tb25nby5naXQ7YnJhbmNoPXY0LjQ7cHJvdG9jb2w9aHR0cHMg
XA0KPiAgICAgICAgICAgICAgZmlsZTovLzAwMDEtZnJlZV9tb24tSW5jbHVkZS1taXNzaW5n
LWNzdGRpbnQucGF0Y2ggXA0KPiAgICAgICAgICAgICAgZmlsZTovLzAwMDEtYXBwbHktbXN2
Yy13b3JrYXJvdW5kLWZvci1jbGFuZy0xNi5wYXRjaCBcDQo+ICAgICAgICAgICAgICBmaWxl
Oi8vMDAwMS1GaXgtdHlwZS1taXNtYXRjaC1vbi0zMmJpdC1hcmNoZXMucGF0Y2ggXA0KPiAr
ICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtYnVpbGQtb24tMzJiaXQucGF0Y2ggXA0KPiAg
ICAgICAgICAgICAgIg0KPiAgIFNSQ19VUkk6YXBwZW5kOmxpYmMtbXVzbCA9IlwNCj4gICAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLU1hcmstb25lLW9mLXN0cmVycm9yX3ItaW1wbGVtZW50
YXRpb24tZ2xpYmMtc3BlY2lmaWMucGF0Y2ggXA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQg
dG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMDUwNzApOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8x
MDUwNzANCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbXQvMTAxNTIxODExLzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1k
ZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIg
W3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=

--------------vkSNyFT7FbLGtMUHHggbDp6M
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------vkSNyFT7FbLGtMUHHggbDp6M--

--------------1A12NV03xw73vfobjQizUj1K--

--------------NxtTvRtAQOTxLp1U5i9v06dG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZQ2wLgUDAAAAAAAKCRC7BTNVkZ0zFANq
AJwOBWC9r8xJwaWKaPM6Dj/roy+llwCfd7AofuJvVjExRBdHtZ3ATQ9eThg=
=svEF
-----END PGP SIGNATURE-----

--------------NxtTvRtAQOTxLp1U5i9v06dG--

