Return-Path: <prvs=674b614e5=Alistair.Francis@wdc.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 22:08:10 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7DD6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1527113293; x=1558649293;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=a+jO9ptRD5IQp7GonA+grdScciqHvnN5o+H/6RNlgTk=;
	b=egvM2d4XXLqhZuloY8VoolhCnpV7GBdvmDcl/tpzjkBevKF5Q2iuLD1B
	uMcPxy7iBzbfKKxdTDQIrM3/FV/NStMLearga7WNc1df3FFOTO0hsxY6/
	LhhR21Du29Z6AT5E2JP+zLroBHurFMjZ5pzEpfWhvghU6Ty20+CfaSXP/
	Ho+e8kRn7Xq1/Q7CyftM99A8RzTK7vUP3PgOkrHbOAKxKBSTRLC5UlKZf
	d9GWLqlANFanAdLXnrHrHrTY9/3Z4xFRv3BzZ56jF5u0WSDKn9PeKLKEI
	OdjtWr8wz7O0/ekvk5To8G0RHxqekWQp27dKhbYUtHVfP/deveEcfxohY Q==;
X-IronPort-AV: E=Sophos;i="5.49,434,1520870400"; d="scan'208";a="79711820"
Received: from mail-cys01nam02lp0047.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.47])
	by ob1.hgst.iphmx.com with ESMTP; 24 May 2018 05:58:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l7SD/2VWAcEXVu458xokZ35c5RKZ+5f/XCW+bGFuTIg=;
	b=OLr5YNOgg2Hc1uqL5X9KuC+usqNy6RAZZBcFvwptKBWtpXkuEQVVVaa5AvEJidTXpTAf3fsNGsn7JGEg/tTrfwquZuGK5JAPq10MiJ6Pw9TErvJT5LFKnpHO5NYXAI9pcaVfU034udLWkCDY7EHgtVthgBtEDR5IroSNukGefTk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.250) by
	BN6PR04MB0387.namprd04.prod.outlook.com (2603:10b6:404:91::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.797.11; Wed, 23 May 2018 21:58:31 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 14:58:12 -0700
Message-Id: <20180523215812.98595-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [199.255.44.250]
X-ClientProxiedBy: AM6PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:20b::43)
	To BN6PR04MB0387.namprd04.prod.outlook.com
	(2603:10b6:404:91::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0387; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	3:YTzUfuOpPrb9h1sp2BQVsrqF8q19CZXVEU0fO4OKqbGFkHagLnkPsuHThC1zj09XgNdwPIl9fffjWwgR0YpiM2GRqDj4yhxMfVzB+QR1tOlha7JNQCEVZnFHNlDmpLp1oxyuUUVpIs/Z3aFhlfl08TegDRngXOos9tJtBfGYBw1zcvYv4B/olafzjknPKBzeNHIMI55GCESHjXpTg6z03TySE/gyJx4VUIP67h1GKcJwW9K4sin1SfOojYzN/QCy;
	25:Q6636JzL6ODx+V7TEK1skjsABDJ/0U7Fkr9N3+aHoPAmewfvnPsbrscF8F4VNQk3wDsa1qSSHQWaBnWiKwToRJD2Q2OPYnhN7fBfFT5lMGE3EE8cEmfp3YrvetgvtpeIb4/BSqX4j1VHK0CJzD+OL3P6rBxRBoZ3OKJlMhhjLi1f6aF2ISD8eMHrmupCjW4sBU13xgblNETWdZk9pDm/WijyFj+X/8makHYjeBqtHJZZfzTShMiXh+sgxKV5UgCNCj60ezTCHR5+QMNEwrhDaM0fVpVfTGdlX1TedSSRYLNijuJ6cUMvsHhpUTWFd5rT225qKdDNfbywdovjIHpuaw==;
	31:O97EPhdFAbMDmstq/l4TqcVcRQwtH8A0DD7OdQ5dniqBuvDNl8aGiOUIapi/F9rwirDd/OlqX5vrCmOKKwQ3Gx4KE2s3WquCe/Yqrct/2F0D8/fCiOnP6CeN3HvOfbkcP9w8PDQ0i7/VI0pHZvnq60e4i97iA7+KL6exaW+ivdVvUhDLbrgwNQgUP1fVb4JXXp50WUdKA+7lZZPF93tYzSiJtcKb89KWeQKdhY6oOB0=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0387:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	20:Wquin0XtC69Ac4k78Zo2zyZ2l5CXdO38WcsERlkP9MIVEXyKJg+GHrjkYLIblsHs1XbGZOV2ppIGKWLhBeino7SUU8WAumidUoKf9Wf3sMaKy0maQo8EzLLTdKWjJXP4KRYV5EUARzbYp7ULF8qbzPuMs2WUtQFXnPy0gOeb0u7jNO+XyTvf02WDNNks7h+U43pdokMj7v3hXbcnY+GergLnDzgS9AZsdeDlkiPalInFtqag3sXtI1WT82h2pzmd7gwHJNAn905qkKkIJFTZt2BxJoqusKX+98c46Auj5WkrQmQ37iS045oYFJXKo3XCFX6kjrg11l2Ou6AVfjDTXufc9KACJA0gpprOKfoVmSpBKzSuOkJ5FOydRjkLbyvi7v+NY/Mi2Ntbxh7/+olQM/rQJmMRObsX4sdtfTXaOF6tBTwtZNGKiNQpBifVN8YPePDgPrCZynX/cu4hBwu04dZZz4VFdVZGoH/GseDF3vBYhVB4oehgdzqsgEWhrQJP
X-Microsoft-Antispam-PRVS: <BN6PR04MB03874C6E5EFE593AEA0602AB906B0@BN6PR04MB0387.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(72170088055959)(209352067349851)(192374486261705)(131327999870524)(35073007944872)(85827821059158)(788757137089)(21532816269658)(50823345283023);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231254)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:BN6PR04MB0387; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0387; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	4:7ZMQwxQe6aSzQmhM7+7QFMncsZCUU3+fWrZnKYTEgKahIwXme0j6rFjmTGqqk7rebiOSOXtRWHuTQk275YQsFOa1I+2eSb7IFhEXoSgs0NnpRVhU2WgxeNHk1exFYCH8W88UkSEAOMR45mc3JVmEFxF8lJO6OHI4lhjNWh13gNOEUElpI43h56/LOXGVp2qpAW4Cr8dofWGH18IHH47xem06d4pIzsHmokQMtDCG1LMUx3+BVpTPumTduKbxCQ6epf++Ct2dRGTqPUFXentLMVlwiwA/ocdDEwEJS3ZkNe9I6mwuuUfdBxoHweL4AFDmxLG9jHBH1isNO9vitQGdXQ1187mEiubQPYf0jMbxuA3lQtKj5NQnCIwnhK+AveORh+otJMdtpBjWnbY7nEytYB3Zdlz2X3v3Ya0Qi8t6zPrbgIxikB88SOASh04hKeloD5yD/ywzxg2mrcFiv2jv359zA7da8Yjc9HgIKc1BBMXuGtooE/8KEE1fTdQdR0H71v+Lo4M2Kv1qgadGgRlXVYDfJAq3ers/F8bcdXqWG3ztfbd3/5HyY35sAveNymKXktrWGi4SVAUtEUlrXDepC4Gt1FhLtQkRnE8IyOvnq9Y=
X-Forefront-PRVS: 06818431B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(39380400002)(39860400002)(346002)(396003)(366004)(377424004)(55674003)(189003)(199004)(15594002)(2616005)(10000500002)(956004)(486006)(186003)(476003)(386003)(6506007)(5660300001)(105586002)(26005)(1720100001)(36756003)(6116002)(7110500001)(2361001)(51416003)(1076002)(3846002)(97736004)(44832011)(16526019)(59450400001)(1857600001)(52116002)(2351001)(19273905006)(316002)(48376002)(8936002)(10750500005)(10710500007)(6666003)(2906002)(15650500001)(2420400007)(50226002)(6916009)(86362001)(575784001)(47776003)(50466002)(16586007)(72206003)(66066001)(966005)(551544002)(68736007)(478600001)(6486002)(106356001)(4326008)(39060400002)(53366004)(53376002)(305945005)(53386004)(25786009)(7736002)(5890100001)(53936002)(16200700003)(53946003)(8676002)(81156014)(6306002)(81166006)(6512007)(559001)(569006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0387;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0387;
	23:uI/Fkh7hXAZOxpOpuTRKDqNxqwYY0ZTlFSBTbW9LD?=
	=?us-ascii?Q?fu1C7qs4X0YQL1rmdHlZOHUnEaA3oTeaNE1A9FFp5OS6vyU5G2PIq9fHiELv?=
	=?us-ascii?Q?kp8AQ+J4n3d3I0pt6NBuMB3APwGmW3/m9sjHZKRiPQN9fAqGC1h8srlJ/DKk?=
	=?us-ascii?Q?3fqplkiVbC0BYdLLUyJJ91QLshGOrpPfShZTWNaqfDjTPb4mXvdMXJcgHwyr?=
	=?us-ascii?Q?rR2ma9uNixS/r4cw77cuRni3H1r7CzgjI5aJ7smFmqExR4fXa9pHy9S9vFW8?=
	=?us-ascii?Q?fZ/0DosyANwFDqaoDDVJqkel7hvaZgn2DRdM56UcmjAcTYH2MrPzauncY/Ch?=
	=?us-ascii?Q?UT+VlqDZI4sTqo7lLDLdkjy29FQAWYUxoTAYTPzVyl6y4EYfB9+jj819tls1?=
	=?us-ascii?Q?YBA7lXr3TfIOZlE+A6Eca+3lGaWjUwnHbjb++7eSwDm+V7YEdUlteCCBTJCT?=
	=?us-ascii?Q?yCGxfMSahEEQ+NXDI7xo5Lr+usSsj43pPVh5ruDHBP7Xd4CsqYE0P/WSvSA1?=
	=?us-ascii?Q?e8U6ZTWRJF3sJDUNzTc3OH2RCmcVDRQxg5KC9fanADz+KuNKfK/hdDLxMw1w?=
	=?us-ascii?Q?4PjUls9XSVyPW8TaeTHTRsxS1PQw4sJLshMu5DpDdKyCjAZYKq7BLuzVoZ6o?=
	=?us-ascii?Q?C19qzTTW7IHXgEMCINpeAOfDAIKkk/Xe3zan87DDiU3ABOnRlLHLdliyW6dh?=
	=?us-ascii?Q?TR6qkIC3u8iTzV7EQSUD1SDM5hsD1p9kECdHTza0C+HdVJfeVszn/0GsYBmU?=
	=?us-ascii?Q?qL5ezk9ts29VS2Awub+i+Y/twHtKsEW1Yo3fwJTUqzrSfUZMc3gH91NTXWa0?=
	=?us-ascii?Q?B/Kpfo0hijMhhmZDY0HSXodjeUfkzFG+YLasiU2oTRefl11HxXaIUti+R4Zk?=
	=?us-ascii?Q?3pGaAAAgb/g1onb+KUcTegbVtLKSvbvdYzVHaBSU2UEpLZ9e+xJn5GEwkRPM?=
	=?us-ascii?Q?vKmWsUIvOMoNxHxU7gyjLDk8k98QIXtZ3WZ82YoVsIfdLtUZIkBPKHw3CTXK?=
	=?us-ascii?Q?Eu5wWao6HU3MqKNq60BrHiAHzxfRUCs1W5kBTkf9NgjDi7WiYmWzflrU2PNs?=
	=?us-ascii?Q?VSnJwXtBpNbRcy5DQj8uNSel6kTeMEjQhwRFW7SSX9GGZQhUlD2moYYGagsU?=
	=?us-ascii?Q?PxkVRVmGDWZdccm5xfnQjqeiZuZBwEhGRAP/WfoGUt+OML9mMWGJu8xc/5Fy?=
	=?us-ascii?Q?KBA3G5ysOhWURq0Un4j28dGTF6iNrNiIamcfI7iMsJwHbXvAGbhgLAe0fwIm?=
	=?us-ascii?Q?boJm7Fwa67VG5CXosYbMFe16jBjPfuu/WjIBzNGOQ6bCCJ5/rZ3exwsPoYNe?=
	=?us-ascii?Q?k9iq6xsKL1ewlf3OOrQlL7p56/pfWadwC2bS4Buw92teNG71gagS6sIQNgZQ?=
	=?us-ascii?Q?kBgGR+bU04m1XHbdi7GkTXJ/S+RMURphDOwefwnikGMwd4FkmyvZRgPuiNJd?=
	=?us-ascii?Q?llME3SlcDiVr2C1yHfJNdYAIEMPK0j3N5yBTOYLMKbbFmZsHIduuv8vTwUpz?=
	=?us-ascii?Q?E9vs0Wi9cIRdqceafSzRXLAYiPgTgkbURGPQkVu9E2wkbFEg0BoHr9sx1QbL?=
	=?us-ascii?Q?xGG1FxLNB/eYUb6i9QggWUhGg7pC5H/0kDMjB3hCpt9BuPSb0JpLNIsV51v4?=
	=?us-ascii?Q?UE2o1C7NNX1K+TyuD912Jnq2fbmj+0xlVtwj0QLL+mDzAMH4LtQbzOW0ekSX?=
	=?us-ascii?Q?cV1YYt6YaiQVKglFqvtIINCKX8JlJD5D3ydaKHILU9dkFigNHBDIc9e1Jxty?=
	=?us-ascii?Q?geTJqROxjHyyyiEZ7rb2JTrdX0c6D/0YRTK6O15yS5mtCwZLfOsGu9NC/V8f?=
	=?us-ascii?Q?ID1m2cD5g4G8m4+aYVIL5ITzeCykHedjrV+Icps5tuHADITRtspAMg=3D?=
X-Microsoft-Antispam-Message-Info: tlsTazyg3k9c8zdjVhyT2+v+5cWPXVcsUbtl5G5C7BC4TB3CY33faPjFnAL14TL6d5s7nikFrqEHtQB4/imv7H+CR95V7ifnZIyi6wzj2b/h6iChOHma007/7cG+qFNQg8f/9r/6xL5oaYY6stDaOLKKtsfhFhtvp//Q72WEP5y7VDa7E/HEDCGqPhgdc8a7
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	6:U+SzOj6pDPbR+aQbVTGicTV3/ROl6/C7GNuILMWvk1F8QaTijEIsmWu1cQdEsi7HRJzVcMv2pxVmosy2OX/lm211shMvPSuCdOkjQk4oRzaI5a4rRjLDa4viI2tWVJECX6lA5QqNYGcXlshxgBWWThb6J6UEAR6uMU7t2HhNdB9uArqi1oqsajFJnHdc4PLkWv0T0wERmlyFAmGuTI8YxWZrK4z8cIDgf903YRY8gfZcA8zbvt1Ck+Q4uwpqif4TO3QFHXIL6jiYhA3gztjJzwcxQvG8hMSesiT6/ALcAGRlqn7Cky58ewU4JPv4qhIz/vrgY02MWHmCN2ZjzKLGzk3DumnU8wenbouhghB4ZDtewjaxCmoW53vTXcZjUQ7g96e3fMB7bxGOvv2BveCXBemlJQA8UFrRXp/mKDtYaLCvp1hCbaQLAz0IC2FkaBDrPacgMvxyDN4fYzUeTghrhw==;
	5:1K40DcWkZuFNq0hXMpkVsFRQrIZkOPnsu6XvZ1F+x627vUQIdmMaRIp9oQR2Zgw93s9zwTST2vSEolPObxA4Cya1l0Oi0nUxRshhc9xv1F2MTEcwiB15LajeAI0X6Q31d6Y6WSOm7OkRAT84/31IVPdTmL7kiafR2W7loK+EIdk=;
	24:K9EBUl1h+L9hKVCtxZBeqW/sGn5+MJ+/WiANfF4cVp4JF08rHZX4KWHbdQNXahAy1BZp/RXTbspcsd4ncKpwj7ox2qApWmeM6hBLym+fnb8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	7:PMPwPhPa2nuaD7g9VqqBtdix2mB3iYBEmovHf+ha/SNDvuz3K9HmBkyX8JkLsj+Wcy/ugUsx+O+v6YPg15s+sA9SoY1WAYx1IIW98Ju3QQNM3eKz0f2ZBTZgnQzjLmH6z56la3A/yW4dwOGc+1t4gmbpsYI4y3WRwoO0bXVuzhLFDVS/QPyHl7q3X7NcbCbVI6piQML6h/qftLB0KXsLZBc6yzvfj3QGkX4ezFY5ptYeNSgq9rvrds38XWQalq6Y;
	20:4Bv/lWGdf3qpknGZ2kI7dMp9lUumWV1BvUL4BHHHcp5bDZdjhViSZusUHR9rjDdBSVQ8qZOxEPsHWWvO9B+5dDVtuiinkMumE/IpCQ++BrnZbVNuggVLlffgsVAIUwzkyxaRXv6Hqi05xz4e5KIqJP87N38SFYJjuc78SZRJky0=
X-MS-Office365-Filtering-Correlation-Id: af0d5e31-a20f-424b-caa4-08d5c0f85351
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 21:58:31.1803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0d5e31-a20f-424b-caa4-08d5c0f85351
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0387
Cc: alistair23@gmail.com
Subject: [PATCH] redis: Update to 4.0.8
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
X-List-Received-Date: Wed, 23 May 2018 22:08:11 -0000
Content-Type: text/plain

Update redis to the latest 4.0.8 release. This also involves updating
the redis.conf while maintaining some OE specific config options.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...Makefile-to-add-symbols-to-staticlib.patch |  19 -
 .../hiredis-use-default-CC-if-it-is-set.patch |  12 +-
 .../redis/redis/oe-use-libc-malloc.patch      |  10 +-
 .../recipes-extended/redis/redis/redis.conf   | 974 ++++++++++++++++--
 .../redis/{redis_3.0.2.bb => redis_4.0.8.bb}  |   5 +-
 5 files changed, 882 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
 rename meta-oe/recipes-extended/redis/{redis_3.0.2.bb => redis_4.0.8.bb} (89%)

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
deleted file mode 100644
index 2b3b58793..000000000
--- a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- redis-3.0.2/deps/hiredis/Makefile.orig	2016-05-06 19:36:26.179003036 -0700
-+++ redis-3.0.2/deps/hiredis/Makefile	2016-05-06 19:40:15.341340736 -0700
-@@ -25,7 +25,7 @@
- 
- # Fallback to gcc when $CC is not in $PATH.
- CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
--OPTIMIZATION?=-O3
-+OPTIMIZATION?=-O2
- WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
- DEBUG?= -g -ggdb
- REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
-@@ -68,6 +68,7 @@
- 
- $(STLIBNAME): $(OBJ)
- 	$(STLIB_MAKE_CMD) $(OBJ)
-+	$(RANLIB) $@
- 
- dynamic: $(DYLIBNAME)
- static: $(STLIBNAME)
diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
index f9f1c0dbd..421f306de 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
@@ -8,23 +8,23 @@ as CC has spaces in it, just skip it if one was already passed in.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
-Update to work with 3.0.x
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
+Update to work with 4.0.8
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
  deps/hiredis/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: deps/hiredis/Makefile
-===================================================================
+diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
+index 9a4de836..271c06ba 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -24,7 +24,7 @@ endef
+@@ -36,7 +36,7 @@ endef
  export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
 +CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+ CXX:=$(shell sh -c 'type $(CXX) >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
  OPTIMIZATION?=-O3
  WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
- DEBUG?= -g -ggdb
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
index b768a7749..6745f3d0e 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -11,15 +11,15 @@ jemalloc wasn't building correctly.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
-Update to work with 3.0.x
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
+Update to work with 4.0.8
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: src/Makefile
-===================================================================
+diff --git a/src/Makefile b/src/Makefile
+index 86e0b3fe..a810180b 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -29,6 +29,6 @@ Index: src/Makefile
 -uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
 +# use fake uname option to force use of generic libc
 +uname_S := "USE_LIBC_MALLOC"
+ uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
  OPTIMIZATION?=-O2
  DEPENDENCY_TARGETS=hiredis linenoise lua
- 
diff --git a/meta-oe/recipes-extended/redis/redis/redis.conf b/meta-oe/recipes-extended/redis/redis/redis.conf
index ab024ad85..75037d6dc 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.conf
+++ b/meta-oe/recipes-extended/redis/redis/redis.conf
@@ -1,4 +1,9 @@
-# Redis configuration file example
+# Redis configuration file example.
+#
+# Note that in order to read the configuration file, Redis must be
+# started with the file path as first argument:
+#
+# ./redis-server /path/to/redis.conf
 
 # Note on units: when memory size is needed, it is possible to specify
 # it in the usual form of 1k 5GB 4M and so forth:
@@ -12,48 +17,160 @@
 #
 # units are case insensitive so 1GB 1Gb 1gB are all the same.
 
-# By default Redis does not run as a daemon. Use 'yes' if you need it.
-# Note that Redis will write a pid file in /var/run/redis.pid when daemonized.
+################################## INCLUDES ###################################
+
+# Include one or more other config files here.  This is useful if you
+# have a standard template that goes to all Redis servers but also need
+# to customize a few per-server settings.  Include files can include
+# other files, so use this wisely.
 #
-# OE: run as a daemon.
+# Notice option "include" won't be rewritten by command "CONFIG REWRITE"
+# from admin or Redis Sentinel. Since Redis always uses the last processed
+# line as value of a configuration directive, you'd better put includes
+# at the beginning of this file to avoid overwriting config change at runtime.
 #
-daemonize yes
+# If instead you are interested in using includes to override configuration
+# options, it is better to use include as the last line.
+#
+# include /path/to/local.conf
+# include /path/to/other.conf
 
-# When running daemonized, Redis writes a pid file in /var/run/redis.pid by
-# default. You can specify a custom pid file location here.
-pidfile /var/run/redis.pid
+################################## MODULES #####################################
+
+# Load modules at startup. If the server is not able to load modules
+# it will abort. It is possible to use multiple loadmodule directives.
+#
+# loadmodule /path/to/my_module.so
+# loadmodule /path/to/other_module.so
+
+################################## NETWORK #####################################
 
-# Accept connections on the specified port, default is 6379.
+# By default, if no "bind" configuration directive is specified, Redis listens
+# for connections from all the network interfaces available on the server.
+# It is possible to listen to just one or multiple selected interfaces using
+# the "bind" configuration directive, followed by one or more IP addresses.
+#
+# Examples:
+#
+# bind 192.168.1.100 10.0.0.1
+# bind 127.0.0.1 ::1
+#
+# ~~~ WARNING ~~~ If the computer running Redis is directly exposed to the
+# internet, binding to all the interfaces is dangerous and will expose the
+# instance to everybody on the internet. So by default we uncomment the
+# following bind directive, that will force Redis to listen only into
+# the IPv4 lookback interface address (this means Redis will be able to
+# accept connections only from clients running into the same computer it
+# is running).
+#
+# IF YOU ARE SURE YOU WANT YOUR INSTANCE TO LISTEN TO ALL THE INTERFACES
+# JUST COMMENT THE FOLLOWING LINE.
+# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+bind 127.0.0.1
+
+# Protected mode is a layer of security protection, in order to avoid that
+# Redis instances left open on the internet are accessed and exploited.
+#
+# When protected mode is on and if:
+#
+# 1) The server is not binding explicitly to a set of addresses using the
+#    "bind" directive.
+# 2) No password is configured.
+#
+# The server only accepts connections from clients connecting from the
+# IPv4 and IPv6 loopback addresses 127.0.0.1 and ::1, and from Unix domain
+# sockets.
+#
+# By default protected mode is enabled. You should disable it only if
+# you are sure you want clients from other hosts to connect to Redis
+# even if no authentication is configured, nor a specific set of interfaces
+# are explicitly listed using the "bind" directive.
+protected-mode yes
+
+# Accept connections on the specified port, default is 6379 (IANA #815344).
 # If port 0 is specified Redis will not listen on a TCP socket.
 port 6379
 
-# If you want you can bind a single interface, if the bind option is not
-# specified all the interfaces will listen for incoming connections.
-#
-bind 127.0.0.1
+# TCP listen() backlog.
+#
+# In high requests-per-second environments you need an high backlog in order
+# to avoid slow clients connections issues. Note that the Linux kernel
+# will silently truncate it to the value of /proc/sys/net/core/somaxconn so
+# make sure to raise both the value of somaxconn and tcp_max_syn_backlog
+# in order to get the desired effect.
+tcp-backlog 511
 
-# Specify the path for the unix socket that will be used to listen for
+# Unix socket.
+#
+# Specify the path for the Unix socket that will be used to listen for
 # incoming connections. There is no default, so Redis will not listen
 # on a unix socket when not specified.
 #
 # unixsocket /tmp/redis.sock
-# unixsocketperm 755
+# unixsocketperm 700
 
 # Close the connection after a client is idle for N seconds (0 to disable)
 timeout 0
 
-# Set server verbosity to 'debug'
-# it can be one of:
+# TCP keepalive.
+#
+# If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence
+# of communication. This is useful for two reasons:
+#
+# 1) Detect dead peers.
+# 2) Take the connection alive from the point of view of network
+#    equipment in the middle.
+#
+# On Linux, the specified value (in seconds) is the period used to send ACKs.
+# Note that to close the connection the double of the time is needed.
+# On other kernels the period depends on the kernel configuration.
+#
+# A reasonable value for this option is 300 seconds, which is the new
+# Redis default starting with Redis 3.2.1.
+tcp-keepalive 300
+
+################################# GENERAL #####################################
+
+# OE: run as a daemon.
+daemonize yes
+
+# If you run Redis from upstart or systemd, Redis can interact with your
+# supervision tree. Options:
+#   supervised no      - no supervision interaction
+#   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
+#   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
+#   supervised auto    - detect upstart or systemd method based on
+#                        UPSTART_JOB or NOTIFY_SOCKET environment variables
+# Note: these supervision methods only signal "process is ready."
+#       They do not enable continuous liveness pings back to your supervisor.
+supervised no
+
+# If a pid file is specified, Redis writes it where specified at startup
+# and removes it at exit.
+#
+# When the server runs non daemonized, no pid file is created if none is
+# specified in the configuration. When the server is daemonized, the pid file
+# is used even if not specified, defaulting to "/var/run/redis.pid".
+#
+# Creating a pid file is best effort: if Redis is not able to create it
+# nothing bad happens, the server will start and run normally.
+
+# When running daemonized, Redis writes a pid file in /var/run/redis.pid by
+# default. You can specify a custom pid file location here.
+pidfile /var/run/redis.pid
+
+# Specify the server verbosity level.
+# This can be one of:
 # debug (a lot of information, useful for development/testing)
 # verbose (many rarely useful info, but not a mess like the debug level)
 # notice (moderately verbose, what you want in production probably)
 # warning (only very important / critical messages are logged)
 loglevel notice
 
-# Specify the log file name. Also 'stdout' can be used to force
+# Specify the log file name. Also the empty string can be used to force
 # Redis to log on the standard output. Note that if you use standard
 # output for logging but daemonize, logs will be sent to /dev/null
-# logfile /var/log/redis.log
+logfile ""
 
 # To enable logging to the system logger, just set 'syslog-enabled' to yes,
 # and optionally update the other syslog parameters to suit your needs.
@@ -62,7 +179,7 @@ syslog-enabled yes
 # Specify the syslog identity.
 syslog-ident redis
 
-# Specify the syslog facility.  Must be USER or between LOCAL0-LOCAL7.
+# Specify the syslog facility. Must be USER or between LOCAL0-LOCAL7.
 # syslog-facility local0
 
 # Set the number of databases. The default database is DB 0, you can select
@@ -70,7 +187,15 @@ syslog-ident redis
 # dbid is a number between 0 and 'databases'-1
 databases 16
 
-################################ SNAPSHOTTING  #################################
+# By default Redis shows an ASCII art logo only when started to log to the
+# standard output and if the standard output is a TTY. Basically this means
+# that normally a logo is displayed only in interactive sessions.
+#
+# However it is possible to force the pre-4.0 behavior and always show a
+# ASCII art logo in startup logs by setting the following option to yes.
+always-show-logo yes
+
+################################ SNAPSHOTTING  ################################
 #
 # Save the DB on disk:
 #
@@ -84,7 +209,7 @@ databases 16
 #   after 300 sec (5 min) if at least 10 keys changed
 #   after 60 sec if at least 10000 keys changed
 #
-#   Note: you can disable saving at all commenting all the "save" lines.
+#   Note: you can disable saving completely by commenting out all "save" lines.
 #
 #   It is also possible to remove all the previously configured save
 #   points by adding a save directive with a single empty string argument
@@ -103,16 +228,16 @@ save 30 1000
 
 # By default Redis will stop accepting writes if RDB snapshots are enabled
 # (at least one save point) and the latest background save failed.
-# This will make the user aware (in an hard way) that data is not persisting
+# This will make the user aware (in a hard way) that data is not persisting
 # on disk properly, otherwise chances are that no one will notice and some
-# distater will happen.
+# disaster will happen.
 #
 # If the background saving process will start working again Redis will
 # automatically allow writes again.
 #
 # However if you have setup your proper monitoring of the Redis server
 # and persistence, you may want to disable this feature so that Redis will
-# continue to work as usually even if there are problems with disk,
+# continue to work as usual even if there are problems with disk,
 # permissions, and so forth.
 stop-writes-on-bgsave-error yes
 
@@ -122,7 +247,7 @@ stop-writes-on-bgsave-error yes
 # the dataset will likely be bigger if you have compressible values or keys.
 rdbcompression yes
 
-# Since verison 5 of RDB a CRC64 checksum is placed at the end of the file.
+# Since version 5 of RDB a CRC64 checksum is placed at the end of the file.
 # This makes the format more resistant to corruption but there is a performance
 # hit to pay (around 10%) when saving and loading RDB files, so you can disable it
 # for maximum performances.
@@ -138,18 +263,27 @@ dbfilename dump.rdb
 #
 # The DB will be written inside this directory, with the filename specified
 # above using the 'dbfilename' configuration directive.
-# 
-# Also the Append Only File will be created inside this directory.
-# 
+#
+# The Append Only File will also be created inside this directory.
+#
 # Note that you must specify a directory here, not a file name.
 dir /var/lib/redis/
 
 ################################# REPLICATION #################################
 
 # Master-Slave replication. Use slaveof to make a Redis instance a copy of
-# another Redis server. Note that the configuration is local to the slave
-# so for example it is possible to configure the slave to save the DB with a
-# different interval, or to listen to another port, and so on.
+# another Redis server. A few things to understand ASAP about Redis replication.
+#
+# 1) Redis replication is asynchronous, but you can configure a master to
+#    stop accepting writes if it appears to be not connected with at least
+#    a given number of slaves.
+# 2) Redis slaves are able to perform a partial resynchronization with the
+#    master if the replication link is lost for a relatively small amount of
+#    time. You may want to configure the replication backlog size (see the next
+#    sections of this file) with a sensible value depending on your needs.
+# 3) Replication is automatic and does not need user intervention. After a
+#    network partition slaves automatically try to reconnect to masters
+#    and resynchronize with them.
 #
 # slaveof <masterip> <masterport>
 
@@ -160,14 +294,14 @@ dir /var/lib/redis/
 #
 # masterauth <master-password>
 
-# When a slave lost the connection with the master, or when the replication
+# When a slave loses its connection with the master, or when the replication
 # is still in progress, the slave can act in two different ways:
 #
 # 1) if slave-serve-stale-data is set to 'yes' (the default) the slave will
 #    still reply to client requests, possibly with out of date data, or the
 #    data set may just be empty if this is the first synchronization.
 #
-# 2) if slave-serve-stale data is set to 'no' the slave will reply with
+# 2) if slave-serve-stale-data is set to 'no' the slave will reply with
 #    an error "SYNC with master in progress" to all the kind of commands
 #    but to INFO and SLAVEOF.
 #
@@ -184,19 +318,65 @@ slave-serve-stale-data yes
 # Note: read only slaves are not designed to be exposed to untrusted clients
 # on the internet. It's just a protection layer against misuse of the instance.
 # Still a read only slave exports by default all the administrative commands
-# such as CONFIG, DEBUG, and so forth. To a limited extend you can improve
+# such as CONFIG, DEBUG, and so forth. To a limited extent you can improve
 # security of read only slaves using 'rename-command' to shadow all the
 # administrative / dangerous commands.
 slave-read-only yes
 
+# Replication SYNC strategy: disk or socket.
+#
+# -------------------------------------------------------
+# WARNING: DISKLESS REPLICATION IS EXPERIMENTAL CURRENTLY
+# -------------------------------------------------------
+#
+# New slaves and reconnecting slaves that are not able to continue the replication
+# process just receiving differences, need to do what is called a "full
+# synchronization". An RDB file is transmitted from the master to the slaves.
+# The transmission can happen in two different ways:
+#
+# 1) Disk-backed: The Redis master creates a new process that writes the RDB
+#                 file on disk. Later the file is transferred by the parent
+#                 process to the slaves incrementally.
+# 2) Diskless: The Redis master creates a new process that directly writes the
+#              RDB file to slave sockets, without touching the disk at all.
+#
+# With disk-backed replication, while the RDB file is generated, more slaves
+# can be queued and served with the RDB file as soon as the current child producing
+# the RDB file finishes its work. With diskless replication instead once
+# the transfer starts, new slaves arriving will be queued and a new transfer
+# will start when the current one terminates.
+#
+# When diskless replication is used, the master waits a configurable amount of
+# time (in seconds) before starting the transfer in the hope that multiple slaves
+# will arrive and the transfer can be parallelized.
+#
+# With slow disks and fast (large bandwidth) networks, diskless replication
+# works better.
+repl-diskless-sync no
+
+# When diskless replication is enabled, it is possible to configure the delay
+# the server waits in order to spawn the child that transfers the RDB via socket
+# to the slaves.
+#
+# This is important since once the transfer starts, it is not possible to serve
+# new slaves arriving, that will be queued for the next RDB transfer, so the server
+# waits a delay in order to let more slaves arrive.
+#
+# The delay is specified in seconds, and by default is 5 seconds. To disable
+# it entirely just set it to 0 seconds and the transfer will start ASAP.
+repl-diskless-sync-delay 5
+
 # Slaves send PINGs to server in a predefined interval. It's possible to change
 # this interval with the repl_ping_slave_period option. The default value is 10
 # seconds.
 #
 # repl-ping-slave-period 10
 
-# The following option sets a timeout for both Bulk transfer I/O timeout and
-# master data or ping response timeout. The default value is 60 seconds.
+# The following option sets the replication timeout for:
+#
+# 1) Bulk transfer I/O during SYNC, from the point of view of slave.
+# 2) Master timeout from the point of view of slaves (data, pings).
+# 3) Slave timeout from the point of view of masters (REPLCONF ACK pings).
 #
 # It is important to make sure that this value is greater than the value
 # specified for repl-ping-slave-period otherwise a timeout will be detected
@@ -204,13 +384,54 @@ slave-read-only yes
 #
 # repl-timeout 60
 
+# Disable TCP_NODELAY on the slave socket after SYNC?
+#
+# If you select "yes" Redis will use a smaller number of TCP packets and
+# less bandwidth to send data to slaves. But this can add a delay for
+# the data to appear on the slave side, up to 40 milliseconds with
+# Linux kernels using a default configuration.
+#
+# If you select "no" the delay for data to appear on the slave side will
+# be reduced but more bandwidth will be used for replication.
+#
+# By default we optimize for low latency, but in very high traffic conditions
+# or when the master and slaves are many hops away, turning this to "yes" may
+# be a good idea.
+repl-disable-tcp-nodelay no
+
+# Set the replication backlog size. The backlog is a buffer that accumulates
+# slave data when slaves are disconnected for some time, so that when a slave
+# wants to reconnect again, often a full resync is not needed, but a partial
+# resync is enough, just passing the portion of data the slave missed while
+# disconnected.
+#
+# The bigger the replication backlog, the longer the time the slave can be
+# disconnected and later be able to perform a partial resynchronization.
+#
+# The backlog is only allocated once there is at least a slave connected.
+#
+# repl-backlog-size 1mb
+
+# After a master has no longer connected slaves for some time, the backlog
+# will be freed. The following option configures the amount of seconds that
+# need to elapse, starting from the time the last slave disconnected, for
+# the backlog buffer to be freed.
+#
+# Note that slaves never free the backlog for timeout, since they may be
+# promoted to masters later, and should be able to correctly "partially
+# resynchronize" with the slaves: hence they should always accumulate backlog.
+#
+# A value of 0 means to never release the backlog.
+#
+# repl-backlog-ttl 3600
+
 # The slave priority is an integer number published by Redis in the INFO output.
 # It is used by Redis Sentinel in order to select a slave to promote into a
 # master if the master is no longer working correctly.
 #
 # A slave with a low priority number is considered better for promotion, so
 # for instance if there are three slaves with priority 10, 100, 25 Sentinel will
-# pick the one wtih priority 10, that is the lowest.
+# pick the one with priority 10, that is the lowest.
 #
 # However a special priority of 0 marks the slave as not able to perform the
 # role of master, so a slave with priority of 0 will never be selected by
@@ -219,6 +440,57 @@ slave-read-only yes
 # By default the priority is 100.
 slave-priority 100
 
+# It is possible for a master to stop accepting writes if there are less than
+# N slaves connected, having a lag less or equal than M seconds.
+#
+# The N slaves need to be in "online" state.
+#
+# The lag in seconds, that must be <= the specified value, is calculated from
+# the last ping received from the slave, that is usually sent every second.
+#
+# This option does not GUARANTEE that N replicas will accept the write, but
+# will limit the window of exposure for lost writes in case not enough slaves
+# are available, to the specified number of seconds.
+#
+# For example to require at least 3 slaves with a lag <= 10 seconds use:
+#
+# min-slaves-to-write 3
+# min-slaves-max-lag 10
+#
+# Setting one or the other to 0 disables the feature.
+#
+# By default min-slaves-to-write is set to 0 (feature disabled) and
+# min-slaves-max-lag is set to 10.
+
+# A Redis master is able to list the address and port of the attached
+# slaves in different ways. For example the "INFO replication" section
+# offers this information, which is used, among other tools, by
+# Redis Sentinel in order to discover slave instances.
+# Another place where this info is available is in the output of the
+# "ROLE" command of a master.
+#
+# The listed IP and address normally reported by a slave is obtained
+# in the following way:
+#
+#   IP: The address is auto detected by checking the peer address
+#   of the socket used by the slave to connect with the master.
+#
+#   Port: The port is communicated by the slave during the replication
+#   handshake, and is normally the port that the slave is using to
+#   list for connections.
+#
+# However when port forwarding or Network Address Translation (NAT) is
+# used, the slave may be actually reachable via different IP and port
+# pairs. The following two options can be used by a slave in order to
+# report to its master a specific set of IP and port, so that both INFO
+# and ROLE will report those values.
+#
+# There is no need to use both the options if you need to override just
+# the port or the IP address.
+#
+# slave-announce-ip 5.5.5.5
+# slave-announce-port 1234
+
 ################################## SECURITY ###################################
 
 # Require clients to issue AUTH <PASSWORD> before processing any other
@@ -227,7 +499,7 @@ slave-priority 100
 #
 # This should stay commented out for backward compatibility and because most
 # people do not need auth (e.g. they run their own servers).
-# 
+#
 # Warning: since Redis is pretty fast an outside user can try up to
 # 150k passwords per second against a good box. This means that you should
 # use a very strong password otherwise it will be very easy to break.
@@ -238,23 +510,26 @@ slave-priority 100
 #
 # It is possible to change the name of dangerous commands in a shared
 # environment. For instance the CONFIG command may be renamed into something
-# of hard to guess so that it will be still available for internal-use
-# tools but not available for general clients.
+# hard to guess so that it will still be available for internal-use tools
+# but not available for general clients.
 #
 # Example:
 #
 # rename-command CONFIG b840fc02d524045429941cc15f59e41cb7be6c52
 #
-# It is also possible to completely kill a command renaming it into
+# It is also possible to completely kill a command by renaming it into
 # an empty string:
 #
 # rename-command CONFIG ""
+#
+# Please note that changing the name of commands that are logged into the
+# AOF file or transmitted to slaves may cause problems.
 
-################################### LIMITS ####################################
+################################### CLIENTS ####################################
 
 # Set the max number of connected clients at the same time. By default
 # this limit is set to 10000 clients, however if the Redis server is not
-# able ot configure the process file limit to allow for the specified limit
+# able to configure the process file limit to allow for the specified limit
 # the max number of allowed clients is set to the current file limit
 # minus 32 (as Redis reserves a few file descriptors for internal uses).
 #
@@ -263,17 +538,19 @@ slave-priority 100
 #
 # maxclients 10000
 
-# Don't use more memory than the specified amount of bytes.
+############################## MEMORY MANAGEMENT ################################
+
+# Set a memory usage limit to the specified amount of bytes.
 # When the memory limit is reached Redis will try to remove keys
-# accordingly to the eviction policy selected (see maxmemmory-policy).
+# according to the eviction policy selected (see maxmemory-policy).
 #
 # If Redis can't remove keys according to the policy, or if the policy is
 # set to 'noeviction', Redis will start to reply with errors to commands
 # that would use more memory, like SET, LPUSH, and so on, and will continue
 # to reply to read-only commands like GET.
 #
-# This option is usually useful when using Redis as an LRU cache, or to set
-# an hard memory limit for an instance (using the 'noeviction' policy).
+# This option is usually useful when using Redis as an LRU or LFU cache, or to
+# set a hard memory limit for an instance (using the 'noeviction' policy).
 #
 # WARNING: If you have slaves attached to an instance with maxmemory on,
 # the size of the output buffers needed to feed the slaves are subtracted
@@ -289,19 +566,27 @@ slave-priority 100
 # maxmemory <bytes>
 
 # MAXMEMORY POLICY: how Redis will select what to remove when maxmemory
-# is reached? You can select among five behavior:
-# 
-# volatile-lru -> remove the key with an expire set using an LRU algorithm
-# allkeys-lru -> remove any key accordingly to the LRU algorithm
-# volatile-random -> remove a random key with an expire set
-# allkeys-random -> remove a random key, any key
-# volatile-ttl -> remove the key with the nearest expire time (minor TTL)
-# noeviction -> don't expire at all, just return an error on write operations
-# 
-# Note: with all the kind of policies, Redis will return an error on write
-#       operations, when there are not suitable keys for eviction.
-#
-#       At the date of writing this commands are: set setnx setex append
+# is reached. You can select among five behaviors:
+#
+# volatile-lru -> Evict using approximated LRU among the keys with an expire set.
+# allkeys-lru -> Evict any key using approximated LRU.
+# volatile-lfu -> Evict using approximated LFU among the keys with an expire set.
+# allkeys-lfu -> Evict any key using approximated LFU.
+# volatile-random -> Remove a random key among the ones with an expire set.
+# allkeys-random -> Remove a random key, any key.
+# volatile-ttl -> Remove the key with the nearest expire time (minor TTL)
+# noeviction -> Don't evict anything, just return an error on write operations.
+#
+# LRU means Least Recently Used
+# LFU means Least Frequently Used
+#
+# Both LRU, LFU and volatile-ttl are implemented using approximated
+# randomized algorithms.
+#
+# Note: with any of the above policies, Redis will return an error on write
+#       operations, when there are no suitable keys for eviction.
+#
+#       At the date of writing these commands are: set setnx setex append
 #       incr decr rpush lpush rpushx lpushx linsert lset rpoplpush sadd
 #       sinter sinterstore sunion sunionstore sdiff sdiffstore zadd zincrby
 #       zunionstore zinterstore hset hsetnx hmset hincrby incrby decrby
@@ -309,15 +594,67 @@ slave-priority 100
 #
 # The default is:
 #
-# maxmemory-policy volatile-lru
+# maxmemory-policy noeviction
 
-# LRU and minimal TTL algorithms are not precise algorithms but approximated
-# algorithms (in order to save memory), so you can select as well the sample
-# size to check. For instance for default Redis will check three keys and
-# pick the one that was used less recently, you can change the sample size
-# using the following configuration directive.
+# LRU, LFU and minimal TTL algorithms are not precise algorithms but approximated
+# algorithms (in order to save memory), so you can tune it for speed or
+# accuracy. For default Redis will check five keys and pick the one that was
+# used less recently, you can change the sample size using the following
+# configuration directive.
+#
+# The default of 5 produces good enough results. 10 Approximates very closely
+# true LRU but costs more CPU. 3 is faster but not very accurate.
 #
-# maxmemory-samples 3
+# maxmemory-samples 5
+
+############################# LAZY FREEING ####################################
+
+# Redis has two primitives to delete keys. One is called DEL and is a blocking
+# deletion of the object. It means that the server stops processing new commands
+# in order to reclaim all the memory associated with an object in a synchronous
+# way. If the key deleted is associated with a small object, the time needed
+# in order to execute the DEL command is very small and comparable to most other
+# O(1) or O(log_N) commands in Redis. However if the key is associated with an
+# aggregated value containing millions of elements, the server can block for
+# a long time (even seconds) in order to complete the operation.
+#
+# For the above reasons Redis also offers non blocking deletion primitives
+# such as UNLINK (non blocking DEL) and the ASYNC option of FLUSHALL and
+# FLUSHDB commands, in order to reclaim memory in background. Those commands
+# are executed in constant time. Another thread will incrementally free the
+# object in the background as fast as possible.
+#
+# DEL, UNLINK and ASYNC option of FLUSHALL and FLUSHDB are user-controlled.
+# It's up to the design of the application to understand when it is a good
+# idea to use one or the other. However the Redis server sometimes has to
+# delete keys or flush the whole database as a side effect of other operations.
+# Specifically Redis deletes objects independently of a user call in the
+# following scenarios:
+#
+# 1) On eviction, because of the maxmemory and maxmemory policy configurations,
+#    in order to make room for new data, without going over the specified
+#    memory limit.
+# 2) Because of expire: when a key with an associated time to live (see the
+#    EXPIRE command) must be deleted from memory.
+# 3) Because of a side effect of a command that stores data on a key that may
+#    already exist. For example the RENAME command may delete the old key
+#    content when it is replaced with another one. Similarly SUNIONSTORE
+#    or SORT with STORE option may delete existing keys. The SET command
+#    itself removes any old content of the specified key in order to replace
+#    it with the specified string.
+# 4) During replication, when a slave performs a full resynchronization with
+#    its master, the content of the whole database is removed in order to
+#    load the RDB file just transfered.
+#
+# In all the above cases the default is to delete objects in a blocking way,
+# like if DEL was called. However you can configure each case specifically
+# in order to instead release memory in a non-blocking way like if UNLINK
+# was called, using the following configuration directives:
+
+lazyfree-lazy-eviction no
+lazyfree-lazy-expire no
+lazyfree-lazy-server-del no
+slave-lazy-flush no
 
 ############################## APPEND ONLY MODE ###############################
 
@@ -339,24 +676,24 @@ slave-priority 100
 #
 # Please check http://redis.io/topics/persistence for more information.
 
-#
 # OE: changed default to enable this
 appendonly yes
 
 # The name of the append only file (default: "appendonly.aof")
-# appendfilename appendonly.aof
+
+appendfilename "appendonly.aof"
 
 # The fsync() call tells the Operating System to actually write data on disk
-# instead to wait for more data in the output buffer. Some OS will really flush 
+# instead of waiting for more data in the output buffer. Some OS will really flush
 # data on disk, some other OS will just try to do it ASAP.
 #
 # Redis supports three different modes:
 #
 # no: don't fsync, just let the OS flush the data when it wants. Faster.
-# always: fsync after every write to the append only log . Slow, Safest.
+# always: fsync after every write to the append only log. Slow, Safest.
 # everysec: fsync only one time every second. Compromise.
 #
-# The default is "everysec" that's usually the right compromise between
+# The default is "everysec", as that's usually the right compromise between
 # speed and data safety. It's up to you to understand if you can relax this to
 # "no" that will let the operating system flush the output buffer when
 # it wants, for better performances (but if you can live with the idea of
@@ -384,21 +721,22 @@ appendfsync everysec
 # that will prevent fsync() from being called in the main process while a
 # BGSAVE or BGREWRITEAOF is in progress.
 #
-# This means that while another child is saving the durability of Redis is
-# the same as "appendfsync none", that in practical terms means that it is
-# possible to lost up to 30 seconds of log in the worst scenario (with the
+# This means that while another child is saving, the durability of Redis is
+# the same as "appendfsync none". In practical terms, this means that it is
+# possible to lose up to 30 seconds of log in the worst scenario (with the
 # default Linux settings).
-# 
+#
 # If you have latency problems turn this to "yes". Otherwise leave it as
 # "no" that is the safest pick from the point of view of durability.
+
 no-appendfsync-on-rewrite no
 
 # Automatic rewrite of the append only file.
 # Redis is able to automatically rewrite the log file implicitly calling
-# BGREWRITEAOF when the AOF log size will growth by the specified percentage.
-# 
+# BGREWRITEAOF when the AOF log size grows by the specified percentage.
+#
 # This is how it works: Redis remembers the size of the AOF file after the
-# latest rewrite (or if no rewrite happened since the restart, the size of
+# latest rewrite (if no rewrite has happened since the restart, the size of
 # the AOF at startup is used).
 #
 # This base size is compared to the current size. If the current size is
@@ -413,6 +751,44 @@ no-appendfsync-on-rewrite no
 auto-aof-rewrite-percentage 100
 auto-aof-rewrite-min-size 64mb
 
+# An AOF file may be found to be truncated at the end during the Redis
+# startup process, when the AOF data gets loaded back into memory.
+# This may happen when the system where Redis is running
+# crashes, especially when an ext4 filesystem is mounted without the
+# data=ordered option (however this can't happen when Redis itself
+# crashes or aborts but the operating system still works correctly).
+#
+# Redis can either exit with an error when this happens, or load as much
+# data as possible (the default now) and start if the AOF file is found
+# to be truncated at the end. The following option controls this behavior.
+#
+# If aof-load-truncated is set to yes, a truncated AOF file is loaded and
+# the Redis server starts emitting a log to inform the user of the event.
+# Otherwise if the option is set to no, the server aborts with an error
+# and refuses to start. When the option is set to no, the user requires
+# to fix the AOF file using the "redis-check-aof" utility before to restart
+# the server.
+#
+# Note that if the AOF file will be found to be corrupted in the middle
+# the server will still exit with an error. This option only applies when
+# Redis will try to read more data from the AOF file but not enough bytes
+# will be found.
+aof-load-truncated yes
+
+# When rewriting the AOF file, Redis is able to use an RDB preamble in the
+# AOF file for faster rewrites and recoveries. When this option is turned
+# on the rewritten AOF file is composed of two different stanzas:
+#
+#   [RDB file][AOF tail]
+#
+# When loading Redis recognizes that the AOF file starts with the "REDIS"
+# string and loads the prefixed RDB file, and continues loading the AOF
+# tail.
+#
+# This is currently turned off by default in order to avoid the surprise
+# of a format change, but will at some point be used as the default.
+aof-use-rdb-preamble no
+
 ################################ LUA SCRIPTING  ###############################
 
 # Max execution time of a Lua script in milliseconds.
@@ -421,16 +797,157 @@ auto-aof-rewrite-min-size 64mb
 # still in execution after the maximum allowed time and will start to
 # reply to queries with an error.
 #
-# When a long running script exceed the maximum execution time only the
+# When a long running script exceeds the maximum execution time only the
 # SCRIPT KILL and SHUTDOWN NOSAVE commands are available. The first can be
 # used to stop a script that did not yet called write commands. The second
-# is the only way to shut down the server in the case a write commands was
-# already issue by the script but the user don't want to wait for the natural
+# is the only way to shut down the server in the case a write command was
+# already issued by the script but the user doesn't want to wait for the natural
 # termination of the script.
 #
 # Set it to 0 or a negative value for unlimited execution without warnings.
 lua-time-limit 5000
 
+################################ REDIS CLUSTER  ###############################
+#
+# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+# WARNING EXPERIMENTAL: Redis Cluster is considered to be stable code, however
+# in order to mark it as "mature" we need to wait for a non trivial percentage
+# of users to deploy it in production.
+# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+#
+# Normal Redis instances can't be part of a Redis Cluster; only nodes that are
+# started as cluster nodes can. In order to start a Redis instance as a
+# cluster node enable the cluster support uncommenting the following:
+#
+# cluster-enabled yes
+
+# Every cluster node has a cluster configuration file. This file is not
+# intended to be edited by hand. It is created and updated by Redis nodes.
+# Every Redis Cluster node requires a different cluster configuration file.
+# Make sure that instances running in the same system do not have
+# overlapping cluster configuration file names.
+#
+# cluster-config-file nodes-6379.conf
+
+# Cluster node timeout is the amount of milliseconds a node must be unreachable
+# for it to be considered in failure state.
+# Most other internal time limits are multiple of the node timeout.
+#
+# cluster-node-timeout 15000
+
+# A slave of a failing master will avoid to start a failover if its data
+# looks too old.
+#
+# There is no simple way for a slave to actually have an exact measure of
+# its "data age", so the following two checks are performed:
+#
+# 1) If there are multiple slaves able to failover, they exchange messages
+#    in order to try to give an advantage to the slave with the best
+#    replication offset (more data from the master processed).
+#    Slaves will try to get their rank by offset, and apply to the start
+#    of the failover a delay proportional to their rank.
+#
+# 2) Every single slave computes the time of the last interaction with
+#    its master. This can be the last ping or command received (if the master
+#    is still in the "connected" state), or the time that elapsed since the
+#    disconnection with the master (if the replication link is currently down).
+#    If the last interaction is too old, the slave will not try to failover
+#    at all.
+#
+# The point "2" can be tuned by user. Specifically a slave will not perform
+# the failover if, since the last interaction with the master, the time
+# elapsed is greater than:
+#
+#   (node-timeout * slave-validity-factor) + repl-ping-slave-period
+#
+# So for example if node-timeout is 30 seconds, and the slave-validity-factor
+# is 10, and assuming a default repl-ping-slave-period of 10 seconds, the
+# slave will not try to failover if it was not able to talk with the master
+# for longer than 310 seconds.
+#
+# A large slave-validity-factor may allow slaves with too old data to failover
+# a master, while a too small value may prevent the cluster from being able to
+# elect a slave at all.
+#
+# For maximum availability, it is possible to set the slave-validity-factor
+# to a value of 0, which means, that slaves will always try to failover the
+# master regardless of the last time they interacted with the master.
+# (However they'll always try to apply a delay proportional to their
+# offset rank).
+#
+# Zero is the only value able to guarantee that when all the partitions heal
+# the cluster will always be able to continue.
+#
+# cluster-slave-validity-factor 10
+
+# Cluster slaves are able to migrate to orphaned masters, that are masters
+# that are left without working slaves. This improves the cluster ability
+# to resist to failures as otherwise an orphaned master can't be failed over
+# in case of failure if it has no working slaves.
+#
+# Slaves migrate to orphaned masters only if there are still at least a
+# given number of other working slaves for their old master. This number
+# is the "migration barrier". A migration barrier of 1 means that a slave
+# will migrate only if there is at least 1 other working slave for its master
+# and so forth. It usually reflects the number of slaves you want for every
+# master in your cluster.
+#
+# Default is 1 (slaves migrate only if their masters remain with at least
+# one slave). To disable migration just set it to a very large value.
+# A value of 0 can be set but is useful only for debugging and dangerous
+# in production.
+#
+# cluster-migration-barrier 1
+
+# By default Redis Cluster nodes stop accepting queries if they detect there
+# is at least an hash slot uncovered (no available node is serving it).
+# This way if the cluster is partially down (for example a range of hash slots
+# are no longer covered) all the cluster becomes, eventually, unavailable.
+# It automatically returns available as soon as all the slots are covered again.
+#
+# However sometimes you want the subset of the cluster which is working,
+# to continue to accept queries for the part of the key space that is still
+# covered. In order to do so, just set the cluster-require-full-coverage
+# option to no.
+#
+# cluster-require-full-coverage yes
+
+# In order to setup your cluster make sure to read the documentation
+# available at http://redis.io web site.
+
+########################## CLUSTER DOCKER/NAT support  ########################
+
+# In certain deployments, Redis Cluster nodes address discovery fails, because
+# addresses are NAT-ted or because ports are forwarded (the typical case is
+# Docker and other containers).
+#
+# In order to make Redis Cluster working in such environments, a static
+# configuration where each node knows its public address is needed. The
+# following two options are used for this scope, and are:
+#
+# * cluster-announce-ip
+# * cluster-announce-port
+# * cluster-announce-bus-port
+#
+# Each instruct the node about its address, client port, and cluster message
+# bus port. The information is then published in the header of the bus packets
+# so that other nodes will be able to correctly map the address of the node
+# publishing the information.
+#
+# If the above options are not used, the normal Redis Cluster auto-detection
+# will be used instead.
+#
+# Note that when remapped, the bus port may not be at the fixed offset of
+# clients port + 10000, so you can specify any port and bus-port depending
+# on how they get remapped. If the bus-port is not set, a fixed offset of
+# 10000 will be used as usually.
+#
+# Example:
+#
+# cluster-announce-ip 10.1.1.5
+# cluster-announce-port 6379
+# cluster-announce-bus-port 6380
+
 ################################## SLOW LOG ###################################
 
 # The Redis Slow Log is a system to log queries that exceeded a specified
@@ -439,7 +956,7 @@ lua-time-limit 5000
 # but just the time needed to actually execute the command (this is the only
 # stage of command execution where the thread is blocked and can not serve
 # other requests in the meantime).
-# 
+#
 # You can configure the slow log with two parameters: one tells Redis
 # what is the execution time, in microseconds, to exceed in order for the
 # command to get logged, and the other parameter is the length of the
@@ -455,6 +972,73 @@ slowlog-log-slower-than 10000
 # You can reclaim memory used by the slow log with SLOWLOG RESET.
 slowlog-max-len 128
 
+################################ LATENCY MONITOR ##############################
+
+# The Redis latency monitoring subsystem samples different operations
+# at runtime in order to collect data related to possible sources of
+# latency of a Redis instance.
+#
+# Via the LATENCY command this information is available to the user that can
+# print graphs and obtain reports.
+#
+# The system only logs operations that were performed in a time equal or
+# greater than the amount of milliseconds specified via the
+# latency-monitor-threshold configuration directive. When its value is set
+# to zero, the latency monitor is turned off.
+#
+# By default latency monitoring is disabled since it is mostly not needed
+# if you don't have latency issues, and collecting data has a performance
+# impact, that while very small, can be measured under big load. Latency
+# monitoring can easily be enabled at runtime using the command
+# "CONFIG SET latency-monitor-threshold <milliseconds>" if needed.
+latency-monitor-threshold 0
+
+############################# EVENT NOTIFICATION ##############################
+
+# Redis can notify Pub/Sub clients about events happening in the key space.
+# This feature is documented at http://redis.io/topics/notifications
+#
+# For instance if keyspace events notification is enabled, and a client
+# performs a DEL operation on key "foo" stored in the Database 0, two
+# messages will be published via Pub/Sub:
+#
+# PUBLISH __keyspace@0__:foo del
+# PUBLISH __keyevent@0__:del foo
+#
+# It is possible to select the events that Redis will notify among a set
+# of classes. Every class is identified by a single character:
+#
+#  K     Keyspace events, published with __keyspace@<db>__ prefix.
+#  E     Keyevent events, published with __keyevent@<db>__ prefix.
+#  g     Generic commands (non-type specific) like DEL, EXPIRE, RENAME, ...
+#  $     String commands
+#  l     List commands
+#  s     Set commands
+#  h     Hash commands
+#  z     Sorted set commands
+#  x     Expired events (events generated every time a key expires)
+#  e     Evicted events (events generated when a key is evicted for maxmemory)
+#  A     Alias for g$lshzxe, so that the "AKE" string means all the events.
+#
+#  The "notify-keyspace-events" takes as argument a string that is composed
+#  of zero or multiple characters. The empty string means that notifications
+#  are disabled.
+#
+#  Example: to enable list and generic events, from the point of view of the
+#           event name, use:
+#
+#  notify-keyspace-events Elg
+#
+#  Example 2: to get the stream of the expired keys subscribing to channel
+#             name __keyevent@0__:expired use:
+#
+#  notify-keyspace-events Ex
+#
+#  By default all notifications are disabled because most users don't need
+#  this feature and the feature has some overhead. Note that if you don't
+#  specify at least one of K or E, no events will be delivered.
+notify-keyspace-events ""
+
 ############################### ADVANCED CONFIG ###############################
 
 # Hashes are encoded using a memory efficient data structure when they have a
@@ -463,14 +1047,39 @@ slowlog-max-len 128
 hash-max-ziplist-entries 512
 hash-max-ziplist-value 64
 
-# Similarly to hashes, small lists are also encoded in a special way in order
-# to save a lot of space. The special representation is only used when
-# you are under the following limits:
-list-max-ziplist-entries 512
-list-max-ziplist-value 64
+# Lists are also encoded in a special way to save a lot of space.
+# The number of entries allowed per internal list node can be specified
+# as a fixed maximum size or a maximum number of elements.
+# For a fixed maximum size, use -5 through -1, meaning:
+# -5: max size: 64 Kb  <-- not recommended for normal workloads
+# -4: max size: 32 Kb  <-- not recommended
+# -3: max size: 16 Kb  <-- probably not recommended
+# -2: max size: 8 Kb   <-- good
+# -1: max size: 4 Kb   <-- good
+# Positive numbers mean store up to _exactly_ that number of elements
+# per list node.
+# The highest performing option is usually -2 (8 Kb size) or -1 (4 Kb size),
+# but if your use case is unique, adjust the settings as necessary.
+list-max-ziplist-size -2
+
+# Lists may also be compressed.
+# Compress depth is the number of quicklist ziplist nodes from *each* side of
+# the list to *exclude* from compression.  The head and tail of the list
+# are always uncompressed for fast push/pop operations.  Settings are:
+# 0: disable all list compression
+# 1: depth 1 means "don't start compressing until after 1 node into the list,
+#    going from either the head or tail"
+#    So: [head]->node->node->...->node->[tail]
+#    [head], [tail] will always be uncompressed; inner nodes will compress.
+# 2: [head]->[next]->node->node->...->node->[prev]->[tail]
+#    2 here means: don't compress head or head->next or tail->prev or tail,
+#    but compress all nodes between them.
+# 3: [head]->[next]->[next]->node->node->...->node->[prev]->[prev]->[tail]
+# etc.
+list-compress-depth 0
 
 # Sets have a special encoding in just one case: when a set is composed
-# of just strings that happens to be integers in radix 10 in the range
+# of just strings that happen to be integers in radix 10 in the range
 # of 64 bit signed integers.
 # The following configuration setting sets the limit in the size of the
 # set in order to use this special memory saving encoding.
@@ -482,20 +1091,34 @@ set-max-intset-entries 512
 zset-max-ziplist-entries 128
 zset-max-ziplist-value 64
 
+# HyperLogLog sparse representation bytes limit. The limit includes the
+# 16 bytes header. When an HyperLogLog using the sparse representation crosses
+# this limit, it is converted into the dense representation.
+#
+# A value greater than 16000 is totally useless, since at that point the
+# dense representation is more memory efficient.
+#
+# The suggested value is ~ 3000 in order to have the benefits of
+# the space efficient encoding without slowing down too much PFADD,
+# which is O(N) with the sparse encoding. The value can be raised to
+# ~ 10000 when CPU is not a concern, but space is, and the data set is
+# composed of many HyperLogLogs with cardinality in the 0 - 15000 range.
+hll-sparse-max-bytes 3000
+
 # Active rehashing uses 1 millisecond every 100 milliseconds of CPU time in
 # order to help rehashing the main Redis hash table (the one mapping top-level
 # keys to values). The hash table implementation Redis uses (see dict.c)
-# performs a lazy rehashing: the more operation you run into an hash table
+# performs a lazy rehashing: the more operation you run into a hash table
 # that is rehashing, the more rehashing "steps" are performed, so if the
 # server is idle the rehashing is never complete and some more memory is used
 # by the hash table.
-# 
+#
 # The default is to use this millisecond 10 times every second in order to
-# active rehashing the main dictionaries, freeing memory when possible.
+# actively rehash the main dictionaries, freeing memory when possible.
 #
 # If unsure:
 # use "activerehashing no" if you have hard latency requirements and it is
-# not a good thing in your environment that Redis can reply form time to time
+# not a good thing in your environment that Redis can reply from time to time
 # to queries with 2 milliseconds delay.
 #
 # use "activerehashing yes" if you don't have such hard requirements but
@@ -509,9 +1132,9 @@ activerehashing yes
 #
 # The limit can be set differently for the three different classes of clients:
 #
-# normal -> normal clients
-# slave  -> slave clients and MONITOR clients
-# pubsub -> clients subcribed to at least one pubsub channel or pattern
+# normal -> normal clients including MONITOR clients
+# slave  -> slave clients
+# pubsub -> clients subscribed to at least one pubsub channel or pattern
 #
 # The syntax of every client-output-buffer-limit directive is the following:
 #
@@ -534,17 +1157,158 @@ activerehashing yes
 # Instead there is a default limit for pubsub and slave clients, since
 # subscribers and slaves receive data in a push fashion.
 #
-# Both the hard or the soft limit can be disabled just setting it to zero.
+# Both the hard or the soft limit can be disabled by setting them to zero.
 client-output-buffer-limit normal 0 0 0
 client-output-buffer-limit slave 256mb 64mb 60
 client-output-buffer-limit pubsub 32mb 8mb 60
 
-################################## INCLUDES ###################################
+# Client query buffers accumulate new commands. They are limited to a fixed
+# amount by default in order to avoid that a protocol desynchronization (for
+# instance due to a bug in the client) will lead to unbound memory usage in
+# the query buffer. However you can configure it here if you have very special
+# needs, such us huge multi/exec requests or alike.
+#
+# client-query-buffer-limit 1gb
 
-# Include one or more other config files here.  This is useful if you
-# have a standard template that goes to all Redis server but also need
-# to customize a few per-server settings.  Include files can include
-# other files, so use this wisely.
+# In the Redis protocol, bulk requests, that are, elements representing single
+# strings, are normally limited ot 512 mb. However you can change this limit
+# here.
 #
-# include /path/to/local.conf
-# include /path/to/other.conf
+# proto-max-bulk-len 512mb
+
+# Redis calls an internal function to perform many background tasks, like
+# closing connections of clients in timeout, purging expired keys that are
+# never requested, and so forth.
+#
+# Not all tasks are performed with the same frequency, but Redis checks for
+# tasks to perform according to the specified "hz" value.
+#
+# By default "hz" is set to 10. Raising the value will use more CPU when
+# Redis is idle, but at the same time will make Redis more responsive when
+# there are many keys expiring at the same time, and timeouts may be
+# handled with more precision.
+#
+# The range is between 1 and 500, however a value over 100 is usually not
+# a good idea. Most users should use the default of 10 and raise this up to
+# 100 only in environments where very low latency is required.
+hz 10
+
+# When a child rewrites the AOF file, if the following option is enabled
+# the file will be fsync-ed every 32 MB of data generated. This is useful
+# in order to commit the file to the disk more incrementally and avoid
+# big latency spikes.
+aof-rewrite-incremental-fsync yes
+
+# Redis LFU eviction (see maxmemory setting) can be tuned. However it is a good
+# idea to start with the default settings and only change them after investigating
+# how to improve the performances and how the keys LFU change over time, which
+# is possible to inspect via the OBJECT FREQ command.
+#
+# There are two tunable parameters in the Redis LFU implementation: the
+# counter logarithm factor and the counter decay time. It is important to
+# understand what the two parameters mean before changing them.
+#
+# The LFU counter is just 8 bits per key, it's maximum value is 255, so Redis
+# uses a probabilistic increment with logarithmic behavior. Given the value
+# of the old counter, when a key is accessed, the counter is incremented in
+# this way:
+#
+# 1. A random number R between 0 and 1 is extracted.
+# 2. A probability P is calculated as 1/(old_value*lfu_log_factor+1).
+# 3. The counter is incremented only if R < P.
+#
+# The default lfu-log-factor is 10. This is a table of how the frequency
+# counter changes with a different number of accesses with different
+# logarithmic factors:
+#
+# +--------+------------+------------+------------+------------+------------+
+# | factor | 100 hits   | 1000 hits  | 100K hits  | 1M hits    | 10M hits   |
+# +--------+------------+------------+------------+------------+------------+
+# | 0      | 104        | 255        | 255        | 255        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+# | 1      | 18         | 49         | 255        | 255        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+# | 10     | 10         | 18         | 142        | 255        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+# | 100    | 8          | 11         | 49         | 143        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+#
+# NOTE: The above table was obtained by running the following commands:
+#
+#   redis-benchmark -n 1000000 incr foo
+#   redis-cli object freq foo
+#
+# NOTE 2: The counter initial value is 5 in order to give new objects a chance
+# to accumulate hits.
+#
+# The counter decay time is the time, in minutes, that must elapse in order
+# for the key counter to be divided by two (or decremented if it has a value
+# less <= 10).
+#
+# The default value for the lfu-decay-time is 1. A Special value of 0 means to
+# decay the counter every time it happens to be scanned.
+#
+# lfu-log-factor 10
+# lfu-decay-time 1
+
+########################### ACTIVE DEFRAGMENTATION #######################
+#
+# WARNING THIS FEATURE IS EXPERIMENTAL. However it was stress tested
+# even in production and manually tested by multiple engineers for some
+# time.
+#
+# What is active defragmentation?
+# -------------------------------
+#
+# Active (online) defragmentation allows a Redis server to compact the
+# spaces left between small allocations and deallocations of data in memory,
+# thus allowing to reclaim back memory.
+#
+# Fragmentation is a natural process that happens with every allocator (but
+# less so with Jemalloc, fortunately) and certain workloads. Normally a server
+# restart is needed in order to lower the fragmentation, or at least to flush
+# away all the data and create it again. However thanks to this feature
+# implemented by Oran Agra for Redis 4.0 this process can happen at runtime
+# in an "hot" way, while the server is running.
+#
+# Basically when the fragmentation is over a certain level (see the
+# configuration options below) Redis will start to create new copies of the
+# values in contiguous memory regions by exploiting certain specific Jemalloc
+# features (in order to understand if an allocation is causing fragmentation
+# and to allocate it in a better place), and at the same time, will release the
+# old copies of the data. This process, repeated incrementally for all the keys
+# will cause the fragmentation to drop back to normal values.
+#
+# Important things to understand:
+#
+# 1. This feature is disabled by default, and only works if you compiled Redis
+#    to use the copy of Jemalloc we ship with the source code of Redis.
+#    This is the default with Linux builds.
+#
+# 2. You never need to enable this feature if you don't have fragmentation
+#    issues.
+#
+# 3. Once you experience fragmentation, you can enable this feature when
+#    needed with the command "CONFIG SET activedefrag yes".
+#
+# The configuration parameters are able to fine tune the behavior of the
+# defragmentation process. If you are not sure about what they mean it is
+# a good idea to leave the defaults untouched.
+
+# Enabled active defragmentation
+# activedefrag yes
+
+# Minimum amount of fragmentation waste to start active defrag
+# active-defrag-ignore-bytes 100mb
+
+# Minimum percentage of fragmentation to start active defrag
+# active-defrag-threshold-lower 10
+
+# Maximum percentage of fragmentation at which we use maximum effort
+# active-defrag-threshold-upper 100
+
+# Minimal effort for defrag in CPU percentage
+# active-defrag-cycle-min 25
+
+# Maximal effort for defrag in CPU percentage
+# active-defrag-cycle-max 75
diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_4.0.8.bb
similarity index 89%
rename from meta-oe/recipes-extended/redis/redis_3.0.2.bb
rename to meta-oe/recipes-extended/redis/redis_4.0.8.bb
index 9395b33b0..b9ae3ef95 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.8.bb
@@ -13,11 +13,10 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch \
 "
 
-SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
-SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
+SRC_URI[md5sum] = "c75b11e4177e153e4dc1d8dd3a6174e4"
+SRC_URI[sha256sum] = "ff0c38b8c156319249fec61e5018cf5b5fe63a65b61690bec798f4c998c232ad"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.17.0


