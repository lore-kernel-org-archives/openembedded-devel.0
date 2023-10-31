Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BBEC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 12:16:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.184755.1698754599718770096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 05:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hmVQ1Usc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9668142cf9=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VBcnXZ003208
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 12:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=QwV+oG3LQFBIkwPDWIrvLeURy96DkcYrszRk4+X571U=; b=
	hmVQ1Uscc34Bx9cRrAL0Y/rmlD+DL2AxdOraz3C4uFubLzwL4MP5ryFf7yMabLSA
	sQS38eaZtnDMT9PjWdk/daA/mbsefJVALCxPGxT1la+W8K6ovthUWmN4Cuy0x5WF
	UOBZd9MW/FEQuf5NDgK/ivOKMi8OVRFyFkS3TYLQU50AaqF8Hi401quJkX2g0HrE
	1wZRr4Fnm8cr7YmgPMW0AZvA3XQoLJe0DKB/hsZ0neBuD7lmwtlaot7c4UXNOAJl
	DAbfwKxsdY03npC2lvT05l4m9JEMkg96ijaTlSWHyOEQGceh/7q4+Zy2aZYNsFIk
	4bjCwJcUfkQt63oX6WLYOw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxuggn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 12:16:38 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39VCGcmG004337
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 12:16:38 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxuggk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:16:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjDoWl2PZwwpe6QnGvD4b856/4MnSOUvTJ3DiZp3VKslF/2Wh2bFiukoT4aB6RCiuVqcozUW9Oeabuc/n+rLNpCKpdnq3wl3Ey7Nb/t/0ZaJ5zGM88daGWmJuftqWDTCE+NHMZEPBm+xX5aFO0H44iVfZXOYCInpwZwXwwH932Fi1Hmityu6YSZot6ijLixnzSGkoWvXd8a/vNuBCrhclJkkviKXqQTq+rTkKZlR3RKtkbqI/v0Myx15z2oRHUNL0St3IsmL0ob2wZzptbx/nF9oBdc1etyw4zXuVpcfn6lqyW3pI2W3rmew+4FkIZ2h/3yDyd43t59jNNyGgYHJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwV+oG3LQFBIkwPDWIrvLeURy96DkcYrszRk4+X571U=;
 b=fUt27Qfmiefl66CKta3q8ktxtdg3ZENfzjDChWGPUbxAlGoo5Lh8rfBdgsksaL7uvrrAD+hZCOF5Mzvhlt+eyrAtdU2J9f6ylaD3ywP0hfsfzjCrMfy882DYjZWAIouJ8gVq/hONFtcyzjIPi0Du11PpIFob30pttbjb4q6lvHVJb4TKXTFg0iAPJG+oMKvAXyLe8ia3zFNfi6d6zjB9To6Mry6ErLsKvi+Vri+ukX0NaISs9jcymQESPqy85BtwV2gX0axpXHW7059QnBzwBF8xhUvZQWJ0Rktnxo/AROtps9b2daQ0++pcA2YVjrsUXUU7yOFzvmP2WQvx1G7dSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Tue, 31 Oct
 2023 12:16:34 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::fa81:7416:3c85:80fb]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::fa81:7416:3c85:80fb%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 12:16:34 +0000
Message-ID: <2174b543-04f3-4cda-99ee-6b366e2ef669@windriver.com>
Date: Tue, 31 Oct 2023 17:42:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] open-vm-tools: fix
 CVE-2023-20900
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <1787376B597A1E36.28251@lists.openembedded.org>
 <178D581CBA90C2A9.29357@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <178D581CBA90C2A9.29357@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|MN2PR11MB4680:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b73569-f97e-4571-804f-08dbda0b3956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jqejM7Jn5Tw19/9sp5pUqPhzb2Z2gAOlh7aS9MSs2prSogv+aJwRS2naIzujEeBOrULuxCFMQR3TmkXBVsyQ1u/eO1l7eH6gFJAewzxjMQsIXlH/+nI1lr13rUQnDRpK/DS2sNwE22uRfPk1qdsxyd1ePEEVWlGe8ILBQky/yO/e4FEtiNxLZl3FZirFGpHiy/zyE63tpcLF9FUb+9AgN5PenbT86T8rZtFhbWeSCvMzpuZDbPJ2ScAY9u2yMjewo+K7899H0I53U0uQriX5gt7zpk5wBGDwwHZpHV+EZxjGDWqE5i2Sfhmm+nSli55gU2lbJ4TszlsbgmOFd55yJer6GgtpkRsKLxpQLYY+WMnIbbTdJEssOyRmhFUQPTSmC8kwADvVXSWBFNHw4A8TY0eLitEQ/BK2bjXN4EZ+Q3IIXa3xNll11LUMbKSzVAijLbHGZRuPlRgMbwnPSkXUb372/jFLfEDNP3i6zkqbx2laoP8lCPJgcoH85n9Y2Lub0P7XypsY/Dxr8X9KFJT3FEJTvvRWfIxN8qIwdmlXmVu3krutdaHt5yojBBHYrPGLqWy8luGYKcVCv93O66a2pc/A+zx4+nAkgZombwfWbslM3EsLEUGpdZ181LiETzGB+hz6JimkhwvxRSnPRipLfiGZn9pzaLiYMqjQnsxtkfuH0Cil5dYkDYKLEfrrUfRuO76k1PO3NOECGiF8KSHrPVL1QQQHlVKyO5YQfF3jrLk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(396003)(376002)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799009)(6506007)(6486002)(26005)(6512007)(55236004)(2616005)(53546011)(2906002)(478600001)(6666004)(66556008)(66946007)(66476007)(5660300002)(8676002)(83380400001)(966005)(8936002)(316002)(41300700001)(36756003)(38100700002)(31696002)(86362001)(84970400001)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlFLbmpkU3IvRGNYRG05R2taQlhJWjI4MHp0VVFuZEN2bE9hNTZYK2FqQ0Ns?=
 =?utf-8?B?TlZQU0M0aWc0NnhuRGl1aHFRY2trQm5MS2JtSjlOQWZ3QzNReEIyL1Y0VXJt?=
 =?utf-8?B?eTJ6R0tWbFZJK3dETXFGWWNqSXJVYkFnSUMrUEpsYkhMWGNveWdORGxJdlc4?=
 =?utf-8?B?UVM0VmxhU0FxNVM3K2Z0ZmIyMGRibXNyN0R1LzRzcUFERERXdHFuQ0V1VTZj?=
 =?utf-8?B?c3JBcTRVOFRoRzRxVzhPNzdXQ1QwcWkzWTJCWGczQU8rdCt6TDlESVh2YSsr?=
 =?utf-8?B?c1JaWHBPUDhBRnB2MFVvSW1RaWsrYTNDRm9kaktxcngrK3NnaE5TYnRueXZB?=
 =?utf-8?B?WkNQRkdmdXFjSDhPNWI5Nmk4R2ZwMW9JOTE0NWxoc1A0YlZzMXhLNHRpLzZ3?=
 =?utf-8?B?bFB0bEQ5cGppN3FTazFmK1RCRWNnenVFU1VuUmVkMVJwOW4wY21RakIzTVR0?=
 =?utf-8?B?UDNsNU5iaG96OWE4T3l5SkZGcEgvY1RkU1FtSEdyVTQyZDJHRkFPZzhQaVV2?=
 =?utf-8?B?VVVxRm9YVUdYWjlEOS9sdzl4V05HbCswVDE5TXR5aFJUSUVpVkJqUnA5K25S?=
 =?utf-8?B?VXRmRS9JbDBWcUhaTlFhMlpFOE9kek5aaU5mc0YzZUdqSXA4UFRVU0V3Vmo0?=
 =?utf-8?B?ZzhWVG05V2h1cTl6OWZ3VzR4azhzTm9MQk5Fc0ZBd2ZnUktPZGJVNGhycTNi?=
 =?utf-8?B?L0ttYWU1SzFPVG5HaXlTS0ZQZmtUOHRKTzV2VFl6eW04Y0s0N0djNDNiZW95?=
 =?utf-8?B?T1g0ZGhPZ0JRemUySUlKaElKa2xnek02bk1IU0grY1ZkeDc2UVhOcm92b0Nj?=
 =?utf-8?B?dHBvUUpPalU1T04xRDZ0Q2NTZXR2RTh2UUNSbzdUS25Uc3F6RjliT2JqWi9C?=
 =?utf-8?B?OU52b25hSHdianBqd0tXMnpIVnFvUDNqdUFzeVNTdm1oQUh6OXc0SFNrSHBm?=
 =?utf-8?B?cHhCYnpkMk9qNGFxcUZhMnZRcm41YzEwMk5kVVBJU2pNZEFWeGRiWlFDU1Z6?=
 =?utf-8?B?QUdrRWNKeVNLcDhCaGRVOGRVOFZ1UHp2aGtWTGQrbHgwM1pMbGt1VnlxSXVN?=
 =?utf-8?B?eEFndmVROUlNcG5zSXhZZEFMbUhIT2NJUlVNTXYyamFoWTNYUmJEenpYY3lC?=
 =?utf-8?B?VVB6QWF5WC9VWWg0b3hIM3JSUWxkYlVWWTd4cENiT2NybWhsUlpVZC9ER2Vi?=
 =?utf-8?B?Yk5IbDhZOVgvZGV3cHVRc0IzQUJQbUNTNUdLdlVidFYyTEgrYWg5RmhITmlO?=
 =?utf-8?B?NVVlaHI0M2UxREJ6TFhXcDRUaXZlVktEdkdhbTJ4ZkhaQmt5ck9DSmdUKzNL?=
 =?utf-8?B?bkpFRUkrbW00RUFRc29yY2Vud0hZZ00zVmZUR2lSSEN4NjRkWUJkekxaekNB?=
 =?utf-8?B?emF0Zlc0WTByUytzdFJ1R0FONUVtbFl5OVhyVWlzVUNMeFBDTFJKclBDbUEy?=
 =?utf-8?B?VGxhbmJWbno3TEcxYXRlTnJZUGNLMU1VZGR5eXBzVGVVNTFtdEtnSmMwZjBv?=
 =?utf-8?B?VEhYZkFCWC9WWnpnR1I4L0lhTVR0RDM3bXQ3R1hTc0FMSlBqMm1KSHA1aHZq?=
 =?utf-8?B?QTFvbTN6cVZ6cDdnZXJNTHp4ZFFpczNEN25FaDNMUmozdU5NaytsVThUdUpo?=
 =?utf-8?B?RVRGZGs0eXBxaGpnYkRGb0lYNGgydElOT01VN242Z0JhaXRLTDNuRjdhY3o4?=
 =?utf-8?B?cWdlNlRqQjV4cXNNZ25vQ2dncndFMFpDMDVhS0pZWEU3b2QzOWF5VUNmL0RB?=
 =?utf-8?B?Y3pMeS9OZW0rRzVlSWduaXVHS0QxcmM0M0tUeDQxOW9NV2RqR25ZcWVLWU9Z?=
 =?utf-8?B?SjNlZGxlZG82ZUxndlNoUVROQU5RNjJUTFZLZ2dxTHFjNUVicUNMT3ROdWph?=
 =?utf-8?B?RWhlTkhTYlVCUW16bWRLWmRKTG9vVHNBMGtreWFSeFI1N0VUa1NTZFZQS2dD?=
 =?utf-8?B?djlmbzI1VTVLazV0MUNWb1EydzJuSEh2VFBmTnhuSVpUZzdkdWtQYzdGODla?=
 =?utf-8?B?VmRMb0g3dTV2SXNiVTB0MEl2K3RwMlUxNjFoL2dUV1JqbWR1UnQyeWE3Sm1v?=
 =?utf-8?B?dC9jeFc0THpXMkxJT2FQVGNEMUpCYWdDcFJ4eElBa0pGSWFkZXJpbVVmYWRX?=
 =?utf-8?B?SUxGbFIyaFo1UnpjU0k1c01vWUtORXdRcGNaY3pUR1laUHhKbWswamlVR01k?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b73569-f97e-4571-804f-08dbda0b3956
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 12:16:34.5930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4K+hTfmGvn7F1DgR433FMtexi1Y2Q9WO3Yz7P4gkUBFWcIqzCQCu+VhHE3ShuPMkd4JYJQxuR4zcVwPrYspp3M91bDcytQa2U2qQmDzRdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
X-Proofpoint-GUID: iC3IL_QacCOdSgdcELPGrXwz0JpQphTE
X-Proofpoint-ORIG-GUID: 7lljNWyckPAXkiSIfEqmTinNmB0RWAL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_01,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310310097
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 39VBcnXZ003208
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 12:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105802

On 12-10-2023 16:44, Narpat Mali via lists.openembedded.org wrote:
> On 22-09-2023 17:41, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> A malicious actor that has been granted Guest Operation Privileges
>> https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID
>> -6A952214-0E5E-4CCF-9D2A-90948FF643EC.html in a target virtual machine
>> may be able to elevate their privileges if that target virtual machine
>> has been assigned a more privileged Guest Alias https://vdc-download.
>> vmware.com/vmwb-repository/dcr-public/d1902b0e-d479-46bf-8ac9-cee0e31
>> e8ec0/07ce8dbd-db48-4261-9b8f-c6d3ad8ba472/vim.vm.guest.AliasManager.h=
tml=20
>> .
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-20900
>> https://security-tracker.debian.org/tracker/CVE-2023-20900
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>> =C2=A0 .../open-vm-tools/CVE-2023-20900.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 36 +++++++++++++++++++
>> =C2=A0 .../open-vm-tools/open-vm-tools_11.3.5.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>> =C2=A0 2 files changed, 37 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2=
0900.patch
>>
>> diff --git=20
>> a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023=
-20900.patch=20
>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023=
-20900.patch=20
>>
>> new file mode 100644
>> index 0000000000..1b51e500aa
>> --- /dev/null
>> +++=20
>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023=
-20900.patch
>> @@ -0,0 +1,36 @@
>> +From 108d81c70d0a6792847051d121a660ef3511517d Mon Sep 17 00:00:00 200=
1
>> +From: Katy Feng <fkaty@vmware.com>
>> +Date: Fri, 22 Sep 2023 10:15:58 +0000
>> +Subject: [PATCH] Allow only X509 certs to verify the SAML token=20
>> signature.
>> +
>> +CVE: CVE-2023-20900
>> +
>> +Upstream-Status: Backport=20
>> [https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f31=
c40c725fb0b8520b16]
>> +
>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> +---
>> + open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c=20
>> b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
>> +index aaa5082a..ad8fe304 100644
>> +--- a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
>> ++++ b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
>> +@@ -1273,7 +1273,14 @@ VerifySignature(xmlDocPtr doc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 bRet =3D RegisterID(xmlDocGetRootElement(doc), "ID=
");
>> +=C2=A0=C2=A0=C2=A0 if (bRet =3D=3D FALSE) {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warning("failed to register ID\n");
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warning("Failed to register ID\n");
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>> ++=C2=A0=C2=A0 }
>> ++
>> ++=C2=A0=C2=A0 /* Use only X509 certs to validate the signature */
>> ++=C2=A0=C2=A0 if (xmlSecPtrListAdd(&(dsigCtx->keyInfoReadCtx.enabledK=
eyData),
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BAD=
_CAST xmlSecKeyDataX509Id) < 0) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warning("Failed to limit allowed ke=
y data\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +--
>> +2.40.0
>> diff --git=20
>> a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.b=
b=20
>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.b=
b
>> index 4670a85a67..cf3af007b9 100644
>> ---=20
>> a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.b=
b
>> +++=20
>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.b=
b
>> @@ -45,6 +45,7 @@ SRC_URI =3D=20
>> "git://github.com/vmware/open-vm-tools.git;protocol=3Dhttps;branch=3Dm=
aste
>> file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;pa=
tchdir=3D..=20
>> \
>> file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchd=
ir=3D..=20
>> \
>> file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch=
;patchdir=3D..=20
>> \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://C=
VE-2023-20900.patch;patchdir=3D.. \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 =C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D "stable-(?P<pver>\d+(\.\d=
+)+)"
>>
>>
> Gentle Reminder !!
>
> ../Narpat

Hi Armin,

Gentle Reminder !!

It's pending from last month.

../Narpat
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105444): https://lists.openembedded.org/g/openembed=
ded-devel/message/105444
> Mute This Topic: https://lists.openembedded.org/mt/101519654/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[narpat.mali@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

