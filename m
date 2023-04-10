Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF6EC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 05:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38431.1681104840861217816
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 22:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=o1zJd/W5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3464c2a9ec=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33A5IDcX026390
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Apr 2023 22:34:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=FW9K9GtGF72E6p2wze0I6hRJyMJCgnfBvyagsaCIuPs=;
 b=o1zJd/W5dQFRzT32oh5X597gowmvWJ2thx4sF0Oby5og9TvnS2dtQ0bulKzSghtVThM/
 BFBf7VxXJFm8vde5VQ0EcKMoej18AXPmpw3WS9aIRHZpgHCGCstXsoaOxYyFOCqIoYk3
 uzhVKv15vP6HIumLvbAkV/rNKo+aVZNCHl70oxFUXgxg6OJ47woDeS2kGKKMlxXXEW0Y
 4nvPx9FrQy7gDtlsdGDfUeWrxx5H7UygadhykLnGxs/JN2BysQNg5sKYoqq/HyC8kkLS
 zYNkWy99tu04i/SF1I/F4/aEGND9rcvTPpu4zPRUiutWKTZwbgo5+UZizJWZo1XmlmzP vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu7snh88h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Apr 2023 22:34:00 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33A5XxKN025277
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Apr 2023 22:33:59 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu7snh88f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Apr 2023 22:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjiZ4JkptCm/0UYJhtXaOzGLcVEqMzehYrnVpFJ/M2NVkTgoN+Slw/kiucBusG9FFICok2Wlhfq90l+yd2mRnsvmc+VJm87NVudpRWTOjBrtPV8QPlch0QXswh53cbxD8GiX3uChDq9bkzWaN44PhedHo6PCj2DurWpWAC0MagLitkeniv9I/WYFqyiPE3AAnfTK+/5BBwGmIIJWfQTJhfbxDMypkk4xCDr3LDNUJx9hA5zn5kxAOQ0FHgkm/UF1nCJyT+gKHrBigFAZwh2aWCWo+TzOe2fUr+Lc4fLDwQS+NVYClcDGqu4E6lSFWSrs2+/zg0wBSKxpd9K2BFMBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW9K9GtGF72E6p2wze0I6hRJyMJCgnfBvyagsaCIuPs=;
 b=aYghebCe5buyxXm/FiROc+wgPDmgd9xDiQlFpyqH2Aj68dT38agLy9OfujuZnLAFbL38NwWhSPJn3+2fsQ21Qb4Ku1s8yTHYtbErtpsz7HHsf649LH2ie9W1xwsKAQ6v93IK5HG+E3EGI9ALpnqAJajpzZ9Z66UxDBPDv2X7qOTbsiF3vmeHi3JIrFlyk93WUF/Q9Ur+FLUD/FHpRDS+pq3fn9a+h3mUSinPsbjH3goZ/RuWtkWQPiIKrhTncPPUnWl9saqDFrmrvyxzvShNwq9f9MtjNOatehzDrEWySDeAfTq5PulyiMUcX8u2i127ubQQqHo1dws+7BYo4jsbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.35; Mon, 10 Apr 2023 05:33:56 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b701:6f31:1d4:98c4]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b701:6f31:1d4:98c4%3]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 05:33:55 +0000
Message-ID: <312e7e76-4dc2-86a6-346c-72045c6e9082@windriver.com>
Date: Mon, 10 Apr 2023 13:33:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-xfce][PATCH 1/4] xfce4-notifyd: 0.6.3 -> 0.8.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230407091722.5576-1-kai.kang@windriver.com>
 <CAMKF1sri3Mh0=ZU_Jzjb7YLr=+D+_Af3wCAcFjcm24iMOtmoBw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sri3Mh0=ZU_Jzjb7YLr=+D+_Af3wCAcFjcm24iMOtmoBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:404:a::22) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DM8PR11MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7a4851-f3ca-41aa-e690-08db39852d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G14SGWPOq3vtnpZ7EAuxPj+VsQl49sM13m9J2oU5M76znRjlM6J31R7BJ368WraDMIxC1LGyFSo81se0mbbE6/dK8saGsKu5BTl0U29X8liWKOY1DN/XDTcds2Cu4zmMC5iq8t2PlWlzU7Qoo37TcNoRARqYWCGWASBKlm3J4aF87tBeUeub6iGUCkfoeKqP0u6XvpbkLNhwZzd/2JFDwgAPxJi3XqcLO4k90dfgTUnn+SYXZNGC89UDMpNYCB8z0Sg0a+5EMo5iGM2htev6vDty0mZeww8IVSEzlyXuUQWb0mnKFMIsvOKq77y8MekGu2m3rJdoCl4nOhAevP0fPmOW887e8TVotg4bDTSIaa7WhgRex6uS5hGY0mCFkLpyvhhOASBm2NhmTw0P56NGUC3LjOH+DQmaR0gTSgdNAUiu3ZWdiViZAEEmDLi4iFDG4tkjmFs+/gxeUoP6C6TTUCcTBOmeOcLTpL/dGX3En+9DPA4yNV8iEsY0XVvNMYF25dsACrZPVOE8rjHMaZcOzQ0TSZbyvcmBH3d3EuJg9cTESZ/k0GYsPVreMx9IB2gG+qYh5OREPOk4zbTP9IHWsDvHT7TEgG2mA38L1Y5F1ppYeuftl7dpuYyJmubaajrov9e4PxTMOjW7SyUDITvTN5MYUqlPy3zQqb7pEWpNDjU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(366004)(346002)(396003)(376002)(136003)(451199021)(31686004)(66899021)(478600001)(86362001)(31696002)(83380400001)(36756003)(38100700002)(2616005)(6666004)(966005)(6486002)(2906002)(316002)(110136005)(186003)(6512007)(6506007)(53546011)(26005)(66476007)(8676002)(66556008)(41300700001)(8936002)(5660300002)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWlMTUNOdTlYZHRKRmY3T1NvaDcvVXRyQ09uaUFYbWRLUm5lVDBZM0xyNXN4?=
 =?utf-8?B?N29Ca2N1N3NMcEM2YlFXaDQ1d1VtbTRBeWZCTHlSSW9TNXhac2dhV1NKaTZ0?=
 =?utf-8?B?VmhYUVFpM0lHT1JFeW9uRTl3WjJEQ0phd05WVHdPamozc3ZiaFdXa08zY0t6?=
 =?utf-8?B?dWRMajhRT29xdUsvbGxYTXhSRDZkSmxZa3d4YWZQZUdNQ2FYMjcrTWd4L0ZE?=
 =?utf-8?B?Uzkrc2huNXpVNHIwR0dNWW13bDJEcXJ0dnd0dlo5R0x0c1IyMThFVkVTNlkr?=
 =?utf-8?B?M3RjSUs4eUJsbkZvUzNjYnFkKzFsaENZNWJmd1ZTM1U1STNzWG94M3lCOWdT?=
 =?utf-8?B?d2x2UjhMQXljcXBhcloyRDFlV0p1allEVlFlR1R2WVZtZytxNlRKTnN1TEo0?=
 =?utf-8?B?TjlSa01pQzZVK1ZJLzdHaEhlYXVMLzNncVU4WHFHM0ZSMTV1TUNCSWMzVEFx?=
 =?utf-8?B?NmcyczVKd1E2TmpJZlQvaFRtMzZPRnFBNEpHanVNU1ZlcndYRjVFY1I0ZnV3?=
 =?utf-8?B?UEs1QmtNMWl3a1pNVjZoMXpQQzUvWHZTWEhjOVRTeEY5dHNId3QreGJ5Q1Vz?=
 =?utf-8?B?bmNpRnVuUG1YZFNiUkJoMGxkK1NDU0hNL2o0NVFncFNiT3JjaTVMRHBDVkxE?=
 =?utf-8?B?UE5uYkk1WXRJUnRpdEdYYXl5NjFtT1RBQmtheS9JUlN4dFlQenVJUllxWWIv?=
 =?utf-8?B?b0YyMm5RUHQwSnk4RFgzb3RDeW9vUDdtUkFjc1J1ZnBsd1pQV2E5T3U4OTcr?=
 =?utf-8?B?M2ZZRUsvUWhYUFlyRjQxZkQ2eEhETUJRTTdteXI0aFFWMysvd1Fmak5qRkcv?=
 =?utf-8?B?SXhHVURlVm9TNzV4MzBxRXpwaWp3ZDEycnVZWk1VWkVRMjVTRzdRYng2NHBp?=
 =?utf-8?B?cVNXWElTTTUxNXhvYnQxLytZbHZsMDJLSzhKZUM2Zm5FVG5mV0U1OHMraW8r?=
 =?utf-8?B?aUJzQ2JVWXlHY1RickNmN29DYUxZRjNKMlNsWFZkT2w1T3hWOCtzMzlMaCtr?=
 =?utf-8?B?Tlc3SE0xdTM2VXBWNDZibnM1ckp3VFQ3RGVKK3E4SVdGb0NZV1BmaFZsNnY3?=
 =?utf-8?B?ajB1ZzU3MVp3ZCtyMHd4VDhQckgwYk1ib0NPWXpWLzRkRWlxZ0ZSR1kxYWhL?=
 =?utf-8?B?MFJSMjc5U2ovU1pEQkk5eWNJdWNoNEhUYnJ5QnB6Y2p2TmJhOEtkcno1K0dl?=
 =?utf-8?B?TUNZYU9RMFJrazFzNkIvOFBxYS81ZkRGN3Zub21YRk5OZ1daMHJUZEdtNDFv?=
 =?utf-8?B?ZlYwUkViS2pvVHJIRDdLc05MUFp4THVtUTBVUFFZRTR6SXJIcHpUOW9DMjZN?=
 =?utf-8?B?UytHNEpzK2ZLWW5ZcHpXYytCTjVEUnpYYzNkaUdFOXNab0dHMStCcTYvazFX?=
 =?utf-8?B?ejNvUVp0VkJVWll6aHJvenJWaFZ3dngyK3ZXbHhHRjJUWjZjVEo3eUQ0UlNQ?=
 =?utf-8?B?dEtOTDBvNDh1ZlVLL1lLRkRQek15QVVHbXo2amxCSWZ3eUcyRktVcERRYTNi?=
 =?utf-8?B?d0k3VmVHYSsyQUxxYmF2cCt0ZzJyTDlHRVAzbnZwMCtLWDZGVFBLRm5RZE03?=
 =?utf-8?B?MC9QR3lqQ3F6VU9sK29KdUNUYnZEUjU5YVAwZjIyNm81aHBGNW10c3J6MUdS?=
 =?utf-8?B?R1lERUUvWTdYckVzYno5TUsxcEs0dmRCVFZIZVJPRHNCOTZDMCtmZHVKUFFM?=
 =?utf-8?B?T1FhSTYwVnI0SGliQU5ZMFh6Y0d1UCsxbzRxeEtXdHNEelphNjNRemxoVWY2?=
 =?utf-8?B?cWRMVEdSaFpTMmxtblJqQW4yd1RqUHVoSjgwK0NsMTZmeGJORDQ2MlR5OEtN?=
 =?utf-8?B?QVgzbGVTRWpuelR4a2wrUVI4aWlHZGFFSUJScHNoS3JPcTNwbmF4VTFINkZz?=
 =?utf-8?B?aGhaR2Z0RUw3WkxRNlZoaXptRDBabmJZeU5UWGVWckhWbEtPRUhhNVlpQ3ZH?=
 =?utf-8?B?RlBTZzJPUXJCaGMyMXlZemlvaExBanZQbmhnTkFDODNLbXlRZ1I0Ly9ZYW1s?=
 =?utf-8?B?YXVoeUtkMnh3aWZjcjNiRmdmMVd2dURUbE1QeDFKTzFSUWxwNmd1UHZWQlJ5?=
 =?utf-8?B?OTc5WitXWk5XUkUwZy8yV3FvMjFpL0hXcEVoZFZ3cGV1WkdUTFFabzZxSmE3?=
 =?utf-8?Q?6UO1Kr0CI5AXiM3ijznYUiy0H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7a4851-f3ca-41aa-e690-08db39852d3e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 05:33:55.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McQXRjkpgfPO+aILmboxhH6OKpJV+iJBwvXkMfst/9C/muzz3c0FA1QywTlQr4F0M4K7wMKWhY5QNxgtFDJB1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5605
X-Proofpoint-GUID: 8nFW05iJjSmCc1T-njCoRwMfoTcnpnEA
X-Proofpoint-ORIG-GUID: oCaMKxkussWEwcic_SKmvm2JVchs5wCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_02,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33A5IDcX026390
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102002

On 4/7/23 23:42, Khem Raj wrote:
> On Fri, Apr 7, 2023 at 2:17=E2=80=AFAM Kai Kang <kai.kang@eng.windriver=
.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update xfce4-notifyd from 0.6.3 to 0.8.2
>>
>> * update HOMEPAGE that goodies.xfce.org has been decommissioned
>> * the content of license file has been updated but license not changed
>> * patch for configure.ac to get the absolute path of pkg-config variab=
les
>> * drop dependencies dbus and dbus-glib that xfce4-notifyd has been
>>    ported to gdbus
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../xfce4-notifyd-get-var-abs-path.patch      | 41 +++++++++++++++++=
++
>>   ...otifyd_0.6.3.bb =3D> xfce4-notifyd_0.8.2.bb} | 12 +++---
>>   2 files changed, 48 insertions(+), 5 deletions(-)
>>   create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-=
notifyd-get-var-abs-path.patch
>>   rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.3.bb =
=3D> xfce4-notifyd_0.8.2.bb} (66%)
>>
>> diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-=
get-var-abs-path.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4=
-notifyd-get-var-abs-path.patch
>> new file mode 100644
>> index 000000000..719267fd1
>> --- /dev/null
>> +++ b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var=
-abs-path.patch
>> @@ -0,0 +1,41 @@
>> +Native pkg_config only return basename of the variable queried. Invok=
e `which`
>> +to get the absolute path.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
> I think this patch could be submitted upstream unless its regressing
> something in normal build.
> it is enhancing the search for a tool

The value of

GDBUS_CODEGEN=3D`$PKG_CONFIG --variable=3Dgdbus_codegen gio-2.0`

is absolute path '/usr/bin/gdbus-codegen' on build host such as ubuntu.

But for oe, it is just the basename 'gdbus-codegen'.

Regards,
Kai


>
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + configure.ac | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 0f49e2b..a589147 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -116,7 +116,7 @@ AC_MSG_CHECKING([for gdbus-codegen])
>> + if test x"$GDBUS_CODEGEN" =3D x""; then
>> +     GDBUS_CODEGEN=3D`$PKG_CONFIG --variable=3Dgdbus_codegen gio-2.0`
>> + fi
>> +-if test -x "$GDBUS_CODEGEN"; then
>> ++if test -x "$(which $GDBUS_CODEGEN)"; then
>> +     AC_MSG_RESULT([$GDBUS_CODEGEN])
>> + else
>> +     AC_MSG_ERROR([could not find gdbus-codegen in \$PATH. You can ru=
n
>> +@@ -129,7 +129,7 @@ AC_MSG_CHECKING([for glib-compile-resources])
>> + if test x"$GLIB_COMPILE_RESOURCES" =3D x""; then
>> +     GLIB_COMPILE_RESOURCES=3D`$PKG_CONFIG --variable=3Dglib_compile_=
resources gio-2.0`
>> + fi
>> +-if test -x "$GLIB_COMPILE_RESOURCES"; then
>> ++if test -x "$(which $GLIB_COMPILE_RESOURCES)"; then
>> +     AC_MSG_RESULT([$GLIB_COMPILE_RESOURCES])
>> + else
>> +     AC_MSG_ERROR([could not find glib-compile-resources in \$PATH. Y=
ou can run
>> +@@ -142,7 +142,7 @@ AC_MSG_CHECKING([for glib-genmarshal])
>> + if test x"$GLIB_GENMARSHAL" =3D x""; then
>> +     GLIB_GENMARSHAL=3D`$PKG_CONFIG --variable=3Dglib_genmarshal glib=
-2.0`
>> + fi
>> +-if test -x "$GLIB_GENMARSHAL"; then
>> ++if test -x "$(which $GLIB_GENMARSHAL)"; then
>> +     AC_MSG_RESULT([$GLIB_GENMARSHAL])
>> + else
>> +     AC_MSG_ERROR([could not find glib-genmarshal in \$PATH. You can =
run
>> diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.=
bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
>> similarity index 66%
>> rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.b=
b
>> rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
>> index 608660811..7dbd90c18 100644
>> --- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
>> +++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
>> @@ -1,10 +1,10 @@
>>   SUMMARY =3D "Easily themable notification daemon with transparency e=
ffects"
>> -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-not=
ifyd"
>> +HOMEPAGE =3D "https://docs.xfce.org/apps/notifyd/start"
>>   LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
>> +
>>   DEPENDS =3D " \
>> -    dbus \
>> -    dbus-glib \
>> +    glib-2.0-native \
>>       libnotify \
>>       libxfce4util \
>>       libxfce4ui \
>> @@ -14,7 +14,9 @@ DEPENDS =3D " \
>>
>>   inherit xfce-app
>>
>> -SRC_URI[sha256sum] =3D "56a9f895aed460042f2abe09bb1a899e29b7c7d5a76ec=
ac63dead3ced990859f"
>> +SRC_URI:append =3D " file://xfce4-notifyd-get-var-abs-path.patch"
>> +
>> +SRC_URI[sha256sum] =3D "e3a28adb08daa1411135142a0d421e4d6050c4035a4e5=
13a673a59460ff2ae84"
>>
>>   # Avoid trouble with other desktops e.g KDE which also ships dbus se=
rvice named
>>   # org.freedesktop.Notifications
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101979): https://lists.openembedded.org/g/openembe=
dded-devel/message/101979
>> Mute This Topic: https://lists.openembedded.org/mt/98121602/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


