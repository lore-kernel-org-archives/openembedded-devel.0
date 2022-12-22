Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8ABC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 10:50:30 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.106])
 by mx.groups.io with SMTP id smtpd.web10.42828.1671706224399779392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 02:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=pfwgCzh1;
 spf=pass (domain: skidata.com, ip: 40.107.23.106, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Et9gHeZKlKMRquZgTe5cNg9gYe40hoaccEXzg63uK6P6WEBoLeGiNzFBiVxcqdO0Bv+N8puzTJ5IFIbRRCwoKvm7QEP4lx7WzCCLsKboFmZcVhZwC0LRLfB+DpZVPHZEAQwsrlPtkNMW34GehMrpFxOPTNxQ/NCL3u1Sw7Z3Uf/QGi9oMNKCyonAi+mlwXUy5xwP8Z0lP7jwYhlbNyiYqykuo5l2CNh/cIL+vvfiG9iTmyBJ4Bm/Oc2wyKBaH14Xejn7m/FTztcjiYAqivKZKeb1cMPw3JvfzT2hsY/d1T2jCAaDhEo7POZcd/dhJzsacF+DfMuMZjZ3P9aQONXIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/FoovgFFdxV00OZac3byUKvCba5XtSqdDKPvy89pz0=;
 b=Df3Plmf5ZZmwo330BlIGNzWi0PuSR4iSt4uLL1+pZ8HxqT3/O0IdhxKW5beBrCX3YMIkSgu41wWRM6Xbd12ty3JQTeq50AKr82d+P8Gp0Q9CthkXmRj39i5RsEHmTBMZrQBTz7dtIUqWFDEf4mQhPo32dNNOdb2suH9zhShNCTe9EZVjFlHMr11uG+//1NSlhX5wr7ku45IKjYu7AO3gVgQ2fJIP3i/hSHclIsjvxqTGVJaF426X3nhGzm6la4QZPx/1KfWG2J6Tw2VUQYGsZTkXibUlYXJfKkKL2TPYq4lTuaXzaku0JIsDdWEZe2KOVAhgGBVEBqAsyTS5BoMj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/FoovgFFdxV00OZac3byUKvCba5XtSqdDKPvy89pz0=;
 b=pfwgCzh1UDdB45XW3pRSQqQB/XlE2ZmPJPJUGlFF9ycARCBQ3ohPE9xBDyMyJhvNXjuZj4drG36sA8vp1YWuTQnwF0Z8BcVR1jMbfcpFeOlO6zKOhK4aAccFjLRxuukAJ/pPAT+ATDgu0DO+qkr1QuHqCfxGjxAbCXkKxNnW1BPgM9VEw5C/CIUlgivi1sKoAaM+i+66481O+nMulYVYCjS7P0qEsTujSmuyBYG3hHOBT4Q4ReX7gv0mpxnP1W+0N32Zok52D1Szy+Kbs71X2NUw8PE1EGR5XkZzw9KBGz9FhEtB9mGyJC1T6jyioqZoLTde+35WcVeVKla8FWMOyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 ZR0P278MB0870.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Thu, 22 Dec 2022 10:50:21 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d5f4:92f8:c46f:ac68]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d5f4:92f8:c46f:ac68%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 10:50:21 +0000
Date: Thu, 22 Dec 2022 11:50:15 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: hadkeakash4@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java][dunfell][PATCH] openjdk: Fix CVE-2022-34169 for
 openjdk
Message-ID: <Y6Q2ZzdPffSXeEqP@skidata.com>
References: <20220828150648.6850-1-virendra.thakur@kpit.com>
 <28414.1671703673943644882@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28414.1671703673943644882@lists.openembedded.org>
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0211:EE_|ZR0P278MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: 960c45e0-986e-4f69-a43e-08dae40a5271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MrPvx8azVbgz8+QoQbgdFYjnk4Flw57NBP1jHTkSN0z51wGRHFiS2dYxLmDXMOPL00po+LgFXrV+n18UotcM38GS6NcHA9WM+07Hbf6u0RZgK8mtSXUPAmmsKEz8SFuCVfSvk4xe2dGj4RuRxwVqoYCzYHmhF7rannaI8E6kdLEXtJcnYSwF2Ijn5pnfnGTYH6F5w3TJXzeQJQe7QFrl9958NhQDFaXC84I8qqnwLWVUHSIupx1BLYoyCZy2zi5cMkfy2ztr6HVHQLoOCV6jB2afvUdXNzaD7i0JGjY8v+ZZo1pKiXK/GXheGSNDbRax0euFD2RNIDkjd+RJ6pF/shmgkg4KJseOpdPZeGxMdiRZ5T0+/VTa67aYGeJmPLcPfW9Wi+4IFoLBYMKUoGp4fiH4fsWF4sH/dPE9viF/DIgMrYbR6tKRPKc3qR0Pnpl7FCf+EwxlkMsF+J4FkmqdVXi29QITP/kiPXNagMZjayW90tg4/p+Orv3RaiaeQ4ttkawItR9vD4vZdm7vUY1wvuYUVNtYa3QTg63hYqLsIyJylKe1aYEk8WKFRVf9jJKLWlVOkzAOcPun9Lig2JvAPton4NU5vA3o+7TsWJYbjLgruVrKbqfvleDLkywxdgKYox0b47jOqvddFP10Znqoyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(451199015)(2616005)(86362001)(2906002)(38100700002)(6666004)(186003)(6512007)(6506007)(36756003)(478600001)(6486002)(8936002)(316002)(6916009)(8676002)(66946007)(4326008)(41300700001)(66476007)(44832011)(66556008)(5660300002)(4744005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5IgSC6UlDpd30xmEhNxvJ8MYGiqYVQ532j+tdFo6ykXRG0Jg8QwdIWU51Z+B?=
 =?us-ascii?Q?wZVon3Hx5Jd9OL2T1Y7nLIrMHQAxpuSeZKed9tTDDE5yZnzXGMwiMfIk+V2N?=
 =?us-ascii?Q?L98LcTAxY4Bb/XfuJZF2UBNZKooB+5jeOs4EY11j8ahYxatjW+s+pU/SCWSQ?=
 =?us-ascii?Q?z0udC6qZsHA7xrDEK6Hl6J0H9z1HdTgR+dxjUtJxphp61v1vo77WzDKc4OHm?=
 =?us-ascii?Q?jjuWfULwMyhIIl/TZawU1RB5AawA9Q0GQJjXqxE5GYzty5woqcOL+J1a/3CX?=
 =?us-ascii?Q?Ndxb91E/6XulNMxu1uiGDNX9zDEXcpq6tWPhwFHKceNBGeeKl1f/+Z85sK4/?=
 =?us-ascii?Q?doXeqylD8R/PMxZadwCCkBgwZKUXGzUbaPCNj26hzgFzdDZP1TUYKLwuU1Hh?=
 =?us-ascii?Q?ygKad4epP9o7r+N1Q5dQv8rRF3S87VZEI6dsvNJe/eaZbDirLKDKoSn44iV2?=
 =?us-ascii?Q?CHH6J5DeihpZyWXSbqBP7V5PqpDXw1Gqt1EB9+Ejql4CuwRTavjS5ainsBn+?=
 =?us-ascii?Q?H80jbfMFK7otXEcI5Ov9vqRbC9CtuDSdFRb2W5lmuKkOlBnECW+9wNH2YMoS?=
 =?us-ascii?Q?PUMKNVIarlqSZXGmylqizbyVQvMP1WnDrU5K/3sc1p810Hn58JXf6RbK0SDB?=
 =?us-ascii?Q?EjZs+7aYlgFbJtz6+Y1Gg0WCSluSkAQzZQAtuKVcAwnqRAazR9sBaBBdDURt?=
 =?us-ascii?Q?F6mUN0bXaRJV/3RX3kcyRmGkRKfO3dqqRR39TypHpwceYoxbt2y5ufR1I+Xm?=
 =?us-ascii?Q?3saoP23myYZ4cfEIcrakvCnc8Qb2iIddBa9C5hmuJ3kvOvVVfehJ/uFpviBK?=
 =?us-ascii?Q?LIvcInWgohywUO+qbAVuxsfbg4ZxLCjFS3c348H9N7ZF1RfOVNuVlSDdovFD?=
 =?us-ascii?Q?x3GwwTAL9rRUsUc97mgeYOk1RE3ee7w6hcqhVJxMfYA0VmJ8EJBCPBtNibO+?=
 =?us-ascii?Q?e7t3AfOpmW5RW6oivVrfUQljQNv3CpoUtPSuS1dlzDw7F8mE4rOTpoabj5xH?=
 =?us-ascii?Q?zh9V8Sr+L7OUi61n92fLOtkoz55kB6jCsRWCjdxGPSdW/VUZYL2Oy7lnUfWc?=
 =?us-ascii?Q?ICd05FsFMEXEEApLMSwP5NX74FrJKdlZccJ6Ov88O6s53Q6t9UFuz6661VQT?=
 =?us-ascii?Q?o3tMWDVVU0IBGmB1uo6UzdfSHiZT4+UGuC8g48maF9iAH/oFzc+YBc30yNYG?=
 =?us-ascii?Q?mZ2AMFGztec4ozkiusOVR/sIdXbPZ9NFmU8cSCiysNsZIDGGy8/EedfySBzz?=
 =?us-ascii?Q?2PDmjn3/Ih0vhvYpO/ivuxygmyivNA0Qq2DytLm8EKuvTsAxQgRPgAnMrOBw?=
 =?us-ascii?Q?14Zk5FbBbekMxqebse1aLZrKbtdhe2mlMd+iz4czwVJ/bNUIl4MOKVwjOxT1?=
 =?us-ascii?Q?1mldjzBCJUIM6PilXSa3tGRX1IukAC8/1jOqGQq6QAdyHrdmz7wCyi45oWOi?=
 =?us-ascii?Q?QP6xtbTSIv5phbTnzP3sO+RWDwlLAqDzibykqO+/gmK/Ix9O+kSBA61RatBo?=
 =?us-ascii?Q?eKULEde72kbA3BmH9WcaQgxoL54j01E8XbLkUtGnjsBe/l4iP1ZlfyW7ZZsA?=
 =?us-ascii?Q?ruY59bVnZ1puggrVWy7cyAQroMkDZ25D9YDd5yngspI8DBKhkJiEtt8s/8oF?=
 =?us-ascii?Q?6LUHWznGpOYeR/uXnDddpCod/md5i2dP2vrt4YK/CBHyB9j0rmqnWxvV3QRc?=
 =?us-ascii?Q?/SqBuw=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960c45e0-986e-4f69-a43e-08dae40a5271
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 10:50:21.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gV6x9ohjii4zD9pwtgTRy5NZ3eGxWd5rihFh/q1PYpoetUzxkPhmW6HuBUFb+Oce8AGLQZJCRBPrX66ndMNsWiIbBn/BYDwvCO5NAuLFIMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0870
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100193

Hi,
thanks for the reminder!

On Thu, Dec 22, 2022 at 02:07:53AM -0800, akash hadke via lists.openembedded.org wrote:
> 
> Hello Team,
> 
> Is there any update on this fix are we going you going to consider this CVE fix?

Tbh, I wanted to update openjdk so backporting this patch is not necessary.
Unfortunately I didn't have time for it. Are you interested to update
the openjdk/jre version according to docs/UPDATING.md?

regards;rl

