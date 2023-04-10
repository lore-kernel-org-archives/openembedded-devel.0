Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12AC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 05:36:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37653.1681105011271053009
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 22:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=mhmyL7dD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3464c2a9ec=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33A5XvMx008267
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VKox8e8OnoOb7Am3iNA2IsfyFGdzngScMecwZ0rr70U=;
 b=mhmyL7dDT635NcPC63DvKAnY5hd3WhWMqBDNbL5LBb2jNPR6dOV5doY3nJy/k5M7hN6Y
 qj8Ohc46SpvmDRzSOJ2niP+V/GEk7cAse+jLS3EHC+QYrZz4OTaVPLcNp1X5bU4ONjzD
 nt72J/DaLG6BdFMSMEnvdJCHUfL8GmB4YsbniBOriEPK9+287kY35pQEdbzifB1iTdLD
 SNWueZqgS8JCLnHdq3B9j94ce5TbxsWgzc34UB5dft9Jn+j9CKlHt8xQgaX+WRnkY7wz
 WAvuqeULuAOuGVzxup/qce8ZI+PAzrQTLzJV7Rgc4kWekobiVPCQW/degxxgSLHPvFD7 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ptwg3skkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:36:50 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33A5an1A015263
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:36:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ptwg3skkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Apr 2023 05:36:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Blkxj8cuh3yqcUuz3S/xvJ86l1enGfx3wTszaeEPreojrqWKPALn/7A/XhP3Sdk2retJOyRCXXvi0Rnycc1vdQGZQzo3IhR/VUIhTA4eEAxIfY71NSKXea/Y8mh+GVJLxnGqKw7vwWuZiKmQTu789D80xsIImGOU+rG7kev7UiIizH6Qj2chIPQ3RxULJ2ErVLt6L1TH/tU53f3HlL4ueB5rDc7h00HM1j9xwmvcuVzvmYwKI12SPz0/Oy8QBQ4pDoN+W/w2CK6s1FaQrpDseqQUet/BJ8Vb/5I9I0VvYK4lT1hT3XKd34zOndI/VtWTGu/SO7KtU/fXmv+RUW3pDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKox8e8OnoOb7Am3iNA2IsfyFGdzngScMecwZ0rr70U=;
 b=Dm5k2n7FdMM9PSjkvDnTqPLPRcNtcItKpYGjuVVNmb/nGQOVpqjKF5pNX2Mx669/iwEfIGDKPJDFi3YV2//dM2h0Fi+prxZf6T6bvamO5z6Xp0owP/eVRKVK2J7bbaAdXsHRnFNrtxgyF3sqSFsdh+DOT6AOK+wCRNX9HIEvfniHEHJL2ka4i1EzvzYmODbhzF9vAeWt96ngZHOzMPs0vPl891ln94YQ3d8pdcEdeR64WQv9MbeovB8t/Nx7d3R1x2SXZRlp0TNNUrJorE3N6deIW7b+OWmpKt6TgxhyBjdjSWY23P8KGg4ezAxjlHd+q93dW48mRwRc017d8Fgreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.35; Mon, 10 Apr 2023 05:36:48 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b701:6f31:1d4:98c4]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b701:6f31:1d4:98c4%3]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 05:36:48 +0000
Message-ID: <1aaac718-c8a9-dca7-ddc7-5a3a83f66def@windriver.com>
Date: Mon, 10 Apr 2023 13:36:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-xfce][PATCH 4/4] xfce4-screenshooter: 1.9.10 -> 1.10.3
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230407091722.5576-1-kai.kang@windriver.com>
 <20230407091722.5576-4-kai.kang@windriver.com>
 <CAMKF1sqBB86gAtOkPZ=8WBPxup8Y46TzMc_LKJ0GC3rih9_jag@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sqBB86gAtOkPZ=8WBPxup8Y46TzMc_LKJ0GC3rih9_jag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DM8PR11MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb3f06f-d9b7-48b1-ec8f-08db3985940d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	49vS+nB+KPxylayI8N9cgPySiauZj0QvdJH99qOdc5LBzJz5YVRbC5QWID2bdvQBxYiYH9TaZOMmJYjQ2zz2S7RKmLPTqzunuUCJ1nEhNPBBp6WqO6FLrPvHi2mQIbYgk7Ke+DiMJJjNCpHYR0skd8UbMmkW1OYfJTp+ZM6MJI5I6Z+mJSWMhqwIic9gW6J7AcSsOSHmB5vf5/1Co2VHpi8uCRA1EXY6CNY0DaLF/z8o9kTTTAutrWDU3tpCUcGyq//1L8QtCRM6bhU6YzVHuKK33z4ts2KQRrhSmLWtliYgFQdrfJeqwVDL/DiSI+L8cObdbwSZwNAvvH9PXchS3U56e1vCzD4c49hkMPev6E7fNyW4Z7YVnFMhi94mGyVdCVhqp5BUIKsyf0WnvVf/ISvd/DAxNSqFgzKmeU1yo8Kw6ymwJ32OaHyh9yRHzJQBm+prmz/bbtoGqPE/5czd2kEKCUCCSyQYFYnMid9bRWOgIvb3NKX57uvx8D8BoKQcy5IMV+HB816mWsMdyh+V6fvJVRTDcmQdbJOkHBGZDomV1edR44ZxEzuLxZyfGAyVP8zIU3LJE7ZgnSXEVjOvvhnEKRV9kH0XMRQERse1cKt6rDeKlgz/L6MEZjqLDwCototnHHEMwVzhxzAx+6vMuZrIgJTLqVaiXVaCq7DKWjY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(366004)(346002)(396003)(376002)(136003)(451199021)(31686004)(66899021)(478600001)(86362001)(31696002)(83380400001)(36756003)(38100700002)(2616005)(6666004)(966005)(6486002)(2906002)(316002)(110136005)(186003)(6512007)(6506007)(53546011)(26005)(66476007)(8676002)(66556008)(41300700001)(8936002)(5660300002)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTJDb0Q0UU9aQmVjWjJ2SHVObjY1MVBCdk90OW1USXRkWEpuQzFEd2xZSFlZ?=
 =?utf-8?B?VmpYM0VQQzlhOVVRc0ZrU0dvSnA3YXVHN2tic2JOc0d1RHlmUi9QR0R4TFdl?=
 =?utf-8?B?emg5Qk5OSVJTcUlvQzdaclFsT05ETWNSVXhKaXU0MkwvTXpIUjk2ZDVycnVh?=
 =?utf-8?B?MmtwT1FPcGYyN0ZXcThnZzBWMU9la2RKbkhCZkpERXVNT3hsN1BzMnp5Mmt4?=
 =?utf-8?B?aS83dG1TcGFqekNhekFiRUlaYkFIMmljMEM0eTU2ZE0zbHI3VUY0cXhTOURQ?=
 =?utf-8?B?MTd2dHMrQXJZUzVFWkQ4VitqK0dWTHJFR3YxbWFXV0lVOURIOCtHTm1uR1Nj?=
 =?utf-8?B?SHpYTmtvak43S1JUVUxEZ3k3eFZmMHRGeTJqSnk3cFZ6ek9ORDkzV3dRYUlE?=
 =?utf-8?B?R21NWXY0NWxLTFA3UnNDY3ZVOGlHRDkyZWZmOHV4MTBLaHVkN3JiRisyUXJY?=
 =?utf-8?B?SUlESThqQnhxeGJ3OEZtSW1Jb0xFdEtjZ1ZhcFVCVFFIdDRJdjhYWWpEbUlj?=
 =?utf-8?B?Y3dUUlBEaXVRdkg2YnczdHFoNDhwdXNYNWR0R0E4b3dFMlZweXlpUC9mZmZ6?=
 =?utf-8?B?YXMwV0Q2TER3VWFXS2g0MFdBRXd2bksrN09HM0I4and5KzdnZjIreXlzQURt?=
 =?utf-8?B?NzUzNjNCQVJ1RzFQVVhJekJubUp3NnYvV21YaVRsUzAvcFNENHF4dEFrMlZh?=
 =?utf-8?B?S21VS29EVDVCV0QzaG4xNzE4OTdUb1Z1bFNxVy9MVWd5VlVBMlo4WEpXbVVn?=
 =?utf-8?B?NUNKNjhIME1tWlB5aHkyZkh3ckpqdi9jZmV2Y3pteVpGVTJJT1RIL2tjbi9n?=
 =?utf-8?B?L3FjVStveEs0Z2NSUGFUNzljY3JtaWdhRnNERDF5azdLSWl1SjFvN01pMThu?=
 =?utf-8?B?MmJvMHJNRThUMVpiTGtLd3V4WVJWRmlMVlNLbzdqYXgwZTB0Q2NlSTFYWTZU?=
 =?utf-8?B?dkljNjNGYlhwWGdwT3JKK2Q5OW1OM3hMVlFtd1kyd1BLdTlwT0Z2a2I3RXVP?=
 =?utf-8?B?MEpSQzJYOUZlWFM3MGFVR2tJSXpPWWxYRlZUWUNkMkJ3R096VS9mM280UlVJ?=
 =?utf-8?B?SjZLQWNmQ002QnJGeWpMYlpKejVxelovbk5uS29jOW4zUmZSa1lEbWRncmVx?=
 =?utf-8?B?MTVCT0NKLzk2ay9GTnk0NFdSZUMvMXhFdEhGTUlXZEZ6RTBYb3E2eFFIS2d5?=
 =?utf-8?B?S3J0OWFrK1FYTXlOMkVkTlg0aUYwc3h6U3lyY2J1REdWbzh0SGpZVFhtYlhj?=
 =?utf-8?B?ejlSQVJzTjdFMWwxMHNKeEZKZVQ1bFBFSFN6TjB1dnBBcFc1UC9JU1ZkWXNq?=
 =?utf-8?B?by9qWlR0cFA1RkU5cTBXZ1NDSU4rRm9XM2VTY05BYmc4ZnMrMkpDTGdaVHNl?=
 =?utf-8?B?b3Z2Y2ZTUys2bmFMMGF6ZUhndVpJS1ZJMWo5ZDFlZ3FYbzhZeXdJQmdINGEz?=
 =?utf-8?B?R0w5aTBDWUVFc2IzZzJNMUw0SWxMVEN1UkdwMkdhdFRiQ2licit0MGczTWpN?=
 =?utf-8?B?RVF6MmpmanNabm13Q3ArZGFPeFAxL3Q3MnJJOUVWeDFTOTZxK3UyTGpFWldj?=
 =?utf-8?B?WWJ5T25ianMxQUVhSGRVdFgwejdCaldQZnVLU0JXZ2dpREUxYWZnR0Z0WU9E?=
 =?utf-8?B?SzVGZmtRMjhoSDV4R0d5ZWNLWndYbmthMWxUNGF4OFcvSGNRMWZhRXg0OG11?=
 =?utf-8?B?NW5jTy9YN0diVHJmS3pEWU9zMXFVZHZLSHlGVnVpZG5DRDRPZWlpbUduaFQ1?=
 =?utf-8?B?UURvb0ljL1FHRGhkdFZGazVHQWJNek9OY0Jpc1hRSTY4VjZOc2FUeGkxQXhn?=
 =?utf-8?B?RWQ5bmdxNHhpWlRod0dsNzlXSjNVVkRHQytzMzRpekVBVjFsa3QxRHBrcE00?=
 =?utf-8?B?YlVZV3lGWUpORFc1ZnJROU5pL05rUGQ5SXFmWGczVjYxM2NWdkFHakR2WDgy?=
 =?utf-8?B?emp0cXlwTFV1Uzh4aDZzdWNnVFdGdXhGSGJkWFNaRVdIRVRCL3VmdGc2SURy?=
 =?utf-8?B?bkh1cGRUY1FpNGxHYUVuWjdldEpTQmNOSTdabVU1Zlk4Zll5ZE9YeUtUcVkv?=
 =?utf-8?B?SUlrb0RuanpGSUt6RTRjSHBFbUxjVnJxZlB3UFkxVjh3Mm0vMGFEeFpRbHJs?=
 =?utf-8?Q?R1Vig5RZ10RDqFn/UzzvaCRIt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb3f06f-d9b7-48b1-ec8f-08db3985940d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 05:36:48.1911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qql+TY1T5ZBTTXXJSWEbXaKXCyBJ8eKUq/LMnuV/VoxDdbimxZ4/hbXYrQ+9Peq4HJacvh/jMM0uBiiBvRIygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5605
X-Proofpoint-GUID: s5ZzCzgV3l5tSUZ03hAppe41aa96VZ45
X-Proofpoint-ORIG-GUID: GyzW6G0B8jHQyBgnBaiwD9B4C2pt46Mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_02,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=958
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304100047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33A5XvMx008267
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102003

On 4/7/23 23:41, Khem Raj wrote:
> On Fri, Apr 7, 2023 at 2:17=E2=80=AFAM Kai Kang <kai.kang@eng.windriver=
.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update xfce4-screenshooter from 1.9.10 to 1.10.3
>>
>> * update HOMEPAGE that goodies.xfce.org has been decommissioning
>> * content of license file has been updated
> Its vague and does not state what has changed. Can you add some more
> info towards what has changed ?

Hi Khem,

According to

https://gitlab.xfce.org/apps/xfce4-screenshooter/-/issues/70

The current license for this component is out of date. Please see=20
xfce4-taskmanager Issue #49 for additional details & discussion.

Briefly:

Comparing the 17 years old file with the new one, we have:

 =C2=A0- some whitespace changes
 =C2=A0- a new FSF address
 =C2=A0- some extra commas

All references to GNU Library General Public License have been replaced=20
with GNU Lesser General Public License


Regards,
Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...creenshooter_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} | 6 ++=
+---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshoot=
er_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} (66%)
>>
>> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensh=
ooter_1.9.10.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screen=
shooter_1.10.3.bb
>> similarity index 66%
>> rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensho=
oter_1.9.10.bb
>> rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.10.3.bb
>> index bb44ec782..10427dab3 100644
>> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1=
.9.10.bb
>> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1=
.10.3.bb
>> @@ -1,13 +1,13 @@
>>   SUMMARY =3D "Application to take screenshots"
>> -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-scr=
eenshooter"
>> +HOMEPAGE =3D "https://docs.xfce.org/apps/xfce4-screenshooter/start"
>>   SECTION =3D "x11/application"
>>   LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7=
599855"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
>>   DEPENDS =3D "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 gl=
ib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11 libxml-parser-perl-n=
ative"
>>
>>   inherit xfce-app perlnative
>>
>> -SRC_URI[sha256sum] =3D "04b4178527f5b98cfe76ae427e95581067edf262a5306=
39d332f6db9a68292d7"
>> +SRC_URI[sha256sum] =3D "a454159847becfeca274a5b58c0e5817d4a260a29345a=
37bbc3b4ff46f8f3818"
>>
>>   do_compile:prepend() {
>>       mkdir -p lib
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101981): https://lists.openembedded.org/g/openembe=
dded-devel/message/101981
>> Mute This Topic: https://lists.openembedded.org/mt/98121607/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


