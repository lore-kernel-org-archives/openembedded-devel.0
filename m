Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.49])
 by mx.groups.io with SMTP id smtpd.web10.60723.1594050617183774020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aszgBYbp;
 spf=pass (domain: windriver.com, ip: 40.107.69.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElXspGLw1xpDsfl7uH44jucB9+C6vVrLpXZbjhTVo6SkjMjCtI+DFWHSQlZEnX0GactF1XJUXgv6zymQH25/WigHSDX/Jj2F//1uafRLzRiRODNJbuJ6C5zosqBy86gQMqqBXYbwKhUq8Fvw5JDlX253f63FH/KayRV5rlV+E1MM1XE0Xd8IkiqW5K54xVwrWCsymqUZ3n1syyKIiRoAp9wdg57zdnAEhZgLwbP2eUVo4Sfr+9LG7OGIMlji+Nv57SnXPmCb8E9x2EcAF6QyW3M6EPQiDVcSerTGan9Ycc/uSOU6xwirCLIzNITzTcvMSCfxNJfmMJd886VDUYCRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNGtNMjQkofMPZP3r0W4JqMFJZjMUfwqpBBcaR4fUGY=;
 b=jlp8fwtRGG0uDTuUmwzcvxxpcV2+9WmSCdGidvqe7rnM04tj4Ayx03YOqFclyjQ2YTtoEkotrC/e3+1wMPLQLx92NNC0b8k8CUbanLe6zaQ7XFD//PW1ohW6blJI6plh3dwmcDjczWegdGQmmARyTMiekyTpPOxizwBGomcx68IKtqr3knEjdl1W6gTZ0rc6ayk78N8nS0VftgY+ic9ZAaNPg5HsGvE9e6DzLNEoVXqjZI/nsFyJnSZj9j1hdADZv5bCqdX0nSFPLkTPc6zZB7/JfRlszpz+dhNBYbvoJ9s+oBPosSlAx1kfitk7tk5w6XiAU0FcBmI1u9QeDoHXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNGtNMjQkofMPZP3r0W4JqMFJZjMUfwqpBBcaR4fUGY=;
 b=aszgBYbp8hcKYMx3ObQ7+g8UnIUmvzbJIW0aYtTXQsUSTdWTyYtTn4kx6dsdvm0+eACsoQggY4z9H4d8mbsMII8W7Iv/FSeOvCNYPbtVRDFynxnlmMJvaioa3dcA8NdXGCrn8k2vgpctn3Hbs+g6qggqKDKuCZKxnFU6hbfO67A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:50:16 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:50:16 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-sympy: Upgrade 1.6 -> 1.6.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e97fdca7-54ff-caf5-26a7-519717ceae95@windriver.com>
Date: Mon, 6 Jul 2020 11:50:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::19) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:50:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aefdbd6-496f-4b72-5c3d-08d821c446ff
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1899D67C113B9F226B2E3E059F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z/AOT7DnGKkySH2/9eNfv0Sn0sVX4IJcFFqYTbntt/WhPNIV5Yk1wfXGicV+qp2lhT0j/BigTP4Xz4RaBv3UAWeUmTC/Ilx6c1i+BHftO9dJowxwN+qXvQo+LtrPcQ32Y31bA+7wtEhYPkffG+n4djjVxBXhfTkTuhZpU2sqpmHO8VCZO50cTwXh0c05iRoOe0KYZplYjX+hlvc38KDL/u5m48XQFlXHRYa+n+xyFJvsT8SakLoc37xMsZmOrfKJdhiW59faohCd2uurmv5YxhgyrZivtO/HeB9bX4ILpeNbpFdAmREIUhjAsyjj0OWUM8IzJwy3CxOuRf3yBDInePKuDFK8bxwdh4WAQ+gRwn8/VeAeCziUM/AEh8Uqt5Hzk2mzBfVvfc2XjYowpYrFkUIpZWZcnfi1bBZtwQp9Ui5onPisoX581yAB35lnvwifXcxvlAcSkii5iC6TP3qPKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dsjAjZs0vK3Y1P6OsaFGI21qHGlTff2+2dLIKq/sTc+rR/rKbpUocbdzyBenJpHbrHCfoeHJn3B7TYDBN0mtG86DL+VxW7Emr0xaGX7EzXlUHtj9FYlKDqHYL5hvUc0RsxSv/sVVM49/OcJLjPSFn9cXjTNGuVR3vUUyRQXYL94Zwdy84FDoq1D13l4xoIc3YlKOrc0+MXJCAvEfXPuGSSVc25XjmzSRLNJMUNlqjTJBIgUW9OHViaM93+6M8A2wWB/TUG5pLP4oOB7k5wyp3rNbkpOSiLwJ/CICwNnFXaEMeFBkRdATWW12heoLMGPFJxG/FRJwzXIV4IDXrVrn08DBT4KW2jUfU+SovE7hUPTZij4lffFq4Xhlf0UHyvl5zhijJk8hw3TWcToxQb8TPFb3JndWrdZY5otkqhWyW4mSh4CX9EaWFJunmCZbAio4PcCW+9GOeP1Ffj9qTZAvCV8PonOor8APr4W1+g/g81F+me+FhayJxv4Sh/Ok0i7z
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aefdbd6-496f-4b72-5c3d-08d821c446ff
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:50:16.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpQxYTsHw/iCRZTIOef3yPP14XC8PAIQMMIhUiTVtHq5JzMudT3MAllqv8MUtMn+k+Aa5tXa6YRJwzgywewkjCVkaJi4sSvZLXtaCdF99bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------363E6058F294DC803EFDAB4A"
Content-Language: en-US

--------------363E6058F294DC803EFDAB4A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 1.6.1:
>
> - functions: Fixes AttributeError in limit evaluation
> - matrices: Disabled default matrix intermediate product
>    simplification and changed it to enable via context manager.
> - simplify: Fixes a bug in collect when collected symbols appear
>    in the factorized expression.
> - solvers: Fixed exception handling in solveset's secondary
>    trigonometric solver.
> - SymPy is importable again in Python 3.5.1 (imports of
>    typing.Type are removed)
> - Fix the sphinx docs build for sphinx 3.1.1
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sympy_1.6.bb => python3-sympy_1.6.1.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sympy_1.6.bb => python3-sympy_1.6.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-sympy_1.6.bb
> rename to meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
> index feb9e10e52..fafd591a8a 100644
> --- a/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
>   
> -SRC_URI[md5sum] = "dbb7b21d2972c41f37d48f744b6189a3"
> -SRC_URI[sha256sum] = "9769e3d2952e211b1245f1d0dfdbfbdde1f7779a3953832b7dd2b88a21ca6cc6"
> +SRC_URI[md5sum] = "8bdf8473751722fd1714aa7125b1478b"
> +SRC_URI[sha256sum] = "7386dba4f7e162e90766b5ea7cab5938c2fe3c620b310518c8ff504b283cb15b"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------363E6058F294DC803EFDAB4A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.6.1:

- functions: Fixes AttributeError in limit evaluation
- matrices: Disabled default matrix intermediate product
  simplification and changed it to enable via context manager.
- simplify: Fixes a bug in collect when collected symbols appear
  in the factorized expression.
- solvers: Fixed exception handling in solveset's secondary
  trigonometric solver.
- SymPy is importable again in Python 3.5.1 (imports of
  typing.Type are removed)
- Fix the sphinx docs build for sphinx 3.1.1

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sympy_1.6.bb =&gt; python3-sympy_1.6.1.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.6.bb =&gt; python3-sympy_1.6.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-sympy_1.6.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
index feb9e10e52..fafd591a8a 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
@@ -6,8 &#43;6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/sympy/">&quot;https://pypi.org/project/sympy/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4">&quot;file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4&quot;</a>
 
-SRC_URI[md5sum] = &quot;dbb7b21d2972c41f37d48f744b6189a3&quot;
-SRC_URI[sha256sum] = &quot;9769e3d2952e211b1245f1d0dfdbfbdde1f7779a3953832b7dd2b88a21ca6cc6&quot;
&#43;SRC_URI[md5sum] = &quot;8bdf8473751722fd1714aa7125b1478b&quot;
&#43;SRC_URI[sha256sum] = &quot;7386dba4f7e162e90766b5ea7cab5938c2fe3c620b310518c8ff504b283cb15b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------363E6058F294DC803EFDAB4A--
