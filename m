Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73249C47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 19:41:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web10.31684.1705779695855295481
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 11:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dVuSiQav;
 spf=pass (domain: siemens.com, ip: 40.107.8.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgAvnnIgbl5eSiojifUC6PHuU3uDsxUexKwuQIN1HQPTb2KWeS1Uhf5rDKRssUPZDH5ZKLnlt3JwIm3mUfi0nUuRyla3uTyd8b5avlBIaJa8mv/Z8DOFcz5XNtWc363FontnZq+KO+9BhSU+eAjqo4IsXOUtvGt/yOW1y2NP88xgUpqSaDgp6ArzhYFKJyT5Q63uavu5pu1tAXTy+z1LABYd35tPvtMg6r77a8x8UIhReiVi6welPDu5yzQqVY5gFcfqztJIGgh7AgTI0xiiaBrNa0/R+6TofbLe4cQ3Ika4pg6Mx2Bcyx2Tfgjb7VsD+WLDC3B7K5PNdx3fbFpHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcPRxLjt4A/kk4TsilaQr2d38IJ8duFj6tBysSpaZnI=;
 b=BbgB6W+xSnMGDZr0HcRg8cJqTnTlvwQBQGm6Gb/Enqaexrtqa2EFy0cdHm3W6AnVnKiZAStr2FnQua2IpaXqRa3B4VwRGHLPgE+/Yh3yIYKTS7wjyOUf6uoZu6866XHBzY3tEAdbVxbCWEfT1/CAjJrXS3xqlhwxVtmvC0mLOfNKfsvXSq/GLnHoLSOOEdpgmTp0NVjYceBVkSq3nY1OeYlHx1TC4dQHbK0DCF0GaXXH+aNIUwF8wFYzhNatsYh48CFW/GBE7OrFrl1ce9CPR8rwDYVASDCtoO8+SIAzbLBt9Ax2rNJRgWpOkzfoSLC5BFWTtQY4CP5nI/rkO1jIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcPRxLjt4A/kk4TsilaQr2d38IJ8duFj6tBysSpaZnI=;
 b=dVuSiQav9PieSoEZpRa4QQAouy/BehdNL6KLt7TwTJTTZWfqgxWxyEp4nN8uesSp05AYXbbyPB3K/TCLBcvn8Q0U9J8t8ObJyBeq3E3NiHmFxMg4EyZ+5g+H1ADjGXvAznYwrkPoVZM4rLvu/IZpWBPvXka0P50Np00wEtvb8xPwaz06nYK246fUZQoCsUAWGslQF8zKzXedOa87X99SNNbZaleWluFSNSErvU2nJssbLQFT6eUyoZ7OSvn5gWL5KQt97Zi65IfGwRAud8PxDjI1CjTJDlNM4cuM/dXcUCOBK/C+hIDhl9HXjIR9q3AGXpHdN49SHH3RhouBzs2Xrw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB8181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Sat, 20 Jan
 2024 19:41:31 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7202.028; Sat, 20 Jan 2024
 19:41:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] strace: fix malformed petch upstream status
Thread-Topic: [oe] [meta-oe][PATCH] strace: fix malformed petch upstream
 status
Thread-Index: AQHaS9bPGzxyh1qzPUWZH/ywmo7MDrDjGY9Q
Date: Sat, 20 Jan 2024 19:41:31 +0000
Message-ID: 
 <AS1PR10MB569752541BC06A69921626F6FD772@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <17AC24DCC4E467EC.7395@lists.openembedded.org>
In-Reply-To: <17AC24DCC4E467EC.7395@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=986c0527-e449-49c1-a551-0fb646be470e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-01-20T19:41:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB8181:EE_
x-ms-office365-filtering-correlation-id: c2173e57-4a0c-4f63-a2f2-08dc19efcd51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7NXjSmLVFqSqBLC6Y/OLKLNEQEYuteioVylUy5Z/nQC/FCpgrv83hcWZL6ezQacJ+mcWuz7SU3sJ4mnE3/cWgr4WxxBtELxigpUFv985AjdJDVayMojVMPEbGrwdGFbJ+V65NuvXs2q7iKDnYMmCFi7ujsTHSPgBA+iXFuI8m/rKFWkBQB46icoReUj9y7+xAbBEipkaKiHCpsj5ySVZlUAVEsbSWYW91J0CKg57fqG9mf5L70zz7yMOZSwE2RsiwflX7BgTG2XAYZLfWznn+1vYQJU3PWMs8HO15OofcqYSkS56Plt4/Gjm7FHp/vCf7WHHTE/9ftdmMwIstR5IWWHa3doNGggmrjQwHLq4F4rjPH5Z9KCGixCGu6C3MbTGU36L3CmGgFZB3xzuL49fZctGBWJy0LiB4wILCVrgDjsKqWhxPwWFTmIU1Iu8u0b0gXUK7qYuWCNbqzKlnD5kNbq1v9a3RLGVKTJ68RJU6JEe87MOVgppVodl4ncZ73ASAnqxNpOiuYDuBNEL1W/7mlDdjFLwyLtT/8P/+THq6iUUr1WuRBOOkmr9HilGgRvIKN4InPbr/5YlHQNw3xCaQO6VXwHSchXCmXul5v8gca9rlbG12xImk/HuEGlPSI+w
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66446008)(66476007)(66556008)(316002)(64756008)(38100700002)(86362001)(6916009)(71200400001)(76116006)(66946007)(82960400001)(55016003)(122000001)(19618925003)(7696005)(6506007)(8676002)(2906002)(33656002)(83380400001)(9686003)(52536014)(4270600006)(8936002)(478600001)(38070700009)(558084003)(41300700001)(5660300002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?121V20WVDQSN/E6FyYO66ukLPpkaqsTx7J8yCu+2zJpS/4Qv0PgL2fWeoczM?=
 =?us-ascii?Q?3MrbXzjahTJjWNmFdbx77vblByhlf6JWENYmt0dUXQUI/HtxTr6A5eNLMWLW?=
 =?us-ascii?Q?j8v1FsZkUHHx8I5Ea47H+isdx56Nz/E6HrzmHyfzJopr92n9QkgenuyJ6t5r?=
 =?us-ascii?Q?iYk0drRyXKo5wO2Gvk3xwDaMOJIdd0IYKH7ZR1o3ZEINdQElPhQZCFOg8HVz?=
 =?us-ascii?Q?xz2yf92asWgVJ1iq/ZTHXKHzwNSqjR+hvK5N6yeFV8powvNftyTIwxDqAUth?=
 =?us-ascii?Q?IaGXE5+NnHj/d43ifT1xA5A9WlWnvZZz6gR1DZ4+VkvS/Ri/GufFBkwmAGqJ?=
 =?us-ascii?Q?dWwIoprs00a1WeWbU+ZqSLgii7UXUO7/bvoPrUZQpHcKFmsqIyYiuG+Dd2wO?=
 =?us-ascii?Q?nR9piWg3PLqWMcbAEHpPY+tIJ+rr5O3mxwocEkbaW8Uy6/5nJ8VJAk7K0ypo?=
 =?us-ascii?Q?BFq+6YVFqgOyc80jQj4f7p3RI7tF8uLdlZdN0OJED/BfVR3H5XgI2XfN233E?=
 =?us-ascii?Q?Wxo0R8YWFpeVWN7igZGnqjNM131eYH3cutQzD8WtKePzVDYMS9Jl2rbC/uWw?=
 =?us-ascii?Q?nQy8OxXZIc5i47+EUNV2dtcQxpu731tOoAm3Nc73Rkj/3WQUsNqLrwKG/S73?=
 =?us-ascii?Q?WtcxrfXkrDwUil6/yQWfKTH9aIzoQJOuYAzziJM0o0ARanJLoW+6ooeA/weZ?=
 =?us-ascii?Q?3xRoK46zDvOzmvRZx8iDPzL5sJgD6MN5/lXeragT9Z5i/QlqbHXis/gINzlz?=
 =?us-ascii?Q?WfimNJeijCWDQhz926uGBaMkBJip8aYdJhZjHKnpqrA9lYqLz+MYdyU8y+OJ?=
 =?us-ascii?Q?blPI9La2EknAKDiEM/ezr1uFC6j5RmVFKx7uns3BvNtfUn9N9QVyaHNxvabS?=
 =?us-ascii?Q?iCmHZo3m7P9St2Tv7xmUvOGk/w/4qirdhqa2EyYnf9VHPhPuG3YRTrZDvMyI?=
 =?us-ascii?Q?9KhvI6oG8vgZl+sjnx1Aj6TDNLvw4taFByNIa+4MsHXlqP/A2b9HUnU8MFK6?=
 =?us-ascii?Q?qSCkXJ26yNRoKmZ5eDoxDVk8FQDXfHzhXie2kv1wF+czWPRb3NkopF0n/eEf?=
 =?us-ascii?Q?GQ4LF9x0uYVGpig2VwQayI0GbiQDx9/smNf4bIkr9q4+bLXP5obQTxQ1frz1?=
 =?us-ascii?Q?wXq3bGdz77oEq24miHL9g/UDp0ojszwv6H7CWMhVGNtvXCRdSjY8Dl2GXdpn?=
 =?us-ascii?Q?arvkJOY4e0Xnaav2sPEVJQgwAhVreH3ChjezBxqSKghVvlKRGESLHDQCNNTi?=
 =?us-ascii?Q?bz6Ua9LMTQFgzJqKra048yxJHWCFUZiUXzumIYKMyiCQXMo3JjAEQG/v37wB?=
 =?us-ascii?Q?u6/Y66jW2/vYsWnXnHijP7h9pRTgztgFgn1axLoZ6QBh1UkuVJ1cE3hhGjmm?=
 =?us-ascii?Q?fQxTq5qfpMwNKGcTGRhS2eilCbDOdmEUZRedJohP8mIxV3ukztSLuUJSG/M2?=
 =?us-ascii?Q?x3jFBakNYBoFunvodsS/lGGVLZ4Ib4qx0bL9xLjWy/v74jLdyYIzz9KPWuQo?=
 =?us-ascii?Q?T2BlBRkdUnvDZLN9J21avfsfNOWYkwkykUzaT07kvR7/Zv7VH9CawBO6XBT5?=
 =?us-ascii?Q?/qTSw4aRLY4VA8e8t9JIrSjkzVoiZ3/+CCyxrEJw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2173e57-4a0c-4f63-a2f2-08dc19efcd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2024 19:41:31.1838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zeMvJvwsgN4sJxE+1MQ7oSbGj/QXoO+5ENauO/8BVbgrdzQYuME5YiuU/3PO6p4Cd1NEqBULfpinVc9gRhjZgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8181
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 19:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108363

Please ignore this, I'll resend with corrected commit message
Peter


