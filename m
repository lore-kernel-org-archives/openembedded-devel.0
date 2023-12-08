Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B886C46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:26:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web10.17538.1702031162312976800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ExpQHmnb;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ExpQHmnb;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cNK+Lj0M2vxNOBt2IeNS2vv7BBCETyKcOfV80MVo6FNbK9jmS1Tj5+gTX+AfXZ/Dw6CdZtRUluQbSoPbAgsCGrXWTK9et+0m3OOdrPa9xWHDM4WemjXC0zXeDTxFVx0/28IG8BJdzIVyGRibAshBnvDOu16dfU3IjlM3kOMvpWj57UQ7fthebkwJiufxsnThPrNauExec0G9Hfq9/PmID8FoxUiU2GHukS5H821HDj+lmUbH6Oeojn1ffZXHXZymlb8l8frwKkDor0qV6kzXbsdqe99RFm/gX575AMhOxjN5NImBoy20nwgHJ8PFs+G60VpIkfZUeQuZsNsp8KpDcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYT7yxIyJQ4ZFWpMBTc3aWF7yi2Tqat/e5dkIFA0YGs=;
 b=TKwizgVClyG1Ze69JQFDM3A9i1A5BGtS7Q6mxDjyaAMcg5K+DKxFS24mxVBgNFloyMrUTN3SCQ9MMqmSHoNWs/HXpw9UEtE304Qo5YHTpXclJYnrnuY81RyvBvgp42PZvmqcWYGT/S/UlGhUgZ08FGYNHaR0Kq+Qo9+M6/8NyfHfCqbN/Yj9IvwrD6MBCW8Wh38txmdYbjB1t5Ec1friNtnH4CLTNBfIRk/q5OY4t8m8O+E0T5LV/JLYQMO123wUitodYvW7DYtilV1wvnUMJDewz6sdwt0zr8vpWr/YXknilj6+jfYxhEhtE15Mul8LtfPkJVGynm1RsUXhZJ9kKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYT7yxIyJQ4ZFWpMBTc3aWF7yi2Tqat/e5dkIFA0YGs=;
 b=ExpQHmnb7zj2m/4HVEs2f9021sbibivbzkx9nI8dwHBjr/g2UvzFI6aLpK7zLWsBPi6dP63wklvTE7FCQhPoie2Xi6gwQ3acHNpiwzXf1H19C1FxrvJ2AbixgSDcQYTNfgVEDV8GRvmQ/W5bPI9VBvjfMLR4E70C89Jfz+R1Lfc=
Received: from AM5PR0601CA0068.eurprd06.prod.outlook.com (2603:10a6:206::33)
 by DBBPR08MB6089.eurprd08.prod.outlook.com (2603:10a6:10:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 10:25:57 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:206:0:cafe::76) by AM5PR0601CA0068.outlook.office365.com
 (2603:10a6:206::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27 via Frontend
 Transport; Fri, 8 Dec 2023 10:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 10:25:56 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Fri, 08 Dec 2023 10:25:56 +0000
X-CR-MTA-TID: 64aa7808
Received: from 73926ae86b98.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2AC4E06A-FDEA-4842-B8FF-9037CD5DC8A7.1;
	Fri, 08 Dec 2023 10:25:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 73926ae86b98.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 Dec 2023 10:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJYAWW43ileqCNlZndLBz2Lv3faHPnT7zS6AsnKXGpq9DJMWGQ+ZbfCWAcK/iZMO7QLLsZPl5Gwilo06R98jXTHPRDBAgtKBRRMPJ209LfmbelJNjNI7I3sPzquTnD9JLO2F+mrcuQq/I3w9EoPUkTG3cpisfFAbi+n3b8tm1nZsKXfmWXGKbrXq37lgWqXRatMj5jvoyPdGZhUbClGqOAG5Jmd1HaGEzQHj5MNgRoFFFqnMQARbF2QIQTk7RfxHWVMrnrCNAS5qMsU//QVID2rXMZnpdUbDdGIA2617xAvaYodulNvfobkE9k8Tv/px5qe/6yK69qwH0m28BoDnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYT7yxIyJQ4ZFWpMBTc3aWF7yi2Tqat/e5dkIFA0YGs=;
 b=dT18u6Omvf57jBsAAbnl7yIpE9cCOJw1d0Fd4DaJG3teHCgsd/HNCVV/i9fknaDu2RQMRf0RDGiHwNU+dZnUDI1J1JBqVgXW29TcEgRLCmd0px/OxUyt7de+gDUh2reVsgseo/ivzY4mbmuO1zrcVrAWWMeaPs6dyO/HTMlIvhLaY7a1dkjSGzSBWpNzYJhiXgF0qrSGfu7Wl0HmWecgg0dRQtMHLrm6CUQZPrIJBVPusnsm0ipGilE0+9dCBAPjU9LavPRyRrhhbCfSwk5O2WHU9AVhyTy30Om+H5hktJivAu21w1f2yF0Ii6ZnGFu243ThzmnE96yYPEBBMHEPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYT7yxIyJQ4ZFWpMBTc3aWF7yi2Tqat/e5dkIFA0YGs=;
 b=ExpQHmnb7zj2m/4HVEs2f9021sbibivbzkx9nI8dwHBjr/g2UvzFI6aLpK7zLWsBPi6dP63wklvTE7FCQhPoie2Xi6gwQ3acHNpiwzXf1H19C1FxrvJ2AbixgSDcQYTNfgVEDV8GRvmQ/W5bPI9VBvjfMLR4E70C89Jfz+R1Lfc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5521.eurprd08.prod.outlook.com (2603:10a6:208:18a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 10:25:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 10:25:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCHv3] xsetroot: upgrade 1.1.2 -> 1.1.3
Thread-Topic: [oe] [meta-oe][PATCHv3] xsetroot: upgrade 1.1.2 -> 1.1.3
Thread-Index: AQHaKapS3OqUDPva3E283ghqSoRYBbCfLlGA
Date: Fri, 8 Dec 2023 10:25:23 +0000
Message-ID: <E88AA0CE-1CDE-4BC2-8883-50831A2BD259@arm.com>
References: <20231208074344.24233-1-alperyasinak1@gmail.com>
In-Reply-To: <20231208074344.24233-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5521:EE_|AM3PEPF00009B9B:EE_|DBBPR08MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c66ad7-ff41-4479-a090-08dbf7d8109b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mF5mK7JbVpKlrRiWC1zdFTltVgVeiwItliB1RRa/Mi2hLcknvXuLxXg8k5llNfNgw1l+eqJPSrIlPqYk+f63DWODhw71vgju+CyPQIjZuOkPAA/3mYQx0+fCHbZZ4Os0IpRcP61B6OTHlIq+ArrKzCRpJ16j3ZpD3PNyOxicOGRjeLgqKw6ARoPpEerIGi6EgIrBqfOyx8wOVTL7UgvYxbscnmq9cS6eTYbnrRO+XRXe8QOQLdc9EwEpHmH0PlwedI9iWn7rBE2PoBrH2llmVQVLahph5volzb4BeIy4voxwcp/xe6PlxUWrXocjs0vc8MhxUxfpD9GhG+AzYd8yU2JxooQbWipktatz5JBPk7jhzxtSNEkt+frx2tREUjesdSO2tbAMSjMuvzAxUbiuWxMZmFe++0bwWFVNstBBRGqJcC0cHZoiyuzH1iAjhjCh/lccj2oS66nePlmaKH11QcbtkXNYmY2Nf2O6IRFnQ81+ivjMd7ySf42NfFngrmdbm/byN0aaBeGjsfh7dEZYj4acNlVqe7dCI8HoTLXAzXrwRg5iDUDI5e8LvRECiXNCLk1FN5SCp7M/epj4N9tTXmC+5w8l+Df5nGg1GiwT8xzn1oByGy1v5px+MdAl1zIeHbym5veAc6GA3HfBcEJAFnidS0+unq+jRNxFW3BXMQqVlttSbfZu9Md8K5B7Bd2s
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(76116006)(91956017)(4744005)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(316002)(2906002)(83380400001)(86362001)(6512007)(122000001)(2616005)(36756003)(26005)(38070700009)(71200400001)(8676002)(478600001)(8936002)(38100700002)(4326008)(6486002)(53546011)(6506007)(41300700001)(33656002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98E537229A50EA49A40D02325A9D391F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5521
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc55bed1-48a6-473f-2edd-08dbf7d7fcd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fa7okNd/OPB70WWskpAN6l7nWkAebLPJyXaOsS9zj+YkryQCxfSgHT+5hSHdMthBHABYz0OTBgvjdIsWIuNzznTUooJQeKryzbl/wMFqS3kri2TC+JlAiKeaitsNBmbPHL9otIs7EhkenFs7SqcuDvraI2ka1YkYaNnOvTwAOCwmdcUnQ6CGBo9x7dqV/Lso+HY0X3juEZOxvQACSgJylecplj+WRPfCfsq4ryrCjuTV3sWAB3zd0tlf0rQf3eutL5TZ000H5/5A3m/Q6Xp2gmfsxoJJ12fEHNNs1uiM6YC4CKrfqUJyuiolf2fZWRGzh2r0aPCn50ia7cAmmiY/E9KNibykCA1uHbx59HPGYPtH2hIFzg25AFRDwae2Lpk1yd4wtnyAHnZ2hXBPGsH4ABAzRt1MtiAR3Jae756ImzsmEC8q8kFIVw9RpUjnXVk87CnC4iltqKHtzauK64zjfAdPl5vVOjsKkfTr2jwbzErq2z22TQ8rm/01jicMdUVU3wkqH5e6cKYmlBnxkph6MuLX1gkV3hwAm4fpc6jsW/b3XDV/yQiA38aJNiBW3FOktSgOn0xtTfRNOjxQwdl9dxu+O32mOcC+vbQXasVWKpYK20EppdiE6IcRV4074Z9CBEL4ZHmoj2EYgk/AG5EDEEH23aygnSsPuEvNeG4SiUyq5Zoi+oPQWXXaHUho3qn++wOL0KVieLaRmfkUceOWkCHpZ7zOzxHtk9Ic5XfUqCEGeP1AdHcbCY324FhpzZQI+6Fz9eaHRqMMtllPfN4nnWVcjlXdxWSLY8Jjn+vbtvQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(82310400011)(64100799003)(1800799012)(186009)(451199024)(40470700004)(36840700001)(46966006)(36860700001)(83380400001)(40480700001)(6512007)(47076005)(26005)(2616005)(336012)(33656002)(53546011)(6506007)(478600001)(6486002)(316002)(70586007)(70206006)(8676002)(4326008)(86362001)(6862004)(36756003)(5660300002)(2906002)(4744005)(356005)(82740400003)(81166007)(40460700003)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 10:25:56.6219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c66ad7-ff41-4479-a090-08dbf7d8109b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 10:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107306

T24gOCBEZWMgMjAyMywgYXQgMDc6NDMsIEFscGVyIEFrIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxhbHBlcnlhc2luYWsxPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IENoYW5nZWxvZzoNCj4gDQo+ICogZ2l0bGFiIENJOiBzdG9wIHJlcXVpcmluZyBT
aWduZWQtb2ZmLWJ5IGluIGNvbW1pdHMNCj4gKiBIYW5kbGUgLVdzaWduLWNvbXBhcmUgd2Fybmlu
Z3MNCj4gKiBWYXJpYWJsZSBzY29wZSByZWR1Y3Rpb25zIGFzIHJlY29tbWVuZGVkIGJ5IGNwcGNo
ZWNrDQo+ICogQnVpbGQgeHogdGFyYmFsbHMgaW5zdGVhZCBvZiBiemlwMg0KPiAqIENJOiBhZGQg
YSBiYXNpYyBidWlsZCB0ZXN0DQo+ICogVXBkYXRlIGNvbmZpZ3VyZS5hYyBidWcgVVJMIGZvciBn
aXRsYWIgbWlncmF0aW9uDQo+ICogVXBkYXRlIFJFQURNRSBmb3IgZ2l0bGFiIG1pZ3JhdGlvbg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogYWxwZXJhayA8YWxwZXJ5YXNpbmFrMUBnbWFpbC5jb20+DQo+
IC0tLQ0KPiB2MiwgdXNlZCB4eiBpbnN0ZWFkIG9mIGd6DQo+IHYzLCBhZGRlZCBsaXhtdSBwYWNr
YWdlIHRvIGZpeCBidWlsZCBpc3N1ZQ0KDQpUaGlzIGlzIG9kZC4gDQoNCk5vdGhpbmcgaW4gdGhl
IGNoYW5nZWxvZyB0byBzdWdnZXN0IGEgbmV3IGRlcGVuZGVuY3kgKGFuZCB0aGUgY2xhc3NpYyB4
b3JnIGFwcHMgaGF2ZW7igJl0IGJlZW4gdG91Y2hlZCBmb3IgbGl0ZXJhbGx5IGEgZGVjYWRlIG5v
dykuIFNvIGRpZCB0aGUgb2xkIHJlY2lwZSBub3QgYnVpbGQgZWl0aGVyLCBvciBkaWQgc29tZXRo
aW5nIGVsc2UgY2hhbmdlIChsaWtlIG5ldyB4Yml0bWFwcyBkcm9wcGVkIHRoZSBsaWJ4bXUgZGVw
ZW5kZW5jeSwgc28gaXQgd2FzbuKAmXQgcHVsbGVkIGluKS4NCg0KUm9zcw==

