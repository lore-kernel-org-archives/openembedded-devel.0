Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9566C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 12:32:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.7183.1675859546931483970
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 04:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rkAQADfn;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOwVsJKcTEPuPf8yX5vZ3tlSVxgTu5PMDbdxqNaxIbA=;
 b=rkAQADfnCNn0g25tgSaaLiSG9GbnxSa/4C0iIyI11FDgUzy6qJlLCCeeZpWOORTCqdEH2MbUx+ziBNhTpMHjAuF4jO/Caf30EULBqYd+dejzN3R02Y94jTQdncU3SosNFsE/Rh6QO75GIl9xNmdvK3WRBWCtDDoK1O8G5slXx5E=
Received: from DB9PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:10:1db::8)
 by DB9PR08MB8738.eurprd08.prod.outlook.com (2603:10a6:10:3d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:32:23 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::1f) by DB9PR06CA0003.outlook.office365.com
 (2603:10a6:10:1db::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 12:32:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Wed, 8 Feb 2023 12:32:23 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Wed, 08 Feb 2023 12:32:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b166ad4f6f845bf8
X-CR-MTA-TID: 64aa7808
Received: from 4a860b9846fd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 425C82E5-E096-45E0-95EB-5D2E2794F32E.1;
	Wed, 08 Feb 2023 12:32:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a860b9846fd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Feb 2023 12:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us2/8LuxxUlpi7C8w0/XtrncvzS14LfkUwhTvCNtNgXNDFvjWTxxhX0BwIGc2kaD6JgXlNDyyoohvkizlJcgTldGPBjraRUI8Uf96YNyWaSb3jVqti8iYXTCA6ZPM+KfOwpBLJ3AuheTY42gzX9/mZVtftSLGEjknx6M8cKeU+ykL7Qmo2sNbP691wqkgHF1/9fFVintRHNzJzuSkcEmuA/qiuxzRT/hpBFBLQa++BUNL7AXzCseojBaoYK6aw0apDMzlzE3+55WvRK6d9y0S9/d3sh5YTZF59SJ/2GPbzrOQr84XbW901bd0bJiUWymdC31kVHgvOZycobc7wRB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOwVsJKcTEPuPf8yX5vZ3tlSVxgTu5PMDbdxqNaxIbA=;
 b=EQv95lbSHRNDg6pFy3rTPNFpBpmg57uikoIxNVlnv/3yfHlYUcdUPOV89eihjIg4ozMDxW2YL6WKlLNn7RMgndKw5SbsOrMVXO7/z6AxYNZ3heyv/m4TukLJKD08vpBQoOb2ZEYyFjgUFghSI00WlD0nI7o0rZc+SLXg5hj+NM29BiTvmFJuFFRx2ZN2il8fu9hck5C0aIKGKkxJMWDsyVeS9X0JyXvWq0MnASKN/yU43pd6gJd5AuXDkiGWsEcIcWMlzjStr1/0XSixo7JQV+ScyyYt2VcexHLXCuyDCZAZoU+cbB+czSRuE3m5BwdlwM7yoLcpplMz0DcKONtLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOwVsJKcTEPuPf8yX5vZ3tlSVxgTu5PMDbdxqNaxIbA=;
 b=rkAQADfnCNn0g25tgSaaLiSG9GbnxSa/4C0iIyI11FDgUzy6qJlLCCeeZpWOORTCqdEH2MbUx+ziBNhTpMHjAuF4jO/Caf30EULBqYd+dejzN3R02Y94jTQdncU3SosNFsE/Rh6QO75GIl9xNmdvK3WRBWCtDDoK1O8G5slXx5E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5390.eurprd08.prod.outlook.com (2603:10a6:803:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:32:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 12:32:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH] nodejs: add CVE_PRODUCT
Thread-Topic: [oe][meta-oe][PATCH] nodejs: add CVE_PRODUCT
Thread-Index: AQHZO3s0j09E7qt5xki2tWJoyxqBE67E+7GA
Date: Wed, 8 Feb 2023 12:32:07 +0000
Message-ID: <65766AA9-58B4-4297-8ECE-B86D5A173E0C@arm.com>
References: <20230208050536.110196-1-Qi.Chen@windriver.com>
In-Reply-To: <20230208050536.110196-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5390:EE_|DBAEUR03FT030:EE_|DB9PR08MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: b70ce376-7053-462e-bb2b-08db09d087ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xuBN2np26sP2Ls/R/QUojPYi7G+UfYxzuh0PYklbY2KuczlohXT+ybSTf/8MQ1nkxabG5gUvssdZC9Xs/tb5SaBPocW0G6VDDO/fGEh3GVNnRZMme48d8Np9ysFgM9dprqFVq+ZBKfqqRH7na+x1OCZVuJemnSLX4RJdrf7MpEwiC+bQWOp3kE1x/Xp3io12q4Dudyc23mmW8xSR6gaFlA9yiIp2IgvRu/aVYsETKz62Ee0uv3P3hPUTYeKVbXh949hy4yTTlR8pUadg6mC6aMfl4IxCETuy3kpak3N8BVQcOawj15n57KmKf7jW/7C71w/yx/JL4OGUZO1f0toGnaU+/dmPjWptN32Vm4hSKVYZwYHc84MIK4q+cQnwIRQkt+uHQomB8VWsv2UdkOv7R/YikTlcs33TB9bmsjG6EEo2JCwKBXse6p1cjUAjrRoKlJz4oH1xdYih8B+O/uFU6zOVtgmEZUoZaXG9LvvqzvEp0k+uDo5GM6RrdElNx+h7/pUcC4mYnaIuuA0YW4A4Vt02OiqBJbODTRXGmabg/SUQ06rfaRp1SfamzaLQdEEapbYcco75recTtZTT0Luxw/xyHGcBBNa6064f+zmgoZwDqqezTNxclCnvkUARxhC4gYy7E4AXngzTVxoHRrzuCbuqmEGOdW3pf40JBnfi+XAcCB7r3m6FReLLNAbMBifKir9Vfyv/1ht5JZ9L5bd79FKD8+r3obELMIx5WH4Uikw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199018)(316002)(76116006)(91956017)(38070700005)(2906002)(8936002)(5660300002)(86362001)(6916009)(66946007)(64756008)(66556008)(4326008)(558084003)(6506007)(41300700001)(8676002)(53546011)(66476007)(66446008)(33656002)(6512007)(186003)(26005)(38100700002)(71200400001)(36756003)(122000001)(478600001)(6486002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <13296352E3CDA14081EEF4C5BC8DAE39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5390
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6714db9e-f89e-4d8c-e8fe-08db09d07dc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n1liY4AfH6bkuckwl9eQ1QgC7l0Lh9lq+oBoaRRGZgKaN9VSZmgrfXeGJzxOok/IfAXTzMCW3mKu112mT1n/wyRBRR/kiFRuzP+RkoHtQQ9YzGcJeefy9k10nB+NFYWF6FAUH2c6fcGYYQvtI5ZYvWwomj8i7wyEMM8Hh1iNJI540tcVK0yEgPn7mHnbraCJ9jiMSNcv8ubVl4f7TkSXcm957RNobHRo5pym9kAjRDGsenkbEX7bAxKyZ4C+4gDVy2KavG+YNkMqfDM0AciopaHs16W1V7qQW80MEmMRRbMGrhbCqQ/fnH2AnDmc9DN5gMSBQbcGuxkIucWc7DvhfgmY7g2MPaiLORCsmq/1VkFxCDCWln9aCZ0oua0r1zlwfVLvHd6yQAK/SObRZPuNd1CKFte5RsDDHQ9OnaadYKtxFgfW48wFoS+dHkuNQJ0yDdWcw7BP7MvJlzP2LViQYCYNJQabV9J0LxwbZhFCrLVwtOSbubgnpMoSozmWM06vlGChWFV494g0h4CkcP4LHBV/9BqR76oi7ji/8fa/WXxEzOqHJMxqG00M/AEJs7tk5SYnUx1pc8amF2zF+Wfyfr2IBbu3FRmqytre9Cu8FFHUU+eKtN5YSx31rzKrplcpSPusNxqJezkWWX6GDvq3MqAlN6vvBdB+JO5DCExYmy7RUzvgWpbnW616dsbc8YGxC8dklk3TQhlbCARy+30xoA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(5660300002)(4326008)(8676002)(70206006)(70586007)(82740400003)(6512007)(26005)(81166007)(186003)(33656002)(40460700003)(82310400005)(86362001)(41300700001)(36860700001)(8936002)(2906002)(6486002)(6862004)(478600001)(316002)(36756003)(6506007)(53546011)(2616005)(4744005)(336012)(40480700001)(356005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:32:23.7910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70ce376-7053-462e-bb2b-08db09d087ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8738
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100994

T24gOCBGZWIgMjAyMywgYXQgMDU6MDUsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IFNvbWUgb2xkIG5vZGVqcyBDVkVzIHVzZSAnbm9kZWpzJywgYW5kIHJlY2VudCBub2Rl
anMgQ1ZFcyB1c2UNCj4gJ25vZGUuanMnLiBBZGQgQ1ZFX1BST0RVQ1QgdG8gaW5jbHVkZSBib3Ro
Lg0KDQpZb3UgY2FuIGFsc28gZW1haWwgTklTVCBhbmQgdGhleeKAmWxsIGNvcnJlY3QgdGhlIGRh
dGFiYXNlIHRvIHJlbW92ZSB0aGlzIGNvbmZ1c2lvbi4NCg0KUm9zcw==

