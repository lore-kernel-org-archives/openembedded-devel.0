Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6853.1630589296541735058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 06:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MXsEjimg;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4879085da6=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 182D9JfQ002236
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Sep 2021 06:28:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sZ+yKD1HSNOOF+LD9L0Ylyw/t9porVdgZmtpOKUqpBY=;
 b=MXsEjimgb8SHiMCeqMTGpe0d0R47aMjDtjT4rAMpoEj1fjnfubwPjbx7fVDBYnOQzOdW
 HRv0eYyioNnNNKpSX+aeY+pcO72mnuRQblx0gjfss6H3z9rpoBe7C2jCikMeEw4YJCC9
 MCu+cJ+A1E8HJyYScTjQh9TqcBMSDyAmsTcOnRiWYRv5MkUWSkJ765dmi/99TpMnB7Ow
 ndEDI4YmHscNC1CFmBJFJLD0AfPmMEKQTNiHfGwxQYJMm+wRiHxRzTwmi/EZX1dxUlkU
 zvJcoBdHO3SL2uQTePp+CGbzH6G47m5o9Wp7EljPuS1mfXaapz0+G56gfQ2fRy0GT56C Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx6rnty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 06:28:15 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 182DSFEO009630
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Sep 2021 06:28:15 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx6rntv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Sep 2021 06:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/acnrsjRyiGro9JM+pOT53mkbNQsEoA5HzlJJUUG+L0auGPfmJt8YiBhdZeCRwObO0kSr9fbSx/34Zu74Und822+qMHGPvmDpHHpVk4jtri+8rjme4rjWpnFUzvH1V88A7K4nGJXsslnyHwLFqflSKZ4cmgGnupwdE7bQnQ+hvGELUgVeDlH09y4JLkbAD8ebIQJWPNf2KmAZ2QE9DbOU9fYo2QWZ80K9c0wjNWKRtj3iHGughkShwUPGYgvCR9b6gXDy1fjdPiNDQ+xtTz+GX2t5eriplLbV7CkLS4Ir10cASpFTUAljkaUyHSK6hi2FyggHyKAyEOxUDxy5izKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ+yKD1HSNOOF+LD9L0Ylyw/t9porVdgZmtpOKUqpBY=;
 b=eCUXouEQUBMwPx708EppXEvemKAeam+oN9CFlNm+a4XgC72JM7nBePjdtgYUBgtOL/UaEKJmD21ht0n4U6VtaXzvkQEInMTmFA7Y8QnxBUysNt7i1zfwFuX9x7g4besBHxy6me+/C/riHhXDvjjfiI+YQGCle93/TaYBgq+qVUxE+YKGGMnT7bQ+jGPn05Gqc1rU1rZuIYvsempWaSm/sIrYQsMCPK3+m7jL2SYsh4e3llnQOdK/hhMsa6R5rYp9K/E7dh7qSRO+QbAyUcuXk5NGqBdIxJudCo3CpsiJgbXr/E3vtnk//V8qlIM1ad+ul1jK7iqeHu2IWaMZ4tt71A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 13:28:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 13:28:12 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-subtests: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210901120005.775345-1-trevor.gamblin@windriver.com>
 <CAMKF1src+XLKjNYQ2QWq4p1K=k-PJij3nmCupOMn8weTYEP7BA@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <37c89131-de33-5a3a-1452-4defb1c71410@windriver.com>
Date: Thu, 2 Sep 2021 09:28:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMKF1src+XLKjNYQ2QWq4p1K=k-PJij3nmCupOMn8weTYEP7BA@mail.gmail.com>
X-ClientProxiedBy: BL0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:2d::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc] (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BL0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:208:2d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Thu, 2 Sep 2021 13:28:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 060ace14-9c7c-4436-a483-08d96e158313
X-MS-TrafficTypeDiagnostic: BY5PR11MB3974:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397455AFD2A26AE768F47BA89FCE9@BY5PR11MB3974.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ok0R3zQIbAKI7rCfX85Cy6mWCuYXYwPA3g9IMgNAU3boE7kOv/rB++CC+qAmkvevsNNoJ22gJn4o3dYUsdQsWvNPQFgKDt+/Bo8Llhvoo6f1sFFu7LSS2h45ZWj6SGmqwiCigr/ak4n/b5jjXWAOi5JJiOJ7pV77YqaRZg/loN/swX6I7Zc9zhM6hAHDO2SYFuvRPXnbMxEHdsTP/NnDHbcsfVVP/HxUC1XYJtyOL8KYYJqJyhdhOh6QSHYPXjqKVoJ5yyAfy49KBWvfc1fVymT/D0KU/CUwobHIS8TbP4m4p4r+xUXQc95Vbe8gJWCpqCknvAYaa3dKg2f0YbNN3zEULf3gsnwyrB3TOlFJ61iaMyMnG/Dk8OK/rQTAeRdREjhtLlRtMYQqHnJQSsUYupGFjEweT3xrQZqO50Zzt72/goO+1xIdod8Aa+hAQB5YnL+0pWxOxl6tIlqEZs2YI8kVAXokO4fJNC0y2bZTxr6Hkld8+Y/YVRE31e++zAPbLubRLroc/BFmvvdTnMxhX8eh+B0W3ZPs/90Xybj1IHK3gq4xNxus/o5q+GQxUjxh8dqlzm8Z8xRjOny0AuY8sCccL94ryD17USC6+uY9YxIPhO5xRoPz8vlRjgUYgAsKWfaasnpxwmAcMdqEH1FXwUa0KWG+Z4OUm7TqqmM763H6Duo2QezEXtOSzmFafmtVLL4YbuLGPLeG6eJGCKJJ4MIaqF5w0sWWcpkjuuKweDttOnwTWhIy6KFllC7AEf/EL9ByoLyJJ5UNj9vFFIWLCcrwsj0U7QyLG4czpudfAcm9HMMxIgkSVtA59vqmGMJ2Ea6fN7fl0WzwBrqFivSRWvtXS0RgRXx2P0jWv1Y0gcY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(83380400001)(8936002)(966005)(66946007)(31686004)(66476007)(36756003)(53546011)(86362001)(478600001)(66556008)(4326008)(316002)(6916009)(31696002)(6486002)(8676002)(44832011)(2616005)(2906002)(186003)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUp1dXl4V2VRUkNVbzRNTWo0VmNRMENKMWwyaytQUVgrR3lONGxDUVdZTzI1?=
 =?utf-8?B?UGlXa2l0eXBtUVlyNTk1Q0J3RGpEaXd0aGliMHJIb1VBNmkySTM4M0dISkVj?=
 =?utf-8?B?bEJHeS91cG5YRzBoUlMvTnRWUEpva0NEa0ZWZ0lxbnJVQ204YWxpbFE0dzZy?=
 =?utf-8?B?Qzl3VXBMWHdoc0dSeU9obm9XQjkva1lHa1FqbW42NktJclVpRkYxQ1FVb0Jk?=
 =?utf-8?B?dXkyd0QrS3o0aDh3U2VPQmYzVG1PeXN0dDA0RFdLdUpKVUR5b2tiTXN6N05D?=
 =?utf-8?B?Ri9Ka1M2aFdTZ3YyWGdIbGtic3p6Nk5NcktiRjVQR3R1dFVSWkhYVXN4bjVN?=
 =?utf-8?B?VXg4R1hVYjVTQ2Y1VUw1em5UMkcvOEZHY01kNmt2RVl6RDRMSTJlTmt3QlRM?=
 =?utf-8?B?VW5zV09JZDNpQlhESE1MKzhsdU5BL09zUnJuVGNxT1RkdUdnSnUwY0tQVysz?=
 =?utf-8?B?bklncjdDSnZ0Z05tbVdTVEp2b25rOXMyVGs0cDhWbitHVlI5T3JzYmpyS0JG?=
 =?utf-8?B?dXhKZlQwTktkWDFvdVBDL1NqZVEyNkJTK2VqYlhWL2VnYlVHUzZ3ZDhVM3pq?=
 =?utf-8?B?a2wvWkVObGhsRnRiZTF2dUpMNko0V3B4WmZFeWgxU3hsR0ZwQTZnSU0yTDRT?=
 =?utf-8?B?ckl5YlFuaWxVMnlUbm9IY2xDeExpbUY3enRiWHUwcm44aDZDTU9ER0YrTEs4?=
 =?utf-8?B?WFd1WmRuWURaaTRmV0pEb0xlREZwT1ovRmRTMCtOcTA0RnNZTU56b0NTRGd0?=
 =?utf-8?B?dGdYU3F1WUZRQnpydFJYR3F3TzhUL1Z4ZW1wM2lPU2s1Vmg2OVg3Vjh0anFs?=
 =?utf-8?B?RHZoajRBUHFMMTM1a2Jab0VkdFJzSmJLMElaME1sSTl3bEtwcDBWamZoemhM?=
 =?utf-8?B?K09kcEhtUkJENWV2d0I1RGxKd1hXYnljVllzWXBtTDF4TXpVaWxwQnRGZEt6?=
 =?utf-8?B?TUtXTnNHMXE4N2tTWTV0cmw0ZXdsWVhHNy80YW1aLzk4b0srVkYrc0dvRlp6?=
 =?utf-8?B?OXlBd0xpRnpVN05qRU1ZUU1BOXVwVS9BbnJ4bXJpUWhZQ1dzTFlnL3NrYzhQ?=
 =?utf-8?B?Ly9kUjYwdXJ0N29ON3J0SWhRYlMrWS9TbW5yNnhpeENIK2FxRk1JOXFVRUFU?=
 =?utf-8?B?UUxDbXZlWkpOZUsvNXczd0wwT3JQK0haWDBRcUZrYkpHSjNXTlE1MEkwR1Mv?=
 =?utf-8?B?ZW9YekRIODZIUkpPb244czY1SlE0TVlucXM2aUNCY2lrZjdmU1gyWTZrR1RE?=
 =?utf-8?B?SHk2Y2w3WE5VRThteFVnOUQ4RHZJZGlhVVl0YWpDUU5nMUhFTEU0c01heGRM?=
 =?utf-8?B?ZEgramhVRmdwa2dta2IwQ2NUZmFnS2ZTZkM4Z0x4WTB0RkRjZHd5YUd3dEV1?=
 =?utf-8?B?K3E1WEhYcWppSEgwZ2xnVkNwNzFtRHc5dEpVN2h1VXorTG52b29xV1VGbm5I?=
 =?utf-8?B?SzBGQ3lmT3ZmUE8xQzBiYmVObWR2ZFc1dTdWMFVQc3luRHZ0b2VLMldxa1JJ?=
 =?utf-8?B?dmJJVFNSbnRYOTVONnZYWGducXRGbUxPYXdkTTRiOGJjQTNoa2w5NUFydkJq?=
 =?utf-8?B?NTA0ZnVzU283U0g3YWkwUi85eTFSSW51NUVLcFFCd01aeTA4TklaSG9oSy8v?=
 =?utf-8?B?VU1aK1p6T25XUTlqOVYvajRuRTV6eklBOVMxZVovR0Y2WVhiQmJSZHhuVVNQ?=
 =?utf-8?B?Snc4UHByamprVHlwcHNGaDh3azR2QWtGY3dDa0w2YWZjNE5lb2N6czlOeXRw?=
 =?utf-8?B?cENzNi9GeEdyR0ZqYU9JcDFOTmtxUGlZMXZrQVFvYVZBazRSRkpRQ2dCQTBO?=
 =?utf-8?B?Rm5paVNuZDd0Z2Qwa09idk5lOVEzcXcrZ3l1U3dvQ1IvTExhUmY4bG1tZDkr?=
 =?utf-8?Q?VZLzYRqPDybeX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060ace14-9c7c-4436-a483-08d96e158313
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 13:28:12.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muPSfA2p8sx2Qk5IeauOVqK8FURKSA5xfj3RKgWPYm+sBDK8BSCzOTtW+EylGWWeUvtBxoWtuHXY/qtEFi+z4KATkicLeGD+cYtG50wrv/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
X-Proofpoint-ORIG-GUID: 30k50ynPxqZNelpFvl-hc2vT_pZ9Y_-E
X-Proofpoint-GUID: EADdcdcHNaRoBqRCT88B-TTdIb9J01Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=951 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020082
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-09-02 3:39 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> it failed with sha256 checksums errors in fetcher which I fixed and
> then it failed again in compile with
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1499
>
> also you forgot to add it to test package group.
Right, my pipeline caught this too. Fixing...
>
>
> On Wed, Sep 1, 2021 at 5:00 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> Newer versions of python3-cryptography will rely on the subtests fixture
>> for their ptests. Add this recipe so that cryptography can be given the
>> necessary RDEPENDS when it is upgraded.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../python/python3-pytest-subtests_0.5.0.bb        | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
>> new file mode 100644
>> index 000000000..c2bf47203
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
>> @@ -0,0 +1,14 @@
>> +DESCRIPTION = "unittest subTest() support and subtests fixture."
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
>> +
>> +SRC_URI[sha256sum] = "c62d68a84f94f8bc49bbb01b39392953e26a52570ad380581a3b2cc8d7eaa037"
>> +
>> +inherit pypi setuptools3
>> +
>> +RDEPENDS:${PN} += " \
>> +    ${PYTHON_PN}-pytest \
>> +"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.31.1
>>
>>
>> 
>>
