Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057F2C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 14:25:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31917.1632752719345644390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 07:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DKhKN8Rz;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=49042133ba=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RDpECa006818
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 14:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MCEMyM+m9SC1czVRc47XswejrDvZLESXwDGLlZZLkXA=;
 b=DKhKN8RzYg+hnmvPqyeUb0NOTfYe6hSB+Dyliipzkgp8Rjx3OzQrQLvOvhSleak43rcB
 YVS94yXGRaZmLjkg2BSlJpp7/eOQ0PlzmGhroowUAjOlQi31waHSc0cNoGh4csBrh2Dc
 zh+h8bZzFd+sCmzpCzVugsFtO3lLZ4jqqMKYAyKprAZU40emUbikXZlxh7qK29tFf0PD
 bmsXThhgaaiXMWtPeVhTorSq71+VTE0CY2W3y/JJO6Ijxo4BgEydhKpKs7xGmPvOLrTF
 jkkIlq+5FCNNrlVg3u7msw7i/m9uHjl9mO/yKFEf/JSzBetSVVbiXTGxnGcBrNE0BZqm +w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhr9ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 14:25:17 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18REPG8k025142
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 14:25:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhr9eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Sep 2021 14:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRZO/kayAbZyvBGHHvO6kS3g/SIciMCj2LKGTTAcXPADhW2aYa/vSxur64lhOR0CHOw/nApk6KDQ6lTgqIlteFoRC+AzriciVo/NxwhRJaeNHQ9vnRrNip9YfuA+bs46VxCqUegNbLoCyFN78qfqfiPIB2f8p2ReX4rrVJHpawWC6KqHl+C7CBgcbY/w7tbElJTU4VQu4JtJkS+pF74uBqEmq5uW5KSsP4iTo8622jXAMPhx7t/v9qwW1MD32jeqrmWtb2w5n8lYBRhQaH5JBLr2rj6JAXLTXqFtE7xg1vQhKMuEiZtUVrjubj90YdhrhSuoIb4aJtlJGOtHBHVifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MCEMyM+m9SC1czVRc47XswejrDvZLESXwDGLlZZLkXA=;
 b=Q7evgj7EEvRpsr9FGaQMJe09WxeCfmnzKJcWIEFm1/8CMDkynYOJtuyQUazosJS59dvYuSTIpgBOQw+n3y1MoXUST900Vwswr+hbEWArO7cFG1z01QTS0M9QpfwX++NG+bNWWPr7d/38Gwtf+cSz/gMf7RXukT15wwwufKxKZ+DxvWvKU+UA+jEevIKfH/tRkGj/JBisvfqVF81kpxiFIyYR+v1xguHksxi7TTe76SdsDjUn4Ic7AIVt7VG/KpDczTdpL53eBjon/fcISFEa6IG1O8gCw4F38fxrGm1brxfvaswPd8LNBtQFaBw+kdg7Tpj3+Dd22wjGXLj+ijgQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1241.namprd11.prod.outlook.com (2603:10b6:3:15::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.21; Mon, 27 Sep 2021 14:25:13 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4194:d852:a5e5:77d6]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4194:d852:a5e5:77d6%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 14:25:13 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH] gd: upgrade 2.3.2 -> 2.3.3
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20210921200820.8490-1-sakib.sajal@windriver.com>
 <12ad9aa4-8ab9-6197-9e85-5f3a89eab5f2@gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
Message-ID: <dc9c6b12-2190-c6b7-4dcc-7c83a5ed5fc6@windriver.com>
Date: Mon, 27 Sep 2021 10:25:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <12ad9aa4-8ab9-6197-9e85-5f3a89eab5f2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::7) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
Received: from [192.168.2.28] (184.144.68.109) by
 YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::7) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 14:25:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d5633c3-be33-4bd4-f396-08d981c29e84
X-MS-TrafficTypeDiagnostic: DM5PR11MB1241:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1241DB9EEAFA8E432A0C90C5F2A79@DM5PR11MB1241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RcdBKWlp+wMGtMOrCYZl4+stQmxsmmBt8v3K6rwuxKLvP5U4s7uaWYjWeMxEcDnHDDvwB5PTf7Q8nkJo5HmmdEmdNfQ7uDDc+n2JBVZWZc7r21PIVNNhmNXCdohPvI+i6j6VP/4R6CvBar5lBAXQRNyQGGAkmU+xx5BGs2HwyiKQYBPzoAJYmdeAiA16b0p3SLkL7Rn0NneCdaVq9YlPAFQkRI+VCaC9W84Udz1+BDY7WAwrnmA4ajRWSUuD9nNa9tElXYu58nXvtUjQUZKiVt7xz8G0mkVVxlGwFDGbbY83eoMZVb+/siNjjjJ1tsij18IL5EkPGtzu7+Wd60iy6jIQTU7MUEi9lFmFm0dGm+6n9nEd+uAHrEu/8zjnatAbZ+sKqJsymxWV+IaOFfiSGTnDIrysOh3WJ8hOBlpoB1TLFyCOMvIPcyHLaW9Xo4chPJAayHB7LqoJsXaG53hzQ9iksglfEG8vWnGFxjTgzkxW3EQi6nleXk8KeD0nL7Ni8s0KxeNx7SpmZGbPZ3OTwPwT/vr9g2Wis3Ld0ybS5T2e6gfal22LtU9/VS5hC/NXXDlNhUpFHEYunyzWmBkR8iLnmyIIPNCV+2R6SqOWJYnspVzEyLeFrFCOve8e321R0FFHx5laiCQJ7V5Fqvid9Cphewl8yxxryfy3M7kS2dj/iQw8RHfAP3PE8s02osxH+ccqjk8fQZ+UtzsyFtKAazStIVbydpbbDG7Svakof7elXQmu9C0UfNJTeZ0NtkkzLWId5VppmI+qB25GhW9QI7UwVEW75TzGVXzUhtDbxre8Cw8VnX4rFyLevMTLA2NqzTN3LyK9pby3ZpI7RbOEu75u4M4OWe1VgyvJtMirxxr5JHh89V8GBW3sn5sFUG6k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(5660300002)(2906002)(66946007)(8676002)(316002)(8936002)(38350700002)(956004)(2616005)(83380400001)(6486002)(31686004)(16576012)(38100700002)(52116002)(186003)(86362001)(53546011)(31696002)(508600001)(26005)(66556008)(66476007)(36756003)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1dBa1h5K2txaXkwemV2bTNCdXlzcUcvQnRRYlhNRjRRbCs4WU1DTkQrWWs0?=
 =?utf-8?B?SzFjZ29sS3JXUndhaDRWMjk0b3YwemxXZ2FQUEpRTlR4bE9DSHAwUUQ2dmFa?=
 =?utf-8?B?eGNZMGJEZ0tRaU1NdWdpd213bVJVc2ZZbUFRVHZNdVdLTjU5amF1QkQ3WXor?=
 =?utf-8?B?TUNZWGxia2hoKzQwYXJqQ1RPZk9UeTR4Y0o0dFY1UWNLc2NXako1d3hpeGFI?=
 =?utf-8?B?Wkc0U2sreEVSS1dGTDNiVy9iMlMzREpzdlNCcmlvczZ5K2lQU3ZJd25IZUdX?=
 =?utf-8?B?ZzhKUUQ3Q2dubnFweExMU0xuRk1qMjA0YjBwZWJ1dW41N0wxa3ZUN2ppbEpi?=
 =?utf-8?B?S1FYVVpNMVdvVnNyNFRtbmpNWGMrZkI4b0hSQ3FKdDI3YUhLdVpSdUpTa3Fh?=
 =?utf-8?B?TnBlelB6Ync5aVREOVBTbENmUlh5MWRDZjcwR1NldzJrQjNVU1hJUXZNYnda?=
 =?utf-8?B?TzFmcXhMTGxRajI2QzBDclNFVEE4SE1kR1FwdXpLZ25xTUszdXNwZzVjN2t5?=
 =?utf-8?B?VmdTOTNOWFZ3QnVocHE3VWZyTDlGajNWc3JlQWxpTUtDTlQ5TUJKTUVZWjM5?=
 =?utf-8?B?ZE1kYktNUXhub1FMRXJGa004WkFNRnhnM004bWd4UEx4VEZaa1Q1TDh2b0ZT?=
 =?utf-8?B?clpQRXM1cEpnMlVTVzlNVVE5aXcrZVZiMDFIVzZPRzcyVG5ReEg5RkVvNkpO?=
 =?utf-8?B?amZTVTBmb3dJNVhCUWV0MTJCL3dJWWo1RjFGTGVNQzhSd1lVblFrRWNVVkVi?=
 =?utf-8?B?Q2tUOVVFVDVFZUxQK1J0ZDRlMlhOZ2RSeDIyREkwcmhkT2ZybGNISkVndU9s?=
 =?utf-8?B?YnNrYUk5VFFjNGVDUGM2K1gxajNMWHRGMnBtZXppbWdweURDV3NTWElxeEhH?=
 =?utf-8?B?TE5KdFU5VEh3dW1Sb0tHQ2ZZeFFDeFZiRUFub0ZOWm1PU1g3a3dQYVZMRXZh?=
 =?utf-8?B?MjlZai9NeXpEbit6dEhjc21nc3ZjMW9zQ2Q1LzQrckNLYi85bnFZemFCQXlB?=
 =?utf-8?B?QzcxcmxLdkpZcXJlWlhYOGl4OTAxUEVnN29qOHRpM2tERVdjeUxuY3k4NEFD?=
 =?utf-8?B?enZSb1pHMzNjeDgyMERXZzVuRmNubWlqQlYzTXdRY0tib093NUVkYW1zRmVW?=
 =?utf-8?B?b1poZ1U1YTU4ZzZvNHNqcGlJZTQ5R3k0dEtRWmRhRWxaREFoeGIwQlV3dW1T?=
 =?utf-8?B?RDdQcjNRRkRXSm1ySHMwS1g4eDFqeVF6RE5seml4ZE5YcEtpUmN3eWFkYW9Y?=
 =?utf-8?B?YmM2SHhkZFd6Ukk5YVg5NkN1NTRtWGp4TVZtbmxaUkFhRk9NSk5oTnl1cDdE?=
 =?utf-8?B?b2hqcWJHRlFrQjBYaS80U2duNUJ0ekYzM3l3NVVCRksxVWUxTzVtUjlDREZM?=
 =?utf-8?B?VXNuOHRxMDNycWxnTWcrSm4vZHJiSDV0QStUNzQwZmd1eXd3YVZ4Q2J5a2pI?=
 =?utf-8?B?aHN2YlpNdEJaekUwbjBlallFVkZ6dWtMKyt4OS9aZis1Zm15VnIwLzAvS3Yy?=
 =?utf-8?B?RmhCaTJTdkFhUXNGUnRDTzJLVHJQdTFSZnZIczQ3OGFtSml1eUVkK1FvcFJk?=
 =?utf-8?B?RVBFSG1xczV0ek1aTnRWVjV1VncwSVJydWhwendQd2pmcHRUdHhyVHFJdUhp?=
 =?utf-8?B?Z1VwY09MTDBxaUo2dGVpNlllMEVnbmozaFZUUWJhWnBUNm1IZmxtV3BNVkx6?=
 =?utf-8?B?RklVNXpQNkptNVhrNG1KdjAvOXpsYUl5bzJaZmlPQjZEY1lQUk9tOU5HS3VK?=
 =?utf-8?Q?GWOJfkidQHdHaYhCFhUXh/NhrTh8twAfcRN2Su8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d5633c3-be33-4bd4-f396-08d981c29e84
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:25:13.5895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QvoU9e7UYvRz+yatFRKj8IZ++nTW4OUK49K2Hr6bD4uSdRsL8ak+ojQLYY8Js2BnF2IahWO/7xIJbLlt9szJQazhYxvloJni4UVV18VQFjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1241
X-Proofpoint-GUID: OuFtKv2A1IjKnLHe06Go3Lvr3-QwK1zW
X-Proofpoint-ORIG-GUID: 4HBc6rnZLf_m-LeXA16q4pq4UbokCO3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_06,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109270097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 14:25:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93149


On 2021-09-26 4:23 p.m., akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 9/21/21 1:08 PM, Sakib Sajal wrote:
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>
>> ---
>>   ...-of-bands-in-reading-tga-header-file.patch | 33 -------------------
>>   .../gd/{gd_2.3.2.bb => gd_2.3.3.bb}           |  7 ++--
>>   2 files changed, 3 insertions(+), 37 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
>>   rename meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb} (84%)
>>
>> diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
>> deleted file mode 100644
>> index 649b9b744..000000000
>> --- a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
>> -From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
>> -Date: Mon, 19 Jul 2021 10:07:13 +0430
>> -Subject: [PATCH] fix read out-of-bands in reading tga header file
>> -
>> -CVE: CVE-2021-38115
>> -Upstream-Status: Backport [8b111b2b4a4842179be66db68d84dda91a246032]
>> -
>> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ----
>> - src/gd_tga.c | 6 +++++-
>> - 1 file changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/src/gd_tga.c b/src/gd_tga.c
>> -index cae9428..286febb 100644
>> ---- a/src/gd_tga.c
>> -+++ b/src/gd_tga.c
>> -@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
>> -                     return -1;
>> -             }
>> -
>> --            gdGetBuf(tga->ident, tga->identsize, ctx);
>> -+
>> -+            if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
>> -+                    gd_error("fail to read header ident");
>> -+                    return -1;
>> -+            }
>> -     }
>> -
>> -     return 1;
>> ---
>> -2.25.1
>> -
>> diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
>> similarity index 84%
>> rename from meta-oe/recipes-support/gd/gd_2.3.2.bb
>> rename to meta-oe/recipes-support/gd/gd_2.3.3.bb
>> index 557b45dc4..e129dc5a9 100644
>> --- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
>> +++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
>> @@ -9,15 +9,14 @@ HOMEPAGE = "http://libgd.github.io/"
>>
>>   SECTION = "libs"
>>   LICENSE = "GD"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"
> Why did the LIC_FILES_CHKSUM change?
It was prompted by bitbake when i was testing the newer version.
>
>>   DEPENDS = "freetype libpng jpeg zlib tiff"
>>
>> -SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
>> -           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
>> +SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1\
>>             "
> Why was the patch dropped? no mention in the commit message.
the patch is included in the newer version
>
> -armin
>> -SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
>> +SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
>>
>>   S = "${WORKDIR}/git"
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93038): https://lists.openembedded.org/g/openembedded-devel/message/93038
>> Mute This Topic: https://lists.openembedded.org/mt/85774777/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

