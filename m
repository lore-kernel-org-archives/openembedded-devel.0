Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 972C060B3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2698; q=dns/txt; s=axis-central1;
	t=1582760337; x=1614296337;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=zsIGItznK0/uGNjSy8ieQaBqlbrxt3RTtXU1h856Qw8=;
	b=WJVQBiQ5GoALDoC+MoJIwn4wW1oG1u2/UQjXYxm3bZRfdZUC8I5ci+sg
	pu1pLC8Oho8aXczaEPEnxbxIjVzvtv1EeliqZS1WkSS2VTgFNg/PrH+IG
	acxSad4U+HE6qzFKDAUOhf5t/AtAyOvrpAZrX65LjXCr1FORMhE0f1oqF
	5WOJgrzqyvoUPalOC7TFR25U6DYHn7KWdhxE/AlgdGXknZPD7ZIx85kC8
	mTarbj2k/k4PVlUE4QyCgk987HEkmg6cseDRbuE1hnTMa7C6ItRTz4mav
	NIx5sUHb3HuEnC9gCBScaSzODsDZcCNGd9MvKHQ/6QxYmWlg7kWPgchC1 Q==;
IronPort-SDR: th9aIej1YPsmwbXe2EXVWfWy4DSSb1dDsbcPfQ2E+q0+NufbZQ7I/6TmCP+NAAgise7FwpARxY
	uvLkj2FFDRktqQaizU88dqOtpkxplO6xNTQTL92VrTJTEGZrRa1yEt8q/pUAwCs2uBoaghMikM
	ack7t+1bLGyJR0COfAoZSv+MDuwfftpykyfxFRKoCl+izyMjiC/Vo2dBQAn+9yM1Ko0EvBcCZ/
	RbaC6I9m2LWyPbPdtznnohXvJ1jaieBncOWVxmkwYqMgfAWlRKc0i0q1pHUpgv2o491J7cAnup
	a7k=
X-IronPort-AV: E=Sophos;i="5.70,489,1574118000"; 
   d="scan'208";a="5867442"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][zeus][PATCH 1/2] libldb: Do not require the "pam"
	distro feature to be enabled
Thread-Index: AQHV2FyjvxyHEUe9q0+vnU+UYngccaguSkpw
Date: Wed, 26 Feb 2020 23:38:53 +0000
Message-ID: <92dc761a5b4847109b4889eedeeaa335@XBOX03.axis.com>
References: <20200130210409.29802-1-pkj@axis.com>
	<ea500f22-d505-d82b-b0c8-c264945f6354@gmail.com>
In-Reply-To: <ea500f22-d505-d82b-b0c8-c264945f6354@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meta-oe][zeus][PATCH 1/2] libldb: Do not require the "pam" distro feature to be enabled
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
X-List-Received-Date: Wed, 26 Feb 2020 23:38:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IDxha3VzdGVy
ODA4QGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDMxIGphbnVhcmkgMjAyMCAxODozNA0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1i
ZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtv
ZV0gW21ldGEtb2VdW3pldXNdW1BBVENIIDEvMl0gbGlibGRiOiBEbyBub3QgcmVxdWlyZSB0aGUN
Cj4gInBhbSIgZGlzdHJvIGZlYXR1cmUgdG8gYmUgZW5hYmxlZA0KPiANCj4gT24gMS8zMC8yMCAx
OjA0IFBNLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgS2plbGxl
cnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4NCj4gPiBJdCB3YXMgb25s
eSBhZGRlZCBiZWNhdXNlIHNhbWJhIHdhcyBhIGRlcGVuZGVuY3ksIGJ1dCB3YXMgbm90IHJlbW92
ZWQNCj4gPiBhZ2FpbiB3aGVuIHRoZSBkZXBlbmRlbmN5IG9uIHNhbWJhIHdhcyByZW1vdmVkIGlu
IGNvbW1pdCA2MjA3MzMxZi4NCj4gPg0KPiA+IFRoaXMgZWZmZWN0aXZlbHkgcmV2ZXJ0cyBjb21t
aXQgYTE5MGMyZTMuDQo+IEkgaGF2ZSBhbiB1cGRhdGUgdG8gdGhpcyBwYWNrYWdlIHN0YWdlZC4g
SSBhcHBseSB0aGlzIG9uIHRvcCBvZiB0aGF0Lg0KPiANCj4gaHR0cHM6Ly9naXQub3BlbmVtYmVk
ZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC1jb250cmliL2NvbW1pdC8/aD1zdGFibGUvemV1cy1u
dXQmaWQ9ZjY0YzJkNjkxZWE1OTdhYTYyMjFlM2Q3NzA2YTRkMDIyZTA3YmZlYQ0KPiANCj4gLSBh
cm1pbg0KDQpEaWQgeW91IGZvcmdldCBhYm91dCB0aGlzPyBJdCBkaWRuJ3QgbWFrZSBpdCBpbiB3
aGVuIGxpYmxkYiB3YXMgdXBkYXRlZCB0byANCjEuNS42LCBhbmQgaXQgaXMgbm90IGluIHN0YWJs
ZS96ZXVzLW51dCBub3cuDQoNCi8vUGV0ZXINCg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEtbmV0
d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbGlibGRiL2xpYmxkYl8xLjUuNS5iYiB8IDMgKy0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2xpYmxkYi9s
aWJsZGJfMS41LjUuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2xpYmxkYi9s
aWJsZGJfMS41LjUuYmINCj4gPiBpbmRleCBiMTljOTY0ZDguLjlhOTNlNjZiNiAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2xpYmxkYi9saWJsZGJfMS41
LjUuYmINCj4gPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2xpYmxkYi9s
aWJsZGJfMS41LjUuYmINCj4gPiBAQCAtMzYsOCArMzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9weWxkYi5oO2VuZGxpbmU9MjQ7bWQ1PWRmYmQyMzhjZWNhZDc2OTU3ZjdmODYwZmJl
OWFkYQ0KPiA+ICBTUkNfVVJJW21kNXN1bV0gPSAiMzM5YTQxYWM5ZWZhZWM2ODBlNmQxNDY5ZGQ5
YWEzNWIiDQo+ID4gIFNSQ19VUklbc2hhMjU2c3VtXSA9ICIxOTlmNTg2MWFhODYzZjUzOGVjNjZk
NWZhOTVlY2MxMzI1NGEyMDMwYzUzZGFmMGU0NzM2M2ZhOWJhMjM1YzY4Ig0KPiA+DQo+ID4gLWlu
aGVyaXQgd2FmLXNhbWJhIGRpc3Ryb19mZWF0dXJlc19jaGVjaw0KPiA+IC1SRVFVSVJFRF9ESVNU
Uk9fRkVBVFVSRVMgPSAicGFtIg0KPiA+ICtpbmhlcml0IHdhZi1zYW1iYQ0KPiA+DQo+ID4gIFMg
PSAiJHtXT1JLRElSfS9sZGItJHtQVn0iDQo+ID4NCg0K

