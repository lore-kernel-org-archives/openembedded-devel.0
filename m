Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.53])
 by mx.groups.io with SMTP id smtpd.web12.15792.1597154724696146735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K8LO+End;
 spf=pass (domain: windriver.com, ip: 40.107.94.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RipJLyoUKeXLTYWeJkzBofCPcvmP7RLCYoPH3nx4eEJyyRtA5A1hxp39kSAPSR6Ru/8SAQlknegdIisnkVwPmjZ7a8Xw+Givi2JVXA3BLqyCf4hDCT/YYurZUO5w0VtYxuqwgUoZgAnMMBejTfly15/Tl6MnYpxwuvptkZ7EpBFNR19wbgnP17gdwd57gYNPXeycQXoGePQYRgnUbaFlfqE7WTtS6Lc0KTzb/ULFYU1p8WCMS8C8KPF3b1i/H4f+LJzIfHO/MhAjVqmWIpq447v51L0QN14cO1+v130+xE3JjQLJAWMZm6xGO/pWBr/wcw1cE52QRLBuULt1YbWXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/z1gGwBpaw0Q4f5Zpd1LbGdZDxVFQzCiJ98JBFBWts=;
 b=ceaJfsGIqyPPh04nKFUcFrTjJhEDHclFggS5KHje3TCoS1mQog7mpaie7r2POQLPBov6FHfQuVy5QGuK4UKtoX3s+3YypMHmfDFvm8Upqbgm3cerR/C9dOOC5PT5XTeA+979JYY/u7PLWsYXOg2N92ORjCz5p/rzROJ8eyIfun1VPian4gHsppBxluwJEWJRuoYNXlRag/5ibTSJbpOeSBOrXCXKikxz3mBmJRAMUjHdkZYaHbZRhDjPmzDcQcqGBzLNKlaUSHaJRPZzz33eaeIMwOGe+rH/LxKyPCEl3TS4qWUn5fgAQgnA89XUaHWDXLMpoxGNzhlNDIBbp44UKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/z1gGwBpaw0Q4f5Zpd1LbGdZDxVFQzCiJ98JBFBWts=;
 b=K8LO+EndmhxbIFIfwI96PS6HCHvvnGtC74klmPlKfe/jSIoRYlP1i5pObkXMGFvyxHr6ukTyn0r6+3daDQEvxce3y8z5G4mbkg9ws50Ao3dXis7kn/u8Lf4HXHJ5UnANAUWQJCgt0VelsVr5pv5eARz8iqss5mNjd7wKmB2IV9M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 11 Aug
 2020 14:05:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:05:23 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-cmd2: Upgrade 1.2.1 -> 1.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
 <20200810144318.17106-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c636e1a5-0f68-c795-6ea4-a6193bf0b195@windriver.com>
Date: Tue, 11 Aug 2020 10:05:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 11 Aug 2020 14:05:22 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41d15d9c-a919-4455-b825-08d83dff96b4
X-MS-TrafficTypeDiagnostic: BYAPR11MB2631:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB263171EBF77A0C5B2A38F5A49F450@BYAPR11MB2631.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xWWsJALXQuPt+AQedwSr6Gw9kV1af64BlACvHYPyXGma/6CsFoRff6Fj0bqf4drv3XUmFAqPt+R8W3yei2gird7j9uKCdbCypoSSFuRCVWqYaUpM9nXZvX09WkgHxxpeHt+JdzrEjZP0Ls1rMBXH29SUyxN3XO2IDlKSk3Id0s0P4TnIDb6fsJyMdmWq5ZIqN8L5OEtJ8AAEFciY/S628DGx5EiMCnc/IYxdsEbkglL9KSJFXpomWL/kOQEs+s6D30xfO9ZmTfcWMuw/jiqyFieo5wQp82Y3gJU076ukBfRmTeWFqTcgH+q6Gio29ov1ySZ9jxg0Ja3Gk+ZZFGa7ihJ6hZgDJUjgpLP4WXs3ki4GULkb8QFQkGQo1a3mVU41OS9omwLw9QjDPKheAUIZUbaQbLQ9kj4hDoor8GyxRLdp3yBWRqsSl+uYSfm4GMRuS5bWxGvPh3G6CgOZ2dNqjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(346002)(366004)(39850400004)(956004)(2906002)(166002)(66556008)(26005)(86362001)(33964004)(53546011)(83380400001)(66946007)(478600001)(8676002)(52116002)(66476007)(31686004)(16526019)(5660300002)(36756003)(6486002)(8936002)(16576012)(31696002)(186003)(966005)(316002)(44832011)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5DwPvK2nhaEUlb7jlIhN7G9tU2R/qACekEZpWw0rZRgQR8rcyYdSjeoMXZylBdWTHN2LIMxU6m+m0fGCr9g+wrRPgZX0uvYlBPNZf/6elzYWvOdHryWFBZriU7E92tmuFYUUi1SXcSDjpTSfh6ZMXN4HM2JXb9LHdBMNeoIaBTGl1SSLKcETys6zGesM+w0WK5eKnVF9ubQEVVVDasvQyXj7coKOQcAimaM9stbNWpFJsobeMY/cw6lb7ceAQ8IvdoOmntx7kOrEjKGmUxgbE4CN9lt7Lxq1J4gDgyhyQSMIIZvRdA/Os3Hk9Pm9gxYdGccIPTy/pThZy1kr+MkaDXtqhuMrylZ5ZBThx5swMmVN6qcgwrJSbWLXQ/dBkIpZZ6xkWMAzd5OjJjIhLQeQCDZCKpRSVRSkmu70pQe5YsgjD7OBE0XQOBOVT4e/Rea4oazmaBvACK3nMDdiYm5D1cIgHOPRegnb8DcXO9Yz+KTmsMCRdxlEo8+vRPkgXmGp6d5PIb1sJPt8a3lP27xPzJYIFwGBOB+bf3UUBNViJBP8BSm+CkiVGc/dKcVHQUo32tGvKXqgtawxq23mdPqeeW6ThNc5aT8Vx7M2mP2aUcnXBRN/h0ns9B6OskSaZan+v8MGX1rBP98ozY+4EFe52A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d15d9c-a919-4455-b825-08d83dff96b4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:05:22.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kddyWkVmLPujYvKCX3i4pf/MoPNNjfTSYIbJgqHb0ytt9o2CRxhNOZ3j608rvb6mbRPsD873nVN1sh6Ai2wmGFC3VWmyKYAlyX75upF34/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
Content-Type: multipart/alternative;
 boundary="------------C92BDED7F670BFD09DCA056D"
Content-Language: en-US

--------------C92BDED7F670BFD09DCA056D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 1.3.1:
>
> - Fixed issue determining whether an argparse completer function
>    required a reference to a containing CommandSet. Also resolves
>    issues determining the correct CommandSet instance when calling
>    the argparse argument completer function. Manifested as a
>    TypeError when using cmd2.Cmd.path_complete as a completer for
>    an argparse-based command defined in a CommandSet.
> - Added CommandSet - Enables defining a separate loadable module
>    of commands to register/unregister with your cmd2 application.
> - Marked with_argparser_and_unknown_args pending deprecation and
>    consolidated implementation into with_argparser
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.2.1.bb => python3-cmd2_1.3.1.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.2.1.bb => python3-cmd2_1.3.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
> index cb52ecfbb..15b10d0f5 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "0ab5f4d8ad6a9099202ed887358102f2"
> -SRC_URI[sha256sum] = "5a5d3361fadada16cae0c99b65eba5d49d587fc2e02b3afb058da1872871e7a9"
> +SRC_URI[md5sum] = "9f0af0810da98a30ac92f1e4e7a8c8ab"
> +SRC_URI[sha256sum] = "c86f3b8348798732759c9d53cbcb6258a8f21f60c1a1268e942d24c9dc50b4c6"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------C92BDED7F670BFD09DCA056D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/20 10:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200810144318.17106-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.1:

- Fixed issue determining whether an argparse completer function
  required a reference to a containing CommandSet. Also resolves
  issues determining the correct CommandSet instance when calling
  the argparse argument completer function. Manifested as a
  TypeError when using cmd2.Cmd.path_complete as a completer for
  an argparse-based command defined in a CommandSet.
- Added CommandSet - Enables defining a separate loadable module
  of commands to register/unregister with your cmd2 application.
- Marked with_argparser_and_unknown_args pending deprecation and
  consolidated implementation into with_argparser

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.2.1.bb =&gt; python3-cmd2_1.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.2.1.bb =&gt; python3-cmd2_1.3.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
index cb52ecfbb..15b10d0f5 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;0ab5f4d8ad6a9099202ed887358102f2&quot;
-SRC_URI[sha256sum] = &quot;5a5d3361fadada16cae0c99b65eba5d49d587fc2e02b3afb058da1872871e7a9&quot;
+SRC_URI[md5sum] = &quot;9f0af0810da98a30ac92f1e4e7a8c8ab&quot;
+SRC_URI[sha256sum] = &quot;c86f3b8348798732759c9d53cbcb6258a8f21f60c1a1268e942d24c9dc50b4c6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C92BDED7F670BFD09DCA056D--
