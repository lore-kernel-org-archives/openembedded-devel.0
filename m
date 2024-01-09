Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C41C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:15:00 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.16370.1704806095461322204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:14:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=Oqwaj8Bg;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=lJ7/5q0O;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com D95ABC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1704806091; bh=BGJHTgTrtoPnWD4JeUYPdJfEJAIylXe4AVDkhMl4w2E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=Oqwaj8BgSLI8DGww2HaJTAtop7TY4pb+YhiRpnNh4y38TeQbLxaSOoxC1OWB/2sNf
	 A22rUhv0+3bkib7LFofnopGbT5LdHeSOPu8T3evPgMtluMEs4FBtRkhBLnYYA2U4e/
	 rr4U1LNXWbPe88H+x88B4q6xLXgyvwT21kQ7Z4cCjvxAmcs1BmDdCISQ7oUgAwWg24
	 XkLLSsPAggPiVToHmqHMiqln4T7c+EH+HWRsn46XVauAZqW8CVHKoIkjp1SYrRHUxm
	 xKs4s2zlkzQOkPDsSLfOlSB63iWWiCKQQ6OXhY1v1Ng5NwjrmCsgSuAfQTlmRU98as
	 w1ZZHVZxuwGvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1704806091; bh=BGJHTgTrtoPnWD4JeUYPdJfEJAIylXe4AVDkhMl4w2E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=lJ7/5q0OepJT0595YNopTtEMPCj53oEvpK0BhsEjPK38DOhaZZER+q8pEuoy4YDHV
	 bcjzVBWKDnLCdZ9oP4XkwkbB4/pT2nTwds7kbKnIPtG/1/K18E9ilROwUhsvEHdtxV
	 wJptf/oYtn1PZ9WQC2mQM8NJiT/4ex1S9hrEvYS+r40U6/M9Rt71QE8FGyVYln9bdS
	 pb/byjjUKbJXsjuwRAsQX3i8nn9pEyVBmlGyJHLWYmtjt1r9V/D5VXTqQFDeFu7mPM
	 rdnfWEtv557rFw4o5R9/lKHqzvOGA8oPSrTQEnmGguoT+vFo1dAE8LKs6ZFO8ucxKe
	 QGwXnRx5TkcAA==
From: Petr Chernikov <p.chernikov@yadro.com>
To: "throos@amazon.de" <throos@amazon.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Topic: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Index: AQHaQvmQKaFT2fSjPEusSg0VjYA2E7DRdXFw
Date: Tue, 9 Jan 2024 13:14:50 +0000
Message-ID: <ef51d077705d4eee96737ba74262bc07@yadro.com>
References: <20240109124350.206419-1-throos@amazon.de>
In-Reply-To: <20240109124350.206419-1-throos@amazon.de>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108190

UGVyaGFwcywgYmV0dGVyIHNvbHV0aW9uIGlzIHRvIHVzZSBjKysxNyBmb3IgYm90aCBwYWNrYWdl
czoNCmh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJvdG9idWYvaXNzdWVzLzEw
NzY4I2lzc3VlY29tbWVudC0xNzczMTc1NDM5DQoNClJlZ2FyZHMNClBldGUNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24g
QmVoYWxmIE9mIFRob21hcyBSb29zIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTZW50OiBU
dWVzZGF5LCBKYW51YXJ5IDksIDIwMjQgMzo0NCBQTQ0KVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogVGhvbWFzIFJvb3MgPHRocm9vc0BhbWF6b24uZGU+
DQpTdWJqZWN0OiBbb2VdIFtQQVRDSF0gYWJzZWlsLWNwcDogcmVhZGQgdXNlIG9mIC1zdGQ9Yysr
MTQNCg0KRnJvbTogVGhvbWFzIFJvb3MgPHRocm9vc0BhbWF6b24uZGU+DQoNClByb3RvYnVmIGlz
IGNvbXBpbGVkIHdpdGggLXN0ZD1jKysxNCwgc28gYWJzZWlsLWNwcCBtdXN0IGJlIGFzIHdlbGwu
DQpEZXRhaWxzIGNhbiBiZSBmb3VuZCBoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vcHJvdG9jb2xi
dWZmZXJzL3Byb3RvYnVmL2lzc3Vlcy8xMDc2OA0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUm9v
cyA8dGhyb29zQGFtYXpvbi5kZT4NCi0tLQ0KIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNl
aWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvYWJzZWlsLWNw
cC9hYnNlaWwtY3BwX2dpdC5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3Bw
L2Fic2VpbC1jcHBfZ2l0LmJiDQppbmRleCBlZTYyZDRiNTkuLjFhNzEzZTFjNSAxMDA2NDQNCi0t
LSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJi
DQorKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvYWJzZWlsLWNwcC9hYnNlaWwtY3BwX2dp
dC5iYg0KQEAgLTI2LDYgKzI2LDcgQEAgQVNORUVERUQ6Y2xhc3MtbmF0aXZlc2RrID0gIiINCiBp
bmhlcml0IGNtYWtlDQoNCiBFWFRSQV9PRUNNQUtFID0gIi1EQlVJTERfU0hBUkVEX0xJQlM9T04g
XA0KKyAgICAgICAgICAgICAgICAgLURDTUFLRV9DWFhfU1RBTkRBUkQ9MTQgXA0KICAgICAgICAg
ICAgICAgICAgLURCVUlMRF9URVNUSU5HPU9GRiAgICBcDQogICAgICAgICAgICAgICAgICAtREFC
U0xfRU5BQkxFX0lOU1RBTEw9T04gXA0KICAgICAgICAgICAgICAgICAiDQotLQ0KMi4zNC4xDQoN
Cg0KDQoNCkFtYXpvbiBXZWIgU2VydmljZXMgRU1FQSBTQVJMDQozOCBhdmVudWUgSm9obiBGLiBL
ZW5uZWR5LCBMLTE4NTUgTHV4ZW1ib3VyZyBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IEwtMTg1NSBM
dXhlbWJ1cmcgZWluZ2V0cmFnZW4gaW0gTHV4ZW1idXJnaXNjaGVuIEhhbmRlbHNyZWdpc3RlciB1
bnRlciBSLkMuUy4gQjE4NjI4NA0KDQpBbWF6b24gV2ViIFNlcnZpY2VzIEVNRUEgU0FSTCwgTmll
ZGVybGFzc3VuZyBEZXV0c2NobGFuZCBNYXJjZWwtQnJldWVyLVN0ci4gMTIsIEQtODA4MDcgTXVl
bmNoZW4gU2l0eiBkZXIgWndlaWduaWVkZXJsYXNzdW5nOiBNdWVuY2hlbiBlaW5nZXRyYWdlbiBp
bSBIYW5kZWxzcmVnaXN0ZXIgZGVzIEFtdHNnZXJpY2h0cyBNdWVuY2hlbiB1bnRlciBIUkIgMjQy
MjQwLCBVU3QtSUQgREUzMTcwMTMwOTQNCg0KDQoNCg0K

