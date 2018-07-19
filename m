Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8715B783DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:00:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42414721"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jul 2018 17:00:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AEB3C4B66B69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:00:03 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0399.000; Thu, 19 Jul 2018 17:00:02 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] Fix confilct error in do_rootfs.
Thread-Index: AQHT/Uh3HvIhTqqCmEiwEO8xXXKT1qSWgxuQ
Date: Thu, 19 Jul 2018 09:00:09 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD019455969C@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527446036-4930-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1527446036-4930-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: AEB3C4B66B69.ACF13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-networking][PATCH] Fix confilct error in do_rootfs.
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
X-List-Received-Date: Thu, 19 Jul 2018 09:00:06 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExlaSwgTWFvaHVpDQo+IFNlbnQ6IE1vbmRheSwgTWF5IDI4LCAyMDE4IDI6
MzQgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IENjOiBMZWksIE1hb2h1aQ0KPiBTdWJqZWN0OiBbb2Vd
IFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSBGaXggY29uZmlsY3QgZXJyb3Ig
aW4gZG9fcm9vdGZzLg0KPiANCj4gRXJyb3I6IFRyYW5zYWN0aW9uIGNoZWNr
IGVycm9yOg0KPiAgIGZpbGUgL3Vzci9iaW4vbWFpbHEgY29uZmxpY3RzIGJl
dHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxzIG9mIGVzbXRwLTEuMi0NCj4gcjAu
eDg2XzY0IGFuZCBwb3N0Zml4LTMuMi4yLXIwLng4Nl82NA0KPiAgIGZpbGUg
L3Vzci9iaW4vbmV3YWxpYXNlcyBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0
ZWQgaW5zdGFsbHMgb2YgZXNtdHAtMS4yLQ0KPiByMC54ODZfNjQgYW5kIHBv
c3RmaXgtMy4yLjItcjAueDg2XzY0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBM
ZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0K
PiAgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFlbW9ucy9wb3N0Zml4L3Bv
c3RmaXguaW5jIHwgNyArKysrLS0tDQo+ICBtZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1zdXBwb3J0L2VzbXRwL2VzbXRwXzEuMi5iYiAgfCA2ICsrKy0tLQ0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtZGFlbW9ucy9wb3N0Zml4L3Bvc3RmaXguaW5jIGIvbWV0YS0NCj4g
bmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMvcG9zdGZpeC9wb3N0Zml4Lmlu
Yw0KPiBpbmRleCAwOTQ0N2Q1Li5hNWU4NjE4IDEwMDY0NA0KPiAtLS0gYS9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1kYWVtb25zL3Bvc3RmaXgvcG9zdGZp
eC5pbmMNCj4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFlbW9u
cy9wb3N0Zml4L3Bvc3RmaXguaW5jDQo+IEBAIC0yMTksOSArMjE5LDEwIEBA
IGRvX2luc3RhbGxfYXBwZW5kX2NsYXNzLXRhcmdldCgpIHsNCj4gICAgICBz
ZWQgLWkgJ3M6LWZkZWJ1Zy1wcmVmaXgtbWFwW14gXSo6Omc7IHM6LS0NCj4g
c3lzcm9vdD0ke1NUQUdJTkdfRElSX1RBUkdFVH06OmcnICR7RH0vZXRjL3Bv
c3RmaXgvbWFrZWRlZnMub3V0DQo+ICB9DQo+IA0KPiAtQUxURVJOQVRJVkVf
JHtQTn0gPSAic2VuZG1haWwiDQo+IC1BTFRFUk5BVElWRV9UQVJHRVRbc2Vu
ZG1haWxdID0gIiR7c2JpbmRpcn0vc2VuZG1haWwucG9zdGZpeCINCj4gLUFM
VEVSTkFUSVZFX0xJTktfTkFNRVtzZW5kbWFpbF0gPSAiJHtzYmluZGlyfS9z
ZW5kbWFpbCINCj4gK0FMVEVSTkFUSVZFXyR7UE59ICs9ICJtYWlscSBuZXdh
bGlhc2VzIg0KPiArQUxURVJOQVRJVkVfVEFSR0VUW21haWxxXSA9ICIke2Jp
bmRpcn0vbWFpbHEiDQo+ICtBTFRFUk5BVElWRV9UQVJHRVRbbmV3YWxpYXNl
c10gPSAiJHtiaW5kaXJ9L25ld2FsaWFzZXMiDQo+ICsNCj4gIEFMVEVSTkFU
SVZFX1BSSU9SSVRZID0gIjEyMCINCj4gDQo+ICBBTFRFUk5BVElWRV8ke1BO
fS1kb2MgKz0gIm1haWxxLjEgbmV3YWxpYXNlcy4xIHNlbmRtYWlsLjEiDQo+
IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0
L2VzbXRwL2VzbXRwXzEuMi5iYiBiL21ldGEtDQo+IG5ldHdvcmtpbmcvcmVj
aXBlcy1zdXBwb3J0L2VzbXRwL2VzbXRwXzEuMi5iYg0KPiBpbmRleCAyZGE3
M2U3Li45ZmI4MTdiIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcv
cmVjaXBlcy1zdXBwb3J0L2VzbXRwL2VzbXRwXzEuMi5iYg0KPiArKysgYi9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2VzbXRwL2VzbXRwXzEu
Mi5iYg0KPiBAQCAtMTgsMTAgKzE4LDEwIEBAIEVYVFJBX09FQ09ORiA9ICIt
LXdpdGgtbGliZXNtdHA9JHtTVEFHSU5HX0VYRUNQUkVGSVhESVJ9Ig0KPiAN
Cj4gIGluaGVyaXQgYXV0b3Rvb2xzIHVwZGF0ZS1hbHRlcm5hdGl2ZXMNCj4g
DQo+IC1BTFRFUk5BVElWRV8ke1BOfSA9ICJzZW5kbWFpbCINCj4gK0FMVEVS
TkFUSVZFXyR7UE59ICs9ICJtYWlscSBuZXdhbGlhc2VzIg0KPiArQUxURVJO
QVRJVkVfVEFSR0VUW21haWxxXSA9ICIke2JpbmRpcn0vbWFpbHEiDQo+ICtB
TFRFUk5BVElWRV9UQVJHRVRbbmV3YWxpYXNlc10gPSAiJHtiaW5kaXJ9L25l
d2FsaWFzZXMiDQo+IA0KPiAtQUxURVJOQVRJVkVfTElOS19OQU1FW3NlbmRt
YWlsXSA9ICIke3NiaW5kaXJ9L3NlbmRtYWlsIg0KPiAtQUxURVJOQVRJVkVf
VEFSR0VUW3NlbmRtYWlsXSA9ICIke2JpbmRpcn0vZXNtdHAiDQo+ICBBTFRF
Uk5BVElWRV9QUklPUklUWSA9ICIxMCINCj4gDQo+ICBBTFRFUk5BVElWRV8k
e1BOfS1kb2MgKz0gIm1haWxxLjEgbmV3YWxpYXNlcy4xIHNlbmRtYWlsLjEi
DQo+IC0tDQo+IDEuOS4xDQoNCgoK

