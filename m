Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD8C71CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:39:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41290392"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2018 15:39:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 43A734B41ECF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 15:39:40 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0399.000; Wed, 20 Jun 2018 15:39:41 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH] python-pytest: Fix conflict error as
	following:
Thread-Index: AQHT/iCw1ub0n2OyuUCu+qotJnMxO6Ro12fw
Date: Wed, 20 Jun 2018 07:39:45 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD0170F9E9C1@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527467656-6513-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1527467656-6513-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.27]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 43A734B41ECF.AA3FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-python][PATCH] python-pytest: Fix conflict error as following:
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
X-List-Received-Date: Wed, 20 Jun 2018 07:39:45 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

UGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExlaSwgTWFvaHVpDQo+IFNlbnQ6IE1vbmRheSwgTWF5IDI4LCAyMDE4IDg6
MzQgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IENjOiBMZWksIE1hb2h1aQ0KPiBTdWJqZWN0OiBbb2Vd
IFttZXRhLXB5dGhvbl1bUEFUQ0hdIHB5dGhvbi1weXRlc3Q6IEZpeCBjb25m
bGljdCBlcnJvciBhcw0KPiBmb2xsb3dpbmc6DQo+IA0KPiAgIGZpbGUgL3Vz
ci9iaW4vcHkudGVzdCBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0ZWQgaW5z
dGFsbHMgb2YgcHl0aG9uMy1weXRlc3QtDQo+IDMuNC4yLXIwIGFuZCBweXRo
b24tcHl0ZXN0LTMuNC4yLXIwDQo+ICAgZmlsZSAvdXNyL2Jpbi9weXRlc3Qg
Y29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxzIG9mIHB5dGhv
bjMtcHl0ZXN0LQ0KPiAzLjQuMi1yMCBhbmQgcHl0aG9uLXB5dGVzdC0zLjQu
Mi1yMA0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFv
aHVpQGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIG1ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1weXRlc3QuaW5jICAgICAg
IHwgMTAgKysrKysrKysrKw0KPiAgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uLXB5dGVzdF8zLjQuMi5iYiAgfCAgMSArDQo+
ICBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5dGVzdF8zLjQuMi5iYiB8ICAyICsrDQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHl0ZXN0Lmlu
YyBiL21ldGEtDQo+IHB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tcHl0ZXN0LmluYw0KPiBpbmRleCA0ZmViOWEwLi40YzMyZGZiIDEw
MDY0NA0KPiAtLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24tcHl0ZXN0LmluYw0KPiArKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHl0ZXN0LmluYw0KPiBA
QCAtOSw2ICs5LDggQEAgU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjExN2Jh
ZDM2YzFhNzg3ZTFhOGE2NTlkZjM1ZGU1M2JhMDVmOWYzMzk4ZmI5ZTRhYzE3
ZTgwYWQ1OTANCj4gIFNSQ19VUklfYXBwZW5kID0gIiBmaWxlOi8vMDAwMS1z
ZXR1cC5weS1yZW1vdmUtdGhlLXNldHVwX3JlcXVpcmVzLWZvci0NCj4gc2V0
dXB0b29scy1zY20ucGF0Y2ggXA0KPiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9weXRlc3RfdmVyc2lvbl9maXgucGF0Y2ggIg0KPiANCj4gK2luaGVy
aXQgdXBkYXRlLWFsdGVybmF0aXZlcw0KPiArDQo+ICBSREVQRU5EU18ke1BO
fV9jbGFzcy10YXJnZXQgKz0gIiBcDQo+ICAgICAgJHtQWVRIT05fUE59LWF0
dHJzIFwNCj4gICAgICAke1BZVEhPTl9QTn0tZGVidWdnZXIgXA0KPiBAQCAt
MjIsNCArMjQsMTIgQEAgUkRFUEVORFNfJHtQTn1fY2xhc3MtdGFyZ2V0ICs9
ICIgXA0KPiANCj4gIEZJTEVTRVhUUkFQQVRIU19wcmVwZW5kIDo9ICIke1RI
SVNESVJ9L3B5dGhvbi1weXRlc3Q6Ig0KPiANCj4gK0FMVEVSTkFUSVZFXyR7
UE59ICs9ICJweS50ZXN0IHB5dGVzdCINCj4gKw0KPiArTkFUSVZFX0xJTktf
TkFNRVtweXRlc3RdID0gIiR7YmluZGlyfS9weXRlc3QiDQo+ICtBTFRFUk5B
VElWRV9UQVJHRVRbcHl0ZXN0XSA9ICIke2JpbmRpcn0vcHl0ZXN0Ig0KPiAr
DQo+ICtBTFRFUk5BVElWRV9MSU5LX05BTUVbcHkudGVzdF0gPSAiJHtiaW5k
aXJ9L3B5LnRlc3QiDQo+ICtBTFRFUk5BVElWRV9UQVJHRVRbcHkudGVzdF0g
PSAiJHtiaW5kaXJ9L3B5LnRlc3QiDQo+ICsNCj4gIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIG5hdGl2ZXNkayINCj4gZGlmZiAtLWdpdCBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1weXRlc3RfMy40
LjIuYmIgYi9tZXRhLQ0KPiBweXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXB5dGVzdF8zLjQuMi5iYg0KPiBpbmRleCAyMDFhYjA1Li4z
OWU1MGFjIDEwMDY0NA0KPiAtLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24tcHl0ZXN0XzMuNC4yLmJiDQo+ICsrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1w
eXRlc3RfMy40LjIuYmINCj4gQEAgLTYsMyArNiw0IEBAIFJERVBFTkRTXyR7
UE59X2NsYXNzLXRhcmdldCArPSAiIFwNCj4gICAgICAke1BZVEhPTl9QTn0t
Y29tcGlsZXIgXA0KPiAgICAgICR7UFlUSE9OX1BOfS1mdW5jc2lncyBcDQo+
ICAiDQo+ICtBTFRFUk5BVElWRV9QUklPUklUWSA9ICIxMCINCj4gZGlmZiAt
LWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0ZXN0XzMuNC4yLmJiDQo+IGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfMy40LjIuYmINCj4g
aW5kZXggNDY2Y2ZhOC4uZWJhNjYzMiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Rf
My40LjIuYmINCj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weXRlc3RfMy40LjIuYmINCj4gQEAgLTEsMiAr
MSw0IEBADQo+ICBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMNCj4gIHJlcXVp
cmUgcHl0aG9uLXB5dGVzdC5pbmMNCj4gKw0KPiArQUxURVJOQVRJVkVfUFJJ
T1JJVFkgPSAiMTAwIg0KPiAtLQ0KPiAxLjkuMQ0KDQoKCg==

