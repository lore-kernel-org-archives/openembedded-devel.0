Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97EBC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:26:30 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.16563.1704806784911058954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=FMTn9JWa;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=U52umOZG;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 6444FC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1704806781; bh=dJisk9EpMu3H+0JW3/mNnc+/jSlysofS+4aHaXbdJL4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=FMTn9JWa7+6j1e0HykSBjg6vpvZEU+/o6DFdxsby1/q1WwB6RVGfK85pDuliOm+7O
	 JecaFIzJKatAJI0EcJ5KUXH7tkz8VMcEIbG6GdYyRwgVPmxum1O33y5ppJIiXeHjf0
	 iARlkrNoujlJrXbRF8WUQhk2GplwX/OQkC8dxSo+C8R+Fw/Jt0m/2HP0EG4fNF3nzX
	 EBMuUURxku+nUqOg0yf07sn3uKM4jAr1DcZK9oPHMPXY+6Tc7DP1wK0xlzclba2lvW
	 lN05R/PKZ4RZgjeqxvt1MZ/OiXuS+F0tzfeVeNFrweC4toMe1BLtV1QVSZ6tpPZa/P
	 B+XVoCYkJWA/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1704806781; bh=dJisk9EpMu3H+0JW3/mNnc+/jSlysofS+4aHaXbdJL4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=U52umOZG9InRH1+l2bPPCYbB7NnySwaqhpKQ//Wn921x3D7pT+zgVdhEfyg944Mut
	 GgQQCaGv8KfJFtHMWKmG4u0wM8+28xzS7zBZTv4qOo2T/ry8nLdWuYnzBQ8Hx7TKdH
	 WsZh286b9QcImJmJsEtDEH3yIP3u248XpGEk7PBWMMJxpGTpFGNN8vh4zyfH2YWX1K
	 4+qnSJkMHA6p8Wg2blKvX02+uHL/b7Tzof52DMz1l+7VZuo3OqXkLoRv9+zytU14uY
	 ORXTgkZrpNQQa9R+GBU61C6kBsfmw6BOb2j0C7uC/XELZHikg3eWJCxIKRmyjtDsuU
	 EompbXoVV0m7A==
From: Petr Chernikov <p.chernikov@yadro.com>
To: Petr Chernikov <p.chernikov@yadro.com>, "throos@amazon.de"
	<throos@amazon.de>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Topic: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Index: AQHaQvmQKaFT2fSjPEusSg0VjYA2E7DRdXFwgAACp/CAAAC5MA==
Date: Tue, 9 Jan 2024 13:26:20 +0000
Message-ID: <568fbf3b6dae4961bd2a23b435248ec1@yadro.com>
References: <20240109124350.206419-1-throos@amazon.de>
 <17A8B01D06ADC5D0.21327@lists.openembedded.org>
 <17A8B0A1D52DEE2E.21327@lists.openembedded.org>
In-Reply-To: <17A8B0A1D52DEE2E.21327@lists.openembedded.org>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108192

U29ycnksIHR5cG8sIG9uIHRoZSBtYXN0ZXIgYnJhbmNoDQoNClJlZ2FyZHMNClBldGUNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gT24gQmVoYWxmIE9mIFBldHIgQ2hlcm5pa292DQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDks
IDIwMjQgNDoyNCBQTQ0KVG86IFBldHIgQ2hlcm5pa292IDxwLmNoZXJuaWtvdkB5YWRyby5jb20+
OyB0aHJvb3NAYW1hem9uLmRlOyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW1BBVENIXSBhYnNlaWwtY3BwOiByZWFkZCB1c2Ugb2Yg
LXN0ZD1jKysxNA0KDQpBbHNvIEknbSBhYmxlIHRvIGNvbXBpbGUgcHJvdG9idWYgYW5kIHByb3Rv
YnVmLW5hdGl2ZSB3aXRob3V0IGFueSBjaGFuZ2VzIG9uIG5hbmJpZWxkIGJyYW5jaA0KDQpSZWdh
cmRzDQpQZXRlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRk
ZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBQZXRyIENoZXJuaWtvdg0KU2VudDogVHVl
c2RheSwgSmFudWFyeSA5LCAyMDI0IDQ6MTUgUE0NClRvOiB0aHJvb3NAYW1hem9uLmRlOyBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0g
W1BBVENIXSBhYnNlaWwtY3BwOiByZWFkZCB1c2Ugb2YgLXN0ZD1jKysxNA0KDQpQZXJoYXBzLCBi
ZXR0ZXIgc29sdXRpb24gaXMgdG8gdXNlIGMrKzE3IGZvciBib3RoIHBhY2thZ2VzOg0KaHR0cHM6
Ly9naXRodWIuY29tL3Byb3RvY29sYnVmZmVycy9wcm90b2J1Zi9pc3N1ZXMvMTA3NjgjaXNzdWVj
b21tZW50LTE3NzMxNzU0MzkNCg0KUmVnYXJkcw0KUGV0ZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2Yg
VGhvbWFzIFJvb3MgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClNlbnQ6IFR1ZXNkYXksIEph
bnVhcnkgOSwgMjAyNCAzOjQ0IFBNDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCkNjOiBUaG9tYXMgUm9vcyA8dGhyb29zQGFtYXpvbi5kZT4NClN1YmplY3Q6
IFtvZV0gW1BBVENIXSBhYnNlaWwtY3BwOiByZWFkZCB1c2Ugb2YgLXN0ZD1jKysxNA0KDQpGcm9t
OiBUaG9tYXMgUm9vcyA8dGhyb29zQGFtYXpvbi5kZT4NCg0KUHJvdG9idWYgaXMgY29tcGlsZWQg
d2l0aCAtc3RkPWMrKzE0LCBzbyBhYnNlaWwtY3BwIG11c3QgYmUgYXMgd2VsbC4NCkRldGFpbHMg
Y2FuIGJlIGZvdW5kIGhlcmU6IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJv
dG9idWYvaXNzdWVzLzEwNzY4DQoNClNpZ25lZC1vZmYtYnk6IFRob21hcyBSb29zIDx0aHJvb3NA
YW1hem9uLmRlPg0KLS0tDQogbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fic2VpbC1jcHAvYWJz
ZWlsLWNwcF9naXQuYmIgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0K
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1j
cHBfZ2l0LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fic2VpbC1jcHAvYWJzZWlsLWNw
cF9naXQuYmINCmluZGV4IGVlNjJkNGI1OS4uMWE3MTNlMWM1IDEwMDY0NA0KLS0tIGEvbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL2Fic2VpbC1jcHAvYWJzZWlsLWNwcF9naXQuYmINCisrKyBiL21l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiDQpAQCAt
MjYsNiArMjYsNyBAQCBBU05FRURFRDpjbGFzcy1uYXRpdmVzZGsgPSAiIg0KIGluaGVyaXQgY21h
a2UNCg0KIEVYVFJBX09FQ01BS0UgPSAiLURCVUlMRF9TSEFSRURfTElCUz1PTiBcDQorICAgICAg
ICAgICAgICAgICAtRENNQUtFX0NYWF9TVEFOREFSRD0xNCBcDQogICAgICAgICAgICAgICAgICAt
REJVSUxEX1RFU1RJTkc9T0ZGICAgIFwNCiAgICAgICAgICAgICAgICAgIC1EQUJTTF9FTkFCTEVf
SU5TVEFMTD1PTiBcDQogICAgICAgICAgICAgICAgICINCi0tDQoyLjM0LjENCg0KDQoNCg0KQW1h
em9uIFdlYiBTZXJ2aWNlcyBFTUVBIFNBUkwNCjM4IGF2ZW51ZSBKb2huIEYuIEtlbm5lZHksIEwt
MTg1NSBMdXhlbWJvdXJnIFNpdHogZGVyIEdlc2VsbHNjaGFmdDogTC0xODU1IEx1eGVtYnVyZyBl
aW5nZXRyYWdlbiBpbSBMdXhlbWJ1cmdpc2NoZW4gSGFuZGVsc3JlZ2lzdGVyIHVudGVyIFIuQy5T
LiBCMTg2Mjg0DQoNCkFtYXpvbiBXZWIgU2VydmljZXMgRU1FQSBTQVJMLCBOaWVkZXJsYXNzdW5n
IERldXRzY2hsYW5kIE1hcmNlbC1CcmV1ZXItU3RyLiAxMiwgRC04MDgwNyBNdWVuY2hlbiBTaXR6
IGRlciBad2VpZ25pZWRlcmxhc3N1bmc6IE11ZW5jaGVuIGVpbmdldHJhZ2VuIGltIEhhbmRlbHNy
ZWdpc3RlciBkZXMgQW10c2dlcmljaHRzIE11ZW5jaGVuIHVudGVyIEhSQiAyNDIyNDAsIFVTdC1J
RCBERTMxNzAxMzA5NA0KDQoNCg0KDQo=

