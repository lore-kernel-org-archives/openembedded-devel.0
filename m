Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.72])
 by mx.groups.io with SMTP id smtpd.web09.5432.1606918171434452107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XD3aI55f;
 spf=pass (domain: windriver.com, ip: 40.107.102.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3ht0zJ9ZDtL1UKTmFJWyylQfvtsQoMt55nRcsVANgwqI1XeOe0/OHS48TY8JkXzCRH/yAfgN+58DASUKeQmK8KEGkKf3pjy6PoSTl4lQ23X78cmYGCA0Wiya4iSOwtJ8YMXwFkejFNeNaQbc/EdnDzI/8ZT0mOXwBoJ/M0qzVBzHozCCgtQLvmZmTX0CIJt58MYzp+yZFHuIQSZwSc10ROg94y/LSBjNHMMsJb6KcwpEQhPEFXlT+cmrjAcSRKnxq99Oh/3nX4oQnG1kZcxhJ0lx0MYwkj9VgIhmUriO2hP6oCA1KOnV/J3qGIm3n7j2tWr9P6qaNW79T3xL4YflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iV5Kw8W/X3FR8Wera3qsK98qmUAChlTObNM2WCi2+NU=;
 b=Xwul7Q350DPu4LsaiM+zrwVEc8vJXnNBSTKKwgESmAOOVJsDevouWyOSiVbcpSfbWUr79RNRr1jnTaoSEIFKPwsDNoWalEOIAiI1k6GSBQeOMDFm5TQVGqgbWhXyEC4kHY4I9xmUutYY8Tt2WWOyRtCgQRpFxjLvYpN4FRBdEBPrmlhl2XEAKvB33OTbbk1uhTTcEVGsYFcdqmUEFafnNpMYFfH3bvLsoQjTSPJYhfOwKyOryq2yvuJw+GaQUI+3Y/jFkfy7R5E8U1Jbl1X0YUMvX3eByDuMuh2SM5WIgrqnlLIoZWvFnerH8pjrTAq2x+2BlcCnqW7Fr1dK8evEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iV5Kw8W/X3FR8Wera3qsK98qmUAChlTObNM2WCi2+NU=;
 b=XD3aI55fshVrTFcSDoT7fWiTrElKuQENOWcLrG3SVX/tfPYyWquAW/30cl8POwRVcOd8iBHu5G548g+mQZtoa8m1OHg4L0LNG/PlKn/8P2L+y5zhyxtN1rLllXyYXGYYE1jV6Pm5UUZoojPqs2zQJKGwCfd27VoSItmBlVjGb3w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:09:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:09:28 +0000
Subject: Re: [oe] [meta-python][PATCH 03/16] python3-iniconfig: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <315b9b7c2401bee51c0d5b4d41e5f2d14bbe1738.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <96412c8b-68cf-aa52-c815-bc3949849d4b@windriver.com>
Date: Wed, 2 Dec 2020 09:09:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <315b9b7c2401bee51c0d5b4d41e5f2d14bbe1738.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:09:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c43c9fe-d3ca-40c7-0e5b-08d896cbe1ee
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48642373C771ADC4FE081B519FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	27IIkc5783sxEmVGWw92qBhKYQ7tojtZhvIak1e9W/mSoDWRunHoKURIbbHITvW6N2SG0SVcla+x74/Q5efxojT14kLSCfqxtHJq5rpPgmK3gRGwnL6Hj9sJca6H91BwpLc2BCdq485mzIiF+ST8zfKG6xAyJ/ZVUhRItg3nJg9aZK9UIryAsdBQY7a7BF65F01UFzhpOr7CmfWslRA1pxR51BkyoWDylnZ6qqRbjOdCGh3etuBChPqQpQNv6mFfGHL9tkufibxOjrXRDpFAZyDaV/C3kAIp5pFGqlx22GfH/8WHWytf8uOm9Siu/qz1NRe2s86R8GbDrSuLAusnyGwmeKyTwpMT4sDR+OTpCGaFq9/7UeLlEnB8I+KLfeHnxvVu5Gop2fLLIB+NdeMiSgKVj3hMfed8z3mtjZItkeX9QUIEXhy9lU+3tfmR1MbzIl/zNTN9Z0VlXzh4QE7XsEeREKW88vy7F62m3DbLy3JCQ8czwKh3pmsMk4brtqDU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(2906002)(2616005)(26005)(83380400001)(31696002)(16526019)(66556008)(966005)(478600001)(66946007)(31686004)(66476007)(186003)(5660300002)(8936002)(33964004)(4001150100001)(52116002)(956004)(8676002)(53546011)(16576012)(316002)(166002)(36756003)(86362001)(6486002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cG1RTGtSbkdibnoxUGhTbFJ5M2ZFOHlIRlk1MlBSRGZPKzhZUGF4eGtmTGlM?=
 =?utf-8?B?M1BtS0o5cWpvZUtWWHRmY1hqaDM1c2d1VVBWQ2ZqZFdZbWNVbUt3UmNmanJa?=
 =?utf-8?B?ZUhXR2czRktOMUFuSmNBZHJuZmdkSFNUVm40YmdsaVkvTmswVFFPa29NMk90?=
 =?utf-8?B?TkxGS29lMVhpd0E0U3pxQXNjL3NPd3IzMk83K0dnQ3dOZ293Z3prYlh2VzVZ?=
 =?utf-8?B?VGtiNTR3aTIyR2dYbmhtcVZ0VXdwdFQzQmE3QXF1cEtFSHdwWEMrRmNTcUpS?=
 =?utf-8?B?QVB3aGQzTWNrQ1BVL2VEaU8xbHJOeTYwYmVIbzI5bFVNZ0M2a3N6WTBQM0Ra?=
 =?utf-8?B?U0htVDZHZnZTQ3R1czQwM3F2K0doaWphYVlnR2ZzQ2dlSTZNY3RWUEg1aWJU?=
 =?utf-8?B?bHZmZEFaQzhQNnpsZzAyUDY4WlRrLzlEMTZxSTdjcGZhbmcrL1dVazZmSThE?=
 =?utf-8?B?bSt2WWFnMnQweGdDaWRUd2tBbmp6VXVrZDRLc1FzdHNmb3Y1aUxTR3c0TEU2?=
 =?utf-8?B?TVlyR1c1dEpCWm9VaXQzTy9kVUlOeHllTEJKTXZwZE82Rk5oRkRrSy9EZlls?=
 =?utf-8?B?czIyUXdTSVpjYVJ1U2F0TDVZcThhTDVYazgrMnpOMnVJRWNWb3ZiTytPeUo2?=
 =?utf-8?B?akNOUFpmMDBGN0xRbWZiS29BanB5bHNmSVdEZ1A1eGxRVTFEb0F4Rm5FQVJV?=
 =?utf-8?B?SUl1cHlTZDdaYTBza3BvUndlQ3ZqZlpJUVJYZ3hTaWdvWm9VRXYxbGZZWnJO?=
 =?utf-8?B?cmJpREoxTWRpQnRzRTFOMEE1SU1Pby9KK1Y2clFBcml4T0p3YjhPT0NsOWFv?=
 =?utf-8?B?MDdiZ3RVV1BqbHE5cnlrZitpMUtXb1AwTTdIeUVWOVB3MVRxYnF2WW9FMmVz?=
 =?utf-8?B?bno0MGRVdUtiUVFDZk01UlpmSEJscVJBY1JZRi9RUUtwR0FwOXU5NnpZQTdC?=
 =?utf-8?B?OTFzQ3dXbS85cnFnazBtY3dyMUdvZllPcEExbUhPWEgwMlRuMlp4ejBRNk5T?=
 =?utf-8?B?NGNpb09lR25VeDBNNXhRWndFVDNiRmZZMHZscGNkUjVQU1hHcXdNQ29lSGNL?=
 =?utf-8?B?SkV4RGF5SWJSWXZjOGZkY0psVG50ck95bnAxaTA2cTFlelBqUVRPLzA5N0ln?=
 =?utf-8?B?eTVYcDc5Qzdydi9GU1BmV3B2UWRmL1gwb2lnZ1VQdUd2dFhtZmw3V2tWTmNI?=
 =?utf-8?B?Nzk1emNjSnNVd005NWJuUXFxU0NEbUZWcU8xYjRkTmtEdlFTanZEZUZkZDNX?=
 =?utf-8?B?ckcybGV1WUhMWkYvbGdjQ3pMaUxCVXFTdWhzTzg1aG5RVTcrclpqdnErZURC?=
 =?utf-8?Q?kVNjvPl8OuOfSoJvJ+3WpU4fX7+JaoTrxV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c43c9fe-d3ca-40c7-0e5b-08d896cbe1ee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:09:28.8146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/XayanG/lZ3Cj7HWUE8NUyO5gtjmb6QE+Ez2iF1zVZ/EpZyHiQkq+R9MYYsxUIdERTLYJl+CaiyW8rz6k6C9gcIwBgL1lhtta1bSw8cSB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------DBBEDC8E158AF2907ACD3416"
Content-Language: en-US

--------------DBBEDC8E158AF2907ACD3416
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-iniconfig_1.1.1.bb   | 9 ---------
>   1 file changed, 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> deleted file mode 100644
> index af4291bbf4..0000000000
> --- a/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "A small and simple INI-file parser module"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
> -
> -SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
> -SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
> -
> -inherit pypi setuptools3
> --
> 2.25.0
>
>
> 
>

--------------DBBEDC8E158AF2907ACD3416
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:315b9b7c2401bee51c0d5b4d41e5f2d14bbe1738.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:315b9b7c2401bee51c0d5b4d41e5f2d14bbe1738.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-iniconfig_1.1.1.bb   | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
deleted file mode 100644
index af4291bbf4..0000000000
--- a/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;A small and simple INI-file parser module&quot;
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9">&quot;file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9&quot;</a>
-
-SRC_URI[md5sum] = &quot;0b7f3be87481211c183eae095bcea6f1&quot;
-SRC_URI[sha256sum] = &quot;bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32&quot;
-
-inherit pypi setuptools3
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DBBEDC8E158AF2907ACD3416--
