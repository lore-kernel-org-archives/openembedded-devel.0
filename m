Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web08.4553.1630163453634027224
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 08:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=jAVcKpYh;
 spf=pass (domain: vaisala.com, ip: 40.107.8.48, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1tH2oLDxqRj95JQHLeLM74xuBlZxCzdxwecbD+7u50nQEl78rcBRLlIQPr/SXZYQzzSiuWR+2pjsAVR46WU8anl+mM7wAz5946NxGTLMtWnozE7dgEqYJcrg3TK04Os7o5zue8oHLYu7Hl9GQOZOa/fQlC+pUNo6hSL41B05tX66I8rWQDNm+dtVCjXgEaIvYXRy1P/ZhKQIa3DNay85NkwI7tMBwMPiExzvWJGMBl3kWaLBqptl+29je8+3DYzzxjz8aJTMSxbikFjFANgO+i83uBIhxXMvsaI5mQgV3IKl9ZTqtfStA5UeIM56DpcT6XeKTgifu7eVSdFhiGt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzcKY8M1UZU90Fd8/rp1669jYmJ8Lg4VjHnSq8dU/4o=;
 b=a1xRTE3xo7umuDMcHaVovUMnVBSuy4mLow1pkK7bKaYVBabcS/6eli8doBq3t4QyNbW5093mUQQ+x6oV5PrRZE6yXCrirt3zaLvV6Sq7I3VfFOJpWkYTi5/sSt4nQhZf6HYOjP418HnSnxZCJH+UODxA+YsF4R7dazp2IxIU39ESjW16yZRYN3NOpIIBC0dpRvmRM2Uu0muPD3AwouGq4qKGQLzvv1c7cIUcvK50nFaJiPNiyKdiffEAxd4kEHTe9WBnpEM1w2OQMSFR1lQEa4xl0b/sTixXfyRpIeFrtN8jGg0CnL2vWRaCQUCux9RX/+aNUsktMksgwldFFQxDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzcKY8M1UZU90Fd8/rp1669jYmJ8Lg4VjHnSq8dU/4o=;
 b=jAVcKpYhgkTNfqENA0kkL5kQDTse81ARwuV9jLnws1/+ACbItP0dg23zmAKOna+kpNl1HXmL4pxw1jNd08rD5Po5yoDgT4/smQ//fVHdOBDHgjQ7AFLN/woYbfJq/aAnRb4YFCxsuMSiVtLd9DmpD8LR521XRu5YcymXvd2CDJxTgRc9ZqZWk8r/230DVSubrS8N5IDymN2n7179gZHNTp8LdlPN6M03oXacAy+LTiKvuBPCXhU4+24ABYL3SXP47azfWC2Ns0Yqp4oES+wgYwloKHi7n6VxR+UbO0FeHxUO5Dd7OpA3+cXQ2nllDPdKWvNhTmIaUGqOQE5c7yIxiA==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0601MB2363.eurprd06.prod.outlook.com (2603:10a6:3:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 15:10:50 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 15:10:49 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pkcs11: Add recipe for version 0.7.0
To: Khem Raj <raj.khem@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
 <20210828134727.277771-3-vesa.jaaskelainen@vaisala.com>
 <841b8c92-8246-b1ca-3b24-10216128ed60@gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
Message-ID: <f5544c35-016e-5692-b00d-9dac88ec94d1@vaisala.com>
Date: Sat, 28 Aug 2021 18:10:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <841b8c92-8246-b1ca-3b24-10216128ed60@gmail.com>
X-ClientProxiedBy: HE1PR05CA0298.eurprd05.prod.outlook.com
 (2603:10a6:7:93::29) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (87.92.181.210) by HE1PR05CA0298.eurprd05.prod.outlook.com (2603:10a6:7:93::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Sat, 28 Aug 2021 15:10:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7763f211-4f71-4884-90e4-08d96a360528
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2363:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0601MB2363172B478ED7ABF2818AE8EDC99@HE1PR0601MB2363.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hoo+V1v2Z6XTvIo733ujcTQ155IBuSufGN/Rj7Wv40hanE71CARVeioZrtEMF4SRDEdFv0TkMBSQEOVXlK2oMjnVzwComTzSPK7ZcqsTxB3RHmBPfJ1+jHpH8p3iJ171b6lvcV+Cm8rlkHHu3F1YV1UadmVsrvQiEB87YEa3l7T1T3cPaH/1SJtWsHAlyeClM2GSkuVoDgs3TsnKa0qPSsdAha1mmtH5Vl5wo1jN/CgO4x+Oj/dH/AOdcpn+CXEquWUcOHxdWuQzlIiFrbLirYwyAGuGB42r5Z9bG5LXCD6p3URHy7R0IThvhmChuf7956HWkS89LBmPeC0UZGpzaoBv/vmCcIw2wlqEznKqoDcIBzShC2RJSerxGjEnhtysvm8lctdDJAXRTNoGodrPinxBl8XtUEdD7FDtIBKRwWkKF/zHjrHxRC2jOTHdz5eQz7MQ53Kfs86yIyL3Es/eCMWgyK1zOtIOdbpJYA6G00d3iyY2OPlW0cBo5cTP9ZZsgCoXyx1kT6ADyw3p3uBI1iDs3XCtt9x/HnxbwZHDA7SRzata0U9LhrOd1muavCi6+lTM3ZAL80poGm7tiV5ftMtXdAh0RK0BXXCuvZWow58xjpNPVCSbz4qBF+AWueTOvRakJLaGyLfO6KkOWMVCsEnN5gEUL34HUwUROXkm+ONDjeuTWv9FeHhv/Njw2rSGvwzdRsdk9LwWFBKcdfp2f3rEHrD5uJev61VEGpKm8Do+UQKplIlCWkUjHcGIw/+/8qCaY5qjOUBlrMhHibofzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2906002)(186003)(4744005)(85202003)(110136005)(31686004)(85182001)(508600001)(6486002)(2616005)(38100700002)(38350700002)(86362001)(53546011)(26005)(956004)(16576012)(316002)(5660300002)(8676002)(31696002)(52116002)(66556008)(36756003)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3gFVrO9Vamxv5dItuBgxgvQkwQuOZRFivjEPJHiLyjnPOsNsjvLJKol4Vt7X?=
 =?us-ascii?Q?YrsmyJpQo4c1XP6cmdL64jV6C1IncgOuP1UmHQYGXxNVRC8+ElBPYJcVZxBF?=
 =?us-ascii?Q?GF98mmDl0uV20RzmR6Pmi+HdvMkQoJPryM53lJwpK3db/NOTdCwikTchxb74?=
 =?us-ascii?Q?QAYCfwdPt4prKcCO9qKEehtxywa7m1Mk8s0y6V9q4ZrnVW7luPKGUIRNCq7A?=
 =?us-ascii?Q?RCwgQ6G3GvKDIR2JcuyUT+yfvHO7Bwxgk91XV9BthdwTD9hbCqt0WRvNn6mj?=
 =?us-ascii?Q?Cd/Mp7xRxmdaTlkTwBPanyQJUp894CKSXZFCQHnsgpgRv+OkfJRpRiBn9G9Q?=
 =?us-ascii?Q?tQTjLsAvcNTCmn+L6XwgCLetquxfDvm/VIDJa7TIpGnbvMiGWJqj9qz6W8rJ?=
 =?us-ascii?Q?Wq8/aGh7gVW7SMpxK8a1o//OXgvyg1vJhuJB5viyOGwFZ5rqxuDjpjSNJrMN?=
 =?us-ascii?Q?RW0Iye4w0E82zdYwlh8PdEr4MGOYwmFLJS8sj1AcNebLtlGQtO5DbWWmZTP+?=
 =?us-ascii?Q?EDXfllJqCJFsI27Af707VwQqKvGXA5Qunu8CyRZ6FG7wIOuWL9hRHuKFd59q?=
 =?us-ascii?Q?1Pr+JkUxNUoK41xfxBPVk1WUz6NzN0oijLizv6s/oyj7nPJcz+KZKRjoH5mY?=
 =?us-ascii?Q?gUx4azUL0JiVvfZC2zrYhWyU/bvkC4qHOJfgdHeClM0kdWKl8B2u8Pm5duC0?=
 =?us-ascii?Q?ezmeQWOInJc3tCbrFdiRLAN0VJIJ5zfwzTmcJCbBsMgaMf56B69l+QulJRG8?=
 =?us-ascii?Q?h3hCa5nV2TUX/o2pq4/wc9YiCN7RbcNS6DJuczUyPNWkI8PZoof8sue1gbBX?=
 =?us-ascii?Q?DCzixQUs125kxCfA4k8lptlEwvYMXnSPVJnxmYIcaFN6ZwR7EHze8P04/Sth?=
 =?us-ascii?Q?luUo7BR0kIxX+SUN5UUDCjeGiFhmhkTXY3qeYcmsl7KfLKLUTBhO8JxP2v22?=
 =?us-ascii?Q?R2YgKB7D6OnEYZ+TCKlVw585LKi4dHr2ETLN4VZlBVUdYrNtfGbAcWmjRhWv?=
 =?us-ascii?Q?efHxD2vIdl6ruU8w8Gk8iAWfWZFphOhCUcWp9kQilB+/nGvOP/NCKMHzf5xh?=
 =?us-ascii?Q?jKmmaIG3TPLXKmVIeK49KBFduIyq01c+o6q3wcTG6EuQ8lwuyinmuuKKAYTz?=
 =?us-ascii?Q?Bqo4D3gEZ90SjvuAnaT04y5XU20ARzM/lQhRG2JHbledmZLO5gl7i0jH5jTZ?=
 =?us-ascii?Q?yN6/YsGJUj58+TO2TeqK8KLT1zJfJa++5nFtKZGWAEbptUNBTroWMqmeAxKL?=
 =?us-ascii?Q?+PxInUe1AIEQCcTKuXDgd7PUj/Gq+OxCn+5Zz8xbDYBFOHa9SULwmYIkTUu7?=
 =?us-ascii?Q?cTYAI7UBm97BppJuGfJP/Nhv?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7763f211-4f71-4884-90e4-08d96a360528
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 15:10:49.7818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS2yY+WdWCCTeZJdFXbK+NrxbJsT+3kv7E/9N1NOJ0mT2PWbIK//EpiL5c7VMlBK3KQDW+lz2Fia4PIr4mAEPFP39/v84csAqHB9P3Y43ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2363
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 2021-08-28 17:13, Khem Raj wrote:
> On 8/28/21 6:47 AM, Vesa J=E4=E4skel=E4inen wrote:
>> "A high level, =93more Pythonic=94 interface to the PKCS#11 (Cryptoki)
>> standard to support HSM and Smartcard devices in Python."
>>
>=20
> since these are new recipes please add them to packagegroup-meta-python
> as well.

Ok. Will send v2 shortly.

Thanks,
Vesa J=E4=E4skel=E4inen
