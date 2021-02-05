Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web10.8373.1612533771902217079
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mmYFfoA0;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLf7Qzubu6fFMySlwsLn9c0710ObSi+ZE84pGvfvTa51D4a27a3wzz4Pb2fqEFXwnUFQAYQidXPiLQvDBHX3G4B8xnDHF8lJtFqRay7S+Jj0/EQFwwtK5uLU7a9souzCPhWh8xQIX5h7d3xtzecjfgIbK+EwCGAzF4SPhNC2LcV8L3WsopD2pY3jJZ8ojr5r7Ie081XoQI9Z78x7+RaHDPd1SqVg0ZJe/PQBBNiPJOU5+sDd1CmJs8H8WKiozsFWjI/zkm/C282lPAyatX9cKr9ooM0EjQGp+wft7aXr4TFm7GfZ8UhPZwk5Qvx3Otk040BwP16JtQR9gPWY7kfwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nocMTjr9WvMpAzRtzb2Bk8dlvD/w74d8h+Iogr7VGSQ=;
 b=HfBOjWHZBOiZUEDA65syUhTDrGm0zmj5EyMZcez3hP8xqh+dRLaHMK80285KjzLeqmrduVl+P9gWK3gmcAa2KHljSuCvvOdq6eE7JHny6wJEKxJvEW3U/k7aJ9HhnggzHa7B6/CANlnFFNjbjM96EcOowaYLyb6XRt6FRa3/iSFSsN8DTo9Llddu915J8MPM43TDSkMIsyrc/EQ57Y8ajr/UBdQ2tnq8Pp5oTwt30Zkub3xye5L1oZzz+R0vQpcTX+rTun783fmkjQLXXVdefyqlYX03ASb0FO4Fmfmu4G/TWyQ67vG3CVfN9Lc8kMglbnL0krrSy4fywwMXk+qYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nocMTjr9WvMpAzRtzb2Bk8dlvD/w74d8h+Iogr7VGSQ=;
 b=mmYFfoA03fikuRKgpqbYxvEi4VN2BnsugRuLrlG675KbZQcSA67Zupz5HU1qj74yK3/NrmqA0bp+Bk3j3mko45MM1Fs5Q9BOTws2LHse8U4Bi0wFSd1kO+5wIAPfhLx2grsMqyjgDZl60pP8N6kMJSJ9KsH6dGZCIbv3AhYxYa4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:02:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:02:50 +0000
Subject: Re: [PATCH] [oe] [meta-python] [PATCH] python3-pytz: upgrade 2020.1 -> 2021.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1612323504-5557-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7a0a4c7f-28bd-e364-d4ea-02bc2dc0fb21@windriver.com>
Date: Fri, 5 Feb 2021 09:02:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <1612323504-5557-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:23a::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:23a::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 14:02:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f04b02b-14a9-4dfb-1ef1-08d8c9deb96b
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389403CB825ECDF36808A64E9FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ah0zheODIyFp9NqwBfvA2uHPWTD4+xMJX1Xa8vXUC6NF0aFp443ddpNRG7PPz9KCVvxTB2HZhJQuytUHx/9AK7Dr4/dTCknkO+HtpvXLPjGVWTSzuGYIeD8tGM1BnWfBM9sQUnhOABbwUHlplRLTdRu/mhogoZbXWLwIQbvOlSnfqe7cJw1CSGNaLdWQWC8T/qy/XOU+NmjY9xeqsU3TYSdYgJDI4wEwHmL98x4J7/MJvpesoWqVumZfsfex3icuCHtYlyFCDP6ZgOTDMULlFZN0RIB7J4I4b3ZqyfQQOS29PFJ/IHE62Jwt2+mq/IlyKIwdGyqIg8vJxWeVBcNvg7Fbtx+40pmUgKNeEXNQaCuGcUI+b0pbeas/1pRFvHsUlgMeCEOPTrN4JCGRx6J6xu5/3YPRCW6xvuDjrCO6CY9I2B7oRjN58UExmmRYaAoc4IVsnPKUDds/VIWISn44Yw5VV0A33dn0SeuDcJwLf4UzFRBtOiIuMaQ4uC+iVFKciO8TVdDFb+hz7vH/V6EAn9T5W6Gfq2vXMrW3WDVwXPXJCgviXEQSltPSKpWQo/q3qrxL/FmWWAhiPfbF2Ds4nV/VM+O91bF7c3dMV7Nv+UBADXP09gPxXv89UBu6C4jPDtbbiKb3Hh4G7QumMXPKx40gj++OOroXrB9xh/TUvQ8m4o6GQtuVYQcV9H3S0F6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V1lNZm5wQ2IrNGxGZFF2WTdjdGQ5NkkzYWV4WVNTRXMyVkdoMnE4c1VLZVBv?=
 =?utf-8?B?cWUwREFYVHV1a3hZeVJGMFBFVVZ4MlM2TWhRMGJhZ29KZ1BhVTZpSVFkb2FG?=
 =?utf-8?B?eHl4bFFsQm1KalpKR2ZJY0JUQUthSUZBZE9MTUlKa0ZSWnFkL0NSWlZXUGND?=
 =?utf-8?B?TDRFcGFqUGFqeGpoYVdZODM0ZFJpdnE5M3JSWFNYeWZlbHg2WTVuRWtMaXF2?=
 =?utf-8?B?VThzQXRIMHNMS3RFOHh2NVJpYVFQVGFzcUJzM0UvNjRsdmZ3dTRWS0N0V3do?=
 =?utf-8?B?YnZKZWJObk5XMy9xR1M1WDRpMkcrL3V4UnNxZDBoQlM0ajFDaFpBYks4UXpJ?=
 =?utf-8?B?NDVIY1lJNjQ3ay81aG5TbktyL3Vzcmh0OHE3aGJzcTlvSmRhOGJ0V3dSd3VQ?=
 =?utf-8?B?a3ZqL2RaUHpNYWNzaEpHQmNvQnlwSStOcytjbmZGcnNub3pQYlBFa0g5VUt4?=
 =?utf-8?B?VGdGbzdyYS9MUEpiVzFsanJQc0h2RC9wT2dxaW9EaUZCSDZzaW1taUxhSGZ6?=
 =?utf-8?B?a0R2Z2FxTXV4RldEVFZHOHpBdDhkZUFqUDhtVlljK0wxd2x6cEZwMmJ3S25L?=
 =?utf-8?B?TlNmMXZTbDB2cm1XbE1RbmZUL1liaElyQVZJaHJHQWl2ZlMxZWl4WlV3RHFq?=
 =?utf-8?B?VlVZSnAxZUJZUmJNTW5ZT0xXYU5mMGNtMnB0eTZlOVNqSHo4RUpaLzFYQkRG?=
 =?utf-8?B?ZmxGWWFJNVlMSTJSUklJc2F5TWthbE9NN0UwNEVEMlRONmRXN0lpbzExWERn?=
 =?utf-8?B?b3dWd3VVbW16bjFyb3VrbVZkemhPMEVDWkVLelJORjhjaDY1STlCbThvUlNp?=
 =?utf-8?B?NmpMQ0tBZkIzS0FhMGppU01TYjNDcy9Xc3poMy9xcVlkWG9LR1JBM2llcCtE?=
 =?utf-8?B?dzcvSEJVQnNHR1JSWW4xZkhmcy81VFV1OTBvN0dNZFdYTlBaRFJUL3FUTVN3?=
 =?utf-8?B?cWZNWnBrcUtQbzh2SVM3ZENXNS9sckNMV1BkcTFOdlYyYUFBQ29NNWR0encw?=
 =?utf-8?B?UmtSK1Jhd1lod21aN0JNakZMZDlJUWJVblAxZnNGT0RDVktXK05ieXA0cDBR?=
 =?utf-8?B?VlhjVWJvSTMvTS9OeForb0tja3VuUWF0d0dhMG9HTVBRK1diWmlpQlZFUUUz?=
 =?utf-8?B?Wjl2QzlWZ2t4QnhuWks2d2djclhjOCt3a1JwY2oyekl4QUlkK2FUcGw3ZEFo?=
 =?utf-8?B?RU0zN0FhbFp1M2NnV1hGdkRDN3VTemU4bTdFRFZxME5GbDZnYzZEQ3JQc2pF?=
 =?utf-8?B?a0M1SWpTMjBJbnAybG8yMVBPdSs2RlQ2QUl6dTFRYTZNQVYrUXo5UlFOVytD?=
 =?utf-8?B?cU9nRHhjUm1LZEoyN1A1T2xFWksyQzZFbjFLb2hPamVkM0FUSUNZMXlneWRX?=
 =?utf-8?B?MndocEdPK2ViakRTcHQ0b0pEdk1ZajIxbEtDQ3N5RCtZdDFMSis4enFFNWFs?=
 =?utf-8?B?UjRDT2prMEJYMTJkSXJVbU9CMjZpSHNJVkMyNWtZMlJJVTVRclllMlFQSld0?=
 =?utf-8?B?aWNpeDloUjNLNVliR2FSWEgzNlM3SzRwVFdGbWhqeldNOEkzb3VFdFB5MVBj?=
 =?utf-8?B?Wkk2NldhWjE2eCt0ZTNkM2pmbVAxWXB4dHJpMkFvVTlsL3k0cC80Rzl6KzRP?=
 =?utf-8?B?cWt0MGhqU2FnR3gwYldUalhYbEQwWVk1REZsUDErSitQWW5USStvWFBrcXc2?=
 =?utf-8?B?MlNialFTRFM2WVo3UlJGM3FNQzljb1pnbmR6Wlh3VHoxckNQTUt4VitBV3dq?=
 =?utf-8?Q?GU6KGOUXlV2Kt11kpnFoGCD8vUTQy294Vq0l+As?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f04b02b-14a9-4dfb-1ef1-08d8c9deb96b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:02:50.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRti+s6XE+83HsvNsdypW3s3QC/qRZWGRi0QAtu3RbvAOqhh2qDvPrMXvZ1+tKueREBbXYdOj/+ajEmzACQx6TWfIInCbwP/4lKGcLcHRQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------8A4F1D7C02F8D51A92EB8DAF"
Content-Language: en-US

--------------8A4F1D7C02F8D51A92EB8DAF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 10:38 p.m., zangrc wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pytz_2020.1.bb => python3-pytz_2021.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytz_2020.1.bb => python3-pytz_2021.1.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb b/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
> rename to meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
> index 198626311..cc4dfecfa 100644
> --- a/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
>
>   inherit pypi setuptools3 ptest
>
> -SRC_URI[md5sum] = "0349106ac02f2bfe565dd6d5594e3a15"
> -SRC_URI[sha256sum] = "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048"
> +SRC_URI[md5sum] = "8c849bdf95414fe708a84473e42d4406"
> +SRC_URI[sha256sum] = "83a4a90894bf38e243cf052c8b58f381bfe9a7a483f6a9cab140bc7f702ac4da"
>
>   RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-datetime \
> --
> 2.25.1
>
>
>
>
> 
>

--------------8A4F1D7C02F8D51A92EB8DAF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 10:38 p.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1612323504-5557-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1612323504-5557-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pytz_2020.1.bb =&gt; python3-pytz_2021.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2020.1.bb =&gt; python3-pytz_2021.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb b/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
index 198626311..cc4dfecfa 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999">&quot;file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999&quot;</a>

 inherit pypi setuptools3 ptest

-SRC_URI[md5sum] = &quot;0349106ac02f2bfe565dd6d5594e3a15&quot;
-SRC_URI[sha256sum] = &quot;c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048&quot;
+SRC_URI[md5sum] = &quot;8c849bdf95414fe708a84473e42d4406&quot;
+SRC_URI[sha256sum] = &quot;83a4a90894bf38e243cf052c8b58f381bfe9a7a483f6a9cab140bc7f702ac4da&quot;

 RDEPENDS_${PN}_class-target += &quot;\
     ${PYTHON_PN}-datetime \
--
2.25.1



</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8A4F1D7C02F8D51A92EB8DAF--
