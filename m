Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B412BC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 22:14:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.4143.1664230492358622838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 15:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XCzgb/3x;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id iw17so7525705plb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=eMeR6PzxLi3i7pDdQk4curDhAC2TPZkg2lp5LdWBUOY=;
        b=XCzgb/3xl3IN+w3smyhUforcroQONApTY+mf5ZStxm4Qo9wZg4dtg4yLbSGfQ/S3K6
         pZ6cROWVx8sqVWyCyzq0B0mJafYZYDUgX70KqIx4ag+oKU2uA4AJXcoFc1q0OxaRGHrc
         c64bZRLRAvzZ+sKxAh6fosf0Jd73xz+hcNxJPX0TmhbplZ8J90+x/VZ59VCBPPjUi99b
         De5apObNCLInKqZEHrxl8LRbqkTy9vd2L2Iz7hgESTyPdrkUzObjKZwFcp23S7R8JifG
         FbBetikVC75SuFjswkWiloQze6vvbLsczXo5jmCpedoo1KLGocRQWSH37WvtpT36cUVI
         zsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=eMeR6PzxLi3i7pDdQk4curDhAC2TPZkg2lp5LdWBUOY=;
        b=Xh4peGf2IRTVPv3qpCvpV+cQxbgEQGw8h+8tX9/XCjXLAdyGgHgDqLY8LFpw1IKP1V
         pJXtOanOc7AqF4QKXWBKfC4qpugpxCMCkAv+qflwVhN60HqQ21Va1h74TU2n4XsFiDbu
         wsqao2pbi2wswoWLIDUAMTnfjgCj3FeLYhcM1TXVwuTjqV29c9FSL59g9IsmGk35TMD2
         upqAiDmPbakAAMa3ryRCJKAng70erc8g4eHW+EeI5NQ0hg2/wYR9bBOpcGmVbj3+H4CF
         ZZ4PMpLL9uwFbvkM24qCcAbSNzR7D+Saz4/5bdet/WHDUILwXbkK3cLRxOgU5F0MMxTR
         uEXQ==
X-Gm-Message-State: ACrzQf2F6q0J8vl22k7QZ+9wY8Xn3Dkc1qQUJ0kwMmmlTxFUkWiMe3/d
	KZW9Nm1xN090GyFq3FMJdEQ=
X-Google-Smtp-Source: 
 AMsMyM5qMN+qhXCCdQYB3+w1Y+/z/uW6fm4BWO6wuR8B5GcbPSzsHrsf6FerAC82jlELCs70NKkmOg==
X-Received: by 2002:a17:902:a707:b0:178:bd1e:e8be with SMTP id
 w7-20020a170902a70700b00178bd1ee8bemr24250648plq.167.1664230491637;
        Mon, 26 Sep 2022 15:14:51 -0700 (PDT)
Received: from ?IPV6:2601:646:9181:1cf0:18b4:2f80:6996:91e2?
 ([2601:646:9181:1cf0:18b4:2f80:6996:91e2])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a170903024500b001788ccecbf5sm6382822plh.31.2022.09.26.15.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 15:14:51 -0700 (PDT)
Message-ID: <a8c55901-06a2-8400-ce2c-4cbc5ee3da84@gmail.com>
Date: Mon, 26 Sep 2022 15:14:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 8.1.1 -> 9.1.0
Content-Language: en-US
To: wak@google.com, openembedded-devel@lists.openembedded.org
References: <20220926193424.427667-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20220926193424.427667-1-wak@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZkN5QeyLmKK0ePoWWEP13OHP"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Sep 2022 22:14:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98956

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZkN5QeyLmKK0ePoWWEP13OHP
Content-Type: multipart/mixed; boundary="------------Vucm0zY0r06SUCKMQOJ4CZRw";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: wak@google.com, openembedded-devel@lists.openembedded.org
Message-ID: <a8c55901-06a2-8400-ce2c-4cbc5ee3da84@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 8.1.1 -> 9.1.0
References: <20220926193424.427667-1-wak@google.com>
In-Reply-To: <20220926193424.427667-1-wak@google.com>

--------------Vucm0zY0r06SUCKMQOJ4CZRw
Content-Type: multipart/mixed; boundary="------------X2BhDGK7KRMhw83wTgkn4f77"

--------------X2BhDGK7KRMhw83wTgkn4f77
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yNi8yMiAxMjozNCBQTSwgV2lsbGlhbSBBLiBLZW5uaW5ndG9uIElJSSB2aWEgDQps
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFt
IEEuIEtlbm5pbmd0b24gSUlJIDx3YWtAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICAgbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvZm10L3tmbXRfOC4xLjEuYmIgPT4gZm10XzkuMS4wLmJifSB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gICByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZm10L3tmbXRfOC4xLjEu
YmIgPT4gZm10XzkuMS4wLmJifSAoOTAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2ZtdC9mbXRfOC4xLjEuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9mbXQvZm10XzkuMS4wLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggOTAlDQo+IHJlbmFt
ZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2ZtdC9mbXRfOC4xLjEuYmINCj4gcmVu
YW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2ZtdC9mbXRfOS4xLjAuYmINCj4gaW5k
ZXggYzUzZGQzODkwLi4zNDg5NjE1M2MgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L2ZtdC9mbXRfOC4xLjEuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvZm10L2ZtdF85LjEuMC5iYg0KPiBAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJN
SVQiDQo+ICAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PWFm
ODhkNzU4Zjc1ZjNjNWM0OGE5Njc1MDFmMjQzODRiIg0KPiAgIA0KPiAgIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9mbXRsaWIvZm10O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0
cHMiDQo+IC1TUkNSRVYgPSAiYjZmNGNlYWVkMGEwYTI0Y2NmNTc1ZmFiNmM1NmRkNTBjY2Y2
ZjFhOSINCj4gK1NSQ1JFViA9ICJhMzM3MDExOTZhZGZhZDc0OTE3MDQ2MDk2YmY1YTJhYTBh
YjBiYjUwIg0KPiAgIA0KPiAgIFMgPSAiJHtXT1JLRElSfS9naXQiDQoNCg0KdGhhbmtzIGZv
ciBwYXRjaCwgc2ltaWxhciBwYXRjaCBoYXMgYmVlbiBwcm9wb3NlZCBpbiBwYXN0IGFuZCBp
dCBlbmRlZCANCndpdGggYSBidWlsZCByZWdyZXNzaW9uIHNlZQ0KDQpodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS85ODUzNT9w
PSUyQyUyQyUyQzIwJTJDMCUyQzAlMkMwJTNBJTNBY3JlYXRlZCUyQzAlMkNmbXQlMkMyMCUy
QzIlMkMwJTJDOTMzMjEzNjcNCg0KY2FuIHlvdSBjaGVjayBpZiB0aGlzIHJlZ3Jlc3Npb24g
aXMgYWRkcmVzc2VkID8NCg0KPiAgIA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09
LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM5ODk1NSk6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk4OTU1DQo+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzkz
OTM1MDMxLzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25l
ckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVt
QGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------X2BhDGK7KRMhw83wTgkn4f77
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------X2BhDGK7KRMhw83wTgkn4f77--

--------------Vucm0zY0r06SUCKMQOJ4CZRw--

--------------ZkN5QeyLmKK0ePoWWEP13OHP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCYzIkWgUDAAAAAAAKCRC7BTNVkZ0zFA0S
AKCIoquRu8kvtdjGe9d5u198BPjjaQCgir43mN4K52oRhElap4fWKm/Tr7A=
=NbN5
-----END PGP SIGNATURE-----

--------------ZkN5QeyLmKK0ePoWWEP13OHP--

