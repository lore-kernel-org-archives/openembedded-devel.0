Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id BC37D6C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=essvote.com; s=omaha.092018;
	c=relaxed/relaxed; 
	q=dns/txt; i=@essvote.com; t=1551125259; x=1553717259;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wL/ZiQWVqKcufUAHY5C/QhAmTX9UzrDDj+89U681XeE=;
	b=jSwQwBRpLbxbkZEX+dp88HnkglH1KYqqtLqcnRG1QSMrXA5KDEn74pGpbKpwpoe9
	jgNwAODEbjZOdRMtYEmwfhG0x5abgHlb6l0v1gsJ9tY1wCC+cFJd/p35vMOSviiT
	LoISI41JbkCrqpe911CzaZzSgBw+640ACmeYPn5OF/NqRG2oWJfSz5KtfwgVSzcv
	dUS7vZTwqTUDp7PRZevN+eFICSqify2Weqn4lWXxFFwGLwcoMjbbigsOSFbHueP3
	0kH35SfazsaWdRBpd8dJS6oHS0Naf8sN2Tx9oPV/bHZXUYV36sFM4ZvaI8e57lPX
	Q1QRQZ30cNrBgEdHPFOPeA==;
X-AuditID: 0a000213-b21ff70000005a86-c0-5c744b0b85bf
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	7F.10.23174.B0B447C5; Mon, 25 Feb 2019 14:07:39 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%16]) with mapi
	id 14.03.0301.000; Mon, 25 Feb 2019 14:07:39 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Thread-Topic: [meta-oe][PATCH] plymouth: Update to version 0.9.4
Thread-Index: AQHUzS+K26r+GlOmQkmWUAnekV8NM6XxT68A//+g5vA=
Date: Mon, 25 Feb 2019 20:07:37 +0000
Message-ID: <655290B7709079438B7932553958E60DA1633629@ESS-EX01.essvote.corp.local>
References: <20190225172823.4030-1-michael.davis@essvote.com>
	<CALbNGRTxkytzRsu4MaB4vy=0k8gEDWytqsaq-6YydBPDhBik6A@mail.gmail.com>
In-Reply-To: <CALbNGRTxkytzRsu4MaB4vy=0k8gEDWytqsaq-6YydBPDhBik6A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.43]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRiBPQ5fbuyTGYMI1VYuLh5cyW9x88I3Z
	gclj56y77B7nNq5gDGCK4rJJSc3JLEst0rdL4MqYusmsoIW3YvGXK+wNjDd4uhg5OSQETCS+
	9X1l72Lk4hASOMEo8eLeWUYI5ySjxN++WcwgVWwCRhLnrm9iBLFFBOwkln54AGYzC8RKnD99
	hgnEFhawl5j9bxbQJA6gGgeJ5R/zIMqtJHYfeMUKYrMIqErc3nkRbCSvQJDEi0vLmCB2tTBK
	9Fy7CDaHUyBQ4tSlV2A2o4CYxPdTa5ggdolL3HoynwniagGJJXvOM0PYohIvH/9jhbDlJN4d
	/c4KcgOzgKbE+l36EK2KElO6H7JD7BWUODnzCcsERtFZSKbOQuiYhaRjFpKOBYwsqxgFcxMz
	cwz1UouLy/JLUvWS83M3MQJjg4uBSXgH44IZsYcYBTgYlXh4O11KYoRYE8uKK3MPMUpzsCiJ
	87bw5cQICaQnlqRmp6YWpBbFF5XmpBYfYmTi4AQRXFINjNZ7/kWYc3VuM+33fCgUPNPJiOXQ
	kYZE7uq7zJm3iwPWJvuXzPF8/DSwKF1WsbVUSHxVd+qS+Itb56R9NvsoGCNaf3sZ745LzaGL
	Nn1ax8OpIX6F39Oo/JTb7g+pNodOTal0t1U/N3X2fKcP3quM9/3cv+R99bfdvL/ffnUITy2a
	uDfy761Vh5VYijMSDbWYi4oTAe4KB3tzAgAA
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] plymouth: Update to version 0.9.4
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
X-List-Received-Date: Mon, 25 Feb 2019 20:07:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBoYXZlIGl0IHJ1bm5pbmcgcmlnaHQgbm93IG9uIGk2ODYgYW5kIHg4Nl82NC4gIEkgZG9u4oCZ
dCBoYXZlIGEgbmV3IGVub3VnaCBrZXJuZWwgdG8gdGVzdCB0aGUgbmV3IHJvdGF0aW9uIGZ1bmN0
aW9ucyB0aGF0IHdlcmUgYWRkZWQsIGJ1dCBteSBjdXN0b20gdGhlbWUgbG9hZHMgdXAgYW5kIHdv
cmtzIHRoZSBzYW1lIGFzIDAuOS4yLiAgSGFwcGVucyB0byBiZSBidWlsdCBhZ2FpbnN0IFRodWQg
bm90IG1hc3RlciwgYnV0IEkgZG9uJ3Qga25vdyBpZiB0aGF0IHdvdWxkIG1ha2UgYSBkaWZmZXJl
bmNlLg0KDQpNaWtlDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJl
YXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+IA0KU2VudDogTW9uZGF5LCBGZWJy
dWFyeSAyNSwgMjAxOSAxOjQ2IFBNDQpUbzogRGF2aXMsIE1pY2hhZWwgPG1pY2hhZWwuZGF2aXNA
ZXNzdm90ZS5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClN1YmplY3Q6IFJlOiBbbWV0YS1vZV1bUEFUQ0hdIHBseW1vdXRoOiBVcGRhdGUgdG8gdmVy
c2lvbiAwLjkuNA0KDQpPbiBNb24sIEZlYiAyNSwgMjAxOSBhdCA2OjI4IFBNIERhdmlzLCBNaWNo
YWVsIDxtaWNoYWVsLmRhdmlzQGVzc3ZvdGUuY29tPiB3cm90ZToNCj4NCj4gU2lnbmVkLW9mZi1i
eTogTWljaGFlbCBEYXZpcyA8bWljaGFlbC5kYXZpc0Blc3N2b3RlLmNvbT4NCj4gLS0tDQo+ICAu
Li4vMDAwMi1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjI4LnBhdGNoICAgICAgfCAzNCAtLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ICAuLi4ve3BseW1vdXRoXzAuOS4yLmJiID0+IHBseW1vdXRoXzAuOS40
LmJifSAgfCAxMCArKystLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAz
OSBkZWxldGlvbnMoLSkgIGRlbGV0ZSBtb2RlIDEwMDY0NCANCj4gbWV0YS1vZS9yZWNpcGVzLWNv
cmUvcGx5bW91dGgvZmlsZXMvMDAwMi1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjI4LnBhdA0KPiBj
aCAgcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1jb3JlL3BseW1vdXRoL3twbHltb3V0aF8wLjkuMi5i
YiA9PiANCj4gcGx5bW91dGhfMC45LjQuYmJ9ICg5MSUpDQo+DQpJIGhhdmUgdHJpZWQgc2ltaWxh
ciBsb25nIHRpbWUgYWdvIGJ1dCBwbHltb3V0aCBkaWQgbm90IHdvcmsuIERpZCB5b3UgcnVuLXRl
c3QgdGhpcz8NCg0KQW5kcmVhcw0K

