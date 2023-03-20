Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4353C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 16:04:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web10.18559.1679328240662662826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 09:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z2DvTwmf;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyCmRz1S3/1DG9DZ1TREvRIo7K5b6CRPlfq7AWNt8BU=;
 b=z2DvTwmf4H/cHeqARFV0qiO6w1048Xx3FoPkaOFrDprtUK1i+WMFQWiG3596gX9/ccKtYZvlOFvP0KLcFzx/CPCBcl7Wu1SV+oJHcuYtPRrbNOZ4nVJRUSf0O1MBsBmYG5hujPdixdmf+QN4PV1AvV2zDkyRqqDIaDDb+vbPq0Q=
Received: from DUZPR01CA0220.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::8) by AS4PR08MB8168.eurprd08.prod.outlook.com
 (2603:10a6:20b:58f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:03:54 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::7a) by DUZPR01CA0220.outlook.office365.com
 (2603:10a6:10:4b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 16:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.11 via Frontend Transport; Mon, 20 Mar 2023 16:03:54 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Mon, 20 Mar 2023 16:03:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0a6058c1fcfaf21
X-CR-MTA-TID: 64aa7808
Received: from ce69c8f17513.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1CADBF7F-C438-4294-8613-C6840CFD091E.1;
	Mon, 20 Mar 2023 16:03:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce69c8f17513.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 16:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjenhgcpBTUUOXew9rmKTd9EkLsuTkAda1wK9XEGMrWev12wceUWpP6pJDsTcqARO9w5Q5aYFmLHDNEGCdZiJd+gUka9A86jq4TNu3efLZvAetQ4YcpkzsmC4EhVggGABZe4a2OkWFcxv7TeiCtImV+GEO2K2ZTaWNoGVBp1b3RMn/gjGF7K5O+ghqPtBko2SwQTElOFcqlFH+4IjIjSHr/1XKxzjxgrb7DZPtAEjvzgqX6L8hf0pusRDamOmibrR1HYVwomBIDcx7kMptr2GISn7EjuWy3yJy+Lv/VmUEERfCeSDzcpreP8fIXLHNevlMf4W72rhz8aBemilJihlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyCmRz1S3/1DG9DZ1TREvRIo7K5b6CRPlfq7AWNt8BU=;
 b=jh4ncjVdnCo+5QK4+KF5wHqQynOb3NZwyOB4L0ALCXy+vy6Dnq3TMdpVVY7DCDnE+OlfArufB8W6Hmp5+IL/Wy3uXDyIEDKjcgCnfSTOCAbXg3n+Viw4m6YTXHtnNQ+xo3jg5/nN4aaVm/ygtcnxgFsAC2iK9PY+Emz6cVz6w/t6UQTjOFfHFaPoNqBZSPkkrt0BHUSpJz4gQeE1/iMACiv11Ier6BavjbdO3tYBMrU5kH3GjNHTlrDzpF0QnR0Hm9/EAvLwlf46NyV25dDBRkkThksqH0ho17yU3IR5qVJZghv6GViPnXIlOPuWAkdqBs5iV5A+RXWpBjD4VLDwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyCmRz1S3/1DG9DZ1TREvRIo7K5b6CRPlfq7AWNt8BU=;
 b=z2DvTwmf4H/cHeqARFV0qiO6w1048Xx3FoPkaOFrDprtUK1i+WMFQWiG3596gX9/ccKtYZvlOFvP0KLcFzx/CPCBcl7Wu1SV+oJHcuYtPRrbNOZ4nVJRUSf0O1MBsBmYG5hujPdixdmf+QN4PV1AvV2zDkyRqqDIaDDb+vbPq0Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7759.eurprd08.prod.outlook.com (2603:10a6:20b:516::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:03:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 16:03:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "TicoTimo@gmail.com" <TicoTimo@gmail.com>, "derek@asterius.io"
	<derek@asterius.io>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 3/3] python3-ninja: New recipe
Thread-Topic: [meta-python][PATCH v2 3/3] python3-ninja: New recipe
Thread-Index: AQHZW0WIWnMd6oshakinM9vmBnRv8w==
Date: Mon, 20 Mar 2023 16:03:39 +0000
Message-ID: <96BC65E9-C22F-4F1F-AC6E-C719ADFD17E5@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7759:EE_|DBAEUR03FT065:EE_|AS4PR08MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bac657-a70a-41ad-e015-08db295cb44e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GmlKP8YyVuQCQUi0K5wbUUR8OPB9SWyO8L3nkncL8JZYr/EHeAlCn0v99Dxr38CeCykFEBmz8XslAbPL6UWRGuBXEFkCsYenQngmPtGmVx5Xq3xr1QtokK4p30FoFHldTgRmSCaxapZULPwPwme/6DP5fAcbF6pteFSvfLVBJnnXUnHlCUxrXhiDWYNYoahoSo7U37cbgMOJkQE6ZpSe16TX3ItuZC1ZBynLYH42VB+AKLbgmJXquKtRvF82LhTPGg0Y8i3jdOjQaZ1VwuqMyV3uDxPv8nyDYKIg31GI50L9pSIfAAjusjHNPwimriJaQMiRJnhM7s7gfDOD6q2bUJE3YR3fXdFz5BK9ngtkzWWmo8pPXsTgQw5SLdQbiIba4kVEuuOvSlY1JAPBo7TBHrtrBTkKmt5+GBoWe3A7P4+wePRK7NCu2+8CtHi3GXULmOWVTbCXh+xyF6/AXZaeoD1fDKqF0nbE0fWC84cQVaAk1cw3WFw2EdVkYpDOnIxTeyewtv7zp4BxvM0509Z5jBb+gzlgjclUg26JTedp4z1Z2Fn42/Q+5cLIC2FB1MmTp3kuh4zbN3hBiiOuyqeXuYoD3FK5GYiZB7BVb7Wn4ilPJDntSQs1lN80fxZsu30xoW0tbSoZKhOhJ7qS5o2biuoReQU4YTm49UPRo7TxCGPRUq2K+HBEUe+UbjLXeyTihRGvesI3rxyTHdBWGXlnnCqzc5/egDak5snq+Kk/OkU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199018)(71200400001)(2616005)(186003)(6486002)(4326008)(83380400001)(478600001)(316002)(91956017)(66476007)(6916009)(66446008)(76116006)(8676002)(66946007)(64756008)(66556008)(6512007)(26005)(6506007)(54906003)(41300700001)(5660300002)(8936002)(38100700002)(122000001)(2906002)(86362001)(38070700005)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <18BEEA4261F7244D903395ACEEAD1AD5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7759
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7836c1b3-f426-43dc-bcde-08db295cab7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6e8FJthSGiNXuDHPbFtOztnuKvaBKYeY2Fas0y4gGKWgVHY+0E3S4xUcjekpKNUFdokioQNW01kfAVjm3euKe7fGpo1b0OI08LbTuYmzTKvMnvGFnxzyMePmStdX4YviJhTAY9tHeAhN1qNZHYhSBQq7ptSfzzUFBVEMTRrkgSVZzkxTRMdy/NFz9Op4a9J9c7/UwdKnOiBYlg5AA1tw6v33vsp5fXMFxsnkNBz7OVfj3p1Mfu8QcDSdnAtpt4GyysYLFpw0MjaW2RGXBp2jDYGbmLkhBk2KesVWNk7p67BhElligCjrcCO0vophQmy0uhgF//afgjUhFmr8YOnYHSB1wxHGn0OQ2y7rgHbQP35CbvS571GhFNwLN4EUvsrYijDtDQ7NCJryf9bzwS1CaVco6GkjKE5KhGQZr5+2MCchGScDEBzzOSxC4Jh1OfSp5ZuQ+ZI1sHXfbT01NcwR4Cj+6s72iRDgH4TXDkvRIRxd9T8VqIYoghtDS6kNYSnvADpI4X2f7MIF76JX9ZrtZgM2abVr++Y/OfVqIoL+8GT26zPRt2pnDZeMI7SVbJ5pLlwSdBveH2I0zSXw4nIhWnEjF7ZAAe8AqZVrJ8FUAd994WTI6E9/qj1PGaCRtNMilv4Bareqn2FQVwgVNRdPGUn0S1ATZRkkHdtE6QFrvPmn+w89+C0kUQQ09Vz2BCS7aI0in08eZGKm4nobaa1kFw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(82740400003)(316002)(478600001)(26005)(6512007)(6506007)(81166007)(47076005)(54906003)(2906002)(8676002)(6486002)(70586007)(70206006)(4326008)(36756003)(5660300002)(336012)(86362001)(356005)(36860700001)(41300700001)(6862004)(8936002)(2616005)(40460700003)(82310400005)(40480700001)(33656002)(186003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:03:54.1699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bac657-a70a-41ad-e015-08db295cb44e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8168
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 16:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101612

VGhlIHBhdGNoIGlzIG1pc3NpbmcgYW4gZXhwbGFuYXRpb24sIGFuIFVwc3RyZWFtLVN0YXR1cywg
YW5kIHlvdXIgU2lnbmVkLW9mZi1ieS4NCg0KPiArU1VNTUFSWSA9ICJOaW5qYSBpcyBhIHNtYWxs
IGJ1aWxkIHN5c3RlbSB3aXRoIGEgZm9jdXMgb24gc3BlZWQiDQo+ICtMSUNFTlNFID0gIkFwYWNo
ZS0yLjAiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFX0FwYWNoZV8yMDtt
ZDU9MTljYmQ2NDcxNWI1MTI2N2E0N2JmMzc1MGNjNmE4YTUiDQo+ICsNCj4gK0RFUEVORFMgPSAi
bmluamEtbmF0aXZlIGNtYWtlLW5hdGl2ZSBweXRob24zLXNjaWtpdC1idWlsZC1uYXRpdmXigJ0N
Cg0KQWxsIG9mIHRoZXNlIGRlcGVuZHMgYXJlIHRvIGJ1aWxkIGEgYmluYXJ5IHRoYXQgd2UgaW1t
ZWRpYXRlbHkgZGVsZXRlIHdoaWNoIGlzIHZlcnkgc2FkLg0KDQo+ICtTUkNfVVJJICs9ICIgXA0K
PiArIGZpbGU6Ly9DTWFrZUxpc3RzLnR4dCBcDQo+ICsgZmlsZTovL3J1bi1uaW5qYS1mcm9tLXBh
dGgucGF0Y2ggXA0KPiArIg0KPiArDQo+ICthZGR0YXNrIGRvX3BhdGNoYnVpbGQgYWZ0ZXIgZG9f
cGF0Y2ggYmVmb3JlIGRvX2NvbmZpZ3VyZQ0KPiArDQo+ICtkb19wYXRjaGJ1aWxkICgpIHsNCj4g
KyBybSAtZiAke1N9L0NNYWtlTGlzdHMudHh0DQo+ICsgY3AgJHtXT1JLRElSfS9DTWFrZUxpc3Rz
LnR4dCAke1N9Lw0KPiArfQ0KDQpZb3UgY2FuIGRvIHRoaXMgYnkgc2V0dGluZyBzdWJkaXIgaW4g
U1JDX1VSSTogZmlsZTovL0NNYWtlTGlzdHMudHh0O3N1YmRpcj0ke1N9IHdpbGwgcHV0IHRoZSBm
aWxlIGRpcmVjdGx5IGludG8gJHtTfSBmb3IgeW91Lg0KDQo+ICtSREVQRU5EUzoke1BOfSA9ICIg
XA0KPiArIG5pbmphIFwNCj4gKyBweXRob24zLXNjaWtpdC1idWlsZCBcDQo+ICvigJ0NCg0KVGhp
cyBkZXBlbmRlbmN5IG9uIHNjaWtpdC1idWlsZCBtZWFucyB0aGF0IGFueXRoaW5nIHRoYXQgd2Fu
dHMgdG8gdXNlIG5pbmphIG9uIHRhcmdldCBwdWxscyBjbWFrZSBpbnRvIHRoZSBpbWFnZSB0b28u
DQoNClRoaXMgZGVwZW5kZW5jeSBpc27igJl0IG5lZWRlZCBhdCBhbGwgYmVjYXVzZSBpdCBvbmx5
IGhhcHBlbnMgd2hlbiB0aGUgY29kZSBpcyBiZWluZyByYW4gaW4gdGhlIGJ1aWxkIHRyZWUsIHdo
aWNoIG9idmlvdXNseSBhIHBhY2thZ2Ugd29u4oCZdCBldmVyIGRvLg0KDQpEaWQgeW91IHRlc3Qg
dGhpcyByZWNpcGU/ICBJIGJlbGlldmUgdGhhdCBub3RoaW5nIHlvdeKAmXZlIHRlc3RlZCBhY3R1
YWxseSB1c2VzIHRoZSDigJhpbXBvcnQgbmluamHigJkgZnVuY3Rpb25hbGl0eToNCg0Kcm9vdEBx
ZW11YXJtNjQ6fiMgcHl0aG9uMyAtbW5pbmphDQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwg
bGFzdCk6DQogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9uaW5qYS9f
X2luaXRfXy5weSIsIGxpbmUgMTMsIGluIDxtb2R1bGU+DQogICAgZnJvbSAubmluamFfc3ludGF4
IGltcG9ydCBXcml0ZXIsIGVzY2FwZSwgZXhwYW5kICAjIG5vcWE6IEY0MDENCiAgICBeXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCk1vZHVsZU5vdEZvdW5k
RXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnbmluamEubmluamFfc3ludGF4Jw0KDQoNCklmIG5vdGhp
bmcgYWN0dWFsbHkgdXNlcyB0aGUgbmluamEgbW9kdWxlLCB0aGVuIGEgc2ltcGxlIHJlY2lwZSB0
aGF0IHNpbXBseSBSREVQRU5EUyBvbiBuaW5qYSBhbmQgY2xhaW1zIHRoZSBuYW1lIHdvdWxkIHdv
cmsgYmV0dGVyLg0KDQpSb3Nz

