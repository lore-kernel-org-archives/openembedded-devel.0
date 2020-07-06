Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.51])
 by mx.groups.io with SMTP id smtpd.web10.60430.1594049892948733319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Lrptqg2i;
 spf=pass (domain: windriver.com, ip: 40.107.69.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcAc+j0FxzdZKbelydn1oxMDsXaRTihCx6CCVMZhX5zBZgPwkpAWTgYGRDWDgnthEAlnfsmovtxo4K2PTKNir4Z1RUno1H1OXJq3xPvcCN6PJKPQMPtvXxg+nxLUPQic+f7ktwgk5x89iBpy8ewJNUpRfAyDvCLNt8NcLyWTPVv1e69yq6FoBXmiNbjTcWPz1U0V4SugJdmVVVVevaASdeupj9wZxGTs09YqobABF0TLqnRJ+FSSMrXQvgLJkAkVoG3msj2Dknub82x+MRdWroo1Lg0Gqr75uIR75ECBhk/ZZS6uuyW6CLiXeshrdiv0+WR5gxUyvFxlzMOBfwRgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y+0Gqv0vjGXTzo/EdYWRnkUV2hv6whsCNBtgH9sYFs=;
 b=nnLGwixfPIFyBQmgCk5pg5SWHocwYdVQjDLCrNi0iFfnRLq8EJJg+pHADeGd1S0n2CU1eRtxxVps3KY2VF+GNkdvFRBdeawarXwvu1YfIV8uPPl5NiIMxmk8Qv207yqG9qBYQHB1itsq6eBvQ8M7+toIR38smTJyX+wBx0WhAvuaciirqRrKhx49swbXpmE0kot37WI+IN0ySVIWv6zqQQkKWqZzy64lqvo+PJkMUTQXS1kQDWGA3wXvq59bXk24zZafAoVlpwcnTBc1XWP3LtZO3/JSFTU3B2l3YtMEo7S81SCYFPIvMX8Tc7sPSAt5tHVescFmTYs85U7bt6hKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y+0Gqv0vjGXTzo/EdYWRnkUV2hv6whsCNBtgH9sYFs=;
 b=Lrptqg2iD0XRN5nReNnkTo/iXeeGxZa9TNlSq3ISsj7f1eWN9hTTAS3VxCcUgpianPrbL/SztOzQF4mzMKrKFeUON0yDIGcP53qfw2NBkL+ZBqJD2K1EUHB1m4dJC9tvZ/fo595Ub445j/oNtjHeJehqofJwEjl4OgkdWPGatG8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:38:12 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:38:12 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-cryptography-vectors: upgrade 2.8 -> 2.9.2
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
 <1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <00b41990-52e0-5a1b-7d1a-2e9ace5eba68@windriver.com>
Date: Mon, 6 Jul 2020 11:38:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Mon, 6 Jul 2020 15:38:11 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98b6144c-1a04-4a1e-c84c-08d821c29745
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2827B55A9FA258916072E8739F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aDNsN3JWK7L9EWWjol127F3OHFyTZu04OINgD2KyUx0+MLew23IOiMQ8/DuPD5yUcwmyh35zHBumJzCdPn1oV9kA3f2zqxpSBelFz1NYqRqNXLdSI2TpSVM/9kuCxJdFm50jJTvwM5F2ygarxeEL0oCVxGjo7ZzcxscfP1ygbbZSU92J220jKDpuvQ7iDhHZo3I2MpMze8YZS9jWIO4YqZtPMrKy1PSLQh7eo7WfcLNoJKxSeaKekejt0IPD6BPgSN827bTG9M222RUKPDVTk0GAWSqRrkUJoQad1zlsiMKtfSqOUbNEB9gMtpgUh06NClNZk3BnYcJweDCoqLbWuk6n1T30NgMKxu1VCsidpEbPwrkkCDAn9+xG4oLALgTuK24IcQ6BGB3BYRTS9zTBbf0oFkygiLZeq6jiHGr8f6RTm6lHSu9FSdKlEzXUUtmsrBqLO4VPxFc+9qpeFqc1gQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(366004)(396003)(376002)(136003)(8676002)(66476007)(66946007)(66556008)(966005)(44832011)(478600001)(956004)(2616005)(16526019)(26005)(5660300002)(2906002)(53546011)(31686004)(186003)(52116002)(316002)(8936002)(33964004)(166002)(83380400001)(31696002)(36756003)(86362001)(6486002)(6666004)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iTgrnrsWZF7hvAlEVTHn/j9dR8MU43PGtuc2CtuIkw+FF8RDkFcbM45VgUITum/OXFSL5QpcmwKltt/z4cE1uNI1RzaRcDbh5gz63od9SOawrAwJs7yRCnJj4ninR1Iqwa+aezZwPib/J0e0dGWBil9SLY+ckX+e3pGOxZQo/x9pF/6PbsUaiXM6yc4V/0GtgNuWS6ZW3HuIBJrvzcbjzfY6HtcxKwTBYCJ17pGoMQWpP+OYMqiBN6ID0v9SXWT9yQaI81VIdPfhGN4kxkN44mdpiTsIa5DPsUrf92/CDduBBKudqpR5DZX5jF5+yXi/VNhU/O9xBc1KgRNZWV/3kWA5rk0UL781yeuwFCVw76oeKTkqEdbDQA4wteMkjXykFu0AcTPY2b8kRAhrBApLARIwskjSi3lIa6HgjQP2jbxZcg7DsW1F9mZ9pozdb4LxZcz0Pg1EZhil2hEo4EMTjOWJrKML+CHULuyq1NhmwHs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b6144c-1a04-4a1e-c84c-08d821c29745
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:38:12.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwC/rtrW8A/JqtPlg4BNgJLWByjOl9rtD/0q5ySfxAkn6nndYJ0OhXJV/VML/qmcxCAvD55SEm9PCadMMhqR+myuS6OFFOnPpdXS7TqFxEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------6474288E24932DC1588C942C"
Content-Language: en-US

--------------6474288E24932DC1588C942C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 3:01 AM, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...y-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> index 948aab9e0..60316fc74 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
> -SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
> +SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
> +SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 

--------------6474288E24932DC1588C942C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 3:01 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...y-vectors_2.8.bb =&gt; python3-cryptography-vectors_2.9.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb =&gt; python3-cryptography-vectors_2.9.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
index 948aab9e0..60316fc74 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
@@ -4,8 &#43;4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;a744ed29bb9ef56b3a50317fea3b218e&quot;
-SRC_URI[sha256sum] = &quot;6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116&quot;
&#43;SRC_URI[md5sum] = &quot;657349b8de73959fc49ba15fd7346b58&quot;
&#43;SRC_URI[sha256sum] = &quot;99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6474288E24932DC1588C942C--
