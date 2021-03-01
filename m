Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.60])
 by mx.groups.io with SMTP id smtpd.web12.1037.1614620913819571303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QUO2qt42;
 spf=pass (domain: windriver.com, ip: 40.107.237.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLnMfw7n107qRovyUOct4S2GqHu6TImaBfR51Mrm9eQYxxuYBvJ57oKO337i4iZ+0Rdh30aighXWDrHz2xiKqOjA0nPl+EgokZIpJVEf+a2jadhnHhR5vsPFu9FktlHiTyv6HoY+0KhYu/5wYbfLXxtNo7ymhtWXYyy/3UkfKlWnshnihNcgITkNKksrju0AueI3jq8f3/QZnWbf5e1aLyLXhCC/sc6OwmB8ZnE5xS4pQPhhHcl+XixD3HCzbReVtpLt1pxHCCzMxjm3xrznYuOP4e1zopJMiPzCNhtPIUIrJLbZj0b/PQ/v+9x0qB9pKpSl8S3jyKoXZAYebjinUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/m45CTJc3d9z+LwPpclWffYE3iOdQoFrA4N881wL+Y=;
 b=c2bukBApNQvf6/KGOMQ5Zs7w8GvZY3J93zVOOWeii8DKnCF9mgTkX2iijr1PRBQNxmXAmKcdoKRjP/vrB1kvckVnVoFssQcYqJ5pnybq/953gY+GlSrVmPrsCOYa1e+t/w8upLzkFff3sqwiXNt8HfuWqsrYBStF2sDYwVBRLkIWBwNQUDq2PgiIZP5sjd2gDxBL0x+3Tw3p+PR7vGh5/piweFkaYczZBOj3YU6sk6Eq5eNe3T9EL89DLAsDUTzUpJTIFMkd5K3mTZUvafK5aHiu2AFHs8Wlo4u8MP52M1j2PvtavQd7wz9J0tEAa3YsUEehAjTYeK8orrUr3Wol9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/m45CTJc3d9z+LwPpclWffYE3iOdQoFrA4N881wL+Y=;
 b=QUO2qt42rUF0ViLgijSpFLTpq2VUW/51E/U3XtxhPJkvSPlNNQSIoPIv7XBE0izeYI+T6Pi99Hlv2Th6FmxgaSfOGjtCwO9HewvqnyfvI/wEbtL/8J7/6Tj9U0AmU7snCsPnZldL9wOIJfmTejTJkj1MPMuDbrTsnOoSWmoTnzI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4259.namprd11.prod.outlook.com (2603:10b6:a03:1be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:48:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:48:31 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-rsa: Upgrade 4.7 -> 4.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f847af2b-522d-ee79-185d-a9a8fbee2a65@windriver.com>
Date: Mon, 1 Mar 2021 12:48:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210224112512.31406-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR15CA0061.namprd15.prod.outlook.com
 (2603:10b6:208:237::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR15CA0061.namprd15.prod.outlook.com (2603:10b6:208:237::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 17:48:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 636d9170-45b3-4260-813a-08d8dcda39d4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4259:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42592A195C6AC99E2EF0FDE49F9A9@BY5PR11MB4259.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FK6wjvLzxoT9hnL5p3XNlMB5s3bmxuubnV++8zof1hO4CRlJe3tyHrJWSihn6Hig8lTIeWVNtESxViAoY5UePcHejlBkLOQJG3kP1HHcc13AnYp7wZ4C7pZTNQ46ifNCRfE+82JzHOSiMzK+4L6Inuki0FpAVLysQF0eIFOUjK4popYMZikoF+vEP3UpyrCqz2JOrZrmInLoXOMHV8TSr65OIQmXr5KsrqQeugL5wv5GTBVk7NGdabn5EYW71fVfNCl2eVJx3sU2PApY1yfry0uGhNFXyi++IYdejBfi3MCPlyJXwqBiJHzMv1uq1g+bokOD04ef7omht4PFo36pXYPotY/X2GHe70wpvLq++xfhj2YLfHL/thHhWcnRV4SClBi4bEFM9giSBlgJA2Cf0X+szOzi4qvX1cntn5ntbC7f2m3vZBDmpJ5vFHkdYiFRM1/W61DNppw6RmBmeX2YOcSPlZUq42FeGdTfSBICnlAns3RFXFRDU39uXx1f2spcUlrk5mFmfnRxGHaqv+/XkzYPJOgmk+iIiq/oUp1KEloeXGm+uWFkAZ+JqgQkzGDfLc8aAgp9V0Sa0RFZ2SSgWNPgbeWGgrcwoB8u/rsGGMMdG8YVSpZVQAEsVTRnXpZLYzwG1q8PwQRLcra4J9o3NZ9fHC7J8BlBTfkuaKhVf9IBdu8kWkl4LJhRtzcnQmRK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(86362001)(83380400001)(186003)(31686004)(16526019)(26005)(316002)(16576012)(5660300002)(36756003)(33964004)(66556008)(166002)(8936002)(478600001)(2616005)(956004)(31696002)(966005)(66476007)(6666004)(44832011)(53546011)(6486002)(66946007)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q3pFTUFHcVJWL1ljQ3VGc1phOXloekNRY3hVVmk4Wm1QS01MbUVBaVhSTEFy?=
 =?utf-8?B?dzVzRzZRNVUzU3YweGh6N2dLRlJzRmVuMjFEemRqQUFNTWFHSTNuTVk1cElR?=
 =?utf-8?B?Y2JTcjQ5YXRuMmpDT0VKd21jaE9lY3BiTkRYNmxGMkdjcTFXYXYwTVJJbTNj?=
 =?utf-8?B?KzRpd3V6d0kwS1BMWEVCMW5RSlRJSEMvUk0vOHJxdXFoaDhSbGlJSW52TmE0?=
 =?utf-8?B?RUlRTFZzZVVYbUYwSWlqVWdGZDRTaGFEOUtTN1hrZnY1WUo3L1lNV3M0aHpx?=
 =?utf-8?B?MVo3S2pTYjBhRVZkOC9IRVJ0UXNwVmdTOTV2eGp3SlNYTmdjVzR0ZjAxdHhK?=
 =?utf-8?B?cTd0NDVrMDM1YXJkYVgwUWJHYlhrcmJHTjRmc0NrNXhEZTd0Nit2Z29VTURE?=
 =?utf-8?B?d1lYUXMwamc3Z2F0RmlRSXJYLzc3cXJORFk2Tk9KOGtob2lJVyt5OVVybkdu?=
 =?utf-8?B?YzFaVEppNEUyT0lWQXYvMnRPVndqOW5DbWZBNkhDeVI5M3FyZmNnUkd0Nk51?=
 =?utf-8?B?WjN4ZEI4b0pYcXhlOFhMa1ltdFdEalBOS3MvdXZhOEV1WlBSMzMrTVRBazNo?=
 =?utf-8?B?TFhoamtpaHVPSld0MGtlNHQ0MUdHS2g5QnRMSUYxRHFlaEZaeVlTdWZsampM?=
 =?utf-8?B?KzY0blQ3TDVDM1FjZE1VenFCYml1cHk3YW4xRkNHdDd1TnFPT0tlQWYyM3A1?=
 =?utf-8?B?N1dVeVBOaUpWVFA2T2src1NubEdFWS9DVE0vMFVCR0dJSEh5bjVDKzFaZVFT?=
 =?utf-8?B?QlZUYlgxaTZ6a0lZVEM2UCtCaFJlTFNHUUxhZUdUTWNhWDNJUC8xVFFiR0Fl?=
 =?utf-8?B?S3IzY0I5Wk1hYk9USVpSWVg4RkRTTTJjcTZ0KzdnTWVpUEpieEtiRmpwZUtW?=
 =?utf-8?B?WlIzQVpxZVdwVE1Gb2JzeWNRSitXWlU3M2psNXVwa3Bqblp1aXFCZDI1bXNk?=
 =?utf-8?B?Wk1qNW15NnU1dGZzTjF3Wjkvb3dSZ3hFZHNPcjN1ZmRpZ0VpQUVsbS9YMXBp?=
 =?utf-8?B?MmZVOC9oMEdTV0pvTEVQSXFPcHJ0SStoQ2R3UERUNW1wbG12RGNubU90MFNo?=
 =?utf-8?B?aUpjN1dTd0lOR1ExclIrbVdVWlg2OVIwWDJUOEF5dmZUWHlnanJKRGV5bEJK?=
 =?utf-8?B?cXpNVjRtLzNJbFgrNFdnUXMwcUpIMkNZNUZEQXhnblNac0JJZ29NZWh0dzRo?=
 =?utf-8?B?UjB0YkJLSW92dHRDNStGZzZyWDc1d3ZlNTYyNjczR1pkaStoNE5oVzVHeGJi?=
 =?utf-8?B?Yno1dTZKN0RLbitqQ0R5b3pBUm81WW1DcmFGbllGMTZnQzBMc2lwa0YzaVd4?=
 =?utf-8?B?OTR6MGtIRHZwWGhCMkZqSWhmNkh4OGoza1NPR0d0ZDV6Rit5c1hEUmlDOVRN?=
 =?utf-8?B?bExWYko3MmhwVTFnZkM1RjVSK1hGOXYvcG5BSEV5MHpMdHFNajNtY3dydUd1?=
 =?utf-8?B?UVpqdWhDcGUvVWVickRVWGM5RlpnUHY4U2drTlN2N0NnWXplbFc4UWVxdXF0?=
 =?utf-8?B?VE1KL2djcEtCaXNZenhBTkVqS0NDdXVacjVwaXRRZHM4YVVuR2hMWXJxRTZN?=
 =?utf-8?B?Ym5hV2pOYlhLZ0JuWTMwYldiYWxtb3FvUFJrUFJ3MUtUd3dGTWVvQmVXbity?=
 =?utf-8?B?S2tpU0E5bzYycVJVNEsxZkd1MWY4N0pzajdxM2NuaGNicUtvZDJRS1Fld2hy?=
 =?utf-8?B?SFYxNGRGcEJPWVYreHNaUmZxck52UUlyTTZ2Q3kxU3JxTzdJeUxTV1ExTnd0?=
 =?utf-8?Q?bHtyBrY4EI3LSuyqQUwGhGVobN9sdlCbXPQG0dr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636d9170-45b3-4260-813a-08d8dcda39d4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:48:31.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bulKwer20FVqm4S5PdbWer+fp3BsDb0S5LpKj/oShUD916RclEaEpsQXnYmMk8hTz2doXAfe50qiumbeoyl0Tsk9TTj0UQj0edh+ZIMqPIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4259
Content-Type: multipart/alternative;
 boundary="------------241AF9C6D944247E2DE47624"
Content-Language: en-US

--------------241AF9C6D944247E2DE47624
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-24 6:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 4.7.1:
>
> - Fix threading issue introduced in 4.7
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-rsa_4.7.bb => python3-rsa_4.7.1.bb}         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-rsa_4.7.bb => python3-rsa_4.7.1.bb} (92%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-rsa_4.7.bb
> rename to meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
> index c4c36020f4..43e7ca0854 100644
> --- a/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
> @@ -4,7 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
>
> -SRC_URI[sha256sum] = "69805d6b69f56eb05b62daea3a7dbd7aa44324ad1306445e05da8060232d00f4"
> +SRC_URI[sha256sum] = "9d74d1ff850745c9802cd6b53382bfeec7f6dbe4e26ee2759241ed1e7b0ecf5d"
>
>   inherit pypi setuptools3 update-alternatives
>
> --
> 2.17.1
>
>
> 
>

--------------241AF9C6D944247E2DE47624
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-24 6:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210224112512.31406-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 4.7.1:

- Fix threading issue introduced in 4.7

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210224112512.31406-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-rsa_4.7.bb =&gt; python3-rsa_4.7.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.7.bb =&gt; python3-rsa_4.7.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.7.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
index c4c36020f4..43e7ca0854 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
@@ -4,7 +4,7 @@ AUTHOR = &quot;Sybren A. Stuvel&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634">&quot;file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634&quot;</a>

-SRC_URI[sha256sum] = &quot;69805d6b69f56eb05b62daea3a7dbd7aa44324ad1306445e05da8060232d00f4&quot;
+SRC_URI[sha256sum] = &quot;9d74d1ff850745c9802cd6b53382bfeec7f6dbe4e26ee2759241ed1e7b0ecf5d&quot;

 inherit pypi setuptools3 update-alternatives

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

--------------241AF9C6D944247E2DE47624--
