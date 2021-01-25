Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web11.35843.1611578347052269592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kuXG8MVb;
 spf=pass (domain: windriver.com, ip: 40.107.220.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDcFJ7Odks064jl2xjwXHcgJQMiBhf3tJ2V+tN+Te84a4eLUPSb8SirJ5JoaKfrHZtmxh7p9bSLUxnWjW9RU6A6OUh2uA8PhYszEI+flfWQGWUKRSN8h5PJ3JDSHPgS0Yb1yepsmKa+aURVnjc6bCxpmJndAsGMsPdzCHGHA4BLcd7suxtxXsAnISiUU26LvwHRQyf+UbDEUYUMRfTjmx7QpQXkV+gnpUHwLbYX05gXU1+YNOWEe71GVwlzbcr4e/bWzFpMtNaLKMBaOF8cMMpbjNXyxCUqX8PrJncHBE/MJuaKW6++Tu0jfwzVjpOoh62AEaXzU4Vr+YhmYzfYxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJfSHCmqxTJ1ph0tPwXZerVU2sEQ3v8lfcXvSb1lRwg=;
 b=Ta1eWDZxfa8Wh+5ujcguWuPxJupEdzXTC1QvJRj8yjToumAjcRBoMYfwWQq5gsfEjiYbDjIgKd8LjCsszBuu6XC9Dc6dwwFdFJ4wV6ZBCzGTjW0RICBFoHF4slqF4Vz51RtFdlDB++PNMvWjF6beT/0T77bH2Mh9Hu8LfVOk/YPDpPCWoOIGQV/YtsdGEFGtl0SRba1IXILpH8s1ivBco5xBC3I0C4bQonVdimGb9nYxvJz3BBGMfDRgulmhKADY7eWTsS/gt+NVG/zmtmIGjsNOp/hQwvE3qoaW/UDJPSFgxhF8dW3zKYcdu3eGIXFFkW/VIjOz0brf6UBYPht55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJfSHCmqxTJ1ph0tPwXZerVU2sEQ3v8lfcXvSb1lRwg=;
 b=kuXG8MVbpREYL2LiRp5GkQJOx4uSJ/TyNY5+7Ic2hciXwjKxNTWm+F3jjJE3uRbYUwUfQ4s9JDbBEnASKzTKxdylekz1wjD9hOHg43WAn0iVFE1MIXucUwLg6yUymNoT0/jfeldlQYzuhxK8O12xcBMAEQdJuJPedRKoKG0ocfY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:39:06 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:39:05 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-google-api-python-client: Upgrade 1.12.5 -> 1.12.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <99ef80d8-f047-61e7-ea62-ea99ca57d1c8@windriver.com>
Date: Mon, 25 Jan 2021 07:39:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:610:b1::9) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:610:b1::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.12 via Frontend Transport; Mon, 25 Jan 2021 12:39:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b755e15-5b9d-4a2a-0332-08d8c12e33d7
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB398482C2E27EC4A96F22C0759FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YoMKjH2pJm7AlwziTCrMMxnhrgE9oSIWBSvLmMXJpwawZP6skjvu+MTC5tUjNprpCnMeuTxt7WXYne0z5KP5qHfD3NlRffFBbIbXw2d9hUYh1pkhCb2PZp6PXqRwmFq+vlDPPg5wcdNdTIqDEoi5VKC8p87CaNiYrYmMYWGI3EEcI9UJbH9msEek5igT/65Dg2eRJgw0dfxIrw1GatoLIR41S+IYoeYDfz7x5DG/FE0092MHY8N6wlAY6BVAQpCQjqVMwCcxy1AcONcilqM4aUDOQUsBPsbi80m+dr7eSZivCKafzzT65ylOrCEjNANjrW1dkpZSmYPQRWkFBgA9erVSoQ1LjuncnD3qM//Ho9zfNRNC6jTxJ0EVRJ6hzbZbJ+TH5KzJXEAPTCn708hT60/Qcd+iF7ENX5zZjoHnS73J9pOeFutR3wxjQD45jVlc18xBQdbVY5423ZIraX6DWDDwEnXD+HpBpqtCX0egdfHUEthuLRHwvlTUMYTGK+dJZV1BidRxKMmqfvNa+IAbkHBc2ABq95RC90RV+mmVTTU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(498600001)(36756003)(8676002)(52116002)(2906002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SkY1RDc2WkRubUpWLytVdTFiblZieUZHT3MyL3l4OHN4djFLTHBhRDBpSnlJ?=
 =?utf-8?B?dXB4M0xKNnVzRUxoL09ZazJLd0h5b2lXNGlIVndXbzZ6YmRjRERHNzNlelBD?=
 =?utf-8?B?M0YyWEFmS0t5ODNOcnh4emdLMzBmbGROdkNnSWk1T2lNdm1yc0RZUlV3MTIz?=
 =?utf-8?B?a1VoUGZ4bjMzdWN0WE9TbGVoVUg3anNMaXkwcGgzdENNNXdIWi9IWm1qWE5y?=
 =?utf-8?B?cU9ONTQ2NHBxT0wrK0dLdHRSSXM4Skdyc1R2Q3gxR05TbERsZjV2ZHU2cmkz?=
 =?utf-8?B?alJyZEhZS1NRYkpqK1VBTjFxSm1ZZzFEYTJ4QnR4SHVOQkRKMldFKy9jRFM1?=
 =?utf-8?B?dUJrTEcxRDUwUkx2YmM3NHRzR1U0Vm9vVnVUYitaVDk2RDgwUnJxdG9meENI?=
 =?utf-8?B?b0NjRWhMU3pvWVZHOE5KalVFNHZ6WkYyQi9xZ0RsRlVVZTdjWk1FTmlTS1kw?=
 =?utf-8?B?b2Q2YXFOQ0EwVGNpOE9VTExOWjhBaWtEY1NMdFZRWEVSaTVPdFc5VHkrOWJD?=
 =?utf-8?B?SmNESE5pWWlyZ24rSWsvT2RJSWt0VEFvZjJxdXBFLysvMUtSbmVCakFPY29V?=
 =?utf-8?B?c2tQYTFOL2lpYkNPbDM2WktKQzhyNWptUE4xWnVWMzIvOUp3ZkxLWmpHV3Ev?=
 =?utf-8?B?Wi9sYW1LVUpDZ0lwSFZOTWJoMXd3MVN6QVdHd3dpTHBxZk1FL1pHUG44blRY?=
 =?utf-8?B?K3BoV3NkcFhUaVdZeXB6ancvc0dYQzJkbms5b3ZmaVZoZGROVHUrMzBidFpi?=
 =?utf-8?B?ZG9UMWFsNnVjeHU5QnBnV3E0SGhxdlN6YytEQ3pLUVpXUFRLZlB3TUhvWlVI?=
 =?utf-8?B?QWo0bm9RTGpnRlgweHJ3ckt1bnJOeWlEV3Aya3lMQTZrZ04xeGdicXUrQUNh?=
 =?utf-8?B?RkRUUkNjNkJ2eDJ6TDc2R3gxSUc1YXcyY0lxTlBYRUd5M0NmV2FLS2VoNTQr?=
 =?utf-8?B?MWN1Y2ZDNTRCOUt2V1hocUpLbWtHVFR6enBET1VKMWxCbk0yL3UyUjl4R2FI?=
 =?utf-8?B?UWc2K00vZ3FKRE5XRjhUdDlyclZoZ2FmdWc3VkF2cW01bEcraVd0ZS9pSWpI?=
 =?utf-8?B?S1djeFNndGY0K3pOTGQ3MW1pczFEemQzMlpaU04wZGhTZnYzSlFFTGl1eWwy?=
 =?utf-8?B?Q3lBeGlnWkVLVVJiSEZ2WEVmZWU4SGFhOEFMYnp3NEFMU2lQaG1TWXRNTTcr?=
 =?utf-8?B?UDY4dERrNmhxK3dOZkVIR29FUnFkbGpoQVdIcmdJK3k3Q2tWUXFlQzk4RzAy?=
 =?utf-8?B?NXBabFZ3VnpjUE9MZ0ZEelg4bWJxZ2I1NVVnNWl5ZWtGYktRRXFwMk02ZmQ0?=
 =?utf-8?Q?VjfdD8BSiSRpw/4tvA03jHtapsI09GcBtg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b755e15-5b9d-4a2a-0332-08d8c12e33d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:39:05.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9wj96EXT1pBnRyf1LzxZAaB1RZFXp7JbbHnmp04zU6kICYNZtdFP4VPmh0Jg+smyEmxhSr605wdW+oODj88aAmc7B5i0jDpqTKiHKWShRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------661505DC831EFB699B9B939C"
Content-Language: en-US

--------------661505DC831EFB699B9B939C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - add httplib2 authorization to thread_safety
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...nt_1.12.5.bb => python3-google-api-python-client_1.12.8.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.5.bb => python3-google-api-python-client_1.12.8.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> index 87c221241..1774f962e 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> @@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "4aee3820666e80944f38c39176193d5c"
> -SRC_URI[sha256sum] = "1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829"
> +SRC_URI[sha256sum] = "f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb"
>   
>   inherit pypi setuptools3
>
> 
>

--------------661505DC831EFB699B9B939C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- add httplib2 authorization to thread_safety

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...nt_1.12.5.bb =&gt; python3-google-api-python-client_1.12.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.5.bb =&gt; python3-google-api-python-client_1.12.8.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
index 87c221241..1774f962e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;4aee3820666e80944f38c39176193d5c&quot;
-SRC_URI[sha256sum] = &quot;1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829&quot;
+SRC_URI[sha256sum] = &quot;f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------661505DC831EFB699B9B939C--
