Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.147])
	by mail.openembedded.org (Postfix) with ESMTP id 35AB060196
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 13:16:06 +0000 (UTC)
Received: from [85.158.139.51:52489] by server-11.bemta-5.messagelabs.com id
	EC/52-30804-7123A635; Wed, 07 May 2014 13:16:07 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-6.tower-180.messagelabs.com!1399468564!26653837!3
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5918 invoked from network); 7 May 2014 13:16:06 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s037.Technology.local)
	(89.206.228.155)
	by server-6.tower-180.messagelabs.com with RC4-SHA encrypted SMTP;
	7 May 2014 13:16:06 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s037.Technology.local ([10.234.1.39]) with mapi; Wed, 7 May 2014
	14:16:05 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 7 May 2014 14:16:04 +0100
Thread-Topic: Subject: [PATCH] bitbake/fetch2: Fix refetch of local files
	when they are read only
Thread-Index: Ac9p9nGZGUdZPmPGR62aJxJGoOxFpQ==
Message-ID: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC7@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Subject: [PATCH] bitbake/fetch2: Fix refetch of local files when they are read only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 13:16:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbSAyODBmZjI0ZjU5N2U1Y2Y2NjNjNzZmYTkwMjUwY2NlMjI5YzZhYWM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogTmljayBMZXdpcyA8bmljay5sZXdpc0B1c2EuZzRzLmNvbT4N
CkRhdGU6IFdlZCwgNyBNYXkgMjAxNCAxNDowMjoyNSArMDEwMA0KU3ViamVjdDogW1BBVENIXSBG
aXggcmVmZXRjaCBvZiBsb2NhbCBmaWxlcyB3aGVuIHRoZXkgYXJlIHJlYWQgb25seQ0KDQpTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIExld2lzIDxuaWNrLmxld2lzQHVzYS5nNHMuY29tPg0KLS0tDQogYml0
YmFrZS9saWIvYmIvZmV0Y2gyL19faW5pdF9fLnB5IHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2JpdGJha2Uv
bGliL2JiL2ZldGNoMi9fX2luaXRfXy5weSBiL2JpdGJha2UvbGliL2JiL2ZldGNoMi9fX2luaXRf
Xy5weQ0KaW5kZXggNWE5YzcyZi4uZjU3MWZjNCAxMDA2NDQNCi0tLSBhL2JpdGJha2UvbGliL2Ji
L2ZldGNoMi9fX2luaXRfXy5weQ0KKysrIGIvYml0YmFrZS9saWIvYmIvZmV0Y2gyL19faW5pdF9f
LnB5DQpAQCAtMTI1MSw3ICsxMjUxLDcgQEAgY2xhc3MgRmV0Y2hNZXRob2Qob2JqZWN0KToNCiAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXN0ZGlyID0gZGVzdGRpci5zdHJpcCgnLycpDQogICAg
ICAgICAgICAgICAgICAgICBpZiBkZXN0ZGlyICE9ICIuIiBhbmQgbm90IG9zLmFjY2VzcygiJXMv
JXMiICUgKHJvb3RkaXIsIGRlc3RkaXIpLCBvcy5GX09LKToNCiAgICAgICAgICAgICAgICAgICAg
ICAgICBvcy5tYWtlZGlycygiJXMvJXMiICUgKHJvb3RkaXIsIGRlc3RkaXIpKQ0KLSAgICAgICAg
ICAgICAgICAgICAgY21kID0gJ2NwIC1wUFIgJXMgJXMvJXMvJyAlIChmaWxlLCByb290ZGlyLCBk
ZXN0ZGlyKQ0KKyAgICAgICAgICAgICAgICAgICAgY21kID0gJ2NwIC1mcFBSICVzICVzLyVzLycg
JSAoZmlsZSwgcm9vdGRpciwgZGVzdGRpcikNCiAgICAgICAgICAgICAgICAgICAgICNjbWQgPSAn
dGFyIC1jZiAtIC1DICIlZCIgLXBzIC4gfCB0YXIgLXhmIC0gLUMgIiVzLyVzLyInICUgKGZpbGUs
IHJvb3RkaXIsIGRlc3RkaXIpDQogICAgICAgICAgICAgICAgIGVsc2U6DQogICAgICAgICAgICAg
ICAgICAgICAjIFRoZSAiZGVzdGRpciIgaGFuZGxpbmcgd2FzIHNwZWNpZmljYWxseSBkb25lIGZv
ciBGSUxFU1BBVEgNCkBAIC0xMjYxLDcgKzEyNjEsNyBAQCBjbGFzcyBGZXRjaE1ldGhvZChvYmpl
Y3QpOg0KICAgICAgICAgICAgICAgICAgICAgZWxzZToNCiAgICAgICAgICAgICAgICAgICAgICAg
IGRlc3RkaXIgPSAiLiINCiAgICAgICAgICAgICAgICAgICAgIGJiLnV0aWxzLm1rZGlyaGllcigi
JXMvJXMiICUgKHJvb3RkaXIsIGRlc3RkaXIpKQ0KLSAgICAgICAgICAgICAgICAgICAgY21kID0g
J2NwICVzICVzLyVzLycgJSAoZmlsZSwgcm9vdGRpciwgZGVzdGRpcikNCisgICAgICAgICAgICAg
ICAgICAgIGNtZCA9ICdjcCAtZiAlcyAlcy8lcy8nICUgKGZpbGUsIHJvb3RkaXIsIGRlc3RkaXIp
DQoNCiAgICAgICAgIGlmIG5vdCBjbWQ6DQogICAgICAgICAgICAgcmV0dXJuDQotLQ0KMS45LjEN
Cg0KDQpOaWNrIExld2lzDQpuaWNrLmxld2lzQHVzYS5nNHMuY29tDQorNDQgMTY4NCAyNzcxMzcN
Cnd3dy5nNHN0ZWNobm9sb2d5LmNvbQ0KTmV3IENoYWxsZW5nZSBIb3VzZSwgSW50ZXJuYXRpb25h
bCBEcml2ZSwgVGV3a2VzYnVyeSwgR2xvdWNlc3RlcnNoaXJlLCBHTDIwIDhVUSwgVUsNCg0K74GQ
IFBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZW1h
aWwNCg0KDQpUaGUgZGV0YWlscyBvZiB0aGlzIGNvbXBhbnkgYXJlIGFzIGZvbGxvd3M6DQpHNFMg
VGVjaG5vbG9neSBMaW1pdGVkLCBSZWdpc3RlcmVkIE9mZmljZTogQ2hhbGxlbmdlIEhvdXNlLCBJ
bnRlcm5hdGlvbmFsIERyaXZlLCBUZXdrZXNidXJ5LCBHbG91Y2VzdGVyc2hpcmUgR0wyMCA4VVEs
IFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCBOby4gMjM4MjMzOC4NCg0KVGhpcyBjb21tdW5pY2F0aW9u
IG1heSBjb250YWluIGluZm9ybWF0aW9uIHdoaWNoIGlzIGNvbmZpZGVudGlhbCwgcGVyc29uYWwg
YW5kL29yIHByaXZpbGVnZWQuDQoNCkl0IGlzIGZvciB0aGUgZXhjbHVzaXZlIHVzZSBvZiB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50KHMpLg0KSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lw
aWVudChzKSwgcGxlYXNlIG5vdGUgdGhhdCBhbnkgZGlzdHJpYnV0aW9uLCBmb3J3YXJkaW5nLCBj
b3B5aW5nIG9yIHVzZSBvZiB0aGlzIGNvbW11bmljYXRpb24gb3IgdGhlIGluZm9ybWF0aW9uIGlu
IGl0IGlzIHN0cmljdGx5IHByb2hpYml0ZWQuDQoNCkFueSBwZXJzb25hbCB2aWV3cyBleHByZXNz
ZWQgaW4gdGhpcyBlLW1haWwgYXJlIHRob3NlIG9mIHRoZSBpbmRpdmlkdWFsIHNlbmRlciBhbmQg
dGhlIGNvbXBhbnkgZG9lcyBub3QgZW5kb3JzZSBvciBhY2NlcHQgcmVzcG9uc2liaWxpdHkgZm9y
IHRoZW0uDQoNClByaW9yIHRvIHRha2luZyBhbnkgYWN0aW9uIGJhc2VkIHVwb24gdGhpcyBlLW1h
aWwgbWVzc2FnZSwgeW91IHNob3VsZCBzZWVrIGFwcHJvcHJpYXRlIGNvbmZpcm1hdGlvbiBvZiBp
dHMgYXV0aGVudGljaXR5Lg0KDQpUaGlzIGUtbWFpbCBoYXMgYmVlbiBzY2FubmVkIGZvciBhbGwg
dmlydXNlcyBieSBNZXNzYWdlTGFicy4NCg==

