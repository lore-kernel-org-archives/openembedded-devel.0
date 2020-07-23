Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.54])
 by mx.groups.io with SMTP id smtpd.web10.2252.1595522860808948106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AFsttxTX;
 spf=pass (domain: windriver.com, ip: 40.107.93.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEV5CJoKNV2dtKiIVapql0oLjnOhKqzzOghkrFoKAxTMitJ12plKOS9+UBWEkdXX10Oen7hnrdqD1NG7V+foifgctyUQg7vJJw1+R6PNOEtfeU7EKUofGEQHzRBUmaJOgGC+lHLGWROWk5NG1W3QnxQ/Jl8rhguhW5sO3p3VGvf67QrJ1QsiUrnblgdkkTLKc68xVtdd1FrJP32/0+8Q5oYMsprhL5a05quEmZYzNaDCinilpbbQA3F8JXUyZkeshGjW8EzUQQxjjn2OiD7h18isktfNALyrbNjn8DKwT0hOJG/p8B55yE7xY+E84hGNEw7eLiA/hQM7Ziwv+gKzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKgya6s05DUYrsIzUbciJL/f2rXTTMkSssjxMyCnavo=;
 b=mA19Sc6D3/1ByV8D87st6+jGzppU+j/OQegq6AxQAmksw/XowBKQtTiU8+YFGGlZzMb739USe8yB5+/S1buZZFWYEgtzzl/oUcCwRkOpEUYjl54ZRKCPEfT0ti7K3922BLYYYteUHgOVPJlc5Yb+NO13WtbaYqf3JgKjBq4jxWWT7wQwAfXg1LVGGoFo7xcn6Q5JyP0WJ4tbE+zvCNm34ueRern8onCwIbD+ruPlM50qRbKn+1yFYQ8BhNgWczGszPmCWqmR/pWV4DOohP4cnQf1pL6TFf6bnigwjFWrqdI1yk8AWSkNwE8afRsqgjAmNesUmbV2SVjpvYPiR62P2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKgya6s05DUYrsIzUbciJL/f2rXTTMkSssjxMyCnavo=;
 b=AFsttxTXZZlt3o04lPGdQOwvw6GR/1DTgUtNoTHlacXQAofvx5KBDk9vh8DIPL5zKP/l1x+Cnz8O6xWd9u+VuDivWPfy6/w4gF3ZJTa/P2ytvpmGU0QLrasBrmzlcoY4ZxY5sX/WkUjRTIjFVYFBW2OTaGE6FYZDGghdX9j4O2A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:47:40 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:47:39 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-isort: Upgrade 5.1.0 -> 5.1.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
 <20200722104905.15499-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5cc3e7d7-6ef9-fc98-ab69-b34e3671f55b@windriver.com>
Date: Thu, 23 Jul 2020 12:47:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 16:47:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 175aa991-777e-4b21-3267-08d82f281c76
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41310A31FDD45470772A5CD89F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7I7DZ75Cbpo7Xrc71IIRI4qbcSO/GE5l7YIPd/Uw/2YmeNR7DOPhl3sI/yNP9VIQC4AbjaQGMDWSbOCW+E9O5hWNN9o1tGyUVvQlAuT03SW66s45jtyV8Rn9Slocb2ALhX2+jMYhnwnoQ10cYwYs1HvVWr2quDsHYbuW6B0jf3uvn0IxuxbHIvph8qG7eRnqBl5MwNkGeswZUUiaPk+c07xXETySGm5bYfQezuggYPlUAvYRkO22r+vslibZLy5Yhh15sMRFCazfHs6wGuyHWus6a391ye+6PovW+UAzUsXY5zQuFeyCqLgoU/Hpq1bQ14ZufFFAKunoRiMaxNa3rbBw9G/SF+NfcI0XM4UPjnxBilgejaX2bW89EXvz9/3E3L8fJQALkJRB6R2s6mJhPKhf/gJPNVxmh8gkPq1ffH/78bnRR1Oe/eThMBiN3zqux4ggAyXrdkHj3fG+bT0qcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(66476007)(31696002)(86362001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	J7WnRYFsCqM0thfJ9dxLiuOCUaKlnkpAMZMYcn2UYbhGtLG1AwFWOUbDgZQwDzCdBxlxgGaIQmdKMR9JOXgtr9dnL65P33UtULSNn971B8ZwDgOhRMKUVOHaxKHgPNX8k2yKxLnBtILJ7YtkbIFDFp0J0sud4OmMVCSKtHpXuJ5nCuxRl2pocD/0SFCj3i6y97eua8iJrj3O1+YU4X527+Sq67JvAYUBL4l+69BVtlxDvR6fYR2Qs6DvKznss8c/0EsIsGa/DpCzg6sId9AE6Ynu+vDIEPhlxgp2jwubBhTJyBrEH6vf0kA7zrKx7W8ZUOEBC3ZVa7sA7D5EbtqCoHW9yb1AUiQ0lpbfF/AFsKf1PgqMJIOr/d83MRZFxRm9mcBGN0XW45OUDPZxHypivlQZIiWaKTOHYbGn7SLnIKe/tYe0nyKF30LNwXA8vl+1jlr/z6DtHiPbSbqTHYu+gIRpp7c7oNbSEVFyc6Bdz8s=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175aa991-777e-4b21-3267-08d82f281c76
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:47:39.7969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhDuSYIQknE50w9uK9WGb2tOX5IfdHSq5Hxy9BOarga4OOWq5uywA++LALLIZktTye/QvYORmEydvf67xNzhpeAUEY7bsV90bR1+lUlij0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------67D2F10C616DE341326D285C"
Content-Language: en-US

--------------67D2F10C616DE341326D285C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:49 AM, Leon Anavi wrote:
> Upgrade to release 5.1.4:
>
> - Fixed issue #1333: Use of wrap_length raises an exception about
>    it not being lower or equal to line_length.
> - Fixed issue #1330: Ensure stdout can be stubbed dynamically for
>    show_unified_diff function.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.1.0.bb => python3-isort_5.1.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.1.0.bb => python3-isort_5.1.4.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
> index a57b22361..59ff2ffe1 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "9e47f58de573c3fab674a70f0512e9f7"
> -SRC_URI[sha256sum] = "b19b7ebce5e292507afa8fab30dd666011dd5ae8f4ef2a2d431751dc84c22140"
> +SRC_URI[md5sum] = "64d552bbcef48219572cc39649c48fbd"
> +SRC_URI[sha256sum] = "145072eedc4927cc9c1f9478f2d83b2fc1e6469df4129c02ef4e8c742207a46c"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------67D2F10C616DE341326D285C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722104905.15499-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.1.4:

- Fixed issue #1333: Use of wrap_length raises an exception about
  it not being lower or equal to line_length.
- Fixed issue #1330: Ensure stdout can be stubbed dynamically for
  show_unified_diff function.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722104905.15499-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.1.0.bb =&gt; python3-isort_5.1.4.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.1.0.bb =&gt; python3-isort_5.1.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
index a57b22361..59ff2ffe1 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
@@ -4,8 &#43;4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;9e47f58de573c3fab674a70f0512e9f7&quot;
-SRC_URI[sha256sum] = &quot;b19b7ebce5e292507afa8fab30dd666011dd5ae8f4ef2a2d431751dc84c22140&quot;
&#43;SRC_URI[md5sum] = &quot;64d552bbcef48219572cc39649c48fbd&quot;
&#43;SRC_URI[sha256sum] = &quot;145072eedc4927cc9c1f9478f2d83b2fc1e6469df4129c02ef4e8c742207a46c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------67D2F10C616DE341326D285C--
