Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.53])
 by mx.groups.io with SMTP id smtpd.web09.13856.1604501113363544936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZajzPDTv;
 spf=pass (domain: windriver.com, ip: 40.107.243.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPuxfayOFEvQ6vqqca3HmAHtPQnSWgOQmUyqW/0FAfI90kc41s8h1mEsabLJCZyPbjtJxkv7oxG6BLBiqq9p5G1oDqX7hdE5akaRxYBRHeaToX0Ohwc47s4Gvt4L0jMXvLsu/AlB2AmU0vkr4yaZPJ8/QFB6SVy3LP7brGKyKfjwLu/UjX7mphCYVw9o7/1BPEdRRPfXnQ4sXEUWE9P6gn31BrrXJzZcI9v8++mjm/R7kkH4tLjhdj+4B8LEQiTIAzuwv0lzJuT6i9+G94e6hcfLMqniL61KsbqMRJPsNcPUC7baveD6x50Hme5rPIAlCg9zhVjFH5GDWBTxDK16iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H33jGtvQiHFBxjIJWtW8ayZ2YZ8FSPlN90nRXw7vZpk=;
 b=Pkaq3ekRw5kJhm5g7voV6oImPtKfqoSJU3pUldPrDXjsZxxSjM6HAhpuyORnZBucn47oesYR8ud01kb3bVsnHirwUzuNT3isPlP/x4XvM1/xzSHyy0e3zuqs42IaPAZx7Mjx3n1IJFF5csJSw69WL8GpsWTrRyKoRpEkd8hH2XcJ9RIp9z/aRFtxqgOwfjRDQIuAkJs94ZaLJjYMDkQnI7OFBb0eXtzAIrITp4iGwwSlIwWPrg4aN9aZHJ0TyVpfPY802YSDAwMLfo8lXSp43GLMyDjFopB+i376VZon9iXIozAYfO+DWg+vo0N5xEFh3ZTSX7ASppUlz/LlxCGayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H33jGtvQiHFBxjIJWtW8ayZ2YZ8FSPlN90nRXw7vZpk=;
 b=ZajzPDTvKUiwVTCX5dl9omipX1W0rQAzqPuN3HCtyKoWlh3J72szji5HyCINl4FUkWEekVcuQX+JPzap6WjGns76F6+bTIYm/DWhS5M1iy8OkVqFNqeMesCm03mXvcsWzskWUzr1Fd2tQH51zo0n0hbGLTJgUbeOa9DnphRd7H0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:45:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:45:11 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-u-msgpack-python: Upgrade 2.7.0 -> 2.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
 <20201026115041.11671-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b67b2ebe-4763-8b0f-c601-1aab4f9b5e3e@windriver.com>
Date: Wed, 4 Nov 2020 09:45:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026115041.11671-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:c0::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Wed, 4 Nov 2020 14:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6bffd55-a816-44b0-1e5c-08d880d03b36
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50857B1C0EB7D0D9E0D74F0E9FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eX1zi39+7MFEE0wyq8vPgsvdjBQjhQgEIdwAWoiDUeTI9pKYnXLQAxF0yCwe5gj5H1ijEGha24bjRT/ANrQvHh+1hmMA+A6D2qORVAZ1m8BspZEI9IISHY9M7FtkrVPfssTJ9dDP3Zk/4RqbO46XSRhl2pTW6LU0IjNdFHRNS79YTLqfhTt5Y9/KnBWSQLMa5rNMrsmZF/J63qD5rlX0Eivc7FTPfxhxeh1YB2VWtrm0ioIMe2LE6wCNCeD84UdBrB66kI335XgX/nuIbyJC1myPiBFOiknVrHRIbGFlTzBXBQShXGLnhCB+/8oETdq04Uu8X6doiq4FhuziTEHxguhvISsJJ+GmyyE4EcJvQXWRHyFNFgwSZttuxwpefKwDnhJWq4eIz1sv0rhyRuknDv/23VJaeflGRXgEfj7eu5EU8kTScONrqCPrP3mivUO21nLwirWAal+zeRtq5uDiHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	t5blMzfk1cmyEc6Iq5Lcdl+0nQqu/V8yxOGGu5IqkXoNlb8yg6ak0m7dS4XLiy50aTaxSNQZfR5Xm5jqtmXI8arfrhIq8ho+8euzcvr7XZsATYFu+IYalNJT3iCQFJ9bxzupqyLtamc+5kQ++xuTYzpkZfMYsmD+FCgZBj6Sn0Czygv8rkIG9WIsKBQ44Q02E88w/4zgjgTmeJffTdz001LL8O1SubtQcluBwnJV0PHc5Oi3zlDgMVjQ2jS802w4/InWD5bBzh7/mn5FfUnuIxqbhbaymhfeViXaNQ1YK7cnqymbehd4we1L8Wsdmmq1i+j6g4tqcLgYE9YUPpVK1E12xErRj/m4p/yk5yGd901iA+RkR35I0DE3vEWcvMjzoMF3gYvG90D84JIgjV5u4K9kydzdorR1bFz3SKSMPh0a3yYyHxuu4B3QGWoyM/MAOBrfnq+tePFfo+UpUgZZ96OVBw5sPX1F4E/CApFHQ48cvlUBH3dLHYrr6lth9XTBuBMnlMoBQWMyC5oW/gAYZq+1e8RnrbqoGCWAdg2MUJc2HcIWbdobOlkIgGKUXbbcC58DwVmZcMEK9frVJhrIXdP0OonXXWA2OO1CsEstfXqtlv56DXC/I6hhioDOgJQS/WNhmuJH0wOusr2rxKYyBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bffd55-a816-44b0-1e5c-08d880d03b36
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:45:11.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9F2L0dyLq9RIM9i6ZNCIkbO38UOvlqX2v74za0jNB1qf5heHiHO0f8WGItOpQRYsvffJOHsOg1lkgvdPxMTGIDbnbq74hVbz9xspm7uEP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------50E5310F77FE45CEE81E3178"
Content-Language: en-US

--------------50E5310F77FE45CEE81E3178
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 7:50 AM, Leon Anavi wrote:
> - Add Ext type value validation to Ext class and
>    ext_serializable() decorator
> - Change string formatting from % to .format() throughout codebase
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...pack-python_2.7.0.bb => python3-u-msgpack-python_2.7.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.7.0.bb => python3-u-msgpack-python_2.7.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
> index 4797a3535f..c5524d152e 100644
> --- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
> @@ -3,8 +3,8 @@ DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer w
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
>   
> -SRC_URI[md5sum] = "231609d87aa58459a1491c8f5df4e4cd"
> -SRC_URI[sha256sum] = "996e4c4454771f0ff0fd2a7566b1a159d305d3611cd755addf444e3533e2bc54"
> +SRC_URI[md5sum] = "8691cea6bc7b44bce6e2115260a54323"
> +SRC_URI[sha256sum] = "b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------50E5310F77FE45CEE81E3178
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 7:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026115041.11671-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add Ext type value validation to Ext class and
  ext_serializable() decorator
- Change string formatting from % to .format() throughout codebase

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201026115041.11671-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...pack-python_2.7.0.bb =&gt; python3-u-msgpack-python_2.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.7.0.bb =&gt; python3-u-msgpack-python_2.7.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
index 4797a3535f..c5524d152e 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
@@ -3,8 +3,8 @@ DESCRIPTION = &quot;A portable, lightweight MessagePack serializer and deserializer w
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594">&quot;file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594&quot;</a>
 
-SRC_URI[md5sum] = &quot;231609d87aa58459a1491c8f5df4e4cd&quot;
-SRC_URI[sha256sum] = &quot;996e4c4454771f0ff0fd2a7566b1a159d305d3611cd755addf444e3533e2bc54&quot;
+SRC_URI[md5sum] = &quot;8691cea6bc7b44bce6e2115260a54323&quot;
+SRC_URI[sha256sum] = &quot;b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------50E5310F77FE45CEE81E3178--
