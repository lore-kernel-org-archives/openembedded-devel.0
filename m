Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.73])
 by mx.groups.io with SMTP id smtpd.web11.14666.1600179985016859096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m64FlOk5;
 spf=pass (domain: windriver.com, ip: 40.107.236.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR+3ECTb/4Q8fRStavXEQRBNvC8RcGoa/ysM9oozk/65FgCPtQN+UlVC4QfYiiL2ye1lrEn+UgL1/5gQc6Wa6pcLgr/INTWL4ZCKnbFMkEfJ9ZRgAoPl+dsEeU4WG8LVbyjl9x1zJ7Sg/BSg//8KsAUNgYY9+xGX6G3Rg8aXJOwIkKGzuv22p92UaYuHfaQEXu50fcDlUwqYpw7YPUYmjZmgJixG6GG9qg50XLD2U0a/ALLrwQKpMyNCaoNaUj74Ist68rQdyrGWzhDktuCb/J8/r3EkGiVH6P3NK3RGboN+Dr1bGU73Zw+yXRrBWLI4E/CrmTGfX8IL/xZ6wbtwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RO6E8tG/fUpBn/wdfJeHJjDgpSFVPygyZeOWRzCUB/Y=;
 b=Po79qsq1CMV80rWSxSLd+4lCwyVNSpFmB8yKqb7/TVQORJEfvX9rDUE5cRE4FRUG7SV4U6H2M+j7xAS20/MdE4lr9bK4rkYiMNNxl+fVF9IGNM1f/pINEUCAvF2N30GP4sZZ0twAmbsmmmH63EeqgCFSI62pAFR4pcKgl6gw4LtUgR44Y1yOeIpwl6reEU7H7n6v9OP3eauHTBYSFe7kRVsdhEOdBNblH/Fqxei6KueFgUwY2y/UvcCSppujP3B1dkvMxX1TqnNJnQNOxpcejzpyb/X82Y0VzcjhPsTSJDKKSpQ8pnn9UW7O4cRTkxj6yTdfOv3HUi2Js+xnHti0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RO6E8tG/fUpBn/wdfJeHJjDgpSFVPygyZeOWRzCUB/Y=;
 b=m64FlOk53K+dcIpJHmCJjDa+6ttfQetvm8s6aT8NSeW81NpNcaG81HXE/7y9LWCzvx1u/ks2JbTQUeBpJByBxk1sgjtiQBcA4+07KEowv5M7Ls4iBABnobWoq4pxh9TMDh7ElAAAFBmru0psdfaMuApX8+lAH2CYMoqpBKBxRsc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:26:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:26:23 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-iso8601: Upgrade 0.1.12 -> 0.1.13
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <75412d14-8f65-444f-1ec7-b94e63865662@windriver.com>
Date: Tue, 15 Sep 2020 10:26:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0135.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend Transport; Tue, 15 Sep 2020 14:26:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d83c05ab-0b22-42ce-94e2-08d859835288
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376799995CABAFBAA24E0E969F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5echrFGqEUpGf1K1zh0QDBiSgV75JTRu5Il2/x3/+iPEDZDsFkKa+cmZQ47orRtQH3Q71PWs3sqCVAj9xtdgG5K7sU++CLjqMUZZ51XEq2IAvjJN2Px08nl6XEaMoSsQljj+x430PT1OBpO6uIPBX0j/bln6A4wyP80tNo0j2UxWnIUDdnMeuTHPXdGU0/7U4qkdXJXVdxk5D65qPE9gh+Dbp0+yZMWbUolSHSA7NrNbNK5UWLUJIYnm53D3dmPgLgTEMnAXBB4ag5pysCGzg0D+Bw96qbgm2M3ahRGmzvQCWk6yMJ8Brvy7BP9huMhLdbydBFn4CLysdDK60F1fwtk8++9GhBNnEotI6bWlRHfF0AR+yfp84McFwtxLtDtEoyXSVowT7bh9t9aapeDLUIM/i7eSAe5+mJNfWkEWq5IFp9Ajdm5nQcEPG0Y12vQ8jNl2sTfFtjBwLeqnt0M6mw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	scVrlQN7T1IF2s/wImwTr3RbIzrQJzHa4ipahoG0m7+s6b38GmqmGoWVWQWbJV5eXW/ZMuyOX73XFBI7bkzr7GRGCtZ9SfTqtIrcYkUTKiSQLzZU4sUziSK47ayc7NvJ8id0mL7/5ubCjV/QlcrQ+EQ8rOk5nuZGxzs/WznodDQ2NZOdFKXxgNzipMZXOO+o+qgYlrTY2Q8cNdBjMH//Jg1BzNCapVX7cMSTa4rc6WUmU10UUCPhh0ReNC40cKAPk0sOF6rltrjAGx/M6AL0IWblMqtvTLDWykiZDDCzDLDYMpdTf1xTI7kbkO7I3hqbs8NFvV8FXyWp3okYN6aAnVujYX0z8JLi7CzIhNn0jGMa2URHHnNUPbfioitRfupMeQ1rbgz6m6iSHeB4C/nUfo5hqkfbAEE/1Sp1CeHuMrNh7s6otWGHgBZ9uCVyS4hiSakwrn9UeG+g2wRF5av7ioESfrLigiOEshNpU6y04KzA8MJAQeEX2YKiSMZPHi+fEMTvzwt2s1NOZ3Y4xfj2ESzGgg3jcXCN7YQmhwb+psYJUfVqpSFNEFt/TS/POis2oVfAFUl8th359Mwuvjo97rHrga71e2r5F9nH18dic2fpXhS0UrHUnkty8vF+3L/0BHz8sUXzNiv2/qQj3TaaVw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83c05ab-0b22-42ce-94e2-08d859835288
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:26:23.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPPTLbtLShpF3MX/4BFOVo/ZZCXnaWbu/zN4/bWnPHNqa9P7QxU9k8zjQm7TeTbkaveMVOVo1z7WD0Hfc1zw3N98uepml1CP9vtyx9al8GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------953ECB365D57478C4C464892"
Content-Language: en-US

--------------953ECB365D57478C4C464892
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 0.1.13:
>
> - Move project source code to GitHub
> - Remove python 2.6, 3.2, 3.3 and 3.4 from tests
> - Add python 3.7 and 3.8 to tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-iso8601_0.1.12.bb => python3-iso8601_0.1.13.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.12.bb => python3-iso8601_0.1.13.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
> rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
> index 74b5bdcb8..9e7494b3e 100644
> --- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
>   
> -SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
> -SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
> +SRC_URI[md5sum] = "df6e924305fd799d90be63336b2ab8b3"
> +SRC_URI[sha256sum] = "f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------953ECB365D57478C4C464892
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.1.13:

- Move project source code to GitHub
- Remove python 2.6, 3.2, 3.3 and 3.4 from tests
- Add python 3.7 and 3.8 to tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-iso8601_0.1.12.bb =&gt; python3-iso8601_0.1.13.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.12.bb =&gt; python3-iso8601_0.1.13.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
index 74b5bdcb8..9e7494b3e 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyiso8601.readthedocs.org/">&quot;http://pyiso8601.readthedocs.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844">&quot;file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844&quot;</a>
 
-SRC_URI[md5sum] = &quot;4de940f691c5ea759fb254384c8ddcf6&quot;
-SRC_URI[sha256sum] = &quot;49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82&quot;
+SRC_URI[md5sum] = &quot;df6e924305fd799d90be63336b2ab8b3&quot;
+SRC_URI[sha256sum] = &quot;f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------953ECB365D57478C4C464892--
