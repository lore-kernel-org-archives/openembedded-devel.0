Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.42])
 by mx.groups.io with SMTP id smtpd.web10.9268.1602632621018638024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FUiAHSF9;
 spf=pass (domain: windriver.com, ip: 40.107.77.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF/aBDpRp1kS1+U52dOx8DV8WOMAwcn/GchW7tTZniX6n7+eJ/fFlVDtaXaIrKZHUnSHqTJKfVEhA6Vtz6U2PKOjGh5f6ZopM/lRn1/xE1jrriFcmNIaOdhY10KVqRxuZgcr7+vGp6XgBCxjcTjkFqrX0qAjyWSt7ynxCsnZjk+WX4b2bH3wheXSkYO/oUwH5iZS2b+cqjYqImSUVKhNBCLNiPvIEGINk/3bHlG1beUthUgNEbd/jSw/1UabS46ngh3NW5sfnt9D67E/ho/60ZyqR0gXIUxi9BL3Na365ri86RKszZDGNHWAOob2wjPmgzBnRG+w6GrtxqCbmC13fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybDlAc98qDClrjzN4VasFfqowVJkxuKmNLPkbHHwRSk=;
 b=fL9Wy2m4FFGiE7t6DUBhx3JZrZBLJSZt2e9AJkOi/7WygRue6M2pXIkf6Cr50fpc5251qasRnstugBBkhAWwdCfO/zq7jEUGnR8Q/U82u/GzmXOOKRvS2EGDn17uSQI6NOBDDv9NrJq1JtyaaaXa9pm0PZfh1OBKc7GSJBXXtiQNrAZQS/8kiWH89SiQsUQjR/Cl8VmR/vjVmSzkne2BkUM4p0hYuPlkP8OgqOuqLWLXdWoFsa13WK5B/iO4p+PgSpsI3w7BOTLdDuFLKT2svNl/e+UDhk/J5wxsLiJPc6a4kSFUakkC8iOxfbB8zfTL+r1G1nn16wgHFwyj9Q7Cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybDlAc98qDClrjzN4VasFfqowVJkxuKmNLPkbHHwRSk=;
 b=FUiAHSF9w05tKCYs+EiEmi7IlJSPD0igJKwNBeNgp4C+4ZcmtCuEdIiUkTkMvOfgQbYfmI8+ul7NvrZQDikVVd0wuECpL+BsUEQ5n5639ccFzWmJl8C8tS5H9OIsbR6QZXrtzHm9ZREKRIMXDAe70pvDYvSGrC/W3bXVUDrH/EE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:43:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:43:39 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-configparser: Upgrade 5.0.0 -> 5.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8dc846bf-0f75-35c9-a1ee-63521bebe8bb@windriver.com>
Date: Tue, 13 Oct 2020 19:43:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201009103535.31339-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:a03:60::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR07CA0051.namprd07.prod.outlook.com (2603:10b6:a03:60::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 23:43:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e96c458-f962-4479-c89b-08d86fd1cf8e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816622E95FAE2A3673E58BA9F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KjxGrX94V5X+TIgdvXHEdnQWWt75gf8H3OE+emkRhdpUgMGdt4hrh/liJ5tsJJlvWjy2JD7gxHRY88hsxdzBBliU4FiwojZCJG3+Q8eAPacxNuEZ7+uAHQtI++orE3IVqLyq/BCMyHBYrQVvsawYgySRBg3dsRFU2qdKHLz0Uhhbs5qYxWVwIXAw3QOAVopXFFjoqnD9eIiG/fDh/AkYcfgnS3vCMJOGIe0lL1HHbZlmUz8sNkhuTUc+l4pPntWPzUlbA8NFS1hEY1vUcRKkzxklzHy2m1fVVALX/+agEC21FVNrsxOEPfu9v2HzPreCf7uYI+6A9cFvoZRwv5XM+0UOBTNC6CO2tsdlHFQsE9Htlk2pWSv9c4CQBIToUDYxDXG/g10Lgh7BOKSOdht8T7hrZodbq2ETf5NVim3diww+NESyXGxqA41NkIO1x/VQXhzvYkDUwLvZ7a+zwTbDqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	B//vaxCylq/6Qw0l26ejBk2OLkBASFoAmlRQzvw0hReKm9pyIOg5OGLJPr12kU55u+yWHAw/4G7ErMTmXoT9AyG4T90HVMSNk7XwEmP7C0S0g/FOjqvERfop0heu8N7CFsZfkD2vZos8jOF/+TcKHOxSc+l96HnLuvYdrRYaFSBP43vQqj2lnyVAFZfux8Z++ZPy+pi7FGUKZuSg22zhqxnN+Z3w6DPvSDTz6xJ0htEDi/xversRNkA9qpP0/UvwdS1+lzaieE5tGuLfueJEESYqs5RHfkfY1J50GD/3gSsdHEpuLMgLysZ1Olh3RduIb7Z3LNUV0pUdQhoJQCQ4iN9+ThUYh7neCOyqroTzEniKysLhCo0+y1w6J2E463UD4KObFweZxFOgnaW9evtV8ZE2mP1/nnY//+k7EtF0nISis3OQbUenkECOpSSIbXHT1fBna1GGRGV/y92F/cphHUM4cBlQSYwgL5XLM9UGUJOyZB2FOCCppA7GIpyF5lNHtme0S/zQvQQX4573fFdvs/AOiPFGNznO/0O6n/AQxIisD4tj/oCY13DE2XVjV3zgyWQ/yDJ+36+fIbBVjBU+KEE0sPU5z/VnFX8B08dmEiSHsgT4clw1D9oA/NXHaEthUDaizK8Z3K+vBb8mbWHJ4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e96c458-f962-4479-c89b-08d86fd1cf8e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:43:39.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knVWVe7fUEBU/2e839gsHEYcBokcMo8bFoBDOyXHdA3UuDpsnKwTeghP1bAcwO05PIAywAychxNB8DLgtEzAN8Obg73BA/S9/UGBOjYuKfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------DB26DC02805A277FECF4E532"
Content-Language: en-US

--------------DB26DC02805A277FECF4E532
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/20 6:35 AM, Leon Anavi wrote:
> - Synced with Python 3.9.0.
> - Refreshed package metadata.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-configparser_5.0.0.bb => python3-configparser_5.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-configparser_5.0.0.bb => python3-configparser_5.0.1.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
> index 6b2af125fb..b78de58447 100644
> --- a/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
> @@ -5,8 +5,8 @@ LICENSE = "MIT"
>   
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
>   
> -SRC_URI[md5sum] = "558114054aa5610365df1b34d3fea349"
> -SRC_URI[sha256sum] = "2ca44140ee259b5e3d8aaf47c79c36a7ab0d5e94d70bd4105c03ede7a20ea5a1"
> +SRC_URI[md5sum] = "5faf185693cd21d83f6a3bc01b5733fa"
> +SRC_URI[sha256sum] = "005c3b102c96f4be9b8f40dafbd4997db003d07d1caa19f37808be8031475f2a"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
>   inherit pypi setuptools3
>
> 
>

--------------DB26DC02805A277FECF4E532
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/9/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201009103535.31339-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Synced with Python 3.9.0.
- Refreshed package metadata.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201009103535.31339-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-configparser_5.0.0.bb =&gt; python3-configparser_5.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_5.0.0.bb =&gt; python3-configparser_5.0.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
index 6b2af125fb..b78de58447 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
@@ -5,8 +5,8 @@ LICENSE = &quot;MIT&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa">&quot;file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;558114054aa5610365df1b34d3fea349&quot;
-SRC_URI[sha256sum] = &quot;2ca44140ee259b5e3d8aaf47c79c36a7ab0d5e94d70bd4105c03ede7a20ea5a1&quot;
+SRC_URI[md5sum] = &quot;5faf185693cd21d83f6a3bc01b5733fa&quot;
+SRC_URI[sha256sum] = &quot;005c3b102c96f4be9b8f40dafbd4997db003d07d1caa19f37808be8031475f2a&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DB26DC02805A277FECF4E532--
