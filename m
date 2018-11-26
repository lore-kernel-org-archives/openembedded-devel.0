Return-Path: <craig.mcqueen@innerrange.com>
Received: from mail.innerrange.com.au (mail.innerrange.com.au [203.222.77.226])
	by mail.openembedded.org (Postfix) with ESMTP id B45EE6C684
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 00:17:48 +0000 (UTC)
Received: from ir-mail.corp.innerrange.com.au (192.168.4.15) by
	ir-mail.corp.innerrange.com.au (192.168.4.15) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1531.3; Mon, 26 Nov 2018 11:17:48 +1100
Received: from ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f]) by
	ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f%2]) with
	mapi id 15.01.1531.007; Mon, 26 Nov 2018 11:17:48 +1100
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: Tim Orling <ticotimo@gmail.com>
Thread-Topic: [oe] [meta-python][PATCH] python3-multidict: Workaround for
	broken make clean
Thread-Index: AQHUgunqKnYBXCI0NU+5AsizSv5LfaVdapGAgAPKIhA=
Date: Mon, 26 Nov 2018 00:17:48 +0000
Message-ID: <2602acbf29484710afe90595ceb489d1@innerrange.com>
References: <20181123050302.4692-1-craig.mcqueen@innerrange.com>
	<CANx9H-Dp4ftGiwfrF1C8MoKCzd9n8O5hfd3ezqKDA14-3o+ABQ@mail.gmail.com>
In-Reply-To: <CANx9H-Dp4ftGiwfrF1C8MoKCzd9n8O5hfd3ezqKDA14-3o+ABQ@mail.gmail.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.105.91]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-multidict: Workaround for broken make clean
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2018 00:17:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGltIE9ybGluZyB3cm90ZToNCg0KT24gVGh1LCBOb3YgMjIsIDIwMTggYXQgOTowOSBQTSBDcmFp
ZyBNY1F1ZWVuIDxjcmFpZy5tY3F1ZWVuQGlubmVycmFuZ2UuY29tPG1haWx0bzpjcmFpZy5tY3F1
ZWVuQGlubmVycmFuZ2UuY29tPj4gd3JvdGU6DQpOb3RlLCB0aGUgaXNzdWUgaXMgZml4ZWQgaW4g
djQuMC4wLg0KaHR0cHM6Ly9naXRodWIuY29tL2Fpby1saWJzL211bHRpZGljdC9pc3N1ZXMvMTk0
DQoNCldoeSBub3QganVzdCB1cGdyYWRlIHJlY2lwZSB0byA0LjAuMD8NCg0KDQpXaGF0IHNvcnQg
b2YgdGVzdGluZyB3b3VsZCBJIG5lZWQgdG8gZG8gdG8gZW5zdXJlIHRoYXQgdGhlcmUgYXJlIG5v
IGNvbXBhdGliaWxpdHkgaXNzdWVzIHdpdGggYW55IG90aGVyIHB5dGhvbjMgcGFja2FnZXM/DQoN
Cg0KDQpTaWduZWQtb2ZmLWJ5OiBDcmFpZyBNY1F1ZWVuIDxjcmFpZy5tY3F1ZWVuQGlubmVycmFu
Z2UuY29tPG1haWx0bzpjcmFpZy5tY3F1ZWVuQGlubmVycmFuZ2UuY29tPj4NCi0tLQ0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW11bHRpZGljdF8zLjMuMi5iYjxodHRwOi8v
cHl0aG9uMy1tdWx0aWRpY3RfMy4zLjIuYmI+ICAgICAgICB8IDQgKysrKw0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbXVsdGlkaWN0XzMuMy4yLmJiPGh0dHA6Ly9weXRob24z
LW11bHRpZGljdF8zLjMuMi5iYj4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW11bHRpZGljdF8zLjMuMi5iYjxodHRwOi8vcHl0aG9uMy1tdWx0aWRpY3RfMy4z
LjIuYmI+DQppbmRleCA3ZjljZDU1NjQuLmU2NWQ3ZDRmMiAxMDA2NDQNCi0tLSBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbXVsdGlkaWN0XzMuMy4yLmJiPGh0
dHA6Ly9weXRob24zLW11bHRpZGljdF8zLjMuMi5iYj4NCisrKyBiL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbXVsdGlkaWN0XzMuMy4yLmJiPGh0dHA6Ly9weXRo
b24zLW11bHRpZGljdF8zLjMuMi5iYj4NCkBAIC03LDMgKzcsNyBAQCBpbmhlcml0IHB5cGkgc2V0
dXB0b29sczMNCg0KIFNSQ19VUklbbWQ1c3VtXSA9ICIwNmNhOTFkOTkzZGUyZDA0YzdlZTZkZjBj
YmI0NGVhMiINCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjgyZTYxYzc0MDhlZDBkY2UxODYyMTAw
ZGI1NTU5NTQ4MTkxMWYxNTlkNmRkZWMwYjM3NWQzNWI2NDQ5NTA5YiINCisNCisjIFdvcmstYXJv
dW5kIGZvciBicm9rZW4gbWFrZSBjbGVhbi4gTm90ZSB0aGlzIGlzIGZpeGVkIGluIHY0LjAuMC4N
CisjIGh0dHBzOi8vZ2l0aHViLmNvbS9haW8tbGlicy9tdWx0aWRpY3QvaXNzdWVzLzE5NA0KK0NM
RUFOQlJPS0VOID0gIjEiDQotLQ0KMi4xOS4xDQoNCi0tDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlz
dA0KT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8bWFpbHRvOk9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KaHR0cDovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

