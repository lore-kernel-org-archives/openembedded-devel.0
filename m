Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EAFC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 20:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13886.1684874017126066194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 13:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=H4XmBcnb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=450754b2d1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NERLux031501
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 13:33:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Ird7kFM3otCUrLARRZWgC/zxzKNv6proZmYpAB9VQv4=;
 b=H4XmBcnbHDvaOFQXagnPQZ2s4illK4+BSstUk9vAK/ZsWNYOSvNXXRLTKsUoVKikDhe/
 Y96Gk4I2NwJO30yh0KkPoyUbtvD89wBvgyqCwv5wihHpfpHiAkbYmPrpxY+/1M9Pj47R
 dxw4KJkK+LVPXDIigi8DI1TSGqW3C6NBWfun/aRXLxggKg+09e5dUn/+D/E+1ZgS8Jz/
 dOVsC0TFmjE1zxjR0fYr+jGrsAlYRABvDcDXSf4L/vczpRT4v4MoF0RCRx72UskhZeTz
 iEnTOT1pg+Ktu45lunkKs8iINGpC6trUOKO/VGZEgr8OURDAi51y0jhEDiej46un+LEk Vg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1k4yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 13:33:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIMTpwrgBzVJd0lvGW+YQtWQTUxSQlnnxyfssdXTs2SvwIhBkhmrgtszdzXrnT20hel/9g/EVWKJB1rGs+CGKRCuj5b8Sq5nfGyxDe6BAjQZ3VKm55HOkCC7TMgpt1Y87sc5PPdSIl/+XELjLJLuX0BKFHrW+c20EnwZoVxbfwmOd17VRblqxVEVqMV1HdmgISO72ilnK4Vmr3+IiOLv0/5uiG+/vDBykqd0cz7QhJCGnIaoI2ZFIih/l5aE23swSv1EqaY9avSu0R+hiz6I6Ccxlzaw0oYwfn7/hu5CPBoE2NW2eEkLNT9PdhrugOoxm5fW8xbDCBg7NMEG3D/xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ird7kFM3otCUrLARRZWgC/zxzKNv6proZmYpAB9VQv4=;
 b=nvT3hi1OmT/Lutwf1UUsckUaJKsqumih1p3lSCUijh9ITQdvbAz2KPcHgfoEwI7c7I8l9wA/SLmO5oMAp9DSsYIz58lzYARR95fjk4Wc2h+cwulX7JwJmmH9z2cst9bFW/04QxzEuHww9m3Nw5rx7EXNhpR5GBCydPN7h8HbcyZiZBMZ3BG9WMAgcbf1SAwwdzYEK6UKRWesZr1+Dt02H6Xu+qHa2pPFQeiWc4B9AnpNg/n7GyJA+W3i8oppdRadPc+hICAwyj/08DEp6soL4eaJYbHAviYFHxs7yD3T+8iNldUAZbT9vHVhoeAuQZIMxdHF2LHs2LEAIyghTZgcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 20:33:30 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 20:33:29 +0000
Content-Type: multipart/alternative;
 boundary="------------OkLe70fQRrGremVpyZDCWdLJ"
Message-ID: <8c3e9485-88b2-2051-f5f1-1c19dc09159e@windriver.com>
Date: Tue, 23 May 2023 16:33:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [mickledore][meta-oe][PATCH 1/1] libgpiod: modify ptest value
 toggle test
Content-Language: en-CA
To: joe.slater@windriver.com, openembedded-devel@lists.openembedded.org
References: <20230523200144.560946-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230523200144.560946-1-joe.slater@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d9e832-3225-400b-51fa-08db5bccf7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3fgxp7bDBWsRexE3Ngei+XsHK1Dfhf0YmnhzPT1WgkqqAcujTBeP26hdwReaRt6MEtz7O88NYBfjQwN4kZqqJrQz5HlV3nFeoXOwH7ad05n16u9nT8gqiLrjoGArw5RG4OAmiZF5uMBwoNo3JEUG4NQkzQsO4vX6IkeMeCJGgYIG4qFLD4J7KTERaHBK79+k14Te54hYF4jxlEJaEPNDIoJK0pwG50qw89t1uMRLA0FmCRXzmA3kWOM3Iu3YWfvViX6F51p2nftkvZN3OG4+fv9dW3t0K/TnQiuStSFLLv9vICEyn/5OU3Xy8co2N3+KhblMCOPVRMHTmCU6jsxEFz84Ex93bBdMKqZB8l+ZZ5j0h72g6JyymJtznMWD1fo1kIepGhfqQ0h99J3eh6byl9HYnuWoG0mI+J54P7uim96MartmaQlz2Fe7b3dfBlvLw320XUMZOJsILuOEw0mL4vihiVZo5LCd3gs5DM0v8BY/WMcm9/hX2StuRFr34/P1urxI4/vH/f8kappQ7Oq2ovQx8lfzEJI9CNWeGClTVQV83ZEekcJ2jm3fK3EJ3bZBmydMt0khAGrNuI/T0Q00c9iKQGIEWe9HxjjTzRvOBQknRqSfsAkSPPqZ5O1EkZcTtAkPd0jlEkfynIyGl7jN2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(451199021)(66556008)(5660300002)(8936002)(8676002)(83380400001)(86362001)(31696002)(6512007)(53546011)(6506007)(26005)(2616005)(186003)(166002)(38100700002)(478600001)(966005)(6666004)(6486002)(33964004)(316002)(36756003)(41300700001)(2906002)(66476007)(31686004)(84970400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RU4rNXBRSVRRSW40WnVlL1kyL1Q0UGJjVEYyZ0RNQS9PV2xnM0JEL2Y1Q0Nh?=
 =?utf-8?B?Z3RpODQ5cml2ekpwUHRja3pBUlhxNkpWZmEvNjltYzA5NmdtZzBiYVBwaDg3?=
 =?utf-8?B?dUVJUUdyRnZzbjRqYk84YVNpMVd5T29NQmxKNGYxcTFEWksxZFhORjloeDZZ?=
 =?utf-8?B?VW9ZbVRNaDRCVVZ6Q29pbWJ2RjB3Y253akFNLzEySHFwY25OY2dXai9Vbmwv?=
 =?utf-8?B?ek12UVNNQXV6Q1FkUElLRGY0MFBMcVhYUVhVdVdLZW5WVWJHOUxMMWNaR0Vr?=
 =?utf-8?B?SjVBZ2p2L3d4MkJvS1BrR3g1OUJvR2g2RkVqc3Rsb2ZMMzltV0hxcG9yOGZ0?=
 =?utf-8?B?RjZybkhoNkJDekxSKy9CaTQ3bWR5VU1jMFZhL1R1SStSeHd1NGxmSEJQRG1S?=
 =?utf-8?B?cVRVQXEvZnhzRlU3dVZaU1JCTks1aEh6elFOY2hsRVpMTmZGZWVKQVZ0a0tL?=
 =?utf-8?B?MnNoOUljT2dkL09sOEswUGxQS2p0ZXBRUnJnYXJTekhuRnhDdi95bG04Q21E?=
 =?utf-8?B?NEdoRExYQllhQnNqWVlObk9IdXl4ampBYy9JL05JQ012cC93NUVRSC9yQXRx?=
 =?utf-8?B?L1VFZ1ZqYkMrMkJyVi92a3NzdWxHMWpGRG04WGlYNk14cG9WNXozNGV5d2JR?=
 =?utf-8?B?VVViSWs5RG9vVzloWGJzNEVUUHpud2RMVWtOeWd6eHRsdG5Pa2FkckNqZFFk?=
 =?utf-8?B?Um5kZWZlcEJjNzljbjE0UzRVb1JSSk82OC82ZlY2N2NTazBVK05VaHJQQVYv?=
 =?utf-8?B?eGRUVGlsZGRPOVZLelpkWnllbkZtaE8xcGpNVjZHTy9nT1FaNFBDUUpLMThq?=
 =?utf-8?B?TUs2T051TmhJZlhiTFFkb3JHcFlML0hQMzNBZlZ0cFY3RWUzL21SdkRlQkNH?=
 =?utf-8?B?dEREZEk2SU1DWVNRd2dPbHhBbVZmNm1RaGFQeWtUbEcwQ3BTOUZtYUFNWDh3?=
 =?utf-8?B?Q09hUHZTNUo3L290OWJ5WWtGUGJkVERqbjZnSnRVMnhtNnVZVG9zVlQ3NjIw?=
 =?utf-8?B?SHU1V242eExLT3N3T1VmNW1yM0sxcktuT1cxMDNWOVY2NmErTXZFTHFjdTVu?=
 =?utf-8?B?aEYxRkduMlFPNXVBc2Y4SCtLOU1YbllOSURVS3VIa1pyaGUySUNBNnRwWENS?=
 =?utf-8?B?b080WXIwNE8xcUhuK2UzVFpmd0YvdHRTK3M2Q0NpWmxhZlpLejc5T0dzNXJX?=
 =?utf-8?B?dnFrU1YvNk4zQXdaaVFCNlNIb1dzdmI3bnBjak4zR1ArK3pHa3ByOERBUlo5?=
 =?utf-8?B?VUNkV20wSGQveElVZnVoSGlUdGVtc3NwS0JHVlFJanAvODUzdXJXa2VOWENs?=
 =?utf-8?B?QXRYLzlybFdwZlErNktFWWZGQmtJRXhZbFdnVmFIU09sM1JPNGZyMERBNzVw?=
 =?utf-8?B?Z1gvaVBqWWsyZkFZQ1RYMnVGMnQxN21Oc1YzdEJidGE4R1dtRHFDNTNxVkhC?=
 =?utf-8?B?RjdrdXFnVlVYNXNHaVVpdEZVclg3YnBFUHhZaEVOK3pDUGFIRlRobTYvb2hT?=
 =?utf-8?B?bWdibGlCU3dxTDg5dDNpQzhRNnpVUVA3QzhEb2pKaGVibUVJVER5V0FnZjBw?=
 =?utf-8?B?VnZvSXlueEVkaExOS0Fxc0xsNEdOeWdROWRkWWVkenhpaytXajc2dlNQc0ZM?=
 =?utf-8?B?a0YvUHhOQ0NHVU0vbUlUZjR4YWZIelBhM1RRdG8zVlRYMyt6NTF4d2JGYXRw?=
 =?utf-8?B?bDZpSm1IU0l4b1o2cnJRMFJabjIwZ1RFcmxJVnYzNVZCcCthYXE3a21SZENW?=
 =?utf-8?B?QWRQOHludEpUOVd6aEVDYW5HVDVRVGdpSGpTeVlZai9YZ2NWN0ZtS1NQQVE0?=
 =?utf-8?B?akgrMXJDYnZpSFRJVjhJUmtYSkRRZUpLYWQydDBGNjJiSEJaMnIvV2Z0U1Y2?=
 =?utf-8?B?NUtwUjM4b1psZlArUXVBYUc1bUNScFNiZnVLclhUSkRHZzR0amdxZjRxK2Fl?=
 =?utf-8?B?WExHUHQrT1pUUnlIRVcwdE1FeVdwclNUZnlnN2lLWE50WU82TTZuZ2Y1MC9p?=
 =?utf-8?B?MWx4SGs0UldPYUt1ZUVSN2Y5N3kvNjJBZEkxRStQYWhzdDUvRFBKN2UvM20x?=
 =?utf-8?B?N1IraWJOOHd4dE03Z2FGZnp0M1hKeW5HMWNidUJrNzFZaEhjNkZFWGR6RWFR?=
 =?utf-8?B?UzBNZDBpb3RIWVJrYVpFYVVGZUxkSmFOZmpBVURCS0NKTkVGQ0pBS1RmZXFw?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d9e832-3225-400b-51fa-08db5bccf7b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 20:33:29.2039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRlOC6jYAqNj1ZbZqjbSHkViutjgbc/BqzNCWBQ3FLmxbzncuNmjy2KfuB2nk+SQe91jMaR0L4TWsmQUUtR2d/UfncDCPEc2rDTt64r6Oss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
X-Proofpoint-GUID: CusTu_wNF8nKkfuUMZLd2WgvM0Tx-bjF
X-Proofpoint-ORIG-GUID: CusTu_wNF8nKkfuUMZLd2WgvM0Tx-bjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_13,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 20:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102743

--------------OkLe70fQRrGremVpyZDCWdLJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34NERLux031501

On 2023-05-23 16:01, joe.slater@windriver.com wrote:
> From: Joe Slater<joe.slater@windriver.com>
>
> The test "gpioset: toggle (continuous)" is modified to
> sync with toggles instead of assuming a delay.

Please send this=C2=A0 to meta-oe/master first.

What is this 'toggles' that you are referring to?

Maybe you can explain the problem in the commit log
as well as in the patch.

Can you send the patch to linux-gpio@vger.kernel.org
and include a link to that thread since there isn't a way
to track bugs/enhancements that I can see in:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/


Thanks!

../Randy


>
> Signed-off-by: Joe Slater<joe.slater@windriver.com>
> ---
>   ...-ptest-modify-delays-in-toggle-tests.patch | 58 ++++++++++++++++++=
+
>   .../recipes-support/libgpiod/libgpiod_2.0.bb  |  2 +
>   2 files changed, 60 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001=
-ptest-modify-delays-in-toggle-tests.patch
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-m=
odify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/lib=
gpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch
> new file mode 100644
> index 0000000000..359b4a2afa
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-d=
elays-in-toggle-tests.patch
> @@ -0,0 +1,58 @@
> +From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
> +From: Joe Slater<joe.slater@windriver.com>
> +Date: Fri, 19 May 2023 08:46:47 -0700
> +Subject: [PATCH] ptest: modify delays in toggle tests
> +
> +Try to test toggling values at their midpoints.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Joe Slater<joe.slater@windriver.com>
> +---
> + tools/gpio-tools-test.bats | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +--- libgpiod-2.0.orig/tools/gpio-tools-test.bats
> ++++ libgpiod-2.0/tools/gpio-tools-test.bats
> +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> + 	[ "$VAL" =3D "$EXPECTED" ]
> + }
> +
> ++gpiosim_wait_value() {
> ++	local OFFSET=3D$2
> ++	local EXPECTED=3D$3
> ++	local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> ++	local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> ++
> ++	for i in {1..10} ; do
> ++		VAL=3D$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> ++		[ "$VAL" =3D "$EXPECTED" ] && return
> ++		sleep 0.1
> ++	done
> ++	return 1
> ++}
> ++
> + gpiosim_cleanup() {
> + 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> + 	do
> +@@ -1567,15 +1581,15 @@ request_release_line() {
> + 	gpiosim_check_value sim0 4 0
> + 	gpiosim_check_value sim0 7 0
> +
> +-	sleep 1
> +-
> +-	gpiosim_check_value sim0 1 0
> ++	# sleeping fixed amounts can be unreliable, so we
> ++	# sync to the toggles
> ++	#
> ++	gpiosim_wait_value sim0 1 0
> + 	gpiosim_check_value sim0 4 1
> + 	gpiosim_check_value sim0 7 1
> +
> +-	sleep 1
> +
> +-	gpiosim_check_value sim0 1 1
> ++	gpiosim_wait_value sim0 1 1
> + 	gpiosim_check_value sim0 4 0
> + 	gpiosim_check_value sim0 7 0
> + }
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.0.bb
> index 179fe170e2..25463e9a87 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D " \
>       file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1=
e9a20f  \
>   "
>  =20
> +SRC_URI +=3D"file://0001-ptest-modify-delays-in-toggle-tests.patch"
> +
>   SRC_URI[sha256sum] =3D "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d=
2a9889b9268cce2dd07"
>  =20
>   S =3D "${WORKDIR}/libgpiod-2.0"


--=20
# Randy MacLeod
# Wind River Linux

--------------OkLe70fQRrGremVpyZDCWdLJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-23 16:01,
      <a class="moz-txt-link-abbreviated" href="mailto:joe.slater@windriver.com">joe.slater@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230523200144.560946-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>

The test &quot;gpioset: toggle (continuous)&quot; is modified to
sync with toggles instead of assuming a delay.</pre>
    </blockquote>
    <p>Please send this&nbsp; to meta-oe/master first.</p>
    <p>What is this 'toggles' that you are referring to?</p>
    <p>Maybe you can explain the problem in the commit log<br>
      as well as in the patch.<br>
      <br>
      Can you send the patch to <a class="moz-txt-link-abbreviated" href="mailto:linux-gpio@vger.kernel.org">linux-gpio@vger.kernel.org</a><br>
      and include a link to that thread since there isn't a way<br>
      to track bugs/enhancements that I can see in: <br>
      &nbsp; <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/">https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/</a></p>
    <p><br>
    </p>
    <p>Thanks!<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230523200144.560946-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
---
 ...-ptest-modify-delays-in-toggle-tests.patch | 58 +++++++++++++++++++
 .../recipes-support/libgpiod/libgpiod_2.0.bb  |  2 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch
new file mode 100644
index 0000000000..359b4a2afa
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch
@@ -0,0 +1,58 @@
+From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
+From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
+Date: Fri, 19 May 2023 08:46:47 -0700
+Subject: [PATCH] ptest: modify delays in toggle tests
+
+Try to test toggling values at their midpoints.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
+---
+ tools/gpio-tools-test.bats | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- libgpiod-2.0.orig/tools/gpio-tools-test.bats
++++ libgpiod-2.0/tools/gpio-tools-test.bats
+@@ -141,6 +141,20 @@ gpiosim_check_value() {
+ 	[ &quot;$VAL&quot; = &quot;$EXPECTED&quot; ]
+ }
+ 
++gpiosim_wait_value() {
++	local OFFSET=$2
++	local EXPECTED=$3
++	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
++	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
++
++	for i in {1..10} ; do
++		VAL=$(&lt;$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
++		[ &quot;$VAL&quot; = &quot;$EXPECTED&quot; ] &amp;&amp; return
++		sleep 0.1
++	done
++	return 1
++}
++
+ gpiosim_cleanup() {
+ 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
+ 	do
+@@ -1567,15 +1581,15 @@ request_release_line() {
+ 	gpiosim_check_value sim0 4 0
+ 	gpiosim_check_value sim0 7 0
+ 
+-	sleep 1
+-
+-	gpiosim_check_value sim0 1 0
++	# sleeping fixed amounts can be unreliable, so we
++	# sync to the toggles
++	#
++	gpiosim_wait_value sim0 1 0
+ 	gpiosim_check_value sim0 4 1
+ 	gpiosim_check_value sim0 7 1
+ 
+-	sleep 1
+ 
+-	gpiosim_check_value sim0 1 1
++	gpiosim_wait_value sim0 1 1
+ 	gpiosim_check_value sim0 4 0
+ 	gpiosim_check_value sim0 7 0
+ }
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index 179fe170e2..25463e9a87 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = &quot; \
     <a class="moz-txt-link-freetext" href="file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f">file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f</a> \
 &quot;
 
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-ptest-modify-delays-in-toggle-tests.patch">&quot;file://0001-ptest-modify-delays-in-toggle-tests.patch&quot;</a>
+
 SRC_URI[sha256sum] = &quot;f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07&quot;
 
 S = &quot;${WORKDIR}/libgpiod-2.0&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------OkLe70fQRrGremVpyZDCWdLJ--

