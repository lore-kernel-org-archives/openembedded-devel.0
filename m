Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 900 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Feb 2019 17:43:39 UTC
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 879687C719
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=essvote.com; s=omaha.092018;
	c=relaxed/relaxed; 
	q=dns/txt; i=@essvote.com; t=1551115719; x=1553707719;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2ZMcJHpBCSF+ihUEp1sYtH8jW/RRzDl90PDpa62jWII=;
	b=cdJFDrWSasvOIWa9TE78pLm9EIBH+pHhDXOmbgxu8o/3GHYyFtGY3S9iUm4Urrcx
	56yhYq8YopyOJJlVRfgzRpw1v4JdlgIIZTUHVnx3jS7pdfz5yYhhshzC68yk4MY5
	0Ot6U/U4s/uQJPU1eb6tCaqHsvrNLAbPh7kxW758Mpbyi4E9L2kHkLTlagKLU8RB
	IlpfojPWq2o5MFyHuKfCoRZhnmC6RDRKQEWnS0iluMHXyaPUu+cwR2Z9Ix7xhdzK
	1CgMYnmhDTWkI8wr3UWK4ve4/6B+uyjQ0EiWWuO4/4dsn5KuYnN1EdqbL1ZYL5v5
	1xY3BYvUkpB5+KTxQqUvDw==;
X-AuditID: 0a000213-b09ff70000005a86-14-5c7425c7b514
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	AF.2E.23174.7C5247C5; Mon, 25 Feb 2019 11:28:39 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%16]) with mapi
	id 14.03.0301.000; Mon, 25 Feb 2019 11:28:39 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] plymouth: Update to version 0.9.4
Thread-Index: AQHUzS+K26r+GlOmQkmWUAnekV8NMw==
Date: Mon, 25 Feb 2019 17:28:37 +0000
Message-ID: <20190225172823.4030-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.120]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWyRiBPQ/e4akmMwaOlJhYXDy9ltrj54Buz
	A5PHzll32T3ObVzBGMAUxWWTkpqTWZZapG+XwJXxe4pbwRWFimX77jI2ML6Q72Lk5JAQMJF4
	0tnD3MXIxSEkcIJR4uLt2SwQzklGif2nTrCAVLEJGEmcu76JEcQWEYiVmLdpJhOIzSyQJ3Hs
	3lE2EFtYwFqi/d4OoEkcQDUOEss/5kGU60nMfTgJrJxFQFVi58ap7CAlvAK2Es9WlIOEGQXE
	JL6fWgM1UVzi1pP5TBC3CUgs2XOeGcIWlXj5+B8rhC0v0banmRFkDLOApsT6XfoQrVYS7w8e
	ZoGwFSWmdD9kB7F5BQQlTs58wjKBUWQWkg2zELpnIemehaR7FpLuBYysqxgFcxMzcwz1UouL
	y/JLUvWS83M3MQLjgouBSXgH44IZsYcYBTgYlXh4RYRLYoRYE8uKK3MPMUpzsCiJ87bw5cQI
	CaQnlqRmp6YWpBbFF5XmpBYfYmTi4AQRXFINjJxOodeFqtqnsHXwypSopzsfcau9qbeO9Ueb
	ydx7fK2vZ+59OP8rt/+cK0xNLZVr1Cdrqa4v655a8mXRh4sNOuahc7jn/L3KMmsWm0vBiuWp
	nhmHfh8XPz+DIV1pxf5jmqcX/1EoOHby4hXdIIVPt424u48yvNcp2RJ41uump5rMwQiZo3f3
	LVViKc5INNRiLipOBADG09jicQIAAA==
Subject: [meta-oe][PATCH] plymouth: Update to version 0.9.4
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
X-List-Received-Date: Mon, 25 Feb 2019 17:43:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <046A36D78B913848A52480950B81F606@essvote.com>
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogTWljaGFlbCBEYXZpcyA8bWljaGFlbC5kYXZpc0Blc3N2b3RlLmNvbT4N
Ci0tLQ0KIC4uLi8wMDAyLUZpeC1idWlsZC13aXRoLWdsaWJjLTIuMjgucGF0Y2ggICAgICB8IDM0
IC0tLS0tLS0tLS0tLS0tLS0tLS0NCiAuLi4ve3BseW1vdXRoXzAuOS4yLmJiID0+IHBseW1vdXRo
XzAuOS40LmJifSAgfCAxMCArKystLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMzkgZGVsZXRpb25zKC0pDQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1j
b3JlL3BseW1vdXRoL2ZpbGVzLzAwMDItRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi4yOC5wYXRjaA0K
IHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtY29yZS9wbHltb3V0aC97cGx5bW91dGhfMC45LjIuYmIg
PT4gcGx5bW91dGhfMC45LjQuYmJ9ICg5MSUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtY29yZS9wbHltb3V0aC9maWxlcy8wMDAyLUZpeC1idWlsZC13aXRoLWdsaWJjLTIuMjgucGF0
Y2ggYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9wbHltb3V0aC9maWxlcy8wMDAyLUZpeC1idWlsZC13
aXRoLWdsaWJjLTIuMjgucGF0Y2gNCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggODYz
OGY3NWIzLi4wMDAwMDAwMDANCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1jb3JlL3BseW1vdXRoL2Zp
bGVzLzAwMDItRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi4yOC5wYXRjaA0KKysrIC9kZXYvbnVsbA0K
QEAgLTEsMzQgKzAsMCBAQA0KLUZyb20gMGMwMzQ1MzAzYjc5NzFkNmNlYzQ3OGZkOGI4MWQ2NGJj
MWZiZTBmNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCi1Gcm9tOiA9P1VURi04P3E/QW5kcmVh
cz0yME09QzM9QkNsbGVyPz0gPHNjaG5pdHplbHRvbnlAZ21haWwuY29tPg0KLURhdGU6IFR1ZSwg
MjEgQXVnIDIwMTggMjM6MjY6NDUgKzAyMDANCi1TdWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCB3
aXRoID49IGdsaWJjIDIuMjgNCi1NSU1FLVZlcnNpb246IDEuMA0KLUNvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOA0KLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQN
Ci0NCi1TdG9sZW4gZnJvbSBbMV0NCi0NCi1bMV0gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTAyMTkxDQotDQotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQot
DQotU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNv
bT4NCi0tLS0NCi0gc3JjL2xpYnBseS1zcGxhc2gtY29yZS9wbHktdGVybWluYWwuYyB8IDEgKw0K
LSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCi0NCi1kaWZmIC0tZ2l0IGEvc3JjL2xp
YnBseS1zcGxhc2gtY29yZS9wbHktdGVybWluYWwuYyBiL3NyYy9saWJwbHktc3BsYXNoLWNvcmUv
cGx5LXRlcm1pbmFsLmMNCi1pbmRleCBhMDk1NGYyLi5mM2IzMmZlIDEwMDY0NA0KLS0tLSBhL3Ny
Yy9saWJwbHktc3BsYXNoLWNvcmUvcGx5LXRlcm1pbmFsLmMNCi0rKysgYi9zcmMvbGlicGx5LXNw
bGFzaC1jb3JlL3BseS10ZXJtaW5hbC5jDQotQEAgLTMyLDYgKzMyLDcgQEANCi0gI2luY2x1ZGUg
PHN5cy9zb2NrZXQuaD4NCi0gI2luY2x1ZGUgPHN5cy9zdGF0Lmg+DQotICNpbmNsdWRlIDxzeXMv
dHlwZXMuaD4NCi0rI2luY2x1ZGUgPHN5cy9zeXNtYWNyb3MuaD4NCi0gI2luY2x1ZGUgPHRlcm1p
b3MuaD4NCi0gI2luY2x1ZGUgPHVuaXN0ZC5oPg0KLSAjaW5jbHVkZSA8d2NoYXIuaD4NCi0tLSAN
Ci0yLjE0LjQNCi0NCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29yZS9wbHltb3V0aC9w
bHltb3V0aF8wLjkuMi5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL3BseW1vdXRoL3BseW1vdXRo
XzAuOS40LmJiDQpzaW1pbGFyaXR5IGluZGV4IDkxJQ0KcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNp
cGVzLWNvcmUvcGx5bW91dGgvcGx5bW91dGhfMC45LjIuYmINCnJlbmFtZSB0byBtZXRhLW9lL3Jl
Y2lwZXMtY29yZS9wbHltb3V0aC9wbHltb3V0aF8wLjkuNC5iYg0KaW5kZXggYTViMTZjOTc5Li4z
MDU5NzdlNWUgMTAwNjQ0DQotLS0gYS9tZXRhLW9lL3JlY2lwZXMtY29yZS9wbHltb3V0aC9wbHlt
b3V0aF8wLjkuMi5iYg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvcGx5bW91dGgvcGx5bW91
dGhfMC45LjQuYmINCkBAIC0xNywxMiArMTcsMTIgQEAgUFJPVklERVMgPSAidmlydHVhbC9wc3Bs
YXNoIg0KIFJQUk9WSURFU18ke1BOfSA9ICJ2aXJ0dWFsLXBzcGxhc2ggdmlydHVhbC1wc3BsYXNo
LXN1cHBvcnQiDQogDQogU1JDX1VSSSA9ICIgXA0KLSAgICBodHRwOi8vd3d3LmZyZWVkZXNrdG9w
Lm9yZy9zb2Z0d2FyZS9wbHltb3V0aC9yZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFyLmJ6MiBcDQor
ICAgIGh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlL3BseW1vdXRoL3JlbGVhc2Vz
LyR7QlBOfS0ke1BWfS50YXIueHogXA0KICAgICBmaWxlOi8vMDAwMS1NYWtlLWZ1bGwtcGF0aC10
by1zeXN0ZW1kLXR0eS1hc2stcGFzc3dvcmQtYWdlbnQtY29uLnBhdGNoIFwNCi0gICAgZmlsZTov
LzAwMDItRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi4yOC5wYXRjaCBcDQotIg0KLVNSQ19VUklbbWQ1
c3VtXSA9ICJmZjQyMDk5NGRlYjdlYTIwM2RmNjc4ZGY5MmU3YWI3ZCINCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMmYwY2U4MjA0MmNmOWM3ZWFkZDI1MTdhMWY3NGM4YTg1ZmE4Njk5NzgxZDlmMjk0
YTA2ZWFkZTI5ZmJlZDU3ZiINCisgICAgICAgICINCisNCitTUkNfVVJJW21kNXN1bV0gPSAiNGVm
YTU1NTFkMjMwMTY1OTgxYjEwNWU3YzZhNTBhYTciDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRh
MTk3YTRmMWEwNTc4NWQ3NDUzZGQ4MjliMjMxMzUyZmIyZDA5MTcxYmQ4NmM1ZmZhYWZiYjJkZDY3
OTEzNTEiDQogDQogRVhUUkFfT0VDT05GICs9ICIgLS1lbmFibGUtc2hhcmVkIC0tZGlzYWJsZS1z
dGF0aWMgLS1kaXNhYmxlLWd0ayAtLWRpc2FibGUtZG9jdW1lbnRhdGlvbiBcDQogICAgIC0td2l0
aC1sb2dvPSR7TE9HT30gXA0KLS0gDQoyLjIwLjENCg==

