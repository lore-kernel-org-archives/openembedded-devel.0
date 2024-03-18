Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC54C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 07:14:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37638.1710746077150711507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 00:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fTTqChPn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38074007b8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I5qpcS013635
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 07:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:from:subject:to:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=/rRI/
	RvAvY2dZ1Er0VDS2APmACfIp+2B0XU3KaXUqlQ=; b=fTTqChPnnxp1pLa6qromJ
	CeRE+hX9B0aOMtINQq9+cNxpuDKA7h8tXKnGQ0h11PRHhGcrBMsPryW4TxSpNEpW
	XVcUXj2zR7O/4FPpJCZEG/77SVLJ3tqjfjLWXPbsF7db05anZMqZNwz1OC2lk0GM
	7oU8Zz5tmxn3JQLgDW0NMijbZHgukh0bn/qzt8HM0DOuNXbpkUUqu88R1z9iHJwD
	9HQ9mzO1DlyKZAGDPH7bbzq2I61JBNYRohl7SLAClM+d/L6wnL32/0IZqO6fwdae
	1a1L/6pan23dLkzgMLmG8dMCxyKVfFDqg7LWf/tZ3mnr/7op4pyVkipAaH/gtFVj
	w==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww0mxhfqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 07:14:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO6YPJ7Qx6Zx6lsqttn/dfciRdQzv+qswb6XOxgR5w7WD3vjYH+WosmbmMQoesKKL7SRMxQeOaIti1qj/WxLWalbptA8FXyTaZ0D1wNmbC/6+YT/075KDhXGXOaJD4tmvTtNpLMb0KCTVB1wDu2lAkSlvrU2VVMN/VYSYstVC373EjP3NC/fitHsNDSeeeEmUvHkv810xSd6SbrTRfrBrckULMBzAMy1x6/RjlduGM5OnUD8KLNTI4wBoFd6sTlEf6+7aoPNfgsC6MzlkKYinYbQQMNHIT3Ymj2hGD6b4BN/wWMSX3FiPCGZONJvfgusAAaUoHRaXAIoEeOxM5ELUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rRI/RvAvY2dZ1Er0VDS2APmACfIp+2B0XU3KaXUqlQ=;
 b=k59sp3RF2cz2Z1tWnr6LQTDJKaI0JweJentMNrhz06+JPwr2c4zOX8I4OmdKeNHyL0gdyvsoz+cgQmkLVMHrGgQuShIQDRCJHHIcIa6jhIuLBdJU0m6awLLMCTKrs0CT+e4/srAc1OfUoqVZ4i4fUtvF1AHSN5SBsiVou5T/7HDrZemUKPc+dlwanVB2J0kvGhY3vXT39vXJ6xXive3wXTrvRiZMm6/FN/2GmI1pZenx+2ObZyhcLlkNnkub9RHYyAFWVdbKsEqVqlMZXpBDHP/qwZLMkH+cxKuRwQYM23p2fRp930fMzbijCkkSmKrk1iwhTGg9J5w21VyEkXMPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 07:14:32 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 07:14:32 +0000
Message-ID: <476f98eb-eded-47b2-b921-0a1fcc0d7d13@windriver.com>
Date: Mon, 18 Mar 2024 15:14:26 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
Subject: polkit: any idea how to enable logging with polkit.log() function
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5385a0-9f88-4db2-773c-08dc471b0ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lrxzej4OVWPk3YUDumRtsSHjJeG11qXwrT39BGc4Gjw/HMh2SpyqE/QHsyJlZ7wbHJpmv/fiJ8kziCORkmLHvlmJY3TnMsjUfe1IrL39vPFqm4X3xWcotx2EDtsQHKmWeQZtqs9KWanbCH2XcI5B951vtXjR595v+qlvtY1IRln587C7W654GVFZlctmcNgAW89xtJMwEqYu/iM2g7Oei8eZ9XDa+8gxuscyypxC2jTEL3PBBrcr3Ye83nMNvsXaTwYvomzKqFMEc5FnPffgnbVHjC6t+GDwoOZMihMzGsGoZbxa93jLsJI2fqPPWSslRraMbQ137ZdCIjJwzKumgFHcS480z7iIS8Sxt8zg7scUC3dh0GcWr8OESilZiikN7vzD7GPtyzH5+g0xeOkQlNBX9nNO9FVXA54G5nbA6ohJT1FwfeywGirFcfw9+D9oHlMV0ZAzlDgTkNCm3de1xrUIhTIZ2PIOWJk4bovvWozX7VxZB34IMZL5glI8SAHl3A/j2AcT3Fwazxk9vlwD658a4GbtaJmj0NI9/RSQQE5NjujfDqtUZJESIm4IhHoVfRz2yDSP9THdEN0vPwLETVOxhJkOvW5cEL7RQGyC42WeqUiHKqaGjz27fsmKDuJPU7Le6DkJdTksCittiqJGkZ1ESk8goSkJfmQtAre1m+0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0JvcGlsWmNLblpWdDdYbzZrZzZ4RkZFWHZmSHd5Q25YVWN6ZHFENER6TUpG?=
 =?utf-8?B?Qjd5N1VjU2NhTlZ5MDR6dTgvWW5ydzY2Q2I4U296aXErT2N6UThJb0tnYjhz?=
 =?utf-8?B?U3FrRUtBczZmNmZtTXFvVVRXMHpoSHpuZ3d1b3M2YytjMHduSG9RZDlyQWsr?=
 =?utf-8?B?MVlEdjhjRDR6L2NGNnU4U1RxWTBSQ1FEUVM2WTc5VEt2Sm91RU1yR0tzdEs3?=
 =?utf-8?B?OGkwbXBrL1AzdXZSbW1rK3lscXhSK1FDdWE4N2pCNzh4R3lBQUMyRjdjWmZx?=
 =?utf-8?B?NDJWNnc3WlB3MDVGMVFhaTRtdHVDKy9aY0t4Nm91R0drMUlNRllkSlk3QUNH?=
 =?utf-8?B?dWx3a25sVW80aHdYWUFYNlJYYWFPWk1hYzBiaFI1dnN5dVlxN2ZoNTAyN0hh?=
 =?utf-8?B?ZVhPRmlUa1ZPR2taNDMyUFZMSjJjcnExSzA1M3ZsWjgrYmdOMEhkb3o4dGJs?=
 =?utf-8?B?MjdFRkplUGV6c0VXcSs2K3gxL3pYZG55Y05tVFBrWU9vbEFNMjhzMUNTOUMx?=
 =?utf-8?B?UUtzb2lOUTlacXFRN01OampMSEhrY290WTNqT2trN2RKTzI2Z3JXcDN6M3gr?=
 =?utf-8?B?YnBrWEpMZGxZZkx6MFlxZ0c5MDNQUUxPeHNLOHN5b1BTdjV3eDlzazhVS3l1?=
 =?utf-8?B?TVdOSnJzaURKVFhLV3hIZkVtOEs2NUxmU2hNbXZmU2dVazg5NFZ1VDRtdzlR?=
 =?utf-8?B?cTQydE1nY0VPbk8zTDE0SUFKOEx0MlZiN1pDVmsxSi9uV21IKzZOMU9wRldS?=
 =?utf-8?B?K05Vam1sR29nWG00RFpuNkhOQW0vQWtKY0RIeUtnbWJTMXQ0R0piZ3ZERkdt?=
 =?utf-8?B?cVdhR05kZGF3Q2h2eEJHZTJMbGZLS1JFa1lOcmJzVlRsdWlWNndMdVJNWlhK?=
 =?utf-8?B?d1E2NlZab09saTN4dzkweHE2UlZ1TGJ6SzJCZ2RZQXZXVjZ0anN4SS95dk1o?=
 =?utf-8?B?bEhFSzNPRGlDcDU2eWhqcDhleU5MRnZ5bHU0RFoxM216ZHRsWXhOMkhiY2tr?=
 =?utf-8?B?ZWR2ZVJRblk5VWVQUWZwb3E1V0xzMWpGckVPK1hVcjFwaFRHY0Z3S2c1aW42?=
 =?utf-8?B?Tjg3OFU5Rk44emtEbS8zVER0czVNNXR4cDBJdFVRbFVqM2FCTTJuV2xmZlNS?=
 =?utf-8?B?TUVUTDlua3lKVnRmVFJTR0FCMmRpZUF5NjYxMVJ3ekx6ZzFyUDBXLzQvTDJu?=
 =?utf-8?B?RWVRYVRtQzg0UGJvL3JONFUyK0NnZnhhOHdBWEJVSU93M1pVdWhIaTNVbHlV?=
 =?utf-8?B?eUthR2NwRnAydDhXS1h2VEw1RjZUZVVocU9Xa1JYN1lGckhkVEFhY3hwUUs5?=
 =?utf-8?B?ZTB5VCtwU1VZVklJMUdUbHp3OUVuR3JvRmVUWUsyQ0tzeHNWY1dKM2NaVEEr?=
 =?utf-8?B?eHF6QS9mODBEL0ZoR3M4dG0xQnJEUlVuLzNsNjM3VFA3U216cGIxbkZucmNq?=
 =?utf-8?B?T2FqMm5OaER0U0J2U3h0czFMY2VkZlVrRTVzdFltc1lsVk1Ud2JHRGt5bmhU?=
 =?utf-8?B?bHIrTStlTDJJSWlKNW1HZ2xVeDFNb1N6UENuRGlhUDR4aHNXRzhIK1VJQVF3?=
 =?utf-8?B?SGhYSUhhanViUC9aTUlQVUVicmpMMEJqNC95UjQwRnNQenFIanF6YXBzbzgr?=
 =?utf-8?B?U3JTRkJUSVJtb2NZcndKUlVGRmVvNVJ6VGpSNTNIOTZUU2dUVFJOMXdVM0V4?=
 =?utf-8?B?Yi8wd25oL3YzblJpcFpyQ0NUQ2RqRWlmd2lKOHFpaURQMk10YlMxekJoY1ZU?=
 =?utf-8?B?dkJLaU85WHBSanlYdGJBalhtRnVLVzEvUVlDR0tLL3pkNVNodVc2NXVFbkYv?=
 =?utf-8?B?Q2M3T0dNdkgvNkVaUjF3VytmaTgxY2U0WThINlZIYWRXQmUzS1NkZVBLMG00?=
 =?utf-8?B?Y05JZ0prcURLQUY0bjVyWDVlRXVIZEVxd0NhNXR6WU9pdEFLRzFIYmhmVHl2?=
 =?utf-8?B?Z3FKQ25jT0IvVXdWT2VEODhRWlJXeXpuYXc0dGJvOGVZbUJxV2E2UUVWV0tL?=
 =?utf-8?B?SnhBcHRzSmNDb1BaUjhVaGp1NG52STJrdjcrb0g2MVloYVRmWEg4eW5ZM3p0?=
 =?utf-8?B?NHU0NWRSbHFYUUZiNHc4TWJEL1pUeVkrbjh6SUxRZzV2blRUV3Q4amlxKzF4?=
 =?utf-8?Q?ACjRljLc1REuq5YjSZPP56+2G?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5385a0-9f88-4db2-773c-08dc471b0ecf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 07:14:32.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvR0WQzVOObaeRITE/4l7aNr3e0yH3L/a1GgezeEUb8/JDGV/mAccqHq2YFSbXlPkrDwmgUYGqlZ/qSeIpWmKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
X-Proofpoint-ORIG-GUID: TnEfuBX546hpDix0DLHEzBOvoEVVJYUm
X-Proofpoint-GUID: TnEfuBX546hpDix0DLHEzBOvoEVVJYUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=764 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 07:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109399

Hi,

I'm trying to enable logging with polkit.log() function.

1, Remove --no-debug flag from ExecStart command in polkit.service.

2, Add log rule as below:
$ cat /etc/polkit-1/rules.d/00-log-access.rules
polkit.addRule(function(action, subject) {
         polkit.log(action);
         polkit.log("WWWWWW" + subject);
});

3, restart polkit service
$ systemctl daemon-reload
# systemctl restart polkit

4, issue the access as "pkexec -u testu bash -i"
# groupadd testg
# useradd -g testg testu
# passwd testu
New password:
Retype new password:
passwd: password updated successfully
# pkexec -u testu bash -i
testhost:~$

5, check the log
# journalctl | grep polkitd > /var/log/polkit.log
# cat  /var/log/polkit.log
Mar 11 08:42:09 qemux86-64 polkitd[549]: Started polkitd version 123
Mar 11 08:42:10 qemux86-64 polkitd[549]: Loading rules from directory 
/etc/polkit-1/rules.d
Mar 11 08:42:10 qemux86-64 polkitd[549]: 08:42:10.530: Loading rules 
from directory /etc/polkit-1/rules.d
Mar 11 08:42:10 qemux86-64 polkitd[549]: 08:42:10.538: Loading rules 
from directory /usr/share/polkit-1/rules.d
Mar 11 08:42:10 qemux86-64 polkitd[549]: Loading rules from directory 
/usr/share/polkit-1/rules.d
Mar 11 08:42:10 qemux86-64 polkitd[549]: Finished loading, compiling and 
executing 3 rules
Mar 11 08:42:10 qemux86-64 polkitd[549]: 08:42:10.559: Finished loading, 
compiling and executing 3 rules
Mar 11 08:42:10 qemux86-64 polkitd[549]: Entering main event loop
Mar 11 08:42:10 qemux86-64 polkitd[549]: Connected to the system bus
Mar 11 08:42:10 qemux86-64 polkitd[549]: Acquired the name 
org.freedesktop.PolicyKit1 on the system bus
Mar 11 08:42:10 qemux86-64 polkitd[549]: 08:42:10.596: Acquired the name 
org.freedesktop.PolicyKit1 on the system bus

But I didn't find any log related to what defined as 
/etc/polkit-1/rules.d/00-log-access.rules, any idea how to enable 
logging for polkit.log.

Thanks,

