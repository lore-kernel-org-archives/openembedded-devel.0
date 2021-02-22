Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web08.34860.1613999946588932922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hkTv2sqG;
 spf=pass (domain: windriver.com, ip: 40.107.92.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9L3ZJjLbSGyzkiSRJszQbe0Ubx2LfJGdLajxqJNzARfAXIeipJXpnyqFKO0+AqVGKyDF8YlSLev+MDYzLBa/moVOvasJjQ4RlLUMUaoMM1JgtB58QMqRbhMwo6mpdzioPjR7nShMGV4G2x2ctgZG0XJAPL9H0fmM+w1QMdrlLZPfDXu4DdwoFtOJvigQkp11V6E6eGTzZcsqQQvR52bga4Rn0CwZYTBhmCGfdV26RQpl5MTE37gWE1au5X+I69SyqrlDCHo6nLZLmItW320YArKtqfuVNBix7lFckcUNkckgcaL0Ef32fmbOQad8X+sTyfMtF1EJgKK8BgtqlucOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2gyfVK4NDmGtFb/9ppGSs/cjecCymFFgYovhCMm3zE=;
 b=l65b0MIBt8OKCeqwr9FOhOUMSouiU7YipQb4slo3OTtBDAUsfMGtMjvn7kmQc8Recvw/PnCaEutuMpIKzrilpEgrVNWcbnPi1cl+TVXGaLG5I6fRl+P4LsIUqJpIW9SDki5QQJwV8oQm/u5VOH5V7TMkLJdYwhML/y4Z1L8JiVgIJD+1C9OLvVQ8FId6duhAyqhE9AUcN7r9mtRTCcjB1xAgZsNlpYAtK+DtpOtlR4gS7NppRP4LIj/1PsqJWAXhoLGGnAxnnL7i+45k2Vfq2HsLayvJ4mFardLOZzJ8fnLJ8PkICDJMgPC8Sonelylu5oeg/yMQIKZ86jD2UNFPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2gyfVK4NDmGtFb/9ppGSs/cjecCymFFgYovhCMm3zE=;
 b=hkTv2sqG4yJwSIsOHAruIJfv1sBek19yUXiNvEe+vG2014tBDaST8DNQ1QSsQFTF9i9KOmpK3bnq+iKUdR6w9iDSz6JY3lvWxF5izuuo/8oJlh0hS9qFjkyljvIH06ZXiuc/aZG5+p6SKeL5KSdgSijomhN1PkoZWm/+ggZIb9E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:19:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:19:05 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-periphery: update to 2.3.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215500.2368332-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <efec4294-f003-0a4c-cd9d-4c46a7bd923e@windriver.com>
Date: Mon, 22 Feb 2021 08:19:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215500.2368332-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:208:134::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0014.namprd16.prod.outlook.com (2603:10b6:208:134::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:19:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffdb6075-ae63-4411-10ca-08d8d7346d7b
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3893C3205D18DF0A358C82699F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ego4sEovRA/20Etu/7hAVxqCNezDTuk5A1ToAIn5KfgqoWWDqAkkjA3zbtmfEQBKg6DY20RCI3NGrGmlN/izJ0nIdN0lwlO1MLdIHhEykqpPsXLru3IPSnt97YdIlomHv9OBUz5u/kKcHjGQA3bVm+7pStu3gaSqDUwuVJZHykBpc3F1MpYIAnFtVEskku5c+dpwCWDxZlyIhlsJ+kRwAG6fDunpBNTp1HygU4SAI5kgsGlkWCXmyv2OR53xaUs6QN9ek0MuT0XWkDIs79dqXRnCVB1lcZbBvxzb3/01oCzXUw3noVhKzApaMKZmfjZyNg5aMgkUCN1rl7P1ajd8AYTtksRQLFE979ToYXu6Eb39sp+Lnxg5qXZMkHmRpDQob+tS6KFc6nJc21/MLlGAdxlJ8vauov6NfVnsU76khJFciKJq9INUIPF+YaCZA9vidcQeUHAZZRHp4md7vlmWt103EXFO7UeprWXkYNLjoDOFVWkjUZGZYnSBXY2BkWOa09jI1aprYZcIKWz0p4h8spqtmJDIVWnpqAk8KGA5ZVLeIJXx11xYQyK37znF6KkhjCjYThZSf4E6tgxfq8Y+LixstPi72eMZzgnPVVtOhyuie4NRP2YejFEzpdSHHAj4G5PlX5bMwpDv2x7hGMfZzMLhEH1d70j0EEMCn++wgKwfgpmF1GtdHF0JnPK+BIvf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NllzVW5pU2czeTlLWHFRZ2tGeFNxbTBiUG8xa0RGa2Z6T1RDU1RyVnl5b0pU?=
 =?utf-8?B?d3lCUkFjZGhEK21MVkdlanJaNXZPazBtaXQ4ZnVBTE0vQ2NQZERFcXRGK0pr?=
 =?utf-8?B?ODBJL0tnVWR0UTJoRStnbmZCZyt3bDllajJ1UUdWRmYxbGE0aVFxSU0wM1Zp?=
 =?utf-8?B?R3BUTDlnS2RRMWVOMUwreXlBd0s1bXJFdWhmWUkvZFF0NXVNNGRVTFhUTWtF?=
 =?utf-8?B?TXBZUm1oK0d1VUVTNWh3b0RKQ21Zay9RbjQrYWczaTFYQ3ZzbCs4L21iVUZ4?=
 =?utf-8?B?ZDUyTlErRU5Jam1ibFkzcTVscGc2Q2lPdHJCL0dzVDlSTlgrOGdncHJlY3Bn?=
 =?utf-8?B?ajhjWVFuVWh2QUVlYjF6UE1NamFqQTczSkY5Y2FoTC9FTmtWQWZaU0lnNGRV?=
 =?utf-8?B?UWJLS2UzM1ByUjh4ZFo5aHlFeXFsV1JSQU04MGFzZ3ZiRWxkckUwQ0RSL3Ax?=
 =?utf-8?B?LzAxUjV6a3JzUW5BbmI4UlZhaXdOK2NXK2pCWWNMT0ZXNTFNOGRhZFB2REFM?=
 =?utf-8?B?V2l0Wkd6QlJPWXRETzZ5by9nbnpXY1Z1ZUE4MldLakFISUQ3K0tBSVN2S0k4?=
 =?utf-8?B?Q2NzYUlGRjVSWGMwemdKZDlpOUFRQ1FOYlBFeWdtLy9mSDFYeENzbzhMemdJ?=
 =?utf-8?B?VFFHK0hHTlI5YVkvRHFzUlFUWU9HOGo0YVAvbTFnVTZpMVNtSUZUeHJ2WmZ5?=
 =?utf-8?B?N21POUpyemhaUDNiWkpORXRBUDJ6YXN0N2p2Z2pnVk9yNnVad1JRSm8wUWx0?=
 =?utf-8?B?NEJrN3FFUjRLVUMwbkNRbWR2Wng3em0zcXl4TnRpUmNvNVRaNWtiaXRIOUdT?=
 =?utf-8?B?cXY0cjlDU200T01wWU1wTGh5Y2JIYzJLdlhsaCtlQnl1ZjVJU0N4TGpLZmZE?=
 =?utf-8?B?azJRU3RmUkRnd3lORVk0ckxjV1lmajh6MzF2RWJDRlU3K1Ntblc1MS82ZkVD?=
 =?utf-8?B?ekVOYlllUzRnbmk3WHVWb3YySFgrWjh3c1lNUmZ0WGNzb3VJc2hVdGVYY2E5?=
 =?utf-8?B?YndqYU0wYVVFZE5ZbFM0REM0cDY0WitYMTF5d1ZOQjVrSzIrRlIzS3NLNDFJ?=
 =?utf-8?B?Q01zb0pUeTJubkJjMVRIUHdzZnpLcGpCakx5a0VBU25Ncnc4MkxUMm9nSTBl?=
 =?utf-8?B?amZlbWp5MndXblo5cEtzNFZMT2MyQTNtNFc4bjRxUkUwWWtCc2JNN3c0dWJi?=
 =?utf-8?B?Rng2RkN2ZGQwKzFaZjF3azAvKzhqL0RHWWZGQndBaUVhYnJTd3FiNTF1eXJM?=
 =?utf-8?B?b0drcm5tYkNNYnN0cS9YNWc0U29mZDdGQ3d0QTdRTlNwaHdVYmxySng0QUNx?=
 =?utf-8?B?ZW0rdDN3TEFrWXI2YW1VVk9xbHZwNTZhN3IzSXkyak00VVgyME9QMGdMc0kr?=
 =?utf-8?B?ZG9seTdITldsWllrcDdZMXhCeUFHbFZzbWlWMWV6aHB2L0ovQUZhYkFpcGtp?=
 =?utf-8?B?ZjVWNDRsNUFqSTc3VjBsMStlTklvaEZseVlTbDg0aDdsMThVbC80RW1jcjFo?=
 =?utf-8?B?UUk2SXFmK0lVOElkRndSNk9mTGdvdWhXeGs0NlJaZXhoNVhNVjNweTRXdHp1?=
 =?utf-8?B?Wk9vY1hVSEZ2M2xDMWRtUzlYZUZIVUhlNDhSdXZ1bmlQUHpSVEE0WUV6R2VX?=
 =?utf-8?B?cmF0ckpKMUpYTXFtQVJadDZ1TVdMb1RmNkRQNk5mT25ReXVuUHFVK3c2RzRj?=
 =?utf-8?B?UENMRHN1NUtNalVTOHh4TE5pYlg3YmozK2tsbU1ldWJaZk9VU3VKcjVPSmwx?=
 =?utf-8?Q?SIu0aSbn88DfVnIhgvIE6saE6oSbPaP+nqUEFoq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdb6075-ae63-4411-10ca-08d8d7346d7b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:19:05.0486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38cNmgtEC07hUrJxzsW3nEU9t/LF14daXm+FFiSZioYMFTSp0/TQiddMDNyaU7cXJGt01Mss81G1v9mteWVJBLzpHoBc2F9IgiW8+j9cOWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------C9F62A8F2C2F6B8903FECE2C"
Content-Language: en-US

--------------C9F62A8F2C2F6B8903FECE2C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:55 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: copyright years.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-periphery_2.2.0.bb => python3-periphery_2.3.0.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-periphery_2.2.0.bb => python3-periphery_2.3.0.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
> index a01071151..9e3cbb43e 100644
> --- a/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
> @@ -2,10 +2,9 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
>   HOMEPAGE = "http://pythonhosted.org/python-periphery/"
>   LICENSE = "MIT"
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fed1784a083509430580a913df680706"
>
> -SRC_URI[md5sum] = "0a5b866443edab0dab62cea56ed96f1e"
> -SRC_URI[sha256sum] = "391e5bdfe2511aa7369002d4861df795dbb2889426b1b2cc1e6c9d85939da4dd"
> +SRC_URI[sha256sum] = "8a8ec019d9b330a6a6f69a7de61d14b4c98b102d76359047c5ce0263e12246a6"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------C9F62A8F2C2F6B8903FECE2C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:55 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215500.2368332-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215500.2368332-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-periphery_2.2.0.bb =&gt; python3-periphery_2.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.2.0.bb =&gt; python3-periphery_2.3.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
index a01071151..9e3cbb43e 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
@@ -2,10 +2,9 @@ DESCRIPTION = &quot;A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pythonhosted.org/python-periphery/">&quot;http://pythonhosted.org/python-periphery/&quot;</a>
 LICENSE = &quot;MIT&quot;

-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b">&quot;file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fed1784a083509430580a913df680706">&quot;file://LICENSE;md5=fed1784a083509430580a913df680706&quot;</a>

-SRC_URI[md5sum] = &quot;0a5b866443edab0dab62cea56ed96f1e&quot;
-SRC_URI[sha256sum] = &quot;391e5bdfe2511aa7369002d4861df795dbb2889426b1b2cc1e6c9d85939da4dd&quot;
+SRC_URI[sha256sum] = &quot;8a8ec019d9b330a6a6f69a7de61d14b4c98b102d76359047c5ce0263e12246a6&quot;

 inherit pypi setuptools3

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C9F62A8F2C2F6B8903FECE2C--
