Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48881C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 20:21:14 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web10.81202.1701721270603336296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 12:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HjTwUHh9;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HjTwUHh9;
 spf=pass (domain: arm.com, ip: 40.107.247.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DG0m4itOc954qs+LJd9ap0hwlhyB5NPZZi8G/CxqvjUcobJ6qhaieBEziRuX7KS7KzmNCrp1KMErbbLvefT3vMvBttENub+TEBzBx1BoQptfWGivEhItG8jni4J7AlcwS0T1P6ZLVFYWfVrFbFzroG37BxuFcahfECbRWMcthpHxe1Y+q2waX0nUtvMEovMQqOep5COYg12Fu+KrujSf5U7WVy7mgggH7F/5NhG8LCxsqJyRcbFm7Mne6eQTr0S/G8OJ8dam0ytbvnq6Wjk8AY9IRoRxPclpRrvS7giax0Zewb3Y/81su1B175FHlIKOWuGcSFmMvmM5qf9CA3+20Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpHCtjmCicGtUwdCbCweXZ+JU/FV/pIhUNUu1wUvFMg=;
 b=XfyKF84NaqeQyIP/kqLtAYqDQJNpK/07bS/NzA/t8nCSNXtPsAfPuI2GGVndfffaHP2922civHaCl9V0lDnwVgetzYt5ZeOnS/e93K21Ul2WpoO0VGRWSsK761DLWybd7db3oZi6Wd96/TzcWeNL5KlQcktu87bXsxwNnUiMke9MA+7kkIezZjUcIo4BR+phpRMqluf3X9leppEQ2KH1S+Sc6MM/9oAB9g312wa/3rjTy8Jf0arFjAmE0kYv4antC5+P4rQCF1aiUaLqfaSBuk8QzWJwwKCScm/12J7yTROyvGyPPlLxxSFk3IYMITGVpvfIfsiYcKxzeK644Cy1tA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpHCtjmCicGtUwdCbCweXZ+JU/FV/pIhUNUu1wUvFMg=;
 b=HjTwUHh9mPkOnVZ/VDKimC0KPHEBQe6gFM9Yey2lmZ41+pzJGdUWZuvPgJLPZd0EM5nPXyFNpTEk1XFcGpzSPAwzznYDVR3/OMXbr2x6L3+wR+7ifdishZ4+n7TYieMhZBiDGvD0F7uIwbroO1DCQQv8V4IUR8PI4olPFBqdaPU=
Received: from AM5PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:206:1::26)
 by DBAPR08MB5574.eurprd08.prod.outlook.com (2603:10a6:10:1ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 20:21:05 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:206:1:cafe::e5) by AM5PR04CA0013.outlook.office365.com
 (2603:10a6:206:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Mon, 4 Dec 2023 20:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 20:21:05 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Mon, 04 Dec 2023 20:21:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f74ff0fd74617cc9
X-CR-MTA-TID: 64aa7808
Received: from d2bd2944d79e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4C77DBDF-40B3-4D15-A164-E54B4D67E9AA.1;
	Mon, 04 Dec 2023 20:20:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2bd2944d79e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Dec 2023 20:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsK0mS8Q1YoA3m3O3dwaNcQnNGds1AYSpVixqwCOj9oj+Iu34GZBHKR5eiTmYm8SwrWQ+RVcMdMGFBxVGOpPoRqArfldr9Y2vb7sAjsM3/9k7o4av/pyOunuiQDGpDYI+AGOOFp6T+WpoRlPjXyTfzTIRLqxqjV3VFUWbUC5xfBa0zfwvSxdu/GyypEra9p81gNPcUlZokLlhNFcJvPQd1g1EgY9P4XH6NHfgRRN0DMifCPO6IPEPmJRtgBiAGrPGF09aHrh/9JIKC+idTheCQ9ucl1fve3iKmhgz0oGly3WDtWeWs8YzdPxK3F0BHoSBjSmaq0tkSvj+KlC70MugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpHCtjmCicGtUwdCbCweXZ+JU/FV/pIhUNUu1wUvFMg=;
 b=cCUTCuQDFxbP8Hf55CYJ8BZlwzmVdn7HpFA8Dol4yUc1a6FPx1pVBKQ6/kbpcNsnu+DGbzkravmOA1BaV+uk2st6PSMBHJmmsX11gCM9dtqRhXwY14dy2yLz1Xpa/Q/ssCzRt7Gns8SJfdvzMNWZIVsQlf0d7RtEDKjdHczYv9I5DSDcSJdXevNIK0/ipaQdvx3EcZ/9pDKPNLsL55SN4btDWuR67Da8CJBSGGSj7O5sRDqIIEvtkzP9/Q/vS96UG09G6XDKEUdxS8w+7Yp7mid4sXzFndtF6D5DubAZVYcFWYDhXKIevXhXS/CE8oWOCC2JCkITG3gtG8qXeFU5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpHCtjmCicGtUwdCbCweXZ+JU/FV/pIhUNUu1wUvFMg=;
 b=HjTwUHh9mPkOnVZ/VDKimC0KPHEBQe6gFM9Yey2lmZ41+pzJGdUWZuvPgJLPZd0EM5nPXyFNpTEk1XFcGpzSPAwzznYDVR3/OMXbr2x6L3+wR+7ifdishZ4+n7TYieMhZBiDGvD0F7uIwbroO1DCQQv8V4IUR8PI4olPFBqdaPU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9481.eurprd08.prod.outlook.com (2603:10a6:102:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 20:20:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 20:20:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Thread-Topic: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Thread-Index: AQHaJutyVC1ebH+Tz0eB/ug97A8uh7CZkOMA
Date: Mon, 4 Dec 2023 20:20:56 +0000
Message-ID: <B6E6AE3E-3980-48FC-8E44-2863A20B1DEF@arm.com>
References: <20231204195224.45946-1-alperyasinak1@gmail.com>
In-Reply-To: <20231204195224.45946-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9481:EE_|AM2PEPF0001C709:EE_|DBAPR08MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed85baf-e0c0-455b-a90c-08dbf5068ada
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NewDO/sfUvCCdkuDXcWg9VnF5MsppWFxknI0jMkn7rBKwInATdXf6MUdggAMWshd+Og+/yXLcZo/50e9To5EDYB6hnndc2UMZ8URNyF7pGJ/9DP0ZOgUD4MBdSCEl+H21kBoMbWhqODYHiBSGqdagD9l24u4TcJb40fko0UYv6z4S2x4iUpdZO9S5pBbS3pBKFOta5oleLPI6B+9ylYGFsoJ9HTAQAe/zSaxvRsjawshxGs+0j91RMMVeiqq+rLbaz73ZnbidD931d6Jr2c9ko/bJ1n3J6KTlPBQ7qXuM2TkauBYCwp17rVPTpbkGnFUSCe5+5A1r2RUvf5/6pIw7Rh+ZyjIPIiveuqsf0pNXCVFRPDHwxBXDjY9aHAm1XrD/mcPiJyjRmJli/0XfPsPUy2gG4udrJPDvhvw8hpnb+mX/uolRAalNwR7r57A0Rhp+4j/xYAoLOPbt93mXrjLpfXNWhs4ZM9EWqy1VcHiTK+zVN9Zabq9EmK5XYOD9HetYTT864KNmc6Mleyj2j2uROcT4dWNN1Il16JcFgXba231b4Kr5dMRrtmlXPKmUystEsXm4iO4IsYk64/7+P3t4ZO+6XbgjlAOjwPokBtyJQh+QQ8EAM60tB1eVBGefsitaiJq/ksrSMw+L8W1UXqvpQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(33656002)(71200400001)(6512007)(36756003)(6506007)(2616005)(83380400001)(6486002)(478600001)(26005)(38100700002)(122000001)(316002)(91956017)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC1985000505BC4BB4C6E411FBFDCDF8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9481
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	64bf5889-a1ff-43a8-6775-08dbf50685dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/5Di9pCyqTETjSGLqnnHKc0j2ZMPQiqMCQRKJULlIIXaec8HyYBAv88g2k0OXvSZxvOPnLKJB9g9zugEVpwXPvBYbLL94Q+Y5PdiARwVCOpVrBZegilQwdFyr/QzIkTSmElyUAbbx+W9oWuAqdI4fBMaNH39OpmQaqsJ33a5LeNtbJYDRNH5/skp6/aBSnxbuoIR8500//CryuUstfDI3mw0rZk3+ZfN1yknoVDVMwUpNCma2mMYKfTVrK+8I0ePF89dZPt92AV1GU5I3eUDcSpu6Z5uxsi8lH7gNwJAcdMF11z30tBZ4tt5ohI/7+bGU+vDVFyXxZ8FqkUQXs2Z6pfZDN6XLn73u4ZnmZMb+e8NlUrY2QydIBhrA1pd9JJ1YPlCvCJ2GJ/0DA/XpwCVPoKSYuEvbWF4HH7ECE7/If4fH20a57rvQCFujFO5GdSVOI2pKORiGeiJQ9vuB2jtyUkBAAcoBhhyy6u40x8euexSctdVE39WlrX7KqtOZdubN+OnqwOzbDtSS32+JLAAIZxDV31xvMvuiMwDeDoiujd+7YXonvOsYW3mL2GLPW3XhfJ1yEAaJw44tOgasllM+50oht+2Z1Khwg5eiytIWPWryn0EtAiFNPQAr9GgrSR3gEy7YjzesKptqXS307MQLaSfZzOX9p2mhkfQZiS/ymJ0YE3SEU2yJXxqDNphQaABthSCvU+8Wvhc7irpxpMzPwDW0Dz9hLfMtFtTBgWr3po=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(82740400003)(2906002)(5660300002)(40460700003)(36756003)(33656002)(86362001)(41300700001)(6506007)(478600001)(6486002)(40480700001)(6512007)(36860700001)(83380400001)(26005)(2616005)(47076005)(336012)(8676002)(4326008)(6862004)(8936002)(70206006)(70586007)(356005)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 20:21:05.0470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed85baf-e0c0-455b-a90c-08dbf5068ada
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5574
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 20:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107214

PiAtZG9faW5zdGFsbDphcHBlbmQoKSB7DQo+IC0gICAgY2hycGF0aCAtZCAke0R9JHtiaW5kaXJ9
L2phc3Blcg0KPiAtICAgIGNocnBhdGggLWQgJHtEfSR7YmluZGlyfS9pbWdpbmZvDQo+IC0gICAg
Y2hycGF0aCAtZCAke0R9JHtiaW5kaXJ9L2ltZ2NtcA0KPiAtICAgIGNocnBhdGggLWQgJHtEfSR7
bGliZGlyfS9saWJqYXNwZXIuc28uKg0KPiAtfQ0KDQpBcmUgdGhlc2Ugbm8gbG9uZ2VyIG5lZWRl
ZD8gT3IgZGlkIHRoZXkgZ2V0IGRlbGV0ZWQgYWNjaWRlbnRhbGx5PyAgQXMgaXQgc3RhbmRzLCBJ
IGNhbuKAmXQgdGVsbC4NCg0KPiArUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnb3BlbmdsJywgJ29wZW5nbCcsICcnLCBkKX0gXA0KPiAr
ICAgc2hhcmVkLWxpYiBQSUMgaGlkZGVuIGpwZWcgaGVpZiBvcGVuZ2wgZG9jIGxhdGV4IHByb2dy
YW1zIG11bHRpdGhyZWFkIHB0aHJlYWQgYm1wIGpwMiBqcGMganBnIHBneCBwbm0gcmFzIFwNCj4g
KyAgIg0KPiArICANCj4gK1BBQ0tBR0VDT05GSUdbc2hhcmVkLWxpYl0gPSAiLURKQVNfRU5BQkxF
X1NIQVJFRD1PTiwtREpBU19FTkFCTEVfU0hBUkVEPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1tQ
SUNdID0gIi1ESkFTX0VOQUJMRV9QSUM9T04sLURKQVNfRU5BQkxFX1BJQz1PRkYsLCINCj4gK1BB
Q0tBR0VDT05GSUdbaGlkZGVuXSA9ICItREpBU19FTkFCTEVfSElEREVOPU9OLC1ESkFTX0VOQUJM
RV9ISURERU49T0ZGLCwiDQo+ICtQQUNLQUdFQ09ORklHWzMyYml0XSA9ICItREpBU19FTkFCTEVf
MzJCSVQ9T04sLURKQVNfRU5BQkxFXzMyQklUPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1tqcGVn
XSA9ICItREpBU19FTkFCTEVfTElCSlBFRz1PTiwtREpBU19FTkFCTEVfTElCSlBFRz1PRkYsanBl
ZywiDQo+ICtQQUNLQUdFQ09ORklHW2hlaWZdID0gIi1ESkFTX0VOQUJMRV9MSUJIRUlGPU9OLC1E
SkFTX0VOQUJMRV9MSUJIRUlGPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1tvcGVuZ2xdID0gIi1E
SkFTX0VOQUJMRV9PUEVOR0w9T04sLURKQVNfRU5BQkxFX09QRU5HTD1PRkYsZnJlZWdsdXQsIg0K
PiArUEFDS0FHRUNPTkZJR1tkb2NdID0gIi1ESkFTX0VOQUJMRV9ET0M9T04sLURKQVNfRU5BQkxF
X0RPQz1PRkYsZG94eWdlbiwiDQo+ICtQQUNLQUdFQ09ORklHW2xhdGV4XSA9ICItREpBU19FTkFC
TEVfTEFURVg9T04sLURKQVNfRU5BQkxFX0xBVEVYPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1tw
cm9ncmFtc10gPSAiLURKQVNfRU5BQkxFX1BST0dSQU1TPU9OLC1ESkFTX0VOQUJMRV9QUk9HUkFN
Uz1PRkYsLCINCj4gK1BBQ0tBR0VDT05GSUdbbXVsdGl0aHJlYWRdID0gIi1ESkFTX0VOQUJMRV9N
VUxUSVRIUkVBRElOR19TVVBQT1JUPU9OLC1ESkFTX0VOQUJMRV9NVUxUSVRIUkVBRElOR19TVVBQ
T1JUPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1twdGhyZWFkXSA9ICItREpBU19QUkVGRVJfUFRI
UkVBRD1PTiwtREpBU19QUkVGRVJfUFRIUkVBRD1PRkYsLCINCj4gK1BBQ0tBR0VDT05GSUdbcHRo
cmVhZC10c3NdID0gIi1ESkFTX1BSRUZFUl9QVEhSRUFEX1RTUz1PTiwtREpBU19QUkVGRVJfUFRI
UkVBRF9UU1M9T0ZGLCwiDQo+ICtQQUNLQUdFQ09ORklHW3N0cmljdF0gPSAiLURKQVNfU1RSSUNU
PU9OLC1ESkFTX1NUUklDVD1PRkYsLCINCj4gK1BBQ0tBR0VDT05GSUdbYm1wXSA9ICItREpBU19F
TkFCTEVfQk1QX0NPREVDPU9OLC1ESkFTX0VOQUJMRV9CTVBfQ09ERUM9T0ZGLCwiDQo+ICtQQUNL
QUdFQ09ORklHW2pwMl0gPSAiLURKQVNfRU5BQkxFX0pQMl9DT0RFQz1PTiwtREpBU19FTkFCTEVf
SlAyX0NPREVDPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1tqcGNdID0gIi1ESkFTX0VOQUJMRV9K
UENfQ09ERUM9T04sLURKQVNfRU5BQkxFX0pQQ19DT0RFQz1PRkYsLCINCj4gK1BBQ0tBR0VDT05G
SUdbanBnXSA9ICItREpBU19FTkFCTEVfSlBHX0NPREVDPU9OLC1ESkFTX0VOQUJMRV9KUEdfQ09E
RUM9T0ZGLCwiDQo+ICtQQUNLQUdFQ09ORklHW2hlaWNdID0gIi1ESkFTX0VOQUJMRV9IRUlDX0NP
REVDPU9OLC1ESkFTX0VOQUJMRV9IRUlDX0NPREVDPU9GRiwsIg0KPiArUEFDS0FHRUNPTkZJR1tt
aWZdID0gIi1ESkFTX0VOQUJMRV9NSUZfQ09ERUM9T04sLURKQVNfRU5BQkxFX01JRl9DT0RFQz1P
RkYsLCINCj4gK1BBQ0tBR0VDT05GSUdbcGd4XSA9ICItREpBU19FTkFCTEVfUEdYX0NPREVDPU9O
LC1ESkFTX0VOQUJMRV9QR1hfQ09ERUM9T0ZGLCwiDQo+ICtQQUNLQUdFQ09ORklHW3BubV0gPSAi
LURKQVNfRU5BQkxFX1BOTV9DT0RFQz1PTiwtREpBU19FTkFCTEVfUE5NX0NPREVDPU9GRiwsIg0K
PiArUEFDS0FHRUNPTkZJR1tyYXNdID0gIi1ESkFTX0VOQUJMRV9SQVNfQ09ERUM9T04sLURKQVNf
RU5BQkxFX1JBU19DT0RFQz1PRkYsLOKAnQ0KDQpKdXN0IGJlY2F1c2UgdGhlcmUgY2FuIGJlIGFu
IG9wdGlvbiBkb2Vzbid0IG1lYW4gd2Ugc2hvdWxkIGV4cG9zZSBpdC4gIFdlIHNob3VsZCBhbHdh
eXMgYnVpbGQgYSBzaGFyZWQgbGlicmFyeSwgd2Ugc2hvdWxkIGFsd2F5cyBidWlsZCBQSUMgY29k
ZSwgd2Ugc2hvdWxkIGFscmVhZHkgc3VwcG9ydCB0aHJlYWRzLCBldGMuICBEb2NzIHNob3VsZCBi
ZSBndWFyZGVkIG9uIHRoZSBhcGktZG9jdW1lbnRhdGlvbiBESVNUUk9fRkVBVFVSRS4gQXJndWFi
bHkgc29tZSBvZiB0aGUgZm9ybWF0IHN1cHBvcnQgb3B0aW9ucyBjb3VsZCByZW1haW4gKGJhc2Vk
IG9uIHRoZSBwcmlvciBhcnQgb2YgSlBFRykgYnV0IG5vdGFibHkgdGhhdCBtZWFucyBkZXBlbmRl
bmNpZXMsIHdoaWNoIGlzIHdoeSBpdCB3YXMgYWRkZWQgaW4gdGhlIGZpcnN0IHBsYWNlLiBCdXQg
b24gdGhlIHdob2xlIHdlIGRvbuKAmXQgd2FudCB0byBleHBvc2UgX2V2ZXJ5XyBvcHRpb24gaW4g
dGhlIHJlY2lwZSwganVzdCB0aGUgb25lcyB0aGF0IG1ha2Ugc2Vuc2UuICBSZW1lbWJlciB1c2Vy
cyBvZiB0aGUgcmVjaXBlIGNhbiBlYXNpbHkgYWRkIHRoZWlyIG93biBpZiB0aGV5IG5lZWQgdG8g
Y29udHJvbCB0aGUgcmVjaXBlIGV2ZW4gZnVydGhlci4NCg0KV2hpbHN0IEnigJltIGxvb2tpbmcs
IGlmIHRoaXMgaXMgYSBsaWJyYXJ5IHRoYXQgc2hpcHMgd2l0aCBzb21lIHRvb2xzIHRoZW4gdGhl
IHRvb2xzIHNob3VsZCBhbHdheXMgYmUgYnVpbHQgKHRoYXQgd291bGQgYmUgdGhlIHByb2dyYW1z
IGNvbmZpZywgSSBndWVzcykgYnV0IHRoZSByZWNpcGUgc2hvdWxkIGluaGVyaXQgbGliX3BhY2th
Z2Ugc28gdGhhdCB0aGV54oCZcmUgcHV0IGludG8gYSBzZXBhcmF0ZSBwYWNrYWdlIGFuZCBvbmx5
IGluc3RhbGxlZCBpZiBuZWVkZWQuDQoNClJvc3M=

