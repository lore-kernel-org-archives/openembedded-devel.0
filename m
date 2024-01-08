Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381BCC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:38:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web10.6736.1704721110029307651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iAuegR7f;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iAuegR7f;
 spf=pass (domain: arm.com, ip: 40.107.8.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d8NOrTE1oAKBe8m44wtgoHHJi/4zkG4sDcKMaafuEquEMNjHHKb6CHO0wlfuRpeaZSOXnLzWl1stVB9SA97Oz1A12fWAvrsrmOkUndMbQ27c7iIAnsZ82UEuxrfUpSvm6gtlIfFkO9ggfLjJkSvPSiJ7WqZYO4PGZLp5SUZIAvIgkRiZnycceP2oKrfT1r0aZgxmmK4UnUtB9kl+uMevUyoTNuT8GysMVZtVwNTmS92J1at/TwBjwjkauclkecJeF8RtrqmkJhjUd1x4CBrxeQR9DlurMsSc2SoNbmcImP3Va3Le07KPHRgDkdE1HfXqfNIf0jO6ilaIEBGpDFLh/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u+BIe52AzJpXp371CDoelRT52JuB/8l8lNQWO7AjoA=;
 b=nzad8AITOY/Af9DcRuW0jz/WRPsrGlQfl7rQmmKpUbXVy+FCr4Y61W2NVVpoAldMcf3ZQVjWeFTRk4zOInrHRw2tX5cBMZxTrTEDM7EZncjh8gZ6f1f36czwZ7bPF/4iNneboHZqUpkXwP+IZjaFgjWtkjb+Xh/cDlF7cg4A4WQ1rtfgqxtU4eBpJ6VVUDU8QbLdpmpDQVCbFI9IZDuT/0mrHNJW0eIXxJCDN1A0S6hHoc+u89axgNAQhMULVjkFbhu4UqmoMSpw71iQ8++v0ZOf/TLoOzWKRrR1EKreAXsPPwAGKgwc7ofjtF7vjp4/K0GgNHMy+3Eqm6DdjgQk5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u+BIe52AzJpXp371CDoelRT52JuB/8l8lNQWO7AjoA=;
 b=iAuegR7flhBmV41wNJDI4wr99KEk5+4NFLbpjLjqbgLej6DjS5M5n+7rT6sGYYEPQGjFF8dPQQXdOuJ2scMyP0ZvYEttFx84r+v33Dh9BxkY36kjgPR25qlg2lpdvxvNqu5Br/t6szyk65PGvm9g4pXSUmFrethy9YU/fAliOIA=
Received: from AS9PR06CA0708.eurprd06.prod.outlook.com (2603:10a6:20b:49f::35)
 by DB8PR08MB5355.eurprd08.prod.outlook.com (2603:10a6:10:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 13:38:25 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:49f:cafe::96) by AS9PR06CA0708.outlook.office365.com
 (2603:10a6:20b:49f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 13:38:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.13 via Frontend Transport; Mon, 8 Jan 2024 13:38:24 +0000
Received: ("Tessian outbound d4441390933e:v239"); Mon, 08 Jan 2024 13:38:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3be066bb99cd0f2e
X-CR-MTA-TID: 64aa7808
Received: from 36163e487e90.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DAAFCAF7-2855-42E5-9DF9-FC4730CC3BAA.1;
	Mon, 08 Jan 2024 13:38:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36163e487e90.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jan 2024 13:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsH4czapomq0wP0huLR9grWJgh10gSKjztmAEHeftv1wHRf2ysArLIYT9jt9676gPHSpbcwplRswAjd32tiZqdhL01pUn2AeFHOPxjaKntWgu3ZcgYE3QQ2ME/dtVMhkfBE7ucDmnhsj/eYcjUhSmXE6AJbEAbPIfsvZdyUA5VGK/ZnmoCEnB2nlToTbsfBpAjbukWrsoL/hkopqo1yHwQoxkHxR7/kEcYrJ4xthpwoK6NJV2hS9y0J4R92RpsFydRjg580VfptshqRrASZtfOYBRRs0E+mu1+0tszo0mgy2J33bwml5aSADjG1CUJfjvmRTwzqoJ9WVeoED7uIsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u+BIe52AzJpXp371CDoelRT52JuB/8l8lNQWO7AjoA=;
 b=e3MDILLaxNVKnQ3msQT67vR1vvmjUUX552qSw9PW8vmakFi2F71PR+V5IhNj24hsTjA+gAYDm3jEkQ6Pwz/hcW6L321837MEku0vjluhtQOAtgBrKqx+u5ecMrm+827aPQPIbuts8Kshyb/LXM1wcqRruP2wd3irl/pnDFd0k+lwOJ2lTQehKY//0zq2WAJ0xcDiBcA/gBsQ8yUX0zU7v5WK2o+4DB7Kk4V9/TH7p8E3qOmFX47OgpxXqZcRF0fT6Rd8oPZ4B+3sSUZz/zRYBWWy877aaQnvzXXFnA6rvUFC3VB7TTJns7JbD5dy2pXyoyMtg3d4DJUvHprpRQY92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u+BIe52AzJpXp371CDoelRT52JuB/8l8lNQWO7AjoA=;
 b=iAuegR7flhBmV41wNJDI4wr99KEk5+4NFLbpjLjqbgLej6DjS5M5n+7rT6sGYYEPQGjFF8dPQQXdOuJ2scMyP0ZvYEttFx84r+v33Dh9BxkY36kjgPR25qlg2lpdvxvNqu5Br/t6szyk65PGvm9g4pXSUmFrethy9YU/fAliOIA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10250.eurprd08.prod.outlook.com (2603:10a6:20b:641::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 13:38:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 13:38:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] pcsc-tools: upgrade 1.6.2 -> 1.7.1
Thread-Topic: [oe] [meta-oe][PATCH] pcsc-tools: upgrade 1.6.2 -> 1.7.1
Thread-Index: AQHaQfPa/KeXiVBkG0iJORLyTxmeCrDP6+cA
Date: Mon, 8 Jan 2024 13:38:14 +0000
Message-ID: <BA227B6B-8080-415B-8A7E-8798AA307204@arm.com>
References: <20240108053034.28440-1-alperyasinak1@gmail.com>
In-Reply-To: <20240108053034.28440-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10250:EE_|AMS0EPF00000199:EE_|DB8PR08MB5355:EE_
X-MS-Office365-Filtering-Correlation-Id: 66330a61-c706-4064-e14f-08dc104f1692
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aPLhD44usn4uRTJSOSfxlMpfz5lieMasXjjqImB/JmfM1pMq0y+EHSXf/8irUUIRSboCFld7okgFwOkqAyrP76IyXklxxCE3Z0NlNnCs+ngR77iLMbSdb0vqT6p/jh8i/36S2DtIfR5xpEwVMyiFqOwn5MXvYopsN5YjZOvpk4XKWi0gLxmH7v8LwxvsZaJ3oqwdD859+ppD5I/D1PWZcDwRLYVcWmxp+BZyPMxoE0hgjUImouinNLM0mUgQ0nhjltXhJznd/x260aRFaUFvDM+PUaD7q6sD3wqrATdqhN5NH2+w4xZF4jS3dxN3BsLbZFN4Ky8sE+49zRmvYlN5/BHVZ6aIdtJRVQd1/sEool3J32uYGJAl3cRTsHeoShgWxO8venSdiz8Khw09mG1t4PcWHmChRjFcKdlMj0qtrUHhiHMhq+9YZK3yKTGDgViG84vrYw5cmEDRyQSanfe3/4xgYCzg6bt1R0sFmknPwiz8/NRad7hIBlrbo8P+uPMWf5Bwl0eLUHWzH/08dM455ojcs/x3qieWILnNgP9N1zI6M2/m1ZkTuzLtG6XAdbmPa9LeJK47uF3tdDGNhSVAtbi4Q0J2jIjkNufPwLvDrKc3OZR32SqETM+TpBw5Jx3XU0y3LE2DBDJfMFxJytsN/w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(38100700002)(5660300002)(38070700009)(86362001)(122000001)(41300700001)(558084003)(316002)(8676002)(36756003)(8936002)(6512007)(2616005)(6486002)(91956017)(66556008)(66946007)(6916009)(66446008)(66476007)(64756008)(26005)(478600001)(76116006)(6506007)(71200400001)(33656002)(53546011)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <46F62AD05756484BB0D06384CC61B84C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10250
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b27a7123-7479-425d-4bbf-08dc104f10b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VlqGYl85ETM1ULKUKL8i6kgjQPrDATJX6ONpUeuVMfBJAJ1rVb7srS3viiHOw+ahHRPQqQ7QXzwp+/6aNkshIwGDttUMDGpRupPggaoEsl5JZtoZ/w4cSMspjhxmYGSosmjLKD777rtdiIAyDHA5YFamMSKB2fneiMAXeKBFMZhUNMMRgOY8bLeiAABwLWxzjcNcCV6ri91Q6aiEF4HHYbjolF/DmAWA8GIAK47u/GWrvoX2ssQ3Owox6OekfZI9CIrZSdsrQG2QNF9NX//txi/sVXg55k3azmFxZkiC51byTQBxvy1ThSC5BnbzR5oXr+n/HNY/AUY2cimbICfarohz0ypu7IqQqKu8c1JoOTjGyaPfk+XfOnilr8D+kRCzXbdWyoWLZj9iQWKQ7BBRYXy/TYKMtE624M85b3mKmWmjUULwMuXfi3GDFeqJJQkgEMP6JURcwbe206NVJQOEpGVNQjfiZNQkYP8hX0eEx+4qjcPNYy0CNaGzg7+xSrtjUpMKRiFocodqZ6TrAgnaSITyLYUlAfY9F9iJGbqFJUA8uPOuLh8ZO3UgeM5kafmK6aRH0uAAG+2RvEOuS0CiLeg5shgE8AUSyZM00BMCB3vX34pce+U7sMVELe7hIps6bIhMZUIVBNxeKRGzfLspYtbNe0yzuU6dXowl1KPZAfFQkQyzSAjvwHgnUFY3ugzOE85JQFY/EpqBYMDKXfOij1wg0fxwvtM2DReVcYD/J31uZH1YBLXVQE1tTcuEHIRZ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(4326008)(82740400003)(5660300002)(2906002)(558084003)(478600001)(6512007)(6862004)(53546011)(33656002)(6506007)(36756003)(26005)(336012)(2616005)(70206006)(70586007)(47076005)(316002)(36860700001)(8936002)(6486002)(86362001)(81166007)(356005)(41300700001)(8676002)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 13:38:24.6484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66330a61-c706-4064-e14f-08dc104f1692
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5355
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108146

T24gOCBKYW4gMjAyNCwgYXQgMDU6MzAsIEFscGVyIEFrIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxhbHBlcnlhc2luYWsxPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gK0RFUEVORFMgPSAicGNzYy1saXRlIGF1dG9jb25mLWFyY2hpdmXigJ0NCg0KYXV0b2Nv
bmYtYXJjaGl2ZS1uYXRpdmUsIHBsZWFzZS4NCg0KUm9zcw==

