Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4706C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 13:50:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36466.1634565038374461458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cw0FKC4t;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=592552de1e=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IDKQmZ024199
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:50:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=JfbnG9n25L3GSOMZgcpHSDdFoQdRCJDNlGOnpLyCaMU=;
 b=cw0FKC4tDDfCBIjvVM76+T7qTP/5l88IgPOOtKAxSfcxKwP2vhif1yr+qtD5pOlAUWQY
 ouFrIS+Si6aUYCXyh8M8Z+lg7WVhliA62Wc3d0D9HhYXsOqKos0b2NgDRgoO9CrKr1um
 zh62HQ93wzY1WUb3lwRx44St+DnIpTiz1bNVBAZfbE3HTj42DKJfIquoftslYtbNG6iZ
 sXzTupPhPZiv5XErTfD6ozbhA8IRo0bgSUozv0x1gmH5Cj8aUIEzOmpDhgYv5Cq5FIRm
 qq8CuHT8lzvDsBPV1eghnifnSonx1dvrjO3JP5Y19ljZ4Of3ISM0tUtWU1jBXMQf2oM0 wg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3brn13gn7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:50:37 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19IDob2e028391
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:50:37 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3brn13gn7e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Oct 2021 06:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLeg/ro+Rn+7wSxsoi3SLVHmDWnCMTgaDZwZmefHS8YtEYnicH061vD3vvCmHHIImuWjpkR11fALGvjAdOfW68/3jkl+U7Mi4Cp+lqZOVX69HG32+zPxP6rZum6wDMVuoNW3QcTcY2ZS2zw910wCqHkEEmuayf1tfFlDmm2DfHQUOc+3bfUEWP2qtdBOW+fiuNBPzlKd1anm8Mc1gJiZ//fTQqoKvcjvMFIW3V29ZRhaQ9jPvxCK+9mBbfcjLy4ZXCx+0Ei8IQffwzhOAkrJRGHpMs/hJO/6uW+8gtwfByDejfibV1H0I3/STyNC+NLvCG0srlfO7FeAz/U6NEbLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfbnG9n25L3GSOMZgcpHSDdFoQdRCJDNlGOnpLyCaMU=;
 b=O1CMbL0fFoEwCkXRqw4sKvMLYOCPpXxdXzEMKh9E9Y23HduI2IXEqkp6CyE99gZ72k0iaAHAJYbTwniMkBoU/dYXKuyF26FgLz9Yt5rMI6e4U46RySWxUjyBFsEnyUHscmbu1IK9WdW94GiaTHlWbx2+GYTD9ZLcjFo/X8N/lpGYYPSv0OpJRy+Bm2ZLWATSBSNLK+vEIIijdKo0ImGhhKvPfDSFziomJpOTE4cL2UsjXzq0M7QKTAEdeMWHfbTa8OUt4wmaHPmbOA0b561ViCNRBHc/h0EOm/+k7ozNYBmMWF7f/1FeaMy5yM1tzb3F8d9eFLH6O1JrHtykLDIurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: oleksandr-kravchuk.com; dkim=none (message not signed)
 header.d=none;oleksandr-kravchuk.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 13:50:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 13:50:21 +0000
Content-Type: multipart/alternative;
 boundary="------------uJXX0QYDVqKZn1mtm0pGoWy0"
Message-ID: <f397ae61-1328-efae-9500-21c4b6ab7eee@windriver.com>
Date: Mon, 18 Oct 2021 09:50:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [oe] [PATCH v2][meta-python] python3-pyroute2: update to 0.6.5
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
        openembedded-devel@lists.openembedded.org
References: <20211016133327.3781109-1-open.source@oleksandr-kravchuk.com>
Cc: Khem Raj <raj.khem@gmail.com>,
        "timothy.t.orling@intel.com" <timothy.t.orling@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
In-Reply-To: <20211016133327.3781109-1-open.source@oleksandr-kravchuk.com>
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from [IPV6:2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc]
 (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by
 YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Mon, 18 Oct 2021 13:50:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5170a0-619a-46f3-9cdc-08d9923e3a6d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4960:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-Microsoft-Antispam-PRVS: 
 <SJ0PR11MB49603EE24BAF7EC0078BF3F59FBC9@SJ0PR11MB4960.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 sxjUl9j8FnkhD8v2pfUfFyUPLho9bAmg/12qeVZP7az0hr6t8cuk6WlkEn9NQsbgHpB1cQIUEzqnYSpjDSMFr8/karfr4X5VBzkffGuJDR4srvqfGOcWoDW6Ba9ucAbZx+25QmN8at+3gMCt7/fDS5xMsoMFccmEH4pkNAhj0o/bLoPAaazcKK/dknpmaqKfseIE2hlNajJR9D2WuEmt+mD6i6b8oTA+QBPyfU4cYK96+89TkgWbbDvQsw/GWp4icQhU7tXrnRSv2Ba7Kn4C6WrvY9kPrWYtA9g6EVWKb/xMjoVs0JmqXuPvrelNCm66UW4HE4+y+HEsiX5jR9yVlmvmrtNa8hBtaYolsHZ5sLbZPIngDcCfhO3W6Na/YVnJtRjkT/Q30F5Wt3XY+apKrWldCruRiSoBxfZHw9bVD3+vfKKWK9IlINWL7fWY3CJBi52bSchPZGdjoMHSRrfFw7Pb2gTaEXUxBsyeFiPFJIEvdqm4dK6C80NeWfnSqdCKE26Gbs6XdL0HGMOA21OTrnO6qIwqKenURF3ZKsBBZig9s3Np15J3vyHghM0rLI6P57xS3wosJlOMhuF8PZ/OlDe+0/MOqDKXXeP5j2Gl1/oJEUsTMScyDrsTGwX0MLPV/PRTSJBET/4jN0LmRTVeYnKG8RTX1CHbm9gbE8b+vh/EJ6ZyX9VINpozFTaH9QNB34NeMnhh9BQNrU4cri27FVI+4SDiGT0//ddWQDgX+R3wDFNVIsHgHHiN3Kdf8CWy/gMN2ybhbTO0QW/dN3QgoBCXcIwriqJjuBRsVslGC20vP83XcbP8fqYG9M1AGpVIidmF/L25yNoWW+2/NFaR3CRr2aKsrOtrNiGQSoy3Ihg=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(33964004)(2906002)(5660300002)(54906003)(36756003)(6486002)(4001150100001)(316002)(31696002)(508600001)(86362001)(66556008)(66476007)(66946007)(83380400001)(2616005)(186003)(4326008)(8936002)(966005)(8676002)(15650500001)(38100700002)(166002)(31686004)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?d2xMSmI0c1doS1VCWFBJdTB5M0RqQ0tBODZGMHJyYmx1SXV1Sy9lZ2NFK3pT?=
 =?utf-8?B?L25wZmd6bVN2blFPU1E4WUIreEFUR0h5VmhtTlV0bW1ZTUJhbDVFK1ZKUXZt?=
 =?utf-8?B?aXIzb21WenY2ZENRNmNqQVd2L0JLT0N6cFlQQ2tkbk1KNDE2WEcvbnFQN0g4?=
 =?utf-8?B?YmtWVThYSHBrNzh2UTJQWG1NZjkrUlZoSVFLQXJIWWxmaGVVYjVYaW0rSGJw?=
 =?utf-8?B?YmNkUWo1ZjVZamIyZTN6cy9QeXdDME5hNHBvQzFjL1dIWjQzTHZGaG9INTRh?=
 =?utf-8?B?aFc3bitjemx2aVppdmRrbkhIcnBjTVdPN1IyeXpwMk11ZmxiNE1lRkU2b0Iw?=
 =?utf-8?B?QVN6cWlGdXBZa0dvOFNCS2pTRnVHUGExM0hneHJERkFOUjZPMHlLdXYrMnlY?=
 =?utf-8?B?WGdsc2cwUUFOYmFnYWkyeVBrVnlYV3Z3U1dEN1BzT2NITzdscXpIdnUxSlNs?=
 =?utf-8?B?eVpzSTdyY1NVNVF4Rm5CSm95UThJZk40N1RmZDdObno3NExOMXVCcXlad3oz?=
 =?utf-8?B?VXZTdnhpQjRCWmpjWkl5VW1LQ0xJQ0dFcXZ2N3VadzNxR0VJR0FCVFNZSStE?=
 =?utf-8?B?am1SQWl4TGlQNVZ4cFRFSWlyQU5zZjhhemdwbU1qbGUxOFpFNEdpdklyUDdO?=
 =?utf-8?B?aG96QWlYSEdjRXhWR3VYQi81RVJHM1UzcTNZN3RLOGpMdi9lb1ExelBNV2Yx?=
 =?utf-8?B?cWViYlA1SHBuck02NWZqQldQcTBRd0oyUEZvVkY1RS9vaG90UGlpc0ZYRE8y?=
 =?utf-8?B?bzBlbWJtYlB4UWJWY3Q2THBHQTR1Um15WkNaeE1RVVhtazh1MGlFVUttYjl6?=
 =?utf-8?B?UGhnWjJGbHp4Ykg3VUcwTEZoOFFSSUFtT05WSUtJMWt3b2ViTUp6ajE0WmR3?=
 =?utf-8?B?clEzb2NWenZ4MGVqMENUaUhoai9qSFJ6UlhlR2hsTDhHTk5qbFI5SjVqcE1V?=
 =?utf-8?B?dFFCSEp6UTVoZ0x6UFpPWmNYcEl0aXp5dGJnQThMWmJCNHpvSUphSHMzdWdt?=
 =?utf-8?B?NEYvWTdCM21zNFRNTFRoZ2lROG9rWTBPaW5HaWFndjhtcm1NL2Y3VmxmMUNw?=
 =?utf-8?B?VnNIYVRVY3RZQUxTTE5Yd3RVYWUxZzdZY3JlT3kvTjd0QXhZSDl4d2orditw?=
 =?utf-8?B?VytoZTBTM1FEUVhkSEZ1SVpBdGw2V0F0a3VZRzhKUmxHNHppdFVPdGhEb2Jm?=
 =?utf-8?B?elBtTXZkWHZ1UGhseU9xNERva2toL3VCNTBjaGNxWjlxSGlvbjlmbGlEQVN5?=
 =?utf-8?B?VVZQWlZ3NXFqQis0Y0t6SEVwZkVkRzc2ZGtKQi9pT0dib2RuK00yUUF5MS9X?=
 =?utf-8?B?U0taSHA3cHhxUk5qamI4NUs2S2tkaEpCMi85ZXNiaGlFbGJoL1Z6OW5nRUpT?=
 =?utf-8?B?bHU4d2U5TENucS9BU0VVNHdiUzltWC8zY25UR0NkK1FYSEhWaWVuWC9MNFg0?=
 =?utf-8?B?U1NqTXZDaEtudlljc3Mxd1I2OUdqYmNlQTVNNEtPaWlsVm0zQzBPUnF3d21W?=
 =?utf-8?B?SW5HdllHL1ErNWNBUFJMOGtWS0FQSTNkR280R2RUUXduSmxJaWl2S0xRNWFM?=
 =?utf-8?B?R1g3ZnNnQnV1ZmJYbE93T3lOOUdHbEFWbmdaaXdHRTBtWUhVTkNBb0VKTjQz?=
 =?utf-8?B?Zk1FZHJieTZycDkycEpWL2UwN2V6VklTSWxLUnV5eVd2TXl0OTlhRVM4aWx2?=
 =?utf-8?B?YVJyVmEzRnBSTTYzUE1zRFRWYWxXajZmSjErUXU0RjNxUTRIdVkxSFRRWnVW?=
 =?utf-8?B?WkEvZkNCNjBqUFRlUWZpbHdXQXJ0bzlrZ3AxV1hwYVB2NEc4L1JnZXBXOTh5?=
 =?utf-8?B?UzN0aHpNa3RhTGRWbEh0c1NlSDF6bUF5UjMveWJYRlBHVFVSYlpEanRxT2pV?=
 =?utf-8?Q?lStGhCQsPxXWo?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b5170a0-619a-46f3-9cdc-08d9923e3a6d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:50:21.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +7y9s3D6XFgDG8fDwj+YY60Tlus8Z5fnUr0wT57hg+FbsXhR7cuKYafgRqwjr8K+1FZI9P64YYKR3Wu5ICOmsDYGvd4pTylc4wvs/xM1qWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-Proofpoint-ORIG-GUID: PpN0-Crtv_aGYL_zP53_OrZRoh0revZ9
X-Proofpoint-GUID: zhD5hY6hB-kZgfT0vkZHOfdtUz3a7-nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_06,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110180086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 13:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93420

--------------uJXX0QYDVqKZn1mtm0pGoWy0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-10-16 09:33, Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Tests are, unfortunately, not anymore supplied with pypi package.

Let's hold off on this uprev and I'll see about modifying the recipe to 
the git fetcher, which might allow us to keep the ptests. I'm very 
hesitant about removing ptest coverage where we can get it.

- Trevor

>
> Signed-off-by: Oleksandr Kravchuk<open.source@oleksandr-kravchuk.com>
> ---
>   ...hon3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
> index a85b0929d..d69439352 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
> @@ -3,9 +3,9 @@ LICENSE = "GPLv2 & Apache-2.0"
>   LIC_FILES_CHKSUM ="file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ 
> file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
>
> -SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29"
> +SRC_URI[sha256sum] = "d0995c8aeb96c0e4eed4d62e97c9d795000a1a33b747d6dc54326665857cf11c"
>
> -inherit setuptools3 pypi ptest
> +inherit setuptools3 pypi
>
>   RDEPENDS:${PN} += " \
>       ${PYTHON_PN}-ctypes \
> @@ -29,8 +29,3 @@ RDEPENDS:${PN}-ptest += " \
>          ${PYTHON_PN}-pytest \
>          ${PYTHON_PN}-fcntl \
>   "
> -
> -do_install_ptest() {
> -       install -d ${D}${PTEST_PATH}/tests
> -       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93402):https://lists.openembedded.org/g/openembedded-devel/message/93402
> Mute This Topic:https://lists.openembedded.org/mt/86371301/3616776
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [trevor.gamblin@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------uJXX0QYDVqKZn1mtm0pGoWy0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-10-16 09:33, Oleksandr Kravchuk
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211016133327.3781109-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Tests are, unfortunately, not anymore supplied with pypi package.</pre>
    </blockquote>
    <p>Let's hold off on this uprev and I'll see about modifying the
      recipe to the git fetcher, which might allow us to keep the
      ptests. I'm very hesitant about removing ptest coverage where we
      can get it.</p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:20211016133327.3781109-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a>
---
 ...hon3-pyroute2_0.5.19.bb =&gt; python3-pyroute2_0.6.5.bb} | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.19.bb =&gt; python3-pyroute2_0.6.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
index a85b0929d..d69439352 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
@@ -3,9 +3,9 @@ LICENSE = &quot;GPLv2 &amp; Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263\file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce">&quot;file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce&quot;</a>

-SRC_URI[sha256sum] = &quot;45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29&quot;
+SRC_URI[sha256sum] = &quot;d0995c8aeb96c0e4eed4d62e97c9d795000a1a33b747d6dc54326665857cf11c&quot;

-inherit setuptools3 pypi ptest
+inherit setuptools3 pypi

 RDEPENDS:${PN} += &quot; \
     ${PYTHON_PN}-ctypes \
@@ -29,8 +29,3 @@ RDEPENDS:${PN}-ptest += &quot; \
        ${PYTHON_PN}-pytest \
        ${PYTHON_PN}-fcntl \
 &quot;
-
-do_install_ptest() {
-       install -d ${D}${PTEST_PATH}/tests
-       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#93402): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/93402">https://lists.openembedded.org/g/openembedded-devel/message/93402</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86371301/3616776">https://lists.openembedded.org/mt/86371301/3616776</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>
--------------uJXX0QYDVqKZn1mtm0pGoWy0--

