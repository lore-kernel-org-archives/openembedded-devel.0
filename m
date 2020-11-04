Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.74])
 by mx.groups.io with SMTP id smtpd.web12.14002.1604501293911713623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PwrrQjb7;
 spf=pass (domain: windriver.com, ip: 40.107.92.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZKQLC7nwSFY0Wens1MzVb8i+tdfDTbCiiNL40XGSQ+wDBkqyVfl7IBq1q+HEEROTr8pOTn23zBPACEScApIhguzZEoE3rkQ2XS8qnizWHzq4nQCZUGruvkeoMPX6D04NBWs57UocgYfM+jMbMzR0wXRty3d/y5UScsGh6mh25rrTedqMOyoWBSl9H1wsQB3A0RBfic9+yromUGZZFuRNbyP+C+njAN6z9brjO+Dm6Yn0MESnJxbmnW9y10n846UdoR8Ybl499K+X+QbMj5cRyB+ZHNx2HjuCRt2v73ORg7IolhFv/h/2QfrDgYSZgkg9llVr+HCjWcWLboldjpgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LACFdDJ+nf0yB0ew2mW4UspgXIw/9bOSxuAbVqPXRlM=;
 b=V4AQpbMdSRr3hgA/mHXzTEXWDQuNCO8efPFzWz1Hx0EG/VezXtwmPU8sJLdvBgpSulNNRhhDVvJ0WifBXr4TOUz30UPn/bQHANldmvP/eogGGn1PW8M++UxlwtSWI17hTnHTf+sBQ+lap8hHAgzF4MoC4h87fDKO2QmhAxaDDMrjn1kD43iAV0gCXhnzLtwyOc6tVA0MO4S5um1tWFam1Fzv7zKzbwjACwj8jRg4TmiUNaltRlJAFlPuow+eaYVd1lIOFcgJ3zPLIDkVUvI8mVjpGXLeUglCs3cV3e84BpIK40pFcZ3KzBIVYN40f05aXD6enLpVT4DG4izdPnUvNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LACFdDJ+nf0yB0ew2mW4UspgXIw/9bOSxuAbVqPXRlM=;
 b=PwrrQjb7u9OETtQtXCaj19yEKlno/8U+fPZ44OAZsjjxa9aGW62N+G4Rh0l71eOfjTISfERhPucwWgKjJY4PogrwMxm7Szbs11vxVAfy3D6shjah5Sj7CwHQylv0A/bjVhVpknb7M9xhy5Ec55XGPzEo09dMrUGtMCaWqxtBU/Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:48:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:48:10 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-tornado: Upgrade 6.0.4 -> 6.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201102100303.2377-1-leon.anavi@konsulko.com>
 <20201102100303.2377-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ff81af24-3214-08cd-d8da-20210784b00f@windriver.com>
Date: Wed, 4 Nov 2020 09:48:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201102100303.2377-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR20CA0022.namprd20.prod.outlook.com (2603:10b6:a03:1f4::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 14:48:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9153823-9623-4e9c-f5e8-08d880d0a654
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50853DA886A3F01D05B4F5889FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rgNWN2kHcilckn9/pVS3UwSVY2iNudYWmUzMwPLruRXmugA+iUSI3tWIlB5JeGix2gCy4WGWkxQakyAlpjdp14u5dI5WDNFgsxweZb8PI85SFECq4m9qCgT5cvSppO52auhWfQGMZV6VyE8s/jWXPqtT1VzguZlT8tuGjJdFE/FSXRRK+Yhrro2tPUko4XbJTR29C0gKhTkpwSKSF/evFbKf9CXkrrojtbgI4fDxsA19RZ3Aar56pkvaDdHF2qgIZ5Cg/QZqm3yZsXbbKiNrJ00hVrgteRZkZfcgFQShuOnq9s5t628tIaVvue9dybNYBP6B2Qp3GuIdrHN0vG5Esra9PKoZz/fyzlwW5OFkMTe8gGJVdWJ09+2pbHj/g80Rcgj/9ZhCsgqhmAXuMSMRNdqVevta7d3M2EeQDm9oC5OfX9V36B0t2NZ5BnKfPsFWOWfFvlyWf1Y6GAT7vEE/tw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jHbIVyHiIkTcO4sZg35WilOjty9DVmd6LE6FgY++gZaevRZkwK6DWtC8a1+91rhdDfbqKHnGUmA2EaCgsuc2w5FSvGxuy6FRiCCf/v/fwX7xqiB4EvIdhn5Yxvlde20XHf2c5VN60tEuhlGoD3ZHfoetoDH4YOK0bTDOMmuz9hpNec2ViNkO5fIbuNmNmeznHdNa+mbAVHl4LmZQCYgqqDj4QnNTtudjdy4U7CMn2pWjwoaB2pJ6u3wSNEoFsoKHTDgrh1FcfewPWlSpx4qRy+ubX8yqzXFW+3AtU5Cqu4n36elw7s3i65akiTxcKZlHe570u1qiM96XN5j3gInRbo5preuvtogbsFFzVckeE4L2/Fw+u7AOH2I/zirUpWwYpMAv/AH+8xYbyLB9ZhXc5UVXcDi0oNcfwQGT+nR+1l/c7ERo2XHMTwBLn60MQbTT9lS0h2ZvM+8xxYqyJk9mkgfUhfB14Nm41svKIEkP6ghLskxss4ozZ6VnbRqBIQCRgh1ABbujWRklw9zvMaLcPad/lG+ELFt121RUByqPgUF4fkL7zhmiujE9tw1YWj+9ysMT3QE9T4GeFhv8jnrMHU/+geQ8cPozHkIYR/MQiWNO61PwvbozmYhq/l6GfSQYmTDjClInj7NaNT+TYxu3YQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9153823-9623-4e9c-f5e8-08d880d0a654
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:48:10.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAscuH2b7QeOkEnOPKtA/LSPf4x4I6m2LCi5AbKWvkHPEtuKXMO+sBJOlNcHm+IYrLny7bccDOBBhZ2DmIUA0Zyy9Eo24kk+dywAQ9ouBqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------3DCB09E0F6C914DE6F588BB3"
Content-Language: en-US

--------------3DCB09E0F6C914DE6F588BB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/2/20 5:03 AM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 6.1:
>
> - Windows support has been improved. Tornado is now compatible
>    with the proactor event loop (which became the default in Python
>    3.8) by automatically falling back to running a selector in a
>    second thread. This means that it is no longer necessary to
>    explicitly configure a selector event loop, although doing so
>    may improve performance. This does not change the fact that
>    Tornado is significantly less scalable on Windows than on other
>    platforms.
> - Binary wheels are now provided for Windows, MacOS, and Linux
>    (amd64 and arm64).
> - This is the last release of Tornado to support Python 3.5.
>    Future versions will require Python 3.6 or newer
>
> License-Update:  Checksum change, lisense remains "Apache-2.0"
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-tornado_6.0.4.bb => python3-tornado_6.1.bb}    | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tornado_6.0.4.bb => python3-tornado_6.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_6.1.bb
> index db6b567444..89ff715b65 100644
> --- a/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
> @@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
>   polling, WebSockets, and other applications that require a long-lived connection to each user."
>   HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "cf39425f3d7eba9a54287f3e795a2f23"
> -SRC_URI[sha256sum] = "0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc"
> +SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
> +SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------3DCB09E0F6C914DE6F588BB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/2/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201102100303.2377-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 6.1:

- Windows support has been improved. Tornado is now compatible
  with the proactor event loop (which became the default in Python
  3.8) by automatically falling back to running a selector in a
  second thread. This means that it is no longer necessary to
  explicitly configure a selector event loop, although doing so
  may improve performance. This does not change the fact that
  Tornado is significantly less scalable on Windows than on other
  platforms.
- Binary wheels are now provided for Windows, MacOS, and Linux
  (amd64 and arm64).
- This is the last release of Tornado to support Python 3.5.
  Future versions will require Python 3.6 or newer

License-Update:  Checksum change, lisense remains &quot;Apache-2.0&quot;

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201102100303.2377-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-tornado_6.0.4.bb =&gt; python3-tornado_6.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.0.4.bb =&gt; python3-tornado_6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.1.bb
index db6b567444..89ff715b65 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
@@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.tornadoweb.org/en/stable/">&quot;http://www.tornadoweb.org/en/stable/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87">&quot;file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>

-SRC_URI[md5sum] = &quot;cf39425f3d7eba9a54287f3e795a2f23&quot;
-SRC_URI[sha256sum] = &quot;0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc&quot;
+SRC_URI[md5sum] = &quot;f324f5e7607798552359d6ab054c4321&quot;
+SRC_URI[sha256sum] = &quot;33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791&quot;

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

--------------3DCB09E0F6C914DE6F588BB3--
