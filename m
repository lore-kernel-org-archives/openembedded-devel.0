Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 792D371951
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:04:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1224UmB004702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 1 Feb 2018 18:04:30 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.48]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Thu, 1 Feb 2018 18:04:29 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH 1/1] postfix: move running
	newaliases back to pkg_postinst
Thread-Index: AQHTm6NMPDkWH+9Ye0OAWbdtdjlG76OQmOWA///Am+A=
Date: Fri, 2 Feb 2018 02:04:29 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F0DCF539@ALA-MBC.corp.ad.wrs.com>
References: <20180201212617.94472-1-joe.slater@windriver.com>
	<CA+chaQeEC_eFyqTzF+qfxKmZNVFLmZbhrGqCwDNNP1SPZrT6ug@mail.gmail.com>
In-Reply-To: <CA+chaQeEC_eFyqTzF+qfxKmZNVFLmZbhrGqCwDNNP1SPZrT6ug@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.209]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] postfix: move running newaliases back to pkg_postinst
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
X-List-Received-Date: Fri, 02 Feb 2018 02:04:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIG9uZSB5b3UgcmVmZXJlbmNlIGZpeGVzIHNldmVyYWwgdGhpbmdzLiAgQmVzdCB0byBtZXJn
ZSB0aGF0IG9uZS4gIEhvd2V2ZXIsIGlmIG5ld2FsaWFzZXMgZmFpbHMgZHVyaW5nIHBrZ19wb3N0
aW5zdCgpLCBJIGJlbGlldmUgdGhlIHN5c3RlbSB3aWxsIG5vdCBrbm93IHRvIHNjaGVkdWxlIHRo
ZSBzY3JpcHQgYXQgZmlyc3QgYm9vdCB1bmxlc3Mgd2Ug4oCYZXhpdCAx4oCZLiAgIFdlIGFsc28g
bmVlZCB0byBjcmVhdGUgdGhlIHNlbmRtYWlsIGxpbmsgYmVmb3JlIHRoaXMgb3IgZG8gaXQgc29t
ZXBsYWNlIGVsc2UuDQoNCkpvZQ0KDQpGcm9tOiBNYXJ0aW4gSmFuc2EgW21haWx0bzptYXJ0aW4u
amFuc2FAZ21haWwuY29tXQ0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDAxLCAyMDE4IDE6Mzkg
UE0NClRvOiBTbGF0ZXIsIEpvc2VwaA0KQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbA0KU3ViamVjdDog
UmU6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bUEFUQ0ggMS8xXSBwb3N0Zml4OiBtb3ZlIHJ1bm5p
bmcgbmV3YWxpYXNlcyBiYWNrIHRvIHBrZ19wb3N0aW5zdA0KDQpIb3cgaXMgdGhpcyBvbmUgcmVs
YXRlZCB0bzoNCmh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvcGF0Y2gvMTQ3MTYx
Lw0KPw0KDQpPbiBUaHUsIEZlYiAxLCAyMDE4IGF0IDEwOjI2IFBNLCBKb2UgU2xhdGVyIDxqb2Uu
c2xhdGVyQHdpbmRyaXZlci5jb208bWFpbHRvOmpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4+IHdy
b3RlOg0KbmV3YWxpYXNlcywgd2hlbiBydW4gb24gdGhlIGhvc3QsIHdpbGwgZmFpbCBpZiAvdmFy
L3Nwb29sL3Bvc3RmaXgNCmRvZXMgbm90IGV4aXN0LiAgUnVuIGl0IGR1cmluZyBwa2dfcG9zdGlu
c3QoKSBzbyB0aGF0IHdlIGNhbiBkZWZlcg0KaXQgdG8gZmlyc3QgYm9vdC4NCg0KU2lnbmVkLW9m
Zi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPG1haWx0bzpqb2Uuc2xh
dGVyQHdpbmRyaXZlci5jb20+Pg0KLS0tDQogbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFlbW9u
cy9wb3N0Zml4L3Bvc3RmaXguaW5jIHwgMTMgKysrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhLW5l
dHdvcmtpbmcvcmVjaXBlcy1kYWVtb25zL3Bvc3RmaXgvcG9zdGZpeC5pbmMgYi9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1kYWVtb25zL3Bvc3RmaXgvcG9zdGZpeC5pbmMNCmluZGV4IGU0OGZjMzku
LmQ1ZDA3ODkgMTAwNjQ0DQotLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1kYWVtb25zL3Bv
c3RmaXgvcG9zdGZpeC5pbmMNCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMv
cG9zdGZpeC9wb3N0Zml4LmluYw0KQEAgLTIxNywxMiArMjE3LDYgQEAgZG9faW5zdGFsbF9hcHBl
bmRfY2xhc3MtbmF0aXZlKCkgew0KIGRvX2luc3RhbGxfYXBwZW5kX2NsYXNzLXRhcmdldCgpIHsN
CiAgICAgIyBSZW1vdmUgcmVmZXJlbmNlcyB0byBidWlsZG1hY2hpbmUgcGF0aHMgaW4gdGFyZ2V0
IG1ha2VkZWZzLm91dA0KICAgICBzZWQgLWkgJ3M6LWZkZWJ1Zy1wcmVmaXgtbWFwW14gXSo6Omc7
IHM6LS1zeXNyb290PSR7U1RBR0lOR19ESVJfVEFSR0VUfTo6ZycgJHtEfS9ldGMvcG9zdGZpeC9t
YWtlZGVmcy5vdXQNCi0gICAgIyBTaW5jZSB3ZSBhcmUgYnVpbGRpbmcgcmVjaXBlIHBvc3RmaXgs
IG5ld2FsaWFzZXMgYW5kIHBvc3RtYXAgY29tZSBmcm9tIG91ciBzeXNyb290X25hdGl2ZS4NCi0g
ICAgdG91Y2ggJHtEfS9ldGMvYWxpYXNlcw0KLSAgICBuZXdhbGlhc2VzIC1DICR7RH0vZXRjL3Bv
c3RmaXgvbWFpbi5jZjxodHRwOi8vbWFpbi5jZj4gLW9BJHtEfS9ldGMvYWxpYXNlcw0KLSAgICB0
b3VjaCAke0R9L2V0Yy9wb3N0Zml4L3ZpcnR1YWxfYWxpYXMNCi0gICAgcG9zdG1hcCAtYyAke0R9
L2V0Yy9wb3N0Zml4ICR7RH0vZXRjL3Bvc3RmaXgvdmlydHVhbF9hbGlhcw0KLQ0KIH0NCg0KIEFM
VEVSTkFUSVZFXyR7UE59ID0gInNlbmRtYWlsIg0KQEAgLTIzNSw2ICsyMjksNyBAQCBBTFRFUk5B
VElWRV9MSU5LX05BTUVbbWFpbHEuMV0gPSAiJHttYW5kaXJ9L21hbjEvbWFpbHEuMSINCiBBTFRF
Uk5BVElWRV9MSU5LX05BTUVbbmV3YWxpYXNlcy4xXSA9ICIke21hbmRpcn0vbWFuMS9uZXdhbGlh
c2VzLjEiDQogQUxURVJOQVRJVkVfTElOS19OQU1FW3NlbmRtYWlsLjFdID0gIiR7bWFuZGlyfS9t
YW4xL3NlbmRtYWlsLjEiDQoNCitQQUNLQUdFX1dSSVRFX0RFUFMgKz0gInBvc3RmaXgtbmF0aXZl
Ig0KIHBrZ19wb3N0aW5zdF8ke1BOfSAoKSB7DQogICAgIGlmIFsgIngkRCIgPSAieCIgXTsgdGhl
bg0KICAgICAgICAgdG91Y2ggL2V0Yy9hbGlhc2VzDQpAQCAtMjQ4LDYgKzI0MywxMiBAQCBwa2df
cG9zdGluc3RfJHtQTn0gKCkgew0KICAgICAgICAgICAgICMgL3Vzci9saWIvc2VuZG1haWwgaXMg
cmVxdWlyZWQgYnkgTFNCIGNvcmUgdGVzdA0KICAgICAgICAgICAgIFsgISAtTCAkRC91c3IvbGli
L3NlbmRtYWlsIF0gJiYgbG4gLXNmICR7c2JpbmRpcn0vc2VuZG1haWwgJEQvdXNyL2xpYi8NCiAg
ICAgICAgIGZpDQorDQorICAgICAgICB0b3VjaCAkRC9ldGMvYWxpYXNlcw0KKyAgICAgICAgIyBm
YWlscyBpZiAvdmFyL3Nwb29sL3Bvc3RmaXggaXMgbm90IG9uIGhvc3QNCisgICAgICAgIG5ld2Fs
aWFzZXMgLUMgJEQvZXRjL3Bvc3RmaXgvbWFpbi5jZjxodHRwOi8vbWFpbi5jZj4gLW9BJEQvZXRj
L2FsaWFzZXMgIHx8ICBleGl0IDENCisgICAgICAgIHRvdWNoICREL2V0Yy9wb3N0Zml4L3ZpcnR1
YWxfYWxpYXMNCisgICAgICAgIHBvc3RtYXAgLWMgJEQvZXRjL3Bvc3RmaXggJEQvZXRjL3Bvc3Rm
aXgvdmlydHVhbF9hbGlhcw0KICAgICBmaQ0KIH0NCg0KLS0NCjIuNy40DQoNCi0tDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KT3BlbmVtYmVkZGVkLWRl
dmVsIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc8bWFpbHRvOk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KaHR0
cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQt
ZGV2ZWwNCg0K

