Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D8BC07E8E
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 18:36:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.168444.1692210977607642226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 11:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JDooAYi/;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68890d565b5so737227b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 11:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692210977; x=1692815777;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8wNi6qEZvIMLViC1fIZodh6wuTpdUTe7RgvQqVPSZM=;
        b=JDooAYi/OhKNiFebrdwHEZYGCL35ZXO4mhfxFmK6Dw6GXNQvSbUl5AqgKnBay6SV+m
         IM5ouylwLWA0gGUMf17tluOfpbGPWk1aGzpvzsUQofNZEO/Z6kzzthuKKFAjT0Cv3ogB
         YqHT8UemRG/GiwwfiuYQmgmYG5ZvLY3rj12TZbAcQ/NpbfGqI8LuBY+iEOIbgOBZxt4J
         /fyakE0fgxtedZqJMqThY9vyUjuPL8ir6IC5aSMTjck7OboiJ2LFuxJsi4g+HD4sOXvW
         K7B1mzzxURpZ7nrpM9FK+SFie/4FFCPMpzQ5tw9+gYZ/NSIWusWm5kpr3WqtgbdRY/zT
         xc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692210977; x=1692815777;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8wNi6qEZvIMLViC1fIZodh6wuTpdUTe7RgvQqVPSZM=;
        b=c5CbX1eVyrknU0m/McroGYUZYu43FDX3PQywDA3wsfkJgDR3jWCL1ca5fCe5uIxwdO
         5wfhZBB5x64MXhOSzZk/TAfXBCNzSLt2rKuw+1//K+ZMCQq0/WJI6TE01t92kqt0dNNk
         NXONAasBMP2mfFDOmbL8HOAAk/faEZPNIb9uaRsxUSDKP2zQb1WWNOG3H3ql9gJev0YT
         FPgpInFARHDMrngxhTvZe9C7aQoMWbww6c484PFrtheLYJFg0Z56fi+Z5rybuMSGWAmQ
         a6/bCKySswlf/cH7FYcsASqWRH09Yd+rw9I6aDgUSlgkpTaYe2wuIPJRgUNSxPb0tNTw
         QkDQ==
X-Gm-Message-State: AOJu0Ywvjj11+LA8cM85CyFAsrAAnQX/ZkTxsaBGkXNVxwet4p7kenCS
	A8ygFnyw6wrZ3ZHWdHKG17ElgkL/ZSHsIg==
X-Google-Smtp-Source: AGHT+IGtM9aRpCQfi1euHcOVMRtGNoQ+ljEQs4Jsq9DRE3fh9UzzMqNcrgBGe022ZVmzRZ7XU0RunQ==
X-Received: by 2002:a05:6a20:4295:b0:138:2fb8:6c48 with SMTP id o21-20020a056a20429500b001382fb86c48mr3485989pzj.8.1692210976688;
        Wed, 16 Aug 2023 11:36:16 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:b192:e884:f5f4:7725? ([2601:646:9100:2cb0:b192:e884:f5f4:7725])
        by smtp.gmail.com with ESMTPSA id j17-20020a62b611000000b0067777e960d9sm11393877pff.155.2023.08.16.11.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 11:36:16 -0700 (PDT)
Message-ID: <a5bae4aa-9632-42c5-a640-94e58f5111ca@gmail.com>
Date: Wed, 16 Aug 2023 11:36:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.23.4 ->
 4.24.0
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1692150271-5638-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <1692150271-5638-1-git-send-email-wangmy@fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UhkYMTUi1A37NkJFJ0HCnnm0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 18:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104440

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UhkYMTUi1A37NkJFJ0HCnnm0
Content-Type: multipart/mixed; boundary="------------3mpDEoc0EcdYnq6LOe8Bqk2m";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Message-ID: <a5bae4aa-9632-42c5-a640-94e58f5111ca@gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.23.4 ->
 4.24.0
References: <1692150271-5638-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1692150271-5638-1-git-send-email-wangmy@fujitsu.com>

--------------3mpDEoc0EcdYnq6LOe8Bqk2m
Content-Type: multipart/mixed; boundary="------------0nRqrPyzXuxfWi7q0RLrHcdr"

--------------0nRqrPyzXuxfWi7q0RLrHcdr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8xNS8yMyA2OjQ0IFBNLCB3YW5nbXkgd3JvdGU6DQo+IEZyb206IFdhbmcgTWluZ3l1
IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IA0KPiBDaGFuZ2Vsb2c6DQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJvdG9idWYvcmVsZWFzZXMvdGFnL3YyNC4wDQo+
DQoNCkZhaWxzIHRvIGJ1aWxkIHdpdGggY2xhbmcNCg0KfCBweXRob24vbWVzc2FnZS5jOjE0
MDoyODogd2FybmluZzogY29tcGFyaXNvbiBvZiBpbnRlZ2VycyBvZiBkaWZmZXJlbnQgDQpz
aWduczogJ3NpemVfdCcgKGFrYSAndW5zaWduZWQgbG9uZycpIGFuZCAnaW50JyBbLVdzaWdu
LWNvbXBhcmVdDQp8ICAgMTQwIHwgICBpZiAoYml0cy0+dHlwZV9iYXNpY3NpemUgPT0gLTEp
IGdvdG8gZXJyOw0KfCAgICAgICB8ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+IF4gIH5+
DQp8IHB5dGhvbi9tZXNzYWdlLmM6MTIzODo0OTogZXJyb3I6IGluY29tcGF0aWJsZSBpbnRl
Z2VyIHRvIHBvaW50ZXIgDQpjb252ZXJzaW9uIHBhc3NpbmcgJ3VpbnRwdHJfdCcgKGFrYSAn
dW5zaWduZWQgbG9uZycpIHRvIHBhcmFtZXRlciBvZiANCnR5cGUgJ2NvbnN0IHVwYl9NZXNz
YWdlRGVmIConIChha2EgJ2NvbnN0IHN0cnVjdCB1cGJfTWVzc2FnZURlZiAqJykgDQpbLVdp
bnQtY29udmVyc2lvbl0NCnwgIDEyMzggfCAgICAgICAgICAgICAgICAgICAgICAgIHVwYl9N
ZXNzYWdlRGVmX01pbmlUYWJsZShvdGhlci0+ZGVmKSwNCnwgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+DQp8IA0K
L21udC9iL3lvZS9tYXN0ZXIvYnVpbGQvdG1wL3dvcmsvY29ydGV4YTcyLWNvcnRleGE1My1j
cnlwdG8teW9lLWxpbnV4L3B5dGhvbjMtcHJvdG9idWYvNC4yNC4wL3Byb3RvYnVmLTQuMjQu
MC91cGIvcmVmbGVjdGlvbi9tZXNzYWdlX2RlZi5oOjEzODo2OTogDQpub3RlOiBwYXNzaW5n
IGFyZ3VtZW50IHRvIHBhcmFtZXRlciAnbScgaGVyZQ0KfCAgIDEzOCB8IGNvbnN0IHVwYl9N
aW5pVGFibGUqIHVwYl9NZXNzYWdlRGVmX01pbmlUYWJsZShjb25zdCANCnVwYl9NZXNzYWdl
RGVmKiBtKTsNCnwgICAgICAgfCANCiAgICAgIF4NCnwgcHl0aG9uL21lc3NhZ2UuYzoxNjA5
OjY5OiBlcnJvcjogaW5jb21wYXRpYmxlIGludGVnZXIgdG8gcG9pbnRlciANCmNvbnZlcnNp
b24gcGFzc2luZyAndWludHB0cl90JyAoYWthICd1bnNpZ25lZCBsb25nJykgdG8gcGFyYW1l
dGVyIG9mIA0KdHlwZSAnY29uc3QgdXBiX01lc3NhZ2VEZWYgKicgKGFrYSAnY29uc3Qgc3Ry
dWN0IHVwYl9NZXNzYWdlRGVmIConKSANClstV2ludC1jb252ZXJzaW9uXQ0KfCAgMTYwOSB8
ICAgICAgIHVwYl9NZXNzYWdlX0RlZXBDbG9uZShzZWxmLT5wdHIubXNnLCANCnVwYl9NZXNz
YWdlRGVmX01pbmlUYWJsZShzZWxmLT5kZWYpLA0KfCAgICAgICB8IA0KICAgICAgXn5+fn5+
fn5+DQp8IA0KL21udC9iL3lvZS9tYXN0ZXIvYnVpbGQvdG1wL3dvcmsvY29ydGV4YTcyLWNv
cnRleGE1My1jcnlwdG8teW9lLWxpbnV4L3B5dGhvbjMtcHJvdG9idWYvNC4yNC4wL3Byb3Rv
YnVmLTQuMjQuMC91cGIvcmVmbGVjdGlvbi9tZXNzYWdlX2RlZi5oOjEzODo2OTogDQpub3Rl
OiBwYXNzaW5nIGFyZ3VtZW50IHRvIHBhcmFtZXRlciAnbScgaGVyZQ0KfCAgIDEzOCB8IGNv
bnN0IHVwYl9NaW5pVGFibGUqIHVwYl9NZXNzYWdlRGVmX01pbmlUYWJsZShjb25zdCANCnVw
Yl9NZXNzYWdlRGVmKiBtKTsNCnwgICAgICAgfCANCiAgICAgIF4NCnwgcHl0aG9uL21lc3Nh
Z2UuYzoxNjExOjQ0OiBlcnJvcjogaW5jb21wYXRpYmxlIGludGVnZXIgdG8gcG9pbnRlciAN
CmNvbnZlcnNpb24gcGFzc2luZyAndWludHB0cl90JyAoYWthICd1bnNpZ25lZCBsb25nJykg
dG8gcGFyYW1ldGVyIG9mIA0KdHlwZSAnY29uc3QgdXBiX01lc3NhZ2VEZWYgKicgKGFrYSAn
Y29uc3Qgc3RydWN0IHVwYl9NZXNzYWdlRGVmIConKSANClstV2ludC1jb252ZXJzaW9uXQ0K
fCAgMTYxMSB8ICAgUHlPYmplY3QqIHJldCA9IFB5VXBiX01lc3NhZ2VfR2V0KGNsb25lLCBz
ZWxmLT5kZWYsIGFyZW5hKTsNCnwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+DQp8IHB5dGhvbi9tZXNzYWdlLmM6ODIyOjcx
OiBub3RlOiBwYXNzaW5nIGFyZ3VtZW50IHRvIHBhcmFtZXRlciAnbScgaGVyZQ0KfCAgIDgy
MiB8IFB5T2JqZWN0KiBQeVVwYl9NZXNzYWdlX0dldCh1cGJfTWVzc2FnZSogdV9tc2csIGNv
bnN0IA0KdXBiX01lc3NhZ2VEZWYqIG0sDQp8ICAgICAgIHwgDQogICAgICAgIF4NCnwgMSB3
YXJuaW5nIGFuZCAzIGVycm9ycyBnZW5lcmF0ZWQuDQp8DQoNCg0KDQo+IFNpZ25lZC1vZmYt
Ynk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgIC4uLi97
cHl0aG9uMy1wcm90b2J1Zl80LjIzLjQuYmIgPT4gcHl0aG9uMy1wcm90b2J1Zl80LjI0LjAu
YmJ9ICB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4gICByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtcHJvdG9idWZfNC4yMy40LmJiID0+IHB5dGhvbjMtcHJvdG9idWZfNC4y
NC4wLmJifSAoOTIlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHJvdG9idWZfNC4yMy40LmJiIGIvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wcm90b2J1Zl80LjI0LjAuYmIN
Cj4gc2ltaWxhcml0eSBpbmRleCA5MiUNCj4gcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wcm90b2J1Zl80LjIzLjQuYmINCj4gcmVu
YW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHJv
dG9idWZfNC4yNC4wLmJiDQo+IGluZGV4IDg0NzRhNDNkNjkuLmZkYzgwYjcwMTUgMTAwNjQ0
DQo+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHJvdG9idWZfNC4yMy40LmJiDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHJvdG9idWZfNC4yNC4wLmJiDQo+IEBAIC03LDcgKzcsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9QS0ctSU5GTztiZWdpbmxpbmU9ODtlbmRs
aW5lPTg7bWQ1PTUzZGJmYTU2ZjYxYjkwMjE1YQ0KPiAgIA0KPiAgIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMw0KPiAgIA0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gImNjZDk0MzBjMDcx
OWRjZTgwNmI5M2Y4OWM5MWRlNzk3NzMwNDcyOWU1NTM3N2Y4NzJhOTI0NjVkNTQ4MzI5YTki
DQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWQwY2ViOWRlNmUwODMxMTgzMjE2OWU2MDFk
MWZjNzFiZDhlOGM3NzlmM2VlMzhhOTdhNzg1NTQ5NDVlY2I4NSINCj4gICANCj4gICAjIGh0
dHA6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy8xODQ3MTUvDQo+
ICAgIyBDYW4ndCBmaW5kIHJlcXVpcmVkIGZpbGU6IC4uL3NyYy9nb29nbGUvcHJvdG9idWYv
ZGVzY3JpcHRvci5wcm90bw0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91
cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMDQzOTIpOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMDQzOTINCj4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAwNzcx
ODAxLzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdt
YWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------0nRqrPyzXuxfWi7q0RLrHcdr
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------0nRqrPyzXuxfWi7q0RLrHcdr--

--------------3mpDEoc0EcdYnq6LOe8Bqk2m--

--------------UhkYMTUi1A37NkJFJ0HCnnm0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZN0XHwUDAAAAAAAKCRC7BTNVkZ0zFJNI
AJ0dkLBOWgE+WZjexmQt13p7DxU6pwCeLhgCrXURpuQ4fGfgEmjyPEJgrXI=
=TwVL
-----END PGP SIGNATURE-----

--------------UhkYMTUi1A37NkJFJ0HCnnm0--

