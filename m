Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6474C4167B
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 21:44:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.57623.1669412645611454378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 13:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=E+dax7Or;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328117f31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APLhhXO020771
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 13:44:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=8K1N6X2iFEErdyu5qQlEL7cXl+fnAXHYyleWp2+OuJw=;
 b=E+dax7OrsAYLhgpO/go9OC/mN0AINPzuUziXsq00SzaR5iDM8FCWCNqR3Zpiku52LB7x
 OeqvZOqbgMSiW6i1pEGiG50048mGaI6Letyq7xoEMYNacf/HhWZhECAM2HDICkPgsKlg
 VDf8GYTWBmPjpuDj1SU0i7jXxiEm4gT6Lvm0nVtXTC7/Ry+A8KgOl7lizp6n/LTZesqB
 GA+viGevDlAAjUgAy2VbEnsgv9imnQb/mQx3vFidrYt5Gxq7192ukVj3FKyDzzmsn3fH
 PrILjACf5X7ckJ0Rw2hMlPisD3Nzs1syUlb/Gk6gvD7Kzh2lI8ArPfmIzedrNdfAEkw9 Rg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqd3q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 13:44:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICI6q09K5X8Y7faUIg52xG+ECSqJpZk6uKBuqe6nZYLfr30exrWel5TJbbSwGndOzGJHnDq7Zti7exJS8ag1BWNSgqrsaWvY8cugAdU8gh0DXvxpsOHK/BuE0jTXdVf3TXVccb4t+ugRj2ba85OAC8PZvJZw5JNc+Nb7WMmTDDs6+aEbyqWJemQr8J7G77eNz2tTNMwkGQDBxNtNP79k7dxG9dV0t/opGT5+gUIteMahxtRQyFuSgazWSKg0q80wCjkSXXNp88EhSzj7X8rfbm+vvAhQTcpZuQ9yL+8vAtNGrzNGpAqnxu3SpGJ+1Ggoqdzep5mHslh2NFO8flo9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K1N6X2iFEErdyu5qQlEL7cXl+fnAXHYyleWp2+OuJw=;
 b=oUSwsGJ8pUzxESZ8PO/RjxuGWHHqb/ri2xn9RHufv5UNprlLt7K8yQFJSGm/9C3dFx9L+Qs+XA6AaE6TCFVKwgqIOmaDIpN8N70fxdUccaMfa1le3vOz/LA3ATGoPBHX+wrRVdWV6xhSpLzIWSOa/LQIiP4tXtA8jxl0iikrN8WBTHh/fSL9HqTU1I1IK7zwe0VAQPgVmfzBJgRANYnbxTcDU0WY82CucntiT+fs2qf+ZQf2sSnG3VpLMIBV99ZwDwx5BkBaHLL3FoHDihV1sJqW4Q89ovsLWeCkDdB9WSObKkso3RZZHgDdXXStBVMljHPnXDkoBMTku98f0Vq2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 21:43:58 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 21:43:57 +0000
Message-ID: <14007093-433c-cacf-3cde-04f90bf6b8c8@windriver.com>
Date: Fri, 25 Nov 2022 16:43:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [master][PATCH] python3-inotify: add ptest -> v2 please
Content-Language: en-CA
To: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20221125171044.3649193-1-zheng.qiu@windriver.com>
 <baf5d0de-4416-765b-2dce-117fc97e7916@windriver.com>
 <06C87C3F-2EAB-4AB5-86A7-80A900C7CFE3@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <06C87C3F-2EAB-4AB5-86A7-80A900C7CFE3@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: f646ac4d-cf5c-42c5-9dda-08dacf2e282a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XDH9oIBIcJuBmQawwxOqku5lI4x8OEsyN+ym7/zOzgFqyqKWl6xOiO2rvJgQOe+VyNAW2u43xnOTTQWfLjFVzB/aB5qFncTw1nk2xsGdfovB/AX7m02U65o0QO8W1O3MHw2S0nQPOdpvQ/F/kvHb/pXSMJhpqvGiBVtFVXsMjapzUQ19m4NynEFX12GM9Tdt9nS8XcU1Bk0dfOtEGK005oSx1/T2FaOd9wRC1dBTUQEHN7ArnpaWcpIZ8F6UaLc5IrDeFmvGyH8Xt7PJPryZXpk+FIe2L/vrPJ5dBHW4m3xXrm3TRjalAOOxNPt7aPW+ys3MlAMAAaoIDd8T10nKsiqRb47xtvrZO3gZkCWOrSFGnSPgviXZnc/NTCAmUWOeiY1NT1JdMsdy7OIgqdWVdG0Ep3Y2ht+ybDbpTBYITfJ5F+G2cziSl9ZWDatUDCsU7r/yhtlHwbao5NP3BWPSYViD6oNG8pkGjRBxXQNSPObCOZGBMfnz5UL44KQPqsyJMTczVze047yMUZfk/3nOLLH9oGm5gtqbSs4heuRveWjTHLcjoMadneLJo/CS9QQRO219eo3FpZnjLUjIqKpNziVm8ez+sDWPJVemYFmVSnzQgRpQdo1NsQJQx5RxGr0iScdCMTlnW17+qaLJqoWo0sGZiwKmrGKDpeU0fVMvNBrFAXl/zTL910oKrFZZ9bUwDBLSSKmmH/SermpHFwYV1H/Yd1/nBQD3345LcFVn+gM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199015)(37006003)(316002)(6636002)(4326008)(8936002)(8676002)(5660300002)(41300700001)(36756003)(66556008)(66476007)(66946007)(83380400001)(66574015)(2616005)(186003)(38100700002)(6486002)(478600001)(31696002)(86362001)(26005)(53546011)(6506007)(6512007)(6666004)(2906002)(6862004)(31686004)(4001150100001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UExWaXdNcUlBRUR4RXlycjkwTjFYMWRUZEZDOUhscDFOUFc3ZEh0bFZ0VXBq?=
 =?utf-8?B?MCs3NHVtUDRJbEFJZnR5U3dMT0Q0TTN2S3dTS1pjSlRHQkFQVzVwZkJ3VDZy?=
 =?utf-8?B?YXZHVmNrdGtpVzBHVFVDTjh2eG5qMFhxNXFmRzh5UnVYU3hRRjRxajhDLysw?=
 =?utf-8?B?aWZQeUV6bzlDR1dlNnJhQ2xic0lMNE1QcmVHRmI5NnUyb29md1JSS3loUDZi?=
 =?utf-8?B?eW8zREdMQ25meitxQktWUEhjeE85S2tlUVFaZXN6RVl2TGdhYTJGaC9xTWo3?=
 =?utf-8?B?OWJtQkhpNE5jcTJVenF1dG9ubVhjN2pSNC9lZHA4TjlEblBrc3NEaE9YdUdN?=
 =?utf-8?B?cy9pQTNsZHZMbFNSbWxDTUZCWjZnMWdJLzFuWG1xSkNtRXVkL1pZSXhpWXMz?=
 =?utf-8?B?Tlc0NEROR0lCeUdCa3cwdXlPZEtXYXNvaWhGaWZST05HSmt1R3B2YkNuL2FO?=
 =?utf-8?B?YmxLYXdvUndkS1hvSXNBWkUxNno4eStKbXV4Z2g3RnNwNzVyT2ZFSXcwUi9B?=
 =?utf-8?B?NHh2QWw2ZURrd0NBWjJOTmxFOGk0ZUZpQUxFdFFXTk0wRmtGOU1KaTd0VjF3?=
 =?utf-8?B?WWZ3MW9xTVBrNUtWTVNPR2k5NUFGOVZBWjJGNmxheU5lTEZMOWhYaE9BVC9G?=
 =?utf-8?B?L01ZRzAwbS80YUdCemIvd3I1dWdFQTM2K2NJQUszQVArTFJhaGxVc2tRMk5n?=
 =?utf-8?B?VEVFelduQTlQc1hUaWlEZmRVREIvUWQ5QkpUUkRIb2xseDlQL1B6N09Vdllo?=
 =?utf-8?B?UExtRkt4alFQdEl3TFlneWZkbHhpbG9tcWd6Rzhmd0FVMTRRZ24zOEpiL1dr?=
 =?utf-8?B?LzlGYmw1WkErUnFjcTVQYmZacmxQWmlMajZpVXJraUtiVDBlSkRsQmRBY0Ex?=
 =?utf-8?B?YlNORDcyNUpaekRrYlJLUGJqM3luTGEzYU5XQjkzdHhqM202OXNHejVsQzBW?=
 =?utf-8?B?dlNzMWFsZVRCbkoybjN4Z20xVzdyblBJalFFb3hhS0NyL0p2d1RBS3pNVXNH?=
 =?utf-8?B?UzAwRCtMOUFKR3Z4eC9XTEMxMjlLaWVzcVd2TjZWMFBVTC9EeS9JRDFzZ3Vp?=
 =?utf-8?B?KzNET085VFc5TXNaSk56M1ZwRUdhMkVESEF6TE1ab3AwRTR3K2ZVY3NwRXU4?=
 =?utf-8?B?VlNlNzF2SVpzcUJpcFRZY29oTGswR2FoTGZGUGdsMkZvZjV2em9ZUTl2aEZq?=
 =?utf-8?B?cGxITm9ycTVpWXgzKzVGemR3c2VwdDdqT2haZ0tRYktLbkFCSHhraEI4N0Fv?=
 =?utf-8?B?enBna3ZoQjhGemo5NzZPQW5zTUh2MjJIY3NYZW0yTHF1cStMOE1hWE9ETHE0?=
 =?utf-8?B?RHFwZ1JkL1NkczJscDJxeVhTU2pwYWtkWDFOek1zS3pMT2JaU3NIZEV1MFli?=
 =?utf-8?B?cjBZN3VGTEdQRkZvYTBVOTRnWG54Zzc0b2VQWXZqRHhYaGIrQWJEaHJzOVhB?=
 =?utf-8?B?Yjl5Sko4UVVrclQ4MWd0NW1XZ0pXMEpZZ0NpUnhNVmV3ekdpVi9lVUlVSHBV?=
 =?utf-8?B?WWpDYWw3WXJCeDdtbkFVTjFHREhpam92aE9TWjc5NE9pVVVCc2xxTW11bGl0?=
 =?utf-8?B?WlArOU8vZlQ0SC9WRHdNcFJCaCtaYnZqR0dYOUZBMTJXYjlCaElPNHE0UFUv?=
 =?utf-8?B?TU9TTVJYTS9yb1V2TEdVVFdtU08rRDlZbGhQVW9sZmFxTEVZU2JMY3dVcGJJ?=
 =?utf-8?B?SytxWTM3RGEzbnBERFFLWXdBajFaWjdOMjFnZDE2NytxQm9YYjVjYWZCU2M4?=
 =?utf-8?B?R0FyQmdkNkRPRzAxVXF0SE9HeVZsUXA3amtNajh1WEhjYkh2UlFta1I0b1A4?=
 =?utf-8?B?V2VPbFRjeWlEODM1b0FTNHk0K0l4a0Rra3FCKzdWczA3c2lsS3EwLzBlUHVI?=
 =?utf-8?B?d0RtcVR2emlLRStyQkdHY0JGVWQ1SVhPdnhITXFYeEsrY1dRdzVMTG1KbnNk?=
 =?utf-8?B?ck9VV09GanRwN1U4aGY5WG5TVFRvYktpTkRqaEZQNFVZOE53QlphVGg3SHZo?=
 =?utf-8?B?VkVlN0ZLMUNISW1Ja1lkNjNxVDhxUGo2K28zNnI4TElvSENzL0c0Z21OdXh1?=
 =?utf-8?B?U21YNkhuQlVjZkI0bVlYc0tEcFFERjNMcEt4bFlxTzNOMmdCdDRwYVhuTEcv?=
 =?utf-8?B?STRwb2lLR2FNQ01GMHN2VlhMY0ZtYXV4bjVYbHUvRDNrZ1dzeTFaRDgyclNu?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f646ac4d-cf5c-42c5-9dda-08dacf2e282a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 21:43:57.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYEbIo51ax8nnRSYw1XkLCPSheAabn0suY4PwpHlMomBzX0DrzzXN4/cw1UDdC2wWI6/XIkqdtwkewvGI876PJpgdCX0w9fPDBHhwoev474=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-Proofpoint-ORIG-GUID: vtP8M8CH_4871ZFwZb3wLNbZPO9Pk6-Y
X-Proofpoint-GUID: vtP8M8CH_4871ZFwZb3wLNbZPO9Pk6-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_12,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250167
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2APLhhXO020771
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 21:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99741

On 2022-11-25 14:55, Qiu, Zheng wrote:
>>>
>>> +
>>> +SRCREV =3D "f77596ae965e47124f38d7bd6587365924dcd8f7"
>> This is the current head, which is fine but add a note in the=C2=A0 lo=
ng log
>> about that choice. It's
>> $ git log --oneline 0.2.10... | wc -l
>>
>> 14
>>
>> commits ahead of 0.2.10
>>
>=20
> Will change it to the head of 0.2.10

Hmmm, here are the commits, most of which don't affect runtime:

$ git log --oneline 0.2.10...
f77596a (HEAD -> master, origin/master, origin/HEAD) Add Dockerfile
9be6a51 Fix constant in adapter to match with DELETE events
    ^^^^^-------- seems like a bug fix that we should pick up. <<----
269d541 etup.cfg: Add missing newline
8e79335 tests/test_inotify.py: Canonicalize import
f844ea2 Added setup.cfg option to make bdist_wheel create
         a universal wheel.
53fd4ea Increase test coverage of Inotify initializer (#76)
0d802dc Update README.rst
f0d5b98 Update README.rst
9075acc Fix for issue #66, removing 'nose' as a production requirement.
82d1439 .travis.yml: Use 4.x version of coverage package
ebffda0 .travis.yml: Drop 3.3 support. Add 3.6, 3.7, 3.8
983049a .gitignore: Add ignore
cd7b276 requirements.txt: Remove nose from requirements
7202fc4 Propagate superficial parameter to remove_watch_with_id


Here's that one, reformatted, patch:

commit 9be6a51d1660991562eefaaddefa757ca0e0e00f
Author: Rapha=C3=ABl Beamonte <raphael.beamonte@gmail.com>
Date:   Sun Jul 29 01:24:52 2018

     Fix constant in adapter to match with DELETE events

     The previous behavior was duplicating a block of code and making
     one of the two useless. This fixes that by replacing the constant to
     IN_DELETE instead of IN_MOVED_FROM in one of the two blocks.

     Signed-off-by: Rapha=C3=ABl Beamonte <raphael.beamonte@gmail.com>

diff --git a/inotify/adapters.py b/inotify/adapters.py
index 7f3f708..e8301da 100644
--- a/inotify/adapters.py
+++ b/inotify/adapters.py
@@ -299,7 +299,7 @@ class _BaseTree(object):

                   self._i.add_watch(full_path, self._mask)

-             if header.mask & inotify.constants.IN_MOVED_FROM:
+             if header.mask & inotify.constants.IN_DELETE:
                   _LOGGER.debug("A directory has been removed. We're "
                                 "being recursive, but it would have "
                                 "automatically been deregistered: [%s]",



What's the impact to users of not having this fix?
It seems like a bug fix that we should pick up by backport of
user _git and HEAD.


--=20
# Randy MacLeod
# Wind River Linux


