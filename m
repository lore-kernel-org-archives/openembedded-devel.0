Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A9AC3DA6E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 00:35:55 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.39903.1703118949639043605
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 16:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9pTDWPZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cd5cdba609so229452a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 16:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703118949; x=1703723749; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ww1y5HtxFmP0mSp5XBCZilclTAgGmeMiMI7WjCsN/t0=;
        b=S9pTDWPZTfC+uQcNujYRDcCJ6mNqSdXRimiirSBZiNabUrNuO221Z1covBAy/FKv5q
         barv7xGYszJlf0QNZv7kwhYKtHiAtQzS8AManCUMiFNn728K5Ao3WhOH0NoNIW4YEgnH
         g3hdyPdO7MHcI2v4N40ToIp7aFmYBk61O4wtj/U2eFzDmT8+MHmVGJBBHYX7keQoGRLJ
         /wU0WUWGgSXnqKVFRBCG+YZvcGpx4bMqvkRnKni3V3bqx7vgcp75r5b2OIAOFvYefMd8
         iWR/Vx7ZkV+CT2czbKA4yLtJI2n5zZxFlgXnexaVjaVSddNnDKAhZxAidpBGNIBLOArO
         DjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703118949; x=1703723749;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ww1y5HtxFmP0mSp5XBCZilclTAgGmeMiMI7WjCsN/t0=;
        b=JKZ1uN3ENzO4MoXLI+IZha04K4r/Y17UF7JQW5U5RVxzxHQ3XLGvOauX7NuICiNMZY
         zxUrI/LuWOkdcelywkWrG2bV62gETcNghu9qVw6NRGoToILZZhK9A41luxptmQIVypm6
         VuuupCCjcnGP/r0PyQQnbKxifgr8JL/0BhBbYaiGUQmc6DV+9BWs0Nzz2tE60wXzEUHI
         5ImHM1q4ilrBMPhHRm5Plgi0fjgPxB76Y4ewg/m9DFOJa7CbP+2YpVaGJZGkOBV8xnXM
         IROBbq1K9O5XLO4WianE2Urt+Vf9JMxN8P+0nXqukob7OycXqFjIOtTIVqAeOpawE9DT
         NACw==
X-Gm-Message-State: AOJu0YwCHbk4Wr4/c4/I9O3cGukjIRBA7qjDObJCGfenI+y8oUu9lJ2M
	/SR1UMaM0AVNNsmBCtrTUdg=
X-Google-Smtp-Source: AGHT+IGl4nWfRmghEYhCavGQa+WTV03nlcIYdxRaD7ncz21nEFNCqRUr7UQlFVkENShwN1WTGf/WcQ==
X-Received: by 2002:a17:902:ceca:b0:1d3:f067:a3f0 with SMTP id d10-20020a170902ceca00b001d3f067a3f0mr1792279plg.107.1703118948801;
        Wed, 20 Dec 2023 16:35:48 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:5cc1:8ee2:f5e5:f1f3? ([2601:646:9d80:4380:5cc1:8ee2:f5e5:f1f3])
        by smtp.gmail.com with ESMTPSA id n10-20020a1709026a8a00b001ab39cd875csm306850plk.133.2023.12.20.16.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 16:35:48 -0800 (PST)
Message-ID: <731f340b-e2a7-4597-97c2-dde6123e7f8a@gmail.com>
Date: Wed, 20 Dec 2023 16:35:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] c-ares: Move to tarballs, add ptest and
 static support
To: Alex Kiernan <alex.kiernan@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20231220205518.6966-1-alex.kiernan@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20231220205518.6966-1-alex.kiernan@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QpMPqC96JCG7GiPU1WsILOj0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 00:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107696

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QpMPqC96JCG7GiPU1WsILOj0
Content-Type: multipart/mixed; boundary="------------OupHqguQ94RwNE3rziM4PH1s";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <731f340b-e2a7-4597-97c2-dde6123e7f8a@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] c-ares: Move to tarballs, add ptest and
 static support
References: <20231220205518.6966-1-alex.kiernan@gmail.com>
In-Reply-To: <20231220205518.6966-1-alex.kiernan@gmail.com>

--------------OupHqguQ94RwNE3rziM4PH1s
Content-Type: multipart/mixed; boundary="------------d90Sj3Ee7p1w0eeBB8UI4lTo"

--------------d90Sj3Ee7p1w0eeBB8UI4lTo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMjAvMjMgMTI6NTUgUE0sIEFsZXggS2llcm5hbiB3cm90ZToNCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBLaWVybmFuIDxhbGV4LmtpZXJuYW5AZ21haWwuY29tPg0KPiAtLS0NCj4g
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gVXNlIHJlbGF0aXZlIHBhdGggdG8gYXJlc3Rlc3QN
Cj4gDQo+ICAgLi4uL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVzL3J1bi1wdGVzdCAg
IHwgIDcgKysrKysrKw0KPiAgIC4uLi9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18x
LjI0LjAuYmIgICB8IDE5ICsrKysrKysrKysrKysrLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2MtYXJlcy9jLWFyZXMvcnVuLXB0ZXN0
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2Mt
YXJlcy9ydW4tcHRlc3QgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVz
L3J1bi1wdGVzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjE1OTcxZGVjMDU4Yw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L2MtYXJlcy9jLWFyZXMvcnVuLXB0ZXN0DQo+IEBAIC0wLDAgKzEsNyBA
QA0KPiArIyEvYmluL3NoDQo+ICsNCj4gK2lmIC4vYXJlc3Rlc3Q7IHRoZW4NCj4gKwllY2hv
ICJQQVNTOiBjLWFyZXMiDQo+ICtlbHNlDQo+ICsJZWNobyAiRkFJTDogYy1hcmVzIg0KPiAr
ZmkNCg0KSSB3b25kZXIgaWYgaXQgY291bGQgYmUgYWRkZWQgdG8gcmVndWxhciBydW5zIHdp
dGggcHRlc3QgaW1hZ2VzIGFuZCANCnRoZXJlZm9yZSBhZGRlZCB0byBQVEVTVFNfRkFTVF9N
RVRBX09FICggaWYgaXQgcnVucyB3aXRoIGluIDMwcyApIG9yIA0KUFRFU1RTX1NMT1dfTUVU
QV9PRSBpbiBtZXRhLW9lL2NvbmYvaW5jbHVkZS9wdGVzdC1wYWNrYWdlbGlzdHMtbWV0YS1v
ZS5pbmMNCg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVz
L2MtYXJlc18xLjI0LjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1h
cmVzXzEuMjQuMC5iYg0KPiBpbmRleCAyMTcxMDAyYWE5NWUuLjNiM2IyYjgzZmViYyAxMDA2
NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18xLjI0
LjAuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18x
LjI0LjAuYmINCj4gQEAgLTUsMTQgKzUsMjMgQEAgU0VDVElPTiA9ICJsaWJzIg0KPiAgIExJ
Q0VOU0UgPSAiTUlUIg0KPiAgIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
bWQ7bWQ1PWZkYmM1OGE2ZGExMWE5ZjY4YWE3M2M0NTM4MThkZWNjIg0KPiAgIA0KPiAtU1JD
X1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2MtYXJlcy9jLWFyZXMuZ2l0O2JyYW5jaD1tYWlu
O3Byb3RvY29sPWh0dHBzIg0KPiAtU1JDUkVWID0gIjk3MmY0NTZmMjgwOGI0ZTRiMTczMGM5
MGFiNTA2ZjZhZjVmNGM3MjUiDQo+ICtTUkNfVVJJID0gImh0dHBzOi8vYy1hcmVzLm9yZy9k
b3dubG9hZC9jLWFyZXMtMS4yNC4wLnRhci5neiBcDQo+ICsgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzUxN2RlNmQ1YWM5Y2Q1NWE5
YjcyYzE1NDFjM2UyNWI4NDU4ODQyMTgxN2I1ZjA5Mjg1MGFjMDlhOGRmNTEwMyINCj4gICAN
Cj4gLVVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gImNhcmVzLSg/UDxwdmVyPlxkK18o
XGRfPykrKSINCj4gK1BBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQ
VEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9Ig0KPiArUEFDS0FHRUNPTkZJ
R1ttYW5wYWdlc10gPSAiIg0KPiArUEFDS0FHRUNPTkZJR1t0ZXN0c10gPSAiLURDQVJFU19C
VUlMRF9URVNUUz1PTiwtRENBUkVTX0JVSUxEX1RFU1RTPU9GRixnb29nbGV0ZXN0Ig0KPiAg
IA0KPiAtUyA9ICIke1dPUktESVJ9L2dpdCINCj4gK2luaGVyaXQgY21ha2UgbWFucGFnZXMg
cGtnY29uZmlnIHB0ZXN0DQo+ICAgDQo+IC1pbmhlcml0IGNtYWtlIHBrZ2NvbmZpZw0KPiAr
RVhUUkFfT0VDTUFLRSA9ICItRENBUkVTX1NUQVRJQz0ke0AgJ09OJyBpZiBkLmdldFZhcign
RElTQUJMRV9TVEFUSUMnKSA9PSAnJyBlbHNlICdPRkYnIH0iDQo+ICsNCj4gK2RvX2luc3Rh
bGxfcHRlc3QgKCkgew0KPiArCWluc3RhbGwgLWQgJHtEfSR7UFRFU1RfUEFUSH0NCj4gKwlp
bnN0YWxsIC1tIDA3NTUgJHtCfS9iaW4vYXJlc3Rlc3QgJHtEfSR7UFRFU1RfUEFUSH0NCj4g
KwlpbnN0YWxsIC1tIDA3NTUgJHtXT1JLRElSfS9ydW4tcHRlc3QgJHtEfSR7UFRFU1RfUEFU
SH0NCj4gK30NCj4gICANCj4gICBQQUNLQUdFX0JFRk9SRV9QTiA9ICIke1BOfS11dGlscyIN
Cj4gICANCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6
IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcv
UmVwbHkgT25saW5lICgjMTA3NjcyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA3NjcyDQo+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMzI4ODg1Mi8xOTk3OTE0
DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------d90Sj3Ee7p1w0eeBB8UI4lTo
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------d90Sj3Ee7p1w0eeBB8UI4lTo--

--------------OupHqguQ94RwNE3rziM4PH1s--

--------------QpMPqC96JCG7GiPU1WsILOj0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZYOIYwUDAAAAAAAKCRC7BTNVkZ0zFIzq
AJ4qHIZa5vxyxGsY5tuq/D3gqoE9uQCdEzXAtA/NYoU0Ym/7KGcTs3UKQhM=
=DVFR
-----END PGP SIGNATURE-----

--------------QpMPqC96JCG7GiPU1WsILOj0--

