Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.87])
 by mx.groups.io with SMTP id smtpd.web12.7351.1613480317046896036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S11qRjX1;
 spf=pass (domain: windriver.com, ip: 40.107.93.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMBn51jHgeiiFlZAmMp0q0MiFQt5ZSNPcRyauNsDWfTeO58NDGiTHBsi889XsHJGsYmG0rEEk3epmJbkXpKE6RbCZ7AcAjcVrypHVXry5CSPa8b5Wa6WrId6qZhppmRv1couQKk6vVIiaTR0WCsGhcnKCkxswxLDGhi2jbwFmA6Sr1W6kAg3pptDm8oxR1uTxn961ImVhSjSVj60Tv0vMCzH7DC+NYfw6L8EseNYjLsjBppZZUP1Rqehj3i8vrwJJJKb3nNymHYJMtU9xlj7mBXMZCnUoKewlHZpx4WsvUAumy/42II2Za+nsW/VhpoJvD70waOXSIUTwsVI6yIlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfaQX1YXAU3rtwQ641llO0+H5p8i0WhS/HlJu27HcXo=;
 b=MwrcvvyS57UXURc+zS3IOFUHTYYOH8UXsRdtqOorgF6givVU/QOGuxgOBqrW+o5yI0/clN3SYswgC0y1EKD25QcnLPJQ2ToqlH8yRb8JF9rNbxjvxxWTMW3HfotQkEAxYQCrqYSCau9nNhVpL5Wb0XbZj6AZ5i10OW75SsJGZ1e/1Zf2kQ9oqfov0Lu5kBnH1M4kWVTJbyhmQwhwq4NvIsAxyZtPIKjU69cXAiDB0px1/vD+eTfdlCDcgQaJPCZgR3LXQRbQj/fOuSC9SHoV5V238XPUZZT5iS7bF8tt23CnfqhXbxm2+jpbdmTw8qHu4Jzt8OknVSKdRJv0wEXYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfaQX1YXAU3rtwQ641llO0+H5p8i0WhS/HlJu27HcXo=;
 b=S11qRjX1oNYkyEBJ3v+sxhKvLUzXViSu4nBYK1+cv6+TKdF34lpBXnzpvu5cRMaT9qttWxIc6q5id9gXBpPJPukrqX8Fc3JR2NmlvZjVqSB77NPdOvK86uVYm1Na8zgxqG9FNr8SiydUBrhSyksL3QXl7ZxzP9iweRWvIwUQO+c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 12:58:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:58:36 +0000
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-aiohttp: added missing RDEPENDs
To: =?UTF-8?Q?Enrico_J=c3=b6rns?= <ejo@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
Cc: uvv.mail@gmail.com, akuster808@gmail.com
References: <20210212014626.4041-1-ejo@pengutronix.de>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <41e9a12c-8058-5100-0be2-fd4d83ec1d5e@windriver.com>
Date: Tue, 16 Feb 2021 07:58:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210212014626.4041-1-ejo@pengutronix.de>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:208:15e::40) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR17CA0027.namprd17.prod.outlook.com (2603:10b6:208:15e::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 12:58:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9175d066-173b-4270-2338-08d8d27a9265
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44182D8792BEC6C9D97D16369F879@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	axHr1/WlOT5rAmZFlOl19VtwMvj/sUa5PFCYsR0WuZQyzxOHxEPsGhIC3W+IjMHf83Fmg2hzwmamqlGJXUMnRuFg98TDgChrfTA/Y/8zUMOqIhLOq+n8NQDI+6SWUNey9LkHuR9G2uW/xsjk+M33RDiO7CdmuxJHM44ilJdkk+M60OmdbgVvKC9uiqG771Kq7mS05U8GgNiGrNCkTZnC6AdMNu7rrEfafnNi8Ip+7jeFSzJMZ28rJU61R0kFxmZA91KCjjnBCD2yzOsky7L1NJ0Sf+IOUmX4H2yGtjHQ1NKFAEJg9v7Zgf0WFx07Mgw161OjkEGPzaNVs+glMgBHreiLegA8xgGRdJfPW8IKWztMilS4CRGU94+PmM6SWqpwDfVHLNeZQwE9YBKDdcOd4T0arneiozVPITumU7HDucyuuOodleqjbSKalckYjGj08dU4mUIMe48Jqiwf5FEsGmDWnCfktQqG+dZDZdmuAAquJJaWboOgb7x0tTp7tRYPu/Dtb8yL/ZBUlKq/b39OWhKDnKSSeR4uIIAgvMOFYO6Qxe04SkaHLBjNmW21E4XSZ7G6lfJx3PiU2Gai3VbjpRXxhxyL1IRqB/8kvCIQr8wYHL1/ycrHFfgz7LKeme2NiPI+RG+vcCVlI229RrtQGtF7Nt/5M39bpi4eOYHwcP9LO3uumO+m3yjl4yyGM5qs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(44832011)(2906002)(2616005)(186003)(478600001)(86362001)(33964004)(53546011)(31696002)(6486002)(52116002)(36756003)(31686004)(16526019)(4326008)(8676002)(316002)(16576012)(8936002)(66556008)(66476007)(166002)(26005)(66946007)(66574015)(966005)(5660300002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WUJTR0NOVFIvYXVhcUJiNlRKOE9qN3dUVjU1SG9FTWJCZzkwWG43MVFWS3Vu?=
 =?utf-8?B?QWVaL3ZZVFVNU0REUzlnNERBeTdRYmdnNmhIKzljbTFRWkllSThyTU9wTVZQ?=
 =?utf-8?B?SDZGRDM4UWRzdm4zQUxaQWpYN2VaWkRWQ1V4RVkzcXhIOEp2WlY3T05kKzI1?=
 =?utf-8?B?eEU1T3FsK2xqYUVRenlNaVY5a0srQUhqbzNzS3RsR2RuK0FrdnhEQU9valAy?=
 =?utf-8?B?VHRFSitiVlZnU2ZwL25OWm42WDhNL3NJY0wzTDNRZy9uUVZvWDFMMWdzUzU1?=
 =?utf-8?B?elFud1hJTjRGcklqdU50MGpNcWJUNmVucVBLb3NJSEk5RWI0d0IyYkdnano2?=
 =?utf-8?B?bUozblV5YWhQcTZ4V0Joc3Rpcld6OEJ4L2xXK1lUb3N3a3BXUGlBMzFTMkc0?=
 =?utf-8?B?dkFkWnhJank0NlZPc3l0N041TWhySGE5SXNtS2FWUmxCbkxFZmR0dGl0cWtu?=
 =?utf-8?B?SGZ5ZlphdzFld24ycnNiOFRXNDJ1R1pRakNDUVN3Zlo4VnlLMElwZXdQdXd1?=
 =?utf-8?B?eGF6NWVkV0ZzeEs2cVNSVDRDRkNoTng5aExKOEdwbzlqeGQrK0kvanpmWnh3?=
 =?utf-8?B?NFV6N1Q4Z25qZ0I0MzRQbENSRFMrUEU1cVBIaFJjcDFXdDVHOXNpblRwZ2VI?=
 =?utf-8?B?d0ZsaHlKSElQdGM2OHoydXBUQ2lNUzJzaHNNL1c3MWxWV0NsL3dqQUpjVFNC?=
 =?utf-8?B?cml6TnNlOTJpYzBSMFZDSmpYU0FJZitaYlpLR3liQzRjYjlzNmZEZG1Ea1Z3?=
 =?utf-8?B?M043a2I5US9wSDVwUlI2UTE2c2ZXLzFvNE5GTURFZENFNGgwN1VBRm9qZkNS?=
 =?utf-8?B?Q3ppUmt6Rnd0MHpMY2kwaU5vcitBR2ZJeXdPNUF2cndlNXVhUHVrZnptTG93?=
 =?utf-8?B?NkdNeEJENEdiTzdPU010L01oRHQ3bUNibmp6SFhIOXNxVjc4VGVCRC9LSVV2?=
 =?utf-8?B?a3lBUGFaT3N2U0ZkeHdIVkxRWlNHdTlIdm0waytrdlRRbjk5N0VSOStPL05B?=
 =?utf-8?B?aDFWTHA1bW4wMkxUVmhYaE44eFluWXFUQ1lJdzczdTVYZzdYcy9Ec0tlK21I?=
 =?utf-8?B?c0h4eDBzWkZpSldpajZmVXRSYUYyMHR4Wi9zeFU5T2Y0cndoU3BGU0h6UlNq?=
 =?utf-8?B?NnBOSHN3dWNodXhtWGZnZ1M5b2IzaWlVOFpuQWlCYXJEQ0ExOWdwODBOWXZL?=
 =?utf-8?B?WU0rOHpKVkp4d1NpTHZUVjFMa0JScVVtWUxmcEk1ZS9tL29TMEtOSlB5R1RH?=
 =?utf-8?B?THpzRUlwOG1zV0pBUTgzNDd1SzVxaWNLSjRYc2dwWTdDdGIxMEtpY3pPMG14?=
 =?utf-8?B?VGxLTnlKT0x3U1U0WEdiOFFlSDM0Ny9CYWRLajdFQ09CU1FvSDBtb3hEMHli?=
 =?utf-8?B?YXlucEJ1eVBqUWFhczJTNEtLZ1BMQ1NtaExoamRkNXM2SWRrOWdSYnVQY09Z?=
 =?utf-8?B?cEFpVEozUE9Oaktzdk9zc1RZS08vVUdIRDY5L1hiMVcwQm5tSDc3ejl1Ris2?=
 =?utf-8?B?elQ2Q2hqVGxFUncwVC9nc24zSWMxWW1OS1FIN0FEQXZBMUU5Njd3RlVSZ0Vs?=
 =?utf-8?B?N0hXVjRJSGRoZ2R1QnZxMWZnTi9Lbk8rN0dJREpieitmeGZoUmNDQXVEdUVy?=
 =?utf-8?B?MTZ6amNnSE15WW9ycFZ1TExaZ1BzZlZTTjNCSlFNdi9mblV4M3VqVExQWTRm?=
 =?utf-8?B?MklyRFNzM2V4T2F6TFFjMTNQcERScGMwV2E4NGFpNVhWSVR5TGdiZnlXL1JD?=
 =?utf-8?Q?iSGAMmHP5NTEuD3oKmsfZPasAvW4IhfeuLzgNyM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9175d066-173b-4270-2338-08d8d27a9265
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:58:35.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkbFtC9MChWjbtNEI0MUbmN7a7RpleqS8vL1NUj5z2gMDCv/iCXHREoDzKkNnLVvfW6VougVFZdRzc5weQ8ymqpPJ6lDhyql9N8KVfaTgQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------F68E97E8A28D456CF735F798"
Content-Language: en-US

--------------F68E97E8A28D456CF735F798
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-11 8:46 p.m., Enrico Jörns wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>
> aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
> which are part of python3 recipe. They can't be properly imported if
> they are missing from RDEPENDS
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry-picked from commit 8e7c57bd8f8250251e54fcbe149dc81743c0e30a)
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
> index 121447cdb..24eb021de 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
> @@ -13,9 +13,11 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-async-timeout \
>       ${PYTHON_PN}-attrs \
>       ${PYTHON_PN}-chardet \
> +    ${PYTHON_PN}-html \
>       ${PYTHON_PN}-idna-ssl \
> +    ${PYTHON_PN}-json \
>       ${PYTHON_PN}-misc \
>       ${PYTHON_PN}-multidict \
> -    ${PYTHON_PN}-typing \
> +    ${PYTHON_PN}-netserver \
>       ${PYTHON_PN}-yarl \
>   "
> --
> 2.29.2
>
>
> 
>

--------------F68E97E8A28D456CF735F798
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-11 8:46 p.m., Enrico Jörns
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210212014626.4041-1-ejo@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Vyacheslav Yurkov <a class="moz-txt-link-rfc2396E" href="mailto:uvv.mail@gmail.com">&lt;uvv.mail@gmail.com&gt;</a>

aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
which are part of python3 recipe. They can't be properly imported if
they are missing from RDEPENDS

Signed-off-by: Vyacheslav Yurkov <a class="moz-txt-link-rfc2396E" href="mailto:uvv.mail@gmail.com">&lt;uvv.mail@gmail.com&gt;</a>
Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
(cherry-picked from commit 8e7c57bd8f8250251e54fcbe149dc81743c0e30a)
Signed-off-by: Enrico Jorns <a class="moz-txt-link-rfc2396E" href="mailto:ejo@pengutronix.de">&lt;ejo@pengutronix.de&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210212014626.4041-1-ejo@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
index 121447cdb..24eb021de 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
@@ -13,9 +13,11 @@ RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-typing \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-yarl \
 &quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F68E97E8A28D456CF735F798--
