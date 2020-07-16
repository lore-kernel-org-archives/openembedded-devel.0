Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.73])
 by mx.groups.io with SMTP id smtpd.web11.21539.1594922623566774561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jkDlvF9W;
 spf=pass (domain: windriver.com, ip: 40.107.70.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGfgJR2weQBOROXvQBONtlWdVPjqXeT8ISSXO81IAuCKrgYD+qtBIdf4t4ulf3XiECEoxORXZA3uOA6kSXGXxYsE9ZT9MgLfmNALyzxvxvqxy2hasPs5iaSb3Ov6SVYfnhlEf0RmGw/Xo1NESBgjwV1MXS4k1cHxyQ5RaKPVW1R+y5QCe72/g9k70SUvZxif38VvIRGtDIRRZ3YrP0G9p5IPryarOdndpXdwP9Q9y5wCuI3QOl8FZ4W/T+/T985svJ9PoIa6qw3LpnS3IIwzkvSzSA6LRlOTvNlblZBiwDU2tiJ84UsCr/4UkcBb8X9st+ziCHcTTYS5dykClCHmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC5onis7q+zPxTMkT6e174qgtSAouUENXskpj22zOos=;
 b=jUNb9B6gDY8n4i/IZxQtWUhonz/dcGNRTTnH3sYmEveznLLRXbcBTIK1OLfF2ukDtOr1WKNS/Kwuoq+AV0Liy5ODxXlav4x0IZeTZWL3V+V9ZG3ehj9GCpFPXZfX6pXmy6q4MQxM8+BnvtTw3M0HLk7BFtzXbgIEbEDZIazKqcJIXzvPMc1UXKyWRo8War+uW4X8KI678cehsHG/SuMPOUZHi9dvL/wmXByj+QQhQG3xI8viin6ETBHhuWUiWVCmylwm47BJDB6Q2eN+756KEr2Nu4c1XJOVom+J2ZgmH5j/ZViiex8SJrflZtYLNi1Rws01N6Lnx7y+yGlrQApD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC5onis7q+zPxTMkT6e174qgtSAouUENXskpj22zOos=;
 b=jkDlvF9WRU5dOS0M8O90DxjLhcA0BEgW9JVGMPFggBj97DvjOtmNlp499GYRltBz4SwZzkozfcMnYjL2DIV0aH9kXbqTC2kyF7vqg1mB4MxKissb2Ulw16WDyCHKZdxA3aINERZVNmBavrRzovPkfdt6HLBVca/riZS7wabtBi8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR1101MB2168.namprd11.prod.outlook.com (2603:10b6:910:18::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 18:03:41 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:03:41 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-psutil: Upgrade 5.7.0 -> 5.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
 <20200715152450.29018-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <01829c98-435c-e9c2-615b-2c69e1c2f013@windriver.com>
Date: Thu, 16 Jul 2020 14:03:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200715152450.29018-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::18) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 18:03:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be20cba-3db8-4568-deb6-08d829b2926f
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2168:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB2168E48743300F0F9412F6C59F7F0@CY4PR1101MB2168.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fVXv+clHpKpIeE99oiihoOflovsW9hzeN41yuRP9gE5cTouJsvFMvyEeHBjnWzuoNc5kokHCSufmkperR/vHIkQLDybEfGld95cr3kMEo24ramT2eUdPTaArCjuL+E1sBU1rZ0CZrrsBi/1eapsCGYG8FbjN55iRijhaP1hz3l/PkmpISvy9YFqyf6lbwlMJl2KiZvbIEuouRIrHdu0Qx8tmD8nH4ZItLmLAXSy2OjaPI4Gk+bYz9zHfWdaDQ+qZmimN+uyw4RA63mgus1Ja/sc94MqZiLtJtzeWt+t427Cy6d0Vs7zALgCWuUcPwtgetJS7k10Vr3cheBb6zMy55+SHBI/211YnJoDTtdFxT9PQacjCcAtWPAl1QAsrfMWn4tbcExe2pcEOrztSyzohPWT2gQ1Le7e8b/o/f+WN4YiIltmEUXPIEEuhCx64zn/Cu9F3wd57GHUaPOS++y7XjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(366004)(39850400004)(316002)(83380400001)(16526019)(186003)(66556008)(66476007)(166002)(2616005)(26005)(2906002)(8676002)(31686004)(66946007)(53546011)(33964004)(8936002)(478600001)(52116002)(16576012)(5660300002)(44832011)(966005)(6486002)(31696002)(36756003)(86362001)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rN/+dimS4e9GQSNf6t+q6cdK98B3KhoFl0UbU57Hek177PFLjdduGnLZJvrRSkL5Fu8jMAXpODJeEJOq3kq7X0AuYb9TGRkm0qS4OjlCCob4QLQnYuz/QwwttQiYSFpAcWh2jaCuBHizMPL7F97T3M5DbmdHgzNLyEWDEpwfuksZkmP4ESAv1lqTkriGfBNwQ0HAMRdWbybeX9Xi4dgHOuM0yC4EdxzaMmFRKuA7cTcC+8dLArBXqmeza0DF05Bdjp6UFzn+vtUddkbtYPk6nWQ0ZlOlFHN/RZ5UAaSqtdpaNstpBFxw1hyCZLX3z/8uwDyLZjCCZw8fL4rmrLLIP8L6EAe57N2KxUdcESim27meh/M164PngfCF6x5BeWCTL5QwTszRA70zYbmwG//aJ1VPh3deV8/b3rf9yqyKiL6JbCi5irWfdYqdrE6G1zzNBTgTpvWgcqWJSzU9dDDuyGUNMOLVv92Y5FdAud3+QJPoLOIRmz7E7UhbK2oT1M8M
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be20cba-3db8-4568-deb6-08d829b2926f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:03:41.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVWizA9ngMlFJvN3V8BR2CG9qsvZ00ZQbXp2gs4zxLVEudgNfhsfvgR/028rpMxiDfAIye0PL9ChQcjQk9Q3bhMVdJzqrG1vjCAsWGln3vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2168
Content-Type: multipart/alternative;
 boundary="------------D2EAB34EEFF503C6443D8105"
Content-Language: en-US

--------------D2EAB34EEFF503C6443D8105
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/20 11:24 AM, Leon Anavi wrote:
> Upgrade to release 5.7.2:
>
> - wheels for 2.7 were inadvertently deleted.
> - parallel tests on UNIX (make test-parallel). They're twice as
>    fast!
> - "make build/install" is now run in parallel and it's about 15%
>    faster on UNIX.
> - Process.wait() on POSIX returns an enum, showing the negative
>    signal which was used to terminate the process.
> - Process.wait() return value is cached so that the exit code can
>    be retrieved on then next call.
> - memory leak tests are now stable.
> - Linux: cpu_freq() parsing should use spaces instead of tabs on
>    ia64.
> - Linux: Process.rlimit() does not handle long long type properly.
> - fix signature of callback function for getloadavg().
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-psutil_5.7.0.bb => python3-psutil_5.7.2.bb}     | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-psutil_5.7.0.bb => python3-psutil_5.7.2.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
> index 170819d59..d61d501e9 100644
> --- a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
> @@ -2,8 +2,9 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
>   
> -SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
> -SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
> +PYPI_SRC_URI = "https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz"
> +SRC_URI[md5sum] = "50bf39b4faa268ba1da8a9730bb38bb6"
> +SRC_URI[sha256sum] = "90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------D2EAB34EEFF503C6443D8105
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/15/20 11:24 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200715152450.29018-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.7.2:

- wheels for 2.7 were inadvertently deleted.
- parallel tests on UNIX (make test-parallel). They're twice as
  fast!
- &quot;make build/install&quot; is now run in parallel and it's about 15%
  faster on UNIX.
- Process.wait() on POSIX returns an enum, showing the negative
  signal which was used to terminate the process.
- Process.wait() return value is cached so that the exit code can
  be retrieved on then next call.
- memory leak tests are now stable.
- Linux: cpu_freq() parsing should use spaces instead of tabs on
  ia64.
- Linux: Process.rlimit() does not handle long long type properly.
- fix signature of callback function for getloadavg().

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200715152450.29018-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-psutil_5.7.0.bb =&gt; python3-psutil_5.7.2.bb}     | 5 &#43;&#43;&#43;--
 1 file changed, 3 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.7.0.bb =&gt; python3-psutil_5.7.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
index 170819d59..d61d501e9 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
@@ -2,8 &#43;2,9 @@ SUMMARY = &quot;A cross-platform process and system utilities module for Python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b">&quot;file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b&quot;</a>
 
-SRC_URI[md5sum] = &quot;ed7b0f11ed214bcabbe76b7cf52f3ae3&quot;
-SRC_URI[sha256sum] = &quot;685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e&quot;
&#43;PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz&quot;</a>
&#43;SRC_URI[md5sum] = &quot;50bf39b4faa268ba1da8a9730bb38bb6&quot;
&#43;SRC_URI[sha256sum] = &quot;90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D2EAB34EEFF503C6443D8105--
