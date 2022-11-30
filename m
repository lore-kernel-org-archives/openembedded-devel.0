Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D255C352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:08:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.22859.1669838891360485113
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlbjiXbD;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id w23so17766166ply.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5hcgspZbtYI+HmPc2WqSyLzG4onO7iwYoGo870hyu4=;
        b=jlbjiXbD1RpVj7VIRXDJvpN9ibEDG68voGOGl4oUZUmFDv+NAC5yNJ6BD1AB3cyRb3
         GQv9afNNfqH8nNzKAb3sBE6DgzAHjp3SFT3w6IRhH9CcMsIEcw5TuyLw7Urgoj5kapgX
         hTFQnInKmHWt5h9+xuiF2jpOskz97fUMsgavZ0eWv3zbuMQ4c5eyAfAcIl/iT1JlOnu1
         L/EPpvMG/fyMZjvWWj+byQPuZT9cYbJqVaQT8y6gMiLKTrgENAjcbzbHQ7FHfHDk6EQQ
         cL/1bXQqEFapZV3mjWGOy73Cxak6bVkdGWVJMhL9OjWI+8O7RKePP6q5PqEQM/p9j1R/
         dKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c5hcgspZbtYI+HmPc2WqSyLzG4onO7iwYoGo870hyu4=;
        b=Fn0/+dy1aSbcWyK7ScILYxc4cSZxgNitqZsguskDSOOLxv61h8YyvFVFQSCQVbohk0
         pkPiDgbmQHSJIQGVzDoUPWPiAhD6Xvdj1O/dS6qmy0LpAv62qVFwS5wdJEzDzqgc3rz3
         jwoZRrGN1uE0XQ0KqdU6E8dlOSjzVrKp6f7PquQaDV9ZQacrMA6t84Tq7bTj5l4ziEy+
         7VwgXljGGXrEL/Bs1C17//LykI4NuHU8lzC4OPMyLeLnz78Lu6zsGsCU5KgIzDDfyzRM
         t75Zzg/ToCeih6hQJ3/E2hv2mn9blqPke76jgiZMkMRaR2LJnISM6kvKUldkAFz6LNRd
         yIQw==
X-Gm-Message-State: ANoB5pkIJuPLns81Q+PliBHBio3nsjHCKFLRg8K8RiotiFWC4jh0TO+/
	AJOt/ufahjRkT7oOFaTyuX4=
X-Google-Smtp-Source: AA0mqf7gQtpk4BUSLphAsB1vXiFvvJM7825gGD365BLkDLLM2McjPai4vs6iejKDwT0UMZVbLjNXsg==
X-Received: by 2002:a17:902:9694:b0:189:9741:9899 with SMTP id n20-20020a170902969400b0018997419899mr12328547plp.43.1669838890594;
        Wed, 30 Nov 2022 12:08:10 -0800 (PST)
Received: from [10.0.0.100] (c-24-130-213-145.hsd1.ca.comcast.net. [24.130.213.145])
        by smtp.gmail.com with ESMTPSA id 206-20020a6214d7000000b0057294f480casm10786pfu.97.2022.11.30.12.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 12:08:10 -0800 (PST)
Message-ID: <61866268-84e1-7ad5-5992-f78281e1bb3a@gmail.com>
Date: Wed, 30 Nov 2022 12:08:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-uefi-firmware: add recipe
 for version 1.9
To: tomzy <tomasz.zyjewski@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
References: <CANx9H-CFJ0KnQtNtejmpishDMxVdWaucGt05GYB+oHaADChdjA@mail.gmail.com>
 <13060.1669793358146498707@lists.openembedded.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <13060.1669793358146498707@lists.openembedded.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s1dM0GyLyQ65psPbJAw7qm0k"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99878

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s1dM0GyLyQ65psPbJAw7qm0k
Content-Type: multipart/mixed; boundary="------------ftom2B0Oc0FEGsbtuJ5AboWZ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: tomzy <tomasz.zyjewski@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <61866268-84e1-7ad5-5992-f78281e1bb3a@gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-uefi-firmware: add recipe
 for version 1.9
References: <CANx9H-CFJ0KnQtNtejmpishDMxVdWaucGt05GYB+oHaADChdjA@mail.gmail.com>
 <13060.1669793358146498707@lists.openembedded.org>
In-Reply-To: <13060.1669793358146498707@lists.openembedded.org>

--------------ftom2B0Oc0FEGsbtuJ5AboWZ
Content-Type: multipart/mixed; boundary="------------KBPQyepiF4f0yHL8EN6T5Upo"

--------------KBPQyepiF4f0yHL8EN6T5Upo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMjkvMjIgMTE6MjkgUE0sIHRvbXp5IHdyb3RlOg0KPiAgICAgT24gRnJpLCBOb3Yg
MjUsIDIwMjIgYXQgMzo0NCBBTSB0b216eSA8dG9tYXN6Lnp5amV3c2tpQC4uLg0KPiAgICAg
PG1haWx0bzp0b21hc3ouenlqZXdza2lALi4uPj4gd3JvdGU6DQo+IA0KPiAgICAgSW5zdGFs
bCB1ZWZpLWZpcm13YXJlLXBhcnNlciB0b29sDQo+IA0KPiAgICAgU2lnbmVkLW9mZi1ieTog
VG9tYXN6IMW7eWpld3NraSA8dG9tYXN6Lnp5amV3c2tpQC4uLg0KPiAgICAgPG1haWx0bzp0
b21hc3ouenlqZXdza2lALi4uPj4NCj4gICAgIC0tLQ0KPiAgICAgIMKgLi4uL3B5dGhvbi9w
eXRob24zLXVlZmktZmlybXdhcmVfMS45LmJiDQo+ICAgICA8aHR0cDovL3B5dGhvbjMtdWVm
aS1maXJtd2FyZV8xLjkuYmI+wqAgwqAgwqAgwqAgwqB8IDE3ICsrKysrKysrKysrKysrKysr
DQo+ICAgICAgwqAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiAgICAgIMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0DQo+ICAgICBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXVlZmktZmlybXdhcmVfMS45LmJiDQo+ICAgICA8aHR0cDovL3B5
dGhvbjMtdWVmaS1maXJtd2FyZV8xLjkuYmI+DQo+IA0KPiAgICAgZGlmZiAtLWdpdA0KPiAg
ICAgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVlZmkt
ZmlybXdhcmVfMS45LmJiDQo+ICAgICA8aHR0cDovL3B5dGhvbjMtdWVmaS1maXJtd2FyZV8x
LjkuYmI+DQo+ICAgICBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdWVmaS1maXJtd2FyZV8xLjkuYmINCj4gICAgIDxodHRwOi8vcHl0aG9uMy11ZWZp
LWZpcm13YXJlXzEuOS5iYj4NCj4gICAgIG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ICAgICBp
bmRleCAwMDAwMDAwMDAwMDAuLmJhMzEyNGIzNmU2MA0KPiAgICAgLS0tIC9kZXYvbnVsbA0K
PiAgICAgKysrDQo+ICAgICBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdWVmaS1maXJtd2FyZV8xLjkuYmINCj4gICAgIDxodHRwOi8vcHl0aG9uMy11
ZWZpLWZpcm13YXJlXzEuOS5iYj4NCj4gICAgIEBAIC0wLDAgKzEsMTcgQEANCj4gICAgICtT
VU1NQVJZID0gIlZhcmlvdXMgZGF0YSBzdHJ1Y3R1cmVzIGFuZCBwYXJzaW5nIHRvb2xzIGZv
ciBVRUZJDQo+ICAgICBmaXJtd2FyZS4iDQo+ICAgICArREVTQ1JJUFRJT04gPSAiVGhpcyBw
YWNrYWdlIGNvbnRhaW5zIFB5dGhvbiBVRUZJIGZpcm13YXJlIHBhcnNlcg0KPiAgICAgdG9v
bC4gVGhlIFwNCj4gICAgICtVRUZJIGZpcm13YXJlIHBhcnNlciBpcyBhIHNpbXBsZSBtb2R1
bGUgYW5kIHNldCBvZiBzY3JpcHRzIGZvcg0KPiAgICAgcGFyc2luZywgXA0KPiAgICAgK2V4
dHJhY3RpbmcsIGFuZCByZWNyZWF0aW5nIFVFRkkgZmlybXdhcmUgdm9sdW1lcy4gVGhpcyBp
bmNsdWRlcw0KPiAgICAgcGFyc2luZyBcDQo+ICAgICArbW9kdWxlcyBmb3IgQklPUywgT3B0
aW9uUk9NLCBJbnRlbCBNRSBhbmQgb3RoZXIgZm9ybWF0cyB0b28uIg0KPiAgICAgK0hPTUVQ
QUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS90aGVvcG9saXMvdWVmaS1maXJtd2FyZS1wYXJz
ZXINCj4gICAgIDxodHRwczovL2dpdGh1Yi5jb20vdGhlb3BvbGlzL3VlZmktZmlybXdhcmUt
cGFyc2VyPiINCj4gICAgICtBVVRIT1IgPSAiVGVkZHkgUmVlZCA8dGVkZHlALi4uIDxtYWls
dG86dGVkZHlALi4uPj4iDQo+ICAgICArTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgJiBCU0Qt
My1DbGF1c2UiDQo+ICAgICArTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICAgICAiZmlsZTovL3Nl
dHVwLnB5O21kNT05MGZhNWJhZTE1NDc1NTBmMWMxOTkzZjY1MWVkYTk1NSINCj4gICAgICsN
Cj4gICAgICtTUkNfVVJJID0NCj4gICAgICJodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5v
cmcvcGFja2FnZXMvN2UvYjQvYTRlYzY0NmQyNGExYWFkNzA5ZmRiODNkZTZlNWVkZGQ2Y2Iy
NGZhZWMwMmYzYTk0YTNhZjNiMGFiYTI4L3VlZmlfZmlybXdhcmUtJHtQVn0udGFyLmd6IDxo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvN2UvYjQvYTRlYzY0NmQy
NGExYWFkNzA5ZmRiODNkZTZlNWVkZGQ2Y2IyNGZhZWMwMmYzYTk0YTNhZjNiMGFiYTI4L3Vl
ZmlfZmlybXdhcmUtJCU3QlBWJTdELnRhci5nej4iDQo+IA0KPiAgICAgSWYgeW914oCZcmUg
ZmV0Y2hpbmcgZnJvbSDCoHB5dGhvbmhvc3RlZCwgeW91IGNvdWxkIHZlcnkgbGlrZWx5DQo+
ICAgICBzaW1wbGlmeSB0aGUgcmVjaXBlIGJ5IGluaGVyaXRpbmcgcHlwaSBiYmNsYXNzDQo+
IA0KPiAgICAgK1NSQ19VUklbbWQ1c3VtXSA9ICJlZTUwMTFiNGQwYmNiMGViN2MwNjI5NWUw
MTA3ODk0ZiINCj4gDQo+ICAgICBUaGVzZSBkYXlzLCB3ZSBvbmx5IHJlYWxseSB1c2UgdGhl
IHNoYTI1NnN1bQ0KPiAgICAgK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICAgICAiMjM0MTE5
ZGQ5Mjc4MGM2N2NjZTNiNjY0ZTg2MTE5YzQxZDBiMmFmMTg4ZDdmMzcyYjY5Nzg5YjMyYzVk
NWNkMCIgKw0KPiAgICAgK1MgPSAiJHtXT1JLRElSfS91ZWZpX2Zpcm13YXJlLSR7UFZ9IiAr
ICtpbmhlcml0IHNldHVwdG9vbHMzIC0tIDIuMjUuMQ0KPiANCj4gDQo+IFVzZWQgZ2l0IGZl
dGNoZXIgaGVyZSwgSSBqdXN0IHNlbmQgUEFUQ0ggVjIsIG5vdCBzdXJlIGlmIGl0IHZpc2li
bGUgb24gDQo+IG1haWxpbmcgbGlzdC4NCg0KSXRzIG5vdC4gV2hlcmUgZGlkIHlvdSBzZW5k
IGl0ID8NCg0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzk5ODY5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvOTk4NjkNCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTUyNTI0NDcvMTk5NzkxNA0KPiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------KBPQyepiF4f0yHL8EN6T5Upo
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------KBPQyepiF4f0yHL8EN6T5Upo--

--------------ftom2B0Oc0FEGsbtuJ5AboWZ--

--------------s1dM0GyLyQ65psPbJAw7qm0k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCY4e4KAUDAAAAAAAKCRC7BTNVkZ0zFM89
AJ9iixhI6gwLSNQdp5ks9GRIuJcqLQCfejj9WTDAMYCDtdtz/0TGJiVCVa8=
=Eb5d
-----END PGP SIGNATURE-----

--------------s1dM0GyLyQ65psPbJAw7qm0k--

