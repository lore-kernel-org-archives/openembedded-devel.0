Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23502C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 19:02:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.54266.1669402945480413852
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 11:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=E7pCG3kC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8328117f31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APJ0B3p009396
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=uO3L3SwGlEZpa9nnqwsRGNw+BMdqUyBkRQJJdjKXdcI=;
 b=E7pCG3kCfhcaACQL1k7MNiPyuIQpaoRIHjTccOAZDg3drHV0yYEqnSa2Ftl1GxJuBDaU
 7piKcNe8v9OkRUIPl+ACQ/Gn9/yyTwNMC8rHGaLykklq6tl4k4XeWZxqXqT+FNVwLkEG
 NExKbSYx9Qvt7eVxPyHCvBxbifGKNj7miqfBn92152O9/G7vGFbLSlPh/SxT68XqTN8Q
 5xSBE7Xw/tXBgmGad6lNGk9akNEoq7Frjl/s9JSXPQxgUAOpWgGS9+hB300DW68054uk
 e4oGS5t4oqfPn1BaNczuDKTYNUfLadoTjz8jOaqQENAMCrG6UV7Gi1x23D8Ub1z9YoY1 Kw== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48n6v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B22i0XdGCNbVownUclBCx+ccGlnf2lOTGcB9lme8jyR2wGn/PwH606178cpSywblhCeEa7zg/igUDwL1wDLYL0n79slXX/O91Ha0+b4Fm1CZFj8yUHbJIik1cZaFCdU/OmJneVRul4KzNgUTen2S0jO8/q6KB/cFbeARHZIytir9jN7B2JDgFza8TbMagxtZEQrAcdQgMBTTHQ9p14L4YD0Ewj+FEMhmIeSXwdJy906K2PRVhV1l4O+yIVBWgU/PQ5QvItnIK9mYoGY9qUQvS1n8YQQ72OOuQvHcKK+JJxTffoVpf7L0iWQiwQCjw7UtVO/XJDNfehTOC3Qci0tR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO3L3SwGlEZpa9nnqwsRGNw+BMdqUyBkRQJJdjKXdcI=;
 b=WRSrs0T1IPFhW/2OdKVHMneIdfV4PABQdCkO3kYPjUPjhq/Q04dbsXT6Woz0IgwlCixNO2rr90+Gc8ekQeIsNdxGVpMrDt6GfBCpLOUDtb0s4PWoi4IuR61/kJtrackr3qVWRibpNqDjkje9XP40UN/J3DxJGz/W4J+hRU3BrpdQjlHZC50Ym4BRUgb2dkxHw5N0EIOJYQK1z8dWR2cX3dzWcDt4uq/9ayi2LvWxVmel+Je9SzulnL+7AhAyeq9rSf2IXl/As5fJFkZtzVnoAU5h8S/vqJqAQ+zAId+fksyl4VGTHgKwhNOCVP47YhJoPKxamcOAlQJU3R6QRMi9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 19:02:21 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 19:02:21 +0000
Message-ID: <baf5d0de-4416-765b-2dce-117fc97e7916@windriver.com>
Date: Fri, 25 Nov 2022 14:02:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [master][PATCH] python3-inotify: add ptest -> v2 please
Content-Language: en-CA
To: Zheng Qiu <zheng.qiu@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20221125171044.3649193-1-zheng.qiu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221125171044.3649193-1-zheng.qiu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d3120a-69a8-4e1a-9f7e-08dacf1794bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BEHOoQ0h3YrPSCpEdfXa9RrVonOkxY7VeTh14ZDPDtHRiweeC+bsXALl+efK98XwJxL/eAMAf7bZr8Q0RZwAp2xnu6uyUSddwaUmA38l9iTonC8wkaXoXaOf+NBfw/+9kAHafdRjrO+7Rc5ZNa5WGWK0wdPcDScr0IozNB+ujm7b+qqQgkKEHndqBc+APYdrJzfgaSIujXWmmCGVD01+AHmlOkQT3HnP4+p/DN0tB/KnNBQyrn7cg19J8jXOLJlxa+PCPWJpGSLD1ip96O3bTU580wd6OA3Oy8QeFNrfG6IfMwbzqR6YXl/m+iAPb4zcZE8O1GZPa4O+6WM/i+enaeNjII5XfMzpDXP+JxRFY7efcAaFtlwm7N23Dxe2UjhnBgD8I1BP9Vf8sFuYX39rjYiG6iqBqtv0u1QrzMd/gz3byysR+zYWFO6xXmc8kUB54czASDbjgvmYygaKoxOA6SagSOAaIBTZAJDRxJkj2cY8nAWpkltLy2KJT6FCherqK5zqgCO6rqXzM7x7i5xa+rAWfVjWsGa+4Q4vh19YXUXXoLc55sTO6NiTYts5MigFU5xJqED8iadcuGJrKqeENJ6FVdJ53EH4kbCQ1E8ucObAk7DXf2+93glyItrauaQOZKIyBqGa2TQubvWJ4f78YrhUqjiE6GH9Dk6UsRuUpGVAiucJT0GUOoGa4j8BX6sR6iAYWgFg194LgHuTiMRCiQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(451199015)(186003)(2616005)(6506007)(53546011)(26005)(6512007)(6666004)(5660300002)(8936002)(36756003)(4001150100001)(41300700001)(86362001)(31696002)(316002)(8676002)(66476007)(66556008)(66946007)(6486002)(478600001)(38100700002)(31686004)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1RURWFOaW9qY09RaWYxTEpGUXcydlFuMThPNmk5SDBDTzQwK3NGek82WHd5?=
 =?utf-8?B?R2trNHpTSlpTZlBBcDk3N3pDQUQzMWJUVVExUGF6bk9YNU9BeFdvR251emNr?=
 =?utf-8?B?dzg5aldmNFYvSGVUNmcrTjVqUkxxcmh1bUphRWxOcklzSGdOUGpZbTIvLytU?=
 =?utf-8?B?dnlucmdGWTF4dDFiM29HWlFpQ1BxVUZNSUxGTnBLY3dFL0pUYjBxMlphY1U3?=
 =?utf-8?B?YW9rRkxaZVRiM3FLZmJyVjRYMTlseGxPeVlnbWE2d3o0dXVWTTh4NHc3NlU3?=
 =?utf-8?B?OWlUUFFrQ0E2OUl3Q2t6MWEyaG05VXgwLzZ4V0RKRFNkMTFISWlydXhHc2h3?=
 =?utf-8?B?RXlSNXhjOEgzRTFVa0tTSGltaUQxN295OW9rMG8wNkQwLytubTBsMU53VnRK?=
 =?utf-8?B?NUtYbjl5djR5WFNNWFVhQk4wMDJRU2YvZ1ZJaTZNRXFxQXFFLzA3UUlyNEE5?=
 =?utf-8?B?Rm9tY2tYcVFmL1FXOFg2VitnR3hzRnFZajRvcTh5V1M1NmlnZ1l6aDhVMUxk?=
 =?utf-8?B?TDN1RUF2MHVFZDAwMUxVek10cTRBTmFsa0lQbC81YVNXbVhTa0RuZ3FwUTVG?=
 =?utf-8?B?WEEwWjRLc1NOU2RBSERZaUxuY0FYSTVtdkl6Nk1XSXpVRkhtdkJaT2VNMlFo?=
 =?utf-8?B?UkwyNkdXVmZTUWpvQ1BCYW9PV0VXcmRXdElvQ1hsUVU1KzB5T1lQQW1BUFFZ?=
 =?utf-8?B?Z3hIVklZc3ZxbThaRTlOaVVpRXNBQ2UrRTluQXJobU1LMTZSVkhvOEhNS0V0?=
 =?utf-8?B?UURseGhRcFd2cDZUS2dlbXV3Wlkybkt1RVp1RjNLNnlBWktGcWxLeDhzQmMz?=
 =?utf-8?B?Y0tvVjZiazkwRzJHdUdXT2FLWjdhUGFnRlk4NThzNUE1R2tVVTFYczQ3ZU1W?=
 =?utf-8?B?RmZiTlRySDltUHJRdDNob2JwUzNSb3lSRjJDSmU2dUZUdk1GWjh4WU1Kd0tN?=
 =?utf-8?B?aDhjbDRhUVF3TGFsd1k4TXVWcmVna2ZsWTZIUzltcUo0VHV0ZlVqTlFHd05M?=
 =?utf-8?B?eFA4NjgwUkFYNHpYL2dHTTI1M29IY1NaS0poVVd4S1dFMTBPOHZBeVphbWRq?=
 =?utf-8?B?MklyRVpQRFE0alcvT3Y1TEVTWnMvR0RKYUVNejgxM2pnMHQxOHR6aTN3b0dv?=
 =?utf-8?B?TkpkUVlONklndy9vZHJ3enpYcUhRd2JCcURHL3N3NWJXSDZFb1MrOUJBcE9h?=
 =?utf-8?B?a1J3ZElJQjVOSnp3TWN5akwvd0VBYkZVdHg1b2NlMmhLOS9uWjVDUWlEV1I3?=
 =?utf-8?B?Y3N2cFV4Vmtia0ZHTkw3NjZYa0p3UmNIQUtrTFd0TVpJek9FdWFEUC9FSFR4?=
 =?utf-8?B?NWI3MlV0ZjZmT2l2ZDdHeDR6RFdNV0U0NjZOMWk5cHNjOUVqek1RVXZKMVJm?=
 =?utf-8?B?QkJORndpMlRmTzVSdlZZL1RxZXZnb0dRbEhXNDdRbjlGWG5XSVZWc3FBZUhT?=
 =?utf-8?B?ekZWalRYZGFxUHZwWm83UlY1RDNiZnJzaXZEL0lFRjh0NDRmOVZ3NC9YRGd5?=
 =?utf-8?B?ekhSYjBBSnZTWXpQb2VmczdUUCtYRkt1SWlRREIrNG1oeVdQcHUzSGZmdlVC?=
 =?utf-8?B?M1k5M09Nak9Ca2hxbDBzSVFsdVNJbXNrTlZXTHJ3dEpxYS9XZUVJZ29xV1VN?=
 =?utf-8?B?NnZEaXJicHY5SjcybDhVYm5vbTJLZlRpdGp0cFlESXZwYlVoL3JDN2p6eWNT?=
 =?utf-8?B?VlVZSGdOWlZWUG9jR3E3SlFKci8zQXZGR1ErUkp3TkErdWhSODNFVmJQRy9z?=
 =?utf-8?B?MjVsUm5jUzhSdmdkK3l1b05tNWV0dlJZN0czakIyeDVXTlJ4aUFPYVZoajNY?=
 =?utf-8?B?YlVUak9ibkZ5WlZ2aU1VelN2Qis1UENabm56YVpTNEt2Lyt2MVgrMFNmVVlT?=
 =?utf-8?B?MjU3a2xVTVVwY2EvVVRHY1FmTHpCcktYeFVMTVdDdTJxbzVhdTR2Rzc0b0tz?=
 =?utf-8?B?a0JQZGtVWTIxQzQ3ajdvOEdUT0Ribm9TS3lzdUxMU2Y4M0tKVWxieEh2QlVS?=
 =?utf-8?B?T2dTb0RJRUkzdlM0Y3dadG1oSUg3bDd6QkRnYzVTYkY5d2dWclRGdG5EellM?=
 =?utf-8?B?d1ZuZWZmVzFqby8zdFkxQ1llMVozQTJqYXJsQXNEY29RMFh6cVBkNEFMSEtZ?=
 =?utf-8?B?MFV2cTVjaUJHazZpZDlGSm1jQVIvTEhicVZVeWFoMk5EUUhoZTRrVzY0VVZz?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d3120a-69a8-4e1a-9f7e-08dacf1794bb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 19:02:21.3961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaRdI55gLDdZUAwBf00EKey63IRqJIASssnb05cXy3U+/7DHZy/7/6UsJgMYI+NcxS8GfpQVyORtW6vD7Djs/Tw/8XxuwyDxj1Zo2aJ4xNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
X-Proofpoint-GUID: xEQctAwQ2-pM7YQm-7vcOAwysdu0KxsU
X-Proofpoint-ORIG-GUID: xEQctAwQ2-pM7YQm-7vcOAwysdu0KxsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250147
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2APJ0B3p009396
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99738

On 2022-11-25 12:10, Zheng Qiu wrote:
> Add ptest provided from the source code, and run it using pytest.
Super, can you add the ptest result summary in this log.
If any of the tests are failing also add upstream issue links.
>
> Since the tarball provided with pypi does not include ptest, switch the
s/does not include ptest/does not include the test code/
> source to be its git repo.
>
> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> ---
>   .../python/python3-inotify/run-ptest          |  3 +++
>   .../python/python3-inotify_0.2.10.bb          | 23 ++++++++++++++++++=
-
This should be renamed from python3-inotify_0.2.10.bb to
something like python3-inotify_git.bb
>   2 files changed, 25 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y/run-ptest
>
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
> index 524c3a0d2..3306438a1 100644
> --- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
> @@ -6,9 +6,30 @@ LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa=
0d446a552d3cceb5799e41;beginli
>  =20
>   SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680f=
c3e96ccdf0df6c02a07"
>  =20
> -inherit pypi setuptools3
> +SRC_URI =3D " \
> +    git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3D=
https \
> +    file://run-ptest \
> +"
> +
> +SRCREV =3D "f77596ae965e47124f38d7bd6587365924dcd8f7"
This is the current head, which is fine but add a note in the=C2=A0 long =
log
about that choice. It's
$ git log --oneline 0.2.10... | wc -l

14

commits ahead of 0.2.10


> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3 ptest
> +PIP_INSTALL_PACKAGE =3D "inotify"
> +PIP_INSTALL_DIST_PATH =3D "${S}/dist"
Mostly harmless, I suppose. Any pippy pythonistas want to comment/explain=
?
> +
>  =20
>   RDEPENDS:${PN} +=3D " \
>       python3-ctypes \
>       python3-logging \
>   "
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}

v2 please.

--=20
# Randy MacLeod
# Wind River Linux


