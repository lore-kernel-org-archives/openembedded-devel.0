Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.51])
 by mx.groups.io with SMTP id smtpd.web11.1281.1603410228109381387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M5nzmUsH;
 spf=pass (domain: windriver.com, ip: 40.107.77.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjLjPljE3tNJkORJHNGhW5YlD1tGWcnFihQI8ZHtJahQTuh4hu/yCxnKuUt4oirLuM3763ZMIT4sw5u+Alu5fxVncfvW3TrZbUz9t6IYn46Z7DpEuWkpMS7yI/rxLRvTsSv0yZVkdVpHKNRDmeevUNmM64APi14rTW/9UVlVK2HJ3F3TXqjhU2qnGRfxlZeMaAjtZsyUlcO4mX1aSkkJOrEyZrJ71mkeiGiPnJ4F+S1/fdY6QRtIYa/R8DEz3ZAl9NgSvxsSr6MiTvCVSx9nswMYJiPtMPluTbHvMZbMsdqPDp/rRudH7YSMHsQY7zYG/zIyqm7IDOqVlyrsb59SWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u38HZAOrYL10zXW0KA2YRf5dChsxWmlvkvZEmyy1DEo=;
 b=LRVOMu8ZhM210Lf//ZtO3R8zITs8vZIUbkxAWy0q3P0lxVpwuXaolYMyk+l9nj4xp3G36pE51p+HAeCy9ZLn8+7kO1SG2zz3F6NzZg7yaWDdjuc87wIwSKdK0hfxaEM19UL+HE988QNzsnlx3Eo6GpIiA/K6mGzNnGwiZy7wrO0xwRbuYveRag5UGfDaFdFcI9M86ISyNm9Pa5E+12d6Tbkl38B7bNeQHwP7moFx4LfC2Sro3oH/olwc/Osc+cjvLAfvFwxFcf0PnMUHJ5QHpwhmuY0Y8PZQSsueFVXDVkNqjvyg74s1Je/vH/MHtdsmd6T57VO28qA/Ct4Po8yDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u38HZAOrYL10zXW0KA2YRf5dChsxWmlvkvZEmyy1DEo=;
 b=M5nzmUsH8oYu00SEI6ooHV3mNyab2U+ylh+LMZn0EKv9IQItk6ExwO5W2LLeA+PqippT+rEo0dXhyu/LdcrV8bGho9FBgRSiiYWJif8CY6ebAsf3YHomME4v8aJ2mzevaBQl6GLGP+RvRzIoz110c06/SA621sAT45pyqBZ0+L4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:43:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:43:47 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pychromecast: Upgrade 7.5.0 -> 7.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021082530.10132-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e240ebec-4ad6-d9e7-c8ec-230e39f4dcea@windriver.com>
Date: Thu, 22 Oct 2020 19:43:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021082530.10132-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR03CA0017.namprd03.prod.outlook.com (2603:10b6:a03:1e0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:43:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c43fb9fe-a012-41ab-c737-08d876e451bd
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896AC06D848D9B33132841A9F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uqdW5n+hDXCIsEPbSViUDquNowfIKRs81/sspTS9zJNpHtALM5GsDNKOyX6Zx2lOWtC7dnK9VnLattpioBPrTPRL+Avy5WEDTugq/nGDazMqv4vKoCIBU2klGZxZb2yLfL4lwXezqpiShIICUiXCXwnUsjvqsTjH7vYO3o38DH1e9kHj+ONYR3Sn4vtlrc1a27DjBuvRLmuihglaIwC3RrG43ikF9eu+GGL6Rmn1OQy4tML5GfUJge1Xt4vYupZIcfK40/NUnUSDhTqOUWMtO11vx3hab8cS/T2pK0dIRK3bsHeBuobgY+YtHE0lwnSokToNBRkhH9wYtnvgqy+HLYEF0YKY0HGGcbIyTj9PvS/7xGIWx/PnZK+pJYhkcT2+qVaWYCNaXt6t1f6P10TXY816FEvC7sw3ZdC8TTGDegW1Fsuw8uLKfZ+JHpgYV/5maO1LePnGsbDxjBbRybX3Sg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kAvjpmbRP04V8dCewIE/l8XL1uBiCetXct9fAWmxfq7WfyAjWZFW0D6V4BPnCvaaBrZ0l7Oa3qaMIkZITVQI8bW2nAfwGKf2sCXNEq5K5PP7hl7jw5KcnrFx++CQMQK+MAghi2HQuQIOE+jY4FMJaZvCHyi2v/z/uIGz3YnDLYq64Z9NbOvYosQ+9QD004FqO54DHxN0XgnKJ3hGJCHzpBnFWJmVgY7UzHweJnGEisv3UvET4zau/jRo5eB4DKhl7U3xRjVQI8MSwI65qmcxCOpdsBUuMmp+eg45sM5NvvMEV59qnl+FSGTzYzU9SZK9rxAYs8pN/5mU6HjMtd3rWwF1eTSWhMQHxUq1+gWQxfLV5jTw6UtqSUYYKBLRt7QyQHoFIS2rE7NGfZrL0WF1WVW5gx+drW0uQaHCONBmk6rBQlg+hT2sUxShXz9AzPIHiu9fCJ+ZYTaqKanVMfjmhD8xUUixW6X3Lattq3XNkFEJ779seRKcx8DDqnQi0MAWJt0WjQPaZMV3Ro/GqP/sJWex0cf5OJ7SZp3g1DbC0z7zRo4SJZUl6I6GJX9HbldSjnnE9OmkXncM/1kIA8H9LtuZqP5lxW3el7keXjSfnS8YcVufKZ7WBokf7iDC0sKgsNbDt0z+mkHSQ/U9OJ3uWA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43fb9fe-a012-41ab-c737-08d876e451bd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:43:47.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fg/NKQZZ6JGi7B0UyOmfGTCr5UUgNwjZggHnq1tY1c79TMv+dIAmAHd2Pw8FZwdWIGBPYLkNR5rnKoQ+JIcM6MJ4vsolj3TkPoEyuWA+xUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------1D46F419282CBDF2E0B4D8F9"
Content-Language: en-US

--------------1D46F419282CBDF2E0B4D8F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 4:25 AM, Leon Anavi wrote:
> - Use threading.Thread.is_alive
> - Bump flake8 from 3.8.3 to 3.8.4
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.5.0.bb => python3-pychromecast_7.5.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.5.0.bb => python3-pychromecast_7.5.1.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
> index adfdbb17b8..b7796251ec 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "d35c610f57cae909348ff6c60e5e9256"
> -SRC_URI[sha256sum] = "2f346a88ddc27a19cc68bc2d3e8929d89276298cb1c11871b82a87fbdafb95a8"
> +SRC_URI[md5sum] = "9dee7207b7a5c73ebf8fad64be137f27"
> +SRC_URI[sha256sum] = "cf2e9fa795ea1e9d0d180adfbdccefd6b4f532eae56f41f15d1a75b323096f51"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 
>

--------------1D46F419282CBDF2E0B4D8F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 4:25 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021082530.10132-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Use threading.Thread.is_alive
- Bump flake8 from 3.8.3 to 3.8.4

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021082530.10132-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.5.0.bb =&gt; python3-pychromecast_7.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.5.0.bb =&gt; python3-pychromecast_7.5.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
index adfdbb17b8..b7796251ec 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;d35c610f57cae909348ff6c60e5e9256&quot;
-SRC_URI[sha256sum] = &quot;2f346a88ddc27a19cc68bc2d3e8929d89276298cb1c11871b82a87fbdafb95a8&quot;
+SRC_URI[md5sum] = &quot;9dee7207b7a5c73ebf8fad64be137f27&quot;
+SRC_URI[sha256sum] = &quot;cf2e9fa795ea1e9d0d180adfbdccefd6b4f532eae56f41f15d1a75b323096f51&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1D46F419282CBDF2E0B4D8F9--
