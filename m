Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5473C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 16:32:04 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.12962.1645201922767302059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 08:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MH9YGxs3;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645201923;
  x=1676737923;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h7LgBKBPtycG8k9juJvvYCSEgUpfQGOF0bhNiEOfkF0=;
  b=MH9YGxs3maxuTOhV3UZiDUI7hJ7F1YscsIpMssguEYvRsco1qpDBzHmG
   qPZtWnRe8Eu74UXv5OQtKXfhwKX2M+QMlK7PWd17/fkcO98LqVBENk3Lf
   xPlAT+pZMpiRR5YTv5p+V6eLanQTstgajtZRYG1hAmOSU/SQ/PUUuDY4e
   VeE9WvOyc2FQhzxvDAK9S1UGsuOQdT6bNdgq4ejtRDsySIGSplK8f6NPc
   /qVT0xEu3YgW2PNJ7YDSg+0mG8eOxP1HFDuqxHhSW/NrbXqxFc65oEtDm
   v5C8F+QMjRx3FaKKtyrvhFni9uxh9VFVBtGdICFwM1purjvdB3UPsFair
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] syslog-ng: adjust control socket location
Thread-Topic: [oe] [meta-oe][PATCH] syslog-ng: adjust control socket location
Thread-Index: AQHYJG3gt4rN/vS4s0KE6iKehdvO76yZgOSg
Date: Fri, 18 Feb 2022 16:32:00 +0000
Message-ID: <f9f5fd2b7e46412381fe3d40a383c78f@axis.com>
References: <20220218011204.5913-1-pkj@axis.com>
 <CAMKF1srXFHYf1bxDG5Cm74CU55bVgzcg3n690nJyqPWuavN6aQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srXFHYf1bxDG5Cm74CU55bVgzcg3n690nJyqPWuavN6aQ@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 16:32:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95378

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogZGVuIDE4IGZlYnJ1
YXJpIDIwMjIgMDM6MTkNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0
ZWR0QGF4aXMuY29tPg0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwgPG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1b
UEFUQ0hdIHN5c2xvZy1uZzogYWRqdXN0IGNvbnRyb2wgc29ja2V0DQo+IGxvY2F0aW9uDQo+IA0K
PiB0aGlzIGlzIGFscmVhZHkgYXBwbGllZCBpbiBtYXN0ZXIgdmlhDQo+IGI1N2Q4MjRmZGY4MjJh
NGMzZmRiMTUzYjkyMDYzZjg4NzA1ZTNhNmINCg0KRHVoLiBJIGFwcGFyZW50bHkgZm9yZ290IHRo
ZSAiW2hvbmlzdGVyXSIgdGFnIGluIHRoZSBzdWJqZWN0IChzZWUgbXkgDQpvcmlnaW5hbCBjb21t
ZW50IGJlbG93KS4NCg0KPiBPbiBUaHUsIEZlYiAxNywgMjAyMiBhdCA1OjEyIFBNIFBldGVyIEtq
ZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0K
PiA+IEZyb206IE92aWRpdSBQYW5haXQgPG92aWRpdS5wYW5haXRAd2luZHJpdmVyLmNvbT4NCj4g
Pg0KPiA+IENvbW1pdCBbMV0gY2hhbmdlZCB0aGUgcGlkZmlsZSBkaXIgdG8gL3Zhci9ydW4vc3lz
bG9nLW5nLiBUaGlzIGFsc28NCj4gY2hhbmdlZA0KPiA+IHRoZSBsb2NhdGlvbiB3aGVyZSB0aGUg
Y29udHJvbCBzb2NrZXQgaXMgc2VhcmNoZWQgZm9yLCBjYXVzaW5nIHRoZQ0KPiBmb2xsb3dpbmcN
Cj4gPiBlcnJvciB3aXRoIHN5c3RlbWQ6DQo+ID4NCj4gPiByb290QHFlbXV4ODYtNjQ6fiMgc3lz
bG9nLW5nLWN0bCBjb25maWcNCj4gPiBFcnJvciBjb25uZWN0aW5nIGNvbnRyb2wgc29ja2V0LCBz
b2NrZXQ9Jy92YXIvcnVuL3N5c2xvZy1uZy9zeXNsb2ctDQo+IG5nLmN0bCcsDQo+ID4gZXJyb3I9
J05vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnknDQo+ID4NCj4gPiBVcGRhdGUgdGhlIHN5c3RlbWQg
c2VydmljZSBmaWxlIHRvIHBvaW50IHRvIHRoZSBuZXcgbG9jYXRpb24uDQo+ID4NCj4gPiBbMV0g
MDBkMWQ2M2U0ZjdmICgic3lzbG9nLW5nOiBwcm92aWRlIGNvcnJlY3QgUElEIGRpcmVjdG9yeSBs
b2NhdGlvbiB0bw0KPiA+ICAgICAgICAgICAgICAgICAgICByZXN0YXJ0L3N0b3Agc3lzbG9nLW5n
IGRhZW1vbiIpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBsbW9yYWxlcyA8bHVpc2FsZWphbmRy
by5tb3JhbGVzcGVuYUB3aW5kcml2ZXIuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE92aWRpdSBQ
YW5haXQgPG92aWRpdS5wYW5haXRAd2luZHJpdmVyLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+DQo+
ID4gVGhpcyBoYXMgYWxyZWFkeSBiZWVuIGJhY2twb3J0ZWQgdG8gdGhlIGhhcmRrbm90dCBicmFu
Y2gsIGJ1dCBpcyBtaXNzaW5nDQo+ID4gaW4gaG9uaXN0ZXIuLi4NCj4gPg0KPiA+ICAuLi4vZmls
ZXMvc3lzbG9nLW5nLnNlcnZpY2UtdGhlLXN5c2xvZy1uZy1zZXJ2aWNlLnBhdGNoICAgICAgICAg
fCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3N5c2xvZy1u
Zy9maWxlcy9zeXNsb2ctbmcuc2VydmljZS0NCj4gdGhlLXN5c2xvZy1uZy1zZXJ2aWNlLnBhdGNo
IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvc3lzbG9nLQ0KPiBuZy9maWxlcy9zeXNsb2ctbmcu
c2VydmljZS10aGUtc3lzbG9nLW5nLXNlcnZpY2UucGF0Y2gNCj4gPiBpbmRleCAwZTFkMDk0OTIu
LjczMzQ4MDAzMCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zeXNs
b2ctbmcvZmlsZXMvc3lzbG9nLW5nLnNlcnZpY2UtdGhlLQ0KPiBzeXNsb2ctbmctc2VydmljZS5w
YXRjaA0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3N5c2xvZy1uZy9maWxlcy9z
eXNsb2ctbmcuc2VydmljZS10aGUtDQo+IHN5c2xvZy1uZy1zZXJ2aWNlLnBhdGNoDQo+ID4gQEAg
LTM4LDcgKzM4LDcgQEAgaW5kZXggMGNjYzJiOS4uN2YwOGMwZSAxMDA2NDQNCj4gPiAgLUNPTlRS
T0xfRklMRT0vdmFyL3J1bi9zeXNsb2ctbmcuY3RsDQo+ID4gIC1QSURfRklMRT0vdmFyL3J1bi9z
eXNsb2ctbmcucGlkDQo+ID4gICtQRVJTSVNUX0ZJTEU9QExPQ0FMU1RBVEVESVJAL2xpYi9zeXNs
b2ctbmcvc3lzbG9nLW5nLnBlcnNpc3QNCj4gPiAtK0NPTlRST0xfRklMRT1ATE9DQUxTVEFURURJ
UkAvbGliL3N5c2xvZy1uZy9zeXNsb2ctbmcuY3RsDQo+ID4gKytDT05UUk9MX0ZJTEU9QExPQ0FM
U1RBVEVESVJAL3J1bi9zeXNsb2ctbmcvc3lzbG9nLW5nLmN0bA0KPiA+ICArUElEX0ZJTEU9QExP
Q0FMU1RBVEVESVJAL3J1bi9zeXNsb2ctbmcucGlkDQo+ID4gICBPVEhFUl9PUFRJT05TPSItLWVu
YWJsZS1jb3JlIg0KPiA+ICAtLQ0KDQovL1BldGVyDQoNCg==

