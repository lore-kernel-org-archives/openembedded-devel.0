Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.81])
 by mx.groups.io with SMTP id smtpd.web11.9141.1602632541224908349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cl433eX4;
 spf=pass (domain: windriver.com, ip: 40.107.236.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAaWJ67WFyQvRYeuKutnB0oFegy9/8TVJ16tCCxeD+1EA0q/8QfqPyxgODrmuJ9Esqyg1t0oBewGZ1G0xPgSQCGCpRkdTCKaBTCt6XTpDkuF/T5Tk/NuCKlccuNYZf7qlYSDdIRLTmZIFnqLQfX3CuocqudOvpxfYfRS3KgjSpkAr8PM/IvzZeh3izGGUyPtg6bkV0BsArhGgm7qNzUhLibDLrtYgbZyKmB2I+JuHbWN7q2VgsweKJUDFEnve/BXd0jW8Z8cup6Hk0qYHDZziI+aYeHOHAmZP5oZYQ46S50L8zouY3XebWKA/aDdS8BCsZn+ZyXoSiRDsMRUhKPJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTzLV0wqZaArq3hVdm+DxAT8yJeZ3ivU6mZUiHaASvk=;
 b=G53yOoJchAqz4uTwJXcGDEFVDrEoe+wczaUbFKNhD0aV5XlccJ+kpxuY+kvV28foy2zZkV7/wHHNNnuXvxYbYXh0VZBk0qbThEU4K0P0PMPUDFEAdHT6aeK9ecgchlPNvyfVkN5EViJrOLBPceJ90wfcRuZ4170avK55n11G/+8jZBdvyqSJ06OlGe+0fzZHSJenltiGxlyXnVylBY7Cce2J0meK+e9TSDQz0PvQuDKpmFCbZ2jHWEVop8XtIck3jLI9U4myBYgakqmeAokiDcdfluhtsp16Tuxcn+f/yE9E1i3syC6lKCcyfsam/m+sOyqiUoIwD5aF1O7YNZ6c9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTzLV0wqZaArq3hVdm+DxAT8yJeZ3ivU6mZUiHaASvk=;
 b=cl433eX4Zq59I4707I+oKLkMd8InjL7LKBh55diLyIC1zf7DXlC5py8AbAco0zl9KFB2yMhOKT8rWBNr/7tPr9oMDyUzFOtRKmc3aShe2cyqv8B38koWsSGM3IHD2hE1bjwOhgusHVrwDp3BanMnKVActMJJes+hsyJWA3PYnz8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Tue, 13 Oct
 2020 23:42:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:42:16 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-regex: Upgrade 2020.9.27 -> 2020.10.11
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
 <20201012140022.15761-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c146ff79-1a95-5b4e-4961-3df4e461c5f0@windriver.com>
Date: Tue, 13 Oct 2020 19:42:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201012140022.15761-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:1d0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 23:42:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59b18492-09a9-4526-2d8e-08d86fd19e07
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB344576660079C67FBC4A0E0F9F040@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fim+L92XNuwVNvM4/+y4TwXQ839oJLzodazkCRqj5NhC9zdf7RBwLfR3h7U3BEgVyAmC5zXWwBHi78jFy1cjAY2BGQ3BO1DOwMvXzcAPZw5T9V++7+TVLdG5UsAVzLYjXedSeta0vKpdYAPnoVCmvN6u6e8psC6exIXCBd634NlAUyql7f2IHqnituUb+UJo6fxNfu4zVPI4SRFp76ewbFgdxw/HpooD56wZFBlixPYBfk43w5ApYAZeC8YSrwRsFdtFzJJD4TFk+butG9S7Hr3caa+BXTSk3LBsfbuXD1Nmf1t9KUcu7MyYCy7rQD3ysS4uoCyoZ9vyIbgF6SB16k7gLkOTdKysOolNUv+yoEM1Iihw9I3z+Odgr2pT5RWJFDDVVSwNWbAFV3Q7o8w9IqOJpoAB/sp/sAvK5ASjZFFmpezDea3/jgT4RO+m2bQVOzw7SgOjK+9SvP1fCnZqNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(166002)(26005)(53546011)(31686004)(478600001)(2906002)(83080400001)(33964004)(86362001)(52116002)(6486002)(5660300002)(83380400001)(8936002)(316002)(66476007)(186003)(31696002)(44832011)(16526019)(8676002)(36756003)(956004)(966005)(16576012)(66556008)(2616005)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YctEVD3P2u5I3GC2fUsXGwgLfnuUl8+87u6riZ1IxiOxoinxaVVng6CnYR/cOE8VirnJjePClcY37uh8MElLr1ao2Dcy1bU/Pp4EQLauSsZYLo+4cnAMhrm4COS4jP7pbVv3SYLXY0xUSZU2c+1DsMAIFCaVBYMMOxUFpSEhilHzMHb+JJuvGEYRWtmrCU/bqpASND6eIwevy1l0+hiIENgdjnHdKJgf9tbFv5WF+lJLqHeOrRcjjf91ZI/Neo999P7EHaL+da5Ge1Kekk70t9JJzfl3B/z7i8p5VG9FxNnUJHUJzmUkovdycDvfVTAbQJtug54nGeidYdUcaKeoYdeYfVPXqVTAOVzJRIXwQxyaIQX9W4rG85Z0nIHJII7PeQByRQ7O5ribT2/C5zRI2yGadOjqslwRK/JnzCqX0SRdfAuhI/3Uf4TJaWqHYDDeBR1KGBMTUe52JFx/OWxAPt2ZbcRVR/n2UNRsIpc6JtfGv4nC5qeWkBt8n16JJEJkwHhyP6VDssvLAxgBggmOFz5Uv1SVxqb2/KpG+WSaTs6fvTRFYnDmU+2UQ1daSftfRm/0WSWoIcE1yxepwE5/w2eRvIvTaixXhKl1olOxkQaDDncrRZ5iMG5kYSf7n2IwCHtYubZSlXwTxEFt6f191w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b18492-09a9-4526-2d8e-08d86fd19e07
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:42:16.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzK1q3+svLmK/OnJQuAHAAd5GjivXmnsrHWXW0GC4dY2JUBSHR83OohX+4q4lG/J2W5MOu1/YwWN5Zj0RfjlhwdJQKdO7Til1w784ciuJic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
Content-Type: multipart/alternative;
 boundary="------------BC8ADDC08EC470F0DD52D155"
Content-Language: en-US

--------------BC8ADDC08EC470F0DD52D155
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/20 10:00 AM, Leon Anavi wrote:
> - Updated .yml file for Python 3.9.
> - Didn't parse regex comments property when in VERBOSE mode.
>
> License-Update: Changed to Apache Software License
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-regex_2020.10.11.bb                | 11 +++++++++++
>   .../python/python3-regex_2020.9.27.bb                 | 11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
> new file mode 100644
> index 0000000000..df2c00bbaa
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Alternative regular expression module, to replace re."
> +HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c046c93d45d8e4bc"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "642c259122a3b578cec66d8bba5665e4"
> +SRC_URI[sha256sum] = "463e770c48da76a8da82b8d4a48a541f314e0df91cbb6d873a341dbe578efafd"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
> deleted file mode 100644
> index fb891f8716..0000000000
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "Alternative regular expression module, to replace re."
> -HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "195f5e867e9f87a39f921ad0e5761a61"
> -SRC_URI[sha256sum] = "a6f32aea4260dfe0e55dc9733ea162ea38f0ea86aa7d0f77b15beac5bf7b369d"
> -
> -BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------BC8ADDC08EC470F0DD52D155
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/20 10:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201012140022.15761-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Updated .yml file for Python 3.9.
- Didn't parse regex comments property when in VERBOSE mode.

License-Update: Changed to Apache Software License

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201012140022.15761-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-regex_2020.10.11.bb                | 11 +++++++++++
 .../python/python3-regex_2020.9.27.bb                 | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
new file mode 100644
index 0000000000..df2c00bbaa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
@@ -0,0 +1,11 @@
+SUMMARY = &quot;Alternative regular expression module, to replace re.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://bitbucket.org/mrabarnett/mrab-regex/src">&quot;https://bitbucket.org/mrabarnett/mrab-regex/src&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c046c93d45d8e4bc">&quot;file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c046c93d45d8e4bc&quot;</a>
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = &quot;642c259122a3b578cec66d8bba5665e4&quot;
+SRC_URI[sha256sum] = &quot;463e770c48da76a8da82b8d4a48a541f314e0df91cbb6d873a341dbe578efafd&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
deleted file mode 100644
index fb891f8716..0000000000
--- a/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = &quot;Alternative regular expression module, to replace re.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://bitbucket.org/mrabarnett/mrab-regex/src">&quot;https://bitbucket.org/mrabarnett/mrab-regex/src&quot;</a>
-LICENSE = &quot;PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec">&quot;file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec&quot;</a>
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = &quot;195f5e867e9f87a39f921ad0e5761a61&quot;
-SRC_URI[sha256sum] = &quot;a6f32aea4260dfe0e55dc9733ea162ea38f0ea86aa7d0f77b15beac5bf7b369d&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BC8ADDC08EC470F0DD52D155--
