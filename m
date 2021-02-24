Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.73])
 by mx.groups.io with SMTP id smtpd.web08.7869.1614178050418243365
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B49gfJVd;
 spf=pass (domain: windriver.com, ip: 40.107.92.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYD/ZedO6s6x5aJZCgmSFRU0Yzcb1YENdnZTdxW2Mk2ydfnwCM4lNyfjfCYbPoM9CAU/lKYdyUcTpLPpaA8X1TtQoHazwH8Phok55yCfofWnKWBzl7eqtWygvPqOCbr5R3Zu4vNnxRMxONZeBv+68y+87Y9tjuq7KVINg5veNiqOckwybvrcdjYG1OpOxACi3u/BGhGxXcGOI63W2/YmznG7L9v6YdmgApvGD8NzbdPuBG5GI+Yc953S/rHr6NkZfE1GzhbGRPoA4ckdWtvpsr9tEBi6eHguiyRMK4z7qzcDtr3cmOaPbYbxorOppbHXbHM5d3XkIwqUp84aWs74UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr5+w2h45xcFOFpPounkelDMVl31iOI1lD0U1pmAxrs=;
 b=DCVyTLg5q7rvbeeeGDhld9wzN/6qije3Px7Oh30csbr5uVzTIdTPmpatuJPl6Znj5Eu+XNUf1d5OGPIatpYPq1FfnYOiZhJq93/Lj/6xcXqt3GAaTNCqfFks+Q3JOLl2R2ZifZCQ0THXZbAke9slB4eu1CyGpnCiz7XPITet0rk+0XSt49rhuPc8Cd/6dEz6goNbaj3+CHUjRVziTP4rJCYYsWkQKV+iWGy/0qfSUjvH/qdmDCMjL/mURDBtRl7SOfZIN8iRAra8w18lD6zTCDE+3nekfhdDWjp7TnMJ+5uHFenXc3RS0mYKhomucCt+62wPBl2o8l4eK+R44jG/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr5+w2h45xcFOFpPounkelDMVl31iOI1lD0U1pmAxrs=;
 b=B49gfJVdFauRul8JPu+FCji9WqBLxoDedTDHaVos1+F/xg8QBAEZgbhRLF38f23Z7HlgatS/SNBOaf2pdlMYd9YtUE/A1wwd6WSvooY0GbCtgFkSwQ/+LRqDCtfwn2VYK61c/wXEW9QP6CUMz9Xcetljkp8t54RGEARIgmGLtMw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 14:47:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:47:29 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-txaio: Upgrade 20.12.1 -> 21.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <366201db-ea37-3250-7bed-cd23eb7796ee@windriver.com>
Date: Wed, 24 Feb 2021 09:47:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0273.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0273.namprd13.prod.outlook.com (2603:10b6:208:2bc::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Wed, 24 Feb 2021 14:47:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1dc58f8-8744-4449-b3d9-08d8d8d31bcb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB426090D8BBCB38C8C01585239F9F9@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b4ykFrHD7L6ORDE+KWxtIh/kFc1Jbk9hy6asiifTAC91oHzFTxJCXrUbMp30API0By+Q+K832Y4aO4SyrhxFhlEoL+x/t4fVPCGIKQXck71JwfP1G3DeBRJsJPSEVj1l3yntSaisfEeZrw/mWT2gW6j/EcBD5nN+e8AvVPypHfgL/xrCdonZdfbBZ6fvxawjoU1ApvyvuvqSxdjOBr+6vWdH5XT0J5YVlXVG7vc8JqBtM3C4FChaWMEe5AXN3jh4ryc2T/FTDRq0JL1eHW/Hs+t0Xg1tvZ/5SFLn3COS+Um0kRCN3R7Nd5UY0TpJIZJPgbopaLZfft+4y9aLecsdXKKOfvcz8xlKa8WEWAk+3bql7gEnruk1Jz+1s21YMJd5TQX1Gsq4A+vDHVHNFcJBX6Ysz1NDOL7y1Gaoml8eFFMAh2h0BiSB+cEOMChpE3OQeEkNjBh4zhP8TzAQ1mI9VFTUaVOwT5u5yTDWi9g+Hi8QHqn2mAWaQQPqMJVsIFpRdin8eYCrGWA7vLAxLeJbzwtAcuyntkgFVVh6DAph1DQYh4ZACMReklsG9tAhWHTKaOjaXQWDc0lgeJIokNZ7DzNJuxJDCSGcLIb35qOT1gKRluE5iyo+LiRVDH3yE2ZQwxRPtTdmdYU0vm+g7x/2DiuyEoPPBu5cGI9cJcrQKp61vd7shtSG6mBawUyn0GxL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39830400003)(8676002)(6486002)(33964004)(8936002)(44832011)(2906002)(66476007)(966005)(36756003)(66946007)(31696002)(66556008)(31686004)(956004)(5660300002)(166002)(2616005)(53546011)(83380400001)(16576012)(316002)(16526019)(186003)(478600001)(26005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZVp4Q2tBRC9HQTQ3ZVFjcE9pSGNhWThPWHJ3ckRGQzBWelk2QUlFWmNCcHBX?=
 =?utf-8?B?NDlPNWszdi9OdDdTdHgwdHFtZFQ4ZUVZTnpTd2ExVHFhQ05SQ2xmWjJuWEk2?=
 =?utf-8?B?aGJKT3M2Zk8zQjFWeDlvZHNlMVNqY2NxNzlUelE3YjZpUStSNXhLYnJOWExC?=
 =?utf-8?B?cXZFM3ZIcDZOajgvOVB0cngvTURuNkwrM2ZhZS9IMTBnd3BrR1VLTloxYkMw?=
 =?utf-8?B?V0t2YzRhS3c1L0V1bFN5WE1wRGtTNWZIRms1NVhTQjk5SHRtTUM1MEY1YWtm?=
 =?utf-8?B?M1J5czlpTzI3dTFwdnFWMlpvY054STBnMzNGMzhRd0pKQTFnWlZ1V2dkZjVR?=
 =?utf-8?B?bndic24rdXFTbHo4RlJjbE1tNGNkV2pZbjlGSlArTWd0RXpRR1MraHlMSUpt?=
 =?utf-8?B?NmFNU1pmSVVGb3dJTEs1dVhyVWxtQXkyc0lHemFNWlc5NVlnS01HS3ZPdTIz?=
 =?utf-8?B?b0VTWjNiYVMwZzUvRHdZZVhsd3Rhd21RZWkzWVVPbXJkQmtpMUNjRHkveHlJ?=
 =?utf-8?B?ZHBhL2xsVGNEdlFSbWFzNjlCN0JzbUd0ZGM4OHpoMjkyYmRUbVNqVkFEYXZP?=
 =?utf-8?B?TExGcjllV3pVSXdRYStiYWQwVDEvNEJERVlPQkFPVlRjMXRMeDhTUXNNSVQ4?=
 =?utf-8?B?aTRHSmlQenBVSW50SVVnR29zbzNPY3VKUWtIdEIzTk9qYnlXUzdIQjZJL3RX?=
 =?utf-8?B?SE1laUdnVHhSQXJOM3pmMTZ2NFc1RW5rTFN0bEZCVlBOVFFIQkF0RFU1OEZk?=
 =?utf-8?B?M3I2UzYyalAxeWg1RWVsNnUwZUJHMDFHR3RPcjJSK29IYmhhTnpqa3R6bTlL?=
 =?utf-8?B?SXNMb1dPK0E2TjdLUGk5RXh4cStoZlA2U3Q2b3RuWHVIUkNxQ2RUY213VFZI?=
 =?utf-8?B?TUNlRDBnWE1JYjQ0REhTRkwvMkRBM0RVclVoem45bS9tTXlQbzdYeTI0OW9x?=
 =?utf-8?B?MjV1OHhsMFRTNlF5MmJBc2lYQ2FZdVhkaUdjUStHOVMvb2tTN3BiL2ZLbTIy?=
 =?utf-8?B?bzRBKyt0aUFqdm1ncU1KN1VjVnFxbXZIRzdoZ3VqVXhOTDZPVWMvVUJ5c0E2?=
 =?utf-8?B?aWovbW9qZUliQ0E5WThEbWtSV3o3NXJuMkE5UE9MWm54bG1aNU1VQ1VESXpZ?=
 =?utf-8?B?NExaMkVMZEdtZVVKT2lqbWp2ZUJLQXFpNGR0UFlOakI4YlVJWjB3VVNVSjBW?=
 =?utf-8?B?dzhweFhKaDRmTXpaM3pYRUQvYWdkT2pyS09oS1NaQ1VhdXcxVTRmN2tEZUpQ?=
 =?utf-8?B?WDRlclVURVRNSW50L2J6ekx0ajROSDNIMjNZRXg3OXhiVFEyb0hrcFZMWGgz?=
 =?utf-8?B?aUlzR2FGOGRSa1R3NWVRLzBJb2JJNWoxNjhtMnpqb2ZTSndabnp2YUwyR3Ft?=
 =?utf-8?B?dzJtc1ZINFZ2QWhUMWNqUFdjSDg0b0FzclRDWE9YbjlhSlJiZjBHODc1eWVn?=
 =?utf-8?B?NWw0TUdPd2F5NVRRMEtaYXBkclhBa3ZYNmdabE5rZVZWWi90RmpEMlp5clBB?=
 =?utf-8?B?bzhESnV0SHdPb29VQldhNTQzS0xJcXJXOGRlTEJWMXdMMXQxQUdxKytoWEU0?=
 =?utf-8?B?TlRDNndVZzBtWXBybzFXc0VHeGtaKzU1TTVIYTRTRHIxNGlXUmFqVmovdXpI?=
 =?utf-8?B?NW1jNkNEQS8yeGNQSHg3ZDcrcmRLMWxtZ2dPRkpvMFdZWE83S0ZhblZtTkpI?=
 =?utf-8?B?WWU5SDJkRi8yN0YvQ3c4cFI4VXVxenlDeE9SWlFXWUpCNnBkTXAvYi91UWxw?=
 =?utf-8?Q?vCMcDZ298KqefkT6QPKwdvnVCpXSebHnFQ5/h11?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1dc58f8-8744-4449-b3d9-08d8d8d31bcb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:47:29.0078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58MY2B0q6+JzMA8jHwmls3VyhtQwT9N1wTtiaCd5g4pLvtWVyfYV4/iLQ98JAn+0PgbUtlFUHe8GRz/pziNcMN1FN9DbTFSWaRs55l2R2k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------A69D2612DCB77E1273E2B904"
Content-Language: en-US

--------------A69D2612DCB77E1273E2B904
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.2.1:
>
> - fix: update minimum dependencies (here, and in other crossbar
>    packages) in an attempt to tame the new pip dep resolver madness
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-txaio_20.12.1.bb => python3-txaio_21.2.1.bb}       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-txaio_20.12.1.bb => python3-txaio_21.2.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb b/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
> rename to meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
> index f4baeb10fe..53dcb5cc69 100644
> --- a/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>
> -SRC_URI[sha256sum] = "1488d31d564a116538cc1265ac3f7979fb6223bb5a9e9f1479436ee2c17d8549"
> +SRC_URI[sha256sum] = "7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------A69D2612DCB77E1273E2B904
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.2.1:

- fix: update minimum dependencies (here, and in other crossbar
  packages) in an attempt to tame the new pip dep resolver madness

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-txaio_20.12.1.bb =&gt; python3-txaio_21.2.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_20.12.1.bb =&gt; python3-txaio_21.2.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb b/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
index f4baeb10fe..53dcb5cc69 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = &quot;Compatibility API between asyncio/Twisted/Trollius&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>

-SRC_URI[sha256sum] = &quot;1488d31d564a116538cc1265ac3f7979fb6223bb5a9e9f1479436ee2c17d8549&quot;
+SRC_URI[sha256sum] = &quot;7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A69D2612DCB77E1273E2B904--
