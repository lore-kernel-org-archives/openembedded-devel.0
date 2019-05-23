Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5AAF7E423
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 08:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4948218549;
	Thu, 23 May 2019 10:55:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xx6Q8YDDEmpU; Thu, 23 May 2019 10:55:11 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 246CE18351;
	Thu, 23 May 2019 10:55:11 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 011461A075;
	Thu, 23 May 2019 10:55:11 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E97E31A067;
	Thu, 23 May 2019 10:55:10 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 23 May 2019 10:55:10 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id DDB711669;
	Thu, 23 May 2019 10:55:10 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 23 May 2019 10:55:10 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 23 May 2019 10:55:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files
	with	new distro feature 'helpfiles'
Thread-Index: AQHVETPPULShpE8asEye99k+/dvgGKZ4Z8sw
Date: Thu, 23 May 2019 08:55:10 +0000
Message-ID: <191e6e9a53294aae82f66761b91f6382@XBOX04.axis.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
	<20190523064859.24336-8-schnitzeltony@gmail.com>
In-Reply-To: <20190523064859.24336-8-schnitzeltony@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files with	new distro feature 'helpfiles'
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
X-List-Received-Date: Thu, 23 May 2019 08:55:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGRldmVsLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJlYXMgTcO8bGxl
cg0KPiBTZW50OiBkZW4gMjMgbWFqIDIwMTkgMDg6NDgNCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtvZV0gW1BBVENIIDA3LzQxXSBn
bm9tZS1oZWxwLmJiY2xhc3M6IEhhbmRsZSBnbm9tZS1oZWxwIGZpbGVzDQo+IHdpdGggbmV3IGRp
c3RybyBmZWF0dXJlICdoZWxwZmlsZXMnDQo+IA0KPiBHbm9tZSBoZWxwIGZpbGUgZ2VuZXJhdGlv
biBjYW5ub3QgYmUgY29uZmlndXJlZCBzbyBoYW5kbGUgZmlsZXMNCj4gcHJvcGVybHkNCj4gDQo+
ICogQWRkIGEgbmV3IGRpc3RybyBmZWF0dXJlICdoZWxwZmlsZXMnOg0KPiAgICBJZiBzZXQ6IHNw
bGl0IGhlbHAgZmlsZSBpbnRvICR7UE59LWhlbHAtKg0KPiAgICBJZiBub3Qgc2V0OiBkZWxldGUg
aGVscCBmaWxlcyBvbiBpbnN0YWxsYXRpb24NCj4gKiBBcHBlbmQgJHtQTn0taGVscC0uKiB0byBQ
QUNLQUdFU19EWU5BTUlDDQo+IA0KPiBPbmNlIGFjY2VwdGVkIC8gYXBwbGllZCBpdCB0YWtlcyBh
IG9uLWxpbmUgcGF0Y2ggdG8gYWRkIGhlbHAgZmlsZXMgYmFzZWQgb24NCg0KSSBhc3N1bWUgeW91
IG1lYW4gIm9uZS1saW5lIj8NCg0KPiBJTUFHRV9MSU5HVUFTLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4NCg0KLy9QZXRlcg0K
DQo=

