Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669EECDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:05:39 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.50])
 by mx.groups.io with SMTP id smtpd.web10.23420.1697706329303928572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=loWMOC46;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=loWMOC46;
 spf=pass (domain: arm.com, ip: 40.107.13.50, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMnx6UDccQ49ipB99ZdafJc4Ma2ltlPPbMC72+C+6Ic=;
 b=loWMOC46ko5YslBI0NiHoyXf0xzqsHj7YdAlh4+yDf8vtuAqgdU0QUvfJz2keumpdHC1ahCO9+VcIRpCXhxFFSyXghenP0PVqvew1AQFDM+AFbUZ7rrT/URM51IqCM8yV+mwdLF/Mt+OSGT8aqiDjt6FAG1u8RnobXmfkwVmeew=
Received: from DU2PR04CA0328.eurprd04.prod.outlook.com (2603:10a6:10:2b5::33)
 by DB9PR08MB9684.eurprd08.prod.outlook.com (2603:10a6:10:460::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 09:05:24 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::5a) by DU2PR04CA0328.outlook.office365.com
 (2603:10a6:10:2b5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Thu, 19 Oct 2023 09:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.22 via Frontend Transport; Thu, 19 Oct 2023 09:05:24 +0000
Received: ("Tessian outbound 80b6fe5915e6:v215"); Thu, 19 Oct 2023 09:05:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: abd1abbf71c740c9
X-CR-MTA-TID: 64aa7808
Received: from 2bba052bde85.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DBA4E42A-1F2F-45BF-9813-40FB6BB904D4.1;
	Thu, 19 Oct 2023 09:05:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2bba052bde85.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Oct 2023 09:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHC9RHO1M78lFDBoKjYix7RBju+umPCR7ENEAEcWwO3S8AbCAJmbkpAkFp/kdty6D8pNYtijF3UKKehAFCjh7ITLzIdnCS2JShYoMP21WKDUg9ii9lT3l3zo2eKYRxbmze+YfzbkqqVV+AsvSReQBlgYAUggd8yAS2GAWDXc6Uioh1CgvIDjAC/5+5wZFEe5w4RVAsgfRfULub1ZmFfbso/okS4DDWyuzYghguxE42K4gUWWTeOpgD+GHXgbCf6p6gCCG5BaC7VQPjMGQvLsQq3ECwq5rSnsG03+FOjwaTwbTwNhD3QXqGHG3ybvmeIF+dFcgxfCBrWPhHPNVDizLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMnx6UDccQ49ipB99ZdafJc4Ma2ltlPPbMC72+C+6Ic=;
 b=U1tpVDxE0/fQwDN1XpcO/kp0L8SOKrZOHrwpl6e+r+woNCKIjgkYRgbqVQ4CqYOxEcltaYsHVUpwvd1Y05MAt42HieVliWSyA20lcPJ4rEnb+pjpLSo2//mjMwrFdZbN6eDPclx+hJZJHJIGdTU5BadtZbJynyDMmg0MYR8W3TLAUxk6sBf8TNv65DRo68Yf+ODTgsY3uFK2EkH+lObiLWJbDBYKUVZq15KzMIHHRQS1d+D4EGB/56GWZtLFGhjCHQGHcRuphrPqmngtErH+7XNd7fkppKctM5qFo03K9WoQCS/2RltfEMupfW5sA7yoTfW39I4dlzVZHcim2OZ49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMnx6UDccQ49ipB99ZdafJc4Ma2ltlPPbMC72+C+6Ic=;
 b=loWMOC46ko5YslBI0NiHoyXf0xzqsHj7YdAlh4+yDf8vtuAqgdU0QUvfJz2keumpdHC1ahCO9+VcIRpCXhxFFSyXghenP0PVqvew1AQFDM+AFbUZ7rrT/URM51IqCM8yV+mwdLF/Mt+OSGT8aqiDjt6FAG1u8RnobXmfkwVmeew=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB5PR08MB10192.eurprd08.prod.outlook.com (2603:10a6:10:4a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 09:05:14 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8a16:1a83:f86c:dff0]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8a16:1a83:f86c:dff0%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:05:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Topic: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Index: AQHaAMrr5s4TNXaac0SeRiAciSxlg7BNvVeAgALyjICAACU4gA==
Date: Thu, 19 Oct 2023 09:05:13 +0000
Message-ID: <EA96D0EB-17C1-4946-BE02-7DD224677992@arm.com>
References: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
 <7F1CE9DA-A95C-4079-9436-F8D233A6A116@arm.com>
 <OSBPR01MB1845965B443CCECAD4B7B5D5DCD4A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB1845965B443CCECAD4B7B5D5DCD4A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB5PR08MB10192:EE_|DU6PEPF00009526:EE_|DB9PR08MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5a2993-84f2-4b8a-184b-08dbd08287d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 21P/fModNMYOjHcoe0W370a3zSfo6w3EPuTNDYgrnU2n3XSX1SHhARour042HW5UcS/+sIuTFmDsnxBc49z/7DGHgyoifBdeiX080A1vZAWAKkjmrwuL9eG/L+/5uWBiBuN6jFZnY29L5drLksEaSlI+0rP+6HsBasRwxvCCpHDERK2CxaheHVReP6vLUmBTMqIw2WK7qLicqfo+Rml5YCuj5GtE6lWhxcUhmxyMmpGYFgCEGUk6SCf3nzFlwjHsQgMHTx0kZc5VoxzfAsSFgSc0cetQ/uLoiCI8CU3AkRDa27BSfVGguYjXacneSK4zrzjUVCS0lIpsyfJJOzF6iYqqBP3lh8b+QM7xAbhmwHdkx3uB7jAy3r+T6TN21Obd0XOcBDmgkRHAdnMaGl6TpBUqsKMpVyTq/R6SnJMM8ns7OKSH8zRGh2qrDiRoJG8UQdt0SzndhtgIupS0Rwbt0Z6EBWGdnKuXRiPORml1ZWmIQ46QN3mDqBVuzFFbnO8d5KtcVRX4wZ6hij4jpRsZxtwosvsEBjqPkuhZt76EdPf4B8aOjvuQ8tf/TVhJRLajvqqHnC9E/bDGmoIIg1TJV6iaJbYuPaJ9I405KHrBzembfJ9IEjGQvOycL8KWbX8ClUCGxJZPhp2c/4fDmd2XqQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(33656002)(36756003)(66556008)(76116006)(66476007)(66446008)(38100700002)(86362001)(2616005)(122000001)(38070700005)(91956017)(66946007)(26005)(6512007)(71200400001)(6506007)(53546011)(4744005)(6916009)(64756008)(478600001)(6486002)(316002)(2906002)(41300700001)(8936002)(8676002)(4326008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E84ADE84CF212C49AE3DD1719AE79E5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10192
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8d7441a4-d8bf-4940-b144-08dbd0828150
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UmQ6Qhj78AxrEx1TnDVQnyaRtegpVTgZ78qWjv6sdx5hkE8a5ug+qayVUwrRaBdN8cvPje0p5tyiSNM/745nzWSqbtsqQu+nxzh1DIHO9cipKVdDcFlm9stBRZnq1tP4xPSlJNhdeTbaGSS4tQwnUTAvYsjGEtubuMUdWpNsMuXj8lJ3jyCDNsCy+3RMRm7PlMStpDY3V5xHU+ROEUt4Nxd04CPpVon6hT6vpNtlGbDwJQesLFwkkxowNJwxqwmUcMT960PqdhkU8AKjMfALGTn93yGmxPWcTdZxtsBS/LzAvgogllCgTM371Iw/AwrzxNmKmFHNl8HMqbQqlkuQ9EoALOV88jQ4tr1MgZXMB0IrKijYObuJXVSKpRq8xnEee1YSo1Z2aqgiu0h+lRB5iojNcBXak99QuRv/gENYFZkYWZGf+DRb5ajo3+4QVec0Lomz5Qm7GVS2tV2Epp1QOn+ljkSbO/hZZXmxDsIWlH77G1G2tcXFimwzzwfdzoHOwz71rKG3kmYT/dpdcKH0/tAs8X1r9CqPMGGxRfEH8mZ4h1WhLO1WEXH2uyainhd7brqfNHWyg1dJwQt5ZCzR4ZZKbrGT4Rlf6GsPrOxFxFjNNOQOT8Y6IP/GGaBwaQoZ5JkRtSbkszsAxa2x0uHKugwQMOWTAYL97pHOvPAkplQd9tLp+0EN9y6jKi+zkySUSYyVxyg8Kj+OTXD/aNAcADSOQnMTvLBzry4Lhjr3dOo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(40460700003)(36756003)(26005)(5660300002)(2906002)(41300700001)(81166007)(86362001)(40480700001)(4744005)(33656002)(6862004)(8936002)(4326008)(8676002)(316002)(70206006)(70586007)(47076005)(336012)(53546011)(6486002)(6512007)(82740400003)(2616005)(478600001)(6506007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:05:24.6378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5a2993-84f2-4b8a-184b-08dbd08287d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9684
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 09:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105596

T24gMTkgT2N0IDIwMjMsIGF0IDA3OjUxLCBNaW5neXUgV2FuZyAoRnVqaXRzdSkgPHdhbmdteUBm
dWppdHN1LmNvbT4gd3JvdGU6DQo+IA0KPj4gSXNu4oCZdCB0aGlzIHdoYXQgY3JlYXRlX21lcmdl
ZF91c3Jfc3ltbGlua3MgaW4gaW1hZ2UuYmJjbGFzcyBkb2VzPyAgV2h5IGRvZXMNCj4+IGEgRE5G
IHBsdWdpbiBuZWVkIHRvIGRvIHRoaXMsIGFuZCBub3QgYW55dGhpbmcgZWxzZT8NCj4gQmVjYXVz
ZSBkbmYtcGx1Z2luLXR1aSBpcyB1c2VkIHRvIGNyZWF0ZWQgcm9vdGZzIGluIGFueSBuYXRpdmVz
ZGsgZW52aXJvbm1lbnQuDQo+IEl0IGlzIG5vdCBpbiBhIGJpdGJha2UgZW52aXJvbm1lbnQsIHNv
IGltYWdlLmJiY2xhc3MgY2Fubm90IGJlIHVzZWQuDQoNClNvdW5kcyBhIGJpdCBsaWtlIHRoZSBz
eW1saW5rIGNyZWF0aW9uIHNob3VsZCBiZSBtb3ZlZCBpbnRvIGJhc2UtZmlsZXMuLi4NCg0KUm9z
cw0KDQo=

