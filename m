Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EE40278D14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 01:24:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41002237"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jun 2018 09:24:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 997F74B41EC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 09:24:07 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0399.000; Wed, 13 Jun 2018 09:24:07 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH] python-lockfile: Fix build error as
	following:
Thread-Index: AQHT9xmWvJWU2YY7dUKgnzE5rch5p6Rde4vA
Date: Wed, 13 Jun 2018 01:24:12 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD0170F9A0AC@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1526766188-31718-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1526766188-31718-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.27]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 997F74B41EC6.AB2DB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-python][PATCH] python-lockfile: Fix build error as following:
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
X-List-Received-Date: Wed, 13 Jun 2018 01:24:09 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNClRoaXMgcGF0Y2ggYWxzbyBhcHBsaWVzIHRvIHN1bW8sIHBsZWFz
ZSBtZXJnZSB0byBzdW1vLg0KDQpCZXN0IHJlZ2FyZHMuDQpMZWkNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWksIE1hb2h1
aQ0KPiBTZW50OiBTdW5kYXksIE1heSAyMCwgMjAxOCA1OjQzIEFNDQo+IFRv
OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBDYzogTGVpLCBNYW9odWkNCj4gU3ViamVjdDogW29lXSBbbWV0YS1weXRo
b25dW1BBVENIXSBweXRob24tbG9ja2ZpbGU6IEZpeCBidWlsZCBlcnJvciBh
cw0KPiBmb2xsb3dpbmc6DQo+IA0KPiAiZGlzdHV0aWxzLmVycm9ycy5EaXN0
dXRpbHNFcnJvcjogQ291bGQgbm90IGZpbmQgc3VpdGFibGUgZGlzdHJpYnV0
aW9uIGZvcg0KPiBSZXF1aXJlbWVudC5wYXJzZSgncGJyPj0xLjgnKSINCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBjbi5m
dWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24tbG9ja2ZpbGVfMC4xMi4yLmJiIHwgNiAr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24tbG9ja2ZpbGVfMC4xMi4yLmJiDQo+IGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWxvY2tmaWxl
XzAuMTIuMi5iYg0KPiBpbmRleCBjZDE1NzYwLi45YWQ4NjVkIDEwMDY0NA0K
PiAtLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tbG9ja2ZpbGVfMC4xMi4yLmJiDQo+ICsrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1sb2NrZmlsZV8wLjEy
LjIuYmINCj4gQEAgLTExLDMgKzExLDkgQEAgaW5oZXJpdCBweXBpIHNldHVw
dG9vbHMNCj4gDQo+ICBTUkNfVVJJW21kNXN1bV0gPSAiYTZhMWE4Mjk1N2Ey
M2FmZGY0NGNmZGQwMzliNjVmZjkiDQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0g
PQ0KPiAiNmFlZDAyZGUwM2NiYTI0ZWZhYmNkNjAwYjMwNTQwMTQwNjM0ZmMw
NmNmYTYwMzgyMmQ1MDhkNTM2MWU5Zjc5OSINCj4gKw0KPiArIyBTYXRpc2Z5
IHNldHVwLnB5ICdzZXR1cF9yZXF1aXJlcycNCj4gK0RFUEVORFMgKz0gIiBc
DQo+ICsgICAgICAgIHB5dGhvbi1wYnItbmF0aXZlIFwNCj4gKyAgICAgICAg
Ig0KPiArDQo+IC0tDQo+IDEuOS4xDQoNCgoK

