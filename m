Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECA8C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 03:01:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4001.1632884482464150844
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 20:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=WkhQIIr5;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5906ce9019=liwei.song@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T2NUFF009586
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 03:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=t5IQAgaW3h8vi2DMRVuDDXbYL5nxOhl0Rzd9i3LPcxc=;
 b=WkhQIIr5iaWcIo5dUEmwQWc86J6N7h/B8HdJvpIxp+GX+K+mnbDir9cnMIDCehYuurud
 Qyn7VvCh7sIG60stK686Ar3fa+ixKLQ4DNhv+8CIMZtG2qF4LSUsoBaFevqWM+I81JeZ
 3R8K3SpLfh9sU4hs19JzJYyDt3/n0kZv/Npp8RpFgYufPd8KPGVwkSz/QU18FE0/qLfO
 NLItRj5OYtG9ihsSHmcfQ2yLdj/gjsJFUXzrfsaji9bHJyby2FPgrhaL9FAdsT9i9MU7
 8nddHtfA2OeKfaURChI20GGsxXYwTXxl4uq1cl/G+5ZnUkXqgD8S/N5SKvID+bKRTm8r nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bc0qfruu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 03:01:21 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T31LDo014672
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 03:01:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bc0qfrutx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Sep 2021 03:01:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoJ+turBNyCB65Cnm/VEHLYf1Zkhc6tVhjgcQaJf4sCr7fUpXeogD6NSNlxlEO/kEaiM3IlkMVz7KRlz5Z/8Kg/vpgXUTtVd5goohaJyVYkOHsSMy6mwOZAU0VZ4ffHkLf3X74tYYbegZhpt8cmOqA6Ach+SMWbJDry3P5msE64gI2zb/qOYYv/EHRcUMcV4F1dchD1ihHuoxHAaEdDioFwdG0s9KQtFK57kDAtnUpp0tRdbBhbvSZfEdfGRPC9ZvXYcx5h2fQ5S1HwR2OT/yvXClRAuikWT2yAUU6pfl+7lGZW/otZ1z0232t/DkyUyVI2gNm/rRpmX9IZyG74stg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=t5IQAgaW3h8vi2DMRVuDDXbYL5nxOhl0Rzd9i3LPcxc=;
 b=mFf7UPPNw8SlH0Bb+JMeSrjVJy2sGZN0Ok/J4toev1GeRdicHyRSeG/T9+XwQ/amdY4Cr17tzSzbDvmSrph42QqCRMNxCCnpxRTll0yBblSfEBsXafvVd49OZQkjhFBTAce3vr0ZevsUMF/auPD6xez7JqRxIXuX6i7mUPAvSeXPGwgNoFFh85RQHi1C5T4QrM/PVZlkjJ29nWWb5gilJHmzUOlu6X4u5LSDCfMO7wtOIP45/rlcpQnr3BXkR+ztpXLI840bAsqTHN+VxcytaEpY8r4RpvzkgEPNHyTslXICakrxO6QoxFaBhlFRv3Y5e0EkdNs5sb3seqmtp2tTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19)
 by DM5PR1101MB2281.namprd11.prod.outlook.com (2603:10b6:4:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 03:01:19 +0000
Received: from DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8]) by DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8%7]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 03:01:19 +0000
Subject: Re: [oe][meta-oe][PATCH] chipsec: platform security assessment
 framework
To: Khem Raj <raj.khem@gmail.com>,
        openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210928092958.19196-1-liwei.song@windriver.com>
 <8aa1018b-df28-2a5e-a14e-18cd9749992d@gmail.com>
From: Liwei Song <liwei.song@windriver.com>
Message-ID: <493030f6-62f0-7723-39af-9ea83b965522@windriver.com>
Date: Wed, 29 Sep 2021 11:01:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8aa1018b-df28-2a5e-a14e-18cd9749992d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To DM4PR11MB5310.namprd11.prod.outlook.com
 (2603:10b6:5:391::19)
MIME-Version: 1.0
Received: from [128.224.162.157] (60.247.85.82) by
 HK2PR02CA0201.apcprd02.prod.outlook.com (2603:1096:201:20::13) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 29 Sep 2021 03:01:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f81862e-3e26-45b8-21cd-08d982f56914
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2281:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2281680176C2838209E77B299EA99@DM5PR1101MB2281.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yXMVNOeK5w1vDApKyO0vpcCjH1IgmYwMt1rboZvnxpcuJQTqNBB0UxVrqxHH+z9WaWCGHpeC5CbD+U/0vkU0Jl0IiWjannrzMaS+tBuFUPwrcL/j8+kOz5XBfd0qe9EZK3iokeRcbW2DM1+cHoAOeKukLQ3Zy5e1shFwEEVICPGRKkQtPxiMa1dEqoXUuy+Hnd2cZuSMlvWXN8KHcuR1dq9BSmH2qc/iIIC6/Bzd9OYqywuQlfPTwhR37Vpcvz8Z3yY9tKlqBBIsfAYG/Z6YgMdVgWzId9XxWnJ/zyCb4c4XYVDe1L53qCBLfBs/QV4y0cRelsWlDir6X2tnwtzXZrYQgeRJikAtj1JWmOSpLuactd7UHTFjOjCavgOvqKLH6tLEe0cadf9CbIEX1cwNKCfBNmm2U6cWtmAZd9CIpXXN4sypPsBreIW8Whfb3N3lMM5Ppo8RC5/A7Np4CNQtb3GlPJUI7xtY0DHDJfXRrE45mLutIaEJP23Yob72XxnCPm3vfz8eTnpo9AHvDnOR4pAOzS4FVwUaYzWDo/ddxpLjq5PPAWmmXdVZ2F/qdtZ2npfIvvPkIe5Os3m65witoeyXzm/auUFlXCkyfezjvEldJjfkv8eBPv1WtOrmsUyEXO//b4jLzU5hQFfhzliAVNqbt/6LidQ8h2aviQILAmrLkRbYLafxWQx8cnHUpNkZiGBAWLONyovTgIEgtHlIaq1Dw1As3tgBUpmPEw4z9xHg97j4vQLRL7jJYwXD4xlgC+PXdU7TEfSUqtkckycXixfYSq70LIl2F+t/tKfZpJNHV5B/hIOqyjSAQSIeTRq8pPNYtbxBPAEp8djRmjeMmBnZ7xbvZDFSqkmQsV4/MLds6xCKfDpKGu3NoTw7hLrd96ytUe2OjmhPJ4Yv55yIY8W4q7fe1xAhMT0ov6ce8Ac=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5310.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6706004)(956004)(966005)(53546011)(2616005)(83380400001)(508600001)(26005)(36756003)(186003)(5660300002)(66476007)(86362001)(8676002)(6486002)(110136005)(44832011)(31696002)(52116002)(66946007)(2906002)(15650500001)(6666004)(38350700002)(38100700002)(31686004)(316002)(8936002)(66556008)(16576012)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UElrMkZWUFNmVzAwZG1EaitnVjJNbUR6S2QyMkNSQ3ZETENoWWRYMUQyVldR?=
 =?utf-8?B?OG5salliZEtERFdnWisrdlRMNCt1VUMvblFtcms3b3B3a2E4b0x3bXVyWHds?=
 =?utf-8?B?WnMzbzJ5d3NsemVSOFgvc282ZUdBRmRqVEJMSzhmbStYTEhrUUZoNWVzT1Fj?=
 =?utf-8?B?RWJuQ1NzSHNBaGl5YTBsVjNtTXhxcjBBVnhjZVV2Vk5yTEpTNWtMcjBWMFBY?=
 =?utf-8?B?UitrMFg3cGpkM3crSytVMm1EdW5BSytaM20waGwrMGJtYVBMVS9mU1J1Kyth?=
 =?utf-8?B?eloza3ZDU2RQZFVUSC8waThnWnhldVh3VHFaLzVwcW1Zd3dWMnhqQ2hmb29N?=
 =?utf-8?B?N2xhc0JnalpsZ3ZQT1ZCc044VUlab2tOUTBqVlJ4MDFubzBGdlBJQ2lBdUhG?=
 =?utf-8?B?T01xZG9pbUpUM0lEajNIVGlpOXViZkhDSUV2Uk8rN040WEtHaHpKQXZweSsx?=
 =?utf-8?B?U1pIeWdoMHZkTDN3TFFyL1d0R2R2aGZxNmNzS2lTbjFGcTY5VTBIbW5jaExS?=
 =?utf-8?B?TEExS0lCMkRhNFNZdHVHVTVHUmhUd1RkQ2crdSs3bXl0WlJvR2ZTU0szZWpO?=
 =?utf-8?B?YTMwTm5SSTlhaHYyNFJWYnZCamdHVVFIWnhiYjFka1lIVmxqVkM1TnJaVFlM?=
 =?utf-8?B?SlZxQURhNXZNMElxTXhvUE1JNGpZZkhmbHM5d0JsWFJtT1FTVTVXc2pGY3lE?=
 =?utf-8?B?cDJ2dkw0a3FjVEZ5ck5ncC9lS2xzUmlheXl5UFN4N2ZZcWJraXpVMlNVRlRj?=
 =?utf-8?B?THVlREVMekE2SlZRbnlBZG5FUk1rQllLZHgvUjA0NDJuVWlSVVJocGxwSUlo?=
 =?utf-8?B?cWtPMVRJZTUxbzlicGp0TTh1QndMdDBwT1JBVVpNSzk3OFRUTkZVZUxUcUx5?=
 =?utf-8?B?blVWb2MydWthd25abnBnSU00eTVnZGhIaGdQQUNPM3B1V3ltTmo5QmJMMVFH?=
 =?utf-8?B?RWt1YlN6d2F1akZVaTRwU0JQSVZ3b0puTGRtQkt1d3kzaC80aDRNblRrSFpG?=
 =?utf-8?B?SnJjaUZjNUtnM3ZadjBIMTVlcjJHR2c5OUk5UXpmRUhYOFdoZUlielVtNVpn?=
 =?utf-8?B?MnUvUlNGbitHVkp4MUFvaStUWThuQ1dIVzRGdk9uWEpyTGRySUFDV2t4QWJj?=
 =?utf-8?B?eTM4VWxtSmlQYmxmbGtMOWUwYmtkeDE1Vnp1Wm44dURBcmhCQzNUb1U3aDVn?=
 =?utf-8?B?SzN2bXRtc09nOC95QmduSEN5Si80MDgwVWpmNlU1OUZpSDlMb2ZoenpEOTNO?=
 =?utf-8?B?aHh4Ui9EWXVIUDhEakIvZmlQbmdDVmZGK0xuUFBIYXlmWXZhMnlHcW1SQUhB?=
 =?utf-8?B?Y1ZSM1ZId3cwSUVoNWRzbnAzQmFVVkdvd21wR0ozaDMrelIzMGtBUFF1enB6?=
 =?utf-8?B?TDNPTmxOdDlsYWsvZ3VtZzFBR0dmSFFaZXU2ZEYyY2JZNmFzdlkvbkRDZ1pz?=
 =?utf-8?B?TXdXVmV5emxXd0JCcUt1VTR5VEsxeDErbk5mek02TW9sQjd6bGtMN2I4WVFH?=
 =?utf-8?B?VHBhdUx3THZYYXNBaEQ5WER0bURvM1BCam9UOSs3MXN0aUpGN29SYURqTkFB?=
 =?utf-8?B?cGJqd2cxOERpWTB3YVExMWVtdzYyYkhVRlpOVTJqaE5sei90Tys4cFZBTENS?=
 =?utf-8?B?WWtncEEzSGZSYi9PYU5JbXVmUU5tTE9kUW90M1lURlFGZCswN1ZEYit5M09H?=
 =?utf-8?B?V2ZVSW9sek5ua2xnOGQxTmtzUDRoRTF4QXpmZ1cwc0doaGpDSHphWThFZWl3?=
 =?utf-8?Q?JtbN8+rUMEf3Xq0l8iwBpSz/0MpgbEH4yZXSyim?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f81862e-3e26-45b8-21cd-08d982f56914
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5310.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 03:01:19.3481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fdnb+Ui2uD3sBVuu3NvHUN3uROngycw/WnOzG7rwIA8jp3ynPNMfDjDnSuOBdSDOFkmdD6ENrH8pzJ+wix0IJCVS0cyR1CAz5g+KdL0KVsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2281
X-Proofpoint-GUID: nzaTHtNLdHHx7UL4y-UA60_koIpMPRKU
X-Proofpoint-ORIG-GUID: yZhJa0Lx8JvwvFMT8x1F5lHqoforSUy-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_11,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 18T2NUFF009586
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 03:01:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93164



On 9/29/21 00:13, Khem Raj wrote:
>=20
>=20
> On 9/28/21 2:29 AM, LiweiSong wrote:
>> Add chipsec, tools to dump or analyzing hardware, system firmware
>> components, like PCH register, ioport or iomem configuration space.
>>
>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>> ---
>> =C2=A0 meta-oe/recipes-bsp/chipsec/chipsec_git.bb | 35 +++++++++++++++=
+++++++
>> =C2=A0 1 file changed, 35 insertions(+)
>> =C2=A0 create mode 100644 meta-oe/recipes-bsp/chipsec/chipsec_git.bb
>>
>> diff --git a/meta-oe/recipes-bsp/chipsec/chipsec_git.bb b/meta-oe/reci=
pes-bsp/chipsec/chipsec_git.bb
>> new file mode 100644
>> index 000000000000..019a8f5f12b5
>> --- /dev/null
>> +++ b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
>> @@ -0,0 +1,35 @@
>> +SUMMARY =3D "CHIPSEC: Platform Security Assessment Framework"
>> +
>> +DESCRIPTION =3D "CHIPSEC is a framework for analyzing the security \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 of PC platforms including hardware, system firmware \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (BIOS/UEFI), and platform components."
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbc2d1f9b427be5fb63f6af9da5=
6f7c5d"
>> +
>> +SRC_URI =3D "git://github.com/chipsec/chipsec.git;branch=3Dmaster \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +
>> +SRCREV =3D "b2a61684826dc8b9f622a844a40efea579cd7e7d"
>> +
>> +COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
>> +
>> +S =3D "${WORKDIR}/git"
>> +EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}' CFLAGS=3D'${CFL=
AGS}'"
>> +
>> +DEPENDS =3D "virtual/kernel nasm-native python3-setuptools-native"
>> +RDEPENDS:${PN} +=3D "python3 python3-modules"
>> +
>> +inherit module distutils3
>> +
>> +do_compile:append() {
>> +=C2=A0=C2=A0=C2=A0 cd ${S}/drivers/linux
>> +=C2=A0=C2=A0=C2=A0 oe_runmake=C2=A0 KSRC=3D${STAGING_KERNEL_BUILDDIR}
>> +}
>> +
>> +do_install:append() {
>> +=C2=A0=C2=A0=C2=A0 cp ${S}/drivers/linux/chipsec.ko ${D}${PYTHON_SITE=
PACKAGES_DIR}/chipsec/helper/linux
>=20
> Please use install utility here, so we dont have to worry about mixing =
build user with target user perms etc.
>=20
>> +}
>> +
>> +FILES:${PN} +=3D "/usr \
>> +"
>>
>=20
> hardcoding user here seems suboptimal, can we represent it using some f=
orm of bitbake variables e.g. prefix or exec_prefix etc ?

Got it, will fix it in next version.

Thanks,
Liwei.

>=20
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93161): https://lists.openembedded.org/g/openembed=
ded-devel/message/93161
>> Mute This Topic: https://lists.openembedded.org/mt/85920605/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

