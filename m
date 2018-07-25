Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 32757 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Jul 2018 01:29:04 UTC
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-bo1ind01on0064.outbound.protection.outlook.com [104.47.101.64])
	by mail.openembedded.org (Postfix) with ESMTP id 56CE778887
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Q34J8mgYcHx1B7k0CSp+PT+xNe4VrEV3Cub8nxsG760=;
	b=lzuc63+SzO0Ac97Qkfitll7RslIo4A2XckAcyYPhs29KlkL3YuufQkFNZiyaBYgw3VUq2MjZAIuAXVtXQJjpeiLtL+CmFSXvcp5a2e9DMdaOIFCZ5G/HeYB/QMpVuC5u1gjpoY1P3tDgRVXC9ux3o24otL0EPAzGa29iZ1F+KXQ=
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM (10.164.150.144) by
	MAXPR01MB0297.INDPRD01.PROD.OUTLOOK.COM (10.164.150.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.21; Wed, 25 Jul 2018 01:29:01 +0000
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0]) by
	MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0%2]) with mapi id 15.20.0973.022;
	Wed, 25 Jul 2018 01:29:01 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] libbytesize: fix gettext not found issue
Thread-Index: AQHUI2SzJ6XwGv2Of0eBTSA0n9ONaKSeh7vMgACeUq0=
Date: Wed, 25 Jul 2018 01:29:00 +0000
Message-ID: <MAXPR01MB034871D225312CE9BAE6A46D91540@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR01MB03485F715FB80DCF083B704191550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>,
	<MAXPR01MB0348E0FB92BCD5785A4E22E391550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR01MB0348E0FB92BCD5785A4E22E391550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-originating-ip: [183.87.61.198]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MAXPR01MB0297;
	6:IianM7qxIMt8y75F4q+AxCtW/sPrTrXtJOP6q9FmOmZdMpWIIs6eGUtM0+IsIgCq7FHDxI5iOR9WM+qE13sKnlMYjaqxntYIIFi1MkXscpmimHCGZIK+iOFTqHKhKN1wesMrCn7mV9McpnHYv2k1DjWIw7KYpLFMvqUgXT1GK6+OizM2X+T7RXsIsPH6SUS9cYF8qIJWduHvr1LmtPVdcA+FXelyFBPHjXexWiZCx/Nrp6YdM3sqaN9I3Z/LTwpkXdkmw+3if+prDxYHyDkGKecVPVGBZbcRkAaZVy7eMDrPiykZVrW87mcFHIvLLDMxjAgeZ/QCu21MFzmbXJsYYgPnAmH++cPi3hMlTbL4OgWrzSbens86+3iJAW+N6M3PUQtGHbOvPHZVGrRSlpxYkcd1/h/gbV3U21IpQJczaI6wBxYE91FOj4VRGqupKaHIJceEtx1BpWyTzrIAzmOh5Q==;
	5:+c5lEf5NZn13mrB71bGERgEJgMoZTv/wEKmP4o1W4dbwigbqT7lGJQY8w5rHSOhyoNYB5fRj89vyc76tSLxIdCeetrTc5mvoX6f+sF9+HnK7fB++cQtW1ZLkNjtsRq6Bx7n3Aj239qRHlvfp7+FV1cpCGh2HJ3J/LcTh6CENUbQ=;
	7:iUqK8LarH/vZ1OPI/eK3p3RomsgFB/HZwfFZixDsR3FATa/ip1CGRLHCCWDWvDZF2sVqez7zyb9bDnXseESuLZOTvT/XCE9TaDB99VNugWxnP1B3iO7BIWmgUA8YTSapdanVJtnAupMi//QbfzVhgokOEzZAvzoin+KbSeDn7BvavteAxLFFfg0lh4V8T31t2gPrfQU5QGqv8YM8zlRonAQr0FJsXUy+4W38Nfxf9B0kdL2MbrrN8fU023W1ebiY
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: fc909e9e-374d-4f0e-cf10-08d5f1ce001b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600073)(711020)(4618075)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:MAXPR01MB0297; 
x-ms-traffictypediagnostic: MAXPR01MB0297:
x-microsoft-antispam-prvs: <MAXPR01MB029788D92FB9903F2629A2A991540@MAXPR01MB0297.INDPRD01.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(223705240517415);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(102415395)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:MAXPR01MB0297; BCL:0; PCL:0; RULEID:; SRVR:MAXPR01MB0297; 
x-forefront-prvs: 0744CFB5E8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(6116002)(606006)(3846002)(5024004)(72206003)(478600001)(8936002)(569054002)(19627405001)(14444005)(256004)(99936001)(14454004)(6306002)(54896002)(236005)(4326008)(6606003)(55016002)(33656002)(9686003)(25786009)(39060400002)(6916009)(5640700003)(2351001)(105586002)(53386004)(6436002)(53936002)(68736007)(2501003)(11346002)(476003)(486006)(54906003)(66066001)(5660300001)(99286004)(446003)(55236004)(2900100001)(7696005)(2906002)(316002)(74316002)(6506007)(102836004)(81156014)(1857600001)(8676002)(5250100002)(81166006)(186003)(86362001)(76176011)(26005)(106356001)(97736004)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB0297;
	H:MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: kwN4yYmbEDTvjMyF8sgOS2LEaraSOUgTWFnv3tT8HuZ5mxTUQuh8YKTYrE9H4uWyCnmy6UgRCueYDLp+SSPwsOd7XkeAkCmPxu6RSdsAjW/528S3aaaScCt36y0g4ETrTg+Z7B6gXkNVLd4mcJenPzA1Z/khWsB9QhqzeF+c+cMGNwAbf6RiGrKjP4eoE6gWZi0XStlmAtoVP/GLCbseEVC91cHZu9RgTTjAD4Rn5WW5a546O7HPMGx4ptRJJSqYF++HgkNEfc7nyYZfoxhKEXKs89OT/Vja3SeR95khBTrRFywsLEGadsrJO86SRjeW/FydEmRsXo5eYXuDff3PJHkTuS2RR2pUI0aOSe5Em4A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc909e9e-374d-4f0e-cf10-08d5f1ce001b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2018 01:29:00.8610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB0297
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH] libbytesize: fix gettext not found issue
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
X-List-Received-Date: Wed, 25 Jul 2018 01:29:05 -0000
X-Groupsio-MsgNum: 73498
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB034871D225312CE9BAE6A46D91540MAXPR01MB0348INDP_"

--_004_MAXPR01MB034871D225312CE9BAE6A46D91540MAXPR01MB0348INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

In Sumo branch, libbytesize_0.10.bb<http://10.bb> do_configure fails with e=
rror "configure: error: gettext not found", hence added a dependency to get=
text -native for the same.


Kindly review the attached patch and integrate it with upstream if changes =
looks fine.


Regards,
Aditya Tayade
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_004_MAXPR01MB034871D225312CE9BAE6A46D91540MAXPR01MB0348INDP_
Content-Type: text/x-patch; name="libbytesize-add-gettext-dependency.patch"
Content-Description: libbytesize-add-gettext-dependency.patch
Content-Disposition: attachment;
	filename="libbytesize-add-gettext-dependency.patch"; size=643;
	creation-date="Tue, 24 Jul 2018 16:06:44 GMT";
	modification-date="Tue, 24 Jul 2018 16:23:06 GMT"
Content-Transfer-Encoding: base64

bGliYnl0ZXNpemU6IGZpeCBnZXR0ZXh0IG5vdCBmb3VuZCBpc3N1ZQoKbGliYnl0ZXNpemVfMC4x
MC5iYiBkb19jb25maWd1cmUgZmFpbHMgd2l0aCBlcnJvciAiY29uZmlndXJlOiBlcnJvcjogZ2V0
dGV4dCBub3QgZm91bmQiCgpVcHN0cmVhbSBzdGF0dXM6IFBlbmRpbmcKClNpZ24tb2ZmIGJ5OiBB
ZGl0eWEgVGF5YWRlIDxBZGl0eWEuVGF5YWRlQGtwaXQuY29tPgoKZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L2xpYmJ5dGVzaXplL2xpYmJ5dGVzaXplXzAuMTAuYmIgYi9tZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC9saWJieXRlc2l6ZS9saWJieXRlc2l6ZV8wLjEwLmJiCmluZGV4
IDY5MDMwMjEuLmZlZGRlODAgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xp
YmJ5dGVzaXplL2xpYmJ5dGVzaXplXzAuMTAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBv
cnQvbGliYnl0ZXNpemUvbGliYnl0ZXNpemVfMC4xMC5iYgpAQCAtMjEsNiArMjEsNyBAQCBERVBF
TkRTICs9ICIgXAogICAgIGxpYnBjcmUgXAogICAgIGdtcCBcCiAgICAgbXBmciBcCisgICAgZ2V0
dGV4dC1uYXRpdmUgXAogIgogCiBGSUxFU18ke1BOfSArPSAiJHtQWVRIT05fU0lURVBBQ0tBR0VT
X0RJUn0vYnl0ZXNpemUiCg==

--_004_MAXPR01MB034871D225312CE9BAE6A46D91540MAXPR01MB0348INDP_--
