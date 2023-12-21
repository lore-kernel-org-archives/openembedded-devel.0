Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17638C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 10:40:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web11.48499.1703155247861157257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 02:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8g3Cg4zT;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8g3Cg4zT;
 spf=pass (domain: arm.com, ip: 40.107.6.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oHBgi6VA60Rsnb/bvkjf+e8vjTZiMhjMrp6m+mFD4Nu+gpuOS/16X+wmadamj65NIa22AqSBRGo/i+vui6eJZ9R11CKMoRwxIlrTHuPI70RLkVAukC/J9lBTszAoKQhyjxIpPzFIzZ3ZTWrFyFda1ibLkseK3o5sSGTbjpY8R8b0KmYu3lwMRKF3JomLee/Nodhip/HS8otTPlrD9XQHqBsH7+OS4hIYliABR4etcwTYLyeuGx/gE89N3T/MMh5utM8CrSJDbgsAU4FdHBMfS0q+S6tMUS0Y+YUsuz7uu+he9n31IFotsozQ+Wpv1U3E1rvMnniDChUyqZRKSf/iwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XCrowAdHmXj0mzUFmB7AXugdoZOIJo+3Q5Qa1JVAWM=;
 b=Y2mm2vSZ1OC0VeKcoL7WoDTvrO3Z07E5PpffeFwNU8MTtlfkMv35yaTVK6uoAeghrn6CvWs+XVsiYAfoXQ7IX2DZr+rhv/fe1FfZ41fuHfxDlxvgTzmu3qEoYqFy/IYg30Wx1NiqiL7DUXJdB7Zf770FNSafZgLWT3wiCdetYyJ3NjyNXxM79JGV29EW6hjux2IMsnRJyGFrJx6QLXKxuAB5APqroYFm9Djfw00ez7GMO2UbBhT3TFQdKXmeAcQ87X/+/Dta47SAG6Hs79d5DJ7hh6XuqXmNQzkRC1MhX9udubQ2wfgNx1Co6EZqirN3RVkp/fc7SlyjgUSplZ9Gpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XCrowAdHmXj0mzUFmB7AXugdoZOIJo+3Q5Qa1JVAWM=;
 b=8g3Cg4zTRJNCfRknSte1bqO7f0iCpMemV4ddSUFL6rR/IJG1QwNw1wDcKBEhu93so2K4nZ3d9WbQ785SfRncxKI/unP1LN9gvqQu6KlKY1bg3SCxqeANzx3rKh4dnJvf+2fLbUHEnVdhYLVz9MoLXVHw56LUNTkEecAIFCom5xg=
Received: from DB7PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:36::40)
 by DB9PR08MB6508.eurprd08.prod.outlook.com (2603:10a6:10:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 10:40:44 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::a3) by DB7PR05CA0027.outlook.office365.com
 (2603:10a6:10:36::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Thu, 21 Dec 2023 10:40:44 +0000
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
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 10:40:44 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Thu, 21 Dec 2023 10:40:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7d88a0545afcea4
X-CR-MTA-TID: 64aa7808
Received: from 0f91e53dc5d1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6699BFC6-9689-4607-961B-90FB2509769F.1;
	Thu, 21 Dec 2023 10:40:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f91e53dc5d1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 21 Dec 2023 10:40:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsFo5hmJ/WsFUkNEEdIWDmJ5X6Spc2/O9Uzk0o4HjPqXZZTcwHiYqpUjJjPhJAJz00or/uE8xxotg2QQqM4qE5+tW0yqnl7+/c92fxkWz8LDCz/caXfOuptBSi4Eh2tXmn2442+WNdDb2f1sW1bh2EdMpiUB1AFeR1iWulAGoastJarTHjuaqoNFIMYMKwRitLtVYGf02wjbj7l3Cn+GGNnQb1nphcACYYAbML7TNdwhEwETFkeExIjSMjmorJUr8pf1RzRHD4aCid5cl1DH9ob1OwWxibsS+dz75qpg1kY25a/p1V03jooI1TkroZ9mliB6L4gUR+rJ8FonVVRX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XCrowAdHmXj0mzUFmB7AXugdoZOIJo+3Q5Qa1JVAWM=;
 b=JCMB3UFwdbNTMlqJIRltNLrqPsCE5pyvuJjTyul8TB8Q9tzI5j+xrmvZKvgs3Ed++lX4vAAZNf+jPWzhfPTYsfNDP29tUmN1dPo8GCCQ8syA9Ev+axh7FXpTLP0uwfdubyCHj+eH1L34Roq/G1Wki846Nw3UPPqEDLvNFmJuvGI5wwiC93MrsNzDLKNo1mfmHoE2gAK50Kascry8kDSGa+Trm6jueLP55cgm+N9pkHyc4Y4G6MK5Mv9AfoCy3QILUqnPdqUebbVWvo+FIace6ArsKxjs98PMZPcO3VTOlVJOAIEY8qCiJMdUT52YYqhNDi5Zpa7SMVmCsuVfxnB1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XCrowAdHmXj0mzUFmB7AXugdoZOIJo+3Q5Qa1JVAWM=;
 b=8g3Cg4zTRJNCfRknSte1bqO7f0iCpMemV4ddSUFL6rR/IJG1QwNw1wDcKBEhu93so2K4nZ3d9WbQ785SfRncxKI/unP1LN9gvqQu6KlKY1bg3SCxqeANzx3rKh4dnJvf+2fLbUHEnVdhYLVz9MoLXVHw56LUNTkEecAIFCom5xg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9613.eurprd08.prod.outlook.com (2603:10a6:102:2e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 10:40:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.034; Thu, 21 Dec 2023
 10:40:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/2] lemon: upgrade to 3.44.2
Thread-Topic: [oe] [PATCH 1/2] lemon: upgrade to 3.44.2
Thread-Index: AQHaM1y7P7Eps8PqSkasnkatk3Nxu7Cys+oAgADZkoA=
Date: Thu, 21 Dec 2023 10:40:35 +0000
Message-ID: <00D0BCFA-C21F-48EF-A38D-527889D61199@arm.com>
References: <20231220155334.1055853-1-ross.burton@arm.com>
 <CAMKF1sqC=LDFtm3eXqeWiSnDo7NW6=BTh3mJHzcFAOxDDSN0+g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqC=LDFtm3eXqeWiSnDo7NW6=BTh3mJHzcFAOxDDSN0+g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9613:EE_|DU6PEPF00009526:EE_|DB9PR08MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4e4f9d-312f-4068-8748-08dc02114918
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 64FwGcumMe7Tu9U2BjSCvbf0i5HiB6Xn1KKJtLvenoRrSuAYMuWmRH157WCuCJX2MstG0SqKUUHoIb0FUv/scK+akFv6Qha4r0wbK+29GwDGfJhb0loMuyzXGQ9jOpT4GFCK6wf8YFmp0k6bkZsjfdqkkw4JcV4W7qSyuASNNxyMFCeHjGm/2ZWyTD0SvLIsVw59BFVqDAuk3OVOSTnXyONEnMOHvoCBjFRzXaGLFkwoqKfbu6uT23ccoD8Wvo6kR83cQeSBWOmXI3lZIH/D6MAodW8y4wf4Vx8cLxlmaDBBJ9ANLMSCmdJBVT92FeGMINQJYRdsugyBVoQrVlb0YJNSZjtREsSMxqB/kaXoBdLu2LQlDpnVDJ19AkadduWu1senbSpCnxmsUhLaqb56h1S5wsV11ODShFXu8xS/GMS+uvIXqQ4XSdancww98NvoL882loLrsfaNgBw5grOQTCe2JMwz4SzYITVdopUFHhyKIBg1JKV2pvYnoEImtxDhGkkV7629kdo34Bp2BQ6x1ng2Y0+nb0awKDHxM6QUJhlPLmyXOnzmxgALVL3ROYsMLfdtcqfMSXQNcUgyPjd8a51onwMEjJNFI5TbjAyl/MTtX3rryucYZj00SLE6c4e7JRkvtRajnog/UTJiN6DjRA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6486002)(71200400001)(478600001)(38100700002)(122000001)(26005)(2616005)(53546011)(6512007)(6506007)(33656002)(8676002)(4326008)(8936002)(2906002)(558084003)(36756003)(5660300002)(41300700001)(86362001)(38070700009)(6916009)(316002)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E28C7198D43F3444B4A2F430D56561C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d79446f-f47f-4394-fd65-08dc021143e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UOEPQl0Q+UrXPofIa8mGkx1C+GqFK0ir2eB7Dn9QHVXlVr9UkoTWsnHzzPXRwf8ss3K/3RxWS011Y8UbivCgsYHf9iqe0cfpmfkDFOtYVZStJM3wE/xjd/DgE8WbLK1naKEZ83svHA7GxjxJDKUve8vvdcem/fHy8wVTcajuDhl51yMzOYczdnfFNM2BREHEgG4Fjszfq7mK0vP6tmxgwhXNRP2zM20cGFi8BI0HLChXXOUKzoHlRqwMxU4h6rHaCk3WxTdG3FNSE26qSGNArSGwRvT4rIBqI89MgbtCVGUI0DUhVWcOMU10JDnJwax/Ws4uFsaTSAfFSt+NLEgIuvoPL02NwRihzByDDGtcbQNJgUspTV4WI2UyElNw2V3zrpeYxEkWgi6mnbJq5OFJkoGV1P3OlESMTxBSepVUN3vd7D/l8RiLVbgkcU2v5j7Viwyz9+0v2hzLiKXYdKqnP+bzqrnw5AbmboTY3SXvq4HoAw4AQkFAo0OG4ClS+7BHhCVzdRTqA93mCVtc4sRcPDm0BJ9Hk7mxULGbxgia930YeL7txcvTnxEfnViK6JR3NskLtDQjkub6AT0iIIiqM8lpXCtWWFSoVY29ON645Lx1dYuf3++4Bm2mo02NZ6bWpzrHsqWI5ixUeHEdHO2w7PPOXgX4YXu8vJgD2y0cFq3lXoRsdOvCRNGBje2JLyaftibW8zPDq+WVMWNQZ9T1s95aLFpFdbtA8GAfGn7f2owY++A4NHj3kjkbIbkDS4Tk
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(46966006)(40470700004)(36840700001)(316002)(2906002)(5660300002)(4744005)(70206006)(70586007)(41300700001)(8936002)(8676002)(6862004)(4326008)(86362001)(36756003)(40480700001)(336012)(82740400003)(47076005)(2616005)(26005)(81166007)(356005)(36860700001)(6512007)(6506007)(33656002)(40460700003)(6486002)(53546011)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:40:44.3811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4e4f9d-312f-4068-8748-08dc02114918
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6508
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107706

T24gMjAgRGVjIDIwMjMsIGF0IDIxOjQxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
Pj4gKyAgICAke0NDfSAke0NQUEZMQUdTfSAke0NGTEFHU30gJHtMREZMQUdTfSB0b29sL2xlbW9u
LmMgLW8gbGVtb24NCj4gDQo+IHdoeSBkbyB3ZSBuZWVkIENQUEZMQUdTIGhlcmUgPw0KDQpJ4oCZ
dmUganVzdCByZWFsaXNlZCB0aGF0IENGTEFHUyBpbmNsdWRlcyBDUFBGTEFHUy4gSSB3b25kZXIg
aG93IG1hbnkgdGltZXMgSeKAmXZlIGRvbmUgdGhpcy4gOikNCg0KUm9zcw==

