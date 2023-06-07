Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC543C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:57:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web11.4589.1686131866043413763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FdOA5v6O;
 spf=pass (domain: arm.com, ip: 40.107.8.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf1pq1MbT6cZsVs2Rmu25DolSzU7ng8y96Ve3UFwkI8=;
 b=FdOA5v6OlnfIZHw2TPgR0KL0BnQUtpa+bYZv/KP5g8xpXyTL2/P9fbgy7nusnjECyVLaYHWFw4nASI1g0hUpCWeokBw+UTmPEEnQxdFjg76BwTBpaCOvXzcGWhmXAH6dxYWXxuKQ3fI3QZil3XL839spdLxAFtczlGRblqgvGO0=
Received: from AM7PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:110::14)
 by PAXPR08MB7318.eurprd08.prod.outlook.com (2603:10a6:102:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 09:57:40 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::3) by AM7PR04CA0004.outlook.office365.com
 (2603:10a6:20b:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 09:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Wed, 7 Jun 2023 09:57:40 +0000
Received: ("Tessian outbound 8b05220b4215:v136"); Wed, 07 Jun 2023 09:57:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96f9488c83a1da73
X-CR-MTA-TID: 64aa7808
Received: from a12851331aff.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7160B0D7-FC11-44BD-8C74-E7E56CAE9603.1;
	Wed, 07 Jun 2023 09:57:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a12851331aff.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Jun 2023 09:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+cGHnbcQN9VYrnlNDgDplnsaEiHe3fx4b7Lu+E+fZIgXLWFcqQC7ccjZwJGzO3WONGTVvuT4q6Hh10mkyMwbCYeOw2Z0pAOg8fMM6W2vRPaVliG9D3ecluFSC43GL3kNnendFGC1lY1wJn1aMInBn1Sa05U563Wc8IXFHW5iDhQJ9OdJXSYP4Mp5tOttDwXGxANhZpLITiTBAH381BneLGoIdK4wxAueCDMc2/SPwiMbXKVTZy2zi05jiL60qrhl9f6X6ZtkjIGTjIphRSpvXi7Z0RdIf+DlU5QO89ATLtMLfPHpEw6k3cUlDyRpW9x5d0YNzwGDT6feblIpS4GoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf1pq1MbT6cZsVs2Rmu25DolSzU7ng8y96Ve3UFwkI8=;
 b=WTcF9dFUyhh2e5ZS/GE0un54F6dTxHkjA4/FXXz5lh+QCbPPn/oZLVLLoGfba60jLU3pIKXqGkEmmScwyw8rmoJ5l+1q7AziizF7yJr8mLtry33uqungrHNcioSWuvNxGIFTp/9R1LyTPPX3PX1iAriOlwmc6WL7/10Iyey+ZQxILwFKNGxgiT1vN7T+jrXPHKVKbihTeeGSFjfGjmyPaqX72BQ4O7O+Hh3Gts8ouAWS/hBPzxDfeb5SmDBnHwHHY5Ca9ewoCaZcmJwBhdDBgsa63tz9Et+TozwpXRX9IxRfCQzpI60See+f48a/FmwhMBREQjqA916fFoN0oLZABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf1pq1MbT6cZsVs2Rmu25DolSzU7ng8y96Ve3UFwkI8=;
 b=FdOA5v6OlnfIZHw2TPgR0KL0BnQUtpa+bYZv/KP5g8xpXyTL2/P9fbgy7nusnjECyVLaYHWFw4nASI1g0hUpCWeokBw+UTmPEEnQxdFjg76BwTBpaCOvXzcGWhmXAH6dxYWXxuKQ3fI3QZil3XL839spdLxAFtczlGRblqgvGO0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5728.eurprd08.prod.outlook.com (2603:10a6:800:1a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 09:57:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:57:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Tim moto-timo Orling
	<TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Subject: Re: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Thread-Topic: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Thread-Index: AQHZmQ0rqqmfUcrtTE6ilIxEGXAtYa9/GsYA
Date: Wed, 7 Jun 2023 09:57:26 +0000
Message-ID: <C15808F7-1E10-415B-9281-82CD6FE46FC8@arm.com>
References: <20230607065547.128661-1-zboszor@gmail.com>
 <20230607065547.128661-2-zboszor@gmail.com>
In-Reply-To: <20230607065547.128661-2-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5728:EE_|AM7EUR03FT065:EE_|PAXPR08MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bcb3d9-d887-4603-d195-08db673da1b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aVUtgEMY+qoKSUxr9UQDnMi/HtgpJ/sm7jMwFu8r7CsMwvhCZ72tq+cckvUpHRMuJZ2qUFVGRZU6+fzhUqmvoOArTz1OKgYtg3CcZH31W6DLbKYRQIeNDQLbwW6XoD325z+Lqp49iCE3oPff+mQpjqzf59ksiQUFkQ7fLElL59K5ejvTtI+XBrZK5w6/wnsnI4RwwqHwR/mY0XlqfORocGCsv7L2dp+DFjYScN/DtFWVO5bdJ/Yb/Isy4oRB1j+dt3CGQ0m+PcM9WzsnFfifOf7u92dIQcxsbsVA2RnvlH3ote8qmnHaMkzkiz5sGEm7ya+kOEBMco0RVtTDXO2gFYaUlCZRTcy2xsW15MRiSL5U6BCAua2G/A77ufxMpwAvleZndmDQMioxBZ9IfVjzZzqvBx2V8MFuwnEN4p9NeMRF4J5gPyPTa9qpunuUoIaL88c6ckHmFYa1666OYCCCw6LIjOD6fXkjawyVjCE/o0C8/CylS3harMvHCn+FGZp48iQZFOxZoHpoFtP0LtDbd6mSRGwGKYtIVowfIXux87HTIFvvryFuA3hfsgjiGRhk8HGtdqZJzUQbWf9wEQ4UipjZAetlPQaLTmDClQngi6r7bVimD++A/9mAC+Vbbj1eohbFT6IxkIF90LUCtDoXrw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(2616005)(54906003)(478600001)(91956017)(8936002)(8676002)(6916009)(38100700002)(66556008)(122000001)(64756008)(316002)(76116006)(4326008)(66946007)(66446008)(41300700001)(66476007)(71200400001)(6486002)(186003)(6506007)(53546011)(6512007)(26005)(33656002)(86362001)(5660300002)(38070700005)(2906002)(4744005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <92C5E4E68B3EF04BB148FDCEF6AF9971@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5728
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a093af41-6f70-4585-2bc0-08db673d998c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pA74KvLmS0RQpTBHPs1J2Qm10fRftxFqqnWFktiOlxrLHKl7kRkkVsi2v7fuNCk5g1xM9Q+15kGe9SEQTrtRkWzQmftSMDncxwiQtPXmuh8ylonTu0VOeMPErD7Pmx9ke9SLz4YyrCET7RnHbrVIz2vOKLBNN/+6MhMj2TFzgO3BwqngUSXSJ/zNhQq4Lqh59mya16qwMthH4m0dBeWzHLV8yKsh7gIIUjqR/8DP8mUOdqpuWoPrLk7MUrCg9aXAjD0aBEZDzgMgWQL3jfSzX5gFde9bW6QFEbAVAl+tytkcUBjxLIluUB+H67lgUEPS1GpjEQW1pYObR2PANLCCMqH9Kf4Q/nTLU9kEFt2fu/YCuRD5cjWZJNoyhO+vib5p764Ha2A0l5m/w3dIQsCkTJuJ1u9NHT+nEATNdSubmcF/ubRoJaadeYbbzqKXUfkvPqXfOKLbeIWR1A9vLDujve5d19CXl/drNpN8uLMrbjHFa5yAOCOPBP6lWYsDtFUZ9xyvZTD+pmyaBnCRSBEoUYZugxkQuliZCPwwcnpDjB/TiFrt2dS065DF6SzH8ex1m+Ti9URpeEJrkA/rb9S4FJY78N4PcxBUNNDIrO/LecxOKNSpmfQNOrfa3KfLOCOzb3DMGDmyjaWq6Rt4bETIRsl8mEkUXSGfW+5sousWzN3dK9FjPTyvwAprRvVJ+pUKzKrwuzl5EGwCXsrsE4EqM6zx1iQfsb5AhQb2HHqPMrazF4lr7HanL2LxD8jXTSGA
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(33656002)(54906003)(40460700003)(478600001)(40480700001)(6862004)(5660300002)(8936002)(8676002)(36756003)(86362001)(2906002)(4744005)(70206006)(81166007)(82740400003)(70586007)(316002)(82310400005)(356005)(4326008)(6506007)(41300700001)(2616005)(107886003)(6512007)(53546011)(36860700001)(47076005)(26005)(6486002)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:57:40.6145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bcb3d9-d887-4603-d195-08db673da1b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7318
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 09:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103173

T24gNyBKdW4gMjAyMywgYXQgMDc6NTUsIFpvbHRhbiBCb3N6b3JtZW55aSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICsjIEZpbHRlciBvdXQgbWVzb25fZG9fcWFfY29uZmlndXJlIGZyb20gZG9fY29u
ZmlndXJlW3Bvc3RmdW5jc10NCj4gK0RPQ09ORklHVVJFUE9TVEZVTkNTIDo9ICIke0BkLmdldFZh
ckZsYWcoJ2RvX2NvbmZpZ3VyZScsICdwb3N0ZnVuY3MnKX0iDQo+ICtET0NPTkZJR1VSRVBPU1RG
VU5DUzpyZW1vdmUgPSAibWVzb25fZG9fcWFfY29uZmlndXJlIg0KPiArZG9fY29uZmlndXJlW3Bv
c3RmdW5jc10gOj0gIiR7QCcnIGlmIGQuZ2V0VmFyKCdET0NPTkZJR1VSRVBPU1RGVU5DUycpIGlz
IE5vbmUgZWxzZSBkLmdldFZhcignRE9DT05GSUdVUkVQT1NURlVOQ1MnKSB9Ig0KDQpBIG5lYXRl
ciBzb2x1dGlvbiB3b3VsZCBiZSB0byBqdXN0IHN0dWIgb3V0IG1lc29uX2RvX3FhX2NvbmZpZ3Vy
ZSBpbiB0aGlzIGNsYXNzOg0KDQptZXNvbl9kb19xYV9jb25maWd1cmUoKSB7IDogfQ0KDQo+ICsj
IFRoaXMgcHJldmVudHMgdGhlIG1lc29uIGVycm9yOg0KPiArIyBFUlJPUjogR290IGFyZ3VtZW50
IGJ1aWxkdHlwZSBhcyBib3RoIC1EYnVpbGR0eXBlIGFuZCAtLWJ1aWxkdHlwZS4gUGljayBvbmUu
DQo+ICtNRVNPTk9QVFM6cmVtb3ZlID0gIi0tYnVpbGR0eXBlICR7TUVTT05fQlVJTERUWVBFfSIN
Cg0KSWYgbWVzb25weSBldmVyIHN3aXRjaGVzIHRvIOKAlGJ1aWxkdHlwZSB0aGVuIHRoaXMgd2ls
bCBicmVhaywgcmlnaHQ/ICBNaWdodCBiZSBiZXR0ZXIgdG8gcGF0Y2ggbWVzb25weSBpbnN0ZWFk
Lg0KDQo+ICtweXRob25fbWVzb25weV9kb19ib290c3RyYXBfaW5zdGFsbCAoKSB7DQo+ICsgICAg
cHl0aG9uX3BlcDUxN19kb19ib290c3RyYXBfaW5zdGFsbA0KPiArfQ0KDQpUaGlzIGxvb2tzIHJl
ZHVuZGFudCBhbmQgbm90aGluZyBjYWxscyBpdCwgcmVtb3ZlLg0KDQpSb3Nz

