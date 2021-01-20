Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.68])
 by mx.groups.io with SMTP id smtpd.web11.27511.1611149640081821135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ETrN0/vd;
 spf=pass (domain: windriver.com, ip: 40.107.93.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/fvCaIb4BaEmCzxKsfKs9fRvxmS5fVl4QfyNcz66bwQSYIq77kMe457+28dq2wdvocciCb7Jxupk1+X7D5r6q6M3P8IX/QKPfvtpS5YZHw3Ze0tni+zOHWRCIa39qZzOxwhDEhIbVSHPoP4lF83hc11Oc2xgFuNtrWLJ7to5cUPE+1PB/7WL3s4cBXBjlEAmY05gx8qYek8x3Bt6AkZjhecKvwUwyaCxH4IALoL9ZpunTLYWjBIJsmox4GhxDEuxOd9/+iJXZk///vn1s/qrZE8dE/rYgDHFBYneKxeEuWVhTAvpQiXbGaQwayJs278cz6Hb9wWpERiCYt9qRaorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3G6Y3oLBM2h4Rm95eZs38RU3Q9jZn0HUNGkt7CEkgM=;
 b=Tg5whgXn2dHN6KDzpMUhby+rSRiMUjtUvU3KuhnyTuk0NWLKzyKdzNp0ijGwL33vhEsFssO0WZcbUanyPas4uCRmtPMDY6XE1ekvRFxIe0Rq4r6k3L9VOE3N8z7bLd7D78ldqQbzDd6PGRprYkZVVF6zJlRdf8hZLoUaQ0Xv7hKi0FQLNoCB3BT/XdErmGGcm8k7PUe9AjUez6/Nl4oqT/S4GFv9E0cYMg4hxESWpei+McPCoNU9oHiTBHXSKKejsKdLwdnfOI1PjqY7GkdOM7liUORWpTZt+sG0j1nMNRfOamF5tZJAI4b0ypJjTdBi3mvv7X6wpIaWyH1FFuaxBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3G6Y3oLBM2h4Rm95eZs38RU3Q9jZn0HUNGkt7CEkgM=;
 b=ETrN0/vdodPvN9ipEdcd2EwCcceNQJ6BrNuiGGtJBJjPiazWrnJnHpKKcxd/IQFDRypp9BpjyDL1dB7k7T/kgcRsmmd5DqmWRkovNaA2+jPCPCi+v8kqb2tL9Kmvem66q5wYKgPDyoP9T5X6fhryuU8o4zAJc7dGn/chF4rDfPY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3190.namprd11.prod.outlook.com (2603:10b6:a03:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:33:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:33:58 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.1.0 -> 5.2.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611069903-4715-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <76692dab-8ca9-ea78-1cee-117180e35d3d@windriver.com>
Date: Wed, 20 Jan 2021 08:33:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1611069903-4715-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:610:4e::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR02CA0019.namprd02.prod.outlook.com (2603:10b6:610:4e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:33:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd559dac-2343-40ac-ff5a-08d8bd480a9f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3190:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31905A171D7E30949320724D9FA20@BYAPR11MB3190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kmU5EUiBhT747Krgnt6lxm8MIKLprqad0bc20HBEVVwfTxSygwdPM3klKuEYAO0mddEHgyQxYZKnHVScjuz6h7Hvc7QDsM3wRnmCAHxaG8QsiNiRcns/Njwj+qzcsnPhL9qnPDPr9K1fXePBEinQA71wvCVA9PTA7DovH5Fi1UVUi2XE8Iupg/1IZRcW6QpRa503g+TwSJpOZcEulzLbsgPOgizFZsQIGDc0XDKZgn6C5f2z5wsEWswDp/lv3tcdXnhYVUpoM2fyRMzpOqBlT537ku6zne59n1ANeOUviMNZQwFjfVQkHzsk1FoREU/cixurN6Izqk9ODNpVfwAHWGsNX6aIyFWQAC6H19vN4i0q/66rZF9iunXqe6d7Zc5F92ncqIRufA6zQGtiIqsbcTqd54CuFgWBZMvdvMgt4atQFOKDvfpGmXCWbQ8suMKKBUV7RxrywXa+v3OTPuUAULr6OMQoi05kiLbllhjakk1p+V84RQfM/2r6ICmcE8JLXZyH0YKTgxZd2yMjzUs+t+mP61WEMUqYgwgBS7Kw8fHu36vdgZpmZ0609WRLvMv8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(83380400001)(6486002)(26005)(31686004)(166002)(16526019)(52116002)(44832011)(478600001)(186003)(316002)(31696002)(16576012)(2616005)(66946007)(2906002)(33964004)(36756003)(53546011)(8676002)(966005)(5660300002)(66556008)(86362001)(8936002)(66476007)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TGN3NGVKckNmbTVnVk5ITmxUQUpGNkN2enhUQkF3MjA5Q2VMU0Rsd3o2SmtX?=
 =?utf-8?B?dzI5M2U1ZmI3bEIxNHNFbFB2UXVEcElHNTJHeEdWTDdFQXhCNStoR01ScnZX?=
 =?utf-8?B?SFpXMlRCMEM1YUpTaTFMeTFTaEQ2YzIwcm1XQk5TRG9RQ2FkcjVUUHlIMSsw?=
 =?utf-8?B?ck1iS3JaSThqek90c0w0c0VsTEI5TlRWWnZEd1BuenlNUVhIMk81dUp5V09q?=
 =?utf-8?B?Yk1KVG1SNTB6UzlZZkV0ajR0WUQybisxSzRaeDAyV1Q0Nk1tM0VvdlQrdVMr?=
 =?utf-8?B?d2V2SFo0Y0ZWbzlLK0c3QUZValg2aFhlVFlNZHVaeS8wYnpEd2VzZUJOTmVP?=
 =?utf-8?B?blNCVG9NV2tCNi9LcEw3NnJjendYMWFWK2RTZ1F2aW94REJONnFybTUrMGM3?=
 =?utf-8?B?c3hCVTBFSVBUZEhxUWo3dTlSSWtBQm5hU3g0QWpZZGZ4clFWanU5aFJDbGdD?=
 =?utf-8?B?WDZ4bFJ5eHlCbkFpN3FzcTh2VWxOMzRTTFFXUnJKTjFJQVBXWlNGWjRkRmdD?=
 =?utf-8?B?KzFlTExBT05KLzVDdnJLZE8rZndqdTlocEhUN1U5YVd2T0VCVkgraStlU3VD?=
 =?utf-8?B?Q252djhjMVFITE1udU1HY0UxTFFoRTh5OVhyRnFrdVEyQ3ZvU1ZHeWlyLzY5?=
 =?utf-8?B?b0phUFAwclBvaEJFNURseW1Wd3ZWcGVsUHZPcy8vYTBnMkxQT3oyckxabm5D?=
 =?utf-8?B?ZEsxQnJpanVZUzdrS2MyR3Y1SVhVT1VJV1ZTOHlWVEptYkRPTW1pSENFempK?=
 =?utf-8?B?Tkx6eUpmakJqNW1QZHRhWm1sZnBxUnNURDVZV0I5WDlNVWlyTE5vOHBHVjIz?=
 =?utf-8?B?eWcvTHkyZno2NkYrRXdGMlpJeFlIVWVLQmRSV2xIRlNERTdYd1RiRWdhb2Vn?=
 =?utf-8?B?QWJuRWpNVG9JMExVRWNEWTFIK2pYYWd3M3dhY3FjMG1MM2dXOVIvUStHVkh4?=
 =?utf-8?B?akNLbDJabHhod1hZTXpGbWNDK0R4ODBRenZIZngyeG9wQUtxMW5abnZpRFgy?=
 =?utf-8?B?eitNdTl3eXAzMUdBVnArdlN1OWVHb1Z1ZDBkU2Y2N3lxR05sRFlkVmUrV0dZ?=
 =?utf-8?B?bktXb0dTeE1lQzBIZC9RS2xTVUJNdGkwZjNNZDIyVmxjLzlRRVBFdHNkZWZV?=
 =?utf-8?B?N1o2RXdWUmJMc3YvTytySmRUM01MOHZhbnhkK1dGU1B3ci96WFFkdzlWUzk1?=
 =?utf-8?B?cmRXeW4rc2dMQmZQQWczZStLakEwS2JEbFFGZ2REU3doWU42WDVhUDdjWXVP?=
 =?utf-8?B?dmdrdkJFMllHdHlLdjhWZG82NFl1cUtLZkRkWE05di93NzY0S0kwYVJaZ0hC?=
 =?utf-8?Q?x3/0O5QdVbm6RUoruJBlNsiBE107GTfqpW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd559dac-2343-40ac-ff5a-08d8bd480a9f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:33:58.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sDL4a0LjmNTUkV1C2mK7ou7YhEJFZnm/fVRtMA/5hyllgLC22TR9cuGaDdFh4NylJSkQQIZD9cb+sfkgF49ki09F6X7YlgDtgW0kuMKbcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3190
Content-Type: multipart/alternative;
 boundary="------------4C33447D6FF5BABDC3EDAB87"
Content-Language: en-US

--------------4C33447D6FF5BABDC3EDAB87
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 10:25 a.m., zangrc wrote:
> 5.2.0 (2020-11-05)
> ==================
>
> - Add documentation section ``Persistency and Equality``
>    (`#218 <https://github.com/zopefoundation/zope.interface/issues/218>`_).
>
> - Create arm64 wheels.
>
> - Add support for Python 3.9.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-zopeinterface_5.1.0.bb => python3-zopeinterface_5.2.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.1.0.bb => python3-zopeinterface_5.2.0.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
> index a66735b8a7..48bb80d578 100644
> --- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
>   PYPI_PACKAGE = "zope.interface"
>   
>   inherit pypi setuptools3
> -SRC_URI[sha256sum] = "40e4c42bd27ed3c11b2c983fecfb03356fae1209de10686d03c02c8696a1d90e"
> +SRC_URI[sha256sum] = "8251f06a77985a2729a8bdbefbae79ee78567dddc3acbd499b87e705ca59fe24"
>   
>   PACKAGES =. "${PN}-test "
>   
>
> 
>

--------------4C33447D6FF5BABDC3EDAB87
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 10:25 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611069903-4715-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">5.2.0 (2020-11-05)
==================

- Add documentation section ``Persistency and Equality``
  (`#218 <a class="moz-txt-link-rfc2396E" href="https://github.com/zopefoundation/zope.interface/issues/218">&lt;https://github.com/zopefoundation/zope.interface/issues/218&gt;</a>`_).

- Create arm64 wheels.

- Add support for Python 3.9.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611069903-4715-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-zopeinterface_5.1.0.bb =&gt; python3-zopeinterface_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.1.0.bb =&gt; python3-zopeinterface_5.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
index a66735b8a7..48bb80d578 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423PYPI_PACKAGE=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = &quot;</a>zope.interface&quot;
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = &quot;40e4c42bd27ed3c11b2c983fecfb03356fae1209de10686d03c02c8696a1d90e&quot;
+SRC_URI[sha256sum] = &quot;8251f06a77985a2729a8bdbefbae79ee78567dddc3acbd499b87e705ca59fe24&quot;
 
 PACKAGES =. &quot;${PN}-test &quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4C33447D6FF5BABDC3EDAB87--
