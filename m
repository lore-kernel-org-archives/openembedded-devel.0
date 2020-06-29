Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.75])
 by mx.groups.io with SMTP id smtpd.web12.20367.1593442365209559565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YVahlehw;
 spf=pass (domain: windriver.com, ip: 40.107.92.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJmCe4yLQr9vPzvqGXB78DRjwE0o9RR3OIyHdB66GsbUkOlCn4pFiKrmCpeKjDUl7pOwV0BVv7fQpcwE79/CuFDh5wqqiGAW4nEsPykd00BJWOi87FRBr7aWAgDc+KOIaffKDTmXJ3qQCFRG/gXSBnO6FsqmntM7xB+0XTVrtgOAAwphfxgM3X6OPcvajKKzb2hNg24FmWC/A69TPnA1HBs52dlynzCXq9dOpqBABRo1MdI5PhEzjzcwBciS1jGBlA1BUUOld2NY7dIphlhqnCw/IPCGGNpGKkQLL+6RRiXWNhVoy6vJQ56mzqlslDBh2sf3fBGm5jBqRmkn1xheSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/9pzHGdMDF7dbKa/Q7CbPD8vMwByKhZJkj7EPPaNQU=;
 b=fBi6dqGArmAyeNPfsmHmf1Qb/RcPSQS37e+5COSF6usbjb74Kh69YBAbBX1gpEhZof5VfEwz3Wk6zTi93mbade0Snj6PAEXgSld5GL0QoNaguieDJmIduxW+/f0wb+TWsG5ZvBMXFz9krBFuyPKsTE86EREmPnYiq5LTZ83UJ/gBMX0VeWHwld0jPPWtV8O3vmwSJb65RUvLY12qKHggBQkaXcN8kyaytthT5+lgsUxB65vN9yETk5KHDnT1HfbZKAlNF7RtlJQbTd7EfMaedmk+68opxacmiaslJx+C3tmuokV5gvT05Pqt1Rr8aovWbHhQZGxfxTYJPhsEn0I/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/9pzHGdMDF7dbKa/Q7CbPD8vMwByKhZJkj7EPPaNQU=;
 b=YVahlehwHcP0zA7kyfVKqrdl6f/9/OmV+XIMRJ7PtTplxgAZOk/PFrHxNg63bC08zcK5WIDvvOSIECmxU3B+EZPFmzc90Rp/UgB017TxYkJShX9j7iAqUHnjLpEzTRkN7NQfrKh0GzUi14I20kguxsl/82w76n++zuWCH0jcASY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:52:44 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:52:44 +0000
Subject: Re: [oe] [meta-python][PATCH 10/12] python3-pulsectl: Upgrade 20.2.4 -> 20.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a9f7150d-c29f-b848-f09f-53dcb9d7d787@windriver.com>
Date: Mon, 29 Jun 2020 10:52:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:52:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 203e7916-38b3-45e0-ff3d-08d81c3c144f
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988BA1CD0E8FECCD2631B009F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xu6j5LHHa+RGZQeManmyOlk81IuRTpiyLX6Jy8sTSg8TuQcJNrue0peUs84u/t1K04MghXF2HJ+BaoE27GzL9AW0N/3EOq7mwx0ka/tq342Atj/f+Fakwae1Xtc2h4kezIdN4694rT6vE35LbTPhNjDFvemoKi/NHf7lbsk9IFnxoRW5dZq86f2eaoSbeBG1j/E1IMn1V8BvDPyj1Lkimuy5pdfwrG4WhL3Vuh95bbBstvVwa+7ec8EJvjAVzhoZPbG+h+uZYyLcNG20QyQGZicaU8Mf3LwJvpjgrxMbLV/Xa8nWTPRGP64OrsZugt37qASzyw5jwrFrOh3ASgpNBYJij+IQXqPf+E+JnooPHXXITSFKVCd40ICALVWyY2vXwzB3v6U86K4aS96QqFgJHgY3aiYL6hzCumluDmqS0oNyDi1qAbvLrr7b5zQHAoIFed4yV3KPlHsyIK2ZSxqh9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Qoi69DbPudZw1Z23jmBmxH7y2fgVcQUtLd751ITHLwEA7PjnWoVORuZfN5W9hNZ3ItiWglJtbH08OUM6WlHWKGlnuNFTPQa+3eU/FShuHIWbL30WPTDhYuK1N08YGJDalGH0asXGF9IzHL5M29pM4k7FhRPrzrkG1cwwiRerUX668PfixelzK1MOZvhfAM0TTy7YM6wRU9/x/SuV//4uuloIjMx8EaTpVUXBDpAX1IwS92176P21EpXF6JKMW54b8oRUspsseP+jwK2RcqdnJ5cvJXYyzQ4Azf8i1rHESaRizeLBA/zJfXTRK5jTtqi2R7yHjlGaW3Rgu7Fn6HJVlc2F3mjuIoBGHwPmJ9vMWYJ6FHJWhzQ4Wye+oOnoMrd1g1zvij6FGBbnqXBLG/iXz0MLsfKEhZs0fuAgSQHOd3Wnvsu6giKA4YR4sbWquV+Ucb1EUEwuhdBxb22eMTQyeKsS8XS2UmFC8uw6B65lJVE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203e7916-38b3-45e0-ff3d-08d81c3c144f
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:52:44.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVMUxX6IHHbMKQuDnsHqG41I+BZns8X9EokQYM1Dlgj011zLVUJX9Mror2AGl9umoIjOpg4nCflRJz/pTsBPPPp/oBLOQ4CGLCHhr3NTI90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------A4B7CC4D6274CAEB076441E0"
Content-Language: en-US

--------------A4B7CC4D6274CAEB076441E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 20.5.1:
>
> - Drop unused decorator mode for _pulse_get_list wrapper-generator
> - volume_get_all_chans: add docstring to indicate that it doesn't
>    poll libpulse
> - tests: fix tearDownClass for "python setup.py test" operation
> - tests: pass PATH= in subprocess environment for proper lookups
>    there
> - tests: lookup executables in PATH
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pulsectl_20.2.4.bb => python3-pulsectl_20.5.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pulsectl_20.2.4.bb => python3-pulsectl_20.5.1.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb
> rename to meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
> index f0db9682f..df0c8e578 100644
> --- a/meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
>   
> -SRC_URI[md5sum] = "07d7a5fddc49f5da22634464aa008003"
> -SRC_URI[sha256sum] = "fca9ed501bef2efd551b35773fd24bba36bbd21bc448f402cf8ee13c12423c19"
> +SRC_URI[md5sum] = "8de84a0f4005ecad96d2c55a6d7c3a10"
> +SRC_URI[sha256sum] = "39b0a0e7974a7d6468d826a838822f78b00ac9c3803f0d7bfa9b1cad08ee22db"
>   
>   RDEPENDS_${PN} += "pulseaudio"
>   
>
> 

--------------A4B7CC4D6274CAEB076441E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.5.1:

- Drop unused decorator mode for _pulse_get_list wrapper-generator
- volume_get_all_chans: add docstring to indicate that it doesn't
  poll libpulse
- tests: fix tearDownClass for &quot;python setup.py test&quot; operation
- tests: pass PATH= in subprocess environment for proper lookups
  there
- tests: lookup executables in PATH

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pulsectl_20.2.4.bb =&gt; python3-pulsectl_20.5.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_20.2.4.bb =&gt; python3-pulsectl_20.5.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
index f0db9682f..df0c8e578 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_20.2.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mk-fg/python-pulse-control">&quot;https://github.com/mk-fg/python-pulse-control&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=f1d10048469ff90123263eb5e214061d">&quot;file://COPYING;md5=f1d10048469ff90123263eb5e214061d&quot;</a>
 
-SRC_URI[md5sum] = &quot;07d7a5fddc49f5da22634464aa008003&quot;
-SRC_URI[sha256sum] = &quot;fca9ed501bef2efd551b35773fd24bba36bbd21bc448f402cf8ee13c12423c19&quot;
&#43;SRC_URI[md5sum] = &quot;8de84a0f4005ecad96d2c55a6d7c3a10&quot;
&#43;SRC_URI[sha256sum] = &quot;39b0a0e7974a7d6468d826a838822f78b00ac9c3803f0d7bfa9b1cad08ee22db&quot;
 
 RDEPENDS_${PN} &#43;= &quot;pulseaudio&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A4B7CC4D6274CAEB076441E0--
