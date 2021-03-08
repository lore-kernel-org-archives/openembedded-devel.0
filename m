Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.76])
 by mx.groups.io with SMTP id smtpd.web09.36139.1615212501337481665
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bVYSnOz4;
 spf=pass (domain: windriver.com, ip: 40.107.102.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMNRzC7oTKsjoseFvEfewizDDD1f3ikR6inPWYBr+gyrFnQ6jMU1/TO8EKtSoH+r4NXuMfKmwUqMSHSKMrcoQD8eBCaWoaBnJnoHyVlRGQS5aP8UNgLlNeyETjsdUXLBHbw55EN64mdSeLQCch96WiAAkX1cnbHeLpJLOf6sqN5TG+aqygdmoV84l71sxBa0UcgxY4SmqFG2luVUAn3RMjjXDhLhUN0tqK1Sjm9d+N/Pjg7nQUZusuYvjuixKsBOhzeNZClBLAtr92iDGxby70XZaDPmYLBzWDzq8lJb21BhNz8zIn7o2EBW3/eYMvE89NTe7bW2UHIOV6KH0GjQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s481YVBmrS76BeI8GVMkbWnEe3f9uuz07mh+xt1ty54=;
 b=mRRM5GJSarpxAjgiCnv5uxiYsjHPGEJV1rDqh3xIf6Sqvseix4WA8df/9h6/DUj/9F1HYwl9JCnR64dHMqJPaI6ya4Q17x15Zwj3tT+1XYRvnZ2sz5KjXPdlUfjOdscexBqfV7baxyI1U4KTLck1qPLZeDaBhuyHP172mpCqZrS/DTrXcmxHttv2KBlGnBB3YKr0/iJ4lx1VjuPeKtqf/7QZII1JXqQkVuhmo1nlwyi6bWUEtcSFgR+AU/ntO3ZFD+qAK6myswL3B4wXfUOPnpJAbWp3o8c5eawJfsPRdYYDAZxcFqaM2eoetKYe/Bap1dIqI4wdcH8/mefgAJBECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s481YVBmrS76BeI8GVMkbWnEe3f9uuz07mh+xt1ty54=;
 b=bVYSnOz4PWf/ZqjoDi84jddp695eisBXwUJgiAsapGddzfvfj7yEZAMIw9kbFEQpjc8Cagonky/PWHPw9RGL55aZFDCJHsDZD+YFTOg5IUn8PgTtpOQzYh2j6yomhJZQrbiuFpuLuNjQR3QqqUqjRsmbiUo0XuDtzDNR0OIErao=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:08:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:08:20 +0000
Subject: Re: [oe] [meta-python][PATCH] packagegroup-meta-python: Add python3-semantic-version
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210301214507.1950660-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7bef340f-b4ac-1fdb-c3b6-61b32f233d1d@windriver.com>
Date: Mon, 8 Mar 2021 09:08:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210301214507.1950660-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR02CA0114.namprd02.prod.outlook.com
 (2603:10b6:208:35::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR02CA0114.namprd02.prod.outlook.com (2603:10b6:208:35::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:08:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5366d3d1-4d16-4ac3-8ee9-08d8e23ba008
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34464939D912C38167004FA99F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+UGszV0jynr9t0IeMvkLkr4fQdQjKtdfGsb608Z/+mDEwlkWjRvQbYkaMIeld0lLyvTsM0hBSWoQS7qG8dcVp5ccGeln4uBaRJ8+DmvfD31s3PH/O8/8+3hypxAtvuq2cKB1NxF0r6D8wpOyXQ8hb9GD6hSbu27A2d8bTXScteiOjjPIREotoV0tqAxvtm+tYyqbkp8XkGl6EE+6kuEOQnIAfKutAZQ8CtfW1mgPPcF1R7ILPAFmU00PsL9Hp1KhoTvqvLIbzG9Utkh/egnH0vgoOT+YCUE2nbMaBvBC+GM3DCbqXL1dMYn9H5jvNUHUaVa0fX73cnzTU4ehaMlolnBboYtL8CMsb8lUQcWVdRPZiUFMGOffYeXPbxnv1r6lzY4q7JF/+WQAJjs9N9fkrNb0f+THiif7aYE5UrU8O5go3U6swQNszvdksv7MrBja1sFtVnegebfJCAmb8jqeBf+arXZqxcJ6xXa7MYuTRsM0dg1pVisx6vlvJS+1OdX3B6zwMrIGGNpKE/m6an/Q0svwEIvcJvfBRhmE3R8AW8OGYOIbiuTVCyiKRUOTzpG1/rEmpfxtT0QYO5vEBMCIro2c8gSsbx5QggVBWkqCzqIrKhGseAzHcqnY8kqX3ol8cYCkUXsXJ4aEst93A/zss7zt04rNzYNBRk+Cyq6KMRFr+1L9APHtbCCxYm6OWCzo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(26005)(6486002)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dGw1dXh6R0tmVFVOeWNudVVha2ZvODRBSktDRVdyR2ZPWWtsQnptTnFaM2or?=
 =?utf-8?B?WElOUmJVN1A3dzVKcEg2M1FmMXE2TVNsOEROTU9HZ3Vwdlo5UUk0WkVWWGhY?=
 =?utf-8?B?WjhNUVhNVnEyaFgrd3FueTdWL0VOZnROZjI3YzhXNEJwNk1McXV2ZTJDTit2?=
 =?utf-8?B?b0huQXpocWhJUG54NnB6QnQvRmNEWGF2aFptSUd1Z2NJTzRrcGJGTFdMQzdF?=
 =?utf-8?B?WExnMnJWcWNDME9mY0NJa2lTTGU5V3I3TFhIMmovaXFqYktNVDJIbURBaTF3?=
 =?utf-8?B?ZUJCR3ZlaXJSWlBNMGxCYVFPYXdsN2MxbkxzZk85UXk5U05hSTRodUZsN1Bk?=
 =?utf-8?B?cVhUbzFRMGxlYXVRcnU0NFl1NzFjNVR0d2g5b3JIbEV2WUhDUVF1dklmZW5x?=
 =?utf-8?B?NnBCKzlEM1g4Q2Jtd09ONExpK3NSV3RiaXBBb2o1anhhOFhsZVFxdHRLdlFz?=
 =?utf-8?B?RDNWUlArZUNCeVB4QWZxVUY3Y2tZS3VRVUE5T3N0WVEySnhMbDJOcVRQWjNs?=
 =?utf-8?B?V0ErRUFQMkZCc2RNa2RtZTdPSGVpZlhZSmpMRFVlN3YxOEdPdVI5RVF3akJM?=
 =?utf-8?B?L2x1cHFhUzZ3VkVOUktyTG8wMktZengzd2FkM3kwN0wzU1c0b3RGM3d6OE9o?=
 =?utf-8?B?K2wyczZST3gzUkpTZW5Sck9JbXEyL004YVU2eis1TzBuTXJySmFDUGhkRDlV?=
 =?utf-8?B?MGtCYjlvcm9qd1BlVmsxNzVWWGRsY24wbXg0SUkrZUUvU3dMQlhvZGNqdkhL?=
 =?utf-8?B?eW1jOE5zcEdYU0ViSDB1eG85c1hUTkt3S2RsRm5mZllqWVZvRHdRZGJyL3Uw?=
 =?utf-8?B?Rm1ZVTRNUzhmb2VmcStsUzE2cEpidTMrenkyV3ZFaUVkS09VRVdlc1J5SVVk?=
 =?utf-8?B?bHd2MUV0WkNNZGxyamtxS0NjTXpXTzB0TTRwaFJQL2N0a0FQVzNEaDEyRDYx?=
 =?utf-8?B?ZlF0Nm1zcENvcEZkRXVWVFlRS0pqTlFmSnlNRllIWGVCSFFQN1BiM3k1VDA5?=
 =?utf-8?B?TkExQnNEY3RGQndaOXpkais2QzJyQmhoS0xjcXhCYUFPWXR6UVVVaVk1clYv?=
 =?utf-8?B?TUQ5ZTF3U3RQMHhOSW1lSXNSQ3VnV1dLSDdOUS82OXZhNkZ0eVVDK0JQN0tL?=
 =?utf-8?B?R05JbGJKU3RqWjJUUGtTdFd5ZGJZeHlydUJ5MVluZW01V0psTWF2ODRWS2My?=
 =?utf-8?B?UW04anFvNmpWMkZOcEg2TFlYaThrcVdaUm02OVM4bGNzdmxWVWtIQ0ZZRWhD?=
 =?utf-8?B?aitYckJLQmxrWVNXZURDMzUvbURyWG5nTDBOS3pHcjNjdk5CUm5YQ2RWWHFP?=
 =?utf-8?B?cS9tQWJlMkx6a2krL2pvMmFqVnhwQXFZYmp5L3djTU9kdUxMMk5Za0Jrc2VW?=
 =?utf-8?B?YzFWTkp2cUdFRC9kKzdRKzhlVWpzVXhnLzdSL2xma0k1eG12MlNMcFgvTlA0?=
 =?utf-8?B?SXdLanZ5bWV5bXBha0dmRlJnc0RGdlMwMXdlTGpwNjNQUUlLWHZDanNEeHZr?=
 =?utf-8?B?eHBsUkdHV05FSWcvRFROYVBRNnZSQ1NwaUs2WUNXRTgreG9sY1Z4TU1NV2RL?=
 =?utf-8?B?QmkwMzRvajR0MHgvcWhQNlE2OStkN2tuQmUrenlJUzlmbjlCZHp4YmZNbXFK?=
 =?utf-8?B?VXJkOFJ1RzZBem1uT3NzdVR1UlM0aTIyY3VyQUJSV09NcDQ4VnY0VXNpSHlo?=
 =?utf-8?B?RmMxQUVveVBlMjNIZVhzMGxOMXlLYU1PUzRnQmE4b1NXUzJJeDQzeWJDaGRl?=
 =?utf-8?Q?pHrTvNeQldgEm0fXKuytTOwAS8y1MkouMT2VbN3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5366d3d1-4d16-4ac3-8ee9-08d8e23ba008
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:08:19.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1EaU859yWElROk2H1QujW5Kr+VchWe9zXrzEUBivGolW8e0tWXQjmv3OdNTpchB3/4ZrMGZBWQQLaPOr+yhPLC2keYWlPts3Zt8u8h+l2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------651B203545930110A2C65A33"
Content-Language: en-US

--------------651B203545930110A2C65A33
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-01 4:45 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 635dee1942..d22656eb15 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -361,6 +361,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-scrypt \
>       python3-sdnotify \
>       python3-semver \
> +    python3-semantic-version \
>       python3-send2trash \
>       python3-sentry-sdk \
>       python3-serpent \
> --
> 2.30.1
>
>
> 
>

--------------651B203545930110A2C65A33
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-01 4:45 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210301214507.1950660-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210301214507.1950660-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee1942..d22656eb15 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -361,6 +361,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-scrypt \
     python3-sdnotify \
     python3-semver \
+    python3-semantic-version \
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------651B203545930110A2C65A33--
