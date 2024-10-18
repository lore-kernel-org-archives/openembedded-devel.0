Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59381D3001C
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 16:19:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.26240.1729268370499926665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 09:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDGDBRpv;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e6cec7227so1864886b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729268370; x=1729873170; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6IgIbO+/SVvIrQhUeuGDbmw3ITtdTE7f+BIWXRjyR4Y=;
        b=JDGDBRpvZ8wi7jHB3W05/ONE1q4bup7DhdNN/F4yliws3EYppeA/mnp2oggnmsfNY+
         Wnqltflv/Xz8Ax/nVUOqkgi8ugTXThkC5d/kM2adpbOqkzwYY2i9i1EzqH7J+YoYdOhY
         UrawgpHBDkF74XcgPiFBfJYPtCPKOL+ys7y0NoF3bvlbRmjNI/nBYtCbQ80LjAfurKXz
         vu6OUm2jt8IyToSP1o4VsMuJT9yp8HzTiuPtv0mNoty2XZdd5d4BsDDdeu8eCRC7yWHk
         sIBKEcGRmkcxVqeNo+4/LR3NGwxw7qyHIbJG/hp9eYDm5gYnVk3lmDXP7/lb2LePSd0k
         D3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268370; x=1729873170;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6IgIbO+/SVvIrQhUeuGDbmw3ITtdTE7f+BIWXRjyR4Y=;
        b=v0igfGcKOte7LvuFKFR3xU81zpI6sH+0jRvbf4Svcxb/UvuHDzMDWI3/uj8n/Xbdjs
         1ej4HEOL4ZeTaBVEYVuj7+IpI4Mz9eblhF/Wi4BFb6VkTzu5ioYm+Pa0AINQepEKARuF
         RLlCnEpi9cRW8KOBZWHLfAqau6Le6E18Q586OT0kf7DfYCphBthFDOxHlPKbY/kxkwIL
         gCgZ4SpcdYc4Y7ekBwx9guuUOiJ0nRXM5mtXsIVqH4XHIIjEiDbODgSVxPcp71rZinLW
         993QJVEm1WDuj58YQwpYAcQ1UqNV2i9SRr3MkOdfd6DLQA9adaU9hS5dFNFh8PPpVxZh
         CPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsM24yNCZtNc5bMCHnQYmpo4hsP/9dwJuImmA0gTy6fUNYLAvKS9HT4EvRUQXIPu/SRjag+UB/W0ltNOnc2mxfSa0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YytSdy3paZyJSZ7Gm3fOJh7vxJQ2PF6hp8eMWZkUw8JuG3cMgFo
	hKetmT22R14fQ62NvPfRYB8ohMALQWqvkATFLeAzKH6PX9aFQinI
X-Google-Smtp-Source: AGHT+IEwnS+BVlahjnJtKRb2oq9kcu72rQ9vt5ZLF1qlezagd86gJo4Ta3K7hwhX26kWfQaq5/sNyw==
X-Received: by 2002:a05:6a00:2ea4:b0:71e:6122:5912 with SMTP id d2e1a72fcca58-71ea313fc01mr4293186b3a.10.1729268369684;
        Fri, 18 Oct 2024 09:19:29 -0700 (PDT)
Received: from ?IPV6:2601:646:9d80:4380:116f:c3c5:1068:53d4? ([2601:646:9d80:4380:116f:c3c5:1068:53d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea333eb18sm1637685b3a.70.2024.10.18.09.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 09:19:29 -0700 (PDT)
Message-ID: <04d036cc-2101-4269-82f4-4cd8d770dfca@gmail.com>
Date: Fri, 18 Oct 2024 09:19:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vg2d1RS6zRO9tzHUUdGpJpMf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 16:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112983

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vg2d1RS6zRO9tzHUUdGpJpMf
Content-Type: multipart/mixed; boundary="------------ZTshjv105ZPzrQekAxhZc7Iw";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
Message-ID: <04d036cc-2101-4269-82f4-4cd8d770dfca@gmail.com>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
In-Reply-To: <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>

--------------ZTshjv105ZPzrQekAxhZc7Iw
Content-Type: multipart/mixed; boundary="------------zzaLfq7FJyRK7Plr700Kxb5t"

--------------zzaLfq7FJyRK7Plr700Kxb5t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTgvMjQgMTI6MTggQU0sIENoYW5oIE5ndXllbiB3cm90ZToNCj4gSGkgS2hlbSBS
YWosDQo+IA0KPiBGb2xsb3cgdGhlIGVycm9yIGxvZywgSSB0cmllZCB0byB1c2UgdGhlIG11
c2wgY3Jvc3MgY29tcGlsZXIgKGh0dHBzOi8vIA0KPiBtdXNsLmNjLykgdG8gY29tcGlsZXIg
aHR0cHM6Ly9naXRodWIuY29tL0NvZGVDb25zdHJ1Y3QvbWN0cCBhbmQgcmVwb3J0IA0KPiBl
cnJvciB0byBtY3RwIG1haW50YWluZXIuIEplcmVteSBmaXhlZCB0aGlzIGVycm9yIGJ5IGNv
bW1pdCBodHRwczovLyANCj4gZ2l0aHViLmNvbS9Db2RlQ29uc3RydWN0L21jdHAvIA0KPiBj
b21taXQvMDYyOWVjODk3NmIxZDU2YzE3ZGI1MTgwNWY2NDdiZjM1ZjRiZmQzYg0KPiANCj4g
Tm93IEknbGwgcHVzaCB0aGUgcGF0Y2ggdjMgd2l0aCBsYXRlc3QgY29tbWl0IGZyb20gbWN0
cCByZXBvLg0KDQpUaGFua3MgZm9yIGZvbGxvd2luZyB1cC4NCg0KPiANCj4gS2hlbSBSYWos
IEhvdyBjYW4gSSBydW4gQ0kgb24gbWV0YS1vcGVuZW1iZWRkZWQgbWFudWFsbHk/IEkgd291
bGQgbGlrZSANCj4gdG8gdmVyaWZ5IGVycm9ycyBmcm9tIENJIGZhaWxlZCBiZWZvcmUgcHVz
aCBwYXRjaC4gVGhhdCB3aWxsIGhlbHAgdXMgDQo+IHdvcmsgb24gdGhlIHBhdGNoIHF1aWNr
bHkuDQo+IA0KDQpXZSBkbyBub3QgaGF2ZSBDSSBpbmZyYXN0cnVjdHVyZSB0aGF0IGlzIGF2
YWlsYWJsZSBmb3IgZGV2ZWxvcGVycyB2aWENCmdpdGh1YiBwdWxsIHJlcXVlc3RzIG9yIHNv
bWUgc3VjaCwgcHJvY2VzcyBpcyBmb3IgbWFpbnRhaW5lcnMgdG8gDQpjaGVycnktcGljayBw
YXRjaGVzIGFuZCBwcmVwYXJlIGEgc3RhZ2luZyBicmFuY2ggKCBtYXN0ZXItbmV4dCApIHdo
aWNoIA0KaXMgdGhlbg0KdXNlZCBmb3IgQ0ksIEkgdXNlIHlvZSBkaXN0cm8gaHR0cHM6Ly9n
aXRodWIuY29tL1lvZURpc3Ryby95b2UtZGlzdHJvDQpmb3IgQ0knaW5nIG1ldGEtb3BlbmVt
YmVkZGVkICggdXNpbmcgeW9lL211dCBicmFuY2gpIGJ5IGRvaW5nDQpidW5jaCBvZiBkaWZm
ZXJlbnQgYnVpbGQgY29tYmluYXRpb25zLCBhbG9uZyB3aXRoIGdpdGh1YiBhY3Rpb25zDQpo
dHRwczovL2dpdGh1Yi5jb20vWW9lRGlzdHJvL3lvZS1kaXN0cm8vYmxvYi9tYXN0ZXIvLmdp
dGh1Yi93b3JrZmxvd3MvY2kueWFtbA0KDQpiaXRiYWtlIC1rIHdvcmxkIGZvciANCnFlbXVh
cm0vcWVtdWFybTY0L3FlbXV4ODYtNjQvcWVtdXJpc2N2MzIvcWVtdXJpc2N2NjQgbWFjaGlu
ZXMNCndpdGggVENMSUJDID0gbXVzbCBhbmQgVENMSUJDID0gZ2xpYmMNCg0KVGhlc2UgY29t
YmluYXRpb25zIGNhbiBleHBsb2RlLCBhbmQgSSBkbyBub3QgaGF2ZSBlbm91Z2ggYnVpbGQg
Y2FwYWNpdHkNCnRvIGRvIG1vcmUuDQoNClRoZXJlIGlzIGFsc28gb25lIGJ1aWxkIChxZW11
eDg2LTY0KSBpbiB5b2N0byBhdXRvYnVpbGRlciB3aGljaCBpcyBydW4gDQpvbiBzdWJzZXQg
b2YgbWV0YS1vcGVuZW1iZWRkZWQgbGF5ZXJzLg0KDQpodHRwczovL3ZhbGt5cmllLnlvY3Rv
cHJvamVjdC5vcmcvIy9idWlsZGVycy84MQ0KDQpJIHRoaW5rIGlmIHlvdSBidWlsZCBmb3Ig
bXVzbC9nbGliYy9xZW11eDg2LTY0IHRoYXQgd291bGQgYmUgYSBnb29kIHN0YXJ0DQoNCg0K
DQo+IFRoYW5rcywNCj4gQ2hhbmgNCj4gDQo+IA0KPiBPbiAxOC8xMC8yMDI0IDAzOjQ2LCBL
aGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IG9rLCBub3cg
aXQgZmFpbHMgZm9yIG11c2wgdGFyZ2V0IHNlZQ0KPj4NCj4+IGh0dHBzOi8vZXJyb3JzLnlv
Y3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvODA5ODAyLw0KPj4NCj4+IG1heWJlIHlv
dSBuZWVkIHRvIGluY2x1ZGUgbGludXgvc29ja2V0LmggdG8gZ2V0IEFGX01DVFAgYWRkcmVz
cyBmYW1pbHkNCj4+IGRlZmluaXRpb24NCj4+DQo+PiBPbiBXZWQsIE9jdCAxNiwgMjAyNCBh
dCAxMTozNuKAr1BNIENoYW5oIE5ndXllbg0KPj4gPGNoYW5oQG9zLmFtcGVyZWNvbXB1dGlu
Zy5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbmggTmd1eWVuIDxj
aGFuaEBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5nZSBpbiB2
MjoNCj4+PiDCoMKgIC0gRml4IENJIGZhaWxlZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW0NoYW5oXQ0KPj4+IC0tLQ0KPj4+
IMKgIC4uLi9yZWNpcGVzLXN1cHBvcnQvbWN0cC97bWN0cF8xLjEuYmIgPT4gbWN0cF8yLjAu
YmJ9wqDCoMKgwqDCoMKgIHwgNiArKysrKy0NCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4gwqAgcmVuYW1lIG1ldGEtbmV0d29y
a2luZy9yZWNpcGVzLXN1cHBvcnQvbWN0cC97bWN0cF8xLjEuYmIgPT4gDQo+Pj4gbWN0cF8y
LjAuYmJ9ICg5MyUpDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtc3VwcG9ydC9tY3RwL21jdHBfMS4xLmJiIGIvbWV0YS0gDQo+Pj4gbmV0d29ya2lu
Zy9yZWNpcGVzLXN1cHBvcnQvbWN0cC9tY3RwXzIuMC5iYg0KPj4+IHNpbWlsYXJpdHkgaW5k
ZXggOTMlDQo+Pj4gcmVuYW1lIGZyb20gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9y
dC9tY3RwL21jdHBfMS4xLmJiDQo+Pj4gcmVuYW1lIHRvIG1ldGEtbmV0d29ya2luZy9yZWNp
cGVzLXN1cHBvcnQvbWN0cC9tY3RwXzIuMC5iYg0KPj4+IGluZGV4IGJmMzk2MWJlNC4uNjIw
NDRlMDA3IDEwMDY0NA0KPj4+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBv
cnQvbWN0cC9tY3RwXzEuMS5iYg0KPj4+ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVz
LXN1cHBvcnQvbWN0cC9tY3RwXzIuMC5iYg0KPj4+IEBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSINCj4+Pg0KPj4+IMKgIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovLyANCj4+PiBMSUNFTlNFO21kNT00Y2M5MTg1NmIwOGIwOTRiNGY0MDZhMjlkYzYxZGIy
MSINCj4+Pg0KPj4+IC1TUkNSRVYgPSAiYTU5MWFkODg1YWEyOGYxMTNjYjQ1ODcwYjJmZDVi
Y2U0ODM3OGQ2ZiINCj4+PiArU1JDUkVWID0gIjk5ODY4NjJmODhmZDZlNmNhNzVlMmEyOTIz
NmNmMzMyZDY0MGU2MDAiDQo+Pj4NCj4+PiDCoCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vQ29kZUNvbnN0cnVjdC8gDQo+Pj4gbWN0cDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRw
cyINCj4+Pg0KPj4+IEBAIC0xMyw2ICsxMywxMCBAQCBTID0gIiR7V09SS0RJUn0vZ2l0Ig0K
Pj4+DQo+Pj4gwqAgaW5oZXJpdCBtZXNvbiBwa2djb25maWcgc3lzdGVtZA0KPj4+DQo+Pj4g
K0VYVFJBX09FTUVTT04gPSAiIFwNCj4+PiArwqDCoMKgIC1EdGVzdHM9ZmFsc2UgXA0KPj4+
ICsiDQo+Pj4gKw0KPj4+IMKgIFBBQ0tBR0VDT05GSUcgPz89ICIgXA0KPj4+IMKgwqDCoMKg
wqAgJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsIGQp
fSBcDQo+Pj4gwqAgIg0KPj4+IC0tIA0KPj4+IDIuNDMuMA0KPj4+DQo+Pj4NCj4+Pg0KPj4+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBt
ZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+Pj4gVmlldy9SZXBseSBPbmxpbmUgKCMx
MTI5NzApOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy8gDQo+Pj4gb3BlbmVt
YmVkZGVkLWRldmVsL21lc3NhZ2UvMTEyOTcwDQo+Pj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA5MDU5MzMyLzkwMjcyMzENCj4+PiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4+PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsLyANCj4+PiB1bnN1YiBbY2hhbmhAb3MuYW1wZXJlY29t
cHV0aW5nLmNvbV0NCj4+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4+DQo+IA0K
--------------zzaLfq7FJyRK7Plr700Kxb5t
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------zzaLfq7FJyRK7Plr700Kxb5t--

--------------ZTshjv105ZPzrQekAxhZc7Iw--

--------------vg2d1RS6zRO9tzHUUdGpJpMf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZxKKjwUDAAAAAAAKCRC7BTNVkZ0zFFTy
AJ41oXLC2SAfkPp6KzUCD/J9A8pB0QCfWE2EBf3yu8D79G8QOCGgbLr3SfM=
=q90k
-----END PGP SIGNATURE-----

--------------vg2d1RS6zRO9tzHUUdGpJpMf--

