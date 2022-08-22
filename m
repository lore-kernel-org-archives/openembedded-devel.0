Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3FDC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:38:33 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.91])
 by mx.groups.io with SMTP id smtpd.web12.15445.1661153900044566047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=a9Wua3Hj;
 spf=pass (domain: skidata.com, ip: 40.107.23.91,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrttNYAaYo8V+SXFpQJ6XAlgLhKpF6J7nBodkqaVRwilgcFFntcYYtbN+9BHWnIejAtuBU0hd2W6OH3Yj2qkFDKEkAvnmO9y+iqkTQP8Vmzkuh90B5po7svMMpZzTfd/dnpWQX69UJ3bjevtoVJSX+3BZ54fdRKLHXqHnFjXtZwtBs1/EfVnp7mJIy3DH3ZcHwUCUwyILF2QPNRuHWRf7f1bnbWQ+y4rYONHV6jpps7GQPNdw9oyeuCkdwii9j1ySPCf3Ga1Za5q0KPLbDOCoEix85gVJAgnQc+9RZy7SSV1mIcxUHJW4EMuZUi62Qb0GoMezPAHwVD2ncGYOL33Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKfCsvKHkj9Z4fZRuIjf83Gm78sKdKq6lpvGy+4A+mc=;
 b=OgaF+/I1pDkTJ7teyxbdhkmO/+JLhvJlCM+Sfu7v8QOB3l6qcTg9NMlXhEvHbJ1Tn+DiAYFnnB50AMmq/5/ou3KGDwdDGFRs0aPUFvtosFDm60SD7b9LBo5nD1cEEZuk8KG4fqS3XAO6ZdSzVMSbmttjMZE8D7myo8XEclSrQuSi3YlS4DOvQOx5ukbLClvCx9oGy/hHny65bgZB38GhVjRGwvEAULmjU+zfLOywp3Xj/d6qdkEETT56U3ApWRrHn/eaiGOU9nuI96nNVj7IPurFnVcOoFCULweGKLhc/od1WB7u+rvDUbbleRGdmj0F7ICGMXfH+cxX0jaP/zDOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKfCsvKHkj9Z4fZRuIjf83Gm78sKdKq6lpvGy+4A+mc=;
 b=a9Wua3HjmhsH0f+8Q/0sOtsEkb2uIq3zI8KLBj0+bTR5MykfInhpQJmwf7CPl0WUdCcPzo9fhCN/k0foOGwe7tTWKlN4o6kOTZN5C2aQGg0tNFViycYP2He0vv7UtvFFa3Q/MUaBZZV7lXM5vErlfVf7I7E//7P83A0eaiSA1BsuGSG7O6Bvz1S6Pp5BMWew6Y5+jCa2aYYavd8tghl3XTkTTnznw94te+CK+nu3le5+/P5OHv/Fn+WxsfgWc1mri4TSbFY3qUDT+b5i6V7BE47QCf+BGoEM+zLETfukZbtWhzJaQVQ1co9Q57QFDDEsn0IC0yhUlXCeRkdPBx8ekg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:43::8) by
 GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:21::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Mon, 22 Aug 2022 07:38:16 +0000
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::91f2:a7f5:699b:388f]) by ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::91f2:a7f5:699b:388f%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:38:16 +0000
Date: Mon, 22 Aug 2022 09:38:13 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: andrei@gherzan.com
Cc: openembedded-devel@lists.openembedded.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-java][PATCH 1/3] classpath: Use an include file for
 x11 feature check
Message-ID: <YwMyZdfwL6KGQ3Bv@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817114308.347965-1-andrei@gherzan.com>
X-ClientProxiedBy: AS8PR04CA0201.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::26) To ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:43::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6efa04f0-4258-4abe-1c8d-08da841146f4
X-MS-TrafficTypeDiagnostic: GVAP278MB0119:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JzIarXKOHiWadIlbVsjr88RKRzVaRAACLULqBeO8kjCHbXk5ONfOTCsbDaMhPWbyH//VPKOFyR0uvpHRIkD7lcvmTSguNqEnT2HiBxCrONEbStbR1inSOH79KWqDdkNpYeY4SX6E2+2Lf6AaMvJyMPkI3/cAIpDFD7Kljx99fpmZ/BoShazpCHzQh+MNJ0dHRdrGjA+mYdpAs7EZSTPJULZdqJzBsaQzzfBlpIuBBENGaloBOFs9Bo0UQ+VIBPw/yR+6rroLKsWU4ZKA0/dFFCLyewlhEag0D1NrQLvmoSvN6CJ8Zubpt8pPympfs7b+OI4n7zVq0uaAcCXHtiXC8iwN0XWrcCr3ZbqgWE0VzMvAHoH9CYtRaef9rbMG5Asc0aePe89ErCLt2RJh8X3jVHtARghInLS+rcoItNe5wsHhbS4hT8Rp/NT63ofTHhfHgQ2caomRwkV0mSeiXPScyR4dZD51j0SA9BDzNhVEyUPzjNZOWb0ghSzdIDRoyX0mNIi4Ihgp0zKDMJWdr1M/Vj108S0NCzLMOqAV0K9Sq26r87ei+Sytel/CXtjJMA+0ehhKTVi/bUDoRYPmMtWcqgRdbxp1c1vtbWfBEHFkFtEHuzCET3JiP8L8LX+IRRY2Zx+vuJXvxxgU5E6vmV2Ip46nS/WXOFYfSisXAjW7xQTQfpHmMAEOcGrxeT6IX/6pFx7o2VZjOL37jX5XV7Drmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(366004)(136003)(376002)(396003)(38100700002)(4326008)(66556008)(8676002)(66476007)(66946007)(6916009)(2906002)(316002)(6666004)(8936002)(44832011)(5660300002)(26005)(6512007)(6506007)(2616005)(186003)(41300700001)(478600001)(83380400001)(6486002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q8+uFgmkSOQVHC1MRL36xXs4dy2KhJBk41bCYY4W8ZQ6KDqY94be3li/EP7M?=
 =?us-ascii?Q?dQKzKHig/tWZVich33vPtW/jaRnr9V0VvjXIq/g2G8HbVi3JSSsks7g8ojq0?=
 =?us-ascii?Q?noJNqYJT3hPeyjmTmrp7u54K8CkCnHLOfhP+ePaiPJKTnMPDCYfkHhNyHR/Z?=
 =?us-ascii?Q?9qpEo5VvhYTd5WnTQv5AaE/KPOiV7OpbKnhhoFMhBLiDl5d+bcb7TTFYoClj?=
 =?us-ascii?Q?fkpV6O+EQrUt1AlHapld7zow/zIi8e5C40wrTtF3XPx0rXW8NsnHaC6DBWN1?=
 =?us-ascii?Q?iDFpS8C6W7gaZxBa9c4Gf/ytWjdQDslYWI82SYz1j0gabnRftEge7jfT7YXb?=
 =?us-ascii?Q?4qiOYsu5Y8nGiUPnPTAhjhCB0W3YRwrM4/EGBSR3fk+0Eh/+jHjrSN0KBjuU?=
 =?us-ascii?Q?7Tbwq2WmsYAY0t4drStU251C2QyWHcqXg7fsAaDiTQN0tRx1eCRgaqZVmjZL?=
 =?us-ascii?Q?DY42HRm1rrQrr+QV4HCT8Q1ms/u0hvgO/5Ly8/fxEs8JemPaccYl99xGa/Ul?=
 =?us-ascii?Q?MxGIMOyqUPlfXUht8+ZNEJVINWhazYwMTaOObwfbXgmbRSQYfUoCmvLVT7N6?=
 =?us-ascii?Q?LfbT1zJfLL6a7EtiYckEmk8j1bvU3DIsams3vc1hFM5dTHufOBtDVmjiLr/z?=
 =?us-ascii?Q?aCIP0fJ61e+Zfh0H8o3pmJTilIqXM9hgskmUmNgR+TX3tygTCtt+AW6Ze3nI?=
 =?us-ascii?Q?G4jIudWFRBDiE/a9dajgwuGadvNu0COmchWxYyzHDxvzhsdBot8I6CeeWFOV?=
 =?us-ascii?Q?62C/jPT7UqHooj2R+egmi6dWH4y5Ijxv5OuqG0Yc90O1brS5Hs5HOX6GunSh?=
 =?us-ascii?Q?ZdlTqQl/Dad8t51Q4C/T6aAWPTeG9BjWa++Fjr3P2HGFyhDQ2TLq8iSuMSTv?=
 =?us-ascii?Q?goAvFXdkQRcH55ZGc2wSGiq+nUo/YB0elP83j+7ujWqbyIyHhcQQ5pRbnC+r?=
 =?us-ascii?Q?eM8M5ordt4HuOhekvhAoXVXTN2m7NFiQ2K/EQt/32wNAQSgAOkAsWGUgc1jp?=
 =?us-ascii?Q?Bo9W60+n+BiC61udcQ9FY2RX87YkLDIEBXKNZ762bhH8uBg1kFwkmLTecwEm?=
 =?us-ascii?Q?TyVXBlXHwYzGwThMPTVpltffWe896TC/ehCAoNvoVDzDeklNYIR9VVeVbxii?=
 =?us-ascii?Q?FAulqfiyCMq4vQ5Efy5VS79RyypATadC0jvzHQ4Tbtnmy+h1vGuJfzzBdB1S?=
 =?us-ascii?Q?eXGi+JxmRQlbuMhpiCggWJddVVR2XbMpnPKdRnaiZF2T0aM03i887Sip00Qe?=
 =?us-ascii?Q?CIQKocTmhFirNyS9Zud1to0Insmx6bmLhfnLEo1dV+IO80H02FNCLJRu70Oi?=
 =?us-ascii?Q?VxpIlfOjuo018k9wOJx5PQPT83tWAxLVlcSzoRBqyK5DTtYgkP6AMC3r9VRD?=
 =?us-ascii?Q?OPeS7mEhMyAOPgFaFRCKcdCgICxSV8edyQn6hI0y69vNIRNFzhR5sY+QP1dW?=
 =?us-ascii?Q?XUNkUZEG4qQ7QnT2fJ7U/PbGn9ROhHNAl/OQzBVRF1GAF7xkrh6UPPm5MZqW?=
 =?us-ascii?Q?9YdgYLUQ5pn3GEge1xROO4qSDXxKmlUmv1/OHdlf8C/ygvEOWoZtdz6NTnn4?=
 =?us-ascii?Q?5UW4MuhqevLfCu90S68H780Hs/MgTY1XBUd3iCcq/QH1hxBQA6l0fBqNHNlJ?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6efa04f0-4258-4abe-1c8d-08da841146f4
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:38:16.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1Wbv/OP5GHGIZ7OnLjGNqrL/W2mxhC293BhJQgRfO5b0+7l1pQmfLFc4wEUtmdlBr9v6T2kF4DpDdVncLMiv5BpLb79gOqgKtkh8qGOeAfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 07:38:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98353

On Wed, Aug 17, 2022 at 01:43:06PM +0200, Andrei Gherzan via lists.openembedded.org wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>

Hi Andrei,

thanks for the series. I've just applied them to master-next. As soon as
some testing happened I will merge them to master.

If you have any question please just drop me a line.

regards;rl

> 
> This will make it easier to maintain reflecting the same distro check on
> packages depending on classpath (in the dependency chain).
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-core/classpath/classpath-features-check.inc | 6 ++++++
>  recipes-core/classpath/classpath_0.99.bb            | 4 +---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-core/classpath/classpath-features-check.inc
> 
> diff --git a/recipes-core/classpath/classpath-features-check.inc b/recipes-core/classpath/classpath-features-check.inc
> new file mode 100644
> index 0000000..c238fc3
> --- /dev/null
> +++ b/recipes-core/classpath/classpath-features-check.inc
> @@ -0,0 +1,6 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: Apache-2.0
> +
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
> index 5b9d904..f18ad1d 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -1,8 +1,6 @@
>  require classpath.inc
>  
> -inherit features_check
> -
> -REQUIRED_DISTRO_FEATURES = "x11"
> +include classpath-features-check.inc
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=92acc79f1f429143f4624d07b253702a"
>  
> -- 
> 2.25.1
> 

