Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D44C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 04:03:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5144.1702958621243336508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 20:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lYwjLgcC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0717b75427=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ3kWu7010181
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 04:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Zz6uweR+YY220Qj3tvqL4Hs0y6ZUnzdKEJmtXooCDp4=; b=
	lYwjLgcCWQR60nTqNjZMi35OvLw5fPqDvlMJopTPU8d6i23Uxpl5t5c0rV+igfXA
	958ByuvgmpIemvzAegtOphueupRkowtKT2hki3HQzMk5pd1yMu+NWw4/4qAbEa7J
	XqGwq1glOViXVmJJciyDGWuxRsxZxITaHS0yQfqpu2Qydvya1cIk3xqZUR5LiX3z
	pWtBNXW+1JwMhj7G81pfQ42vJ/rFDIWnIdGdFXrqUpNI3RAgLx+2Uv4xWeosb69q
	R066bHurGNYtURZjxz2bw2kHlk92QmRlBr64MGqM3/uqnpc5rYbMVnmNUd0m3TPx
	Ehx2Mih8VVAU6nC7lNkmpQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xat2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 04:03:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRIJ43SLdDWQoxt2m8KvF4cEE8Cc0aH0EFj0q6BitEAQS1J/KVh8i8Y2infPoqNHfmeTQSBsRSDJ3VZym5175vYJMIByLHLiUo34l0qSIwMD9lT/z+h+IwyCubiQf3J3B2JcM+IB5v6UvZppzJXfLiSG+4EvWICTbKlFdNRlvzDcB38BAYgMQLvAMLv93pPIBuk6oI2zpQcImCOSAtXLn3yQvsB/bmFNntuY9OhJeAyHv5mc28cLepVRSmt5rfrsyvwvPBfKUUHtAJQ+PNOeKtCUJwtYzvO3zFpBvNweJCFjDL4JRY6v/SIg3hORa2K6XJGb5mLZR6pm8H5WfO6oyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz6uweR+YY220Qj3tvqL4Hs0y6ZUnzdKEJmtXooCDp4=;
 b=GGVFsrWK1OYYSUNnWCQqkkNkzxiztZil+zNFTpK4DUF2f2QLEViHwLpEcf20pn8EWy1n3bwrdYyFnvvAZURf0zgOfRd18D1YzM4wM5+FPvaWAUWschrzNzR4WbKCPLoYQ+TxbsTaiRaGq0qzIL2eEos8TplzbaT4T6no2YIrY+JNtJFceLoNyNYEhznr+zOuvCnfWU7vJYR5sCvdQKqy/z6qqI+H/r3VRA1766FDEXwWNq7u+kAcmdfxdU6XHZrBmBk+8YRtawR8MSCxdcDczroLotFd4fk4VOlHAXn7TxzOJfFPRGxfkmL2Cw0VN8aAkxDcYDWDegVawg+rQf0iHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB5421.namprd11.prod.outlook.com (2603:10b6:5:398::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 04:03:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 04:03:36 +0000
Message-ID: <9c82828f-d9fd-45ea-991d-240e8f8f5579@windriver.com>
Date: Tue, 19 Dec 2023 12:03:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [V2][master][meta-oe][PATCH] cpuid: fix do_install
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <179DCC0EA5EB83D7.18076@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <179DCC0EA5EB83D7.18076@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 9764c915-14c4-430a-15f2-08dc00477966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FUZ+3TXEVAjzYQTwDlkK4RwuvyKSqw9MwraU9s/pziyObic1lMTkCW3zIFYhuIprVianXfPkmaRdZZwFD8svFvaQDCyPNY+vZJWD+Ga+9ZH/Fhe/Ed96nez9knCXsQOVl0fE47xWyexZed/2oKCRhaMEzW6mRkk6WmV+eFkD1gvVS+xRp+yI2CXbCDcxpZklOwvlihWl6v3VTg33Po0RmBBq0ZxwqkQz/Buz8F9AjcDwLD2qzVUtPgNX/T79ofUrmalQvCQxE8B/n++K3/YqO1tzUCcyoUPg7vlq27zwGSiDBvSFl3matlwFLEP3oyc+sOE475v0C0me4XzxqeEupfBUG5TAz7w7MVartYcXUXBcmXAQeK/FWZ9YdQibAVJOE2QNO4U0wvebRE+PlkuKqTqUc8/mKzseWTdjCd8glUM4bOOg4sA9kBmqkHd14mAc8f+TZ5itpwc9UxO3OI0sm94wRdiYxBZt4w8zdI9n0j2uWNY1YKiK5k3D+hkIYPD1nEI0WqXH+XGdKUIdLErFudd+1j4WZXZRHJIpiY7g718aU7zeqSr7P+xk6557sbHSS9LZ28PF5yE8Kmvd2U0KYvMcB0f1zPj4KqHMmoQV8Gh1+SMTPsi9tZ4/PRxxnoGd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39850400004)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(53546011)(2616005)(26005)(38100700002)(8676002)(8936002)(5660300002)(44832011)(41300700001)(2906002)(478600001)(966005)(6486002)(6506007)(6512007)(6666004)(66476007)(66556008)(66946007)(316002)(6916009)(36756003)(31696002)(86362001)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUVweEpkdXZ6T1ZyVytGOER1NkpQd3JhaEFXek1KREZNV2RBck9uZE9tNHVW?=
 =?utf-8?B?M1RUUHJZc01YY01iVW5MTnBkcTNYek9KdDlpbDNlRnE4WEtUbXJoWEpFV29Z?=
 =?utf-8?B?UjhhSGVGOVZGYzRTSlo1TFQvN0hLVGVId1BiUGt3NlpEenFUNE1XTWhsQUo1?=
 =?utf-8?B?NDZHMXNYRENlMFV6Wk5uNUlvd1hyaWF5SE1uRTVEcVNyY3MyYnl1N0tuc2FW?=
 =?utf-8?B?Z0xxdldjemg3ZXRGamI2S0FYM1ZadVZacnM4TFNEc0pnR3VsTDB6Sm1VSmVo?=
 =?utf-8?B?VlVtR2JWYU9kK2lvemNSaGlramxGemh6MHZ0cmtKMWd1S3pwaUN6ano2TXdn?=
 =?utf-8?B?V3RMTGFCbTVJK243eTNkSllneENFS3p5MzhmdUNrQU96UEdONnBGNzF0RkFj?=
 =?utf-8?B?R0Z5YWdHZEVNNXpCbVA3NEMzMHJZdldDald6OStsNWRzdWlOMEtHSVM4YWpU?=
 =?utf-8?B?MWlEYkNIM2dlUFhmRi9sVzA1QjFzTi9uSGt5TUg1NGs2WHpBNGE3RDZ6d09D?=
 =?utf-8?B?ejVHemFjSGlKdkVPdzdnZ3lXbUNqaHpOeDJaaWpzcVE4ZExiYWlSUnNCUDFW?=
 =?utf-8?B?T282OCtJZTdyZGgyUUJXcTFjU2VlOEdXdU5KekZBR1dGVS95d3RvQ1pGY0hN?=
 =?utf-8?B?VjBEZDQreVdpd3BMMTFXMnJJdU1yMVI1VXVBd3FFVUoySExObG9vUDY3OUxK?=
 =?utf-8?B?bmV5TTc2UGNlYTlabVRFaTJGSFlBdGt2cGpidkpBT0dNakRIcGh5Q3JQSDNK?=
 =?utf-8?B?SDZkK21JeS9mbXdwdlFFUHppd3hkbWtZUmJvZDRFbUl6TDF1RTlET2ZYSjlV?=
 =?utf-8?B?NDBKWFV4OGdUcTJnMlI0VWV5bDBWVk1uRlZId2lLaWd0d1dpY2ROS0JnTkhw?=
 =?utf-8?B?dExoTUhWUkU5SFR0T0xnZGVJdm52Q1hwUGtOV0JUT1ZwcVg0SFQ3dCsvQ3RN?=
 =?utf-8?B?Q1dNZFB5U2hvYTBmUHQ1SnF0OTJSbVBGMnhHUVcydmFhTXVML3VOVzE4eGoy?=
 =?utf-8?B?VjFFcTk2eU9Pb05nTHVqdXN4dW8zYkFLL2FMaHdJNFVocm5LWG8xZURQNTRu?=
 =?utf-8?B?MXZIVWNuVTJDTFdNdy9mclJTaXFlTVpDTnlZWHp0SUFxL1htNFVDZDZ3aUJp?=
 =?utf-8?B?YmFUY3RPSU0zdFdaWnd5SHExc29UbXY4d2srS2RoQXhDNS9Ta1BvdnBSVW83?=
 =?utf-8?B?cnhHdGZJZU51U2ljais3aDFaR29qZWRxbDJGUmF1L0JIby94MFpBN29vUjVU?=
 =?utf-8?B?aXhJNjNHLzQ5dWtsYkJGQ2RlVGVKcEJUcURhVTRxSkthUU0rZDRreU9BVkxE?=
 =?utf-8?B?WFVXUWxpdmJ6cEFGTWlxUmxwRHNjQWhyM1RyUjRZdjE0QlVaUmFRM3laNXZw?=
 =?utf-8?B?R0Q3WkMzdWszc0xqVHl2NjJ2M3pDTng0NTRsaWcxMmZPc3pDVGtoajhrQy9i?=
 =?utf-8?B?UmsvSjJpUTkvNzZacisvd3B5OW1rcEJyRVp5QkJIUVg0YnJ5NFNnRXFSUWty?=
 =?utf-8?B?ZkpORlNVQ09RNlpBS29oWTVTRGh1RnFQK0lsd2JMa3Y0ZE5EZlBDRHlZYlNi?=
 =?utf-8?B?U1JxNzEwbHhKYVB3Y2ptbWowdGpKbXdSY2hBRWJKK2pRNXpQcEFBM3V4SXlq?=
 =?utf-8?B?SXNQS3V5TE5DVUl3ZmNIYW5VRUp1eWkzZ29Rdmo4M3F4cXBVUkVpZklUTWgv?=
 =?utf-8?B?a2w3RkRmWEc1SGJpSTVsUDVwM0ZISjZ6M1p2SW9kcGFTN0VHT2dqcUR6WnY2?=
 =?utf-8?B?L25TSkJSblhQTWZwdUdnRmxYczl6VXBwMTc2czRBSEpIamJhOHVNUisrMDlv?=
 =?utf-8?B?bkkzYm1tZHgxZDcvRzhZYXJ0bjlWK1JSSDJlakQ4Y21DNnJRbXZHM005bHR2?=
 =?utf-8?B?dUY4aWJWWTVHQXI5NWhOOC9NUll3RXg1TGQxc05XT0RNcCtWRW9kTXBFWkov?=
 =?utf-8?B?b3RoazExYWdwbmFBSWw2dk5STkxuUjBNcWVvVmwxczg0ZjhpWWJlTExMd293?=
 =?utf-8?B?NjZqbExrLzM1NG9mdlN5R0FPMmtXQytHVVkydDFYNC96Y1dnYzNMakw1M1Vr?=
 =?utf-8?B?ZU5sSGJlR3BQYk4zdEFwRmV2NFlLVlk5ejluSkVnbTBiUmZSb0htSWdjUC96?=
 =?utf-8?B?Z3Ayd2VqOUZuOUVKeXR6aDV1WFVoeEdkVE1TL05VVzhPWFB6U1hYYkI4Y00w?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9764c915-14c4-430a-15f2-08dc00477966
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 04:03:36.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvxQtlXOCXztuY9kRSgAdt5VwPwn/e6SG+6/iOOoXn3ZN4oAmsp6zIgOGcFbh8K2Ccx/GL5OuSzIC/Ua8iCLW6/lZNTnNAQqqNSksNAUwuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5421
X-Proofpoint-ORIG-GUID: ZliZLRR_7VtbZHcXUFBHiOktNmpL3GZc
X-Proofpoint-GUID: ZliZLRR_7VtbZHcXUFBHiOktNmpL3GZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=824 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 04:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107554

ping

On 12/5/23 09:43, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix do_install to make cpuid-doc installed correctly
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../recipes-devtools/cpuid/cpuid_20230614.bb  | 10 +++---
>   ...e-the-hardcode-path-to-bindir-mandir.patch | 36 +++++++++++++++++++
>   2 files changed, 42 insertions(+), 4 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
>
> diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
> index a88042ba65..ed339e0160 100644
> --- a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
> +++ b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
> @@ -8,6 +8,7 @@ LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
> +           file://0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch \
>              "
>   SRC_URI[sha256sum] = "b1c83045efc26076307751e0662d580277f5f9bf89cf027231a7812003c3a4e8"
>   
> @@ -15,9 +16,10 @@ COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>   
>   inherit perlnative
>   
> -# The install rule from the Makefile has hardcoded paths, so we duplicate
> -# the actions to accommodate different paths.
>   do_install () {
> -    install -D -m 0755 ${B}/cpuid ${D}/${bindir}/cpuid
> -    install -D -m 0444 ${B}/cpuid.man.gz ${D}/${mandir}
> +    oe_runmake DESTDIR=${D} bindir=${bindir} mandir=${mandir} install
>   }
> +
> +RDEPENDS:${PN} = "perl"
> +
> +INSANE_SKIP:${PN} += "already-stripped"
> diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
> new file mode 100644
> index 0000000000..43486338a7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
> @@ -0,0 +1,36 @@
> +From 1339348c5b69b32378a638d65b16297d29c5fa22 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 7 Nov 2023 16:06:49 +0800
> +Subject: [PATCH] Makefile: update the hardcode path to bindir/mandir
> +
> +Update the hardcode path to bindir/mandir
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 828d2b1..365e26d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -55,10 +55,10 @@ cpuinfo2cpuid.man.gz: cpuinfo2cpuid.man
> + 	gzip < $< > $@
> +
> + install: $(PROG) $(PROG).man.gz cpuinfo2cpuid cpuinfo2cpuid.man.gz
> +-	install -D $(INSTALL_STRIP) -m 755 $(PROG) $(BUILDROOT)/usr/bin/$(PROG)
> +-	install -D -m 444 $(PROG).man.gz       $(BUILDROOT)/usr/share/man/man1/$(PROG).1.gz
> +-	install -D -m 755 cpuinfo2cpuid        $(BUILDROOT)/usr/bin/cpuinfo2cpuid
> +-	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)/usr/share/man/man1/cpuinfo2cpuid.1.gz
> ++	install -D $(INSTALL_STRIP) -m 755 $(PROG) $(BUILDROOT)${bindir}/$(PROG)
> ++	install -D -m 444 $(PROG).man.gz       $(BUILDROOT)${mandir}/man1/$(PROG).1.gz
> ++	install -D -m 755 cpuinfo2cpuid        $(BUILDROOT)${bindir}/cpuinfo2cpuid
> ++	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)${mandir}/man1/cpuinfo2cpuid.1.gz
> +
> + clean:
> + 	rm -f $(PROG) $(PROG).i386 $(PROG).x86_64
> +--
> +2.25.1
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107218): https://lists.openembedded.org/g/openembedded-devel/message/107218
> Mute This Topic: https://lists.openembedded.org/mt/102984335/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

