Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3548C6FD1F
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:00:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5960.1679281250010976942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 20:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kwcJbtCC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=244390f4a0=yue.tao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K2uSh0023904
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HhMcsTkqQGupTnKUeVHJzC3w038LUh3EwauL/Wfiz60=;
 b=kwcJbtCC/HNRcAMVvnBRwvnnaBDADeLxBgx9R0exQQ9/GYWX5HKCZHkletEQrncvdgRn
 ZDNWPA/S9KmT6hSp9yGA147PW8kpV7+kkkn3lkNdX25kC9BN9w0oSvfmHzQUWf0MpFx9
 K1Rj67I/VotanQZ33N+gNqjKkznpWwBrMwC8M9eS70JnzGKncOT8AONVosOBHvFWVj7M
 OznnL0QBKuh5xOgOuHNjPZ4fwr/n3ejvGP1vdkv4NOJuup6MzNBTZWWGJAXjXIRGcWvr
 sFjTo+6NSaCOsT1RMhxalDzDNLq84KOzNtlBrsK/FJHqXB1GqpgXJcZYm3g2UomeXdQB 1g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49asehg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1SkJ6H3QZPOy2HmBPprfWdoH8MjOjAT9O4R6v54TAN7uaaGqo0aTKGWKZLlIryG0ng4TCfxldXsK8y2dX0b2J74WLOO4D9oZxd/fmte1BOUuyU0YSSVcBfUj1wU4u2PU936jIiqKYkJKWTCb7UIc+l5dP3jm0z99mbcH67m/vJrp31/fsH0FmGcx/BlCTh6ygfVSHWP/JEPn0dTs8+sjZCJrq/Xdw0NWAKoO5w1jVMsNB8kOVoXWP/ZaXNXUugv0iktUfLVHRBAm/AFRM0vC+V/xeMMm19jw7KXU8E7idVUcCLJSkK7h0duZOtN8siM9ORfLlTvBQPUzgfPzH8PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhMcsTkqQGupTnKUeVHJzC3w038LUh3EwauL/Wfiz60=;
 b=f5De/S/LEnyENy2Td1P3nZFn3UdCQ3dSLHsltKnu33d9Dpe926ip0xvgWW41FaFK3Lv79bBBstg9Sy1TmcZ6Movm0rCdjIuzaLbwcjKwrjdYJlh/c0JQKj5FSwQAHSA4JzM2qQh+BIra37cAiDaCKZLNohlBfu3dJWKf52KQZzjzLF8c++Ww6eRTg1GmGlIy03X4YXekccJc8QoFj5ChAUgpyTX7peKpu5BY8IYehc7ZlQLJG8yuUAOXfpak89W5H6TGf48kStVYIE3wGX75T5FBUzYTF17U+xt0n63uO7FfTjGFkzsc//5vgu6UjbKt3i3beFRIJ53yDSd7r2QncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21)
 by SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 03:00:46 +0000
Received: from DM6PR11MB4753.namprd11.prod.outlook.com
 ([fe80::1769:ee8e:1e34:cf13]) by DM6PR11MB4753.namprd11.prod.outlook.com
 ([fe80::1769:ee8e:1e34:cf13%8]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 03:00:45 +0000
Message-ID: <dab92222-abc6-0849-e01f-dee0ad6df229@windriver.com>
Date: Mon, 20 Mar 2023 11:00:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-python][PATCH] nghttp2: never build python bindings
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20230320025906.421-1-yue.tao@windriver.com>
From: ytao <yue.tao@windriver.com>
In-Reply-To: <20230320025906.421-1-yue.tao@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To DM6PR11MB4753.namprd11.prod.outlook.com
 (2603:10b6:5:2ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4753:EE_|SA2PR11MB5100:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de0f173-27a7-4e9d-50ae-08db28ef4cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CF3XisJl57M8M91OONFyex6BwXZvsfGw0SD4EKR4rbK/wAIjutZTtt+DzPYzAK20Q0YzE8ByvaF9E9naYnUriyFVFvrohf4qkiVatB/FbFPQF/SY3iwMDw154851lngNwMJT7TuVnzXIfdNcyFVT9Vc2OV4vX/fvL9kxCRKuS/tuyLwguOxqIaU5iBmhEX8eYeeYg86IVEt1i59EqlLaoiBJ8r5hfYlpROZ7veqjI7GJRV23I7lCGmr905Ii4npNIt6fssUXu+zHvyg+DYa0BeCJhvVMxkc4YYZlmW74DO1s3hAzg/b2OkYeKkgkqMuJ49ZZlS789hY1mgrd750pS+YUgvXJ7cDykVBdfbP1EsCVaoiXRXCXzZvfHlURx0Pj2MBBGC2rnrtVvcYQxdYWP8Q4tIi1Bm6fCzgKZh2WybxKcT9iPFMQ43ZzlkghEN3iNs9UDxTtnX4+zK7hmpevwlMUF83baY28jeTqGbjB9+IfSnnNSPspHpWV8tRY0yccGS9w317aTqHzR8NPA9iurI5AILak5qiagMScqXqrCrY4mp+xVlbOMbF8QEleSin9gmSnvRC3bmtGI+Go+Dg9wnEvwo0/46ypoCreoog+w503SvzxkcFnanGS9hZSBYICNUwt1adOoDER78+UWRFsfiAUqSC/i/oJJCt/HHHA3dTUkqkBhO0qjSlJJwuUDBgfzwvuchMZr02S8iRS2L10FN1D72WM3+BnHCitzD52SCNiFgdDnbS1qakO/yKhpDj/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(451199018)(2616005)(26005)(6506007)(6512007)(53546011)(6666004)(6486002)(31686004)(8676002)(6916009)(316002)(66556008)(66476007)(186003)(66946007)(478600001)(5660300002)(8936002)(2906002)(41300700001)(38100700002)(31696002)(86362001)(36756003)(43062005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVJabjJEUi8rNjdwTWY1S0dwYnY0V1dISnFtanIwbXg1ME1RQ3lIbFFpdytH?=
 =?utf-8?B?WlFSUDRZUTUrYUJKVlVoWDVHQVMxcXhRbDAvRnNyNCtsUU14V0VxK29kWlpE?=
 =?utf-8?B?dDBZR0VDNE9jY1pxb2V5amVLekhQTGR5aEFFOWYyNzVmbEptV0NsOFl2UEFp?=
 =?utf-8?B?UHd1R2tPbHJObFhJcGEwWTBtS2tqRHFsQWRuWTBmWHB4SFZqVkFwRTBXaW9K?=
 =?utf-8?B?dHl4eGxCK1FhTXNLY1phcXEyMnJKcmx6b0NlNnBBbGlZa1J5cnZCR3RPUm01?=
 =?utf-8?B?UGtIRitVQk9tOTYxdlc2UXhjSFFTeE1UZ0VEb3Vha3pHTzNUbkFBKy9LMXdG?=
 =?utf-8?B?Yyt3SlZVV0FEeEJoeUlEa3RaUmZsajhid1o2MkZpdUNYUlJ3aDNsTk9iRTdn?=
 =?utf-8?B?azJYcC9RZU0wcGdxeEtOU1BNcktBZlo3dEh3bURORVRsSGcxL0lsUGRwTUVJ?=
 =?utf-8?B?anJ5QytoNnd3YklTbU4rSGFoT3VhaHRVdUlMQ0prdDR5MnB3NHVPVDNzSnht?=
 =?utf-8?B?SmJnc3RUem40Mk5YcmZkdVJ3Vi9xc2lpYlVCWmRRM25sN29Ibk5IYW44dUl1?=
 =?utf-8?B?bUdMOVF6Nk1NVElsQjBVSHp6UzZob3lqRFJoZm1yVHVUNmszVjRJUzFCYUw5?=
 =?utf-8?B?WSt4V1hqdnRtTXQ4WWxlVTR1ZDFoWG1yOEc4dmlaL2lucCtkTHVTYTA1TE5E?=
 =?utf-8?B?K2JMbWlsWi92U3FLYWlXbExWVTh1ZEtPTSs5WHBVVUNDd0l6UXl1OVZsV2t0?=
 =?utf-8?B?K251N2UvVG5VV2xmQTNCOEJvMVJNa2dHZUg0N1JVMWdwZVhxQjNUVXAzZk9V?=
 =?utf-8?B?cFpvY2FmZjEwVm5QOHBTeEx2ODZoQS93RXNvc2k5MEc1TmR4UGJ1SDFHTytR?=
 =?utf-8?B?NWFZNUZpNm9vMjFmY20xc3NveE4rT05FSGovV1ZuMFRMU0ZCOUc3WEVrcmhO?=
 =?utf-8?B?MUJQcW5JT0h5dWJYSkw2RlE1RjdpUlRrSFl0VVA5N2U3dklGbGp4d1QwTHcy?=
 =?utf-8?B?bEtTSlpOV3NtbytXakJCWVA3Q0dPbWZ4TE9qQVE5ZDZpTGVwbXh4aHBCWk5N?=
 =?utf-8?B?K2FwSERLTzB1bkkzZ1RyZ1UwenhFOEV6Z0dHbkhxZ3FMRjdEdW9LUURVOWVz?=
 =?utf-8?B?T1FrcTFadjc5b0RZZG15UU1nZ0VJeUNQdFEzR2pUZXR5RDk4V09RN0ZUMTFy?=
 =?utf-8?B?UWJTMlg4UEFQYXJ2dktUTkxBSDZxRVdlUnozZm1JZ0lWQzMvWDBUY0MrUWVK?=
 =?utf-8?B?UUcxUVV1S054bXlWdUZNQVdzT0phRitacXNVZ1d3aTFFaGhUV0lJWTZhTWR5?=
 =?utf-8?B?ZDVrd1ZZYW5OYjBsU1NRYlg2YXIyeERYUnE3cE9CVnVyallGL3RzbzVKWUF0?=
 =?utf-8?B?UVFOYXA0MTFvNERRME82QnNzaEcxSVV5Vmt0bDFWbmxBOFpacjA0WGx4MHZF?=
 =?utf-8?B?R0RoVmV3enZDTkFycWI4NUhhZWdjcFRwL3FvRXloNnJBenVXc2tqYll4b1V4?=
 =?utf-8?B?TUFlWUg5OFVUSzJQYlIrakRsbE9QQ09LTks1UjBlYkR1MlBPSVZYb0dSWnpH?=
 =?utf-8?B?SFVLM1NOWERDRXA1VGNzMGtCcVZJR2VKSnZCeFgzR2JhYk1WVzB6WUhJcU9N?=
 =?utf-8?B?WWZhcmxoR29SbkhHc1dEclJjTU1HTnR5Z25wV1dXdytYWXVjUldicGxLOEJG?=
 =?utf-8?B?clh4UEJWVzhjR041NzZCWmNyVFFWdWxqODVOQnp0eUlMckk1QmVGVXVVT1kw?=
 =?utf-8?B?N3RXbnpBS052U3RIb21vellOaEZCT1RjU3BQcmRyV1BpMm50WFhCQi9LNy8y?=
 =?utf-8?B?Zk0zdStMZHlOd2JLcWtBS0FlVjJldHJWc05pUGlXS3BLa3pOUnZpYS9ZK1Yw?=
 =?utf-8?B?d09DOUNVa09Jd203dnVsaWxwb0xkK0szbVUvNVpiWVVCWUZHdUNVMDlmVGlR?=
 =?utf-8?B?VnRINnNyNEJ1d0tCbm1kK0oyY09GU3VOdTMxTHdvVVk4ZGsxUmtQUHkxa3Rw?=
 =?utf-8?B?SCtBRENLcitGcnNxVVVqd3ZSemZMMmFobll4RXh4Qy9HanZKRGU5dUNESzZr?=
 =?utf-8?B?YWNlKzZXdHIzOFNudUNZc2NIZmpqNHNldUhIazh4OW9RYVZUM28wWitHTEoy?=
 =?utf-8?B?dDBGcThYRnAxM2FkUytKQmwwTVhlQjhab0tBT0Q1VGNUZ0tETU1DS0NYdVdx?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de0f173-27a7-4e9d-50ae-08db28ef4cd6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 03:00:45.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNq+UOo3CWJ8JbSzfy+4jqPULt/C4d9fIuRV9l05ByA2hpMYUyy3kvtO13R7jA+CXcB2/0tuDnxqqxHk0QyKJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
X-Proofpoint-ORIG-GUID: 2ARlqFuvDrA2JXM-4VPY6xDfq74X7IoB
X-Proofpoint-GUID: 2ARlqFuvDrA2JXM-4VPY6xDfq74X7IoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-19_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=848 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101601

Sorry, please ignore this review.


ytao

On 3/20/23 10:59, Yue Tao wrote:
> From: Joe Slater <joe.slater@windriver.com>
>
> This has already been done for oe-core/master.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> index 58ce08084d..becacd4502 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> @@ -19,6 +19,10 @@ PACKAGECONFIG[manpages] = ""
>   # first place
>   EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
>   
> +# Do not let configure try to decide this.
> +#
> +EXTRA_OECMAKE += "-DENABLE_PYTHON_BINDINGS=OFF"
> +
>   PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
>   
>   RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"

