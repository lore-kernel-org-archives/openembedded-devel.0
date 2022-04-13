Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0456BC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1176.1649814163963756623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 18:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AyjlUy6t;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=11025416ed=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23D1UvtJ001240
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 18:42:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=n7Pcd1/Ra2BoW3Q1mzamOBpRjG3hcfwIFKatVrdStHA=;
 b=AyjlUy6t4Rb3GArnEFc+PwkwsS1C33L3RiBsanbzrAjjqMdZE1B2hJMxvGksnw35iOt0
 4JC6enoePfWW0vVjJonThGf2DCEddGJaE2kfkdtDnx0z0TvJGUVBtyD2pmAtNWWwVJ4R
 q4YOevnVvUr8+xcmeRIp+VYEhO29nwHXgF/aZ8tY9dbfQLyAKbixyFVZVmDnZ5gaml0w
 yopFoBJ5Rzq0dvujt0IvjrqI1aiY6F+hsZwJikz19lvFMWG6KdWFdfK5PTamQQOj2Zlg
 kcA0REYZ+u9UuvEMylRmTlZMQ5P80Usz0Y4MKXeE+0ubsQKb6FMN0VC5g8lfOVWrFYPE mg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb9nftnmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 18:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYbG15YWr/2mnjlHzsMUtjDWG9OwoDBuglboqtER0mPNKKSo0pp3uD1PhdYZWaVgwbzmEfMDmmxufXMBTKD0dxuz/YSNS8pgfNxc8LsPMgGGlZ29fVF2oB39OC4LONO52+Jgc0y4AM6elJ1gFxEABQ0ChNfZXMCCUKXt2lAkwcWnuZYRnTFQXQtlhiB6PED2LBB+iVuzKT9J5xtkVw4YSI1Ow9vDQGKqVXmneCre6OtMJZ3UUXQ1LjkhVUlmFtqvF/9SxgEWA27nCFneSn4l1Ah7II1bgd1M3BO1wJuSqAl3wIgalmbHzfG9a8FQpiFV/+wprbYtQi6yJHZcBojgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7Pcd1/Ra2BoW3Q1mzamOBpRjG3hcfwIFKatVrdStHA=;
 b=fylBFIIIovyiB0TSE5czQgbna3mP4D7AYT80m+msmVWmt72HoZOjaveigPmupgUX+RDsmCw1YW9B6mJvJlc7eFaSIbECzPgpqNXtSahCFIdqoQlvZ1JMLJgTRjHCgWTqHNeCqyxa9ar2iJHWva0dPUFE6b3r0Hxooj9uZgAwYxfMoHHkuc3jqmDL5GJ/5MvbrkDo59OjIZigWrVtIki2eFj/Pd0WOs/dC58+3e8SNwiOZI/cb+0Gi2Jn6l11/savC7WCs+pgyNZHjjohdzMYJKLma4QZ9iZfTUdnKAtkiL7KmTQ9t9x+bYMcpGwBRXGB6xT9ThR3rHO/85C7K8S/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by DM6PR11MB2602.namprd11.prod.outlook.com (2603:10b6:5:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 01:42:39 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::18fb:1525:3574:8501]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::18fb:1525:3574:8501%4]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 01:42:39 +0000
Message-ID: <6fa45e79-3e71-ea5a-33e2-a82d27afc1e5@windriver.com>
Date: Wed, 13 Apr 2022 09:42:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-networking][PATCH 2/2] samba: upgrade 4.14.12 ->
 4.14.13
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20220407054640.879122-1-yi.zhao@windriver.com>
 <16E387164293F599.11968@lists.openembedded.org>
In-Reply-To: <16E387164293F599.11968@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0107.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::22) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d2dde67-8f0f-4896-3c7a-08da1ceee4dd
X-MS-TrafficTypeDiagnostic: DM6PR11MB2602:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB26026585DEE9C95AE7017F4BF9EC9@DM6PR11MB2602.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TI6NqTI31/nKfQParWHmZ1WKh0QbHcCtqKyFArJ15/awQgX5SWmtiXe99K2sIcYHAFo0yWfr3DXyn8lbjvg9N3YXm0a3RbGCU8Y/QN+giTFrGSo+42Yabsn9i3huIB/BtspI8vWkKnByUVRtoIhm994ZVQNUjam5v/ceOsiudSduH/JH2CftyLcoXtBal5/6OJbAXjZ7YXqubJhcfIS6qn9moqApZ8mb5ed4/sShiGPD577MMhpmnWXmc0g5KQ1LvwSlh76bVZYr9NK8FfZU6Ee46GlwOMPvjq9PtpLyXPRx22uMy9/vH8pBxIkqtFU0h6PMW94x3ojjsLkYFRfkDRYr85C5k4kS2cnx9gozVpKrKEdJPVbtkGJOpzDd0pUglZ65Dl1D0BOm2MEAgfoArW4E/XhgMDTUhaBXrp40QGFlhpQkMYRTol+L7L2F249pVSVHrvQllYLCuGDbRL4lbdsb7RaQWAmhyBoNIta2FJE06uDZeG+JcTsT1kCfOQqK7iiCksnPcMRPTjEE3NieDDV2P9ySmKAq0dJ5TRvIc4GXTpcQwIYh2PjFhQf4jT08fPNR4L7Qqq8SkzUW2Ki9pICyAMEB8EbQ0PS5s15ZYZbYQaQUAadD9b9Nj5654Cume33/l6ulO8sCLjVNTszaFebQpXVBSh3A5ZgBd/Ko0i3+71XwI3F7+DYaZaBHMjsw2pH2ay1aqtYj/8iG76DhVHzo+FRWW8i4eXySa3OK76Ak7NYzfXYCtVBJ7l+hHBhfDk9qw5MJiWA+hc321gxyUxz2T/M80QaP0yljKy8peacIcb2g89vewMgS2zWO6sq/gnGRWqzQm5RivJIB9jclaZUB7Ipk/fc9wkK0RYIK44SjzJ22Nzlf/cmgIYPlGWjfredV+lb1pj7Kbs5gMaIACw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(52116002)(53546011)(6916009)(31686004)(186003)(966005)(508600001)(86362001)(6486002)(83380400001)(6666004)(26005)(6506007)(6512007)(8676002)(66946007)(66556008)(66476007)(31696002)(5660300002)(44832011)(30864003)(8936002)(2906002)(38350700002)(38100700002)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWNDN0lRMUx2MHRPL05TWnVTRE9mVklWQkY5QjJJc0hsYmk3Ykt1VU0xaDFD?=
 =?utf-8?B?WWFZcENFZHBTYnZxZktOVEZHanpSc2tKRDV4YzlUNWJkUk9rejV0MUM1WDFp?=
 =?utf-8?B?dkt3OC9MbzQ1R2JON00vdlpLeFhQV1ZtSjUxdHI3VFBlcVYwcS9WbHUwNlhN?=
 =?utf-8?B?bmczLy9WTG1IZHlFOHhUYzVMb29TaENEN3owQldtZzJhRzU2WXkzVVhtc2tT?=
 =?utf-8?B?R3BpR0tMT0VkbXhVdnd5OFRnZ3I3bGphM3Y5alNucXRjY0swVHlXSXBsU0ZZ?=
 =?utf-8?B?Myt1Nit6TldrZ2w3QzFVWFhpVUpFYUpYUW0zajVVR1dMSDYwTkJUOXk4SUI0?=
 =?utf-8?B?aGFoYzUvTDd0WXBhSmlDUGtVV1luUFh2akNhZFI4THdBSWhXTXVHR3c4RC85?=
 =?utf-8?B?eW42OWdTcFlQU0pyZkRCNng0dW5NaGJ4R0lscjJWc0YrVmZiU0ovTm4yUUxW?=
 =?utf-8?B?WnpTUXZrYk9waCsxTGNZNnliYTFBSnNKYnJDZTc3dE9ncnl5cUpESjNNRENh?=
 =?utf-8?B?UjNKYTRWeVBIVnFnMUpzUFB2RnpvcG51allKNFFIajRma3dWTkkzNlFvMVBJ?=
 =?utf-8?B?cDFjZGp1Z0IzU21YeFVNVmZEL1dVWDk5RC84UmQrVXZ1U0xKcjNIOTQyM0tJ?=
 =?utf-8?B?aVZybUc5UmRORU5aVDZSNjVyYmtPODVURzRJNHN1Z1RKN1R5T0RBV21PbUhS?=
 =?utf-8?B?RWp2anNwdnowaWhyQTJtUW54MVNIdmVDMEY3eUNNdm5sajVLdVhjN3N6a2U0?=
 =?utf-8?B?YVZuZ0dNTFRFK25vZStyYzFiZmM1ZTEwZUpWYjFJeCs2UG16TjFabDJSalhx?=
 =?utf-8?B?TnNGVkhzUG0zUk12K2ZBS3VzUnhIaFYzNmhUZXVCeDhjSDV4SjVwUDB4VUdP?=
 =?utf-8?B?cTdpQXhvY0ZaZEpRbGxieVNjWUtDN1hKQmJqb0grVkVQUDJrTEdwMldoa3ky?=
 =?utf-8?B?RVdDZHR3akJDR2UvZ2FOOER5Tk1mOGpVRnErNXYwZVd0YXNOYzJKSHQzT245?=
 =?utf-8?B?OVlaNS9ISUpCcXF2Y2VCZkNRY1ErOWE5c3hLRHpqb3NaSXFIZFpabHczZFdW?=
 =?utf-8?B?NFYySlA2YUhpNzhJTVowa1FqMDdOV2NXMzVRb093Rk1lTUozL0oyZHhUMGQz?=
 =?utf-8?B?cHl4bzBFQlJ1d2JEZm1JZ0R3b3lGN2UyK3hydHZPN0VybDhQdlBMRVhoTGRY?=
 =?utf-8?B?MU8rNlVPcmU0RG9ibitsU1lWQnJnai9WN3dIeHRSVEZpVGYzSXA4UHVxUWE3?=
 =?utf-8?B?S21TcVhHWSswR25SemdxVjRMUzY3ZXY2cW1WOC9KVy9HMnZ6U040b1hBbWpE?=
 =?utf-8?B?TlZBVFIxY0NaMTRja0NQTUlmRjg5NDkyM0l1Wk5QRHk0SEtNeWFoNG9uNStp?=
 =?utf-8?B?K1o0TktFVitKQzA1cFhPZkxCTlB6MHc4OHZTaEtOQ0tvNkhnUVVUSm1MWm0z?=
 =?utf-8?B?eHBhRkdJZFhrTDZjMG5RSm84U1k2ZlVOaldncytZWnlrampxUkxjR1RIZ0pI?=
 =?utf-8?B?OXhROGVkMVVlcksxbVZlb0lucWZwazZ0eHB5S0VKK1o2V0h3NkxyL0k2Tk5D?=
 =?utf-8?B?eVo0N3FxTGJmYWRpSFRtZ0lUYzZnN0lpckxyMnBNU3F4K0RxaU1kK2phRzdi?=
 =?utf-8?B?Q2tPS0VrYnRJcEsvYnNLL0lhcDVobzh5VWtIYUJ4a0d2bHEvVUNlZ1M0N21N?=
 =?utf-8?B?Ti9adE9Wdmx3MlVPbXhWL09JcVpXMWxBK0Yxc0lJbUtuZkEvYVpSdldwN093?=
 =?utf-8?B?NVlVWU5TTVRGOFI2MGlmSUFHUk0vMUFRNUZwdGNqUTB6MXdmZDJqZ2JSRDlq?=
 =?utf-8?B?b1U5NGdwYkpwU2hoaFI5Rk9yOXhGUzRzNWdndEZTWGg3aTBUS0lGOXg2QmxW?=
 =?utf-8?B?bjd3djZldmV3RXJ4enJDOVpibzM0bWVwR3JHcnpGb1BRVjNOVVk1OVVnUWZB?=
 =?utf-8?B?KzhGYXJicjN1Y05QR2dSeXdqVjJDS2gzQnZDY0ZWRFVsOFN0M2Q3cUxGMktK?=
 =?utf-8?B?ZDcwZm1DVkRkYzlTVkhVUEpwejlNK21EYkFPWFZWZXdnR3VoTGh1cmtDQUxa?=
 =?utf-8?B?OTVzUENtV3hRNWRoNXRtTjRYdkk1eG12K2h2bXdyK3dQR1ZDZ3Q4ZGtFSDln?=
 =?utf-8?B?NXdDeDFzQW1aK3lMTmlId3FENzl1WGszZDg0VnYxNVc1WG9tQWVRdVBvZnZ6?=
 =?utf-8?B?ZDczeTFIZEUyT3lkOTRDendaREhMbFlaU3duVjh1elNWbWVqZFY0VXliMGdJ?=
 =?utf-8?B?NHhPS3Azd0FQd2dyc1lzRU5RaDQwVExraXIyaWhqRkdjZEVtMkdXbWcycDFp?=
 =?utf-8?B?QjduRkl1MFFmVHlDU00ybEZpVzMwVis2cDZSSEowbTR6dmhmQkQwdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d2dde67-8f0f-4896-3c7a-08da1ceee4dd
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 01:42:39.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9rAFLWj1cpxMoYyRTvZs07DhsqCVuQs0mrIkO1mJn9K1qIQO6jJFzssz1KahusoIt7j2x2F/kchiSOVSXfRYlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2602
X-Proofpoint-ORIG-GUID: HcoExQCFbq7LFgMoTD69mLMTSm-zAHdH
X-Proofpoint-GUID: HcoExQCFbq7LFgMoTD69mLMTSm-zAHdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=991 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204130008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96603

Ping ...


//Yi


On 4/7/22 13:46, Yi Zhao wrote:
> This is a bugfix release of the Samba 4.14 release series.
>
> ChangeLog:
> https://www.samba.org/samba/history/samba-4.14.13.html
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../files/waf-cross-answers/cross-answers-aarch64.txt           | 1 +
>   .../files/waf-cross-answers/cross-answers-aarch64_be.txt        | 1 +
>   meta-networking/files/waf-cross-answers/cross-answers-arm.txt   | 1 +
>   meta-networking/files/waf-cross-answers/cross-answers-armeb.txt | 1 +
>   meta-networking/files/waf-cross-answers/cross-answers-i586.txt  | 1 +
>   meta-networking/files/waf-cross-answers/cross-answers-i686.txt  | 1 +
>   meta-networking/files/waf-cross-answers/cross-answers-mips.txt  | 1 +
>   .../files/waf-cross-answers/cross-answers-mips64.txt            | 1 +
>   .../files/waf-cross-answers/cross-answers-mips64el.txt          | 1 +
>   .../files/waf-cross-answers/cross-answers-mipsel.txt            | 1 +
>   .../files/waf-cross-answers/cross-answers-powerpc.txt           | 1 +
>   .../files/waf-cross-answers/cross-answers-powerpc64.txt         | 1 +
>   .../files/waf-cross-answers/cross-answers-powerpc64le.txt       | 1 +
>   .../files/waf-cross-answers/cross-answers-riscv32.txt           | 1 +
>   .../files/waf-cross-answers/cross-answers-riscv64.txt           | 1 +
>   .../files/waf-cross-answers/cross-answers-x86_64.txt            | 1 +
>   .../samba/{samba_4.14.12.bb => samba_4.14.13.bb}                | 2 +-
>   17 files changed, 17 insertions(+), 1 deletion(-)
>   rename meta-networking/recipes-connectivity/samba/{samba_4.14.12.bb => samba_4.14.13.bb} (99%)
>
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> index a89d9b358..e91df71ea 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> @@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> index a89d9b358..e91df71ea 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> @@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> index b32967539..b670e4ac4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> index b32967539..b670e4ac4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> index b32967539..b670e4ac4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> index b32967539..b670e4ac4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> index e8844981e..ad52b4a9a 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> index e78761de6..c799942d4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> @@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> index e78761de6..c799942d4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> @@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> index e8844981e..ad52b4a9a 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> index 4d2726139..ac857d46e 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> index b32d30b34..dfc48754c 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
> index b32d30b34..dfc48754c 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
> index b32967539..b670e4ac4 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
> @@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> index a89d9b358..e91df71ea 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> @@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> index a89d9b358..e91df71ea 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> @@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
>   Checking whether fcntl supports setting/geting hints: NO
> +Checking for readlink breakage: NO
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
> similarity index 99%
> rename from meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
> index 3da397f5c..49e93fc53 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
> @@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
>              file://samba-fix-musl-lib-without-innetgr.patch \
>              "
>   
> -SRC_URI[sha256sum] = "155d9c2dfb06a18104422987590858bfe5e9783ebebe63882e7e7f07eaaa512d"
> +SRC_URI[sha256sum] = "e1df792818a17d8d21faf33580d32939214694c92b84fb499464210d86a7ff75"
>   
>   UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96445): https://lists.openembedded.org/g/openembedded-devel/message/96445
> Mute This Topic: https://lists.openembedded.org/mt/90307416/3616783
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

