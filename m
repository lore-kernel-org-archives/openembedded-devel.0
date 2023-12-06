Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F40AC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 01:38:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19013.1701826684027602363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 17:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MOJCtN9X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07047bf378=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B6114O8001284
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Dec 2023 17:38:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=aKIlehEmEWM66u5OhWE9N5HR2NinFS+I/DcP0chOlQM=; b=
	MOJCtN9XxmjvXRoeOZkeFG/FlIptyrRNfdNm974DRcfY4PNdt5lW8F4K8EkTrtyv
	ToumxB+FeXtbV/SbTrRMGpYlZUHw/zqxgEfhqZ83B3nFL95E9hNb/WSKs1vScDch
	+pZ2VmTdW1prpSzrpGg0E1NDQeyAv6KT55qhjZSRADd4L7gxkYKDoyUqe8Hf96/3
	f6eOKqhi3mDmjc4MpZEUUXbjkmEJqoT6v25k/glfl4PZQABj986laKZuT7/ylPXP
	cl3b1dT8cKxRqZ2iEAtaqaClXrZNlxn4K1g3oOCbIM7JdFgmBOpTY+VEHWN/PeBU
	yLYjr0wEeRjCuYcIwwGtsQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r037b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 17:38:03 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B61c2pX009938;
	Tue, 5 Dec 2023 17:38:02 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r037a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 17:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByhpprBSMfc2gvc4+P09zNBH8whgzBgOSHExbFKEc8Q9rXUoyAK+L6vyH6P5Puk5/otA4TOrMgluwx7S4WIGy3/RgPrJyyEr0RxDUyzYxPK7nHCDdwjgxai8wd3umsLHkV57FhDU6dNHF2W7rm2EsAHhDqLKSG+NL1FJg2woixk9d74UW7JQ44qAQEWVXEHobjgcJYi5pqGJlm0Q2ZhK+IlnOc65DNET9h4a3bG5O2J6OSXvY9vAwyQImB/ORyJNv+PV5G9wJupj/Vk8xcxlkC5Oeh1yXnuRMg5edpBWZnzw5xAokfy8NoQSbxJTJsNcKhp2RLF+/XaJj+NG9NTaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKIlehEmEWM66u5OhWE9N5HR2NinFS+I/DcP0chOlQM=;
 b=bXHM4JRER/o01TbruCgCvVV9iS5/MbJUDko/rq6CvNsHaZtABqU73SdbSERTM6856eQVHUiqO4Un8QfjZDH0NBjb+7B0NZUMpjtdSSKJFoOoluRgCg5TPQExqEIlHrlYdJcwc6HvrlByMnXcrLittyxdlJDZAb9h9aPRWD9ygBWCaY7OOy6GhY3cIKFbQv8v1lly0XlEdOApuuBhCeZmxJsCPAoIEEYdJLj152z/cnyyFanxMWs09ofVRNypvsCKikUBXvNVO6IF2RP+4jNTLIo0FJRJD9gLIDC9ypbF6nyxttq6qnghKXfXfSJhbUWso37JLzvjIzTwcjStdZQuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 6 Dec
 2023 01:37:59 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::dca9:26e2:b46:2372]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::dca9:26e2:b46:2372%3]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 01:37:59 +0000
Message-ID: <809220be-f0c6-c8f4-2d8e-20e67145397e@windriver.com>
Date: Wed, 6 Dec 2023 09:37:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyudev: provide native
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>,
        Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20231205145032.1116030-1-kai.kang@windriver.com>
 <f506e187-e533-416a-b4d7-4fce48ffc494@smile.fr>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <f506e187-e533-416a-b4d7-4fce48ffc494@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|PH8PR11MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad22718-8e8c-44c8-a437-08dbf5fbfa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eOhOoPVJzJN8acbFk6/iqetqqrMQ86SzfRwIA4+3wfAV0VOv+v5S4IqQ6kRY2pVv2RqlPWYQO0YnWqWahQt3Wu3oNCX838/Xj24+8mymBYaZB6k+YpyY4lznCkbpkWfS8eMklYEiUIm4gPhqjAWefYRQSGvxy7wQrn9wNnho4VWXo+SfTx/rV4FDjly08qdoBYiI6/iIDKOQBt1OHhtiPlARwPCKqOo99ezlkgcJdERYwOdpWx13RsKkbVaZbkeu13Bvcm3/L/Q9wnikXDlVzeoEknl5E0tTDxHi4W++WhwvVmBga2wH+nOWVBnmPhYfKXggDPkVT8WH/gKIlZKPRVxSkZQ88Ete874FcL35nmYWWa4PrldHOHT2IwQVtNzeu3a1f85uzQVQUMwoARuoWwDgRBDeHKBpgAnENeX/zG/F3NqaFntyPD2tzLxfXWjDmzqYe3Fn1THxsMh8N04Ai9uc6SGxM+JAXgRo46yQCBShs0BES+ZvpU34AVQIJL06qbsjOgANYuFjSbNagPgAy8HS1+eKNn7sAzhIw4CmcUEWOGfS4fTZP4uuXKX9e97x/VouM5H0B9VRgYbBd49vKWJynMIS14eFCvCjdERNtD+7HFCXRfVMIUuXeR6ROvRM5igr2FDDotw/2OozUW/JLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(2906002)(31686004)(6666004)(53546011)(6512007)(6486002)(966005)(36756003)(8676002)(41300700001)(38100700002)(6506007)(66476007)(8936002)(478600001)(86362001)(26005)(2616005)(110136005)(83380400001)(66556008)(66946007)(31696002)(316002)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXpPdWt1NE5YS3FLQTZod1d2TytKQ0xJbGFzVmhWSG5hNHZ3MHZuQ0w0WG1D?=
 =?utf-8?B?NG9DaWMzT1orOHB6OHVMRmlGV1IrOERCenMwaVFza083NlkzZGRxUWlXVmM2?=
 =?utf-8?B?U1hKK1o4YWMwUWd1VW55M3prSnRkeVdnckliZGkzem1kSDVoK0l0WXE5dVpR?=
 =?utf-8?B?NFdmUERYcVNKbDh2M0wvejVaRE1JdUpNNU91SXhtUktPZ2dXcmtINTVxTEZu?=
 =?utf-8?B?eWRUZzZrOU9kbjlrNFlBRW5neENvVGExWDNldnozUWdHQkJHcGNJa3lTUlg0?=
 =?utf-8?B?bnRlMGgxdFpEREpsQ2ZNMGJmeWNYVUxqR0NiOTg1djNmOGgyeDRGV21nSzFx?=
 =?utf-8?B?TkpYbldwYjVLeGJaQkNlMEw2cWJGZ2s0NGsxSVlWemdhcUp4WndZV0pSaEtI?=
 =?utf-8?B?ZEcvWXR1eTlMK1p1bm5lWG1Ha1VaMFpGK25KQUxSd2k2SUJiNjI1YmhVaSsr?=
 =?utf-8?B?OExRSFR3N1VYRjJpRFovVXhjRkFLendyUTlmUXluQm9JRU5seVhNOGFtaXN0?=
 =?utf-8?B?M3Vvb0hJM0VRYzdMK1ZuMUEyNmxLdWJ5ZjJieUpaRmRqTTAyY1FlTEROVXRI?=
 =?utf-8?B?ZGZyMVc0REpsVG5uOFVkaENuSEtUMU5USllwOVVvdHU0Vm9MY1VjK2ZsVzhU?=
 =?utf-8?B?ZUxvK1I1MEhzOVJ0MnBQMS9rSENLdjdqMkdzWHcrSjVYNHpzbWFSaXJ1Y1cv?=
 =?utf-8?B?SUllVlZwc2NaRlRJV3BzTlVZeEROTDZZMldzUXNNZndrcldnTmd2WmJQR0s0?=
 =?utf-8?B?VW9SNnZDbUFGSDBFTW1tcVhFQklzQXQyRStBRHFuOEt3MnRhaWh6Q3pnV2Mw?=
 =?utf-8?B?V1N6RlFJT3pQNTZ3OGpVeERnZUdpQlFkL2lrNTdKVUhSclZiL2Y4Ti9WT1Ru?=
 =?utf-8?B?ZHo2NHZ6V0dHUlRyUUpZamJNaUtFZ3gzRERkd0NRNUxWUTFvVWRaQzc1STc4?=
 =?utf-8?B?ODY1cWtBSjFZL1R1c01NN1F0R0hBTHFzVlRXakZWRUk0QlRHOGdPUlVhZ3FR?=
 =?utf-8?B?NGdIQWlLSTFmSzdudUZ4UjBtZllIZlBuL0JaQ3FsL0FXWk5xYkNZL0YwSzNI?=
 =?utf-8?B?dHQ2Y1dVcWtheFJwa1RaV1FLMUJrMnZrV3NGVlZQWTdZL01FZ05ucWE2eFdS?=
 =?utf-8?B?bWJIcnFPK2hTbko4a25SckhXbXp4SmNsbWxLZEh5K3MzcnUvcmVuRmFpNkwx?=
 =?utf-8?B?QVQ0RGIvNDNmREhCZjRBdG5aQ1ovRnF5UlB3NkpmYmRWU29KeCszSnRSTE1t?=
 =?utf-8?B?UTEvcUxVbXlQTExNczJTY0oxYks1YWVnK0VyYXBiSmE1OFNDd25YbjRVZThR?=
 =?utf-8?B?SHlJSG00ZVpHVUQ5NWtNOWRyNDhueHAyb1plcmU0dUc5UUhEUUlCQ2w5V1RU?=
 =?utf-8?B?cG9XK05FV09nbEg0RjM4MnJncHVCRUtkK0NKY09PbjMzYlVaNnM4Unk5aFla?=
 =?utf-8?B?NkpML1dreGJQNDIvY2o5aWFCSWNGb0dXam1vTU42dkt1RXd5bzVjNE1BQUJQ?=
 =?utf-8?B?cDY2S09yTnpac0NkSE9sb0k1dVFMM2NDOFh5ckp6bE42cGJZbUxjYkhyOVF4?=
 =?utf-8?B?T1VHMHNaUnBWaUFPSW1DaXN0K3JtQWx1Yml0TmNPNEpUSnVieHFJc3VWSEVK?=
 =?utf-8?B?dHJIMGc4SEhkbEtTZlN1VWxxWnNRdHo2MHByT0M4TDFQaEp5RWpPOEtWYU92?=
 =?utf-8?B?Skw2MDR1ZnV2aUNOOHZ1ME1NY0poT0NiYzEveTRteTV4QlNoYlhLSjhRMlhq?=
 =?utf-8?B?VG5CWVEwZE90WE4rQW9oQUNGcmhsMmJpUko2Q1laVGdob256dFdGMkprZ2FL?=
 =?utf-8?B?WUd5RHloVmhzTFlxOW9iSUdoWU9aYTFRN1NRV2tlYkNaRWlEenB3SmJNN2lw?=
 =?utf-8?B?N0Y0eFJSTWo1SnBodFNDMTNWNm4rMmFYMmRtRFFnckxCQi9iTjNZaGJpKzVN?=
 =?utf-8?B?Q3Y3K1ppbWlpaSs3WjdrQ3pKaENINFdGMktoSmErZ3pOMS9BTi9IRDkwZTNl?=
 =?utf-8?B?L1ZDdTZMS2F3aXFXd1UwK295cGo0UDFmeUEwTDY4bW8wc1ozWHNSM0RlUmxG?=
 =?utf-8?B?STZIbHE1bTZ1S25ZYU1PYlVWMXlnekhlcVUzZzI4S1lQaWFzU2phdUxNbit0?=
 =?utf-8?Q?Z+Djgxqr2ShPzyAT2IN/TznnS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad22718-8e8c-44c8-a437-08dbf5fbfa4a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 01:37:59.0620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIEhM492bvfciIIkorMNz0k2hooP979vuMo3jjSg1qjeCyPHMcv5KdJgIY4WlwqWi+nkf7qDSrQ37RLhfOyuHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
X-Proofpoint-ORIG-GUID: R7fufq3-V6sCoCKMs55QvfpigqO81Drg
X-Proofpoint-GUID: z_STnzYUN2ywXf5HZLrU9qbcf9f5gm9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060012
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B6114O8001284
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 01:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107232

On 12/5/23 23:39, Yoann Congal wrote:
> Hi,
>
> Le 05/12/2023 =C3=A0 15:50, Kai Kang a =C3=A9crit=C2=A0:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which =
is
>> required by lvm2 when package config 'dbus' is enabled.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1=
.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
>> index 6fcf346bc..8bc3afdb5 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
>> @@ -20,3 +20,5 @@ RDEPENDS:${PN} =3D "\
>>       ${PYTHON_PN}-fcntl \
>>       libudev \
>>   "
>> +
>> +BBCLASSEXTEND =3D "native"
>>
>>
> On my setup, this fails with:
>   $ bitbake python3-pyudev-native
> Loading cache: 100% |##################################################=
#########################################################################=
###############################| Time: 0:00:00
> Loaded 4996 entries from dependency cache.
> Parsing recipes: 100% |################################################=
#########################################################################=
###############################| Time: 0:00:59
> Parsing of 3129 .bb files complete (98 cached, 3031 parsed). 4997 targe=
ts, 140 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'libudev-native' (but virtual:native:/.../yoct=
o/poky/meta-openembedded/meta-python/recipes-devtools/python/python3-pyud=
ev_0.24.1.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'libudev-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libudev-native']
> ERROR: Required build target 'python3-pyudev-native' has no buildable p=
roviders.
> Missing or unbuildable dependency chain was: ['python3-pyudev-native', =
'libudev-native']
>
> FYI, the native support was removed precisely to avoid this error on th=
e autobuilder.
> See:
> https://git.openembedded.org/meta-openembedded/commit/?id=3Dd4aa17dc436=
beb96a804860bc6d18cf72283709e
>
> In this case, I suppose, we would need to either add -native support fo=
r libudev or somehow cut the dependency python3-pyudev->libudev.
>
> Maybe this is something you have locally and not pushed yet?

Hi Yoann,

I am using 'systemd' as init manager and it RPROVIDES libudev-native. I=20
haven't finger out the reason, but I'll try to remove this dependency cha=
in.

$ bitbake libudev-native -e >be
ERROR: Nothing PROVIDES 'libudev-native'. Close matches:
 =C2=A0 libdnet-native
libev-native
 =C2=A0 libuv-native
 =C2=A0 systemd RPROVIDES libudev-native

Regards,
Kai

>
> Regards,


--=20
Kai Kang
Wind River Linux


