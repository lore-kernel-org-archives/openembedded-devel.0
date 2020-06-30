Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.84])
 by mx.groups.io with SMTP id smtpd.web11.15243.1593523481383392451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Migt7h9p;
 spf=pass (domain: windriver.com, ip: 40.107.237.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrLMa4TyymWaoIDSdBN2O5u+J368Smtx2wUu2a/OYGZ9r65YV9F2FmY1tVFl8h9kgXVc3Uiy6iqz91svhflDyZi0Ud28aD+03TI0UrNGjzCtD9KWSOp6r/WYvMAPht5PmodjWX1Otpp8Y0YoWOSTbshhGDiD9Yj2cACw9ERqUvBIIaD5bG4ksxmxPBarR3TTDUo2PSEQgrG1ki3rdzjLt2sorZsYELWMAzgZ5fjqQcALATsIjVwVYwJETBKQEqofXeA/5/v9WIOyXbH3sjvDRqR65727bRpA1RcciTpa+PmsShv0hMgwzpaQ5udzecyHXRTDDkJEBxHJa8vFkRukhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv+stqjo/VzxKoiLyomnREiZNnfQ4aV72me604wOmrM=;
 b=meN2jssbiiGLR0zYMPuWrs6BdnS4VetV77NiXOsAQoRWtl7yleMEzQzKLrNTiEIsPhos+qAESkUll5por2BAtu74s25CYya99gpxBGR6MAQFF7tsPCDjmJ83ZkgkhM77GW5VQpJ4EgTE2+TKNFsrcGiWfP84N2N81EZvESi9z5/uw6FZRuQ2zXK3TKVne6g3Nd42bJLmCpLtBekAGcHMBWN71igTFuBNvT1T5b2p2iiVl4jNgS5I+JQhZRW5gRFJUKnX4lsW+Pa98U5vDUY+7zqubMaSAtShFFN9/4GTTpGAlLhuvnnR80Wucco75+m0nfyIWDT9zJySAAyVn84sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv+stqjo/VzxKoiLyomnREiZNnfQ4aV72me604wOmrM=;
 b=Migt7h9pVrYwO1u5xMx4uDGinlNEHPPc8In90hxJzAH0YXr4AyXhlbvQs/IRXz8MjDqfoD36HMm6Waj9w9PfTLtg608WMLhxTHnApymAYWDEeCqPlGfQ+QQyYo6CNT/2SM1hamVn81X4hVzUCSeTuKBn3xE82iDgFJmaOqbTji0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1686.namprd11.prod.outlook.com (2603:10b6:903:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:24:40 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:24:40 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-humanize: Upgrade 2.4.0 -> 2.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d540646a-302e-5532-1894-531cf7cde576@windriver.com>
Date: Tue, 30 Jun 2020 09:24:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:24:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bcd7930-32bf-4e18-8376-08d81cf8f137
X-MS-TrafficTypeDiagnostic: CY4PR11MB1686:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1686405889E7201922505E2C9F6F0@CY4PR11MB1686.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gyzlUdVSoulzAzCvSlPGkmWOoZVUWSwgo2vCe7MNOx5K0B1FLTDY0bxdNhjsDmNOTf0ePS8llQGYkGRl+CfKivJD3ch8LpgLtfpY5ORUW1xwCHtxaDtrT3vMhTH0rOTHDVnzB9CsDQvt34idDyPFpSqGJf8xmiEAfW4SN+v/zoRLRw6DUF8vtyMQTanrerjkuY4Z3Fk1Qok8uqhXUB68b/KLK3xzQ9noTVRzOgn8pJD/np72gvQxW7Xzf0UnCbOfIh0p7Iyiia7NHWgGTEOPo/D2MqVNO2hFcxZkQA7LsaLTcs0MR7UYxevJb2TBVnAM56XGI7J0W8vtAX6Gw3Shs6QjG0WUXjdmbru5BCn023cBDnqljDDxgWxaJfsMGF4vQMB4GnYwC2H+aje2I9a5v9lPnTHqO1xM9a6g6JZnlNFRHxxwpI64DCSbRKRzXS+odiykwjXm3pVFXXlCAo8KQ1Es2orQlL9ciHkZjN4d+Gg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(346002)(136003)(376002)(53546011)(31686004)(8936002)(2906002)(8676002)(966005)(44832011)(16526019)(36756003)(83380400001)(2616005)(956004)(86362001)(26005)(31696002)(33964004)(186003)(478600001)(316002)(5660300002)(52116002)(6486002)(66946007)(16576012)(66556008)(19273905006)(66476007)(166002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	y/FofVCV6n2BlatgUJO4xbA+FSTu91nzfdSq2DCstCxscQ3zUgbyMgd5oqw+an1Itl5sMHvWbX6DhLZj3HZoskjcYjkaOjfzVzLhStcD1BY93WuYfDUOCIP+teZtcF8nVQUIpoYqB7jQ566g18dTD4/N6w/NdjgJS6zNO9bWNvQnbCktHhjER/Pwx7ObvMWR3xOR3btQJlPZiH8pbkUpXs7KjuFwfN4Rnz287j53gsAxy130A4PahTduHpnLaT0UM++3IsLRDbkEAbOs3E4Kxc1ec49zInHJildQw4b2QHLH6wJ1xdBIO8nH4zW0RzqjsjdXJ5kwIvIUTEBPXbKRvGbGylF00Q3ZfKzZRv/s5WI+NsRjq74c67/guQLKcFpxNF6KyvbKYtdX14fpCpGjc0T1I82bdK+ygdwxjjznbIiKwadWZlIiKuL+3jbJlRHp7OfpIgd6HT4xqJcDXaMYxKeS9nPYIcYK556VdgDwwjk4PLd0+jejjhhMudrv1RS2
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcd7930-32bf-4e18-8376-08d81cf8f137
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:24:39.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OW6fMD4BB5/OOqZmNrEHkz66yKLR2nFgEsdiKPBRz3N/CbeO3JSNPPpNO8CvgL9Rp82ppCZXm5sL2IvLpYxPlePLwHjhAQHqPnfcNBISlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1686
Content-Type: multipart/alternative;
 boundary="------------2552A9A929998F9EC831F7F5"
Content-Language: en-US

--------------2552A9A929998F9EC831F7F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 2.4.1:
>
> - Explicit error if _DEFAULT_LOCALE_PATH is None
> - Fix incorrect Portuguese spelling
> - Fix fractional(0.333) output in README
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_2.4.0.bb => python3-humanize_2.4.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_2.4.0.bb => python3-humanize_2.4.1.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
> index 6bb6946ff..3a06a48b1 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"
> -SRC_URI[sha256sum] = "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"
> +SRC_URI[md5sum] = "3d4d25cf84181c55bf7d219dd175dbff"
> +SRC_URI[sha256sum] = "4b4ce2fc1c9d79c63f68009ddf5a12ad238aa78e2fceb256b5aa921763551422"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2552A9A929998F9EC831F7F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.1:

- Explicit error if _DEFAULT_LOCALE_PATH is None
- Fix incorrect Portuguese spelling
- Fix fractional(0.333) output in README

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_2.4.0.bb =&gt; python3-humanize_2.4.1.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_2.4.0.bb =&gt; python3-humanize_2.4.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
index 6bb6946ff..3a06a48b1 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;010e86a4196ed6030112e7bc681e7353&quot;
-SRC_URI[sha256sum] = &quot;42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026&quot;
&#43;SRC_URI[md5sum] = &quot;3d4d25cf84181c55bf7d219dd175dbff&quot;
&#43;SRC_URI[sha256sum] = &quot;4b4ce2fc1c9d79c63f68009ddf5a12ad238aa78e2fceb256b5aa921763551422&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2552A9A929998F9EC831F7F5--
