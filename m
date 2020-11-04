Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.64])
 by mx.groups.io with SMTP id smtpd.web09.13895.1604501265863901152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N23H0+pd;
 spf=pass (domain: windriver.com, ip: 40.107.243.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hb3wINLffeColmsC35OpkpewuIEe1J6lYUCFBQphwB9NiXn1zHxyvEM+8p0r+xJyEfBo6nHq8NsJ082EbrhTAQ6VTgqftDm1BibGvX7R1NIV5g5HlvmMnsPELIftNxnUHaLdZqiKaP0JunnmER1Zp1XAtdQxTqRAiHi6Oqje3FqRxNeCiMp/6c7Ib2dRiZYPcV3dAn4HMP0fKeUtUfQzfC2ic29oAa2F/bNxcCEjkWYlN5HgdYCIrofZKsWDWCkhxW/ldWB7QkthJc8bx4vigUam60XycCl7d572twUWUy9a5SJLSWaKpF7qLy4B4dAM10L+mmJZT/mu8xSGaM6H2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icz+bEzs3WnWgaj4NEDAOWfHuBOeUlp58MrqnPlnheI=;
 b=ikBRDjWHxPzGJeCAYtuIwK4lmWymJtO/WPq1TL0Ot5wZUlxjAYgdjxf1CLJ6u4+EYJSxJ+H3jzlYn8XHVroRn6KS3u0dmgi2NehkChWyjs09FgsIICu0iGPi1rLSG+SY7GaOrFUo8QkfrlDIWJX+PqQ/Mh9Xy7ARwNWGmQ2o5Qhfr4jYodq++Fwhbt0YUP8PZKA+inkqoSUpRgX3hqIYVyHh/4ZnrvAoE/pUCYLGCvdDS2KMTqhJLrWeb+132862nVO4kqMy/mQ98SapH0WW8adooZQ+NfeDHQBAoOYQZrr9mDIJds6rYMgjZhSJZ3rCdtBZFYbbe8N7FFtd0Bqn6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icz+bEzs3WnWgaj4NEDAOWfHuBOeUlp58MrqnPlnheI=;
 b=N23H0+pdM6fydTN3869FivkDDyO/BtIDfDYr7MSdINMcauzS/7JC/ucqf6x46A9UN2hUd0gppAJNld5OtT7caBpegUIZOzaDWreaZTi8neFyj6KP4u1i9GUQlcMpDTZHMzpm9cW0L5I+h7G87olJXvcnRAvNS8CF+gp8RBoxaaU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:47:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:47:44 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-langtable: Upgrade 0.0.53 -> 0.0.54
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201030130840.9169-1-leon.anavi@konsulko.com>
 <20201030130840.9169-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6e4740ae-c271-afbe-a62e-77106a733cfa@windriver.com>
Date: Wed, 4 Nov 2020 09:47:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201030130840.9169-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR20CA0003.namprd20.prod.outlook.com (2603:10b6:a03:1f4::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 14:47:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0a59510-489f-4390-d15b-08d880d096bc
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085E260EDC6A3906416D4069FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fmMzIaxnl6ZD4pplJui4JthpiGbp2z1AhIkDHUHshrOVHq1QTcJQw1AXc0/Bb2fNnSGZkgXt9Ds/Nby0ATspUTmMn5iHkxa7GnBgytB2Gu/WjLzeREoS+J2MQhMEYQPcJ2qNVo3KimV5QsXNesK1XcdidNT3j08mJehs+UsqppMJyg6mONEHCfZXnUzz2H0M3JXJmK/6jJeUmnYePOUJ1Igq0JORZg4r50IZLkYCAw/gYDwTjgs0LZCVi+iJgy2sUkdb4AiA1aD7pzAHxxrmT1I70qtg4IKfyY3+AE0VbInYpxfwqTlefX3Y7SmzRJ5y54TGaK7t28bzh6fZSm4hCrGaw2+mAGEdCqohDEYx88LCYMt46lIBtTD4hy+BV5iu6ByCYq8qWRsAlXe67BLdpqmwTGh8RaaaxhxLcXi7BQD2k7Ph9wpVp7iI53IvnhHVXZNboj+cuL8W1qkstlMR3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VroRsUHgf9Yje8izB3IWAZ3V++cODDQXdp5rj9+jzwdV6TfT1v4KF5TCQXzPA5QBDuSaO/tJIlW3OMGrJNJnav0BLEfntWtJgRniDff+jwCXNLkvmlxXLd0x7jJNiJWYWRonGcTM36nVEDYql38g2yCexXyp4yXNzZ7aYxCgLQXjfwYMOtlTj4TZBx97kixLwKtUkUB9dq4Upbn5YEFmlMcfoPf0amt1LX8xjjwmhtXPjDK83KC1PHcxoVKR7LDIBVPNjoux12xV7/ITGzFhTQ3fosOgiFva9zTu7EP49D+9yNfZIw6trvhNOr2umnzLSApC9fBGKeJvbKSfW8TcpVSDj1UH4X3xvRLmU+78hWxEiU6giSDe0KhmGsebsjqlIkMrVsPWVuScRf2T9Pb4v7Cdru5CtldjPCGBrl5S9zqX+yv2FN81kMezuuNsqALzOJROxe0oCTjo71TuOLfy17h4cmFemgc+HdCdv2l1xwMItPXsS1pzguJyC3aYZxKCo5JucBFp+whZcq6x5VrkSjPJMZSYDKLcZREC95TktBIy3ohbPwWCynLpzZ3Hz700LHA5tV53/AuRYaRaHHyt4EE8o7PccVwfSNsGm1wL1VgCKb4W7NCyZWaUky20QITUzyZZjDcAaak9vqD3XoRx1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a59510-489f-4390-d15b-08d880d096bc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:47:44.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYdCaHwXA0fduphX1wJFRLYsHNpBb75J20IBdWlzXbla9kU5qAp6WjJ4DP6U47iCpoZsZ3w7BhYzBleZy+lJjgs9GljWbxEcWYTrGksMZkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------0456B235FAED40048DF8CB6C"
Content-Language: en-US

--------------0456B235FAED40048DF8CB6C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/30/20 9:08 AM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.0.54:
>
> - Add list_common_languages derived from gnome-control-center
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-langtable_0.0.53.bb => python3-langtable_0.0.54.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-langtable_0.0.53.bb => python3-langtable_0.0.54.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
> rename to meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
> index 27b690f1a0..b9b4069fdc 100644
> --- a/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
> +++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
> @@ -6,8 +6,8 @@ SECTION = "devel/python"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -SRC_URI[md5sum] = "d8f99adfb184f9def22539310f97ce80"
> -SRC_URI[sha256sum] = "fb17fd4d8e491c79159f81aa06ebacb18673fce59dac96f4e9d2d2db27a2e374"
> +SRC_URI[md5sum] = "bf2db4302dbed534ff322612f5f5a16e"
> +SRC_URI[sha256sum] = "2a6298267586fcade84ce977736fc35102ef95d68975bc90ceaa06117d42d5a6"
>
>   inherit pypi setuptools3 python3native
>
> --
> 2.17.1
>
>
> 
>

--------------0456B235FAED40048DF8CB6C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/30/20 9:08 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201030130840.9169-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.0.54:

- Add list_common_languages derived from gnome-control-center

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201030130840.9169-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-langtable_0.0.53.bb =&gt; python3-langtable_0.0.54.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.53.bb =&gt; python3-langtable_0.0.54.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
index 27b690f1a0..b9b4069fdc 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
@@ -6,8 +6,8 @@ SECTION = &quot;devel/python&quot;

 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>

-SRC_URI[md5sum] = &quot;d8f99adfb184f9def22539310f97ce80&quot;
-SRC_URI[sha256sum] = &quot;fb17fd4d8e491c79159f81aa06ebacb18673fce59dac96f4e9d2d2db27a2e374&quot;
+SRC_URI[md5sum] = &quot;bf2db4302dbed534ff322612f5f5a16e&quot;
+SRC_URI[sha256sum] = &quot;2a6298267586fcade84ce977736fc35102ef95d68975bc90ceaa06117d42d5a6&quot;

 inherit pypi setuptools3 python3native

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

--------------0456B235FAED40048DF8CB6C--
