Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9501D7F6B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 06:31:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,346,1571673600"; d="scan'208";a="80621836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Dec 2019 14:31:33 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E920E4CE1C93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:22:44 +0800 (CST)
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 23 Dec 2019 14:31:32 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local ([fe80::25be:6191:8ae6:8ea8])
	by G08CNEXMBPEKD06.g08.fujitsu.local
	([fe80::25be:6191:8ae6:8ea8%14]) with
	mapi id 15.00.1395.000; Mon, 23 Dec 2019 14:31:29 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  [meta-oe] [zeus] samba and libldb problem
Thread-Index: AdW5Wp0ZmQhrWEb4SneFzX1zZ4/oZA==
Date: Mon, 23 Dec 2019 06:31:29 +0000
Message-ID: <8a4e5e98356b4c4fa68ad47e69bbb7e2@G08CNEXMBPEKD06.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E920E4CE1C93.A9D5B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [zeus] samba and libldb problem
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
X-List-Received-Date: Mon, 23 Dec 2019 06:31:40 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsDQoNCkkgZm91bmQgYSBidWlsZCBlcnJvciBpbiB6ZXVzIGJyYW5j
aCB3aGVuIGRvX2NvbmZpZ3VyZSAgb2Ygc2FtYmEuDQoNCkxvZyBpcyBhcyBm
b2xsb3dzOg0KfCBDaGVja2luZyBmb3IgcHl0aG9uIHZlcnNpb24gPj0gMi40
LjIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOiAzLjcuNQ0KfCBweXRob24gaGVhZGVycyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiB1c2luZyBjYWNoZQ0KfCBDaGVja2luZyBmb3Igc3lzdGVtIHB5
bGRiLXV0aWwuY3B5dGhvbi0zN20teDg2XzY0LWxpbnV4LWdudSAoPj0xLjUu
NiA8PTEuNS45OTkpICAgOiBub3QgZm91bmQNCnwgRVJST1I6IFN5c3RlbSBs
aWJyYXJ5IHB5bGRiLXV0aWwuY3B5dGhvbi0zN20teDg2XzY0LWxpbnV4LWdu
dSBvZiB2ZXJzaW9uIDEuNS42IG5vdCBmb3VuZCwgYW5kIGJ1bmRsaW5nIGRp
c2FibGVkDQp8IFdBUk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBzaGVsbCBj
b21tYW5kLg0KfA0KDQpJdCB3YXMgY2F1c2VkIGJ5IHRoZSBkZXBlbmQgb2Yg
c2FtYmEgbGlibGRiIHdpdGggbG93ZXIgdmVyc2lvbiAxLjUuNSB0aGF0IGF0
IHRoaXMgbW9tZW50IDEuNS42KyBpcyBuZWVkZWQuDQoNCiQgbHMgbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9saWJsZGINCmxpYmxkYiAgbGli
bGRiXzEuNS41LmJiDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCg0KCgo=

