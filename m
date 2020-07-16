Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.55])
 by mx.groups.io with SMTP id smtpd.web10.2742.1594931955404312671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 13:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gR1sEDnI;
 spf=pass (domain: windriver.com, ip: 40.107.220.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLWAsJWztos1gc3DYa1cswWEkOG9mJMqp9xgk9pRkcme4s3+m334uTXl+djmZnfiKqi0u1PuDlt+3WEIgcEz/Z/Xd3IIh8c5uuUylicFaC/cqpVgppMABqguPDVAEBIQh8K6URXypvVrDMAuNIO58dtk0dZXKGtWm5HrmKPvyI07KTVrAHS/VQDaRi5CIB5ZVPs3oFHvWa6pDpnlcr8aNENwsewhBZc8/sWX2xGbDj3MaW78HqNHsKcEIQzacwi/Xa1ca0tgqEbXUGP3PnkVRW7ntBhIkScOHIkjnULauUjjHDAcB1KTcH2PzsnxDdlkj1rToMd+4ABw7I4uKmhWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUzFduNhy0Z4HczcHiAiFJLObb6olRnvc577cbWKMSw=;
 b=Bft++K6s7ASfzZxo3A78a4Fe0HIrbCaa9+9/QMG73Vhcm1A/6AdpiC+8a4G04yzOWOewWC3RXU1fCAJ2JMNdG+0cl3IWTl6Pm/xdIdIJF0faXpQSwwIl3GjJzWCORFZpKDj5rfd2KuCZMWZADz4R7XVvBqDEIDfnfxsWax/73t44Sf2zxCS6FOpSQ3QsrCPItiUXyK56/rz+xB1Wdyq4ffYGpuSqBwqhHy8WZlA3/bfx70vLSz74UBULldn+2Pu0oZfnhBsp7SJWCJP4rqmoRNqd253ZD6/72F4NnCxeSJfYwPevAkxMeRNtP5/vKJ2D+XJ60EIUo/1OoMzOBMozKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUzFduNhy0Z4HczcHiAiFJLObb6olRnvc577cbWKMSw=;
 b=gR1sEDnIJbx9MEdJw7Ycw+VwXDsVKtZFNWhDz8uubn9TQuIgsFnGElW+ibynHdRgpNqZxL7AN64qf24YyezMbRD1wV9i2mk7mYIRlHbyBxWza8AIPRSYFFUjsjQWINCs4kG0N/VIzE56o4/hNC/DEo6wEmRLDcOzIMpP3eVVhCA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1479.namprd11.prod.outlook.com (2603:10b6:910:5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 20:39:14 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 20:39:14 +0000
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
CC: akuster808 <akuster808@gmail.com>,
 "timothy.t.orling@intel.com" <timothy.t.orling@intel.com>,
 Khem Raj <raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Subject: [meta-python][RFC] Organizing meta-python recipes into logical/functional groups
Message-ID: <b1d1487b-0691-3429-48dc-a3fc3345c25f@windriver.com>
Date: Thu, 16 Jul 2020 16:39:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 20:39:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba89b0b3-ebf6-4a47-1ea7-08d829c84d34
X-MS-TrafficTypeDiagnostic: CY4PR11MB1479:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1479BBFDED96AA352F9962619F7F0@CY4PR11MB1479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z9z9LdAwSCPEYN7Cvo9J/X7CbnZG3EEkTfMg4i+7aXqGoLy0iJU0n4S0Hac7YYjonoaeCHkjETLqxIPe6NBrrJqbWbfojzxRRjb6VEPdhbgFMVKRIg2BfqxPv9fea1g0vf6ki9or0v4sSPLTook8leu9gjAwkGyb/sSiFEvPBsHDBLCgkj6N/jJkmWGJ42D5KEm262ij7Ga3eqNdwiPsUxyRx+gWVkHW+r8Dzit7mRqGGWTC7ZLWMgV6Fx4hgkVYWwraXRSpXGnUmvg/xjwrldDyeJalAeiTZouvtD/1c5saVKOSmSEt3RXGzqGCFDwy5+FJVD8Vl3Fj909Y26wy/Hj9JNKmLa1WkFb27uu8/reYrT5rdjRGZGvwW5oPk8a0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(366004)(136003)(396003)(376002)(16526019)(186003)(26005)(4326008)(86362001)(66946007)(6486002)(66556008)(478600001)(31696002)(44832011)(6666004)(66476007)(4744005)(8936002)(36756003)(16576012)(2616005)(316002)(5660300002)(54906003)(956004)(8676002)(6916009)(2906002)(52116002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IG4Kz8OvkNRm7ldv2EnjpTqZWFbmxErcps8HFO9l6NDpg4RiIthuMesKc1E556ku7TLp6xcphz7uyjqKaiHpjHrDbSucMQEkdmP+RhiktZTABC7kD+3VI1cCE4BZwL2lwujjE9RzUkL4wMkeia8ZYsZ10OABMpLwyEoHqKuJPdtZPxApoc8TH8Hzb8b/P4gzlNeLdkzBGZvBVrPz6FCdAgHFiLx48LVYoHllew5bHOLbWv6PrPxToMJZ/P5ZZGbcr4OW2ui1ri78k1b/Ravnt1SCn7BdVjphUmv0vpbEGOuUhOUMfVQCbHYTspWE3c4Lb+GTq8Uav5SoU/86VzHXLYOpXm05EiWNC6xMkPcYfxK03ulhZkBDpL6+G0hNSmsRZ9exJ3VfEdV58iyO2ny+yhy5JDt/w+NvaPuwRZWvF4ehZY6HKMCOn6sAPDLKWHEVuriFJBqYHtCKP7bOFkQQzT6zNYhWYqxCmYYQ/+BqqqZgWjWOhRVsQ175T5z2F/Wo
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba89b0b3-ebf6-4a47-1ea7-08d829c84d34
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 20:39:13.9603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ER0m3O3dxUHWfdFjacOTGpSWSv2kXPKUpuZyTRwZiPQ+ZRpOIRmtvSO34Ek+7/4iEXeQqqPTfkUjgB1LTjZryjWPcVPa9OB+aMTHKvnhZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1479
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

 From #oe on IRC:

<armpit> tgamblin, regarding meta-python... any thoughts of organizing=20
some=C2=A0 recipes into functional buckets? ie recipe-crypto
<armpit> rather then all under -devtools
<tgamblin> armpit: I think that makes sense. What do you think=20
moto-timo? What would our categories be?
<armpit> the last set of py packages made me think they could have been=20
categorized=C2=A0 into their own bucket.

I think this is a good idea. While it isn't hard to find where a=20
particular recipe lives, it could be much better organized. We already=20
have the following in the layer:

recipes-core
recipes-connectivity
recipes-extended
recipes-devtools (where most of the recipes actually are)

Some ideas for bucket names (other suggestions are welcome):

recipes-automation
recipes-crypto
recipes-frameworks
recipes-graphics
recipes-multimedia
recipes-support
recipes-testing
recipes-webdev

Any additional thoughts on making this change?

Trevor

