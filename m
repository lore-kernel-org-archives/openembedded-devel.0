Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.57])
 by mx.groups.io with SMTP id smtpd.web12.13119.1597334226947227368
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GsbSDKup;
 spf=pass (domain: windriver.com, ip: 40.107.220.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmsgqIWkS/Tvy+6Cl3EW8DXtsah7N+QG6GSK50XggEgmqW6X4D2Ce/WVTD45DafFslEP8EAbv+3/G9TgAhNrK2EcSzJLkomKppoe51rBrtojLw8WJKJvNghjISjfSCd1dvdmNSkALvaHXVlpuYz6Odi0a91pu+zbA6jjPNyjoIeyRTkrUB3b29ec2708WsVEGDixvEHC3lvGtvhkygOdCM0jhopbCtyr2VaxcBDll0lWrvxYxgTJvEF0ZHHNNXGYSC8kn229aq1YlOupsGEywT9dOrCr6qEgRvqNO91nKSOSTiGSLM9uSvXRTpLK0yCIU0WEPXO6IRpLsQ/dUA0ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9IlafP0Nt7zWRechj3XOuTRF1chsq57EfskbkBLffo=;
 b=Y17ezhudynZjz4aR7gUkJKKs+RbkjFzzk3TIb94zLLRY6LHrCfmUOSPuBeJDhxwjM6qYHA3+Z3CR7+vYwkLai4IMk08C6E+S3WVFZTV0t1sw0gGOMwOD5VmeOOltQyD/PbvbUzrdJvZ6LjBO2pbeeXGa3CuG2ae7jzLWn8DOmJq2EgoHU4HeMn3k9aGrAFoXbKXIljdxA/b+DAvfFxubH6rNVHDcRMWkmrXjFMnAMKkO88Taz3Z4G4B6Njr1PbVDpD/3T1GLdVPbrOY1XnRAx+1ShE7A0Hc2czW244TjOxjeLcep+zSRpdy/U7xjz4g1RrPTFACOpYJHNc1zCelxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9IlafP0Nt7zWRechj3XOuTRF1chsq57EfskbkBLffo=;
 b=GsbSDKup+vRi/NhVg4zW6GZf/SyuATKNFXK64PmJXo32h/yOtCfLzep5Xzt/+kOYxomW/TJP6xrCuxiWQXk2Fob6thbgD4mSnXM9uc4wlrRHr0Wv/dGB2kP5yvSta76FShRxkq1/by4XgqDrVZtUwq9LEU+jfgiv1RvPybXLHYI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:57:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:57:05 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-javaobj-py3: Upgrade 0.4.0.1 -> 0.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
 <20200812164335.24599-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <48b98931-fa8c-5ef8-672f-11a5f06d50bf@windriver.com>
Date: Thu, 13 Aug 2020 11:57:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812164335.24599-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:57:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8a7159-f3f2-4588-f29c-08d83fa1854b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3606612A3CE60848F0BE26499F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rAsYH3ripPl02iCjLt1a6PutQ2M7UN+MCPdhepI6DA5JxUNWdJ3H5maKrCYkyJSIhWzUMnNyuaFqJAx01x6VymabYtWeoA0Y+XFsKUBcN1iIq9QEEG/kYoxG4aHlZQIzO0tay1Aa+BjgFpPABpkETASRtn13dhZLHMu/s7WlK5BOZZzWWXtHub0oyAPa+x54n6lJILODh4cpMFRyvuzavv8TIPFgMd5//PqtttLez7fks2ZE9bUJzwfuUEIItucYYmtH/xb4cD1IMTPiUG9DBXqba6b5KkxczycJVOElHqyJOQRnC1QPuix2SonLxwtdt5ocy9bUvDDMdwp4AHo655LgQOJK7Wbb71Ko1Dy3HjgSA3OGe++kPDlZYRWN7ZRni2HPXbjnqlVSZbaDwk/Fo3Vcdc1pb9rHb8ID5CLorUNJQogX9FvvuyHzY8zGV2ehCp3m6qxohc2zK57Kt6SzZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/CniTEgGGv5GvQH+TDXvKBzZg5b1R3lTqseTCz+7ZCBjLH1Rm+WEPbd4KPOsIR/xHwlNfP/EbHWG51lobssksSLUZpkM7pgeUPtmq/OCPl17XBvJm/keEh8Y2SDouGGSwR07r4tvgmaXOZBD01R9BXGJpYWsdgDz/PwTS8XxalEPZz6uko0Nz0E71XD/1sP+QbGvKvnWLs/jtXmPXVwvPMHm5aWiw7Q4cboSKGhKJNhczo65Dm80mBIHopDYio3M+TtVA4NCc/97l6aLAgUC/Vyf1gFvITw4izMKwTKlJqw9DmZZqr9zR/AiMygNBvOWFZuixfwmMH8XN3ilYIc7+MdnA9Tym0ypcDNWYjVJiIW2nLo9f4u4SMcoC5sQArbT4wzUzb6GM0zedmC8BakX292qm8C3KzwUNz26+9UyVWb+sVLrmU5EemmVOgRb8qH+EUgskmL6+3VFV24KbLxWXrQ0RJP+LkMDO0c+u3eo8HqqBjqYfYuWlKI2+qbpSCF47kjXrgw/4KX8bOM0JAIDmeaJ+e4Hp70RRTElPmn3Q2oU/4tuZdV7nr/A3K4uM+SofKFU82gM1JJAFIo7qWzb/XJrjuGSxo+rXJHFpnimr/mdb0ysf2fmeYuEdssxQlZfMWGqbJ4Flsdr7CiwCmT68Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8a7159-f3f2-4588-f29c-08d83fa1854b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:57:04.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfzwH7Al9u5le19N/d8kUAcTVWHBex+LzDqz/otlE11It7xVM4shz1by29exjdBeQ9BRHkin7VeHZKUJKWLl0Vn7BsDbK/XWdEzfevR5t8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------4BB42C7F7B667B869A3E1E8D"
Content-Language: en-US

--------------4BB42C7F7B667B869A3E1E8D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 12:43 PM, Leon Anavi wrote:
> Upgrade to release 0.4.1:
>
> - Added the custom transformer allowing a finer loading of custom
>    Java streams
>
> License-Update: Use file LICENSE to check the license.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-javaobj-py3_0.4.0.1.bb => python3-javaobj-py3_0.4.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.0.1.bb => python3-javaobj-py3_0.4.1.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
> index 49d258ca8..c83140a89 100644
> --- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
> @@ -5,10 +5,10 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
>    representation is a standard data interchange format in Java world."
>   HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
>   
> -SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
> -SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
> +SRC_URI[md5sum] = "47632071c3c3ca14b6c42f2a4e2e1309"
> +SRC_URI[sha256sum] = "419ff99543469e68149f875abb0db5251cecd350c03d2bfb4c94a5796f1cbc14"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------4BB42C7F7B667B869A3E1E8D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 12:43 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812164335.24599-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.4.1:

- Added the custom transformer allowing a finer loading of custom
  Java streams

License-Update: Use file LICENSE to check the license.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812164335.24599-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-javaobj-py3_0.4.0.1.bb =&gt; python3-javaobj-py3_0.4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.0.1.bb =&gt; python3-javaobj-py3_0.4.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
index 49d258ca8..c83140a89 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
@@ -5,10 +5,10 @@ DESCRIPTION = &quot;python-javaobj is a python library that provides functions\
  representation is a standard data interchange format in Java world.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/tcalmant/python-javaobj">&quot;https://github.com/tcalmant/python-javaobj&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e">&quot;file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87">&quot;file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87&quot;</a>
 
-SRC_URI[md5sum] = &quot;352fe0df9336b8699ad0799ef152da6b&quot;
-SRC_URI[sha256sum] = &quot;18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd&quot;
+SRC_URI[md5sum] = &quot;47632071c3c3ca14b6c42f2a4e2e1309&quot;
+SRC_URI[sha256sum] = &quot;419ff99543469e68149f875abb0db5251cecd350c03d2bfb4c94a5796f1cbc14&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4BB42C7F7B667B869A3E1E8D--
