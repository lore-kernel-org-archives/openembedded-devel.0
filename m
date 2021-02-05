Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.89])
 by mx.groups.io with SMTP id smtpd.web11.8387.1612533648551633176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e2K3kByW;
 spf=pass (domain: windriver.com, ip: 40.107.75.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt45pxQZIZs7J2694C42ddD9JyOsLB5UcB5/GxY12BRHI8L07akiEQY3EbNEpaFo5MMgg0YGWvMnwtKdTaaZkxaenIqWe3+qB4a9pVn3KQ6lI03sDSfEIfWD/wFuglxN4077xt3waiKr21uwbwfFbftIEv0v04bMJZz1rTWT4t5pJY2KgAxXUQ0+bnOjXUQ0tyM59vKwwf6ZOqpa7V6QecsG7H6b/ooFoi3fJKJax6AwSe/4K34KOOUTEQXaV+/otwWBjOMrEaKGJbo/1CexYhvG8CMwdtBlixQ02HqgA93DZaZ/wtTSjqSKKpSJsxYZYgMLBRLQIdAiqWoE6+XSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/9z9bxoHeaI7fccxU+pLifOH/exPe/zbyS/98Jm1js=;
 b=RVEbP5ORnBzVHm1nsPnBjEZhyC1ZypLoCUG0M0qs6N8imlsNfE20YmYdslCeJZ1XXg+44Da3/x1DS1aG7LnldKPlimQRjgPZ50HavClPDfurc2cj020ucqS73d9TT32in7k0/5fN6uHwZjGkSPURA1KnAcjIx2pJqKJAlXwYl3KWRYmv+hZz3Xdg6BEFr+cCTCGDzHoFk6evuKdq+ZK7vXZyiPhbyzF0e8gcEn45Ql/KEAAUuxTjWsfJoKUzye9Nk3zDdyPhJfLmaTBLnDqPKR122EQBAFhNuqT7dIssswPCVqKFoztoMaMUEYK+qi/N6Seh4HhZssQ/vmTPzb8/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/9z9bxoHeaI7fccxU+pLifOH/exPe/zbyS/98Jm1js=;
 b=e2K3kByWcppc1YYbV0USCrwOa1bQz/8FReZ9J+VQWcRizMaeV0eWwj5kVQ5ZjyNHJ1vnocS9j9e4lWk+QQZQCwpaVDJNsgfw2B9mcIK/fMz34sC6lFXqUBF4f4pcf32Dp0cVBzEAVVR0HqRJ3BOXfiMpnhfl3ko50EoySJ8tG6o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:00:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:00:45 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-meh: Upgrade 0.49 -> 0.50
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <284dca71-a5f3-e006-dead-8b736fb636e3@windriver.com>
Date: Fri, 5 Feb 2021 09:00:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202112636.30651-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR11CA0033.namprd11.prod.outlook.com
 (2603:10b6:404:4b::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR11CA0033.namprd11.prod.outlook.com (2603:10b6:404:4b::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 14:00:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7dae8a4-1f29-4db2-a217-08d8c9de6e88
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389412A39A5A1F8C31C8F0A99FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ejBBS4cbShbet1Y/i3dc44HaLyILKMVHGwoNFAR5RF0P4qYXaRnfQYCPAboW7/QOEGongrolPxK4DyfqGkcsvSKdvnjy4CHhjPcOdWgnm9VUiBUw4J4L9705ajJanPaBQ86TGd2LFcKOwm7IAIm5T9+fr7hK3nTXwQoTdckWwcUIfR5167vLGQa/q8vbPcNHd6bZyNT7jcApTPJ4WHzYM56tJQ5KkZTjfNEYqljwHCESw3aZvwjcY52HiAKvM1KywpZ2ON4vaIUGaiy+dNUy9udHf/GUZ6mgZ1HiDK9CnkuBPiiS/iL27u2ZP0F1L2mxFYveDMiLH6CXZhkNG7nHHvXpFB6mOn2dqnrj3XWbEfH20Wds5yWjzn2wwtdjs+SqTJhDqTUw6oHgdOvvzd4j0PDonFK545UEtePnuyrzEOymAyEf/caIdc2eMo1Iiv9ndWI8zW9sVa2Flmt0huPyicIJFtALDZiabXYEzr4nz4SSS86OwTOpAWWRvZ4kCeOONCBRxuq1+yFDJ+4z8NUs9+ZrBq62dd9AC9btlliQF3rv1D7wF+qHTgtSjADgOMeL1PYOaPu2OwwUQ41SIYup5XxmeXKc6bkvmuJvBRrEkXof+myNuMzd26It+zO6i8oizt1T5/8b9BLTnXjvVPmKrEAm4PV5+3C1Ix9pd28feeK3UvLbgw/SeoEWe10HxsWF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M3R5NUt6TjEwT2lVZ1lPb3NwWlJMNWNCUFE2ZkR6bGdhaDFTZDRncW1Ldk9O?=
 =?utf-8?B?Rk42bVphcTA1eGc5ZndmT2QvSklJVzBKaTNrVWQzemdwVnl0bU5OVlZRQUcw?=
 =?utf-8?B?dEFKc2Fnd3dTZmdSbEtSOFQxU0pQU2huT0JKL09uNTFPbWJLTndkRjRVdWZU?=
 =?utf-8?B?Y3pwMGRqckdlZVhTQ1JPWmUyckFzVXI5US9FbzI3dWNqVGhsNlhSK1htZXc2?=
 =?utf-8?B?VzZCeEVOdk96TVNGNEJBbHVxNG5wb1JNQkt1bUV4NVFHdHZHNFpHNlR5cTVR?=
 =?utf-8?B?QWhqZFlWTDR2YUpDMnZVQURGdVZsSWxkY1RyRDRBUjN6eFA0citobWJpOVJr?=
 =?utf-8?B?SjFMaXQ2eDdBSmM5MDZPVWx0QXl2NUVSaGp4YnZ6bDVrWkUvZ1hFenVIcmJO?=
 =?utf-8?B?U1VFVWlIVjdJOGxybk9ZYUphb3ZXbDh4cXlqZXJXSWRScmYrWkdFb2pIS2pk?=
 =?utf-8?B?dWQ3QWc2SUNhSEJOZUtBRGxMa0VpTHJDSm4xUlF5eVNCMUltenJwYUY5YlM1?=
 =?utf-8?B?NHlRUjBwc0hUaHJTYW5kUGdvemZXUXZhK2luUzlkU2ZsN1F2YXM0S3FRTGFS?=
 =?utf-8?B?UFdleFZZdVNBa1VGWTc0UzJlL0FJRnJzNDcyTEFYSm5MNDhzV3lIcUltdENB?=
 =?utf-8?B?RnBvMnM3bkNBK1hkM25kNVh1aDljMzRNL3JieDltTkRmYVJtcEFpUERlcUM3?=
 =?utf-8?B?bUlVdkh3YzlWU2cyV1BRaWNJUWFKeWRzM1NhVDd2aG4yVW9jSVFoMTNjNlRD?=
 =?utf-8?B?TGgxMHNWb1VjbFprTmE3VUFJWS9mcDg1eVdlSGhFQzVxQ3lxZWNINnBKbGpV?=
 =?utf-8?B?MWFnbHZGb3BsNzNBVTRoQ2hIbXRuMkEwcTB0b3BDN3FDT25YSStXWGd1UXhn?=
 =?utf-8?B?VWczQWZnU09NZGFuU29PQnBzeG9HRUF3WDVpUENGczgxQUx4MG9rbU5UK1Nl?=
 =?utf-8?B?K0laMzNwdzRMNzNTUThqNzEvemRaOWMrRmg4cXR4alQrNUR4TWZYSjhNbG95?=
 =?utf-8?B?TlpCOHlQcnNiWTExdzRCSmlQYlpTMkcyRDA0cWsrdFo2dmRwNFpvYmYxb09X?=
 =?utf-8?B?MDhzMUxqVTJqRFptWndaOEx0djBVSXR1dWxGaUhRSWdMaVVYVytRWkl4dTZP?=
 =?utf-8?B?RGgrckhNUCtOc2tqdXg3NWhTMk1hVFlxZ3ptOGJpaHBybkFKMFgzOElzV1l3?=
 =?utf-8?B?S3NZSFRWMmF5bzZGcllWZ0M5aHYxYk56TWF5NndOVWUweGNLcm5sZ3ZpRGlB?=
 =?utf-8?B?amVkaFZTa1Z0aUIrbFNJd3NVejlNSXhlN09XbDVvWERpNkhwOWxCZ1E1bU8z?=
 =?utf-8?B?WXI0aThFeGtBUVg1Ujl2aytYbmwvUGd1U0w5UklEY1dJNUE0RHRuL3FBN1VG?=
 =?utf-8?B?a0VEcENybm1xNis1ZTIxQTkvWVNRM1FZYmNsYmM5NTV6YTdVQWpMcmFOVnNX?=
 =?utf-8?B?RUNvYWxOS2t5bXVLeXlQME5idEFtSEthZklJSXk5bzAvbnp1cjVXUlJyQVhY?=
 =?utf-8?B?enlwWi9WOVR3dCt6YjMzUzRNQVNwWmFQODA5dkJiclp3V0pidC90NnZIdkdy?=
 =?utf-8?B?T1hHZytNYlhkZHNOaE45YmRXWWh3ZlBZOEdycTRBMUdocW82ZHdLMnA4ZlJK?=
 =?utf-8?B?ODNvY1RVTUxQSGphTWplZ3RodTRvM0Y3S2hsU3RaQTI2UzY3QUI4MFJURkho?=
 =?utf-8?B?U3FDN2FDOW5CWHJ6WjU5Vnd6U2dzL3VTSGVYaUY2bmp2aGJpUmZrWGhWbXZH?=
 =?utf-8?Q?KN+cW67BsU71Zcr9Rc77UIMvp6Fefu19Lk7LI07?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dae8a4-1f29-4db2-a217-08d8c9de6e88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:00:44.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBL06xZvpQoM9Fe4p0UTjeGUL0hcwAYLzzioRLxxXEoJMx9/Qt1Oc+YdmepIJdHsGxUY+WunhLXf9hvMgaDotuMSEMg5NJ3cNOWcnp0OdKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------EF82C672D8E3222E818C3E04"
Content-Language: en-US

--------------EF82C672D8E3222E818C3E04
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 6:26 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.50:
>
> - dump: Use exception's type and value when calculating hash
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-meh/{python3-meh_0.49.bb => python3-meh_0.50.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-extended/python-meh/{python3-meh_0.49.bb => python3-meh_0.50.bb} (90%)
>
> diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
> similarity index 90%
> rename from meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
> rename to meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
> index 7fba21f7d..64a24ade3 100644
> --- a/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
> +++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
> @@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
>
>   SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
>   "
> -SRCREV = "50c09e5c4c76757099d686c316b4bf42f72db71b"
> +SRCREV = "11980776c5ad757401ea1d12fd1f331d96428105"
>
>   FILES_${PN} += "${datadir}/*"
>
> --
> 2.17.1
>
>
> 
>

--------------EF82C672D8E3222E818C3E04
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 6:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202112636.30651-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.50:

- dump: Use exception's type and value when calculating hash

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210202112636.30651-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-meh/{python3-meh_0.49.bb =&gt; python3-meh_0.50.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.49.bb =&gt; python3-meh_0.50.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
index 7fba21f7d..64a24ade3 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
@@ -11,7 +11,7 @@ S = &quot;${WORKDIR}/git&quot;

 SRC_URI = &quot;git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 &quot;
-SRCREV = &quot;50c09e5c4c76757099d686c316b4bf42f72db71b&quot;
+SRCREV = &quot;11980776c5ad757401ea1d12fd1f331d96428105&quot;

 FILES_${PN} += &quot;${datadir}/*&quot;

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

--------------EF82C672D8E3222E818C3E04--
