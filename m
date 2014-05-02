Return-Path: <donald.poole@swri.org>
X-Greylist: delayed 1878 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 21:21:02 UTC
Received: from esg256-2.itc.swri.edu (esg256-2.itc.swri.edu [129.162.243.101])
	by mail.openembedded.org (Postfix) with ESMTP id 1C436602DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 21:21:02 +0000 (UTC)
Received: from exchmail.swri.org (casht256-1.adm.swri.edu [129.162.243.120])
	by esg256-2.itc.swri.edu (8.14.5/8.14.5) with ESMTP id s42KpexN030118
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 May 2014 15:51:40 -0500
Received: from MBX256-1.adm.swri.edu ([169.254.1.62]) by
	CASHT256-1.adm.swri.edu ([129.162.243.120]) with mapi id 14.03.0181.006;
	Fri, 2 May 2014 15:49:42 -0500
From: "Poole Jr, Donald R." <donald.poole@swri.org>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] qmake5_base.bbclass: Add install
	support for native builds
Thread-Index: AQHPZYC8FzFD0TH0GEOtwtPcZg6Yrpstoh0AgAB11wD//60dAA==
Date: Fri, 2 May 2014 20:49:42 +0000
Message-ID: <CF896EB1.2FA4%donald.poole@swri.org>
References: <1398974461-3044-1-git-send-email-donald.poole@swri.org>
	<20140501210300.GU2486@jama> <CF89516F.2F68%donald.poole@swri.org>
	<CAP9ODKoGRW+jKyYAgiALURUpbwArhEEX7813fuHwuXkbkxOf7w@mail.gmail.com>
In-Reply-To: <CAP9ODKoGRW+jKyYAgiALURUpbwArhEEX7813fuHwuXkbkxOf7w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [129.162.230.100]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-02_07:2014-05-02, 2014-05-02,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=0
	kscore.is_bulkscore=6.49480469405717e-14 kscore.compositescore=1
	circleOfTrustscore=0 compositescore=0.997781753771917
	urlsuspect_oldscore=0.997781753771917 suspectscore=0
	recipient_domain_to_sender_totalscore=0 phishscore=0 bulkscore=0
	kscore.is_spamscore=0 recipient_to_sender_totalscore=0
	recipient_domain_to_sender_domain_totalscore=0
	rbsscore=0.997781753771917
	spamscore=0 recipient_to_sender_domain_totalscore=0 urlsuspectscore=0.9
	adultscore=0 classifier=spam adjust=-40 reason=mlx scancount=1
	engine=7.0.1-1402240000 definitions=main-1405020303
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 21:21:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="euc-kr"
Content-ID: <1FA924C0437F8E4795E6D8F0C6C72D8A@sw.pvt>
Content-Transfer-Encoding: base64

T24gNS8yLzE0LCAzOjQ2IFBNLCAiT3RhdmlvIFNhbHZhZG9yIiA8b3RhdmlvQG9zc3lzdGVtcy5j
b20uYnI+IHdyb3RlOg0KDQoNCj5PbiBGcmksIE1heSAyLCAyMDE0IGF0IDM6NDQgUE0sIFBvb2xl
IEpyLCBEb25hbGQgUi4NCj48ZG9uYWxkLnBvb2xlQHN3cmkub3JnPiB3cm90ZToNCj4+IE1hcnRp
biwgZXQuIGFsLA0KPj4NCj4+IFdoYXQgaXMgdGhlIHByb2Nlc3NlcyBmb3IgcGF0Y2ggc3VibWlz
c2lvbiByZXZpZXc/IERvZXMgdGhlIHJldmlldyB0ZWFtDQo+PiByZXZpZXcgYW5kIHRlc3QgdGhl
IHBhdGNoIGFuZCB0aGVuIHJlcG9ydCBpdKn2cyBhY2NlcHRhbmNlPw0KPg0KPldlIGFsbCBjYW4g
cmV2aWV3OyB3ZSB0ZXN0IGl0IGFuZCB0cnkgdG8gZGlzY3VzcyBpZiB3ZSBmaW5kIGFueXRoaW5n
DQo+d2hpY2ggbWlnaHQgYmUgcHJvYmxlbWF0aWMuDQo+DQo+VXN1YWxseSBwZW9wbGUgaGFzIGEg
a25vd2xlZGdlIGluIGEgc3BlY2lmaWMgYXJlYSBhbmQgdGhvc2UgcGVvcGxlDQo+dXN1YWxseSBh
cmUgYXdhaXRlZCBmb3IgdGhlaXIgZmVlZGJhY2sgYmVmb3JlIG1lcmdpbmcgYW55dGhpbmcuDQo+
DQo+LS0gDQo+T3RhdmlvIFNhbHZhZG9yICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPLlMu
IFN5c3RlbXMNCj5odHRwOi8vd3d3Lm9zc3lzdGVtcy5jb20uYnIgICAgICAgIGh0dHA6Ly9jb2Rl
Lm9zc3lzdGVtcy5jb20uYnINCj5Nb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAg
IE1vYmlsZTogKzEgKDM0NykgOTAzLTk3NTANCj4tLSANCj5fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPk9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxp
c3QNCj5PcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPmh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVs
DQoNClRoYW5rcyBPdGF2aW8uIEkganVzdCB3YW50IHRvIGJlIHN1cmUgdGhhdCBJoa9tIGNvbXBs
eWluZyB3aXRoIHByb3RvY29sLg0KDQpEb25hbGQgUi4gUG9vbGUsIEpyLg0KUmVzZWFyY2ggRW5n
aW5lZXINClZvaWNlOiAyMTAuNTIyLjMxMzEgfCBGYXg6IDIxMC41MjIuNDkzMQ0KVGFjdGljYWwg
TmV0d29ya3MgJiBDb21tdW5pY2F0aW9ucyAodGFjdGljYWxuZXR3b3Jrcy5zd3JpLm9yZykNClNv
dXRod2VzdCBSZXNlYXJjaCBJbnN0aXR1dGUgKFN3UkkpDQoNCg==

