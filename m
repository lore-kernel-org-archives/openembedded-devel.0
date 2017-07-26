Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 70639781D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 05:20:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21825371"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jul 2017 13:20:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2EDCD46B4C8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 13:20:25 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Wed, 26 Jul 2017 13:20:25 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] openssl: By default, disable cryptodev.
Thread-Index: AQHTBc49obecri23X02yGeA3QFcfDaJlkZjw
Date: Wed, 26 Jul 2017 05:20:24 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E25FD04@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1501046123-2508-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1501046123-2508-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.235.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2EDCD46B4C8D.AA3C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [OE-core] [PATCH] openssl: By default, disable cryptodev.
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
X-List-Received-Date: Wed, 26 Jul 2017 05:20:26 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U29ycnksSSBzZW5kIHRoaXMgcGF0Y2ggdG8gd3JvbmcgbGlzdC4gUGxlYXNl
IGlnbm9yZS4NCg0KaHVhbmdxeQ0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBIdWFuZywgUWl5dS+7xiDn+dPuDQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAyNiwgMjAxNyAxOjE1IFBNDQo+IFRvOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogSHVh
bmcsIFFpeXUvu8Yg5/nT7iA8aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3UuY29t
Pg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIXSBvcGVuc3NsOiBCeSBk
ZWZhdWx0LCBkaXNhYmxlIGNyeXB0b2Rldi4NCj4gDQo+IEJlY2F1c2UgYWNj
b3JkaW5nIHRvIHRoZSBvdGhlciBEaXN0cm9zLGNyeXB0b2RldiBpcyBub3Qg
ZW5hYmxlZC4NCj4gSWYgdXNlcnMgd2FudCBlbmFibGUgY3J5cHRvZGV2LCBq
dXN0IGhhdmUgdG8gYWRkICJjcnlwdG9kZXYtbGludXgiIGludG8NCj4gUEFD
S0FHRUNPTkZJRy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFFpeXUg
PGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjAuMmwu
YmIgfCA2ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjAuMmwu
YmINCj4gYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbF8xLjAuMmwuYmINCj4gaW5kZXggYzAwZGQ4MS4uN2M4ZjE4YiAxMDA2
NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3Ns
L29wZW5zc2xfMS4wLjJsLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzEuMC4ybC5iYg0KPiBAQCAtMiwx
MCArMiw4IEBAIHJlcXVpcmUgb3BlbnNzbC5pbmMNCj4gDQo+ICAjIEZvciB0
YXJnZXQgc2lkZSB2ZXJzaW9ucyBvZiBvcGVuc3NsIGVuYWJsZSBzdXBwb3J0
IGZvciBPQ0YgTGludXggZHJpdmVyICAjIGlmDQo+IHRoZXkgYXJlIGF2YWls
YWJsZS4NCj4gLVBBQ0tBR0VDT05GSUdbY3J5cHRvZGV2LWxpbnV4XSA9ICIs
LGNyeXB0b2Rldi1saW51eCINCj4gLURFUEVORFMgKz0gIiR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2NyeXB0b2Rldi1saW51eCcs
DQo+ICdjcnlwdG9kZXYtbGludXgnLCAnJywgZCl9Ig0KPiAtDQo+IC1DRkxB
RyArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAn
Y3J5cHRvZGV2LWxpbnV4JywNCj4gJy1ESEFWRV9DUllQVE9ERVYgLURVU0Vf
Q1JZUFRPREVWX0RJR0VTVFMnLCAnJywgZCl9Ig0KPiArUEFDS0FHRUNPTkZJ
R1tjcnlwdG9kZXYtbGludXhdID0gIi1ESEFWRV9DUllQVE9ERVYNCj4gLURV
U0VfQ1JZUFRPREVWX0RJR0VTVFMsLGNyeXB0b2Rldi1saW51eCINCj4gK0NG
TEFHICs9ICIke1BBQ0tBR0VDT05GSUdfQ09ORkFSR1N9Ig0KPiANCj4gIENG
TEFHX2FwcGVuZF9jbGFzcy1uYXRpdmUgPSAiIC1mUElDIg0KPiANCj4gLS0N
Cj4gMi43LjQNCg0KCgo=

