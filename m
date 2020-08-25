Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.42])
 by mx.groups.io with SMTP id smtpd.web12.12525.1598359381403163735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pPpvHH1F;
 spf=pass (domain: windriver.com, ip: 40.107.223.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCgXEla6nbeFoeTxK/wb/bwZGaf2Jo5S8PIL8Z5qBxLi9LiIGhtu6R7+dZzPi5LSh02Q3S+0wtMAIxDim5mPS/HTMbv0v0GuPV1w9jacDFAZyWipiJzfLbtbE2T/59GsOywjz1z1wxXNLxP7uUiXhq9NCrX1kUMqN8RIdx9smU/v1ekCYKf8Zuz1VsJ5Sxqp2dACsPOvbL/Ep9+68NznYgVj9A7vsYnzbC6APf6nmmHJSMnFnvN+kDSHJX/nbArHtEljrgAawOK0pNn9jfEgeO4/DrZ3A+A+8w2wmIS2A7zrCf/XYltULpqgHeYGvJAm4Nqt58O4sKPuH6UytB+2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tE8wrg7d0SedP56m32ubxWAzGzEMoCeIexKr4xLh2s=;
 b=T/Lva/IkHesnaZC6P6I7tl8U46DmtYW/xlg/PlckWgMnSKDeLdXKFzg5PtWTwosBh8yYnfXCZ9lArXU4JUij+7cYIHIskHQ5Jj1hITTHJxgfx5x8h2WiovyOe966hWlyndZTysE1+ytcQhyyu8MMJtHZ3tfxsoqDRmI0lx2bZCT3NtIfOaEMo1I6uSiLEjqBHtS7O9FTfAkXfNVMRUc92GtmCuCdBMXpeGC3hZgB1R88rY91gv+XaSdqgBmBDflADq47pYa5Rj2ODi77Qa4LglPDTYMC1j/aCBXDKdZNluDZNHhCjpeRsG+P3xtTqeoulNKxtH/vnWiUok8IlpvpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tE8wrg7d0SedP56m32ubxWAzGzEMoCeIexKr4xLh2s=;
 b=pPpvHH1FidFOurjM6CjnOqkfIvtcVRvtakG+swx5ysDK+ygOy0a07UWRyu15UwM9rRQ5h782i9RBZFdK3taQRkab9fC2eTQOf0weySfjkyCHPmwT7dsbC9TIFgUzZzgF/sijspvJKdNZUj0O4lfE1Q1gpr5TpisfKaCK2lRwHYc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:43:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:43:00 +0000
Subject: Re: [oe] [meta-python][PATCH 10/11] python3-click-spinner: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8bbc0e09-8a14-bbac-168c-1b043b700b3e@windriver.com>
Date: Tue, 25 Aug 2020 08:42:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 12:42:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8785d73a-6512-41af-bb2f-08d848f46670
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42609AD0CD69B0843AA6E2889F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mwvLLh8Y7RpuZM6QqGOz/awzLRpmwQCyZRNa+tkQfRx/Iz6yTGL9OVz/xe05G6fRB2wlSZj1pmK121xbGEcySOhORJVcBhWzrq7xUS68k2TN4Xg3iS6h2KLa6XIm+9flZrh1s+kkobIrBFJKlkjVUoBwmhRzHQzId7z1bxBqs3FIYjt+MvARlLNAvK45B102f0wiMPy61dL9VrbTeHu0jbUHuVNnHDms0984vSoM97pffYwrKvEFmsUWEeZ8b65vjQ5jwkk6iQxH9tPSw/LitEzIeyvBI1hnMRyafJbvqEn91NFedECldYSVYQE6GeAvjF3mj/vHIdgFzO/+KuSdUiExznaL+SEYRV0H5hQitmbTQVOa6fHVvBkCciqmDT5vRYp06GpR7odOW9/lbm4Xnz5W7XMz1BalJHzsRbfrzZBCvgXL+sHymsEQm6EXwZc1sWYDX3GDNMS933KZ3ms80Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LEKFf3L2lExzFFZ8KRtW2fsITeRt1t2rBvPHUctM0s1J4aNTuz3CcTdiQu3qJn2m7L30ioXZC2H6g/i1+xED5P607oTUiXycVx5NjYIRqxltYnrcYBiDUOHuinIT5HyP2t2FhXQTdsGD/d7NP3u2T/wXzNU5oJ7j4ByZ4ed/sZUQEiM4A3DFjQd6J6ikt8PXezEpvSLkRFHR5OSIuw1+bjsA7TzcPosD3cyDmmrY5qDl0fePW+Sscu9BzeKPQGbcbcHh4XJKWJzTUTJzv334yJced+kv/J7BqyWuWqnrzJkQpUnvyipYOWvlwl4B2Na/QKLQeIS4PerhYFF3OuI5BlegKtoTDxWds/SNu6xwsgdJJ+NwYdws3i9SbgmIQV5fLW/zqaA6rtxNzjqGb7U6s+QrjrmLrssJSRPBdNzoX8gijK+vVj/AFBVRv064eO/KRZzNrKMGkRM1sKkYiGPIgx3LQfrd3S87PY2hsh9G9JLhb6lX0uuYyn9eoeuQ/qkb8Dof7eFLZxfSvfvKldSQB0q196SzkTxSRyTjbQ1BV9S4O4c1SpgefJ8MnSj2shJGW08/VrjFSO7gmiJnFZ//v/y96eKN91CH/MUkkMTtNQMS1F6KOjx2RtPMRxRwCaqQZQVuGg7FbTfgLo+2Gbforg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8785d73a-6512-41af-bb2f-08d848f46670
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:43:00.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJw/Oqb5aPzzXSN659wszGEjrizAKFG4+qmSY2bJdsFUNFWbvZGm0AmOmeQlTqKj1nFYr9IloosFYaQY3Diiv5qqvUoL7TfekYVKOb2yvD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------AA4C9432F2D21B32C98BB8C8"
Content-Language: en-US

--------------AA4C9432F2D21B32C98BB8C8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:45 PM, Leon Anavi wrote:
> Add recipe for click-spinner, a spinner for Click.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-click-spinner_0.1.10.bb               | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
> new file mode 100644
> index 000000000..418f8a32a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Spinner for Click"
> +HOMEPAGE = "https://github.com/click-contrib/click-spinner"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> +
> +SRC_URI[md5sum] = "ab68ed404401421819c81cc6c0677a87"
> +SRC_URI[sha256sum] = "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
> +
> +inherit pypi setuptools3
>
> 

--------------AA4C9432F2D21B32C98BB8C8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:45 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for click-spinner, a spinner for Click.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-click-spinner_0.1.10.bb               | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb

diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
new file mode 100644
index 000000000..418f8a32a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;Spinner for Click&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/click-contrib/click-spinner">&quot;https://github.com/click-contrib/click-spinner&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
+
+SRC_URI[md5sum] = &quot;ab68ed404401421819c81cc6c0677a87&quot;
+SRC_URI[sha256sum] = &quot;87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AA4C9432F2D21B32C98BB8C8--
