Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA76C433F5
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 03:06:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6281.1651892782890850862
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 20:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aBllbc6z;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=21265ae91b=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24732fMg007863
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 6 May 2022 20:06:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=ZMZs/1VPwecyZk3pLD/joV+Pvx2lr4NTqFKGsMtzEIg=;
 b=aBllbc6zP9gMHGujoQOJuGmlNRno+8tby3kvOxKhAaWynB9X/zBIG26Sgzpu0QWYNUCD
 UxWSkm/r0c673enctlau00DDhHX+tyXklfk5LNjJETOqRDdWQ1uBDyx9Xfnx/uXzxlb5
 b6ZuBnrx9FaB6CabSaAaZu9jk+rUWStY9Ivr+LTcbbELW41ScEMxf2jsd+1FBn+5KHPf
 r1HSv0Az6ytsGkRyI3OA0bgX/8NHsBuSHILoHKcvHv09G4usameBttBSfXev40Nwvr5/
 dUkJWCjzCQCFLc2uq0xBQEtu8yQZahmQEMaGoII6iKCchRjut7AFUP8qHvaldLOC9hUY xw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fs0d3d18r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 20:06:22 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24736Lmv016059
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 6 May 2022 20:06:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fs0d3d18p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 May 2022 20:06:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm6zZG/y+RGjZ6AxEoqamG1DCdSvogZBlBh0Mi24EThEObsBnSX/A58Bc0wbKy5DPO4ELzLaWk1W+r8nMdDIisPA8nSVzgwsd4a3nlvFFzQqvROESjMTxycCExJc6aRopXuInmE7+eufGDVQVBedzkhId6VNXdp8OIRcDNM/IQ/jko5NCZUK/ytsiSor0512OmDS//jjqxJ+XP7NG3PRAj3UITmu86bJQPanxoHfxj4HxbQfsO3CAkdDRtaDbIJj5xuzSJOhHzth0rRE5Km1XxzoWHjWRfoEsGe7DeBGPR8xFAvJi0FFBws6wzobe9L/CC1M1wft54CP4rcNJj9U0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMZs/1VPwecyZk3pLD/joV+Pvx2lr4NTqFKGsMtzEIg=;
 b=IptdoMt0FjdcKFV4ukXVQaqEb0C10SMzYkFOatcoCNIcoj3Ze6fU0iJcxniI24vbwtn4HWCxIPQ4mr+rMx5E3g1OWypwJ2Wdfoi9eE7JZZf7sQilgyfGtnTKNGF9Eaq1tTXVCUcmm2EAzCfCWtMAG1e6JXnkz4wA9bt55njlBJTlYSnpaazfzg+XuZCuW5BhYb645tPf4tN74t0TznljoOSbFfikFrgiMr2Iu08T1O+9p3Ki1k9o2UIZG/IuwMbTZr3Z2gInD+2iAnEN3m2oo2JPy9p+pRNq2dgDu5PXtMIVsxAewk5IsznZ0e7+YxdCci3+JkieQJb+N6equ68hyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sat, 7 May
 2022 03:06:19 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::b0ed:b07b:35fb:6cf9]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::b0ed:b07b:35fb:6cf9%4]) with mapi id 15.20.5206.027; Sat, 7 May 2022
 03:06:19 +0000
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: Add meta-phython
 to BBFILES_DYNAMIC
To: Teresa Remmet <t.remmet@phytec.de>,
        openembedded-devel@lists.openembedded.org
References: <20220506121216.3099707-1-t.remmet@phytec.de>
From: Kai <kai.kang@windriver.com>
Message-ID: <f8dcd63b-ec64-adc2-97ca-c877db64b8f0@windriver.com>
Date: Sat, 7 May 2022 11:06:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20220506121216.3099707-1-t.remmet@phytec.de>
Content-Type: multipart/alternative;
 boundary="------------4DB303C3FABDF787EE40951C"
Content-Language: en-US
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6aafff6-f022-4a98-7a3f-08da2fd68e8f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4930:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB493048E56453B07010E892AF95C49@CO1PR11MB4930.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5R9Xp+hTPi08ZNIuEdw3YaQj5OwYMwx5XusBD0xVdzEw+x5RDRTXJixLZSVpbD+CrL56s24CoARI1OdTQS+55p0BaYpaWf1F0494ZkLMLjn3dNyNtp3svc+SLCybcorxP3Eeemq1hR3cRqwjWQU/90p3w+rqWNU3sCmZnA/4o5Kiuznu9HnBwWFD8Uho3wge6LNPVUw5pEzw46kMiNekk+q2BoD3PxcFshK2a0tqjDwKMgda5sInntzGU8D2R6xETEO4+okp0Qpd0+KLPP5A/zemtJQcb30l0kH90Uf4jM+FBpJ/uLSZdeRRXIjjZObw6tvNinptHvcmuOpKjYRK7Kgb4sWrel3y03jZiZro2oxbjSXQFPbN/lyc9bRZsNG36hy7uC9DLjzS2CvLr7RniMkfZCL4pp7/MC9/vxhVyrPtyrEq+WV/94fzSI8IEXz/CburJAbjc7PG2BAyasq11LlV+fgkIsAJqp8oywCJr94SJ3+T8CBwxvAkCa1NIUHfDiA56yji2ZABcNwaf1qveeaiQcKrBKrFoKbeW7jELdPIYbSApFJleo2FpTK2cpr5ZiFh3sUkYKqYx8JGFTr7Erjy5m0zjCTYc41i4n9MruqAXUN79R/xCinDepdrs0MmYy9QabV/jCT3WqBeBoVknNt3Q1U/8Fs4bGbXcObcQ+7n03Cb4x6Sm4q2v1GV+01prM+4vG7LXrxFYqpfEtEbBmbqm7us6cecW/Hmvaye2np/mtP07e+RGBCkJzmHg85K+1uj1NbKjwT+3Ld8t5kWCiMIAVXV39+4r+pE+jzFW+UlaNISGhlq0+0JV1mKLgjCBUSdSarpkMHANP3ChWZloDFeBMBGdMSNbrGETj37N0qJpynxtQuWnCCt6ETSyllwZTgEs6FwxZ5/rQGmwoH7Yg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(83380400001)(52116002)(8936002)(66946007)(8676002)(966005)(508600001)(53546011)(66556008)(66476007)(33964004)(186003)(6506007)(36756003)(316002)(31686004)(38350700002)(2616005)(38100700002)(6666004)(5660300002)(26005)(2906002)(6512007)(86362001)(31696002)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVlUcUovaWZZenJZUDg5TzZIV3VWbDlRK1hKTndSQ1V6ZkFIdTNzRkhUOVZX?=
 =?utf-8?B?VExoVmRVRW1yUjUxeXJLeGpBZm9OZGk5NW96dlRtamxDYW9EOEduWHAzYndY?=
 =?utf-8?B?SHhuUEI1cldXSmVOQ2FDSW9PVmo3Z1pEVDNEV2VGSmNCWngyM2FlVDBXem5Q?=
 =?utf-8?B?ZGhpdElNSWRJem55dVdTcEMyMURvZEphUmNVZEJLZXRmd2JrZUgxRzlpNGQx?=
 =?utf-8?B?aXQ0dkIyN0tjVGtJQXNvcElOZjBBM0c5a3NHU2RubmJsL2c0dVRTcmNPZjNv?=
 =?utf-8?B?WjgvUGdKT1ZTUTRra1BKbDVYcFZJcmVualJJQnpFS0FEM1BvWE5QRWlaUDR3?=
 =?utf-8?B?U2lEaGticWZGWmVIRFVDTVVJTzNhMmZsNXNRcU84YjRvU0NCd1BCTWJTMTNw?=
 =?utf-8?B?WVpjUHNVMTlkejlKd2ZNSlVoZDQxUzJJRG45bFlWN2ZjSi91b3dQdUtmOEF2?=
 =?utf-8?B?UzFkSUZoN2lFM3U1bXpkNHVPUlh0bG9neGRFdEVJN05kK3RqUjN4VEpiQ01q?=
 =?utf-8?B?dkV3bnlSMlppckNyTldBU0pJblR2RnQxZWNEd3VHWDhCQmM1cFJxZjJWQWor?=
 =?utf-8?B?NWo1cE1JWFYxNHVXSkYwZVNqeWxYZ3haWWw1cmtjUWx4MjE0QVJIMk9wak9h?=
 =?utf-8?B?Ulc4dzRnOFVDd3BLbTEvRS8vRHdTaDJVYXFoeHdRREdyUzVvbnlnY1FhT2J6?=
 =?utf-8?B?RTNHQ2lwczlhRC90ZElKODY0K3ZpVGNkeTRIdUt5UWExSHdZeWZydmZaR25Z?=
 =?utf-8?B?ZExlWnlsTWw0VXNWVVhiUzJld1lMK3AzaXJDTDJWR01iZmVKOXV1a1gxcW9L?=
 =?utf-8?B?MHVRUzFNTnVueVhKMHdRRCszK2gzeE5HTVhMZFhpZEM5MjNycVkxYVhuYlFN?=
 =?utf-8?B?cG1OWVhrSytRYnk3eTNCRXVzMnpEbW5FRlVNOVR4cXFPWm55eXEvZEVSLy80?=
 =?utf-8?B?NWdoT3VLODBPc2xVUzQ4Nmdkb05HVVV4Z00vd2RUSnB5a2greTF0V3dHZjZC?=
 =?utf-8?B?a0EyanhEbW5vU0JxTTc0VXRmRVozT0twQ2oxNkhLU2tIeEt5T2lRODBCRHhk?=
 =?utf-8?B?YTRIazVpKzV0UkgzWUhOaTdDYXZLdWtIVmRPZ0dvei9obS95TlFCd2x0YXFX?=
 =?utf-8?B?M2s4LzlOd2F6VUI4N1dsRmdFQ0V4c0VtN2V3NDd5ekpOZnpwTENJeGc1MitY?=
 =?utf-8?B?VnZGdjhrVlNWSWQrb2Q2M00xZ2h2RkR5TXBJT3pOYVU2eHBrN3pVOGYvdDFL?=
 =?utf-8?B?WDlPM24wbVNmMVQ4T0xieCtYb1ZwVGZsMHh4aUZvTDNVU1JpeUN2Zk5meVpM?=
 =?utf-8?B?UUhpZzNVM2lSZ0lLbG1NSUFKd01vL29oV3pKMW4xQWU3Tk9tWFNnMXY1U3Av?=
 =?utf-8?B?Q2NVSXlxS1A3L2VVclJCb0s2OG9QTk5ZT2xSRjVFMjZ1TXAxRFdwd1ZrSERQ?=
 =?utf-8?B?TFJORkpBSjVVbDV5Rmcwa1hJVm9CaDJVVmRzZWtPc2oxZXJhbEpyVXV5cnRG?=
 =?utf-8?B?WXd4YVk4a0hXZll1ZERaYmRWdUt1VTVPZ2VHWExGT1EzbytFL0hUYmtFU2ha?=
 =?utf-8?B?bHUwcnNEcGRkN2ZoTWZ6d3VKbm1aZ3dYWkhrRnVENXJVU0R6azJtaFU2V3Iy?=
 =?utf-8?B?bWRZTUpFeWd4Tk9oRk5WMG5LVm9xZDhadjI1cmNnQ1E5cHVLcWJ1K09adU5y?=
 =?utf-8?B?aEFzZ29PdEZ6bzl4RHhBZ3I3YmpqenRRV3BRTVVMck1ZNjNyY3VPZklKaktv?=
 =?utf-8?B?WlJldDJ2Vnd0b0x6ZDVLc2huMGxjK1FvYk5xZ0l2WG5QSk41SVpQTnlmOWNk?=
 =?utf-8?B?T2VkRFFIRkR1ZUJ2OE9WTGRKazZja1FzbUtzSk5ianRlZ1FFZjFrVEU2K3RJ?=
 =?utf-8?B?MVhrRzR6NlZDQUh4UHhRTVlFWkxtR1V1VS9ZR2lpSHZCaDFhQzErVW1hd0pQ?=
 =?utf-8?B?Z1lhZ1JwbDcxRTRYdUhnbTJKYVBWK0xNZ09Yd1dQMjlrcGNtWWZZZTAzKzhO?=
 =?utf-8?B?aklvUGVRaWx1R3RhWWtETnlGNUFtWlNqcHNnRzUvb2tPZ200SERaSmlYMmlZ?=
 =?utf-8?B?U1JJd2dNWGFMUHBVYXdVcUZCb3Z6NkRrTDVJUFI5WGRvaWhDU25zMkF1WVZY?=
 =?utf-8?B?SGs0Z0ZpZDN5ek1wUStFeGppOHhLQVE5djdZM2U4Y3UveWtKMmZ2Vno0ZE0w?=
 =?utf-8?B?NjFtMnBVa21iMmpWRG5UMmVCOUZMMy84eW9PWlYyYXhHYW9vMVZlNUo4Szh5?=
 =?utf-8?B?Wk9pT1FQVDFtZE9VcTZwUlNRcmQwMEFGbjVvL25NcWlPSTFaZFNaRndWYlI2?=
 =?utf-8?B?Q1lWOFEzUlF5U3NNWnk3alNqWkhqN2JiendBWWFORFVXWm5xNmRCUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e6aafff6-f022-4a98-7a3f-08da2fd68e8f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 03:06:19.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D5ldFEopGQrCbuekoLuujPR0U6sWMX32aYG6UeFZE55N1Daw61dkv2WpATGiqM4o2Z0+1j7gKEZifhgrYFE1pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-Proofpoint-GUID: x1m6ggjSgLzZD4DPzlSWMIUeyn06e3NK
X-Proofpoint-ORIG-GUID: 7aMfwIafAywOQbQP5hqT2OpOQ0-VxdKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-07_01,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=859 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 May 2022 03:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96975

--------------4DB303C3FABDF787EE40951C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/22 8:12 PM, Teresa Remmet wrote:
> Activate recipes in dynamic-layers of meta-networking.
>
> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
> ---
>   meta-networking/conf/layer.conf | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index 3069cfb6a39d..a7d6da8fd7d7 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -24,3 +24,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>     wireguard-tools->wireguard-module \
>     wireless-regdb->crda \
>   "
> +BBFILES_DYNAMIC += " \
> +    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
> +"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96973): https://lists.openembedded.org/g/openembedded-devel/message/96973
> Mute This Topic: https://lists.openembedded.org/mt/90931634/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
Thanks, I met the same issue. BTW, there is a typo in the title, 
's/phython/python/'.

-- 
Kai Kang
Wind River Linux


--------------4DB303C3FABDF787EE40951C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/6/22 8:12 PM, Teresa Remmet wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220506121216.3099707-1-t.remmet@phytec.de">
      <pre class="moz-quote-pre" wrap="">Activate recipes in dynamic-layers of meta-networking.

Signed-off-by: Teresa Remmet <a class="moz-txt-link-rfc2396E" href="mailto:t.remmet@phytec.de">&lt;t.remmet@phytec.de&gt;</a>
---
 meta-networking/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 3069cfb6a39d..a7d6da8fd7d7 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -24,3 +24,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += &quot; \
   wireguard-tools-&gt;wireguard-module \
   wireless-regdb-&gt;crda \
 &quot;
+BBFILES_DYNAMIC += &quot; \
+    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#96973): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/96973">https://lists.openembedded.org/g/openembedded-devel/message/96973</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/90931634/3616933">https://lists.openembedded.org/mt/90931634/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p>Thanks, I met the same issue. BTW, there is a typo in the title,
      's/phython/python/'.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------4DB303C3FABDF787EE40951C--

