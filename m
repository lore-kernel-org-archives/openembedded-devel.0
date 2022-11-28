Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D461C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 16:23:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.122363.1669652602787313461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 08:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=C+HQUrWS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93313386db=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASFre3D032515
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 08:23:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=6O8vAW6VxNfJcT41KIIn5fGF6NXIt7f0qH0PvtQgqDk=;
 b=C+HQUrWSWqfxDO30x3jXdprbCE7TT23vdm1QOYEuJBWpoDYTtrbSLWcQwr0eKQYMK4Ek
 ZsS+71GMmHXcS1ZgO3F1sxNIxW+CqLbSnxePP2ss8ltxp0O4mk8KqzCg8xi4xumKWlhn
 G5+aguhiVQqBtEOnTg+V7AOC4PDxrsKe7vAYXMHb2Q6BOlNTtKlnMQDciWXw8fzutuxI
 1zGi9Xr8EJx+WrSE/26kI1NWyyHMrJYnpzSHsqKl49VVt1PojW+L5r/pecdlOrN/fd+g
 4tRBdtEoA1R9BKVjjF/FW42I9EZvgLwlVC96i8/88UHshIByk3RaDSsi/3HPovSqZtI/ yw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r9dmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 08:23:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg73pjlosEsObLYNyxxGHEM0tCCEYphDZ+lO1U/iKa5SaU3JGGKFEqSh0/vQUOOnVHLTi8iv2Pclrgi9CYOVbBjlawW/WEEDRpTxj+QrO7nOmFiQ1BNy/pN65xM1vQSgwlWMHuQv8IPCctKRox/OnyXSpMOS7nyCSKahPE9dG7cTb+k5ujAWqBe/KLV1oQhad5ovwoBx8qGt9/1RA1FqQ+l58Jw1tmAAbd7XLxrBltqxJ9nPtIdQv6q8wBDWPCZqazcIffUJeW3A3VcQUxwWq5WCViikd1dDZzR5ab3xsk63ZfrUXznJ2xFvgiHNs8cqqjB9F+wgzTIOr/kskwQv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O8vAW6VxNfJcT41KIIn5fGF6NXIt7f0qH0PvtQgqDk=;
 b=Q9WWJdbF9BK4DXyK3mcDJZDx1VWtlyWl7638Jg35NZE/CgH+F/hwmrMLX1ZVi7rl0lhNM+jqx+SdD9wj1b7E5OPT1kRHFwS2ptNIhStEna6231yL/EYHKVwEwzIsQNpO3cD5iIBEkWGdbJDq7W9m3+RrcdxJ7fe/JbwQemCW95kFgXWq+60njFKcEIwRKNlJubr6TYavwckdrkshQUHc6B8tMU5LdE/jlZxZLQLVTHh/HttD6mtRTCQqFcwaxGS7won7bUsWV+wgXInEnF5/yfF16WaeurWAvbG4vwnlH/AcBLy9XFLfuRKuMvooGPNNG5P3qcM1MVPfDDZhVVfITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 16:23:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 16:23:18 +0000
Message-ID: <b984c567-4673-0511-db3f-0bfb4d3d1081@windriver.com>
Date: Mon, 28 Nov 2022 11:23:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [master][PATCH v3] python3-inotify: add ptest -> LGTM
Content-Language: en-CA
To: Zheng Qiu <zheng.qiu@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20221128154457.3778874-1-zheng.qiu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221128154457.3778874-1-zheng.qiu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MW5PR11MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: e011bcec-5961-4128-65b3-08dad15cdc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	21Vr8h7d+t2ha4IxxYip/n/jpbtMF2jeF8sOzb8p8ZpjCYifdqdifL0BsgzZQNTTcY09ORtt5cQwtUQn8irdnH6nMertW0Yg+OQ4qY6/jIwa8qEUhAhyofVEAnr0tYoVXsTe6blru6dLHpRc13eevaxWdWGWqGVHZhIVl/Ry1XNUtw6gv9D17nsut0imwvV9a3xjwoPFTgEfE5N/hUkKgVdSZXkRjidajREcogxcQiXl3urz9DG3rZoRukOl53Wul3OJUvhTktT3G2Z6UD7VNsU/lIaHZ+J5dnnHYI9qsYElFWrAQEWpr0VheTCefxYO+REaxd9nYerk+S7svSXr4abyravJO76vUBkGwuz06zZmsK6pTtnGtzwOlJIcmbcG07KPOwxNy+SFyZkmJt3s7m40pv8ZlbQOwGw4KPf07X2Jaj1GgZcdoIbZ4igRSIGsE/5OipJin8aExWMNODzLOLJwSz/bKvmqJdbmRe16BygFGyTr+YUJmlvxiK4jPlV8sdDFRavWDVJ5NQwondFfqlJBzMinKYF4Jn++wvzJ2ZMO0FpBbuSIW7pWWfqm92GZXfDzPaqOs21a+Qcyifn+g53XjMAp3Azy6CxnzLqB9N4QO5YIwE4AyHqJrFuT5uZI/RIOc0R7SNCXA8R/xihnjRqHdUa57H1HHWNXS6i2kL8ciyH+BHErAjGLyPzVXKtvL6RJs6kFh0iWCHclGpfnBfeB/SPSJaIpRsum36UKxi0FWn66dkyeqtqp3Mmyg1ZiX+TbeW86UF41nf9jD1DjlyIc/YQSyFX7U5cFOxyB0Yw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(136003)(346002)(396003)(366004)(451199015)(4001150100001)(2906002)(31686004)(41300700001)(66476007)(36756003)(186003)(66556008)(66946007)(8676002)(316002)(8936002)(5660300002)(2616005)(26005)(86362001)(6512007)(6486002)(966005)(6666004)(478600001)(6506007)(53546011)(31696002)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFdWSXFISUlkN29NM1FPSmovZjJQOU4xTGtqTVA3L2NVa3B4TWhMTlgwWHlL?=
 =?utf-8?B?R002cTZEWFQvM3pFOE5OM1F3OVpqZ3NWK21VellYUm1mRTlPd0pOaGhpclNJ?=
 =?utf-8?B?V21FK2ZHL0gxbDYzNVN1MnphMWpNZjBiVHE2TTF2SDJvVmNlU1U4Q1luRGJq?=
 =?utf-8?B?TE5kN21rRkRYdjN2NVlIRlVKRlVoUmt2MEZNOUVEcUkxVElNenY1ZXBEdGZT?=
 =?utf-8?B?RnNzck5EVUlINGpsRmxFT2haY2FuYm1xTGFNUzRJRXBtRlZLSkJMM08rUi9n?=
 =?utf-8?B?ZzdWZ1pYOHNUR0gvSmw5QlZScWxQNUIrWExLRFJsakIyeE42MURpTnk1ei91?=
 =?utf-8?B?aXp2YlVORlpJMlRkSUFlOXhhQU42dGxaOGo0UTY5NXVmbm9rKzJ1Ny9mczNr?=
 =?utf-8?B?UEYveEE0Z2RpNXVnR0xMdnhwOXpCdExOeEZyeEVRNFk2em5tY0d1cWtxQlk5?=
 =?utf-8?B?L3JnY3FES085RGdTdjVKL1oyeFE4UG9ucE9ZVkROck83R2FpaG8vS24zN1VF?=
 =?utf-8?B?NE9oVyt2UVhDazdJeHdOUFM1bUxycHZjbzVFODJic0lRVkRQcXoxbWd1cEU5?=
 =?utf-8?B?OVB6dExoWWZCMkNzUUg3alZ0Mko3OTd4RTYwdWNCQ2hzZ2dpeHdlNmlRWEZN?=
 =?utf-8?B?aTQ4b1NaaGtWaEtlUVNzcUxySU9PdWlZUnMraCtUcDdEdmZHQ1kybzBOWDdH?=
 =?utf-8?B?L1hQZkh3ejVpWHlienJIWk9jT0lSSVpzZ0FtV256L1VCMGpENDlJcHFaU1ZM?=
 =?utf-8?B?NGpPeG5ZYmE1eG9IdnJNUC94cmJrcWRXa1MrQXpEeW0yK1kzYitzbHJsbURE?=
 =?utf-8?B?ZFE1RnhnQVh0UUdWWEVhcmJLQkNCVU5SUHh0WWZPTTBRbUNyWVlRMFVHV1VD?=
 =?utf-8?B?VHRwclllcE5Kd0JJUzlRSE9ldkZSaWJRSXU1UlB0YU1sK0hNbVgxdEdUWkNX?=
 =?utf-8?B?ZmUvYjhyeXNLc1BBbWhwRlFQSk5ET3Fmcm1xZmtlOXJoYWIwY0c3M21oQmhj?=
 =?utf-8?B?b3Z3b0JqSFV1TkdtcEE5RmFtSnNtUkU1OFlQUldsdlVYa1B1d3E4TnZjaExw?=
 =?utf-8?B?ZVNZTmlCdXFLczBpdXB1N2IrTmkvWjMyam5BVk1JY1VneUtHOVN2aFNwMFlL?=
 =?utf-8?B?RzlzcXdCcTRndWZZYytwVWZtc28yQ3NvYk9CVXBVWmhvSjc1aG11RDRmOUk1?=
 =?utf-8?B?dTZLRjFjOUx6VDF0elYzV0ZOMkF2SlVyV1VkSmNHNGs4Qlduek45TFVmaG1O?=
 =?utf-8?B?NGZrNzhjL2VtT0Y1Q3N1c05mYitwNllvdVBxcVFpNi9IWWNmbUdNMlFNVDVR?=
 =?utf-8?B?NGhxNkJBVUsyOHFFZTV6cW91bzdKUjVCRnp3OXNpYkRoSXZuU0hSMlJxUzd0?=
 =?utf-8?B?dnhBa3hqSmdDY3FyeUxiVGJFWWxZbjN0QW1pQTljTGcrMU9HQTd2OWUyZFVK?=
 =?utf-8?B?ODlVQUZ4SjZ5dmw5UUYrTHFkdUt0WElTTzMvaDJXYlFnYTdZY2tNVGlCbWln?=
 =?utf-8?B?QlMzTlo4cFNEOWU0ZzJUMWxvVVA2KytuWmhpaENOQVFJNm1uK2wrWmZRWWZC?=
 =?utf-8?B?TUhCa08xcklXeHZ1anNSTVoxS040Z0E0RjdsVFQ2L1MrTDV4Y0hTZkhaQVQx?=
 =?utf-8?B?ZFJIUlVGdGxkdE11VzNIL3d3L2k3M1QvL05xa1RVdHAwaHRLOGJEeWtFK0NY?=
 =?utf-8?B?L2RYRmEvY1dhRnRqTDZkTUw5Ti9DT1loYjVHNTNyVkNaK2tVa3VqSExKZlZo?=
 =?utf-8?B?UENMa1dQQVpOR0pDZlpveWVjeDdBVVZpK04veFhVTUgrWktKZE9FMG5KYzcv?=
 =?utf-8?B?ait2cjl5UmthL21jT1pYTkRTeHhnMklBT0wyeFYwaDlGcG1xbDZScVNoZ09u?=
 =?utf-8?B?ZnJkZkpiWUdLeWpVV0Y2eC9sc1FjKzhYQ3pjUlFuTE1PRE1raWI2VC9pb0kx?=
 =?utf-8?B?ayt5NUlhSjY2bUFqbWJRMDdETnI5aGFRWnFJYmpGQk1jbmgyL2cxdU9JTktm?=
 =?utf-8?B?QUZPakZxeC9OWWVWdS91aVZkNVY2cHZQWWZOclZhNityQWxqOC9uclY5VWlz?=
 =?utf-8?B?VXFpZDFNOU90UklZbnk0VFh6M3VscFlsZVkzMlhjeTVkVVRXTnduMmhxM1Rp?=
 =?utf-8?B?dG1nYUlwcFZuK0YwUVZxSlA1ZFVyMjU2Mkp1S0lWRTg3a0FvZlVNK0lESUll?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e011bcec-5961-4128-65b3-08dad15cdc00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 16:23:18.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm01Xrsp7q+VIMfbU+tj1z2RBIMB/RAivbXiMz0ILl7k2DJfoMh0uIVTBVhNx4y9ZZDZx1KXXii9bWPSocv+SLMtRotEWXmpHgskHEg3YdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-Proofpoint-ORIG-GUID: eNSqaKFXG_Zl0VgNVcfnNmypHljNJdds
X-Proofpoint-GUID: eNSqaKFXG_Zl0VgNVcfnNmypHljNJdds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_14,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280121
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2ASFre3D032515
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 16:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99832

On 2022-11-28 10:44, Zheng Qiu wrote:
> Add ptest provided from the source code, and run it using pytest.
>=20
> Since the tarball provided with pypi does not include ptest, switch the
> source to be its git repo.
>=20
> ptest result:
>             PASS FAIL SKIP
> qemux86-64 5    3    1
> qemuarm64  5    3    1
>=20
> This issue exists since inotify adds unit test support, and it is
> reported here: https://github.com/dsoprea/PyInotify/issues/95
>=20
> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> ---
>   .../python/python3-inotify/run-ptest          |  3 ++
>   .../python/python3-inotify_0.2.10.bb          | 14 --------
>   .../python/python3-inotify_git.bb             | 35 ++++++++++++++++++=
+
>   3 files changed, 38 insertions(+), 14 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y_0.2.10.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y_git.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-pt=
est b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
> new file mode 100644
> index 000000000..3385d6893
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/=
SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" =
|| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{=
print}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP"=
 || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}=
'
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10=
.bb b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
> deleted file mode 100644
> index 524c3a0d2..000000000
> --- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "An adapter to Linux kernel support for inotify directory-=
watching."
> -AUTHOR =3D "Dustin Oprea"
> -HOMEPAGE =3D "https://pypi.org/project/inotify/"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa0d446a552d3cceb5=
799e41;beginline=3D28;endline=3D28"
> -
> -SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680fc=
3e96ccdf0df6c02a07"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS:${PN} +=3D " \
> -    python3-ctypes \
> -    python3-logging \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb=
 b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> new file mode 100644
> index 000000000..15fb92eed
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "An adapter to Linux kernel support for inotify directory-=
watching."
> +AUTHOR =3D "Dustin Oprea"
> +HOMEPAGE =3D "https://pypi.org/project/inotify/"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa0d446a552d3cceb5=
799e41;beginline=3D28;endline=3D28"
> +
> +SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680fc=
3e96ccdf0df6c02a07"
> +
> +SRC_URI =3D " \
> +    git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3D=
https \
> +    file://run-ptest \
> +"
> +
> +SRCREV =3D "9be6a51d1660991562eefaaddefa757ca0e0e00f"

This is the 2nd from top commit:

$=C2=A0git log --oneline -4
f77596a (HEAD -> master, origin/master, origin/HEAD) Add Dockerfile
9be6a51 Fix constant in adapter to match with DELETE events
269d541 etup.cfg: Add missing newline
8e79335 tests/test_inotify.py: Canonicalize import

We don't need the Dockerfile so that's fine.

> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3 ptest
> +PIP_INSTALL_PACKAGE =3D "inotify"
> +PIP_INSTALL_DIST_PATH =3D "${S}/dist"

Apparently needed so fine with me.

> +
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-ctypes \
> +    python3-logging \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}

--=20
# Randy MacLeod
# Wind River Linux


