Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.964.1793947826156893456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=j9l2b+mN;
 spf=pass (domain: topic.nl, ip: 40.107.162.92, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkxKm7zM0gIORgRy15BNt2gClDBOFPfhoTBVdgvojZUldVSwQkjHp5SkwMRSpsWBLyEG3NdEm83xthD+eBgQTOuw7XKTLuSabBdxSq1tsyYOugxmLXSPsiamK52Z51ZH08ExaMqpKkqZ1w0kL0bcgL+jyLfYrH3mpzuDfgfqYscOnj78uKMKItdH0PAWoOOiAyOdBGVpwi8nQPTW3dDI0KbTQCSC3xSPUhONJXlAC+mb6yvbLlx6j1SUQxZJPI+I2n4ckGdkZxh1vEay3DqzKghMm4WWd0q53hyPcEdF8w2DIBC6INOX5gxlUL93mnSwSwZh9xwAVOh7TAAzt7mvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP1eE9dqWBC/InYf9+S3re1W9QUqtq4h7bOjlbpmOO0=;
 b=s/0+q0vyWAWO7HaXWQ2YLSMVSy8M6NNgJm4qcPVadwsshXgv6Ik7GvoHYJmGg58tUJkD9OZ8RH9De7YQ1nrAO3oE7jwc7bzxHfeHl1E5wDzLLAFdR8G7/Bk2uxmnUd5bho9V3ijo46aSgq3dVx6+dnSgN0hcG79mMMVn7HqL/aAUYK36lsUlhE5LjwonShx7uvmddplXG9haR02RSF2Z//3BmTxBQgMOxcIkPRRwCHIzwbah29/CDYumhPdfmQt4jCCU+1QVjJqjm6kmg26X7WK6lQD5/7tC4xcy/zM9VRpFcKiQLp2HfDtN5Usha/ts/AyM/7MFyDhNqU/d3lkjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP1eE9dqWBC/InYf9+S3re1W9QUqtq4h7bOjlbpmOO0=;
 b=j9l2b+mNFAv7L2sfMMoi/LwvnkT3dnqjttg+803MBQ4n5AlNXFZW5QG68Ipd8jgeaYW83CIDiv91Kb8SNUxMcAOAIjxuEki2UbnBTeBvrOSqScmVajzUu6S68ERaXIPEEG1MTH6yQ82PkOnHyJLw1Fn6pTgtECYXFfArLmvYPLT0+8XIzMQgDhb446sxlGDZxfA8vBHS86Be1e4I+xxoZFQ1/wOIzJ+yvZEK+JtAhaLuiTSyhNM9v5dzL4BqZ/Tx0i+MOE+NGMdCSsxSZW8DPUyOzc5Ap8de9sUgNVrDfXzOcR5xHVu56nWGyUtIuzE5FSouStEag+0HmqSLVCtYqQ==
Received: from PR1P264CA0086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:345::12)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 06:50:19 +0000
Received: from MAD0EPF000008C4.eurprd05.prod.outlook.com
 (2603:10a6:102:345:cafe::9) by PR1P264CA0086.outlook.office365.com
 (2603:10a6:102:345::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 06:50:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MAD0EPF000008C4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 06:50:19 +0000
Received: from AM0PR07CU002.outbound.protection.outlook.com (40.93.65.70) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 06 Nov 2026 06:50:18 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DU4PR04MB10482.eurprd04.prod.outlook.com
 (2603:10a6:10:562::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 06:50:16 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 06:50:16 +0000
Message-ID: <7c7e4868-5668-4a1e-bbc3-fc78ad8197ba@topic.nl>
Date: Fri, 6 Nov 2026 07:50:14 +0100
User-Agent: Mozilla Thunderbird
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US, nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [meta-python] mongodb: scarthgap branch has a newer release
Organization: Topic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0033.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::20) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DU4PR04MB10482:EE_|MAD0EPF000008C4:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 646cd6ba-603f-410d-5172-08df3bd238c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|18002099003|10067099003|56012099006|261026121527099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: A/sb+Pjgutj9/EQ38+KRA8e/45XHhf11Cmak0icG2Djh4XHJizYnvvNDglYBz2MPjppPgMtA5LmFuheXzRiUf81Qdq/a75PRUJLtk0K4l1Q2dPAcOp7HQoW81XPCdLI+Npr9zJ/26U6Cpjr9FTRASefHPK+6BTK3dLUMG+1dlt/PyQoivTZpSjEh17p4Gz5rkbjcghD3Z9dJPKnD0eF6JZfDFZiPtDuwQpW+VGwSAd3L+0cH2+AbpbE1DJsitcmpWFX60OQfG9w+4WjBXWrlK+I8QDYGYzvcMV45b/uo0Y2S/deHQ6gkdK9zM9+3p1AGJepvSU+OlhRQSirR8EwE1qFErW3rvJoZJdIc3p/UfVn3s7TXErU47EFCcetWjq0f8RO2uOOx9pdwizhQy3FIzfH0K9fTz10OMgK9Cm1XDh+AVG4srp3MWv6NIApSR3CwjPE7v3/PagaMW1Y03bcPU9B7+oZpLNN+sVND6yjCDMeXvC5gupPe6482tAR0v2c9vH4Xq/aQ1V0G4vEGyKmliXe622t7Mq8naNrYA2QvVqBc+c03HuzQiPOg7jlib1vyab6Y/TSX3WZ8yaXdtafJXeIh7e6N4IqoC3nPqO872rdb524Rxu36lzRLnZ1anRXtfzKAlVe7I1PBbkJNLgjnr5RUctd6YhC4tC6A8h/G7ytxFv970sOLODEl7fTpLiXI0YV33kAi6Q7JCwrv/OYL1fwsm1CJs6goqtPuZYEo1AQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(18002099003)(10067099003)(56012099006)(261026121527099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: axavZSz47SFXvu2y2eDfHaQtUVWQRFuFeE9y//M6iV/nT+hvPfrXR9TexPb/B7ZFpBLN+8OsoZhp21PthQPn9ECl3wGPtm0+erXZIkEka6Nct/O6/3VHzhPY8NgIM4S9hiz4o5E40X4/X0PonafJI1eCqGMLAidrPyd8q5iiKgv2KQkVCgk6HaG8ZUqqyr9EAYA+1ndO6lmEwttMdyCpaAxB2rs2NQY/FOrDUTNH356BA3Rt0hd9H5IxqX2LOi/ohOQwEHfbSE8GLiO3SslC9sjPCc3NPbO14nhd/BBvFFuc+ugyrENXB3hCbuCBqNKfFASXgdM4dsMRlRTadrfQlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10482
X-CodeTwo-MessageID: 8a9e3ead-8f83-4c6f-9a87-b78a561bec98.20261106065018@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 36006787-ea84-496d-74ef-08df3bd236fb
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|35042699022|1800799024|376014|82310400026|36860700016|14060799003|56012099006|261026121527099003|261022075727099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: BbJuLefoe3GZkeu2EDkV+qNC5JjUuYiXts3K7rsmRfY6oNkX3jVRiD3IBkNQrX/RjpM7XaW4cY5+0Ehaq/oYRwMnscpQUMELQBOGbnI/yPc0YMSIlJkaGpgf/H2fFojv77mCCKNZje4eCg02oA1EblvfdKtMh6wjDSkpXcFnSM0LkDQDe4ehZQQWIPw+GRHSxudNPtF0Cae2S+UUFygZRECFvGb8PEfNiUrL/KMXDAsuNmNjBvxj1wWcE35fzGPKzljAVZaTc5TLVRgOR+Pb9NadK9qbgpRgg5gWfG+CQX4yFE3swzHfLHTmOAHO1geWFN9LjMJ77aSSe3ykcWuheDAWIIxvQB9MPcEZ92lh2HnMZT1UihmrEnlsrvHwfamjs9mKHEHoiVLcwBjsMjnZaroVFf/EYb/aM9cJkqsDrzPUvwTvGUnIM1LDnde0IEjuyWoACpGOuDwvs+U/sAqxpVnBTV44JITJR7jNGa8qbeb02Wku4+PXZUvCZ7WeW2Mjj3I3L5wDbSKyEvnOlmYJB/HxWOqcIg3DSxpaD15wXU31ZEWURnX7/RAY8Q3EJf70dVn1M2NW/l/HWBsiOHSC+WnLR/+wNOKO4oM+y7bx04tOHeQwVwKLPd3FlUw1m7DOXg8aB8k3KEc8GC/gHw4yQ8R+KWPWBdXnHWW2Hp6LL+mMX3pATSQkuUSm5NPYe0WsoUQDV+u4H1hx/X58NiDZmQ==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(1800799024)(376014)(82310400026)(36860700016)(14060799003)(56012099006)(261026121527099003)(261022075727099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SXSGic0Mv0W9YGVVpyhN1AR66fiobXnxIDNtMte4aXxQeuseMj0U1M+8Wyl83Tuy2fQcAm3kMx5lGRtWvzDsI+oqdGiXoOMXLuinPRTO4WYQwzKKz7lvlQQn9FYwLpFHr/FIgyviJK4g9OxI2rQVbXHGHvcE702mN+Q2y9G6n6xbjre18sHZo3Krosr0fd9Evui1qrpv8fQRDTbkpoBZbWPTSYhEYMjMqO3p48A1vaoMEOPk7uEWfiRxm3G8on+J3eCyJoLQ3Cdd4z0476ZnblvanmJE0zQHg4JQfzLC3EH7v+YShFEV4pwBH/Tk9ausVEigHBRw0kiwRvdMXeEL3Oh8k/WHQ3OWEcS/S+xrDnvFCk1SrmVTCyzV91aCuMSEmvYhK6nrQfmllS2613hXsP83eBjzbSoxyhmGLgPQEtLo128sjmD3MvzycQDg1idh
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:50:19.0702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 646cd6ba-603f-410d-5172-08df3bd238c2
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 06:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131962

In the process of upgrading from scarthgap to wrynose, I encountered=20
that "mongodb" got downgraded.

scarthgap has version 4.4.30

wrynose has version 4.4.24 (and doesn't actually work)

Is there maybe a reason behind that or just oversight?

To fix it, should I "forwardport" the scarthgap patches and submit that?

--=20
Mike Looijmans
TOPIC Embedded Products B.V.


