Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.47])
 by mx.groups.io with SMTP id smtpd.web12.9990.1590847610802295649
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 07:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iqUDAetk;
 spf=pass (domain: windriver.com, ip: 40.107.93.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVJ+OHsKGVMNc7vr76QGxizfGQ/0WYdm0+5wV0YNSlZCN7hJbnHW9G4CXkitcMEo20hq7/GOKMp1GnpcspmXfxhE9l/YQPXXPUnJ/SN54uQRktqFbsJAUdFfI/cojaFTNV3tFCXo81Z32747puGwu1G8OaeN5rdhi/AOEwdBr4FBPotRVKR88v2twXqV+iYt0C/+WJJffJaTyt50Z0fkmc0XIXbIAck0AxYScS1EVsmM7yzlwEM9glp4terQcIkSfWQ1/fDG7zoLY8WFLoAdJrjBnO+pfZQBqHTVyfFdsNZrSjDruOSf5WbELNjC36xQ64cyTdeoQlTZEUlzO0cBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1dfQqOhWFjG64lJrfSma0OrEuGLUFfqez9V+Y9gkwc=;
 b=ci9KSy3A5WvtPSb4XBRlzyMc/N3xBqTLXo043U0O76d+uKBOoF9safHeNm9gEfIi75oTwJG0llZBPlH2S8W7kOOlHk31q16ovbMrL5eSSM1V6o431ucBN2GMhCYJcEnY4zV9L+hHlDfYdW1KLyOBYIq0ovmnMZXX6ZKuJaU4vezEglfi71SrzgbjseDNicTKel/wxClsBNjpQaEPNBp0inwTJhzsAdLSqqjfrnz4a/7zKGk+0vSkTcQ5gSOm6aa5RqGg5y/Q7eDpBz3gYE0XYsRmM1PuCRYgyvcV/ntbF6CSnnGPQ8PKyP1j4dnTg65woiCZGhbaz4wz/2dugvlJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1dfQqOhWFjG64lJrfSma0OrEuGLUFfqez9V+Y9gkwc=;
 b=iqUDAetkzt+r/hY34xWuVPSGDxlVTVhfYxNkJdrXCcsrIN0DtKAu6gTvdPKXFJMdzIWiK3PstjRCT0YCVKXr9fmOi70f7Fr0cjhLWEMYwBbvfmhFWprkFuW/O8PKt3MHbo5kYMDAPa2AkXWMwEm7eYK7FdIq/DflYAXPwgBQgHg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1521.namprd11.prod.outlook.com (2603:10b6:405:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Sat, 30 May
 2020 14:06:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Sat, 30 May 2020
 14:06:48 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-colorama: Upgrade 0.4.1 -> 0.4.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200528143610.30650-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <764ee1da-0571-c8d6-c5c9-fd802057166e@windriver.com>
Date: Sat, 30 May 2020 10:06:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200528143610.30650-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Sat, 30 May 2020 14:06:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed1a84a6-af62-4c59-2883-08d804a2b15f
X-MS-TrafficTypeDiagnostic: BN6PR11MB1521:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB15218E6CF0D28295354B86679F8C0@BN6PR11MB1521.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041963B986
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jnIWwBTCjl6N3VgSQBMf01TkuqqzgZ7Hxu3t7tXrfGPsDCjzM75Dyxmmz3Qff4gWXOWWTO87JREY8/7sDLiJKyXG++4QuOCfAuV0IRmC3Qvo1xdU13nzUD4pHR6T2Z+2xuBLFP70GcBjm3mum0dzdQecCj9Yp/k49xMb7BzlxG++8EH3rGxWMfNsdial+WFxFAWODdV8ey7o2E7ZPbTFJdGGHjw4xi7BB3nYr//C+djPhE8qg91bzx7dkQQEvPOY2WqJm8adgljARGubCvZBs/rBXABnw6JLbVhgLFGxPch/qDv+nl8PUj8IOC7nZ0RpxquYwKD/7NsgRFH+nIA8SV1tClqbDTwVJSG3eftjXDrwzRjcc0HP5/ve4YrOUIDqbf3hxwQ7C09TGeEHkC4zvz7HAXzWamVclSR9hixVHF/tws8en6UUo5mZtYTZkr48/F8fXIzFE6HPDSjh7s/vdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(376002)(136003)(346002)(2906002)(66476007)(66556008)(2616005)(956004)(8936002)(36756003)(83380400001)(8676002)(44832011)(5660300002)(478600001)(966005)(31696002)(6486002)(66946007)(86362001)(166002)(33964004)(16576012)(52116002)(186003)(16526019)(31686004)(316002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+I6PqxHLFOlTCKjcyftW7IfEHUq95Au+O+yvgp8h6Vm6igKor88cp1efhtmn4yrzkRe/DoQnA0NPsYiCw8d6vGj6kgkdXfuIVndHwbwoLTxuoToBLPHqjZNtfcAIz5VZdN+o6E45QbSl/jUnUIWBYNTMcyell/HQkyLIaTr223mvmL0Q+fI1i/VQZ82R6I9L9lyb/Mlj2sE4f5m/wSFHWP9yfby0spJB/4AeP20K/BXNpN/dH7usX7aFI1gLMnzfx3wB1VRLyOPnMRWfEzEo2vYqwmEQKoBRr9R+WPCzW0jKBUS+oqyucL1GkP+dlW7ujlv2UG4x74FdUnid+LR35LwecJPkpeOYKZkiTlzQACSUuqui+nx+zMLxXWcqkVNNtuz03d+kWorx5YsRIrLxzvBbmWgIjYFmmgSyC5T/wxcqzVaQWR29zwoGkAd55lnsCuaaTOBylggps1fXsiB/EIrkY9WT2gLvXJSdKvDt97s=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1a84a6-af62-4c59-2883-08d804a2b15f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 14:06:48.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRjejRTMJ5ZfZ45UlA8RB5xrMLcpxw4LkdzkQJCgHNbmy0lxvSUcHoMNZ3Ejvj+d8KvgXzvpaTrxSVKdgXSrASjQ6NSmpBnax92LgLUyRhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1521
Content-Type: multipart/alternative;
 boundary="------------6A7DBEE9C4634867BA92E425"
Content-Language: en-US

--------------6A7DBEE9C4634867BA92E425
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/28/20 10:36 AM, Leon Anavi wrote:
> Upgrade to release 0.4.3.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> index 9cfca094e..7a3f533f2 100644
> --- a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
> -SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
> +SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
> +SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
>   
>
> 

--------------6A7DBEE9C4634867BA92E425
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/28/20 10:36 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200528143610.30650-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.4.3.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200528143610.30650-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-colorama_0.4.1.bb =&gt; python3-colorama_0.4.3.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb =&gt; python3-colorama_0.4.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
index 9cfca094e..7a3f533f2 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
@@ -5,6 &#43;5,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26">&quot;file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;f927529cd1735f6f50ee2c61628e9c1f&quot;
-SRC_URI[sha256sum] = &quot;05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d&quot;
&#43;SRC_URI[md5sum] = &quot;02daee502863d24112a8c05a5d69a612&quot;
&#43;SRC_URI[sha256sum] = &quot;e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6A7DBEE9C4634867BA92E425--
