Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66BBC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:24:30 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.16527.1704806667453760594
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=Uwu9zfAO;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=pU46tyix;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 6302DC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1704806664; bh=tQjwQChj7LWJtOGZjDhbxWMJPRAPGdA/vv0+zGnNgyM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=Uwu9zfAOgms0BJK5wfqTKPAABmNGRFQGPohzeg7LOsqW5/QGWFaulYlFC5XnsrHkv
	 1DwXwsjjoZIFGaP5xjqj/kkcY2NV++SLwxPBdxz8DXL1WYLMGiwKUfATDLXA6W/hI1
	 JQkV/a81/jTg3Ye0mAMiFz02FvZ2sd4tWmkcbsLPxJ0CviJCZv2BsLapHyTBlQBpvn
	 dmYAtC+kqzZy9Zr6ClNY2/RXtWrN/KT3GXkLyM3XgHejl2gnrJhjUL7mRe+DdMe56G
	 PF4qT5YcURdOgOSnT3xyBkltz4lMbLScWPqduEXqTprYahtIC1OodctsleqMTZKVVX
	 75O9I84Xf98sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1704806664; bh=tQjwQChj7LWJtOGZjDhbxWMJPRAPGdA/vv0+zGnNgyM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=pU46tyixK07dyNDO/2IqCOZLaNcV4o7riewH4ZUfnF10WA1l5FRYitR+OAEB5hN+Z
	 6W5/jS7xe8+r8Jn6NWk3paCgv4Om4A58ccYjeWZU6/bbm/LqhbA+yorqX6LD10FO5T
	 quM2DmuQ852gllhCm54YDq0+rMIegitG+7df/kxfWtcRCar1Yw5VRy1QWaAieEwSgE
	 VfO1r6b0FhXmbiA5Kra2ljIE+jKpRlJ0+XHViHKmRCSno0mcTMpcObto1q9/a6mkYR
	 B5vvbaoq6lqNBIhpSHuRtKJPZGgyXad6J3QSf/rdeV0SNTbxbG3uhe2isivD0AROxH
	 vWbpzdcJZpM6g==
From: Petr Chernikov <p.chernikov@yadro.com>
To: Petr Chernikov <p.chernikov@yadro.com>, "throos@amazon.de"
	<throos@amazon.de>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Topic: [oe] [PATCH] abseil-cpp: readd use of -std=c++14
Thread-Index: AQHaQvmQKaFT2fSjPEusSg0VjYA2E7DRdXFwgAACp/A=
Date: Tue, 9 Jan 2024 13:24:23 +0000
Message-ID: <95f7bcef1e144b96a021f33758fe53f7@yadro.com>
References: <20240109124350.206419-1-throos@amazon.de>
 <17A8B01D06ADC5D0.21327@lists.openembedded.org>
In-Reply-To: <17A8B01D06ADC5D0.21327@lists.openembedded.org>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108191

QWxzbyBJJ20gYWJsZSB0byBjb21waWxlIHByb3RvYnVmIGFuZCBwcm90b2J1Zi1uYXRpdmUgd2l0
aG91dCBhbnkgY2hhbmdlcyBvbiBuYW5iaWVsZCBicmFuY2gNCg0KUmVnYXJkcw0KUGV0ZQ0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiBPbiBCZWhhbGYgT2YgUGV0ciBDaGVybmlrb3YNClNlbnQ6IFR1ZXNkYXksIEphbnVhcnkg
OSwgMjAyNCA0OjE1IFBNDQpUbzogdGhyb29zQGFtYXpvbi5kZTsgb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFtQQVRDSF0gYWJzZWls
LWNwcDogcmVhZGQgdXNlIG9mIC1zdGQ9YysrMTQNCg0KUGVyaGFwcywgYmV0dGVyIHNvbHV0aW9u
IGlzIHRvIHVzZSBjKysxNyBmb3IgYm90aCBwYWNrYWdlczoNCmh0dHBzOi8vZ2l0aHViLmNvbS9w
cm90b2NvbGJ1ZmZlcnMvcHJvdG9idWYvaXNzdWVzLzEwNzY4I2lzc3VlY29tbWVudC0xNzczMTc1
NDM5DQoNClJlZ2FyZHMNClBldGUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFRob21hcyBSb29zIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDksIDIwMjQg
Mzo0NCBQTQ0KVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpD
YzogVGhvbWFzIFJvb3MgPHRocm9vc0BhbWF6b24uZGU+DQpTdWJqZWN0OiBbb2VdIFtQQVRDSF0g
YWJzZWlsLWNwcDogcmVhZGQgdXNlIG9mIC1zdGQ9YysrMTQNCg0KRnJvbTogVGhvbWFzIFJvb3Mg
PHRocm9vc0BhbWF6b24uZGU+DQoNClByb3RvYnVmIGlzIGNvbXBpbGVkIHdpdGggLXN0ZD1jKysx
NCwgc28gYWJzZWlsLWNwcCBtdXN0IGJlIGFzIHdlbGwuDQpEZXRhaWxzIGNhbiBiZSBmb3VuZCBo
ZXJlOiBodHRwczovL2dpdGh1Yi5jb20vcHJvdG9jb2xidWZmZXJzL3Byb3RvYnVmL2lzc3Vlcy8x
MDc2OA0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUm9vcyA8dGhyb29zQGFtYXpvbi5kZT4NCi0t
LQ0KIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJi
IHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvYWJzZWlsLWNwcC9hYnNlaWwtY3BwX2dpdC5iYiBiL21l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiDQppbmRl
eCBlZTYyZDRiNTkuLjFhNzEzZTFjNSAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiDQorKysgYi9tZXRhLW9lL3JlY2lwZXMt
ZGV2dG9vbHMvYWJzZWlsLWNwcC9hYnNlaWwtY3BwX2dpdC5iYg0KQEAgLTI2LDYgKzI2LDcgQEAg
QVNORUVERUQ6Y2xhc3MtbmF0aXZlc2RrID0gIiINCiBpbmhlcml0IGNtYWtlDQoNCiBFWFRSQV9P
RUNNQUtFID0gIi1EQlVJTERfU0hBUkVEX0xJQlM9T04gXA0KKyAgICAgICAgICAgICAgICAgLURD
TUFLRV9DWFhfU1RBTkRBUkQ9MTQgXA0KICAgICAgICAgICAgICAgICAgLURCVUlMRF9URVNUSU5H
PU9GRiAgICBcDQogICAgICAgICAgICAgICAgICAtREFCU0xfRU5BQkxFX0lOU1RBTEw9T04gXA0K
ICAgICAgICAgICAgICAgICAiDQotLQ0KMi4zNC4xDQoNCg0KDQoNCkFtYXpvbiBXZWIgU2Vydmlj
ZXMgRU1FQSBTQVJMDQozOCBhdmVudWUgSm9obiBGLiBLZW5uZWR5LCBMLTE4NTUgTHV4ZW1ib3Vy
ZyBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IEwtMTg1NSBMdXhlbWJ1cmcgZWluZ2V0cmFnZW4gaW0g
THV4ZW1idXJnaXNjaGVuIEhhbmRlbHNyZWdpc3RlciB1bnRlciBSLkMuUy4gQjE4NjI4NA0KDQpB
bWF6b24gV2ViIFNlcnZpY2VzIEVNRUEgU0FSTCwgTmllZGVybGFzc3VuZyBEZXV0c2NobGFuZCBN
YXJjZWwtQnJldWVyLVN0ci4gMTIsIEQtODA4MDcgTXVlbmNoZW4gU2l0eiBkZXIgWndlaWduaWVk
ZXJsYXNzdW5nOiBNdWVuY2hlbiBlaW5nZXRyYWdlbiBpbSBIYW5kZWxzcmVnaXN0ZXIgZGVzIEFt
dHNnZXJpY2h0cyBNdWVuY2hlbiB1bnRlciBIUkIgMjQyMjQwLCBVU3QtSUQgREUzMTcwMTMwOTQN
Cg0KDQoNCg0K

