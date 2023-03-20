Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D098C7619A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 14:46:55 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.89])
 by mx.groups.io with SMTP id smtpd.web11.16112.1679323610489793401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 07:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kUIrKBsl;
 spf=pass (domain: arm.com, ip: 40.107.247.89, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYt1mSiSBNyAoEwxWVEmc0oRZR7MxtWcgZUJK2yRZiw=;
 b=kUIrKBslVMqzFqwPt/WVLKYMWyXs5EOF5J7qpLssM48Z19dMUTJj8n5356auvLZ+2JLlXJX3nkUo4FoXoj0a26V6FjfsU110ADwrMPnrDjdGNiy5t2smRq7GLBMSQ/OBzvH6fviyFNHGjw4lyrRQz8kdlo1lJQNqByto2gfnvjw=
Received: from DB6PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:6:2a::13) by
 PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Mon, 20 Mar 2023 14:46:47 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::58) by DB6PR07CA0051.outlook.office365.com
 (2603:10a6:6:2a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.15 via Frontend
 Transport; Mon, 20 Mar 2023 14:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 14:46:47 +0000
Received: ("Tessian outbound cfb430c87a1e:v135"); Mon, 20 Mar 2023 14:46:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52c658ccb5c60b1f
X-CR-MTA-TID: 64aa7808
Received: from 4140fef0ad1a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EF1E40AD-EDA7-4E12-B168-0CF311F5849A.1;
	Mon, 20 Mar 2023 14:46:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4140fef0ad1a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 14:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj6znoABba+zisUSho/yDMS2q+elBWt6H+u7tlWNZBj4vSNfWScxbm9hpdbSbYTglvLVa7Oh0ovq3QFEx4PHTGc6ORk9rPBPo91Q5QtXbj9PsFTBcHFKLgrrR46NViS16uiPt0F7h1rAYlQ2rMXYzO5BJo60cbJG0YuMgZKig9lShi1Sjfn6VsbHIgo9IviObrDsFacKpJfxGSWgbb1DkBi/3a+Kyb4WqZWNaiK1UPksVD+uqPrGFL0J3uTN1CDqp7kzWyPVfvqiPwT1U0nIdWK4iYOWR4bXSa+tRBCX72GRjN08Q5j137ReZi38cEkmGeQKMKVuri588OeE43Nnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYt1mSiSBNyAoEwxWVEmc0oRZR7MxtWcgZUJK2yRZiw=;
 b=kQxv6bA3n+6tc9/AlZXAx7EwdNbKl/bEPFuZV6L8akpSJmnOU+BI159LbCTpTJNDvDPeTXLTmIRNPpZPiFWOWCopL+3FetCI6ijzHEwT/TPRNO5QEh2+dNR3yyWvJeKyLXHJtnlHNbBbtBvY9ItA8J8FnKNQVr3eSkd0a+K7AEWSlGjxo2cSSEqjzGge4GsgV///wS0aZNOlZ+sClm8W5A2g2W91W8SSxMR+e/4WH8E2QB/RYQMT5/VoNkBP+2kDCzTXjQCeqJdeFHH4UwpC8BFi1FXLwf0r0tn7v4QmQUzEjVdiFzjUYDW3E5ej75Jy8jt7nt/Yttwu8qziryRPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYt1mSiSBNyAoEwxWVEmc0oRZR7MxtWcgZUJK2yRZiw=;
 b=kUIrKBslVMqzFqwPt/WVLKYMWyXs5EOF5J7qpLssM48Z19dMUTJj8n5356auvLZ+2JLlXJX3nkUo4FoXoj0a26V6FjfsU110ADwrMPnrDjdGNiy5t2smRq7GLBMSQ/OBzvH6fviyFNHGjw4lyrRQz8kdlo1lJQNqByto2gfnvjw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB5923.eurprd08.prod.outlook.com (2603:10a6:20b:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:46:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 14:46:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
Thread-Topic: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
Thread-Index: AQHZWKG983aWdu54VUucEenfeZ6i9a8DxDyA
Date: Mon, 20 Mar 2023 14:46:34 +0000
Message-ID: <6646B534-8948-4706-9E8A-DAEA4111B694@arm.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
In-Reply-To: <20230317072547.1031123-1-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB5923:EE_|DBAEUR03FT041:EE_|PAXPR08MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ac4325-8d1c-4f12-63f1-08db2951ee7b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 n1Y0arLcRVU5cOaYQoWFRCXwqDarFJPU+YrZL38dBOdRqJiAPBq3gGw/l6+CrdGZ12VRa2to1OuGP9DkQfjWQlIV0krYMutxWiqUur+5u99d81zedN9CQD3X/Si5tysZSk7Yr5H8SFJBMvjnRbqi6uJsrg5f+aCrSJLU7pikviR8cfb2/Ut+PVX6NhDf0J3PVRGypdMB820aneUolovgbQMWfaCViQKkKMbIdRk28N359Q6TumwH188QoJ6o2/z0RUkGG6CKNGJI8GFTmHcZJldzbvhWaPZWuNokg4a47xPBd1v9RZo8MMIGSp5Dq+AHvCMHaWLWCaZCT956rc5qtgH6AzYlJPItFWVCl+XSnWvL9jZeUhhzVuNaO9B3e+CXfyIExJ0LiVgiOkKQU9HAKH0rY1uHideNIGnQj99/4eXlzLttqO+NiE9X/umR5HcElfu4gCXfhWmQkvJhKSDoIPQjLJLAYKjer4r2uq2z5Ykhr7fbzmSyqSTRe3Bxwauj2UdDxLoj3jgjg2En7EXTHGABZIatsH2UQ/ElkvrSATfv/CgZY7a/KWSy3ZsvdDCFRTyNa8tUAFn6UClrXsLQfRAM1kYiNpEsdhG8Ib9YiiBe9oFNI7fq+aFcjY9JV79ipR0Lkz31QIVvS3Vv7KviiK7MgLPICtLo+CEkEjwh4HeQQf7bu3bD9rPNsLE/pSX15vKQFISf7/of3bWO1RDHw5TGResIMfaJ5BcEYNQlC9g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(41300700001)(66476007)(66556008)(66446008)(76116006)(64756008)(6916009)(478600001)(66946007)(91956017)(316002)(5660300002)(8936002)(8676002)(38070700005)(4326008)(36756003)(86362001)(558084003)(33656002)(6486002)(6506007)(6512007)(53546011)(122000001)(26005)(186003)(2616005)(71200400001)(2906002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F69E93BF554F394CA17F365F9863C268@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5923
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e7b8e40f-58f5-49fc-2049-08db2951e710
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	us5AOZWN47lSJg1Hhr/uxT0y1F1VDFtQTi1czfOXfNma4I/YlPIrmqBjGAJHEPu+mBANk+aaKBgSa83spdetTN+vTDKSBSQRD/3TjrKCBudIPYCqF250fEo5fI3sTduYhfh8S2ym5Xmy2jJdB26ekjlqA9qCXkUMBw+GEq+ZrxMoN5MBbswF84D01cMTx4Dt3p4FEetoWMwkNaIYu8lD7jgzvkNq2zZuUx/oc5AGAHjpGSHwpm6GqAUL0WBPP9V96QHsZmEwZY+aslSDiw3qLXoXabqjofazp4XfoMC3Jy5TqfKUkEz4mUegMbI+IAc8gdcWgjkj/cumWs+NyZPh1KLrwx8502ksD+kpdYxNF8AfjYCy6iY3iMYiSTlVpeZhnGdh+lWdcvE5FTNu/mD83i3oid5/JLJkdr16MMZdgPt437FDlhWYetCq/NpIb/7nqddcjSZCCD3bhTTLWZTH7fzyOqbenf60wcs4X+hYIFbX+NiwbZL39WAugbSpYgnsDuODqu1HuxAFV1OBZziorKEPoau2T67qvJCbFssf23N5SlCS/GIu8rzryHl6SJre5/vOMMQ4S7w9AyEEQ46i+rc+MoV3PYPZIufYEIFZVlidm2GP1nO3GWFSXK1VrXffDUYfRaJjPF0kKwguRJS/m0MLmrku84EJPl5UvFY9jcnS8n7zUlkXnIP9AJ7/ROYfPvcl7M/GqXzkzllGwFCw6A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(6862004)(41300700001)(5660300002)(8936002)(2906002)(82740400003)(356005)(86362001)(558084003)(33656002)(36756003)(36860700001)(81166007)(478600001)(8676002)(70206006)(70586007)(6486002)(4326008)(40480700001)(336012)(82310400005)(6512007)(26005)(316002)(47076005)(6506007)(186003)(2616005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:46:47.3210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac4325-8d1c-4f12-63f1-08db2951ee7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 14:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101608

T24gMTcgTWFyIDIwMjMsIGF0IDA3OjI1LCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiAraW5oZXJpdCBzZXR1cHRvb2xzMy1iYXNlIHB5dGhvbjN0YXJnZXRjb25maWcg
cHl0aG9uX3BlcDUxNyBtZXNvbi1jb21tb24NCg0KSSBzdGlsbCBkb27igJl0IHNlZSB3aHkgeW91
IG5lZWQgdG8gc3BsaXQgdGhlIG1lc29uIGNsYXNzIHVwLg0KDQpSb3Nz

