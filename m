Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F1ECDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:18:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8742.1697109514852908177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 04:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p8tAa2oi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=864958f900=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39C9sH1i027166
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:18:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=4A2B8yDIHfjnKalpjaDeTgjSfN5xsBYFC23wsYIeMEY=; b=
	p8tAa2oiUU6YII0FvkCd4jzCjCMqUSDa5ke73Od6Osrumx8oOsh9g0sr+ms2T1kM
	KkXrZRayS3yGK5th3KhyEtP4XRnCpH5Hw9YYwUPxAhAcTk1BCFIqepMFomq4mmA/
	XCUvFPYtyOGKMYg01+CkPP4uGACh3qKcciNAFFNwD/eK+e49gB0w3kDE3J4ecFSa
	WZiwrYbgFQXw2ETPloSGffIygKbUsj3NTRc7EkqetLGfh3JL/m7/Z+3nScYwHhDY
	4xyf6OG9m1n0HLKdpFd4zCCdfkMtoRPesaeNAVIhA6nPiUd/ieOv0jYXPBthnAO8
	ElXb1L6Q1Lnkel9TxqjaBw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4sbn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:18:33 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39CBIXkY025457
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:18:33 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4sbmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 04:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCqcF5+LpHOVjvZbAuE9y02LXecCYoUN3uCFE8aqwsvEUyc+qOCB1zWPfqpARC6n2ItHlPwhXNckIcSp5t68gZSz9GJAnwuyVNmwOKlMFb+uKIzWgoR7vETZNfX0Ta/aavLFVmNWxiEufPzDBeBP64U+rAScMivfBerHoBm9sBWSii0zN7ZxRrVu2+VLKG3hEgVtf+wANcsDw2zT+Tq4U7PhZ7y/nLhxMXobGRGnMTMNqL0OdnlC+Rzn7KIWf4wZj1Qwvc8TkFzcjab/+g8/D2pLDZsCHPyw7ry3BQ0DktnpGkQTUr9ACVQx+8y6Poe8a7F++O9Jjg9N8iE3t6wVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A2B8yDIHfjnKalpjaDeTgjSfN5xsBYFC23wsYIeMEY=;
 b=TYS0HbZ5FjjNwDaFXHN1R5LnApEsu2g/2Ic6ttop4LqgP4NOVh4qEzLzo+uaSaDBWtLbzY6RFTrtrD4fid6CZLswQqY3ASnlFosoNk2VCFAva83dL7SRFbgRfWh5Oz5dhFTqpJgN542iRDTW7a5N1gB0rd1NelB7ASo4tVf2+yFAvPsMeWocihRF33Rlaip1F587JYnUV/46nP4yM/QcmZ4a18/xoqNT9D9d1hBYN+D2i+UssbM3oUePu1piBN/6H2V1SqVpYlcBkU6n48SY6roRrFPaWOwhcxd0djmvAAVwbIja7S5FPLx+1331UQTWI0CFleUDBzaMmF4wmyeRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 11:18:31 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:18:30 +0000
Message-ID: <796e2e4e-1f60-4b76-a207-f3821fdc4b75@windriver.com>
Date: Thu, 12 Oct 2023 16:44:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] open-vm-tools: fix
 CVE-2023-20900
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <1787376B597A1E36.28251@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1787376B597A1E36.28251@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 2735d2b5-9572-4d84-e829-08dbcb14f6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZFWZ1viEZ9LKU8pqGwqXHQEG65cxxdDenXrvSZSy5NudxenH61z5iWod1c2K99GqKNWaYua+nMk+dWbqA7/C+n8qN2DuErB+Lbvi3wzF4P+nwqtltlZWVKmoJ1v4jjLVjlc+j9bzoMW/Sl1LLwa7g5igeAjpL3WBG3EJ/8NfzE2nJeY+qTMf5YIvoY3VGENVMK2+ba2XHuWZuU1KO4li1A1g5neOcRPby8jfLUzwsPdlV0K7DkJCNML5Y1yNJ2UuvMWEntyk1sZIcUmEWC+p9RTvk2CHVjrGmEHsqLkUuGnfRxwoXMgCBHJvZfibU31KNxuxgzZRgPa7WaEzmAe362RQeHHRVeIc4LDai0u2Uz/ksc1CP/0Q72zSTp1omXwAnNmtBx3qLhOzbH+pXX4b0fySMNdXtg3gw5B7JqzcsrsLMFVpq3ZGaPLsMtqm4Qb2yT288G3wCFtKzbO24WJxaSPn0F3+aL9slgQtE6/3CqQr27b7PR202UjQKvJk5O51MJ4D7TpL+khUdg8CC6zO01cGMlhNziQXonjkVstDC+V6FBqaVjxhvlYCzxKo/XeCmW/zV/2TpZxt9qOprvYocqI/wOk+QmmWHLjK1fWWDXqVbeUnX2bH6a6uxva8hIOO6s+n3N1dZWVYpqPb8yGHNqT8FkOYoDx/1BYrVAPayfM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(478600001)(8676002)(8936002)(2906002)(5660300002)(41300700001)(31686004)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(6506007)(83380400001)(53546011)(55236004)(2616005)(26005)(84970400001)(6512007)(38100700002)(86362001)(31696002)(36756003)(66899024)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTJ1bmxvTStqRGF6YW5paW9kTWJwNHkrNVA5a1grUllxaWQ5UTY4eFUwZVVR?=
 =?utf-8?B?cVA3aFI4c2JkNUZUWWppODhpMEc4dm1CNkRRcWo2STNuZVFYNG1TQ0VCSmtM?=
 =?utf-8?B?WHZrWGdnUjJmTThkck83d01vOFA3OTNCOXczVG5leEpzL1ZxcEdxMk1NV3hS?=
 =?utf-8?B?blNwWll6NEk3ZUhyRTdCYWtTSHhVR0NmS255WExPL3JNU0RvSVRLSkJVNE02?=
 =?utf-8?B?bk9qQ2FJVmdkdTZCNktsYjdpVDIrTVFObklieEtBU3pOY0tRUFU4Q1lZRE91?=
 =?utf-8?B?LzhBc2NlTVlKR2dVdVg0VmNIV091Z2RwOGUxM0pyb3h4b2lQQ3p5QkF6YVlW?=
 =?utf-8?B?cW9hcVltT3NueHNhZWJRejJoVkhRRGNYRkVCbXhwSzZJbFlvTjVxZ2tDZHdq?=
 =?utf-8?B?dTRwNUF1QTVyVDJBSE5MdGZET0l4S1BWMlAxMGtQY1pPWnNpcTZ4UmY2a2l4?=
 =?utf-8?B?TUdmNEZQbHVQTDJqUFdUNmtlcGtUdjVLY1BOY29POEYySnNaUmlIRnlrekM3?=
 =?utf-8?B?SnBLc3pQbTY0Q2JhOUhCVlN3VjkzQ1dIZHNXMzY1M1FyNEdxbnJtNHkrUlIz?=
 =?utf-8?B?QTVuNHNCcnNNYmExd1EyWGh1THJiSzVtRTlZWXFrVnhzSU9pZG02VTk1ektB?=
 =?utf-8?B?NmliU0cvSmo2a3RTV3hDNFFhK2JVUzFRaFc4a1FPOTV4QmFGKzZEb1ppSXAx?=
 =?utf-8?B?SWtXSFJpcDJhTWxJa2FuMkF6TGZzeHFWbG5TNkRIbGRFdVgvVG9HRXFaZGtr?=
 =?utf-8?B?M3cweXZFdUtGS3doQUJ5TGRraER2TG9HNThkQi9neXRRMWhHV2dMbjBONFhM?=
 =?utf-8?B?U21YZWVWK0J6aC9pMXRWQWFwdkFreGdkaDdvUmptQTFTMXl1ZE5McjFtYWxp?=
 =?utf-8?B?OENqeHRDcXQxVWRHYWh2ZUQ5cG8vaVVQUkJCaTRNYXRFbXFNNXBNWmFRMWZQ?=
 =?utf-8?B?QUZZdE92djU4YVRKeC9PbXBQeEJ2TGxUSlJPd2k3Z2xjOW9ZUGZtRjdZblBW?=
 =?utf-8?B?V2J1SkphckZheXFTM2ovc0FKTTJVTUdJdXBmOEZlUEJTTUE1VHJScHA1K0k2?=
 =?utf-8?B?WFJxenRTNFNUdzQ3N0JpOXlZb2pFcXY0UjNXcWMyRENacU1QNTNBRC9WVXJh?=
 =?utf-8?B?dUk2RDVWNnVZSUFnUy9vckplZERHRkhXaXhDalhXbGdkS2hRT3RlWUlsLzBE?=
 =?utf-8?B?eDdXQnBVTHpHZDlranlja2QzV0FRcGxVdmJ2NHdaRXNIRDJZZWtYZmVLVGkr?=
 =?utf-8?B?eG9PeXo3cWlpYnZHa2FTZWxrdVdtaHdIbGd2ajFOOTNiVXI0VUt3MkRKaXh6?=
 =?utf-8?B?a0NWVEh6cVV5U3hWVkpiNHg5SVFOWlB5emhZWmU5M3JCUjB3Y3VGZGJDVGhY?=
 =?utf-8?B?MlVwQm1FTDNVcUpmQWwrRUNCMGtxRzIwRHZrSllGU0ZidEJKNUo5U0MwbjVw?=
 =?utf-8?B?b1hoVmdFZlZtQXpKK3EvT1FHYThaemNCVVQ4OVJNL29kMGtqNUU0MnlUREl5?=
 =?utf-8?B?UXJVRXI2QWNpVjlaUWpmY0ZsZXBYTzdaeUFCYkRxTG1BaEJDT3VWQUU1c3Mw?=
 =?utf-8?B?VmYrUjNDeFVJK2wreHdVLzZmdEFMTnBKNTJnUFRkOHc4a2VFYnIxSHFLZUpI?=
 =?utf-8?B?MXFkdk5MOUZ2TThYMkdZbDkzZ2J3WHpySGJtRkNHM0l6SGk4ZUVPRzZzZyta?=
 =?utf-8?B?N3paVlF5RzNpZ0dGL2VOM0ovUVVySUQvMktsVUhHaVF1NDgxa0tsa1YycDJG?=
 =?utf-8?B?a0NONW0zcnJjek8vMWtCRUxzd1Q4blhEYmVjS3huYThXL0w0NDNTMzRLTk5r?=
 =?utf-8?B?S3BxNGZnNk12cmNNdHhEcnRUZWY3NWZpK1lHTzZybHVyZXN3d3ZTc3A5Vjhj?=
 =?utf-8?B?Wk1OUFFYQ25PRGdveVhYY1Q2QnVobjZkNDZ1UlR6bkhyZkhhTXJRdWVNMVM4?=
 =?utf-8?B?dUxnL294N3NleXpzcWwxVXJkVUNyd2Nld2xYeHJrMzhCVUJnMURLTklTa3d0?=
 =?utf-8?B?Yktya0puNXFGazZJeCtVcXhFY2FRekNWYmREeGJNNVJESE1Ucmp5QkZJMWRl?=
 =?utf-8?B?Q1BJMTZtb1pwNnpwMnkrakIzMy9sYmpiUy93d1FSM2dYb3BxWnpFUHRmeXJq?=
 =?utf-8?B?REhEUXZlVm5ScTJwVk90bm16VUt3WXNqSlNKMWo2aDc1SVBLODBab0g1all1?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2735d2b5-9572-4d84-e829-08dbcb14f6d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:18:30.8870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCQcQuBdCvh+ARhbGxAW3PP4bH9eWyWWgi5MN9VanJLVlf7E8nPNgKX/OJG5rjpUSeeMeicMk/Ws6blwijrU2Erk2BCRHYEb/rcjLSnxXXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
X-Proofpoint-GUID: PihTMFFvnp25Y8CkhwtKOP3RdjhhGnVP
X-Proofpoint-ORIG-GUID: VHVkAc16RYu5es6OUMB7XTWZtizM-u8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310120092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105444

On 22-09-2023 17:41, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> A malicious actor that has been granted Guest Operation Privileges
> https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID
> -6A952214-0E5E-4CCF-9D2A-90948FF643EC.html in a target virtual machine
> may be able to elevate their privileges if that target virtual machine
> has been assigned a more privileged Guest Alias https://vdc-download.
> vmware.com/vmwb-repository/dcr-public/d1902b0e-d479-46bf-8ac9-cee0e31
> e8ec0/07ce8dbd-db48-4261-9b8f-c6d3ad8ba472/vim.vm.guest.AliasManager.html .
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-20900
> https://security-tracker.debian.org/tracker/CVE-2023-20900
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../open-vm-tools/CVE-2023-20900.patch        | 36 +++++++++++++++++++
>   .../open-vm-tools/open-vm-tools_11.3.5.bb     |  1 +
>   2 files changed, 37 insertions(+)
>   create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch
>
> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch
> new file mode 100644
> index 0000000000..1b51e500aa
> --- /dev/null
> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch
> @@ -0,0 +1,36 @@
> +From 108d81c70d0a6792847051d121a660ef3511517d Mon Sep 17 00:00:00 2001
> +From: Katy Feng <fkaty@vmware.com>
> +Date: Fri, 22 Sep 2023 10:15:58 +0000
> +Subject: [PATCH] Allow only X509 certs to verify the SAML token signature.
> +
> +CVE: CVE-2023-20900
> +
> +Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f31c40c725fb0b8520b16]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
> +index aaa5082a..ad8fe304 100644
> +--- a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
> ++++ b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
> +@@ -1273,7 +1273,14 @@ VerifySignature(xmlDocPtr doc,
> +     */
> +    bRet = RegisterID(xmlDocGetRootElement(doc), "ID");
> +    if (bRet == FALSE) {
> +-      g_warning("failed to register ID\n");
> ++      g_warning("Failed to register ID\n");
> ++      goto done;
> ++   }
> ++
> ++   /* Use only X509 certs to validate the signature */
> ++   if (xmlSecPtrListAdd(&(dsigCtx->keyInfoReadCtx.enabledKeyData),
> ++                        BAD_CAST xmlSecKeyDataX509Id) < 0) {
> ++      g_warning("Failed to limit allowed key data\n");
> +       goto done;
> +    }
> +
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
> index 4670a85a67..cf3af007b9 100644
> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
> @@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
>              file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
>              file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
>              file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch;patchdir=.. \
> +           file://CVE-2023-20900.patch;patchdir=.. \
>              "
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105059): https://lists.openembedded.org/g/openembedded-devel/message/105059
> Mute This Topic: https://lists.openembedded.org/mt/101519654/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
Gentle Reminder !!

../Narpat

