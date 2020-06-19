Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.49])
 by mx.groups.io with SMTP id smtpd.web12.10653.1592583576608126226
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oGn4C6M1;
 spf=pass (domain: windriver.com, ip: 40.107.94.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7x2t3wFTnJcSCtKeitob46tGi/HR+h88m4LA4B/c5m+q/oGi4LDMv6ZnFztrkzQBANqU22ZH7na+r0tKzoW/6pIJqzQBzhrxdKj9lRS+4JQRjKOpcsMyabTXDCV3LHj2pfaAuNwtD6sI5TClfujK2+cbbSzYRZyySI5gfYnHk3tkt/MRfweuxj6RVvTFQEjnGrEWk5xDQht9wwrNL1MSoQlIAXrLK+3FS6Ypmk0TBtiXJNPoCfD4ayVS6YOLPA/fFzIj8PQRjamr1DDgTfF4pPikCUDMDkmGB8mCin77FjcBj0QzwnNGVv3aLqwskHE0HrlsxiMvImWgR0U4QlPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGQBC3y8DGNOy/pzHdPikqHwa1qiMAc/GkPnu/oNN7w=;
 b=jBD8LGl7FGaSB07dcj2lbVw8hDKZYReEWaBsUPqG5WK1RTzZpuMSaUZl9WYg7AaHh+/hBkl8hX6j5JUi5osapwTmNFDuruBsDgqfN7YiPmDfUb5ab0alSIlaGSctkr2aPVyDWA8gwA5JQOugiQNSo+c3OS0y/3VjRnWBivcsF9i5LXSAHYhh3T3gA+l/akzmDOhFOFlkoO82SH28LHijbSye6VKSxDC+7H59xaR0h5/ei3EH+UUgPwS3wi1fjEISehT30+D8SqH7Agh2ytUpOsqPvDWjhA1rmveyrZ/g0GEWiR5m4X3QrMKfPpAfNNSEKME1FArDRHaIAQAelutzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGQBC3y8DGNOy/pzHdPikqHwa1qiMAc/GkPnu/oNN7w=;
 b=oGn4C6M1DCGhhi7KfWHh6CayleW4AZcUEPyZd6an1rDPrZWGc9ijR87+yAVIqZGJgl3qFvYgnsZA6ab5yuH5YHgrJaSbocp7cIDSkVB65gRku18u4+nJ1s/bFaTQMBMlef0BvG8PRmAWHQDy1d53FBMUdo5U7UTKUnYK1mPU1bw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 16:19:35 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:19:35 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-flask-versioned: Add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-4-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <60b54d04-9967-e9e7-b0a0-12afe1fc1ecf@windriver.com>
Date: Fri, 19 Jun 2020 12:19:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-4-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::27) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:19:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adceb6cb-4013-483a-b7a1-08d8146c8e64
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954EAA3B566C7429BBA6DDC9F980@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ONn/Is/bqfs9p2pGTXFTkyZZSiFwU/e+djDpwcDxoJCijMMZqb+CjsDNCMEEABb8NzpE4ZO4PnxllYinWhCHtE4OQNhKhMbI2tTwOFmSSsLSZtRjW4o9XtvKm8PILUAX40ZTYa8WnfKiiodrfu6S14aJjfGbdD3Vi4KUvAeDEUb21mv5zs2af7t6DDoaF1d3VCDpBE+mHhjqgCgSaOaDkExM0xKhdeVnkwJTxPyCdj0UZlPvyEZ+7yblYbryw1y/ABgqhHo5oNMGFB48PAe5iSQp2dATTvhgD815M8OgjOjv5/oM8oJLe5RujlaUJ20nuLav7XB7Pru6vPNN0wVYr3/zR2ZxFc4VFJegrbjrABaERNiGcoczKBnv+k5BA53ouK2oSBgdEY+AJHWFvqXNvrIOCdyHe/o4GCHFFstzzIdLC194Wjm5rpKLFPlXQAHQMva3NzWBus6ZmNiymxV3dQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(39850400004)(396003)(5660300002)(53546011)(6486002)(478600001)(86362001)(83380400001)(8936002)(26005)(956004)(166002)(16526019)(44832011)(52116002)(33964004)(31696002)(31686004)(2616005)(186003)(316002)(2906002)(966005)(36756003)(66476007)(66556008)(66946007)(16576012)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WLZ/dP0ULaveqR6dyc3od+75KYcRPqG5Yt1Bhfo804bp39sfoXsL0Fb2SkPCV5A9I7detfTgzTXDojx62HM9Fv+D6zA2dU74v3ZCoCNQEfsyE4AE0c55UGet0v1rkjc2QtPVJJT0AVJh0u3DlcpwZo7JjFIDsYJ5NyHMMWX6IrxmV7TLOrkVjZinZFvy4Zz93RvwuQ9qxesS19Scv5Ipo/4APBrw3uFnkA5YZ3YjzZaS4skCsx+cWgXI9OneaKu9kXQwtMVd7wYMJR6DPW5LZzi9NZBxJRyi/EPcneJFpX4Srf8QWH2pS/47qB7v1Qj1Lp+opVQl58XtMP8OmhJtJWOFUpC1D3EtqKlU9hCjCE/kxFiRXUUVKiSNt5G/mvVPnrpX8x2GummUd4kNcbIlVrAXhQUyW74i/Ww3jBfoExL+0yAQIxUnmm9fB3PbtegF92NXLzVEzStt8/BkseGP+IG18VCYPvGLnMzbupMntYKLkze8B2wLaqk24a8NouJA
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adceb6cb-4013-483a-b7a1-08d8146c8e64
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:19:35.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgrzCT42wCnrCf20DktqOpqe+aYUTfu6w50HznUtUPDTMQ9u2k92UtiZASpFCa+2V48WX5gRfUsUv+fLLyADrnPcg0I/2mBFyp31/q4G5yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------1D64AA44E50C5F836E9C6DE3"
Content-Language: en-US

--------------1D64AA44E50C5F836E9C6DE3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:28 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-flask-versioned_0.9.4-20101221.bb     | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
> new file mode 100644
> index 0000000000..7aaf439b83
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Add version info to file paths."
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://flaskext/versioned/__init__.py;md5=dcb7d97884bf08c256ff5795766bcd24"
> +
> +PYPI_PACKAGE = "Flask-Versioned"
> +SRC_URI[sha256sum] = "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"
> +
> +inherit pypi setuptools3
>
> 

--------------1D64AA44E50C5F836E9C6DE3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:28 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618152805.13075-4-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618152805.13075-4-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-flask-versioned_0.9.4-20101221.bb     | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 9 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
new file mode 100644
index 0000000000..7aaf439b83
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;Add version info to file paths.&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://flaskext/versioned/__init__.py;md5=dcb7d97884bf08c256ff5795766bcd24">&quot;file://flaskext/versioned/__init__.py;md5=dcb7d97884bf08c256ff5795766bcd24&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;Flask-Versioned&quot;
&#43;SRC_URI[sha256sum] = &quot;516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34&quot;
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

--------------1D64AA44E50C5F836E9C6DE3--
