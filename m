Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F3FC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:25:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web10.165071.1673871900610834313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 04:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OyzZHjWN;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYHn/+FRXzk8XiyIO1oNc4tcwFDw4lz/zk28zmzPrpo=;
 b=OyzZHjWNIbuLfci1MGFw2kCkpqNC3dlYZ/AXiGrdtMixMFs+Rv7EWKRerrjGoI3x118MtdZf6Fw3REdiykbAmR38uBvas5uw/ZsFBnK5PIsxAwbdFtKWjxlIgbI/FYkOIIRh9HCrqfb3KFECnGt6Vr2XleXj2mKeDXCrcvRaX8M=
Received: from DB6PR0301CA0066.eurprd03.prod.outlook.com (2603:10a6:4:54::34)
 by DU0PR08MB9050.eurprd08.prod.outlook.com (2603:10a6:10:47a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 12:24:56 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::f) by DB6PR0301CA0066.outlook.office365.com
 (2603:10a6:4:54::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 12:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 12:24:56 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132"); Mon, 16 Jan 2023 12:24:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e69b22f7e9e8fdd5
X-CR-MTA-TID: 64aa7808
Received: from a8bed73796e1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5608967B-C69C-4A2E-B7E3-F04486A46D04.1;
	Mon, 16 Jan 2023 12:24:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8bed73796e1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Jan 2023 12:24:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCU/yu3/LHrsnTfc2XoTG0hKkqAS1wwn/T8wzGWjyL9tjbIZGw8PVIa8tXGm3cCmj6cgSpsHe5f2b1ViEGi/YnL+eN3p4eiapAVeaMHW4bIwznGT+TFlpElveGz+zyk2244ps1yeUBuvrxw4zAj7FIPZsw4qRMNsdMxRAF0haq/8nMOI5kGlA9BBI3+dkKtaDxRAvSmpigfCY37R3pYwJvxw4uA19kj66BW4sXH8mlvn/g36tsAExgiJUi0+E6KvjQgQTqYDizX5RJZx1NUldYBsXGXAeGpxr3rJhsw6wEx3IKhZb/PK7UOpK9qZrvchVnibfOd9FQVpeb6yv+ui3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYHn/+FRXzk8XiyIO1oNc4tcwFDw4lz/zk28zmzPrpo=;
 b=nO918H5lpzaUatrnbKaypyX+atukTNqS3rDN9lAJqmPOcUrMLdq7h5wri3z0U+7g2wBT0rfrdTG1NQ/5dQZ23tzL24qCmJF0QcJxDAr2xLnykkMImwOAk3/16q8ForqYTWCAn3/ApqD4HbLxovtG6YAvi0dVuaCQ1WOGmSt2OTPBNQpmdPXj8XC2HZy0My17dPwG1HROoACSEYNPfFFwhWrC8tIp9PoQ8AEYx5tyGUtTLNdcWi+ui0P5cPxSZXjeTEiLSYya9TIBegQIZQ89QoHfMhe0kDAG4ClbG+BuBhdSiiR5jtTHeqnACIhjOTjcyxLe0KtKGHgKnMqWuk6tuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYHn/+FRXzk8XiyIO1oNc4tcwFDw4lz/zk28zmzPrpo=;
 b=OyzZHjWNIbuLfci1MGFw2kCkpqNC3dlYZ/AXiGrdtMixMFs+Rv7EWKRerrjGoI3x118MtdZf6Fw3REdiykbAmR38uBvas5uw/ZsFBnK5PIsxAwbdFtKWjxlIgbI/FYkOIIRh9HCrqfb3KFECnGt6Vr2XleXj2mKeDXCrcvRaX8M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6021.eurprd08.prod.outlook.com (2603:10a6:20b:23c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 12:24:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 12:24:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: Florian Frank <ffrank.os@ffrnk.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python] Build recipe with pypa/build
Thread-Topic: [oe] [meta-python] Build recipe with pypa/build
Thread-Index: AQHZKSnybP0Gf+Ot80airJGMv3+exa6gBdWAgADy1oA=
Date: Mon, 16 Jan 2023 12:24:48 +0000
Message-ID: <9FED42D9-734A-4481-9B34-003FCF582B2C@arm.com>
References: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
 <HKRJOR.GVPO6JMFGBGT1@t-online.de>
In-Reply-To: <HKRJOR.GVPO6JMFGBGT1@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6021:EE_|DBAEUR03FT013:EE_|DU0PR08MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c8d495-6915-4e7e-fe21-08daf7bcad99
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lBCXZbubWMgtATdPR+IAOz2Kl2/uDyGH2bPdxlUpSpfJ+v71Ah2dRcXKeKACVYsEVehH+g7h1F4jn/T4+q2nBSzxezO/3oZ4yloZxGg/Pdc+YIiNdWFz18FNY3GifrBee+N836auJa8soLsjZjTzK9PDrqc93EqVsfT2LE/xSdBuIlrdQgvgQgTSLiFiIZWgalWRELYDy2gGPiXe8i1uaazAyMZqWRybHReSOKLmLbc8MUfXG7DC3xU8j/oZ7RvpD36vxcfWz+VYxhGmifLkWJLp6DX8tkMj6T97vH9DWcw0He3ldemM0chRpOZa8VTTs+W7oUfePPoZk4pCBeFisX4MpIMZLME9k6sE0ikUNOV3D8rSt2doeQ7kVKxF7/UsQQ+0BtubQ7Au8f4DHLx4P0HtP1aT88THifg9EyXynDE1FL7shczorZvuUlvtbonUoeAroXNFnKHhv/shJeDMcHaWWsAglFIldzdbMbMNk3KeGVbiTmwcIikznWnLUFF5Znh+0XI94eFK9t/mAjG7DtKqDqnLviVPPNbFMuyzrcG9j/dw48daYe9uaLJiUFSc5es182+WwOGp92XcyAmTCFFH6kOqdJbGzHnvlqECxqYY+ZfJH3OlrMKubCQkaDuu1XchR01tbbp2i7MkckvOsb155Y+7Gu5XFjEI4lEeXALZffq+M8Q9IMd1L0VceIRhAxoH+YHiZ9WsN9vlyp4I+eTAJt9QwHnrYndnQ2PQB1U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39850400004)(346002)(396003)(451199015)(33656002)(36756003)(76116006)(8676002)(66946007)(41300700001)(2616005)(66476007)(6512007)(66556008)(4326008)(53546011)(186003)(64756008)(66446008)(91956017)(26005)(86362001)(5660300002)(8936002)(6506007)(6916009)(478600001)(54906003)(71200400001)(2906002)(316002)(6486002)(4744005)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2736932A511DB4781CD4BD796D9B83D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6021
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0337c771-5084-43d7-6ce7-08daf7bca8a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wd0CEp3rVxKcsib7oNqaAOD4dnjXNVsjfKJHOShFJ/FMCbMOpqcJNKu+ePyIpP9WBfToylPsORJygTaWTHlYsqSipVjevenwxhXqXmBfiGBQVKz1Sm/sLScvOaJb49ZTtuvepY9Limm83i7QtInprkhw2EIfiguhqw09NDjOUO9iGmAGaDZoZFh2NOtpZsoRGp4bS5ojTvzBSGfOavcXaX9yUd8iBZbIaJM1m0H5mtvdjFM9nS0azVg01UVmmLQTaTyP7WlP28p4OidxMCNa9aS/tv6XFdYJjSAZdNI2J92b+mJeeUjl+8stoT2nOxK82eh/o1UkmxHdPC5xDENmayLdj/DGbWhT/Ygwm3B6DbnqrA16fTMW7sk5EVbKhuPTf4Wjzi4IdiaOyhW8D/5w1hZj+QSd+SwmRuBEyqavA/y8VP4QX22iZe/2X6gG92ewtc6D3Q2Qq9sywTwTSOL2yKBT5lLsKhGczOJSiWabSUakW9npQOxBQJvn5eBG6yQqBdM5HbIAOftt+O9EIAfkt+RKLAK704Y3IlRhCzDjgu5qk6Qwgfd3vppeBEGQWovxX77fMnny9ezmCmxOGiC+zqtZoV2gUYCcN2A9d5eH8TUzTx571LYOvoa+R/dyzBnlcSy233GYAXDn2XqLmUJqU1aAq3cp7mfuyW2yrAi18PMuAt+4/4bx3V3zg5BnpSj6i08CSTLuUB0Ce6YOCGl9nQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(86362001)(82740400003)(36860700001)(2906002)(6506007)(81166007)(36756003)(40460700003)(33656002)(40480700001)(47076005)(2616005)(82310400005)(316002)(356005)(54906003)(4326008)(4744005)(83380400001)(41300700001)(336012)(70206006)(70586007)(478600001)(6486002)(8936002)(8676002)(5660300002)(53546011)(6512007)(186003)(6862004)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 12:24:56.4184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c8d495-6915-4e7e-fe21-08daf7bcad99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 12:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100582

On 15 Jan 2023, at 21:55, Markus Volk via lists.openembedded.org <f_l_k=3Dt=
-online.de@lists.openembedded.org> wrote:
>=20
> You can try to 'inherit python_setuptools_build_meta' for your recipe

This is the correct solution.  The recipe uses pyproject.toml and setuptool=
s, so you can just inherit setuptools_build_meta (which will then use build=
).

Ross=

