Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.77])
 by mx.groups.io with SMTP id smtpd.web11.137.1591377894993910306
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NJHhg11g;
 spf=pass (domain: windriver.com, ip: 40.107.92.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X03pizJSnvnZ2fydf0jaMefPIC9eq6FD4TYE/hMh2k8rpRW5kGtrP+bxT9xm7K143lvaiBpW+NsE1W82Gi43jpkFnBWbqnTBu5umY+DDtFJQTK0zMZc61K5/evIaLgpPFf51DU7hR733dSV78KINwb7umphHGNT4ke+q8A2X6K9DAZeoyfLJedxxopJwDdMIO2hfmyxRTZT4kI5gl7PndpxtzYse/lb3jOAXDd3oOd3E/OY396Q2Lsu+ZgSJl7yLkdmcqym2X6kCN7x8qz3jpwqEhCbgUl3Vzjl6cseMWyshr9vAGiGgL+jTqF15yGtIkWK3tek10RQWccwqC8EjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeFkzpRUGR7r0WGuLVIx0JcpM3IuT3mtC7JQnd8AXqc=;
 b=gsDMyQOPp81WR2TEM0RfT+XuT7a3QgO/yjxCAbLYxSMJSLiFB9QTzTStt77JH0zW4Sz4UiIBplrK3Z4WIsZCSVwda8/19HNOguaDpZgeOU++nB913+kACBXrmeT6M422C60lMO0WPerXc1neGmH1FeK4SnGZrJ9qByjj1ATCnBqRxTLyqzu8fMF/LVvwXYzHvnGLuo1LxNJ66sBkEa5X+4tG+c4IU1x5AQiqvAN63P1v64/NW6S+2yf/yMrMbs8Q5v73G0KtOch8SXYayEl9GoFby94vziW4lBIDGdxKzM44JLWJsK7aO6DlU4KUuYL7N2rW/ZY1gHgAj/hPz0iUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeFkzpRUGR7r0WGuLVIx0JcpM3IuT3mtC7JQnd8AXqc=;
 b=NJHhg11gft93TeuXjaAij+doEFNUZ9uLqdcxAIlaFxSl1j52xFL/byR03p9nhaPBPgLrfRi7J2QWK83euc8pumrEJSz3yN3owlPrW5bQpGri0cwBPGssNZwchgAZQD9YG9NZ7EBEc6cTKLsPdW6xEgnW9nlIs94RUb5xz/ArJcw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 17:24:53 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:24:53 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-editor: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200603134232.22336-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <934668b1-9c56-19ff-ccba-c56fe0dc22f4@windriver.com>
Date: Fri, 5 Jun 2020 13:24:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200603134232.22336-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:24:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d16ba5-478c-4e3b-db49-08d809755c21
X-MS-TrafficTypeDiagnostic: BN6PR11MB1908:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB190840E81CCDA534B189A70F9F860@BN6PR11MB1908.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TnhLtvgbvUT8VSvJ3WFypM4CJzjEdGPFVTRrm6+vQoI686S3GqKyEfgARecO9EoemWFGz01ISFZ6D/c8V6Zh4nIPQOfX0WiooERcMP1tY9kslE42K0AOM5P+X8lXRYCsoAd6nuqjz4DrsP9xcFZEeIXWehiBpSCSkRhB0xN7o0O5yovYiIA9yTpZgObDX/sGap3qC1fS7ITdjZFG0Q9SgofXPq6l7cSs/ICaWJYhm9SZP62yxaglUrQUPueUrMHHS6O+Lc2FAVmlAw8LYmQTMRzlUlpdESbaiZl/0EJ620HV2/bkOIG4QqsQbvpP38iUA4kFb++KzrMFQfNIsIb5jgdQe4DBLsl37rQJ8zgie3D7y2mz5KAsb/MRsLN0fcQAE9nhZ1sEtEGenApRKBX9Jm/8zgzJu9GIJbs+/FDhD9npwtr+wJLaTMKwxeeS0JkGvZtO2ZFhuJvcIecEqre0tA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(396003)(366004)(44832011)(8676002)(31686004)(53546011)(2616005)(66476007)(66556008)(186003)(16526019)(956004)(66946007)(2906002)(16576012)(26005)(36756003)(316002)(33964004)(31696002)(966005)(478600001)(8936002)(5660300002)(52116002)(166002)(6486002)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CV9wnP8Ph7xmTxCWa+LTWs8hafn9LmyPblzrQ6abMAzZxuyhwr3XEVN8CnRaQLrS2CSx9NHuQPVk8KoWGEPG26m/u54y0CUrVR2j0khf0LDK8D17pGvaykStsLM6hm5Vy1AuXBFiJ0RwOcfUyM7FtfgDuSUqkvRh2VNmo71gjt5ZDlYmUwQD7PJJ11O5cQQmWAs+asqgCyfVVycJdmvkVJZzflm+GY3eIOkRXckKryzN3c34O6YC7Phre8Ya/hZzT9KT/zrOgBnNj1M0VX6lgFmn3FNwVbzMKSbyBRGK19WZJK59bWwWKCA+XCFOQV451qYJo+JV7tCUKikwn0LgyHhIzqoHCA7qLCZMjw/i/amE1sxmJLbR7srrmUjf5GbMF0ck89E83bqhinySBo8YE1XR+y2TFijc9W71/PJo6xo9TyE+lBV7gTOzaDLnG9xZLHjcybucRFtp+BDOPPOL7aFNUxa4rj/sWPOqR1PKRFk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d16ba5-478c-4e3b-db49-08d809755c21
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:24:53.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtiFTIU48EZ8TvvsacCls/hpXwGIlr81jt2HVzymhST8wMpgDm85VIUwQOFXarSuHLkECkIggk2kmnmL9kitkYUzC+2eGFvNjJVWEvu8iPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Content-Type: multipart/alternative;
 boundary="------------3B36FF3F36AFAE2FFDB83499"
Content-Language: en-US

--------------3B36FF3F36AFAE2FFDB83499
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/20 9:42 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-editor.inc  |  9 ---------
>   .../recipes-devtools/python/python3-editor_1.0.4.bb    | 10 +++++++++-
>   2 files changed, 9 insertions(+), 10 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-editor.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-editor.inc b/meta-python/recipes-devtools/python/python-editor.inc
> deleted file mode 100644
> index 734ce2bd7..000000000
> --- a/meta-python/recipes-devtools/python/python-editor.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -DESCRIPTION = "Programmatically open and editor, capture the result"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> -
> -SRC_URI[md5sum] = "0e52648a4a6e7c89e3be44e9456530b4"
> -SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
> -
> -PYPI_PACKAGE = "python-editor"
> -
> diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
> index 8ad2b869d..c7a6cd8f0 100644
> --- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
> @@ -1,2 +1,10 @@
> +DESCRIPTION = "Programmatically open and editor, capture the result"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +
> +SRC_URI[md5sum] = "0e52648a4a6e7c89e3be44e9456530b4"
> +SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
> +
> +PYPI_PACKAGE = "python-editor"
> +
>   inherit pypi setuptools3
> -require python-editor.inc
>
> 

--------------3B36FF3F36AFAE2FFDB83499
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/20 9:42 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200603134232.22336-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200603134232.22336-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-editor.inc  |  9 ---------
 .../recipes-devtools/python/python3-editor_1.0.4.bb    | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 9 insertions(&#43;), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-editor.inc

diff --git a/meta-python/recipes-devtools/python/python-editor.inc b/meta-python/recipes-devtools/python/python-editor.inc
deleted file mode 100644
index 734ce2bd7..000000000
--- a/meta-python/recipes-devtools/python/python-editor.inc
&#43;&#43;&#43; /dev/null
@@ -1,9 &#43;0,0 @@
-DESCRIPTION = &quot;Programmatically open and editor, capture the result&quot;
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314">&quot;file://LICENSE;md5=d2794c0df5b907fdace235a619d80314&quot;</a>
-
-SRC_URI[md5sum] = &quot;0e52648a4a6e7c89e3be44e9456530b4&quot;
-SRC_URI[sha256sum] = &quot;51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b&quot;
-
-PYPI_PACKAGE = &quot;python-editor&quot;
-
diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index 8ad2b869d..c7a6cd8f0 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -1,2 &#43;1,10 @@
&#43;DESCRIPTION = &quot;Programmatically open and editor, capture the result&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314">&quot;file://LICENSE;md5=d2794c0df5b907fdace235a619d80314&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;0e52648a4a6e7c89e3be44e9456530b4&quot;
&#43;SRC_URI[sha256sum] = &quot;51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;python-editor&quot;
&#43;
 inherit pypi setuptools3
-require python-editor.inc
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3B36FF3F36AFAE2FFDB83499--
