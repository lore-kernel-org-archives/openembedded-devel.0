Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5804EC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 21:53:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.527.1667339581150061989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 14:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=O7N9584C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83045811bb=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A1Lr0BD003667
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Nov 2022 14:53:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=eUqTjrtwkrMBTTWd9QYii78S5RKFvra9P1CGBKPkPoU=;
 b=O7N9584CYnYsZaWqofHHuzPRf1L2H5/q9ZaZ87JKXHl7SoQcbR450MVI0h+3lAeCyLDA
 ZpuOcaXJgcPxSumHqDVBCV5qOgJOPKK3hjPMSFWL5btLlAboshjFhi1Ga58upWePq/eO
 fg7wpCYIlJv4UF26IHDsCf/D3cxknRI/e1/2fp9kI90Sg+M//oWp9Ar9iuEPwxpDhYKt
 SPOMowEtAIkR+EYBdqiWsDIBgEd6/fJX6bccvKLCf1u8kBk2RWrKh1TGdOdS9HoBqt5E
 g6dYutKJrT4S7yR7AE4HJck33vVeMEWtmFzshCfOCNthFIaxArVTqTSs30/JqSwFld0p mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gs9q09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 14:53:00 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A1Lo64M031226
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Nov 2022 14:53:00 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gs9q07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 14:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx6jHxNrIl8ohUNk4CtP54FzErA+884lp5HeyEOmXJv91Q7qBypQ0ass6tKMG/T0i+isNPmi52hqCj5W/xF4y6OkJLUQbUM1PPLskMABu7EZ+aQt3oDKHZVsOppk2Xlw36d2AL5OPX1EEfmrRcbWzbjfLYAlS0331kRfOwPVl0ivn0nD1uYf3mlGEW+oUFMVHfmN0JbFn+o+fJD8VYH7ifzQQK0poCRJDEJjQCHCQfrglsb1OaqDJyK1ni8zo/xbFD+1mb8+djJvQH9bnxySk9kv1eH4Sgzvffl1/lQFEZacCoG2S21lrkwh20Rk8Bv5JCEugg8WlWaHwR997y0K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUqTjrtwkrMBTTWd9QYii78S5RKFvra9P1CGBKPkPoU=;
 b=U1zA+9yZEWmMgZxhS477KxTfGtKPruoV8Y7XL2vqqzZRwdbXcWYrIGWkpOfq+irDcwWNpbS7HGJFypegqknJjflYM+BB39jPhNXc3tgDbl6LwBipmzPv+zC8aL2W4d+aZEyoNe4ykLn7v70o5uL6CFzER0w+j2V1NYiK8KWpE7/2QER8++2rNBTmm6ITCmZ0d7wEJoKYY39+ZzpglkUGZwRgWzNHtycOFuCMZa4F7FOZjLog56aotowqHs6rwdY0Z4Qrz8k9HYzspPg3Y4U/iJvj/xWcXbOH9RRTOdoEboZfM3KAzMQcJvPZg/LTn8mAT3i2KBDzh2H+JcTQdARkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Tue, 1 Nov 2022 21:52:56 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d%7]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 21:52:56 +0000
Message-ID: <4adb1c26-404a-8df2-a8b3-a79326deb4f0@windriver.com>
Date: Tue, 1 Nov 2022 17:52:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-oe][PATCH V4] minio: add recipe for minio client
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20221031150511.1947-1-sakib.sajal@windriver.com>
 <CAMKF1sp+JdYE9MCBZXhbwtaN6JeyhWQBYrLAXuoafSqsO5X2JA@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <CAMKF1sp+JdYE9MCBZXhbwtaN6JeyhWQBYrLAXuoafSqsO5X2JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0231.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|DM8PR11MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fde4e2-9994-41db-0cc1-08dabc536f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uLJzWpG1EOjNlZ/p1H1LeeFPRWGeAKp9oHHSXMnOyWMc07gp752mhfF+zggkYvE9HtDg130E5W2rRo4ZPUf94zfdaBe2mTpxWKsFYOzovNmsdKgeFQrqqJVkL4mmy5LQsw7HlDpakgCze4FAd0UzmgTXSDw/QITU85sqG5vIdAB7jbt1WIhQ0CKkKg8GSFPYYoQn+Hxgiem260e/NVmL68NqxhP8R0ha4mxDQ1bUGza5l4DccC7zV6ghkXzT6GZsJvzL1iCzrzRLkz0IietwfH2ZtkE1Ltb5k+jDNf9+Re09LcraazLb9BWYVIZbdi4F2g91Dz+nVQ+t2korpCdnI0LAo2TLUYnZCPS51GFTcNW25kNjJn6FWL9JX8PNPYX+Xui9K6O11i0M29xQY9P3VfHLZxO/5vHntIBwGfJ/7z84LpH1qa4GSB+NBVq6s48Q4ojCMdvQjmWzoNdNI9Nsb0WVG7SpVNGulr7rUjAsT3lF0/26vYeACvGtdoywk1iRRQ6oHDipd0G/GjUiEPTnc/fSRSH1/EjKFeeM3iHllDkXpt/9sSCnCEv6UieHETlI16vdlPZvF7vK6UMYR/r2ztsi6D6h12eYS3rFu4nN7yfwSuvlIOWLNRGXr4Hrrzzk0mme9XNZoVYxtrHAOWs+3j4ByrtlyANMilRL0y+itLoBrufrshTXIafK27JqD39aP7spPT+Hrs0tZm+tSOX8LtOXVP6pXHHrU+gGMgN7YTD3yyRBsC48MAMNzk7TvN/7Kc7qAD679IoRB9XEtCTOe45DNEdaWTB8RoxFEWo5LMT7Er4JpwkC2w0dC22Il+yYxz+63EnybUYLHBVP+RZL3/SYp82qiLR1pD9pXJM9H2k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39850400004)(366004)(451199015)(478600001)(966005)(6486002)(31686004)(66476007)(4326008)(6506007)(8676002)(53546011)(6666004)(6916009)(66899015)(66556008)(84970400001)(66946007)(316002)(26005)(38100700002)(30864003)(5660300002)(2616005)(41300700001)(8936002)(44832011)(6512007)(2906002)(36756003)(31696002)(83380400001)(86362001)(186003)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3NYMFcrVzhZSUs1dU5oMVc3K2UzQlJ0T1lYa0lIRTdTVGs5Um9UeVMrajJN?=
 =?utf-8?B?Q0dmblpwbnl5UU9mcGxEKzR2d3VYVFllSHZLdjlGOGhFb0s0ajRGc1dBMXNZ?=
 =?utf-8?B?Y2pMUGRHUVdMOXlBai85MnM1MFJXNGI2UGYxRFhJdG1jMHBzNlFVYUJ0Y1Jo?=
 =?utf-8?B?U3pQWElNNGhVOHNXOFpjMXRMMTJSdkN3WkhaTGhjVzk3L3ZodUpYVmpFQy9y?=
 =?utf-8?B?ZUIrekIvTGVoZ1FKaERWc2Y3aEpGZ3g5T0FlcGFXWFJQaDJDQVFtenhXcTFB?=
 =?utf-8?B?S29IcU4xekk4d2xHYmU3YmtzRi9ZWmYzVnVad2JzMkVOUWFaN2lzdHo4Q1NZ?=
 =?utf-8?B?NlVFNmdKZmpBZmhTVUg5NW8vQ2g1RnhSc1pQNmNSVFkxMERZYzh1Q1VacVdD?=
 =?utf-8?B?blRnc0s2bCtOVklEZDJoTHdVVklRK29aOVBuTVVabXY3ZnMwL2x0TXdqWmI5?=
 =?utf-8?B?alg5V2xlY0lES3lJclBCV1JLbnZDbVVkeDljaEx4a2M4TEpPZHZLOEovcmJE?=
 =?utf-8?B?R09WMFQrRE0yRzAyMW9kNDhTbDhjZlBBZGx3TGdVNnowb1VGMGQvbENCQjR2?=
 =?utf-8?B?aW5DSzhTT0d0U3JMbnVQUVoxdlNNSTA1YlEyUG1rMmhDbkVYR0F5aFdJc3g5?=
 =?utf-8?B?US9YTXFRTjNFSCtqN3B5Tit2NVBWSlVIbFM4eUNFU0s5cGljSjhTMXBUZ2hT?=
 =?utf-8?B?bDNaWkFQdEg2dWRGSXRycGdNYTM1NEJoQUF5dGdyNkdKNGpNN2dnVkN6YUdJ?=
 =?utf-8?B?bXFMUHM1UGt1TWQrMFMxMi9qclp4QkUySzAyN2RicFRIT1hEQjJsM3NnYjVU?=
 =?utf-8?B?dGQrWVNvOGtrT1VsZC9uL0RpOWNJSzdCV1RoYWJiTXpoZVlHV1k0MWtXT1Bo?=
 =?utf-8?B?UEZ5N2hsVXc3YzF2UklBZHZuQ0ZPaGhyT1Q3am0xZTN6SWdxYW9IOGpSdFdx?=
 =?utf-8?B?bUZFY0dBamptTDhEeXRGWHZFVTFTN0R4TFBML0I2NlhmWTRHYmJvVXdkcWNh?=
 =?utf-8?B?YVZRUWhLZURxOUY3a0o4ZU1VYldWRHJYU1M5U2tOeWZOU0MxSjYzUlliR3lD?=
 =?utf-8?B?RUhZTlVpWURhWWdBYmJ6d1lHYzhGbXFlcHk4dEcyYVZDUkMycjh6dmNjQzVY?=
 =?utf-8?B?N0xSTy96bEhnYkgvZHQ5U2w4S3Q1eDgyK3NJUldDUDlsbWRZNWJOcVBRUmxG?=
 =?utf-8?B?T0Riemp6VzM5bHhQVXhQcTJpbEF0aHNvRjdBZTg2dmx0Ym5UeVNaS1cxWDhR?=
 =?utf-8?B?blhBMkxTeWhJNGxXRkdCMW9UN0VwNnVVMFdWL2tuYkQ0bVBxWHhRMkduMlN2?=
 =?utf-8?B?TzJlUXVWd2dqRU1BZm9yWk5jaW1Ed2sxcmUyTEN3RXA1R1VGaEFyaUdTZTVN?=
 =?utf-8?B?MnlSU2FqdkxIeTBpMU1rdXVuY2JzRVZEMjJOaVcvT2FIaFM2UFlTQzZDY09h?=
 =?utf-8?B?eGJOcXhiWWttQ1FWNUdPTTBpWWg4VTJkeGdtQ1d2MlNYM212V080SEpHRDVm?=
 =?utf-8?B?dkhvYkcwUzFIRVA5OG5kKzFya1pEVTN5RWVKR3N0YXAwM1dGNi9rNnZWcG1y?=
 =?utf-8?B?SENmMUM4ZlU0azVTdkJLa0lQVGFjbWw0N3RCSndZblNrS0FxZnBUSGc2VjRH?=
 =?utf-8?B?aEVLbE1OMGJHbXNJdUtxNzBubk5tcHdoc2t4TVpxZTFKZVlJU3lNRC82cW10?=
 =?utf-8?B?cjBublE4U1FYRkpVSDZldUovUm94WWg0d0dPVitGS0VKWEVLcXlBQ1lKSDNv?=
 =?utf-8?B?cW9URmRmOUV0ODNqcmlSZ25WQ296N3dzUU1xUGoyQzBBS280UlZhSGFIU0lq?=
 =?utf-8?B?Nk01UHc3UmtvT09Iek1DVXF2US9tWnE4TG5yQ1htM3RLVjZPUkw3Mm9mY0V1?=
 =?utf-8?B?V1pIYi92dmRKSmJYK2lzVmVTNlJ1ZEh3cnVPZGh5NzVzQTNPclpRWXJ5RWVT?=
 =?utf-8?B?V2pzSGlXL2UwVER4SEUxd0lLUWhFVXZ1bnhGZTFFZmRCcmFXRXRHK1NkK2hC?=
 =?utf-8?B?ZnZwSEtvL2tJK1lIRHVvV0ZPUG1NMDZ2S25QaDRFNW51dFBtNFFTME14NTlI?=
 =?utf-8?B?czcvV3dJMEU2bm03dnJTSUsraFdSMDA0aVZyZGM2RDh5TE4xTW1LRlBaVUtw?=
 =?utf-8?B?cHlQYW9yTDl2NlhXMGI3cDVGNXJvQUJ0b3J5cmxGQ1VlN1BpeklJRVBzc3Mv?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fde4e2-9994-41db-0cc1-08dabc536f0e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 21:52:56.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF02wSgggZj1WQv13K69AQrAXzygYFFBQQoBsDAq1frwTq0BDJ4kCvUUIGQBGRQvndbj/tIbqXlrdgfXgqau0SLuhBPW+fME7S8kY6EDUmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5608
X-Proofpoint-GUID: tTra2ooWv_Vmr8xQeflHaoA-yZfPZqGj
X-Proofpoint-ORIG-GUID: DZ0J85BnMuyxDxV6tmtk4p5JOx_G2SLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_10,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010150
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2A1Lr0BD003667
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 21:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99400


On 2022-11-01 13:13, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> it fails on mips. Perhaps needs some work
>
> https://errors.yoctoproject.org/Errors/Build/154374/

I am unable to reproduce the issue in the following environment:

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 "2.2.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =3D "ubuntu-18.04"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 "mips-oe-linux"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D "qemumips"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "nodistro"
DISTRO_VERSION=C2=A0=C2=A0 =3D "nodistro.0"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "o32 bigendian fpu-hard mips32r=
2"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 ""
meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
"master:ce6491b900e509a776eddaf6bd57251628393fa3"
meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "master:b9f5cfd5fd69ffc5748f619e=
17d6431942477767"


I tried cloning and adding the meta-yoe layer (master branch), and=20
setting `DISTRO =3D "yoe"` in local.conf but end up getting the following=
=20
error:

ERROR: Layer meta-yoe is not compatible with the core layer which only=20
supports these series: langdale (layer is compatible with dunfell zeus=20
thud warrior sumo)

Is there something I'm missing?

>
> On Mon, Oct 31, 2022 at 8:05 AM Sakib Sajal <sakib.sajal@windriver.com>=
 wrote:
>> MinIO Client (mc) provides a modern alternative to UNIX commands like
>> ls, cat, cp, mirror, diff, find etc. It supports filesystems and Amazo=
n
>> S3 compatible cloud storage service (AWS Signature v2 and v4).
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   .../recipes-extended/minio/minio/modules.txt  | 208 +++++++
>>   meta-oe/recipes-extended/minio/minio_git.bb   | 158 ++++++
>>   meta-oe/recipes-extended/minio/src_uri.inc    | 509 ++++++++++++++++=
++
>>   3 files changed, 875 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/minio/minio/modules.txt
>>   create mode 100644 meta-oe/recipes-extended/minio/minio_git.bb
>>   create mode 100644 meta-oe/recipes-extended/minio/src_uri.inc
>>
>> diff --git a/meta-oe/recipes-extended/minio/minio/modules.txt b/meta-o=
e/recipes-extended/minio/minio/modules.txt
>> new file mode 100644
>> index 000000000..fbd01e51a
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/minio/minio/modules.txt
>> @@ -0,0 +1,208 @@
>> +# github.com/charmbracelet/bubbletea v0.19.3
>> +## explicit
>> +# github.com/cheggaaa/pb v1.0.29
>> +## explicit
>> +# github.com/dustin/go-humanize v1.0.0
>> +## explicit
>> +# github.com/fatih/color v1.13.0
>> +## explicit
>> +# github.com/go-ole/go-ole v1.2.6
>> +## explicit
>> +# github.com/goccy/go-json v0.8.1
>> +## explicit
>> +# github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
>> +## explicit
>> +# github.com/google/uuid v1.3.0
>> +## explicit
>> +# github.com/inconshreveable/mousetrap v1.0.0
>> +## explicit
>> +# github.com/json-iterator/go v1.1.12
>> +## explicit
>> +# github.com/klauspost/compress v1.13.6
>> +## explicit
>> +# github.com/mattn/go-ieproxy v0.0.1
>> +## explicit
>> +# github.com/mattn/go-isatty v0.0.14
>> +## explicit
>> +# github.com/minio/cli v1.22.0
>> +## explicit
>> +# github.com/minio/colorjson v1.0.2
>> +## explicit
>> +# github.com/minio/filepath v1.0.0
>> +## explicit
>> +# github.com/minio/madmin-go v1.4.3
>> +## explicit
>> +# github.com/minio/md5-simd v1.1.2
>> +## explicit
>> +# github.com/minio/minio-go/v7 v7.0.30
>> +## explicit
>> +# github.com/minio/pkg v1.1.22
>> +## explicit
>> +# github.com/minio/selfupdate v0.4.0
>> +## explicit
>> +# github.com/minio/sha256-simd v1.0.0
>> +## explicit
>> +# github.com/mitchellh/go-homedir v1.1.0
>> +## explicit
>> +# github.com/pkg/xattr v0.4.4
>> +## explicit
>> +# github.com/posener/complete v1.2.3
>> +## explicit
>> +# github.com/prometheus/client_golang v1.12.1
>> +## explicit
>> +# github.com/prometheus/prom2json v1.3.1
>> +## explicit
>> +# github.com/rjeczalik/notify v0.9.2
>> +## explicit
>> +# github.com/rs/xid v1.3.0
>> +## explicit
>> +# github.com/secure-io/sio-go v0.3.1
>> +## explicit
>> +# github.com/shirou/gopsutil/v3 v3.21.12
>> +## explicit
>> +# github.com/tidwall/gjson v1.12.1
>> +## explicit
>> +# golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
>> +## explicit
>> +# golang.org/x/net v0.0.0-20220225172249-27dd8689420f
>> +## explicit
>> +# golang.org/x/text v0.3.7
>> +## explicit
>> +# gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
>> +## explicit
>> +# gopkg.in/h2non/filetype.v1 v1.0.5
>> +## explicit
>> +# gopkg.in/yaml.v2 v2.4.0
>> +## explicit
>> +# github.com/charmbracelet/bubbles v0.10.0
>> +## explicit
>> +# github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e70=
3f6
>> +## explicit
>> +# github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
>> +## explicit
>> +# github.com/golang-jwt/jwt/v4 v4.4.1
>> +## explicit
>> +# github.com/navidys/tvxwidgets v0.1.0
>> +## explicit
>> +# github.com/olekukonko/tablewriter v0.0.5
>> +## explicit
>> +# github.com/prometheus/client_model v0.2.0
>> +## explicit
>> +# github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
>> +## explicit
>> +# github.com/tinylib/msgp v1.1.6
>> +## explicit
>> +# golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
>> +## explicit
>> +# github.com/beorn7/perks v1.0.1
>> +## explicit
>> +# github.com/cespare/xxhash/v2 v2.1.2
>> +## explicit
>> +# github.com/containerd/console v1.0.2
>> +## explicit
>> +# github.com/coreos/go-semver v0.3.0
>> +## explicit
>> +# github.com/coreos/go-systemd/v22 v22.3.2
>> +## explicit
>> +# github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
>> +## explicit
>> +# github.com/fatih/structs v1.1.0
>> +## explicit
>> +# github.com/gdamore/encoding v1.0.0
>> +## explicit
>> +# github.com/gogo/protobuf v1.3.2
>> +## explicit
>> +# github.com/golang/protobuf v1.5.2
>> +## explicit
>> +# github.com/hashicorp/errwrap v1.1.0
>> +## explicit
>> +# github.com/hashicorp/go-multierror v1.1.1
>> +## explicit
>> +# github.com/klauspost/cpuid/v2 v2.0.9
>> +## explicit
>> +# github.com/kr/text v0.2.0
>> +## explicit
>> +# github.com/lestrrat-go/backoff/v2 v2.0.8
>> +## explicit
>> +# github.com/lestrrat-go/blackmagic v1.0.0
>> +## explicit
>> +# github.com/lestrrat-go/httpcc v1.0.0
>> +## explicit
>> +# github.com/lestrrat-go/iter v1.0.1
>> +## explicit
>> +# github.com/lestrrat-go/jwx v1.2.14
>> +## explicit
>> +# github.com/lestrrat-go/option v1.0.0
>> +## explicit
>> +# github.com/lucasb-eyer/go-colorful v1.2.0
>> +## explicit
>> +# github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
>> +## explicit
>> +# github.com/mattn/go-colorable v0.1.12
>> +## explicit
>> +# github.com/mattn/go-runewidth v0.0.13
>> +## explicit
>> +# github.com/matttproud/golang_protobuf_extensions v1.0.1
>> +## explicit
>> +# github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
>> +## explicit
>> +# github.com/modern-go/reflect2 v1.0.2
>> +## explicit
>> +# github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
>> +## explicit
>> +# github.com/muesli/reflow v0.3.0
>> +## explicit
>> +# github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
>> +## explicit
>> +# github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
>> +## explicit
>> +# github.com/philhofer/fwd v1.1.1
>> +## explicit
>> +# github.com/pkg/errors v0.9.1
>> +## explicit
>> +# github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
>> +## explicit
>> +# github.com/prometheus/common v0.33.0
>> +## explicit
>> +# github.com/prometheus/procfs v0.7.3
>> +## explicit
>> +# github.com/rivo/uniseg v0.2.0
>> +## explicit
>> +# github.com/sirupsen/logrus v1.8.1
>> +## explicit
>> +# github.com/tidwall/match v1.1.1
>> +## explicit
>> +# github.com/tidwall/pretty v1.2.0
>> +## explicit
>> +# github.com/tklauser/go-sysconf v0.3.9
>> +## explicit
>> +# github.com/tklauser/numcpus v0.3.0
>> +## explicit
>> +# github.com/yusufpapurcu/wmi v1.2.2
>> +## explicit
>> +# go.etcd.io/etcd/api/v3 v3.5.2
>> +## explicit
>> +# go.etcd.io/etcd/client/pkg/v3 v3.5.2
>> +## explicit
>> +# go.etcd.io/etcd/client/v3 v3.5.2
>> +## explicit
>> +# go.uber.org/atomic v1.9.0
>> +## explicit
>> +# go.uber.org/multierr v1.7.0
>> +## explicit
>> +# go.uber.org/zap v1.19.1
>> +## explicit
>> +# golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
>> +## explicit
>> +# golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
>> +## explicit
>> +# google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
>> +## explicit
>> +# google.golang.org/grpc v1.43.0
>> +## explicit
>> +# google.golang.org/protobuf v1.27.1
>> +## explicit
>> +# gopkg.in/ini.v1 v1.66.3
>> +## explicit
>> +# gopkg.in/yaml.v3 v3.0.1
>> +## explicit
>> diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/rec=
ipes-extended/minio/minio_git.bb
>> new file mode 100644
>> index 000000000..d8f4c2c21
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/minio/minio_git.bb
>> @@ -0,0 +1,158 @@
>> +HOMEPAGE =3D "https://github.com/minio/mc"
>> +SUMMARY =3D "MinIO Client is a replacement for ls, cp, mkdir, diff an=
d rsync commands for filesystems and object storage."
>> +DESCRIPTION =3D "MinIO Client (mc) provides a modern alternative to \
>> +               UNIX commands like ls, cat, cp, mirror, diff, find \
>> +               etc. It supports filesystems and Amazon S3 compatible =
\
>> +               cloud storage service (AWS Signature v2 and v4). \
>> +"
>> +
>> +SRC_URI =3D "git://github.com/minio/mc;nobranch=3D1;name=3Dmc;protoco=
l=3Dhttps \
>> +           file://modules.txt \
>> +          "
>> +
>> +include src_uri.inc
>> +
>> +SRCREV_mc =3D "01b87ecc02ffad47dfe13c2154ac31db3e3115df"
>> +
>> +GO_IMPORT =3D "import"
>> +
>> +LICENSE =3D "GPL-3.0-only"
>> +LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e64787=
0add0502f8f010b19de32af"
>> +
>> +PV =3D "${SRCREV_mc}"
>> +
>> +inherit go
>> +inherit goarch
>> +
>> +DEPENDS +=3D "rsync-native"
>> +
>> +do_compile() {
>> +
>> +    cd ${S}/src/${GO_IMPORT}
>> +
>> +    export GOFLAGS=3D"-mod=3Dvendor"
>> +    export GOPATH=3D"$GOPATH:${S}/src/import/.gopath:${S}/src/import/=
vendor"
>> +    sites=3D"github.com/charmbracelet/bubbletea:github.com/charmbrace=
let/bubbletea \
>> +           github.com/cheggaaa/pb:github.com/cheggaaa/pb \
>> +           github.com/dustin/go-humanize:github.com/dustin/go-humaniz=
e \
>> +           github.com/fatih/color:github.com/fatih/color \
>> +           github.com/go-ole/go-ole:github.com/go-ole/go-ole \
>> +           github.com/goccy/go-json:github.com/goccy/go-json \
>> +           github.com/google/shlex:github.com/google/shlex \
>> +           github.com/google/uuid:github.com/google/uuid \
>> +           github.com/inconshreveable/mousetrap:github.com/inconshrev=
eable/mousetrap \
>> +           github.com/json-iterator/go:github.com/json-iterator/go \
>> +           github.com/klauspost/compress:github.com/klauspost/compres=
s \
>> +           github.com/mattn/go-ieproxy:github.com/mattn/go-ieproxy \
>> +           github.com/mattn/go-isatty:github.com/mattn/go-isatty \
>> +           github.com/minio/cli:github.com/minio/cli \
>> +           github.com/minio/colorjson:github.com/minio/colorjson \
>> +           github.com/minio/filepath:github.com/minio/filepath \
>> +           github.com/minio/madmin-go:github.com/minio/madmin-go \
>> +           github.com/minio/md5-simd:github.com/minio/md5-simd \
>> +           github.com/minio/minio-go/v7:github.com/minio/minio-go/v7 =
\
>> +           github.com/minio/pkg:github.com/minio/pkg \
>> +           github.com/minio/selfupdate:github.com/minio/selfupdate \
>> +           github.com/minio/sha256-simd:github.com/minio/sha256-simd =
\
>> +           github.com/mitchellh/go-homedir:github.com/mitchellh/go-ho=
medir \
>> +           github.com/pkg/xattr:github.com/pkg/xattr \
>> +           github.com/posener/complete:github.com/posener/complete \
>> +           github.com/prometheus/client_golang:github.com/prometheus/=
client_golang \
>> +           github.com/prometheus/prom2json:github.com/prometheus/prom=
2json \
>> +           github.com/rjeczalik/notify:github.com/rjeczalik/notify \
>> +           github.com/rs/xid:github.com/rs/xid \
>> +           github.com/secure-io/sio-go:github.com/secure-io/sio-go \
>> +           github.com/shirou/gopsutil/v3:github.com/shirou/gopsutil/v=
3 \
>> +           github.com/tidwall/gjson:github.com/tidwall/gjson \
>> +           golang.org/x/crypto:go.googlesource.com/crypto \
>> +           golang.org/x/net:go.googlesource.com/net \
>> +           golang.org/x/text:go.googlesource.com/text \
>> +           gopkg.in/check.v1:gopkg.in/check.v1 \
>> +           gopkg.in/h2non/filetype.v1:gopkg.in/h2non/filetype.v1 \
>> +           gopkg.in/yaml.v2:gopkg.in/yaml.v2 \
>> +           github.com/charmbracelet/bubbles:github.com/charmbracelet/=
bubbles \
>> +           github.com/charmbracelet/lipgloss:github.com/charmbracelet=
/lipgloss \
>> +           github.com/gdamore/tcell/v2:github.com/gdamore/tcell/v2 \
>> +           github.com/golang-jwt/jwt/v4:github.com/golang-jwt/jwt/v4 =
\
>> +           github.com/navidys/tvxwidgets:github.com/navidys/tvxwidget=
s \
>> +           github.com/olekukonko/tablewriter:github.com/olekukonko/ta=
blewriter \
>> +           github.com/prometheus/client_model:github.com/prometheus/c=
lient_model \
>> +           github.com/rivo/tview:github.com/rivo/tview \
>> +           github.com/tinylib/msgp:github.com/tinylib/msgp \
>> +           golang.org/x/term:go.googlesource.com/term \
>> +           github.com/beorn7/perks:github.com/beorn7/perks \
>> +           github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 =
\
>> +           github.com/containerd/console:github.com/containerd/consol=
e \
>> +           github.com/coreos/go-semver:github.com/coreos/go-semver \
>> +           github.com/coreos/go-systemd/v22:github.com/coreos/go-syst=
emd/v22 \
>> +           github.com/decred/dcrd/dcrec/secp256k1/v4:github.com/decre=
d/dcrd/dcrec/secp256k1/v4//dcrec/secp256k1 \
>> +           github.com/fatih/structs:github.com/fatih/structs \
>> +           github.com/gdamore/encoding:github.com/gdamore/encoding \
>> +           github.com/gogo/protobuf:github.com/gogo/protobuf \
>> +           github.com/golang/protobuf:github.com/golang/protobuf \
>> +           github.com/hashicorp/errwrap:github.com/hashicorp/errwrap =
\
>> +           github.com/hashicorp/go-multierror:github.com/hashicorp/go=
-multierror \
>> +           github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v=
2 \
>> +           github.com/kr/text:github.com/kr/text \
>> +           github.com/lestrrat-go/backoff/v2:github.com/lestrrat-go/b=
ackoff/v2 \
>> +           github.com/lestrrat-go/blackmagic:github.com/lestrrat-go/b=
lackmagic \
>> +           github.com/lestrrat-go/httpcc:github.com/lestrrat-go/httpc=
c \
>> +           github.com/lestrrat-go/iter:github.com/lestrrat-go/iter \
>> +           github.com/lestrrat-go/jwx:github.com/lestrrat-go/jwx \
>> +           github.com/lestrrat-go/option:github.com/lestrrat-go/optio=
n \
>> +           github.com/lucasb-eyer/go-colorful:github.com/lucasb-eyer/=
go-colorful \
>> +           github.com/lufia/plan9stats:github.com/lufia/plan9stats \
>> +           github.com/mattn/go-colorable:github.com/mattn/go-colorabl=
e \
>> +           github.com/mattn/go-runewidth:github.com/mattn/go-runewidt=
h \
>> +           github.com/matttproud/golang_protobuf_extensions:github.co=
m/matttproud/golang_protobuf_extensions \
>> +           github.com/modern-go/concurrent:github.com/modern-go/concu=
rrent \
>> +           github.com/modern-go/reflect2:github.com/modern-go/reflect=
2 \
>> +           github.com/muesli/ansi:github.com/muesli/ansi \
>> +           github.com/muesli/reflow:github.com/muesli/reflow \
>> +           github.com/muesli/termenv:github.com/muesli/termenv \
>> +           github.com/niemeyer/pretty:github.com/niemeyer/pretty \
>> +           github.com/philhofer/fwd:github.com/philhofer/fwd \
>> +           github.com/pkg/errors:github.com/pkg/errors \
>> +           github.com/power-devops/perfstat:github.com/power-devops/p=
erfstat \
>> +           github.com/prometheus/common:github.com/prometheus/common =
\
>> +           github.com/prometheus/procfs:github.com/prometheus/procfs =
\
>> +           github.com/rivo/uniseg:github.com/rivo/uniseg \
>> +           github.com/sirupsen/logrus:github.com/sirupsen/logrus \
>> +           github.com/tidwall/match:github.com/tidwall/match \
>> +           github.com/tidwall/pretty:github.com/tidwall/pretty \
>> +           github.com/tklauser/go-sysconf:github.com/tklauser/go-sysc=
onf \
>> +           github.com/tklauser/numcpus:github.com/tklauser/numcpus \
>> +           github.com/yusufpapurcu/wmi:github.com/yusufpapurcu/wmi \
>> +           go.etcd.io/etcd/api/v3:github.com/etcd-io/etcd/api/v3//api=
 \
>> +           go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/api/=
v3//client/pkg \
>> +           go.etcd.io/etcd/client/v3:github.com/etcd-io/etcd/api/v3//=
client/v3 \
>> +           go.uber.org/atomic:go.uber.org/atomic \
>> +           go.uber.org/multierr:go.uber.org/multierr \
>> +           go.uber.org/zap:go.uber.org/zap \
>> +           golang.org/x/sync:go.googlesource.com/sync \
>> +           golang.org/x/sys:go.googlesource.com/sys \
>> +           google.golang.org/genproto:google.golang.org/genproto \
>> +           google.golang.org/grpc:google.golang.org/grpc \
>> +           google.golang.org/protobuf:google.golang.org/protobuf \
>> +           gopkg.in/ini.v1:gopkg.in/ini.v1 \
>> +           gopkg.in/yaml.v3:gopkg.in/yaml.v3"
>> +    for s in $sites; do
>> +        site_dest=3D$(echo $s | cut -d: -f1)
>> +        site_source=3D$(echo $s | cut -d: -f2)
>> +        mkdir -p vendor.copy/$site_dest
>> +        [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] &&=
 { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped =
(files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go fil=
es" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fetch/$si=
te_source/ vendor.copy/$site_dest ; }
>> +    done
>> +
>> +    ln -sf vendor.copy vendor
>> +    # these are bad symlinks, go validates them and breaks the build =
if they are present
>> +    rm -f vendor/go.etcd.io/etcd/client/v3/example_*
>> +
>> +    cp ${WORKDIR}/modules.txt vendor/
>> +
>> +    ${GO} build -trimpath
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}/${sbindir}
>> +    install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc
>> +}
>> diff --git a/meta-oe/recipes-extended/minio/src_uri.inc b/meta-oe/reci=
pes-extended/minio/src_uri.inc
>> new file mode 100644
>> index 000000000..5cdc69dfc
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/minio/src_uri.inc
>> @@ -0,0 +1,509 @@
>> +#      github.com/charmbracelet/bubbletea v0.19.3
>> +# [1] git ls-remote https://github.com/charmbracelet/bubbletea 3dc517=
89d11229a1fb00f137d02b50b04cac372b
>> +SRCREV_bubbletea=3D"3dc51789d11229a1fb00f137d02b50b04cac372b"
>> +SRC_URI +=3D "git://github.com/charmbracelet/bubbletea;name=3Dbubblet=
ea;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/charmbracelet/bubbletea"
>> +
>> +#      github.com/cheggaaa/pb v1.0.29
>> +# [1] git ls-remote https://github.com/cheggaaa/pb e2a33cc368a206516c=
c95f7bdd9176db0b83f098
>> +SRCREV_pb=3D"e2a33cc368a206516cc95f7bdd9176db0b83f098"
>> +SRC_URI +=3D "git://github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/cheggaaa/pb"
>> +
>> +#      github.com/dustin/go-humanize v1.0.0
>> +# [1] git ls-remote https://github.com/dustin/go-humanize e673fa1ffc9=
1213297a60d18a6f513aa74bced52
>> +SRCREV_go-humanize=3D"e673fa1ffc91213297a60d18a6f513aa74bced52"
>> +SRC_URI +=3D "git://github.com/dustin/go-humanize;name=3Dgo-humanize;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/dustin/go-humanize"
>> +
>> +#      github.com/fatih/color v1.13.0
>> +# [1] git ls-remote https://github.com/fatih/color a05da93ebe62ca9fc6=
791d3376ec4dad01196448
>> +SRCREV_color=3D"a05da93ebe62ca9fc6791d3376ec4dad01196448"
>> +SRC_URI +=3D "git://github.com/fatih/color;name=3Dcolor;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/fatih/color"
>> +
>> +#      github.com/go-ole/go-ole v1.2.6
>> +# [1] git ls-remote https://github.com/go-ole/go-ole 8b1f7f90f6b17286=
09c9694f2cff140d34fd91f8
>> +SRCREV_go-ole=3D"8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
>> +SRC_URI +=3D "git://github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/go-ole/go-ole"
>> +
>> +#      github.com/goccy/go-json v0.8.1
>> +# [1] git ls-remote https://github.com/goccy/go-json de89bd3db67f2219=
c6183ec6febe2b5f7a6b06fb
>> +SRCREV_go-json=3D"de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
>> +SRC_URI +=3D "git://github.com/goccy/go-json;name=3Dgo-json;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/goccy/go-json"
>> +
>> +#      github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
>> +# [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733=
e9468cdfd1efcd7d196cd1d
>> +SRCREV_shlex=3D"e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
>> +SRC_URI +=3D "git://github.com/google/shlex;name=3Dshlex;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
ithub.com/google/shlex"
>> +
>> +#      github.com/google/uuid v1.3.0
>> +# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf=
723f106b36d56ef13ccc88
>> +SRCREV_uuid=3D"44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
>> +SRC_URI +=3D "git://github.com/google/uuid;name=3Duuid;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/google/uuid"
>> +
>> +#      github.com/inconshreveable/mousetrap v1.0.0
>> +# [1] git ls-remote https://github.com/inconshreveable/mousetrap 7662=
6ae9c91c4f2a10f34cad8ce83ea42c93bb75
>> +SRCREV_mousetrap=3D"76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
>> +SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmouse=
trap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impo=
rt/vendor.fetch/github.com/inconshreveable/mousetrap"
>> +
>> +#      github.com/json-iterator/go v1.1.12
>> +# [1] git ls-remote https://github.com/json-iterator/go 024077e996b04=
8517130b21ea6bf12aa23055d3d
>> +SRCREV_go=3D"024077e996b048517130b21ea6bf12aa23055d3d"
>> +SRC_URI +=3D "git://github.com/json-iterator/go;name=3Dgo;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/json-iterator/go"
>> +
>> +#      github.com/klauspost/compress v1.13.6
>> +# [1] git ls-remote https://github.com/klauspost/compress 38d4ba985ac=
157cb858763e016645e14e74c13c4
>> +SRCREV_compress=3D"38d4ba985ac157cb858763e016645e14e74c13c4"
>> +SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/klauspost/compress"
>> +
>> +#      github.com/mattn/go-ieproxy v0.0.1
>> +# [1] git ls-remote https://github.com/mattn/go-ieproxy 439dd0581a2a0=
3b415673a2462ad5c21eaabc588
>> +SRCREV_go-ieproxy=3D"439dd0581a2a03b415673a2462ad5c21eaabc588"
>> +SRC_URI +=3D "git://github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/mattn/go-ieproxy"
>> +
>> +#      github.com/mattn/go-isatty v0.0.14
>> +# [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f=
1f517c4586048b49b37f829c8e
>> +SRCREV_go-isatty=3D"504425e14f742f1f517c4586048b49b37f829c8e"
>> +SRC_URI +=3D "git://github.com/mattn/go-isatty;name=3Dgo-isatty;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/mattn/go-isatty"
>> +
>> +#      github.com/minio/cli v1.22.0
>> +# [1] git ls-remote https://github.com/minio/cli 735b30120ed7535d1393=
3b0246f8a75cf80b0f74
>> +SRCREV_cli=3D"735b30120ed7535d13933b0246f8a75cf80b0f74"
>> +SRC_URI +=3D "git://github.com/minio/cli;name=3Dcli;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/minio/cli"
>> +
>> +#      github.com/minio/colorjson v1.0.2
>> +# [1] git ls-remote https://github.com/minio/colorjson f964b335cdb6cd=
51dff32a726d3d6ab9e1db0633
>> +SRCREV_colorjson=3D"f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
>> +SRC_URI +=3D "git://github.com/minio/colorjson;name=3Dcolorjson;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/minio/colorjson"
>> +
>> +#      github.com/minio/filepath v1.0.0
>> +# [1] git ls-remote https://github.com/minio/filepath a116cb5d2b6396d=
eea35d06389e3e9809c887fcf
>> +SRCREV_filepath=3D"a116cb5d2b6396deea35d06389e3e9809c887fcf"
>> +SRC_URI +=3D "git://github.com/minio/filepath;name=3Dfilepath;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/minio/filepath"
>> +
>> +#      github.com/minio/madmin-go v1.4.3
>> +# [1] git ls-remote https://github.com/minio/madmin-go 4f71c826739af4=
ebf73308e7f9a849a781859f78
>> +SRCREV_madmin-go=3D"4f71c826739af4ebf73308e7f9a849a781859f78"
>> +SRC_URI +=3D "git://github.com/minio/madmin-go;name=3Dmadmin-go;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/minio/madmin-go"
>> +
>> +#      github.com/minio/md5-simd v1.1.2
>> +# [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ce=
ebbd50fe5c1d61b0c80c608df
>> +SRCREV_md5-simd=3D"776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
>> +SRC_URI +=3D "git://github.com/minio/md5-simd;name=3Dmd5-simd;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/minio/md5-simd"
>> +
>> +#      github.com/minio/minio-go/v7 v7.0.30
>> +# [1] git ls-remote https://github.com/minio/minio-go 81c303325bb4426=
c89776854b2ea4f7936deb11c
>> +SRCREV_v7=3D"81c303325bb4426c89776854b2ea4f7936deb11c"
>> +SRC_URI +=3D "git://github.com/minio/minio-go;name=3Dv7;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/minio/minio-go/v7"
>> +
>> +#      github.com/minio/pkg v1.1.22
>> +# [1] git ls-remote https://github.com/minio/pkg 3b76bdaec27995a31d0b=
0a7959bbef55bfe0d364
>> +SRCREV_pkg=3D"3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
>> +SRC_URI +=3D "git://github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/minio/pkg"
>> +
>> +#      github.com/minio/selfupdate v0.4.0
>> +# [1] git ls-remote https://github.com/minio/selfupdate 9e32fb8d38277=
355add4fa3983edb0b376d12bb5
>> +SRCREV_selfupdate=3D"9e32fb8d38277355add4fa3983edb0b376d12bb5"
>> +SRC_URI +=3D "git://github.com/minio/selfupdate;name=3Dselfupdate;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/minio/selfupdate"
>> +
>> +#      github.com/minio/sha256-simd v1.0.0
>> +# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0f=
a3ae883aee331b71aaa40d5a7dd9
>> +SRCREV_sha256-simd=3D"6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
>> +SRC_URI +=3D "git://github.com/minio/sha256-simd;name=3Dsha256-simd;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/minio/sha256-simd"
>> +
>> +#      github.com/mitchellh/go-homedir v1.1.0
>> +# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf=
3004701891bf4fdb884bfe4920b3727
>> +SRCREV_go-homedir=3D"af06845cf3004701891bf4fdb884bfe4920b3727"
>> +SRC_URI +=3D "git://github.com/mitchellh/go-homedir;name=3Dgo-homedir=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/mitchellh/go-homedir"
>> +
>> +#      github.com/pkg/xattr v0.4.4
>> +# [1] git ls-remote https://github.com/pkg/xattr 8725d4ccc0fcef59c8d9=
f0eaf606b3c6f962467a
>> +SRCREV_xattr=3D"8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
>> +SRC_URI +=3D "git://github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/pkg/xattr"
>> +
>> +#      github.com/posener/complete v1.2.3
>> +# [1] git ls-remote https://github.com/posener/complete 05b68ffc813dd=
10c420993cb1cf927b346c057b8
>> +SRCREV_complete=3D"05b68ffc813dd10c420993cb1cf927b346c057b8"
>> +SRC_URI +=3D "git://github.com/posener/complete;name=3Dcomplete;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/posener/complete"
>> +
>> +#      github.com/prometheus/client_golang v1.12.1
>> +# [1] git ls-remote https://github.com/prometheus/client_golang 2e1c4=
818ccfdcf953ce399cadad615ff2bed968c
>> +SRCREV_client_golang=3D"2e1c4818ccfdcf953ce399cadad615ff2bed968c"
>> +SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient=
_golang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/prometheus/client_golang"
>> +
>> +#      github.com/prometheus/prom2json v1.3.1
>> +# [1] git ls-remote https://github.com/prometheus/prom2json ac13972e5=
4feb2f8eafc9a613112cb310f5463dc
>> +SRCREV_prom2json=3D"ac13972e54feb2f8eafc9a613112cb310f5463dc"
>> +SRC_URI +=3D "git://github.com/prometheus/prom2json;name=3Dprom2json;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/prometheus/prom2json"
>> +
>> +#      github.com/rjeczalik/notify v0.9.2
>> +# [1] git ls-remote https://github.com/rjeczalik/notify 69d839f37b13a=
8cb7a78366f7633a4071cb43be7
>> +SRCREV_notify=3D"69d839f37b13a8cb7a78366f7633a4071cb43be7"
>> +SRC_URI +=3D "git://github.com/rjeczalik/notify;name=3Dnotify;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/rjeczalik/notify"
>> +
>> +#      github.com/rs/xid v1.3.0
>> +# [1] git ls-remote https://github.com/rs/xid efa678f304ab65d6d57eedc=
b086798381ae22206
>> +SRCREV_xid=3D"efa678f304ab65d6d57eedcb086798381ae22206"
>> +SRC_URI +=3D "git://github.com/rs/xid;name=3Dxid;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/rs/xid"
>> +
>> +#      github.com/secure-io/sio-go v0.3.1
>> +# [1] git ls-remote https://github.com/secure-io/sio-go a455d2cd8fcac=
dfe18557d117db15c0629fb7e2c
>> +SRCREV_sio-go=3D"a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
>> +SRC_URI +=3D "git://github.com/secure-io/sio-go;name=3Dsio-go;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/secure-io/sio-go"
>> +
>> +#      github.com/shirou/gopsutil/v3 v3.21.12
>> +# [1] git ls-remote https://github.com/shirou/gopsutil 2f8da0a39487ce=
ddf44cebe53a1b563b0b7173cc
>> +SRCREV_v3=3D"2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
>> +SRC_URI +=3D "git://github.com/shirou/gopsutil;name=3Dv3;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
ithub.com/shirou/gopsutil/v3"
>> +
>> +#      github.com/tidwall/gjson v1.12.1
>> +# [1] git ls-remote https://github.com/tidwall/gjson db0033701cccc8e2=
e43b77d03e4f509a48b6b2f2
>> +SRCREV_gjson=3D"db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
>> +SRC_URI +=3D "git://github.com/tidwall/gjson;name=3Dgjson;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/tidwall/gjson"
>> +
>> +#      golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
>> +# [1] git ls-remote https://go.googlesource.com/crypto 793ad666bf5ec6=
1392092b27061be9618e4e219b
>> +SRCREV_crypto=3D"793ad666bf5ec61392092b27061be9618e4e219b"
>> +SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/go.googlesource.com/crypto"
>> +
>> +#      golang.org/x/net v0.0.0-20220225172249-27dd8689420f
>> +# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde08=
8514397d015e4fea5174e0e
>> +SRCREV_net=3D"27dd8689420fcde088514397d015e4fea5174e0e"
>> +SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
googlesource.com/net"
>> +
>> +#      golang.org/x/text v0.3.7
>> +# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883=
d229d707172ed356727aae99
>> +SRCREV_text=3D"3cd4007149f3f883d229d707172ed356727aae99"
>> +SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
o.googlesource.com/text"
>> +
>> +#      gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
>> +# [1] git ls-remote https://gopkg.in/check.v1 038fdea0a05bc030b0bfda4=
79dc2e08d2220ec74
>> +SRCREV_check.v1=3D"038fdea0a05bc030b0bfda479dc2e08d2220ec74"
>> +SRC_URI +=3D "git://gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopk=
g.in/check.v1"
>> +
>> +#      gopkg.in/h2non/filetype.v1 v1.0.5
>> +# [1] git ls-remote https://gopkg.in/h2non/filetype.v1 8f3142c797f041=
3f00dadaf1bf97dd0b7b1f8d8b
>> +SRCREV_filetype.v1=3D"8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
>> +SRC_URI +=3D "git://gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/gopkg.in/h2non/filetype.v1"
>> +
>> +#      gopkg.in/yaml.v2 v2.4.0
>> +# [1] git ls-remote https://gopkg.in/yaml.v2 7649d4548cb53a614db133b2=
a8ac1f31859dda8c
>> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
>> +SRC_URI +=3D "git://gopkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.=
in/yaml.v2"
>> +
>> +#      github.com/charmbracelet/bubbles v0.10.0
>> +# [1] git ls-remote https://github.com/charmbracelet/bubbles 7714089a=
d7c81898564ebeb7b6876b5844e26ccd
>> +SRCREV_bubbles=3D"7714089ad7c81898564ebeb7b6876b5844e26ccd"
>> +SRC_URI +=3D "git://github.com/charmbracelet/bubbles;name=3Dbubbles;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/charmbracelet/bubbles"
>> +
>> +#      github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf29=
12e703f6
>> +# [1] git ls-remote https://github.com/charmbracelet/lipgloss bf2912e=
703f6ecf88a1b843472afd47ce5002caf
>> +SRCREV_lipgloss=3D"bf2912e703f6ecf88a1b843472afd47ce5002caf"
>> +SRC_URI +=3D "git://github.com/charmbracelet/lipgloss;name=3Dlipgloss=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/charmbracelet/lipgloss"
>> +
>> +#      github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857=
a1
>> +# [1] git ls-remote https://github.com/gdamore/tcell f057f0a857a1b3ac=
3e4fff8c6cfe8126f8387cd1
>> +SRCREV_v2=3D"f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
>> +SRC_URI +=3D "git://github.com/gdamore/tcell;name=3Dv2;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/gdamore/tcell/v2"
>> +
>> +#      github.com/golang-jwt/jwt/v4 v4.4.1
>> +# [1] git ls-remote https://github.com/golang-jwt/jwt 0972257eba279bb=
357882afc11db8218644ad565
>> +SRCREV_v4=3D"0972257eba279bb357882afc11db8218644ad565"
>> +SRC_URI +=3D "git://github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang-jwt/jwt/v4"
>> +
>> +#      github.com/navidys/tvxwidgets v0.1.0
>> +# [1] git ls-remote https://github.com/navidys/tvxwidgets f017cfd5ce6=
d4bd7fb22529305d7a438c3f1369d
>> +SRCREV_tvxwidgets=3D"f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
>> +SRC_URI +=3D "git://github.com/navidys/tvxwidgets;name=3Dtvxwidgets;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/navidys/tvxwidgets"
>> +
>> +#      github.com/olekukonko/tablewriter v0.0.5
>> +# [1] git ls-remote https://github.com/olekukonko/tablewriter c7d2a8a=
09b076b70918308a3cd95464b2ae3b5d8
>> +SRCREV_tablewriter=3D"c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
>> +SRC_URI +=3D "git://github.com/olekukonko/tablewriter;name=3Dtablewri=
ter;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/olekukonko/tablewriter"
>> +
>> +#      github.com/prometheus/client_model v0.2.0
>> +# [1] git ls-remote https://github.com/prometheus/client_model f44e7a=
dcba5ee54c8a94709e6fc300d83245f171
>> +SRCREV_client_model=3D"f44e7adcba5ee54c8a94709e6fc300d83245f171"
>> +SRC_URI +=3D "git://github.com/prometheus/client_model;name=3Dclient_=
model;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/github.com/prometheus/client_model"
>> +
>> +#      github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
>> +# [1] git ls-remote https://github.com/rivo/tview 2a6de950f73bdc70658=
f7e754d4b5593f15c8408
>> +SRCREV_tview=3D"2a6de950f73bdc70658f7e754d4b5593f15c8408"
>> +SRC_URI +=3D "git://github.com/rivo/tview;name=3Dtview;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/rivo/tview"
>> +
>> +#      github.com/tinylib/msgp v1.1.6
>> +# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54=
677b486e350b4d105da6d8b
>> +SRCREV_msgp=3D"205265da651409c54677b486e350b4d105da6d8b"
>> +SRC_URI +=3D "git://github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/tinylib/msgp"
>> +
>> +#      golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
>> +# [1] git ls-remote https://go.googlesource.com/term 03fcf44c2211dcd5=
eb77510b5f7c1fb02d6ded50
>> +SRCREV_term=3D"03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
>> +SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
o.googlesource.com/term"
>> +
>> +#      github.com/beorn7/perks v1.0.1
>> +# [1] git ls-remote https://github.com/beorn7/perks c49ff274687222a73=
73c4cd83578f1065cf3e143
>> +SRCREV_perks=3D"c49ff274687222a7373c4cd83578f1065cf3e143"
>> +SRC_URI +=3D "git://github.com/beorn7/perks;name=3Dperks;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
ithub.com/beorn7/perks"
>> +
>> +#      github.com/cespare/xxhash/v2 v2.1.2
>> +# [1] git ls-remote https://github.com/cespare/xxhash 7ae26c41ed6fb1f=
8a6c21e05eeff4d91b5e401c4
>> +SRCREV_v21=3D"7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
>> +SRC_URI +=3D "git://github.com/cespare/xxhash;name=3Dv21;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
ithub.com/cespare/xxhash/v2"
>> +
>> +#      github.com/containerd/console v1.0.2
>> +# [1] git ls-remote https://github.com/containerd/console d5efa7d56fd=
239f7f3dad2ab6685db09359a3618
>> +SRCREV_console=3D"d5efa7d56fd239f7f3dad2ab6685db09359a3618"
>> +SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/containerd/console"
>> +
>> +#      github.com/coreos/go-semver v0.3.0
>> +# [1] git ls-remote https://github.com/coreos/go-semver 6e25b691b0ebe=
9657dd0ee60d73a9f8716f0c6f5
>> +SRCREV_go-semver=3D"6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
>> +SRC_URI +=3D "git://github.com/coreos/go-semver;name=3Dgo-semver;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/coreos/go-semver"
>> +
>> +#      github.com/coreos/go-systemd/v22 v22.3.2
>> +# [1] git ls-remote https://github.com/coreos/go-systemd 0b40357fd657=
60243a3eceb80a299772c23c8470
>> +SRCREV_v22=3D"0b40357fd65760243a3eceb80a299772c23c8470"
>> +SRC_URI +=3D "git://github.com/coreos/go-systemd;name=3Dv22;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/coreos/go-systemd/v22"
>> +
>> +#      github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
>> +# [1] git ls-remote https://github.com/decred/dcrd 75f1b4dac2e43133f3=
281ac63a9ef9eb699200e5
>> +SRCREV_v41=3D"75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
>> +SRC_URI +=3D "git://github.com/decred/dcrd;name=3Dv41;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/decred/dcrd/dcrec/secp256k1/v4"
>> +
>> +#      github.com/fatih/structs v1.1.0
>> +# [1] git ls-remote https://github.com/fatih/structs 4966fc68f5b7593a=
afa6cbbba2d65ec6e1416047
>> +SRCREV_structs=3D"4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
>> +SRC_URI +=3D "git://github.com/fatih/structs;name=3Dstructs;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/fatih/structs"
>> +
>> +#      github.com/gdamore/encoding v1.0.0
>> +# [1] git ls-remote https://github.com/gdamore/encoding 79c592247a624=
8468805a0e297f43a7cac979903
>> +SRCREV_encoding=3D"79c592247a6248468805a0e297f43a7cac979903"
>> +SRC_URI +=3D "git://github.com/gdamore/encoding;name=3Dencoding;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/gdamore/encoding"
>> +
>> +#      github.com/gogo/protobuf v1.3.2
>> +# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc352=
1ede29f62fe3ce239267c1bc
>> +SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
>> +SRC_URI +=3D "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/gogo/protobuf"
>> +
>> +#      github.com/golang/protobuf v1.5.2
>> +# [1] git ls-remote https://github.com/golang/protobuf ae97035608a719=
c7a1c1c41bed0ae0744bdb0c6f
>> +SRCREV_protobuf1=3D"ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
>> +SRC_URI +=3D "git://github.com/golang/protobuf;name=3Dprotobuf1;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/golang/protobuf"
>> +
>> +#      github.com/hashicorp/errwrap v1.1.0
>> +# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c=
64d14dd0caaacbd13e76254d02c0
>> +SRCREV_errwrap=3D"7b00e5db719c64d14dd0caaacbd13e76254d02c0"
>> +SRC_URI +=3D "git://github.com/hashicorp/errwrap;name=3Derrwrap;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/hashicorp/errwrap"
>> +
>> +#      github.com/hashicorp/go-multierror v1.1.1
>> +# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9=
ec57696378079ecc3accd3d6f29401b3a0
>> +SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
>> +SRC_URI +=3D "git://github.com/hashicorp/go-multierror;name=3Dgo-mult=
ierror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/hashicorp/go-multierror"
>> +
>> +#      github.com/klauspost/cpuid/v2 v2.0.9
>> +# [1] git ls-remote https://github.com/klauspost/cpuid 6903d4066801a7=
d800d4537ee9eebe81ea97000e
>> +SRCREV_v212=3D"6903d4066801a7d800d4537ee9eebe81ea97000e"
>> +SRC_URI +=3D "git://github.com/klauspost/cpuid;name=3Dv212;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/klauspost/cpuid/v2"
>> +
>> +#      github.com/kr/text v0.2.0
>> +# [1] git ls-remote https://github.com/kr/text 0e5f52c28dd72ab84daeb8=
1b5a51f20fdc35f9c5
>> +SRCREV_text1=3D"0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
>> +SRC_URI +=3D "git://github.com/kr/text;name=3Dtext1;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/kr/text"
>> +
>> +#      github.com/lestrrat-go/backoff/v2 v2.0.8
>> +# [1] git ls-remote https://github.com/lestrrat-go/backoff c3af762cb9=
d2bc8339e1d5099a4550366a675f60
>> +SRCREV_v2123=3D"c3af762cb9d2bc8339e1d5099a4550366a675f60"
>> +SRC_URI +=3D "git://github.com/lestrrat-go/backoff;name=3Dv2123;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/lestrrat-go/backoff/v2"
>> +
>> +#      github.com/lestrrat-go/blackmagic v1.0.0
>> +# [1] git ls-remote https://github.com/lestrrat-go/blackmagic 370527f=
88bbfd5be3192a38af3148dbd64f0976f
>> +SRCREV_blackmagic=3D"370527f88bbfd5be3192a38af3148dbd64f0976f"
>> +SRC_URI +=3D "git://github.com/lestrrat-go/blackmagic;name=3Dblackmag=
ic;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/lestrrat-go/blackmagic"
>> +
>> +#      github.com/lestrrat-go/httpcc v1.0.0
>> +# [1] git ls-remote https://github.com/lestrrat-go/httpcc e7e8fea419e=
32f7549252ad15ecf17f3a3c1a268
>> +SRCREV_httpcc=3D"e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
>> +SRC_URI +=3D "git://github.com/lestrrat-go/httpcc;name=3Dhttpcc;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/lestrrat-go/httpcc"
>> +
>> +#      github.com/lestrrat-go/iter v1.0.1
>> +# [1] git ls-remote https://github.com/lestrrat-go/iter 628869e97ee3d=
cc09033086e547a5cab96b0d708
>> +SRCREV_iter=3D"628869e97ee3dcc09033086e547a5cab96b0d708"
>> +SRC_URI +=3D "git://github.com/lestrrat-go/iter;name=3Diter;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/lestrrat-go/iter"
>> +
>> +#      github.com/lestrrat-go/jwx v1.2.14
>> +# [1] git ls-remote https://github.com/lestrrat-go/jwx de7d9bca43812a=
bc4f630320f8632108ccfe34bf
>> +SRCREV_jwx=3D"de7d9bca43812abc4f630320f8632108ccfe34bf"
>> +SRC_URI +=3D "git://github.com/lestrrat-go/jwx;name=3Djwx;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/lestrrat-go/jwx"
>> +
>> +#      github.com/lestrrat-go/option v1.0.0
>> +# [1] git ls-remote https://github.com/lestrrat-go/option 7e3467dce32=
0ff45667b138ae503367c92deaa0b
>> +SRCREV_option=3D"7e3467dce320ff45667b138ae503367c92deaa0b"
>> +SRC_URI +=3D "git://github.com/lestrrat-go/option;name=3Doption;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/lestrrat-go/option"
>> +
>> +#      github.com/lucasb-eyer/go-colorful v1.2.0
>> +# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful d2b05a=
0d83cca9d610425691c3253d5f36d0ad06
>> +SRCREV_go-colorful=3D"d2b05a0d83cca9d610425691c3253d5f36d0ad06"
>> +SRC_URI +=3D "git://github.com/lucasb-eyer/go-colorful;name=3Dgo-colo=
rful;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impo=
rt/vendor.fetch/github.com/lucasb-eyer/go-colorful"
>> +
>> +#      github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
>> +# [1] git ls-remote https://github.com/lufia/plan9stats 39d0f177ccd07=
bdf5eb6f051ab9b09651f05d6f2
>> +SRCREV_plan9stats=3D"39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
>> +SRC_URI +=3D "git://github.com/lufia/plan9stats;name=3Dplan9stats;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/lufia/plan9stats"
>> +
>> +#      github.com/mattn/go-colorable v0.1.12
>> +# [1] git ls-remote https://github.com/mattn/go-colorable e1bb79c8d53=
c38a60962ad4b8f658226cc983710
>> +SRCREV_go-colorable=3D"e1bb79c8d53c38a60962ad4b8f658226cc983710"
>> +SRC_URI +=3D "git://github.com/mattn/go-colorable;name=3Dgo-colorable=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/mattn/go-colorable"
>> +
>> +#      github.com/mattn/go-runewidth v0.0.13
>> +# [1] git ls-remote https://github.com/mattn/go-runewidth df1ff596543=
17c1b5a3f860ffc47402931932104
>> +SRCREV_go-runewidth=3D"df1ff59654317c1b5a3f860ffc47402931932104"
>> +SRC_URI +=3D "git://github.com/mattn/go-runewidth;name=3Dgo-runewidth=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/mattn/go-runewidth"
>> +
>> +#      github.com/matttproud/golang_protobuf_extensions v1.0.1
>> +# [1] git ls-remote https://github.com/matttproud/golang_protobuf_ext=
ensions c12348ce28de40eed0136aa2b644d0ee0650e56c
>> +SRCREV_golang_protobuf_extensions=3D"c12348ce28de40eed0136aa2b644d0ee=
0650e56c"
>> +SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;=
name=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang=
_protobuf_extensions"
>> +
>> +#      github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7e=
f1dd
>> +# [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef=
1dd9b15be4a9909b8ac7a4e313eec94
>> +SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
>> +SRC_URI +=3D "git://github.com/modern-go/concurrent;name=3Dconcurrent=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/modern-go/concurrent"
>> +
>> +#      github.com/modern-go/reflect2 v1.0.2
>> +# [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bb=
c5231aea69b8861c540102b087070
>> +SRCREV_reflect2=3D"2b33151c9bbc5231aea69b8861c540102b087070"
>> +SRC_URI +=3D "git://github.com/modern-go/reflect2;name=3Dreflect2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/modern-go/reflect2"
>> +
>> +#      github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
>> +# [1] git ls-remote https://github.com/muesli/ansi 2e021307bc4b4f4766=
c3fb4faf6030b13dc9ec51
>> +SRCREV_ansi=3D"2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
>> +SRC_URI +=3D "git://github.com/muesli/ansi;name=3Dansi;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/muesli/ansi"
>> +
>> +#      github.com/muesli/reflow v0.3.0
>> +# [1] git ls-remote https://github.com/muesli/reflow 602e329532049c9e=
33fa8c74e352a46fb9486947
>> +SRCREV_reflow=3D"602e329532049c9e33fa8c74e352a46fb9486947"
>> +SRC_URI +=3D "git://github.com/muesli/reflow;name=3Dreflow;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/muesli/reflow"
>> +
>> +#      github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e=
0
>> +# [1] git ls-remote https://github.com/muesli/termenv 5ac8409525e03ee=
6cd96daeae32d47902b88f32a
>> +SRCREV_termenv=3D"5ac8409525e03ee6cd96daeae32d47902b88f32a"
>> +SRC_URI +=3D "git://github.com/muesli/termenv;name=3Dtermenv;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/muesli/termenv"
>> +
>> +#      github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
>> +# [1] git ls-remote https://github.com/niemeyer/pretty a10e7caefd8e0d=
600cea437f5c3613aeb1553d56
>> +SRCREV_pretty=3D"a10e7caefd8e0d600cea437f5c3613aeb1553d56"
>> +SRC_URI +=3D "git://github.com/niemeyer/pretty;name=3Dpretty;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/niemeyer/pretty"
>> +
>> +#      github.com/philhofer/fwd v1.1.1
>> +# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8=
516a132ec243ba944efdb644
>> +SRCREV_fwd=3D"9bcb9cab1b0394d8516a132ec243ba944efdb644"
>> +SRC_URI +=3D "git://github.com/philhofer/fwd;name=3Dfwd;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/philhofer/fwd"
>> +
>> +#      github.com/pkg/errors v0.9.1
>> +# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c=
1767a985424175c39b465
>> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
>> +SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/pkg/errors"
>> +
>> +#      github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc22=
1ea8c
>> +# [1] git ls-remote https://github.com/power-devops/perfstat 5aafc221=
ea8c1ff54b0835cbd5f2386a8410be11
>> +SRCREV_perfstat=3D"5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
>> +SRC_URI +=3D "git://github.com/power-devops/perfstat;name=3Dperfstat;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/power-devops/perfstat"
>> +
>> +#      github.com/prometheus/common v0.33.0
>> +# [1] git ls-remote https://github.com/prometheus/common 63e75f51cd23=
68130efbd51b95a4e457e64b444e
>> +SRCREV_common=3D"63e75f51cd2368130efbd51b95a4e457e64b444e"
>> +SRC_URI +=3D "git://github.com/prometheus/common;name=3Dcommon;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/prometheus/common"
>> +
>> +#      github.com/prometheus/procfs v0.7.3
>> +# [1] git ls-remote https://github.com/prometheus/procfs f436cbb89ece=
38bf080d446b3ca27053b305eaac
>> +SRCREV_procfs=3D"f436cbb89ece38bf080d446b3ca27053b305eaac"
>> +SRC_URI +=3D "git://github.com/prometheus/procfs;name=3Dprocfs;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/prometheus/procfs"
>> +
>> +#      github.com/rivo/uniseg v0.2.0
>> +# [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc7=
4c241e2dddd06a9bc9e53d
>> +SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
>> +SRC_URI +=3D "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
ithub.com/rivo/uniseg"
>> +
>> +#      github.com/sirupsen/logrus v1.8.1
>> +# [1] git ls-remote https://github.com/sirupsen/logrus bdc0db8ead3853=
c56b7cd1ac2ba4e11b47d7da6b
>> +SRCREV_logrus=3D"bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
>> +SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/sirupsen/logrus"
>> +
>> +#      github.com/tidwall/match v1.1.1
>> +# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0=
a3d347e9190aa78c5bec09cf
>> +SRCREV_match=3D"4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
>> +SRC_URI +=3D "git://github.com/tidwall/match;name=3Dmatch;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/tidwall/match"
>> +
>> +#      github.com/tidwall/pretty v1.2.0
>> +# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0=
028a854b85675801362cbdaa2
>> +SRCREV_pretty1=3D"aaa765e7476acb0028a854b85675801362cbdaa2"
>> +SRC_URI +=3D "git://github.com/tidwall/pretty;name=3Dpretty1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/tidwall/pretty"
>> +
>> +#      github.com/tklauser/go-sysconf v0.3.9
>> +# [1] git ls-remote https://github.com/tklauser/go-sysconf 746b19d14e=
19d242c2daa08e0d645c19832c1939
>> +SRCREV_go-sysconf=3D"746b19d14e19d242c2daa08e0d645c19832c1939"
>> +SRC_URI +=3D "git://github.com/tklauser/go-sysconf;name=3Dgo-sysconf;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/tklauser/go-sysconf"
>> +
>> +#      github.com/tklauser/numcpus v0.3.0
>> +# [1] git ls-remote https://github.com/tklauser/numcpus cc3fdd5f3955d=
53d50d94380963bddd24bd373e2
>> +SRCREV_numcpus=3D"cc3fdd5f3955d53d50d94380963bddd24bd373e2"
>> +SRC_URI +=3D "git://github.com/tklauser/numcpus;name=3Dnumcpus;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/tklauser/numcpus"
>> +
>> +#      github.com/yusufpapurcu/wmi v1.2.2
>> +# [1] git ls-remote https://github.com/yusufpapurcu/wmi 253c5f0cb35e6=
66c4c0fc42083824e7c89f0cc8d
>> +SRCREV_wmi=3D"253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
>> +SRC_URI +=3D "git://github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/yusufpapurcu/wmi"
>> +
>> +#      go.etcd.io/etcd/api/v3 v3.5.2
>> +# [1] git ls-remote https://github.com/etcd-io/etcd 4591a096d4d3c08e5=
77d7269851938db0c1da3d4
>> +SRCREV_v31=3D"4591a096d4d3c08e577d7269851938db0c1da3d4"
>> +SRC_URI +=3D "git://github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/etcd-io/etcd/api/v3"
>> +
>> +#      go.uber.org/atomic v1.9.0
>> +# [1] git ls-remote https://github.com/uber-go/atomic 135466e2d0c8f8a=
df4d37dc757e3df0ebdd0dfe8
>> +SRCREV_atomic=3D"135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
>> +SRC_URI +=3D "git://github.com/uber-go/atomic;name=3Datomic;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
go.uber.org/atomic"
>> +
>> +#      go.uber.org/multierr v1.7.0
>> +# [1] git ls-remote https://github.com/uber-go/multierr 19d9fff1d3b66=
750a134671435786579bc994737
>> +SRCREV_multierr=3D"19d9fff1d3b66750a134671435786579bc994737"
>> +SRC_URI +=3D "git://github.com/uber-go/multierr;name=3Dmultierr;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/go.uber.org/multierr"
>> +
>> +#      go.uber.org/zap v1.19.1
>> +# [1] git ls-remote https://github.com/uber-go/zap 2f61e97148e69cd2dd=
1902b03e89ce07cd1218a1
>> +SRCREV_zap=3D"2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
>> +SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.u=
ber.org/zap"
>> +
>> +#      golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
>> +# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf=
193dd5a34e034151da389d09
>> +SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
>> +SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/g=
o.googlesource.com/sync"
>> +
>> +#      golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
>> +# [1] git ls-remote https://go.googlesource.com/sys 33da011f77ade50ff=
5b6a6fb4a9a1e6d6b285809
>> +SRCREV_sys=3D"33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
>> +SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
googlesource.com/sys"
>> +
>> +#      google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
>> +# [1] git ls-remote https://github.com/googleapis/go-genproto 3ac035c=
7e7cbd86eb6d8b95be888cf83d73dedd3
>> +SRCREV_genproto=3D"3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
>> +SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/google.golang.org/genproto"
>> +
>> +#      google.golang.org/grpc v1.43.0
>> +# [1] git ls-remote https://github.com/grpc/grpc-go 14c11384b76b67f7b=
1b32a5d18f865762634c0ae
>> +SRCREV_grpc=3D"14c11384b76b67f7b1b32a5d18f865762634c0ae"
>> +SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
ogle.golang.org/grpc"
>> +
>> +#      google.golang.org/protobuf v1.27.1
>> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go b9=
2717ecb630d4a4824b372bf98c729d87311a4d
>> +SRCREV_protobuf12=3D"b92717ecb630d4a4824b372bf98c729d87311a4d"
>> +SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;name=3Dpro=
tobuf12;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/google.golang.org/protobuf"
>> +
>> +#      gopkg.in/ini.v1 v1.66.3
>> +# [1] git ls-remote https://gopkg.in/ini.v1 fcd6cc399e588727c1231f4ea=
187d1b963536bcc
>> +SRCREV_ini.v1=3D"fcd6cc399e588727c1231f4ea187d1b963536bcc"
>> +SRC_URI +=3D "git://gopkg.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in=
/ini.v1"
>> +
>> +#      gopkg.in/yaml.v3 v3.0.1
>> +# [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd=
2c32c51f8194bf51
>> +SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
>> +SRC_URI +=3D "git://gopkg.in/yaml.v3;name=3Dyaml.v3;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.=
in/yaml.v3"
>> --
>> 2.33.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99378): https://lists.openembedded.org/g/openembed=
ded-devel/message/99378
>> Mute This Topic: https://lists.openembedded.org/mt/94687258/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

