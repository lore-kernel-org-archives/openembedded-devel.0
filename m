Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B111578377
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:54:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208,217";a="21614824"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jul 2017 14:54:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D04246B5DEB;
	Fri, 21 Jul 2017 14:54:15 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Fri, 21 Jul 2017 14:54:13 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [oe] [PATCH] openssl : By default, disable cryptodev.
Thread-Index: AQHS/uaKNlqYyU3Q7E2Z3izBo11WCKJd3mug
Date: Fri, 21 Jul 2017 06:54:13 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E25DEDC@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1500256499-807-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0LbQS--Yks1DhGGC-POAUiMZcm5nrpPcVZQuA8O3mHWG5g@mail.gmail.com>
In-Reply-To: <CAJTo0LbQS--Yks1DhGGC-POAUiMZcm5nrpPcVZQuA8O3mHWG5g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.235.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3D04246B5DEB.A7FD2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Bian, Yaqin" <bianyq@cn.fujitsu.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] openssl : By default, disable cryptodev.
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
X-List-Received-Date: Fri, 21 Jul 2017 06:54:20 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBSb3NzDQoNCj4gVGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBhYm91dCB0
aGlzIGJhY2sgaW4gTWFyY2ggKCJvcGVuc3NsOiBkaXNhYmxlIGNyeXB0b2Rl
diBieSBkZWZhdWx0Iikgd2hlcmUgV2luZCBSaXZlciByZXBvcnRzIHRoYXQg
dGhleSBzZWUgYSBudW1iZXIgb2YgY3VzdG9tZXJzIHVzaW5nDQo+IGhhcmR3
YXJlIGNyeXB0by4gIEknbSBhbGwgZm9yIG1ha2luZyB0aGlzIGFuIG9wdGlv
biBidXQgd2hldGhlciB0byBlbmFibGUvZGlzYWJsZSBpdCBieSBkZWZhdWx0
IGlzbid0IGNsZWFyLg0KDQpJJ20gc29ycnkgdGhhdCBJIGRpZG4ndCBub3Rp
Y2UgdGhhdCBkaXNjdXNzaW9uLiBSZWFsbHkgc29tZSB1c2VycyB3YW50IHRv
IHVzZSBoYXJkd2FyZSBjcnlwdG8sIGJ1dCBmb3IgdXNlcnMgd2hvIGRvbid0
IHdhbnQgdG8gdXNlIGNyeXB0b2RldiwgdGhleSBoYXZlIHRvIGVuYWJsZSBj
cnlwdG9kZXYuDQoNCkkgdGhpbmsgbXkgcGF0Y2ggaXMgYSBnb29kIHNvbHV0
aW9uLiBEaXNhYmxlIGNyeXB0b2RldiBieSBkZWZhdWx0IGFzIHRoZSBvdGhl
ciBwb3B1bGFyIERpc3Ryb3MsIGFuZCBmb3IgdXNlcnMgd2hvIHdhbnQgdG8g
dXNlIGNyeXB0b2RldiwgaXQgaXMgZWFzeSB0byBlbmFibGUgaXQgKE9ubHkg
aGF2ZSB0byBhZGQgY3J5cHRvZGV2IGludG8gUEFDS0FHRUNPTkZJRykuDQoN
ClRoYW5rIGZvciB5b3VyIHN1Z2d1ZXN0aW9uLCBhbmQgSSdsbCBtb2RpZmll
ZCBteSBwYXRjaC4gSWYgeW91IGRlY2lkZSB0byBkaXNhYmxlIGNyeXB0b2Rl
diBieSBkZWZhdWx0LCB5b3UgY2FuIGNvbnNpZGVyIG15IHBhdGNoLg0KDQoN
CkZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVs
LmNvbV0NClNlbnQ6IE1vbmRheSwgSnVseSAxNywgMjAxNyA2OjIyIFBNDQpU
bzogSHVhbmcsIFFpeXUv6buEIOeQpuWuhyA8aHVhbmdxeS5mbnN0QGNuLmZ1
aml0c3UuY29tPg0KQ2M6IE9wZW5FbWJlZGRlZCBEZXZlbCBMaXN0IDxvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IEJpYW4s
IFlhcWluL+WNniDkuprnkLQgPGJpYW55cUBjbi5mdWppdHN1LmNvbT4NClN1
YmplY3Q6IFJlOiBbb2VdIFtQQVRDSF0gb3BlbnNzbCA6IEJ5IGRlZmF1bHQs
IGRpc2FibGUgY3J5cHRvZGV2Lg0KDQoNCk9uIDE3IEp1bHkgMjAxNyBhdCAw
Mjo1NCwgSHVhbmcgUWl5dSA8aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3UuY29t
PG1haWx0bzpodWFuZ3F5LmZuc3RAY24uZnVqaXRzdS5jb20+PiB3cm90ZToN
CkJlY2F1c2UgYWNjb3JkaW5nIHRvIHRoZSBvdGhlciBEaXN0cm9zKGUuZy4g
VWJ1bnR1LCBGZWRvcmEpLCBjcnlwdG9kZXYgaXMgbm90IGVuYWJsZWQuDQpJ
ZiB1c2VycyB3YW50IGVuYWJsZSBjcnlwdG9kZXYsIGp1c3QgaGF2ZSB0byBh
ZGQgImNyeXB0b2Rldi1saW51eCIgaW50byBQQUNLQUdFQ09ORklHLg0KDQpX
cm9uZyBsaXN0LCB5b3UgbWVhbnQgb2UtY29yZUAuDQoNClRoZXJlIHdhcyBh
IGRpc2N1c3Npb24gYWJvdXQgdGhpcyBiYWNrIGluIE1hcmNoICgib3BlbnNz
bDogZGlzYWJsZSBjcnlwdG9kZXYgYnkgZGVmYXVsdCIpIHdoZXJlIFdpbmQg
Uml2ZXIgcmVwb3J0cyB0aGF0IHRoZXkgc2VlIGEgbnVtYmVyIG9mIGN1c3Rv
bWVycyB1c2luZyBoYXJkd2FyZSBjcnlwdG8uICBJJ20gYWxsIGZvciBtYWtp
bmcgdGhpcyBhbiBvcHRpb24gYnV0IHdoZXRoZXIgdG8gZW5hYmxlL2Rpc2Fi
bGUgaXQgYnkgZGVmYXVsdCBpc24ndCBjbGVhci4NCg0KDQotREVQRU5EUyAr
PSAiY3J5cHRvZGV2LWxpbnV4Ig0KK1BBQ0tBR0VDT05GSUdbY3J5cHRvZGV2
LWxpbnV4XSA9ICIsLGNyeXB0b2Rldi1saW51eCINCg0KSnVzdCBjYWxsIHRo
aXMgY3J5cHRvZGV2LCBpbWhvLg0KDQorREVQRU5EUyArPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnY3J5cHRvZGV2LWxpbnV4
JywgJ2NyeXB0b2Rldi1saW51eCcsICcnLCBkKX08bWFpbHRvOiQlN2JAYmIu
dXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCUyMCdjcnlwdG9kZXYt
bGludXgnLCUyMCdjcnlwdG9kZXYtbGludXgnLCUyMCcnLCUyMGQpJTdkPiIN
Cg0KTm8gbmVlZCB0byBkbyB0aGlzLCBhcyB0aGF0IGlzIHdoYXQgdGhlIHRo
aXJkIG9wdGlvbiB0byB0aGUgUEFDS0FHRUNPTkZJRyBmbGFnIGlzIGZvci4N
Cg0KK0NGTEFHICs9ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNP
TkZJRycsICdjcnlwdG9kZXYtbGludXgnLCAnLURIQVZFX0NSWVBUT0RFViAt
RFVTRV9DUllQVE9ERVZfRElHRVNUUycsICcnLCBkKX08bWFpbHRvOiQlN2JA
YmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCUyMCdjcnlwdG9k
ZXYtbGludXgnLCUyMCctREhBVkVfQ1JZUFRPREVWJTIwLURVU0VfQ1JZUFRP
REVWX0RJR0VTVFMnLCUyMCcnLCUyMGQpJTdkPiINCg0KSWYgeW91IGFkZCB0
aG9zZSB0byB0aGUgZmlyc3QgdmFsdWUgaW4gdGhlIFBBQ0tBR0VDT05GSUcg
ZmxhZyBsaXN0IHRoZW4geW91IGNvdWxkIGp1c3QgYWRkIFBBQ0tBR0VDT05G
SUdfQ09ORkFSR1MgdG8gQ0ZMQUcsIGFuZCB1c2luZyBQQUNLQUdFQ09ORklH
IGZvciBvdGhlciBvcHRpb25zIGluIHRoZSBmdXR1cmUgaXMgdGhlbiB0cml2
aWFsLg0KDQpSb3NzDQoKCg==

