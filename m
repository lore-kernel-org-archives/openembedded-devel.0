Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2125.outbound.protection.outlook.com [40.107.92.125])
	by mail.openembedded.org (Postfix) with ESMTP id A4E7B6C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 04:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=A2cNoNETDgMtPjHdrZ5eFCgBdhtdQrjZCM0dqeDkA3AAtO5kurn+gYxJV4LPxuAth2r3k5x+bQogKDZ0E0llE9VcvnNbfIMbwaX+1IA/12sY3e4OQTJFOEuo1+N/eCF/GfV+Cw8FCRINxndNBtSdP+YeT4W/pGe5uRxWRRsP8jUhPIKRVc6tjXXUUEdanxx+m+Uvcxax4stXBx1MgcokhGZqrYKblzNdCqdfJKuOOjvXdMrTnTNv8da+aTsERUbtE4/gXm7WtsrEn7Z+Y4Y+RLKJOIYI5G/7P2jtwvGHInK9mOsczTedZlzmJignESAzVm9wKMpXMJYfl0gX3rY4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YeWHWaj6AoCLtJMSd22iEUFKNk/MPPD4veV8kkm41i8=;
	b=Wl8XKL+J8z9ByC/MSo+ndnepCuQk/q1MBERJ5BZSfiXW33y6hAF5HBBTvRbUym9Ndrb5TpqSLBTYhg5PJCfo9WFUA3NVpiQGvcFgbqTmUR1LqliaLKlSAuZQb9ZYOLYyspwSRP8T0zqn3DN/5QA0fgqECdz3ovLIbgcE4XXosOec/uUuGICnjfKSh2kV/nUXwoSsWGGF1xmPRHVaLUhzt6nSa+Hw1rkDsR60LZIngtWVx7MGPwbs0pzJ0qVcjg0l5g2HnTsu3f03wu3vZxyju7joR5VaeLdZnFrYOYpf60HHSDBTqwKVAIzQeloYilmwQ+Pc1f6oY16HLM4JFjaUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YeWHWaj6AoCLtJMSd22iEUFKNk/MPPD4veV8kkm41i8=;
	b=dLdlzD0qBhvkfzZQITlX+xzpuArbE3DGedwdoFKteBTV3XNd9sHJ3GkQp+YVCFOwQYU7mYoyrijNx20ZyVuGTtNhfFRE8S2j6yvLiRfyNpMLfr0lnYhOupxYwSB419w0WMsb9W7TtboaAJP6dZDHd0vAIJfHxDPpveBfqyTe0Xc=
Received: from BY5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:a03:1d0::20)
	by BN8PR04MB5586.namprd04.prod.outlook.com (2603:10b6:408:a8::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12;
	Mon, 30 Dec 2019 04:56:56 +0000
Received: from BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::201) by BY5PR04CA0010.outlook.office365.com
	(2603:10b6:a03:1d0::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Mon, 30 Dec 2019 04:56:56 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT048.mail.protection.outlook.com (10.13.156.199) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Mon, 30 Dec 2019 04:56:55 +0000
Received: from OLAWPA-EXMB2.ad.garmin.com (10.5.144.24) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Sun, 29 Dec 2019 22:56:50 -0600
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	OLAWPA-EXMB2.ad.garmin.com (10.5.144.24) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Sun, 29 Dec 2019 22:56:51 -0600
Received: from OLAWPA-EXMB4.ad.garmin.com ([fe80::d9c:e89c:1ef1:23c]) by
	OLAWPA-EXMB4.ad.garmin.com ([fe80::d9c:e89c:1ef1:23c%23]) with mapi id
	15.01.1779.002; Sun, 29 Dec 2019 22:56:51 -0600
From: "Kolbus, Peter" <Peter.Kolbus@garmin.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-python][PATCH v2] python3-html2text: add recipe
Thread-Index: AQHVvmLKI2T7Uv4dZUqYxiR86g6HO6fR1DiAgABKGxE=
Date: Mon, 30 Dec 2019 04:56:51 +0000
Message-ID: <6D924BDC-E6A9-44B5-A481-1D15F4DDE75A@garmin.com>
References: <20191229161124.19759-1-peter.kolbus@garmin.com>,
	<CAMKF1sont0h5JJ_w6_-muiBMUjwo4KAZrkXqKyvdfdAjaUsZJw@mail.gmail.com>
In-Reply-To: <CAMKF1sont0h5JJ_w6_-muiBMUjwo4KAZrkXqKyvdfdAjaUsZJw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25136.004
X-TM-AS-Result: No-26.364100-8.000000-10
X-TMASE-MatchedRID: WMT2WRIkHPM4HKI/yaqRm/ZvT2zYoYOw9zefYQcHZp8oglbEnCQoca5P
	qqbCfIUPTAK2sVwEDfY9Wev+qZL2rjzjJVo1vX/4S0GlPH9kR3KpXdWa4gU0S7BFXxNSTFX9Pgv
	9Nu23+XERYyKiJ7BL10W4jaAkBPxSsXnsamJ84SsxVcFqdPEwQkyQ5fRSh265Bph69XjMbdmAec
	OigRAltXPOZrOy9l/4zmAtCAgAUH6qPTUWVYFp2uCFhwSlJTKmfayZELfSO8tMjJKuXxh7th1WI
	+unqp55URRwUoZJVeGUkcAE+Gh0xGrRCqFi6ztkx/Stmah0FpZoS4ooXcjzXY1OuwjPrj0EG88r
	sck3r8QvJ+I7jC1cP6i0S1zpoGCUENBehitButgktnKC/kfM5fy0wgIDXBCTwUqLhUY4dAI4ULA
	Zwl+oC+LzNWBegCW2PZex/kxUIHUEs/H1wMysprHlqZYrZqdI+gtHj7OwNO2FR9Hau8GO7gP90f
	JP9eHt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--26.364100-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25136.004
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10001)(10019020)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(478600001)(86362001)(70206006)(33656002)(356004)(5660300002)(246002)(7636002)(53546011)(4326008)(70586007)(7696005)(26826003)(6916009)(8936002)(336012)(8676002)(966005)(316002)(26005)(2906002)(2616005)(426003)(76130400001)(36756003)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR04MB5586;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ead3600-62ab-404a-6430-08d78ce4b178
X-MS-TrafficTypeDiagnostic: BN8PR04MB5586:
X-Microsoft-Antispam-PRVS: <BN8PR04MB5586CCD5FB16ECDD90EB61F1FF270@BN8PR04MB5586.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0267E514F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdKcI8XX7O9e3qbFvUUl0p3/jJSKRtPxGLrZ38Z9h4476l7nBK000nxROepmqqs6EwczvTiPMTJ2SqGvIufRJlmGyQemsQV39wYoAg93wW/gK/zFOzS0mFWkZEPRL20ej3hyektHSm4vUUpmyak5524tfPdgJHdNpxhgvznEEGSdWTj6AXav/qWKGYX5b2LoFT1TPLKIT2/mQuWcISBw+SWW3rs4kqTE4QnxnQvisIYqc+62VjnS3KwLynz2Ib02MW2ZEYFXXknm29Smv3K0lrtQI3R9EPSiImwkGLvvA0DtbcyWtu1MV7VexaHHBfroGs+LVzkVwr0Fanl7n6ghrOTa7jfgHO0L5zYqA0wb+Yt7/QoHQ2R2LbtNAYVcqy8SP46CTi2DQQhdHOB/sW6moMGiu7IODiOPsrchHvnLgFhQC7gU40NvbmvbmFP31Sn/dNRREiJTMiZ7X4DihD2xXe3Rkc1XoghUHsrc4yl4h9KXGZ3HTkkM8nHML16tau1U94pcIjcKxBhRtfLWS+Nig9NeU+MzzAL2pP58f+P3tkQ=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2019 04:56:55.2993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ead3600-62ab-404a-6430-08d78ce4b178
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5586
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python3-html2text: add recipe
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
X-List-Received-Date: Mon, 30 Dec 2019 04:56:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gT24gRGVjIDI5LCAyMDE5LCBhdCAxOjMzIFBNLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPiB3cm90ZToNCj4NCj4g77u/Q0FVVElPTiAtIEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgYW55IGxpbmtzIG9yIG9wZW4gYW55IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgdHJ1c3Qg
dGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiByZGVwIG9u
IGJvb2xlYW5weSBpcyBkcm9wcGVkIGluIHRoaXMgdmVyc2lvbiwgaXMgdGhhdCBpbnRlbnRpb25h
bD8NCg0KaHRtbDJ0ZXh0IGRvZXNu4oCZdCByZGVwIG9uIGJvb2xlYW5weeKAlCBsaWNlbnNlLWV4
cHJlc3Npb24gZG9lcywgYnV0IHdpdGggdGhlIGhvbGlkYXlzLCBJIGhhdmVu4oCZdCBnb3R0ZW4g
dG8gYWRkcmVzc2luZyB0aGUgUUEgZXJyb3JzIGluIHRoYXQgcGF0Y2ggc2VyaWVzIHlldC4gKFdp
bGwgZ2V0IGEgdjIgdG8gdGhlIGxpc3Qgc29tZXRpbWUgdGhpcyB3ZWVrIHRob3VnaCkuDQoNCj4N
Cj4+IE9uIFN1biwgRGVjIDI5LCAyMDE5IGF0IDg6MTMgQU0gUGV0ZXIgS29sYnVzIDxwZXRlci5r
b2xidXNAZ2FybWluLmNvbT4gd3JvdGU6DQo+Pg0KPj4gcHl0aG9uMy1odG1sMnRleHQgY29udmVy
dHMgSFRNTCB0byBNYXJrZG93bi1mb3JtYXR0ZWQgdGV4dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBLb2xidXMgPHBldGVyLmtvbGJ1c0BnYXJtaW4uY29tPg0KPj4gLS0tDQo+PiAuLi4v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWh0bWwydGV4dC5pbmMgICAgIHwgMTIgKysr
KysrKysrKysrDQo+PiAuLi4vcHl0aG9uL3B5dGhvbjMtaHRtbDJ0ZXh0XzIwMTkuOC4xMS5iYiAg
ICAgICAgICAgIHwgIDIgKysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0K
Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1odG1sMnRleHQuaW5jDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1odG1sMnRleHRfMjAxOS44LjExLmJiDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbi1odG1sMnRleHQuaW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLWh0bWwydGV4dC5pbmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAw
MDAwMDAwMDAuLjY3OGRjZWYzZg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWh0bWwydGV4dC5pbmMNCj4+IEBAIC0w
LDAgKzEsMTIgQEANCj4+ICtTVU1NQVJZID0gIkNvbnZlcnQgSFRNTCB0byBNYXJrZG93bi1mb3Jt
YXR0ZWQgdGV4dCINCj4+ICtIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vQWxpcjN6NC9o
dG1sMnRleHQiDQo+PiArDQo+PiArTElDRU5TRSA9ICJHUEwtMy4wIg0KPj4gK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFl
NTA0Ig0KPj4gKw0KPj4gK1NSQ19VUklbbWQ1c3VtXSA9ICIyMWFhZDdlYzk1YjcwNjA2MDI0Yjc4
M2M4MjUzODk5YyINCj4+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjUxNmI5YzEwMjg0MTc0ZTJh
OTc0ZDg2ZjkxY2FiMDJiM2NmOTgzYTE3NzUyMDc1ZGE3NTFhZjBlODk1ZWY1ZSINCj4+ICsNCj4+
ICtpbmhlcml0IHB5cGkNCj4+ICsNCj4+ICtCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVz
ZGsiDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1odG1sMnRleHRfMjAxOS44LjExLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1odG1sMnRleHRfMjAxOS44LjExLmJiDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwLi45Y2I1YjAxZWINCj4+IC0tLSAvZGV2L251
bGwNCj4+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
aHRtbDJ0ZXh0XzIwMTkuOC4xMS5iYg0KPj4gQEAgLTAsMCArMSwyIEBADQo+PiAraW5oZXJpdCBz
ZXR1cHRvb2xzMw0KPj4gK3JlcXVpcmUgcHl0aG9uLWh0bWwydGV4dC5pbmMNCj4+IC0tDQo+PiAy
LjI0LjENCj4+DQo+PiAtLQ0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IE9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBodHRwOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQpDT05GSURFTlRJQUxJVFkgTk9USUNFOiBU
aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGZvciB0aGUgc29sZSB1c2Ugb2YgdGhl
IGludGVuZGVkIHJlY2lwaWVudChzKSBhbmQgY29udGFpbiBpbmZvcm1hdGlvbiB0aGF0IG1heSBi
ZSBHYXJtaW4gY29uZmlkZW50aWFsIGFuZC9vciBHYXJtaW4gbGVnYWxseSBwcml2aWxlZ2VkLiBJ
ZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgYnkgcmVwbHkgZW1haWwgYW5kIGRlbGV0ZSB0aGUgbWVzc2FnZS4gQW55IGRpc2Ns
b3N1cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBvciB1c2Ugb2YgdGhpcyBjb21tdW5pY2F0aW9u
IChpbmNsdWRpbmcgYXR0YWNobWVudHMpIGJ5IHNvbWVvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50IGlzIHByb2hpYml0ZWQuIFRoYW5rIHlvdS4NCg==

