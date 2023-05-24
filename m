Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346ABC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 19:46:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3757.1684957572132023632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 12:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oWvyVMqh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4508594f4b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OJbVi8029283
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 19:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=L4J/4iOqdEauNignTflrIguEaR0Z/w8UpR/sx/LS1Ho=;
 b=oWvyVMqh4pfJwWjRtorrPg9ES0IQ//W+aaA9U8S+3eUK7LSGs3O4nPmM5Lbkd+jCZhcu
 pvUjve5zg3vRpwqRKQs6eBZVbNUumUoFszdYAEpGJing2kQuQ8/3vFfvN46Kei/VheNV
 dTwWFlLdBV3P/IzFFiRrNLBiC8tOl7Bmv2uuUc2WGsWLiz7JVpZf2FItjfUMG0qDxRDN
 qqgAEx2S9uO9eGIUmf9tajFQlCdXPhv+bgsSc4JZVzvJQJy8p3+uJWrWU0CDDqKYjEPV
 lZDgKfF6Xpl396RlEFcH/hlEDCP9g4FgbkhyPh9VKQYf9vnMDXViyyB1458f3YiwEOla 9A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1md7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 19:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7jdASw80ybUz0gtdtU3gZ2ejYvT7a3XUYeHgYYRHRiVJ5m+BfcWdD4eoydRY5jadNSM8ty+L6qe6ZvycHV+FoQ/mrijl3E3azcxJq94kFrqW3WjPD3ZwOJGjk4COchXdKzBSl17ZJVvj/5/27/rPQipDzdqXJbubC8nmV2LS6p4uqAqlKuYtHdq1oETu1rDkMPaA8yp0+6um5c37MkRDprQKEfILjTh8VhYNFMFhDSVuVOaw8c+Oi7ObzRZfrXh4xfRD5aHuGfTBn19EHsFaQ4L7FRRkq7ySawjVz59XbvvE/sbw3DpIP4ZLUanI5uzSIcuU1EGm8C4wcKHk3TlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4J/4iOqdEauNignTflrIguEaR0Z/w8UpR/sx/LS1Ho=;
 b=atX/MuDZQrNN6x4AN2rA6zZBH4JMvlhm9yhqJDjBe8hzGXEfAS4VJBPpsbsCZvzQl7cz/YWJxoMrzjQ54TSwBlP6WZLIZMDl2wB7xU6UwJPEwSTaXGJncWJv99llwTuPSDRlA2NMV6/l8TorTZyn01nBzYgodtZLYM3PdD/Cn5tfM7tEIZ1rguSe+4FUg/zqSvozcCFX8xIhDjSOdPqGhE0nLU51ewJ7KS4++bHc0KUb9A2Ijb6EPWQl3+RYMCVYFDsn0M31uO1VwPD25wqacD1ONpRu0HoaNPCozz8IlONZp7f5qs37gX86ql1IGelQreHqnIBqNHVxM08ILrGpCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 19:46:08 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 19:46:08 +0000
Content-Type: multipart/alternative;
 boundary="------------uCrzE6ufZCDdFIjjXF0sSdML"
Message-ID: <6a34b59d-413b-ab1c-2818-8b933ad55438@windriver.com>
Date: Wed, 24 May 2023 15:46:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle
 (continuous)'
Content-Language: en-CA
To: joe.slater@windriver.com, openembedded-devel@lists.openembedded.org
References: <20230524181131.3890392-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230524181131.3890392-1-joe.slater@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CO6PR11MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cf1a1e-d6df-41e7-b543-08db5c8f84ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QWFzohNVblb4OD0QjvgcGY/kycHdkmJH9Rqpag4Qd5fjtHRlaKlP9C3eivpcXEoL5H6gvWEg3BLKfJuV9NddNjup+/z4h1Glh4ntFt3UuUwR+R6M8EJ/387tbkgp2nJhpZMCYxd5v9SWEvBTmTtqPecqVl7sf1MZ08m7Tq2R4xnfb5Y2rh8OCLSB6LJruCOTbDVUmm1YozJp1cObcDSr+d5EaxygpvYMMPSGkvBS5Nu31jzg+bN/Rwwb40hVrJ9ZCOeHHGonJcLPPr5b9eMj36Bag7sE16reHMaqWyX9hbeAF5oUxHX6WAu5P0fqOt7BEwEh2amQzfZQVPHxzH9kqE6CQWhzYsNsxpOXM0MpUcPQJcyPvEgabVgNWj/kRF3cdxuU3LlD+6lN+cRMc5ZVB0cM7fW+kNvWZERW353/BjE5kZ7pF8QYlPbWN9u6cRcS0UDfFjoYjYK7D82wny/HphkUeX6F+Vp2evzpx8FWv7ouIcQpP9LIIec30Kg0x0tzYxMvPbwwaH13vaecjq9m6Rhn3opE6qJZfPaLt0zhmOxzz5kJtIYVffxk5wv0grbUSbu6z/I5oWt6bqYFeKNM270ucdzE1GG7ZIMLFNbCsn0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(396003)(376002)(346002)(451199021)(5660300002)(8676002)(8936002)(2906002)(186003)(53546011)(31696002)(36756003)(83380400001)(86362001)(2616005)(38100700002)(6506007)(26005)(6512007)(6666004)(316002)(31686004)(478600001)(84970400001)(66556008)(66476007)(66946007)(41300700001)(6486002)(33964004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cndoM25aTzlycUdVNWl6WlhpWmxITmZDNXFJa1RITlFhM0U0WXZ4T0NWYWxt?=
 =?utf-8?B?eU10ODFzMWJPRUJTbjg1dzhBZUVtU3V4eXBDSm1acWZsb0dIdWZNUFlUdTA2?=
 =?utf-8?B?ZjhKOW0xNlJpMVk2azI5VFo2T0NBZVFTVUZRbzBnY0lrSkdRV3krZ1BSR2ZT?=
 =?utf-8?B?eXNTd2lKTHg1NWlXUERjWEU2eFFWUGRRUzltTVNvam5jdDFhM3oyQTZVYjY2?=
 =?utf-8?B?R0RjYXZhVHhKLzJmUjBQS1FsSXJSVm9BMHlDS0FtUzVRYzg3SjRWdUloekdM?=
 =?utf-8?B?Mjk0N05ZeTNSMDZKTGF6QUxiK3NVZTFaVEhXR04vZTJ5SWNLUmxBTUZOK0oz?=
 =?utf-8?B?MGszUkpsWGJET1FtSDBwS3RneG14UVpyakxCbTVzMXRXUlZNZ0V0dEJETVc5?=
 =?utf-8?B?VVRoM3RWS1hHUXFjRjhrUmhBSUtuNHpvcE1WS3lQY0tiQ2N4R1RRdEtvSVBY?=
 =?utf-8?B?TEdWb1htYUw5dHN2c2M4YTYxRHlzZDd1WnZYaXRrZFBZNmFySVhtM3c5bDN4?=
 =?utf-8?B?NzQ5K0lDQzF4enB2Zm54NDI3QTliTkxxTXV0eFpDNkdVNzVRbmNnUm5kYXR4?=
 =?utf-8?B?ajhtUW1HVTgrbEJudDB1NmdrVWZQei9MQk5nN3pxaVhEV1ROTTRtMnNaclhB?=
 =?utf-8?B?WVNlQ3pqUEdQUVJiRzdkSmF1R09NNFlpTHhtaWw3VG5TOWtWeXF6eW1TU0di?=
 =?utf-8?B?K2FXcG9tUHNsVjRXVnlBMytlVHh1dW9MbGczYzBTamdXZHlLNC83UTdKY0g3?=
 =?utf-8?B?ay9iTk1mZExnWk1VVy9MMkN4d1ZLMHpjZldjUEk3QXpzSnZ3L09MWE0xMEN4?=
 =?utf-8?B?YU40TEsvWGRVdFpLeU5JSlNNTFRONzBQQllhait6RCtHakhXeVpnQXJZNkJK?=
 =?utf-8?B?cWJ4alcrTGpKaFF6ZitrRkVhTDV0SW1CNG5Zei9sVk9JczBONElzZGpCMmxI?=
 =?utf-8?B?bERyejljT2VPaFk5TWFPVkNLMmhETURRbFp6MVRWR2xlQ3BWMFJxc0thTXFz?=
 =?utf-8?B?M2JCQ29GUWtZR2ZIeHdGZFBxbTMzaG95Yk91RVhzdFlhNWFueHdTbFpkdVBu?=
 =?utf-8?B?bEhnSnprL2hGaWs0d0lobzh3ajAxRkNncE5TMHBOaXY0WVQ4OGZENEJ4YTFw?=
 =?utf-8?B?MWVDcGlTWEhjZ0NRZWJzK0RVNWd4VGlndjAwNHQxNmI5WEhodjFYT1hCWlFp?=
 =?utf-8?B?a2FvTTZqaURSSUgrb2NGOWJ1YlFmUnNhMzY5dml4SjI0eDNmTnd3YmdiMklv?=
 =?utf-8?B?Q3Q2aTgxYk41azVZSHlLNW0wNDVQdzZCRTNhdEk0WUNtMjNtOU5sejFWNjgr?=
 =?utf-8?B?Mmd3bEFNUDlNTDVQd2xYaHh2c0RyUU1wRXljeTRBZTJpdmJPYTY0VER2Qzhn?=
 =?utf-8?B?ZmJuNnBJdXoxOFlXVGdPUHJZVld5THFPQ1VkTXlOeFR2Vk5TaHJNK25SeUVa?=
 =?utf-8?B?bzNNY09XcWJtRmwrdHlmQkpjTER0VkpEbEthTlYvQkxkVjhyT0wyZHY0U1U2?=
 =?utf-8?B?eHBISmpIeFhZZmxSazA2SjYzSk9BRXE3SldOVk9iaTNKSG5jbExYdXVYRm5w?=
 =?utf-8?B?Wkx2cFh3R0hGM3EyNmY2QjNrS1JJbXd3OW9EREtYYldRRm1rVTBBVXZrUDkw?=
 =?utf-8?B?VTdtMC9xR3hhUlg0MlRSam5HODdiYjlvdHpQandrU2F3a2R0cVJHUnhPOWZv?=
 =?utf-8?B?ODQ1SVh1TjN3MHIxVVZGTXJzeitXQWFlRkJVSnpndXFLWUVDVmJkL2JTMmU2?=
 =?utf-8?B?ZXhMVXJiVUttRGpRaHJLNWdDNEtwVmljYnJGZlU2cG0rVkZ5WXl2RjRkNS92?=
 =?utf-8?B?WXd3eldyYUVubE4wSkRnWEFwQlUzTjlkWnAyOXAyWWo5NTd3SStFL05vNkZr?=
 =?utf-8?B?UTFWQU5mMDFSN3lBd0JPdFk0a2dsOUE5V0hRZFRTL0I5VmcxV3l2QlhjUVJE?=
 =?utf-8?B?ZW9ybVhEQzVnOFNydmVNOXJKNVBkZnlWdGZFUzE2ajFyaTBzY2puR0hmQ3Rt?=
 =?utf-8?B?MVNFd1ZpcVh3TERIdEJXNzJuTWtJUGl3dWVmdElWWWUvelpQN1M4M3Z0VUoy?=
 =?utf-8?B?MHg3c1NyY2o3dkxUWlVMbElhTVBVYlgrWTRtVjVkbVZ4VnhSa0hrZ0hGYkxm?=
 =?utf-8?B?QmtsVTVkSHJOYkpndk1RQnloYjV2Vm44dUUvOGR6RDNVU2R1Y0pyMnA4RTdJ?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cf1a1e-d6df-41e7-b543-08db5c8f84ee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:46:08.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wApdpvoe4Wx5AOlFIf0RbzsaHn0+9mDKsCRnu3k3LUay/wJAVRDiK1U3xRznnLSB+ZysX2PhcMaiIZ8IGskuYCQyXECD3JrespCmK4zVc3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
X-Proofpoint-ORIG-GUID: UPVGqQ3lLyKXfLCy6xmQ1Un96dw5byIT
X-Proofpoint-GUID: UPVGqQ3lLyKXfLCy6xmQ1Un96dw5byIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_14,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240165
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 19:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102793

--------------uCrzE6ufZCDdFIjjXF0sSdML
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-24 14:11, joe.slater@windriver.com wrote:
> From: Joe Slater<joe.slater@windriver.com>
>
> Look for level transitions when testing toggling
> values because using fixed delays to assume value
> changes is not reliable.

The updated commit log and comment below look good to me.


Please send a patch to upstream and reply to this thread with
a link to that or send a commit to update the:

Upstream-Status: pending

tag.

Thanks,

../Randy

> Signed-off-by: Joe Slater<joe.slater@windriver.com>
> ---
>   ...-ptest-modify-delays-in-toggle-tests.patch | 60 +++++++++++++++++++
>   .../libgpiod/libgpiod_2.0.1.bb                |  2 +
>   2 files changed, 62 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
> new file mode 100644
> index 0000000000..11f2d5c4a9
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
> @@ -0,0 +1,60 @@
> +From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
> +From: Joe Slater<joe.slater@windriver.com>
> +Date: Fri, 19 May 2023 08:46:47 -0700
> +Subject: [PATCH] ptest: modify delays in toggle test
> +
> +The test "gpioset: toggle (continuous)" uses fixed delays to test
> +toggling values.  This is not reliable, so we switch to looking
> +for transitions from one value to another.
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
> + 	[ "$VAL" = "$EXPECTED" ]
> + }
> +
> ++gpiosim_wait_value() {
> ++	local OFFSET=$2
> ++	local EXPECTED=$3
> ++	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
> ++	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
> ++
> ++	for i in {1..10} ; do
> ++		VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> ++		[ "$VAL" = "$EXPECTED" ] && return
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
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> index 337554cd89..91c4d27692 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
>   
> +SRC_URI +="file://0001-ptest-modify-delays-in-toggle-tests.patch"
> +
>   SRC_URI[sha256sum] = "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
>   
>   # Enable all project features for ptest


-- 
# Randy MacLeod
# Wind River Linux

--------------uCrzE6ufZCDdFIjjXF0sSdML
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-24 14:11,
      <a class="moz-txt-link-abbreviated" href="mailto:joe.slater@windriver.com">joe.slater@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230524181131.3890392-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>

Look for level transitions when testing toggling
values because using fixed delays to assume value
changes is not reliable.
</pre>
    </blockquote>
    <p>The updated commit log and comment below look good to me.</p>
    <p><br>
    </p>
    Please send a patch to upstream and reply to this thread with<br>
    a link to that or send a commit to update the:<br>
    <br>
    <p> Upstream-Status: pending</p>
    <p>tag.<br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <pre class="moz-quote-pre" wrap="">
</pre>
    <blockquote type="cite" cite="mid:20230524181131.3890392-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
---
 ...-ptest-modify-delays-in-toggle-tests.patch | 60 +++++++++++++++++++
 .../libgpiod/libgpiod_2.0.1.bb                |  2 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
new file mode 100644
index 0000000000..11f2d5c4a9
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
@@ -0,0 +1,60 @@
+From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
+From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
+Date: Fri, 19 May 2023 08:46:47 -0700
+Subject: [PATCH] ptest: modify delays in toggle test
+
+The test &quot;gpioset: toggle (continuous)&quot; uses fixed delays to test
+toggling values.  This is not reliable, so we switch to looking
+for transitions from one value to another.
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
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
index 337554cd89..91c4d27692 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = &quot; \
 
 FILESEXTRAPATHS:prepend := &quot;${THISDIR}/${PN}-2.x:&quot;
 
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-ptest-modify-delays-in-toggle-tests.patch">&quot;file://0001-ptest-modify-delays-in-toggle-tests.patch&quot;</a>
+
 SRC_URI[sha256sum] = &quot;b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392&quot;
 
 # Enable all project features for ptest
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------uCrzE6ufZCDdFIjjXF0sSdML--

