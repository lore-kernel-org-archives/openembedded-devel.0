Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.60])
 by mx.groups.io with SMTP id smtpd.web12.9842.1593090008273021530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZQLMeMSF;
 spf=pass (domain: windriver.com, ip: 40.107.220.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nfbvx34xZh4nJOokBVjS2+3EgTyaGHwcKEzqjocUjzdU79KVJiuPOHqqPEtRw9xyR1TQjhxebtrdu65o03QTUIiE2aboCNc8wHdXOh8GCzShCwI9/XO1kmQ9K2Btamo/MGdW50j14OtLKK7eX0MNt9eHf8yNghev9ohDrdPWNe7wNcFXq6KqZc/gIUQRmBlO8tDzfDmYBMQcoAXxSrrAzmr/9cUuOGvvHgadchdPjDbq8XLgv/EDxJG6meJmGDyuqVvL96w61AwBM2I5Zvemn+/WNNP2R2TvDfXyHH/k/Oq0srlsd2gfbgkF1FSvSJ9SMuKlgZ6yYEeUmKA8Iw+2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLkrzYOUjYPHcBnHNYu1viit7mW2jP/ubAvrOfPct7k=;
 b=AkicGDMt4OC1TUnZ0qmKipKMqnmx5E8gscVIhPm75df7ARk3HxZjXsTSVtI6a8H4rKV47Nhs1S+TGN1DF7GTrZlxkKDnwuFwheZ6lSJEh2HW8CzQc6GPZKwUxpRxyHFMlU0CbiR8c2wwZ84QUYOQWvQUu1WYGJJr0Gaif191qmWFjAhpDFUH9OhkavhFaiTDldoo7XwTEZuLcUXRAiyWLlsxiQCCiadUwZNOji5lzGCls0tkV2Wqt/z8Pt0AtjIhLmTwcnXHYtvQEToJZxTWYtSaGouxXBeSm/620pxy5CwT/6jZpvLr/r5nV/fOJMIFeJz/17coWnKMsVn39LGjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLkrzYOUjYPHcBnHNYu1viit7mW2jP/ubAvrOfPct7k=;
 b=ZQLMeMSF1NUdiTCrbd/VCIumzFH08mxgVbVdsVjBc99Pv38La3G6knIZBERuy2I7Mn/nK88Z2hWghre2oViMLvYjBqX0gxMIrqSlv5LmLSZX+2f+AfuhCg61Sf6uw1OM6rvIRCMvII4laE1noYiCzAaBT1f0hw2k19SlnVCUrrs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 13:00:07 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:00:07 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-netifaces: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d7f4966b-4923-722e-9004-fa9a5dd46476@windriver.com>
Date: Thu, 25 Jun 2020 09:00:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:00:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cab98e7-4978-476c-166e-08d81907af05
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3746DB1FD2ED7EE372A8155B9F920@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i8Mxh6HsTHUcyrIEO8vUnDrepoBmFD8DIB50JoMq92kE5IvY+djejr2YrITdyPKNJip5QPnO+5Kmm+Jj5KdsgELt57ZHVbCW+nvuCg6BlGBQMr+uIdmbRmO2nchRMhjiW0CckTn1m/cKN0KQapALRRWdtDnY8YHyfJ7hhKHLRogg8jkwW2M0LoFgf6vOpjRSZAw5i6EYFr/xcXQB8DzfwPhhcYwkfZuWiMeBnvloKlPWUkSgzpKMR4RZgKjI0bspoudqVM9gf3i6gigwazS8+E6U2CkGv0TyfgGFFGYPvkEnYprH9BXbsr+0v2FM6ZvMHxQDQzsdOqRItcxVkkg3XR3uzbQS49BM+5eNdmDHqJScKwn1DH/cRa4w6wyPCOBkvgMEESltO+K3XVwWGSF6YOD4ItxFk5VrQRzu5mNeoG0aeauXjdAq8x51s/teTW3UR3H0FOryfUhqm3meCbfWhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(346002)(376002)(136003)(31696002)(53546011)(26005)(316002)(31686004)(478600001)(186003)(83380400001)(166002)(16526019)(2906002)(6486002)(966005)(52116002)(33964004)(36756003)(86362001)(8936002)(66476007)(66556008)(16576012)(5660300002)(44832011)(2616005)(956004)(66946007)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	yDJ8oRIQxo7nFdTUvyI7mw+7iWkJ/k7RnlDGRpRHE0juiR/yhD0MK7qJXB+ZljbA/oHrjlv3J3yHmWj8O+M4onpUrDi0CeozNpNEZbxWj/rdfOEIhA6DBsNh8171gnx1zmUP6UQIq9SaaO7s9cLDnTWBGr17Xn9UolQsHCFD7raYCS+rRu2Wo7BS7vofQnlCuayeMWX2+ItmhELnzKIavId5l678mrK8gJ8BXtiZ7MdJ4ZsU3Ogsuu1OWkOSIHqUzT0zA89RjdD1lSESAKgnnPfjeV0ZofsQ58cYVX4JgT+YRjA7uKYQQRWj3WXKvlzB76hLbdvYsWlnyJ4YRn7xoeVGkX6Dbzi2qBThp41yw/jFaAesozmy8GsLHVog1CwrYMDFqqDWY/ULgJKlx7IpEa5l/uHGvY+88G+rgYJO/I1Pkra09tjyeLZ8Psgu21dgkHCDQ2bx7vScB3tUgi2jGygbj5V6g4mErOOqJlqn1zL3NoHMK2SrVbLnX+87xIFX
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cab98e7-4978-476c-166e-08d81907af05
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:00:06.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJNyGXVJXlwxX7ndb0nAor0HQXgMcWfpUU2tITp2/WPzV2iEnC7mb01CRgjwqYGp5lMuQ1iqTuLQwltzMU6LOlFteYgSDf+GByrRQoKUIfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------1B459794C405CBE9CE118DF1"
Content-Language: en-US

--------------1B459794C405CBE9CE118DF1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-netifaces.inc     | 10 ----------
>   .../python/python3-netifaces_0.10.9.bb               | 12 ++++++++++--
>   2 files changed, 10 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-netifaces.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-netifaces.inc b/meta-python/recipes-devtools/python/python-netifaces.inc
> deleted file mode 100644
> index daccc4fba..000000000
> --- a/meta-python/recipes-devtools/python/python-netifaces.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Portable network interface information for Python"
> -SECTION = "devel/python"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
> -
> -SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> -SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
> index 69d5c674c..7edb7e7fb 100644
> --- a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
> @@ -1,2 +1,10 @@
> -require python-netifaces.inc
> -inherit setuptools3
> +DESCRIPTION = "Portable network interface information for Python"
> +SECTION = "devel/python"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
> +
> +SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> +SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> +
> +inherit pypi setuptools3
>
> 

--------------1B459794C405CBE9CE118DF1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-netifaces.inc     | 10 ----------
 .../python/python3-netifaces_0.10.9.bb               | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 10 insertions(&#43;), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-netifaces.inc

diff --git a/meta-python/recipes-devtools/python/python-netifaces.inc b/meta-python/recipes-devtools/python/python-netifaces.inc
deleted file mode 100644
index daccc4fba..000000000
--- a/meta-python/recipes-devtools/python/python-netifaces.inc
&#43;&#43;&#43; /dev/null
@@ -1,10 &#43;0,0 @@
-DESCRIPTION = &quot;Portable network interface information for Python&quot;
-SECTION = &quot;devel/python&quot;
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df">&quot;file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df&quot;</a>
-
-SRC_URI[md5sum] = &quot;de92cc322b4f56047c073f802ad77860&quot;
-SRC_URI[sha256sum] = &quot;2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
index 69d5c674c..7edb7e7fb 100644
--- a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
@@ -1,2 &#43;1,10 @@
-require python-netifaces.inc
-inherit setuptools3
&#43;DESCRIPTION = &quot;Portable network interface information for Python&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df">&quot;file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;de92cc322b4f56047c073f802ad77860&quot;
&#43;SRC_URI[sha256sum] = &quot;2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1B459794C405CBE9CE118DF1--
