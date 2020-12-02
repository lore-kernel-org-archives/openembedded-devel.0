Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.84])
 by mx.groups.io with SMTP id smtpd.web08.5259.1606918246732071732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k5TOdezk;
 spf=pass (domain: windriver.com, ip: 40.107.69.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6MUlx/eGBPsByc6OAe3KGOg8Z6+RomgJKnuB4umf+mUqUpw8dY7MiUG4lf49rzu9XmrE+i2+wTmUTzKLKosDrBvqCzLUDOWDWv2tVDRdjIk79FF0JRo7BEDV3IhOUmMeyKcpG5QlYrYg3r+jem28exkj2OaTr5NRgokQzpy8HvmXxHAQlFmKUDOWfuFZBJGdGOHU3ny1Ny0IjLydH1g+uuGljD4gd9Gfp5fEo3dX0ZSNZDX6i+GrsYq4KnCXJ94g+q76Zb3DN9xL6yAqZ170Lr1y+WnVBYZ3fsO5ph8I+ZQsgIPijMFXhCxby5EJuoZBebKeh1uEN1zjd09D9RE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAMC6ZioJKD3Jp/+fwu+yPJRSNh7k7UUh6IcMzKho2E=;
 b=Fs2BGjiLqRaqcDzvAYSEM6xUWztAWYJl/P5pDrz0Vba8YwY9kUCy4jlfb2+J0gdcsL56uKbP/ha2NikENWe0Mh7UFFIJ8+rStGzN3i+oUvpZ/vxKOnkY4Itz0GUzNbh/wo08nvJPYSWHQX5c0KLWXdD/IITl38FEHIuEkJzWQ5lfFoLvzRSnLoClecx4gUpojiIkHomBKVsDhRIvA9jx0VhVFE4b5Ktq0PkX8MRgTL5FLlDL9Q8suIBsWCtbjO3u0ZI62AMTlV6x2c5wU01uwJbYF8otSHrgQrz+DBT5iylDEs+fXHt8CREDffsmEgGc1AFkDDcO28lXaP/hW1lGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAMC6ZioJKD3Jp/+fwu+yPJRSNh7k7UUh6IcMzKho2E=;
 b=k5TOdezk8EQ9JFdYJoGDSqI1e2RC87cL066dsWaH3FqL5siFIFph7VCdD8uLZDY2NvVRszWyKdOsdXZq7g0OdN3o5SF0Cm68oU9j7PcN2RQrSMdNfpO3TCk6hj7rvuiMxj39QwNc27b6VgU/I3jUoPsTb0Y5ehSSVqsh65z6aYQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:10:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:10:45 +0000
Subject: Re: [oe] [meta-python][PATCH 10/16] python3-wcwidth: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <44a0935eadefad954d3e8f2c1cc3837d57eddac8.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <567583d5-28e5-df67-9125-d62782440f7f@windriver.com>
Date: Wed, 2 Dec 2020 09:10:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <44a0935eadefad954d3e8f2c1cc3837d57eddac8.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:10:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 519ca926-720c-40b3-4f41-08d896cc0f38
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48649B2D558855CBFC0DC4EF9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fjqIzXlsLH57ml6+p8ca39c3LJQYvl8GpfBflPwQm06e7zHm2hy0NzzlDxWU7UuusKJ2YhedotEUqussqMiCEkutsK7EHEccLc4v9+5JOmx26bvbnL3nGspEOl0vpFpOfye05S3o0N9yzP+wdy+kUPDUDQHrfEjdCEOQhcRD/FfZMWOfSxOabJ/JfdttWHNTxjVsweOZba26JC2Mq+DOhmeJ1w2ZIbQbk+x0ARcg8Mk6DyVFkFr2ASDI9euCl7q+CQggVup5CJKbSjgUwkLK14sXRcK7cFgf2oslygpDYJt2DaEYIc/KB/GJzzk6ZNOfSXs1Z9xkStb9E7jWms99XmAgV3n9ILZEgQXoXck2Fuf+D7a9lhboLbPd7ieSOhdKEMrywFWxKaZBbydiLN44jgjkxiSBgD1bdQhIqyItmUCpTFqpD/MrwxFXlg80jNFlBS+fqjYiylYRW20pXP6lP4zFYrPjYnezDv2PRWVRO2E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OGlTaThCL00veVdaU25STmJJSmYxaXUxMlBEVzZvOXNVWk51SWFIMjRxTHRP?=
 =?utf-8?B?eGo1bWc3d00zS2Y0bEVwWjZySTB3M2lFTEt3L3RtUzNKOWNEMysxQkZLUmVB?=
 =?utf-8?B?MFVES3dZSjlPaU0zVG5iSWhEbmpSNS9WNVF6UzF6cG0rRlBqc0p2L0MrMzFZ?=
 =?utf-8?B?c0wvSU1tb0Y0NFc2dERZVGJ3UzNQcjB1NHlrc3ZWcDBMc0FpcTBDK0YzdEFF?=
 =?utf-8?B?Z3dxa3M2OTdUTW81cnBiZXV5eU50RGpjODljTmZNWWNGb0E5eHR5UnNOUlQ2?=
 =?utf-8?B?cWVOSUVhZGtTdjNvcTg4cFVyb1lWUlpQK1Q4MVF0SkR6LytKM1pVZ2NsTWtS?=
 =?utf-8?B?d05vdXZVMzFNcFBvNWVKeGYxYmp6SXZrWUVpTHZWMmtydW13S2NrNVJNSTBM?=
 =?utf-8?B?YXJORGtvdDRGVi95TXRFZGV5cEJpSkI5bm8vSEJ5UERlb1NOUkhxZFhJVVdO?=
 =?utf-8?B?Y3VlOFcrZmR3N285TFIxLzZhRFNJTEkwQTNnWlRQYm84Q0ErMTFQUm1aZkVm?=
 =?utf-8?B?cUZNcHZWUlp2WTNOMFdGOWM2QllETHU1Qi9KeDd5RE9UNnQxUDYzTTdBU2xZ?=
 =?utf-8?B?Tkl5RE1PMjBZaVhMdUNVUGtvbEl0dkNrWHJ1M3R3aDJUZkRkVjUzaEJtKzY2?=
 =?utf-8?B?ZVNXTTM2dmdLbXArSFprRkJNb0JCRHZmYXBIR3hBbzNaY0MxdnhFdTl3N0pP?=
 =?utf-8?B?U1hqTGZROW4yV1Z4QVltOEtHVmg0WnVITDNSekNzcmx6NXp3cUxoRXFmQmZV?=
 =?utf-8?B?a2VZM3BtdjdTK3ljbmRrYlFnVzNBNTlJMmhOQmFEUmF3Q2wrWCsvWUtNdXJq?=
 =?utf-8?B?Q0c0NGlPWm5WODhnYnpLQnRYaExVREJaT1ZmYUpkT0s4bG9CSXJRaURYZ2Fv?=
 =?utf-8?B?UG5rRklGNXVhWTBLQ3BVRllWcmlSZG1MY00wTzllVjJUb0VySUt1K0paUGxj?=
 =?utf-8?B?QTBRRFowQXlhdVVjNkh5bDlSWUx2NlhGUnNxeEFBQkZWekdZeitsYUdOWjdT?=
 =?utf-8?B?VzgvVTJZOGdJQnRYZGNjUDFQU1JyVm93dW5TZnU5ZVNRK3o3S1JBUlFNRTlh?=
 =?utf-8?B?RUNlQnVSclc1SVNYZ2l6WnF4aGFWcmRvNUxVY3FCUGxBbXc5d1RRbzdZL3hq?=
 =?utf-8?B?V3hvdVEveS9tVEJUcEFZT2k2VElFVWliUE1YekxnTHJETW0wV1FlR3ZRUFlo?=
 =?utf-8?B?aXZ0eTFZQnJNMlRBa3liZVJxdFRtdXZGMk9KazJwcUo0M2YvVFVTeEM0Y0lv?=
 =?utf-8?B?SSswcHFPeFVSdFc2bFVhdVREN012eUZaTU0vZ0hLQmJWRzdUWnRzV2ptRW9s?=
 =?utf-8?Q?IcbwhjDqkCgveioKUa1DOaO9F6i1lEfx50?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519ca926-720c-40b3-4f41-08d896cc0f38
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:10:45.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw1xkNaLr60gywkwwmpMvpqZCUh2AWMAd0zwb/yZUoCnejVC8pdL6YaE/r9gK3+M2Y+KSTWgksi7nm9w0N6IqEDt+imSg4ctLW7NWFn2dac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------7908DF9983F3DF8F6296C1A6"
Content-Language: en-US

--------------7908DF9983F3DF8F6296C1A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-wcwidth/run-ptest          |  3 ---
>   .../python/python3-wcwidth_0.2.5.bb           | 25 -------------------
>   2 files changed, 28 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> deleted file mode 100644
> index b63c4de0d9..0000000000
> --- a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> deleted file mode 100644
> index bb4aae2e86..0000000000
> --- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY = "Library for building powerful interactive command lines in Python"
> -DESCRIPTION = "Measures the displayed width of unicode strings in a terminal"
> -HOMEPAGE = "https://github.com/jquast/wcwidth"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
> -
> -SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
> -SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
> -
> -inherit pypi setuptools3 ptest
> -
> -SRC_URI += " \
> -        file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -       ${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -      install -d ${D}${PTEST_PATH}/tests
> -        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------7908DF9983F3DF8F6296C1A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:44a0935eadefad954d3e8f2c1cc3837d57eddac8.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:44a0935eadefad954d3e8f2c1cc3837d57eddac8.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-wcwidth/run-ptest          |  3 ---
 .../python/python3-wcwidth_0.2.5.bb           | 25 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
deleted file mode 100644
index bb4aae2e86..0000000000
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = &quot;Library for building powerful interactive command lines in Python&quot;
-DESCRIPTION = &quot;Measures the displayed width of unicode strings in a terminal&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jquast/wcwidth">&quot;https://github.com/jquast/wcwidth&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb">&quot;file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb&quot;</a>
-
-SRC_URI[md5sum] = &quot;a07a75f99d316e14838ac760c831ea37&quot;
-SRC_URI[sha256sum] = &quot;c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83&quot;
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += &quot; \
-        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest += &quot; \
-       ${PYTHON_PN}-pytest \
-&quot;
-
-do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7908DF9983F3DF8F6296C1A6--
