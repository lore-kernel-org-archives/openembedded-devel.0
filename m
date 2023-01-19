Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C7CC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 15:20:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.60])
 by mx.groups.io with SMTP id smtpd.web11.48038.1674141629343672773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 07:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1St5tqV8;
 spf=pass (domain: arm.com, ip: 40.107.20.60, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB8PL3tLaN1T7A8ePdlgpQu81XPa9wl7XqV4IinvN+0=;
 b=1St5tqV8Btaxd4WzfayM+LkPMu1VKqGej2jR+wjXEti5ut0UfeB2RPyyUAf4un7InrjPzHYngqkwolCIgUn3Z+bXb60HMPtZtO9ob9j65kacaPd4MxrxJIOny469OHglG3KuQTq1II56KUqGz3oZ1C2oz0nHba/qyax+CEGaBoI=
Received: from DUZPR01CA0203.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::16) by DB9PR08MB6329.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 15:20:17 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::c4) by DUZPR01CA0203.outlook.office365.com
 (2603:10a6:10:4b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 15:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Thu, 19 Jan 2023 15:20:17 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Thu, 19 Jan 2023 15:20:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3da3519ed49a2bb8
X-CR-MTA-TID: 64aa7808
Received: from e735247b90b0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5017F788-0072-4159-B9D3-FB1168E251E1.1;
	Thu, 19 Jan 2023 15:20:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e735247b90b0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Jan 2023 15:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gln5Yqm4WNiObzHkjCffrjTMku21h2lOQI+UVrdKBMio4z2JYbXaZKHItByi5Aq1kpZb4iYuNoostcx2Z/BTz4XotIt6UKzYmGeYzDN4xAPnjf/HlVToq5dMOV6PMBPxLOiItQ/xZI+RypcPbyLwfaHyPPS9+zyTG832P5D0F1eQ7SjdH2eI9BGGWRsoQsJMqedvGmKW4Z/4mY6J9aifFnJn11odYX5SkXgHpasjH/pW0bGlJAw81esq56Fcp7mKLNVXzYBx/VYTM7nTEiHXI5SVa+K77RnegMFZW7tBWoqQvMejjc3Fbvt9Z5h9axgx5qWvDzqC9fQR9nGgm4O8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KB8PL3tLaN1T7A8ePdlgpQu81XPa9wl7XqV4IinvN+0=;
 b=d/kRduLUNDbP5vkQFv1RR2eOs1nUwb36dg/5lkxDBtrlJvZeTsNS6BtPHJ05ESpCy/VS7Npogm1ZY6toYrHvO5nqtf/WscfYn6fIx29dWdKSD8NcdRhCnElXyROSWbA0Z6gHg00AK+Ez06I0142hWgyJGY0+01UWaYKTR+Cqxm5kRTQ3HYEGO82++fLqOFZNkLtr3EkXOtCJx1xOigoY8NoI/uWqNKpUidFqozojFaphoWLI/fS64uIFMBf/fF4ZVRrlHdYED7R/ezbcaslnPMc+vq+jeVBQ6u/pCCzq75a7u/Y9fzpLdsjkYYN/iFwTay8ZmXJBrH6WzOPLuqv3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB8PL3tLaN1T7A8ePdlgpQu81XPa9wl7XqV4IinvN+0=;
 b=1St5tqV8Btaxd4WzfayM+LkPMu1VKqGej2jR+wjXEti5ut0UfeB2RPyyUAf4un7InrjPzHYngqkwolCIgUn3Z+bXb60HMPtZtO9ob9j65kacaPd4MxrxJIOny469OHglG3KuQTq1II56KUqGz3oZ1C2oz0nHba/qyax+CEGaBoI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7799.eurprd08.prod.outlook.com (2603:10a6:150:3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 15:20:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 15:20:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ravineet.a.singh@est.tech" <ravineet.a.singh@est.tech>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] gnutls: add initial ptest support
Thread-Topic: [oe] [PATCH] gnutls: add initial ptest support
Thread-Index: AQHZLBCAZQuJJDrc1ESI6NEsEhlUUa6l2tuA
Date: Thu, 19 Jan 2023 15:20:07 +0000
Message-ID: <700EE152-E9FA-4EFA-B583-066F0C7B6D20@arm.com>
References: <20230119141511.29010-1-ravineet.a.singh@est.tech>
In-Reply-To: <20230119141511.29010-1-ravineet.a.singh@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7799:EE_|DBAEUR03FT043:EE_|DB9PR08MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ee4f68-a457-4fe9-6452-08dafa30abef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 R/Y9NWehwm5hBS+tPRQJK+7M+fYX4fbfVHWUwkcFufWh9EN5C86bm3Zm0xtZbYnPFxQHydKYPh8mjQXeVNYuwW2+g9/cJGCeHbkBYsz7KtPa2R5ExrRSiU3EE7Zx8/S55OHjgOpCZ3we+9r3B0r61bsrWc5dcZiFxE9LJblH0gNLiXyMYkKctbf4To2wj5MJxaGoamELQDUQ39Rs0n1gjJ+yEQoPLEmjVfCyYO3+KfGin8WEVn8DY3M78tVpGkcnmu9ziuO/9RmZfkdizFM6V0iC9wBJhcfoiE/7kDbCDBnxPbmiwScIFoWxaVr1xcXlv20EBI4ncESWXX6GQpQv1ZpjbS81Q3JupQlC+9L++CxjaE1Q0myyBqWovJzKI19FMXed3eWsaMVWHrLcqWG6BNYcd8t80MA2V/5cDSMvHzJYsFbRVYFv+Dg8yxwTXEpbWVP3UEfm4GCAeYfyv6Csmd5/hCQQFjHZ+4P9R+XqgGyL14oiB3g1AS16clt5gdH9J6t+jzMtqAE/ZcYUUJyrcVw+enC+3PCCL213/CgGQb59+dQMMhtY6e/xSqosMTpnnRjPfCmLfMHE2oHV+i9yXFLRwkcGA6Tdm1g0t9q/Zg9eqbiqmKC4ggPM1UKy4xsx7SFDPxF4ZISgASkBZ4Nw37owVZzXnQqT3srH3ru6BMTBdkY88jGNMaRBD/ycAcOafUaA3pYiscUAbNA642XSAFrpk1kdmnJhNfDFCp/39qw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(86362001)(6512007)(41300700001)(36756003)(33656002)(64756008)(66446008)(26005)(186003)(8936002)(66946007)(2616005)(8676002)(76116006)(66476007)(91956017)(66556008)(71200400001)(2906002)(6916009)(478600001)(316002)(6506007)(4744005)(38100700002)(122000001)(6486002)(38070700005)(5660300002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C165875C78B87D4CB7125F9755D818C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e6514cef-b4bf-40e5-a4b7-08dafa30a5e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PWAM0KjsBMkumVI0GRggfZijAlMAjX8m8hMbYGBdPYfIBd6sRuDnp7H0Poc4bj8WMO9snz07GXR7i/y+5QGiySMrMW3iaHGbaL+j/C0m3rguqPQ75OcUWyeeBFRsQH47X878k2b+K1jQCgyqlSBCXvPSPnpJj9pNy8xkRwrGeR3ICMONcjR5nfS/7XIvj63Os4lUAEDpOj5K4tJa5lBS7Cuc5qYKfH8p6kfZerynfw03x6JEAcz5wmZAMerViyPgvQIDoV8mVFfldD7+knsQHSROvV6lQim7JvK75EERBPZUUC0HfSoh+tBA3UbX6pO/Q05Im6ivMNx9V2AcHkLcktFHrnKtasjDAJm8QwEDX0J31k4/UNvMyTh5nrpRXNxZFwBB9F0n8DCIcMiLppidj0G10276Q3BUU0rr3KNvm40gg4ePTjSfoGXAwaq8djQIDAl6945ONqT6yybBWMtHBpNtFbtCgIRBIjioB+5m0RvtY2ccuzL7ug/xpES7g1ZX9MXVj3UFkqy9sJotgh0sT0k8Qmtd5x+qsx22WeCc8mLRGbIRsQp1sUTCcTSkaSYXHaQiog68Y1trFXFBlagqX/3sJzxleHxqoeqf+4adjKGeuj6f4nhvKkl3pegjoelhqPrhcUj+vc4kfhgxnmVplzVpUrA4iDNsL4Ro/AiweR3s5SkKtLqqCfuqkm5Zds5IWKvzsrGJQKAnIGDxXvaeGw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(8676002)(4326008)(86362001)(316002)(41300700001)(70586007)(70206006)(82310400005)(47076005)(40460700003)(36860700001)(8936002)(2906002)(36756003)(6486002)(6862004)(336012)(82740400003)(478600001)(6506007)(356005)(4744005)(40480700001)(6512007)(186003)(2616005)(5660300002)(33656002)(81166007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:20:17.6313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ee4f68-a457-4fe9-6452-08dafa30abef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6329
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 15:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100660

SGksDQoNCkZpcnN0LCB0aGlzIHNob3VsZCBiZSBzZW50IHRvIG9wZW5lbWJlZGRlZC1jb3JlQCBh
cyB0aGUgZmlsZXMgYXJlIGluIG9wZW5lbWJlZGRlZC1jb3JlLg0KDQo+ICtURVNURElSID0gInRl
c3RzIg0KPiArZG9fY29tcGlsZTphcHBlbmQoKSB7DQo+ICsgICAgICAgIG9lX3J1bm1ha2UgJHtQ
QVJBTExFTF9NQUtFfSAtQyAke1RFU1RESVJ9IGJ1aWxkdGVzdC1URVNUUw0KPiArfQ0KPiArDQoN
Ck5vIG5lZWQgZm9yIGEgdmFyaWFibGUgeW91IG9ubHkgdXNlIG9uZSwgYW5kIHdpbGwgbmV2ZXIg
YmUgY2hhbmdlZC4NCg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gImJhc2giDQoNCklzIHRo
aXMganVzdCBmb3IgdGhlIHJ1bi1wdGVzdCBzY3JpcHQ/ICBJZiBzbywgcGxlYXNlIHdyaXRlIHRo
ZSBzY3JpcHQgaW4gcGxhaW4gc2guICBTb21lIHBlb3BsZSBkb27igJl0IHdhbnQgR1BMdjMuDQoN
ClJvc3M=

