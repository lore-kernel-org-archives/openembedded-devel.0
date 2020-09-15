Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.47])
 by mx.groups.io with SMTP id smtpd.web12.14812.1600179969771067506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aPTk4rX+;
 spf=pass (domain: windriver.com, ip: 40.107.236.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kruynCxuXvepIckTEM6baO2y/nmr/BxBlzjpTPMDsedRsszQQmiq7mqlMBwvpMSyn3geTwzjO6ty4wVeE3257SRi8u2VA2GIBuAyhhEQNxOIEHGQQdBG+NB7TgSuZ5EAAHk3OzfrHy881K+bW7IwP4JjvQ0WiEgBuZre5m0HnwsvG1C1NJfc0CaoIP0hyYAmrZh+oPyx6TH9CuyGBVZpctKXKaNokpKKWWLcoyNPRnbjnlPVbV1s3rkCJJd63SRzx3CvPu8CO75dVPZzcSWSDZ2ohn/HxzLWPA3MggzNE/Jf7KI/ogoi4D0ZIZQ1GWfGI1VWf5umwtfVAhBWXZkZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxkU37D+jWEkcbfyRFCOZyu9xKNzv2ADUHgtU6tloqo=;
 b=ZBgKoO98swTnNzn/v+CqfeQLVtphuTMwRv9bHHHJVx9GrvdtP7hk0+/AcO0HNU6clG1oLg/2Fk4TZ8IsT514EqU1nKIh8/QVPpfCap7n1j7WFgTdQqCfd52IcYkD/kFKJ8J72wZJ1w0ZgOECTnrgGB0+crWz2psmkgc8cxo2aE66bLxCH9X814Mck2f7tyuMOSgGLO7SJjhXXOB0wsieXmNAHYwR2oVXeJe3rRysSS1g+uB+ygKTK0vQrnIf9LxgQHiwsRXJcTkyR1flMBtC3zBRump43wwUCoY+qF6ajwFez2ErxjWLU32ud8uD2zKm0I3cBrhZmDzbPfN3z0LGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxkU37D+jWEkcbfyRFCOZyu9xKNzv2ADUHgtU6tloqo=;
 b=aPTk4rX+q+64Ica9Brkb/MflMVdUw8tnQYed7PBn41pL7nbghax7jXDXsGPK2u876oA5oEFAxA2AaXDULjnNPmDtGxzGEEE4bjJ3kxepu08q3/vf0S7HPNSnBBOwvQAlRo+ac+f7JM7gmOjvb9vN+A7yLjlxdY5z+CW0YMEN0jA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:26:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:26:07 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-texttable: Upgrade 1.6.2 -> 1.6.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3245772a-651d-2b99-2a0d-f753153a6ce3@windriver.com>
Date: Tue, 15 Sep 2020 10:26:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:26:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a56ae2-2d86-42ff-c4df-08d8598348fe
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767BAF1E87664EED293E19D9F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+wU7YHtBIZTUJGUsu7FFzb2PmJvCjQ+pQi9pGxqr8Zfn4IDLIrOEu/uoA96YIThqxy1W4mst/LL2ITX2iW4MtQXxdf6U24tzawJLpJyX/cev45YfFGo1dB9UAAuyD7sk10PpSyi9AzvV4G5KJ0+iSv43osfTkcorbzeRuB4iVFPK45LU++DMJIXIb6NZ2tliwr8YIgvtRr57EhWJxoyEButFFFOmw9LTkHfD3g8S6yEQG4WKOCsmzVEHUquAiCQfdw0tNgRVvefBNozfNRe1IwNdYvnHsGR383xY7BtV0CSBZIs04BroVtfU7oKMtPJVtSgqgbBiVTiK0fqf6veuxuyrRs7JAKyVeugPkZBVBMWesOVgZU+EVhzEeKWpQPF8Dih+AR4v9vFjLqM/VzRGQOTDC3QcnV3iDIlFwB9LdnImoA3U4KKGcDpjgdjO40jocEtsLtVkU3RNn0y61WdOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/cFIl682DvUzoCRJ7NLqkDv31WBYl/gR3fvaMw8ScD7rkjnMk0enGigSVzP5pVjtPvtwLjFiAZLXQNcQX+x/5jLJHrjUsCHCDAShmpAdVsOZgJRRorDUhXy6WFmQLbOLCP3P3/BY8Tde4I/4KYgOS72368T+5veRV6r9CXfPjw05yAo0eFWD6Cou0HLgZ0+daK8J7zfMvc4gq/kCkTGDsLFE5eEdCb07iOGIF6JxppBfBUGdpOBZ8kSN6iZGBg2zaTwfDPFctmH1xMaPzVgdOvDe1nZEwVx0GW9E6GrFppspnOEWrjQD5OFKxMZTxWEvzKOy3IkNLlpZansIZidGmNtwWPCwOwH06pKzkbJ4RvazMqRvwXti8XAEL8yn0UUKgFqXZ57Oi+FeYmNSf+MvV89ZnC/VcMPNZLpj1ZYZVhW3ltc6AwBAqt99qLS4O0cQA1qY6RFm5Mij6PSQlMMowzKb8aFRrdNjsdrNJvMC+hTxfb2wLwHE69XSl3PZ48kcLtngjT04PVJ+3U9ucyv6ZnjG8I9+0EbAdd2VDBDN8QZOL9CdOia6mO3/U9uRxmgakIrbjrf1ib4Ww4YPp1LPbjcoEBFVqsIfMi/benYE5krLTa5Yfu4RvMqPIcjmPDdSa+GkT/9DpwMMJks9Lrei6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a56ae2-2d86-42ff-c4df-08d8598348fe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:26:07.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy0f49raP/4NHTI3S18phzFveDmtmLI+k5sqrfulYUGie3kunZ6MZYmAR06AN+PFPvB0hkq6rF3PBCC830TlK0VjgxzC3O7E54XVk6Dx+pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------7E5C27BF61F5C3580A5388FF"
Content-Language: en-US

--------------7E5C27BF61F5C3580A5388FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 1.6.3:
>
> - Improve int conversion
>
> License-Update: Update copyright year to 2020.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-texttable_1.6.2.bb                 | 11 -----------
>   .../python/python3-texttable_1.6.3.bb                 | 11 +++++++++++
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
> deleted file mode 100644
> index b507008f4..000000000
> --- a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "module for creating simple ASCII tables"
> -HOMEPAGE = "https://github.com/foutaise/texttable/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=af37e32174857b1f2043245f3651c824"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "763141f0bdf598cdc5cf780ed4d2eb94"
> -SRC_URI[sha256sum] = "eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
> new file mode 100644
> index 000000000..03ebd010e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "module for creating simple ASCII tables"
> +HOMEPAGE = "https://github.com/foutaise/texttable/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "68e6b31d36f5c20221da7d5db3eca772"
> +SRC_URI[sha256sum] = "ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------7E5C27BF61F5C3580A5388FF
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
    <blockquote type="cite" cite="mid:20200914090419.19171-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.6.3:

- Improve int conversion

License-Update: Update copyright year to 2020.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-texttable_1.6.2.bb                 | 11 -----------
 .../python/python3-texttable_1.6.3.bb                 | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
deleted file mode 100644
index b507008f4..000000000
--- a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = &quot;module for creating simple ASCII tables&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/foutaise/texttable/">&quot;https://github.com/foutaise/texttable/&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=af37e32174857b1f2043245f3651c824">&quot;file://LICENSE;md5=af37e32174857b1f2043245f3651c824&quot;</a>
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = &quot;763141f0bdf598cdc5cf780ed4d2eb94&quot;
-SRC_URI[sha256sum] = &quot;eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
new file mode 100644
index 000000000..03ebd010e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = &quot;module for creating simple ASCII tables&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/foutaise/texttable/">&quot;https://github.com/foutaise/texttable/&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6">&quot;file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6&quot;</a>
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = &quot;68e6b31d36f5c20221da7d5db3eca772&quot;
+SRC_URI[sha256sum] = &quot;ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7E5C27BF61F5C3580A5388FF--
