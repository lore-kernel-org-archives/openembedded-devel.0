Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775B7D43349
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 11:08:24 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.75])
 by mx.groups.io with SMTP id smtpd.web10.69573.1730977701810007810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 03:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=B8D6Znic;
 spf=pass (domain: prevas.dk, ip: 40.107.249.75, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl8nj9TYZCf7lI8btSH14gobbzpxXNiKnvCSzT5cyjfZOArqlX8vPqKHwEmX+acwS0ZWbJ6c3xfyscX6Un2kxBM/giNToVHA2eednEjllAI+YXET3iIFpagug/mvRqES/tXao3qZEIZJo71uD5OwtaaeV7m//yoU1n5+QpGByJWyJeGWhKqOzwi2ys/BpECmjYZIZBqFlsjAGoua+R8XAy5PxV5PI51DaTQi9tD1sBuVMHyaPbek5pcDdP6vNDrOiQKm3y2uQl88gexZE7wZWtTihEWxTs/3k1xAB0HoX/q428DteT2vv9fPt7ZceEdIOLqxlFrBOEltjmLwurLuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3SvOmgfNFLXAOXshos+ABHjju+GsHaGwDIc+aufa9o=;
 b=FBlrnu56diDrhvHwJhDzUbgcLyjfvaEWpbeL5aXzhnNbmc9EKt5xS5gh8ixnubUwHDcQoiKYzFQISoD9EGcjGq/XJ+Vv95Ltc6kJJqqWhcvp+suvDDeaflm9wf/0S8IJg4VPgBEbIavdGSo3Z44oUGXsbwx7JZjMjKgQVIiEc79IYzpx6TqNTnZ/yDnKEvlTQEm7HPIVsDi4jXIrQ6eXhXktEWHI179qjAHCJan0DB9WA4LNglXdDC+5gjRa65RIQeZK7Sc50GYKBalToxMdQSEB0oeXObUfbbabcFfRdOlnreiCs/5Vj6/NiHnMQ5FevnxFgpUgtsGssc/SlQd2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3SvOmgfNFLXAOXshos+ABHjju+GsHaGwDIc+aufa9o=;
 b=B8D6ZnicmQHfAhdmYANURZDhZVDqlF8m1Ae/FGuWf4EOvkw+4+iHn2K+GMILiSpf59zbJo2mcm3raYBginW0tgkx6R0ZJorQw7imIqpVHzDMCHhJscL5l0PYAbQttbCn6tDniGMRkfzimGStiVqNezgP/OSRTAoSoGvG4ko1+2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by DUZPR10MB8266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 11:08:16 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 11:08:16 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org,  peng.zhang1.cn@windriver.com
Subject: Re: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
In-Reply-To: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com> (Peng via
	lists openembedded org Zhang's message of "Wed, 6 Nov 2024 19:03:11
	+0800")
References: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
Date: Thu, 07 Nov 2024 12:08:22 +0100
Message-ID: <87fro3gv2x.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0052.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::33) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|DUZPR10MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ef7ee6-6ac5-4831-dfbf-08dcff1c7a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AbVVYXfHBdwozRfzLKBDf7ZOw7o//cYBFOru/Xq6xB4rKHQyi5JST/eESZvG?=
 =?us-ascii?Q?3ZMS7HbXSRiIs0TQZvEuXLDCJC0S667NIAiXcwcFmVol0Do0nAxWz+H8esti?=
 =?us-ascii?Q?70uR9/5Cm896I4uOynt1RZtXV2bR+ds2+J9Pju0rmm+IX0kFuVsyBQ2utydr?=
 =?us-ascii?Q?5epbwAQV56uOeO9BhSBsQtYbK+pCqwRiQVtbvIFuwF92/AgXm28/PQn9Qd2e?=
 =?us-ascii?Q?/W3jxe8JGzIxnoskHCi5oxNjYxSQA8BT6sauu67MYR5gZnv5yl0gc+oqtr+0?=
 =?us-ascii?Q?E8YAWlokkCGtJMORULTtzDCbFuvN8zZ/CrRI/OoKCjInSqJDgm9QZIfZiWZ9?=
 =?us-ascii?Q?cEPNEij88EkyNdwSXzCPxNe7PeAkNFdokj3o86gZ3BVX0WpWEHbaos88/FNO?=
 =?us-ascii?Q?rqtWLB5OafYPc3bfyztDYARiKoQckq+wfpyZABnOFEa3SojWgJOtzasPFYsE?=
 =?us-ascii?Q?+/IBhmS7Dde2MhQV1rRAveRJcG08IfvpNGCJUWA24kD4ni2pyf4/qnBKZctf?=
 =?us-ascii?Q?0SuykBgqv90yK6donIimy0HcI1WcvItWgkANtWqDVpAjAoP+7EJy76ZnsnHD?=
 =?us-ascii?Q?t4npvLvkAlFmelu5QyO3fchxh1gExwgG87glC+/JJiNl1GpVVvWjJWXw5rpX?=
 =?us-ascii?Q?PHiAPVZQ1U9LLmc8vt9n1Pd8ot6AJ2uXlTi/uz2CLBOkUpxXYlosjk5VGaBn?=
 =?us-ascii?Q?qNAKTlPwVozdK/kXaaQ2nzJ4RhL9xOJSgX0uw44k2SUiz71YbYja6A1ePm3f?=
 =?us-ascii?Q?DtHxr2WbnQLxc/tgD2zrtRfdDrgun2bXqTrzkdN03BNC9pvOpZBX5aECU1gf?=
 =?us-ascii?Q?3UMOgt4VmIHzrvAjQO/PU90N0cIKaNPteQQSUIE/tIaqVzs1+q+mQFi0gA92?=
 =?us-ascii?Q?tPS/9tK3SOunvRtwFA0YON0/TBqErbXA3L6BXeKI0Iesn1TIBZRCZ4JuuXj5?=
 =?us-ascii?Q?Z6DShSwKzJ+Ekico/0lvPUfpJpjqWvjtYLVwEQRkLKY85PlGvkdzNwJVA1l3?=
 =?us-ascii?Q?ibjJlTyyoHxvJ5efcmFiIA1nxMqqJFxLl0hir+T6FSl9YfK0Vb15czwzih8i?=
 =?us-ascii?Q?lU3IqPflWBny72ju0o9LQU3qd4GGy0vRBNJphliS7wkkc/NgVX7GHjbxpM1P?=
 =?us-ascii?Q?IlUrEvmRX8wOr1q1UblnehMK34QREChElPtnTet6ngCPjcpwTVRQ6SX5WCxk?=
 =?us-ascii?Q?HtvIuoAXFGqQDgprL4w9IuSjOwB82btEogxish8o+k2HDdJblm6AEhXCldfq?=
 =?us-ascii?Q?wEqUrE8gjh53/sRpJcMj/Ow5NpMpO9Py8iILcfUJVxQkToYkZw/i5rOZRt+n?=
 =?us-ascii?Q?XY6svasIuyNSZV3SpnPIrbN3bLnlIpzzKMJqGc7hcTy2dLXEZmH9VJENFRhO?=
 =?us-ascii?Q?M/aAP4Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?olMrPBCkgXj/Rn0B8rKeqq7ZFURrbH/zM5aHOb/trABF9MmZcDk9X6eY4jlb?=
 =?us-ascii?Q?5EX0nXbyhigybqB4OmDhXwpq2LpNuR8FuxBHkTBsg1j0ZnwhYDqRf8XM+kPl?=
 =?us-ascii?Q?ezdtH7WNpL5P+QSOKLGdz88+eGPhmRhuSfFFtjgqz+ulsa0VlLoUdiDj2bTc?=
 =?us-ascii?Q?Onisx7vcPhyZg37ojRrjwmh84kLS9lT+AXvfzXdFOHYBqS1Soc9zPLTy1GaA?=
 =?us-ascii?Q?O5GQ4RIYgFNpUrtIZRd+05t18/k3sIFtU09hGOUE0OVznU1KKg66517VQdsj?=
 =?us-ascii?Q?KCUt6AiP+2J7JlSjMbu9hseuEl+/uuN4qOBezI7i9SJPBCRwry8bxjqfNVSp?=
 =?us-ascii?Q?k3v1+uHOXIcn6eaPJyHqdxiLMMT2be691k5DZA1oIchCkKD1RzVZApZZxfso?=
 =?us-ascii?Q?1clOOc3sD1b9Xod7sjVAaH/ODVLDfcfmWagz79Vpv69pF2dplqhj7gWn5hNV?=
 =?us-ascii?Q?Wd0zsBpu55+ErdA9VCAMW4hT+nxOIzRaufkTmXh8Bv//5prOIp/x+cRA2sft?=
 =?us-ascii?Q?7w2gHVnvBThmTbeDAJiehA+uLgFeavWNSfMiVf1leHqmdB9NivUW0sLD8A68?=
 =?us-ascii?Q?kb4w1v3bxsrA715Rejdnzh2wFoMKMcSi99Oco1bQigdNI5vd1EG40jYnTcgr?=
 =?us-ascii?Q?9lua0s0CvEz7GgDh+ZNTWGCuWnZmk6xunQIxLCw2Th/BE+STyiUFb0jewRGs?=
 =?us-ascii?Q?7FtTllDG/Sx6MwXTkj12R3MJOXBsSFTm0otBoQJ9LVyLLMQeAYIcL381O6pT?=
 =?us-ascii?Q?9nNQEj7bWZRzXRnQ9lOzETs78fiHicYO9MmaUhR9yelfrC9787wwsiGHWZ/7?=
 =?us-ascii?Q?VK+z2xtLeGxp1fnfLc0iIOnwPfTohXQg8YsqmE4PfS0geUQoiPSmO13U+TuV?=
 =?us-ascii?Q?UwxfItS22PgYzwN58IxskguEN2J9Ofqia7SzBo7CKXkX2XBbLctkCaoJczDl?=
 =?us-ascii?Q?DTflZj6NuaFZrrwRokO0q9vKp0f04/r2nY4fzPHjpUusBn6sy6kQluByJyHT?=
 =?us-ascii?Q?5Ig75rn0TyGQL7LuOUb1wX2k3zAO2qPqgXLFDGI+752jerKn932n71Grlz8R?=
 =?us-ascii?Q?Bctb8DmZiU/2Hf39VlsqLDJ4+t9zdFynoo4kHrtYCsCpmRKvN//FfJScX0hB?=
 =?us-ascii?Q?fwWCohiVHEdY41VkhQnXAWtNOsYdLsLn7xVZvzoV9LCzxRQO+wEmIR8edd6X?=
 =?us-ascii?Q?KhblXGAeBJLuVAP95eZHCd0W56VxKuCWE8K6fCbu+Mt2AJ2WoytKWt6e54CF?=
 =?us-ascii?Q?IRRH8Ei3uwG1Shmh4kUnJiPYtBLQhuVcNXArDOO4Znb7dF5oWStt/RYTOR4a?=
 =?us-ascii?Q?5t4krJVf4h09nPrOP+JGyz+bKj7fuHmw8NEAiWgOfz0GDb7dvEXe18QX9mc+?=
 =?us-ascii?Q?jgs6/1JL3G59mmk+WH5zt457TYyO8bvf5Zo+NwP8PSaIhS5FA0fbDj/qmd8+?=
 =?us-ascii?Q?/JPjX1BsfF1c0G6/7QeQNA6uDw75iqTXGvUs/qLAEpAk7EHekIEtfVMY5AJw?=
 =?us-ascii?Q?7wkcU/ksrRUK2RCYdfmRRDaJnS9BXUnx1OLZiESOvFi8fDT7CkjFDKLUO+zw?=
 =?us-ascii?Q?u57/qQODHoNwR5ZPItlX/M9SIbLFbX9bX+XEwkktw7j+SNQw9pjR3L1xRO7h?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ef7ee6-6ac5-4831-dfbf-08dcff1c7a75
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 11:08:15.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6ze9NqmC5+qZc26HNbo9yxUysxq2/tINDx3f45fyBPPX0WxYfJUlJSh1JaAv21mS0kFQjX0+y8Z3hhjWNr1ILUAyrQi+YuvQQ39ds/xHZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8266
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 11:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113748

On Wed, Nov 06 2024, "Zhang, Peng (Paul) (CN) via lists.openembedded.org" <peng.zhang1.cn=windriver.com@lists.openembedded.org> wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> This recipe adds the parallel package, a shell tool for executing jobs
> in parallel using one or more computers.
>
...
> +
> +inherit autotools bash-completion
> +
> +DEPENDS += "perl"
> +
> +RDEPENDS:${PN} += "perl \
> +        perl-module-ipc-open3 \
> +        perl-module-getopt-long \
> +        perl-module-file-temp \
> +        perl-module-filehandle \
> +        perl-module-file-glob \
> +"
> +do_install:append() {
> +    rm -rf ${D}${datadir}/zsh
> +}

Why remove this rather than just putting it in a package by itself, as
other recipes seem to deal with this.

PACKAGES =+ "${PN}-zsh-completion"
FILES:${PN}-zsh-completion = "${datadir}/zsh"

even saves a whole line :)

Otherwise, LGTM.

Rasmus

