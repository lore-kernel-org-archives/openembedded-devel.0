Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web11.9928.1593090085164628702
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Nuy/CLLG;
 spf=pass (domain: windriver.com, ip: 40.107.223.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzj+9JLz+QNkrU1j5W+tpB5Dv3mqfMmtp8xbcMC7ZP3nwG5ktjmH6Rur35pZjQcVcgPybA9JBiioYX+UP0TDIU2sg/i20kEdvw8ofSsokFZBSvArLjk1Tjnhjz36gow3sTdCyd1HrxkZ1hAAVCjbupymnJlP+B1lzegeDMpGjVQaT6LKEfcg38ne2UnBLLqZhZ8oNnuctJRlA5KhoWvalpqgUjPMmiib4cor7cD4MAmDyv1008uVxqpRvqOEhJmQyATObu5stDqWFVsl0Ah3+WTuHgEZln4gAckbLzzqcJeFYedYZJFqXRoLBzUmQ1GWhl7rTNqZSSkZ+P5KcY+sQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdxBv9bGO6X5GYB/9Pgf/i4ka8J3Fhk+vNig9xJBduE=;
 b=mzvABgwfwyXNBN/lhYmw8GkvePUBeG0AQJJOBxasAJGraXehpR7PrHiSe2APcESDMjKfHhh4TFME8Ore7zi5DVgdZiOiC91sAsFoADT6L+B9NwPvq8qUMo4kOtSIErQQDQqJEYvH//s2fcA17R6E2XAQGibvZl/mVKxSz3ZnBR55g6js+M0w3KokXvsJOBMWSSDMzvYlRAs4kwVKqgvM2WLfsEBCctub/wyKe2yPEFcyz44ezEZ4NEjpzn1cxgDv+TJ5s1NJJZy3LEljkdxKqULMKJ7AAEqZ5RAGcMFuxzVA/1ruj2St1NDliTRPN3i/CO+P+u1Pm29BK9E3RlZ3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdxBv9bGO6X5GYB/9Pgf/i4ka8J3Fhk+vNig9xJBduE=;
 b=Nuy/CLLGbP+Y6jCluz2fb/1P8G3uo9FuwqVv0nSv4svd1Ke7FdcGWri8RsvXOEIx/dyNOVozYq7GekHdbZkOtVYGrdrCAh0AWTqKrM1ZFrUiKIQvizINyXyKakf0k2VfDOEgOpnblCb3GSToGvheuL13wTOplc+NYrE/IQFMsx4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:01:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:01:24 +0000
Subject: Re: [oe] [meta-python][PATCH 05/11] python3-more-itertools: Upgrade 8.3.0 -> 8.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c5cd4a96-21f5-b7c2-5fe6-02c945f35f3a@windriver.com>
Date: Thu, 25 Jun 2020 09:01:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:01:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c121e584-4e56-421a-600c-08d81907dd00
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41613B362F13F69F7A80DFEE9F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RE8TS4hFvgsZm/k750mF0dIAkcMQaimPfuJJ98zvjCMKKmE3KShRd8/w7hulWC241EC8ysS2A8EkrpQzhWQ4tkfenZyeESzLK/UtDtN4Hd8f2GKm3XVVptTnSmCN/qlZ030irF4KN6oVdLCENmhJKMrrCma0LkYPUNIplEL/ok5V8Vz3+mr3+7Pw5Xr/WvyYL5IN6XHn3MglU021k5fCUvbhiEvVWFBBZ3vzdMjf/JVt6a/YOLcso4eMRPHJ7ddWXBCx6fPjDPqDowIbr6pm4YRX1Uz+M3cgVhJlafD8ymwc7XWUIuGkG6/Of1KJ5WbkovqvJ3qTo2NOLnEzwOYoTnWYlpXUZ1V8Ml9dI0KY0/vX8gbhzvsC9r8Kglsdnl9FfrvYtmuCNB7txJamoKnugd3EwOsknjDNhfzsDcWDZak846NNoSLG4g/OIKP6Mb2Tr3Qxr8VJhNOQo0fCozaSqw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lkTrEL3mRL009HW43Cv8vGznkmUyYkpMgu3P6xyx0SqO57UukVhF5QSzpBewpCTZiEVG2nkZG+dOUHEpKmGbZwiC+0GjEIUklYzxZE+6mlyBxa1JR5aZE9WNQMJcIl6MJ8p79fg/6bRirGTRENvKKcnSGzceNvzcYn0NQBT+c2BH+LOG2n+w9i/EAthmweSJSHvMfpvNCZtNIuG85+jriCpQzzPHc2ERmtMkWCGsqsPve5KjP5CjX9/Yyk96CaLYTj2Vc7Uh5tDyGCGpOq+lhi2rhxObbXKm/nHp4TL5/EvlSwgJJ693ojG1AQay4ElxmLu8fWAHGaiI6GTJ+ncjV4+gA/jwvLz3YazL2aWdfjKRBZo1zY50RTHaawmIc5hj+NunWsHz1N9KE/Ds42xJwJyzMJbUuDMFB/ZIKakL0BIurHOZ/qVKWkUZSpVbdsKSVR1oGPcDkj81O8GQp/A8v0x1fm9C6/Wy2r/j2Ce9ZMwsvG4iNp2L91aDW7CgoXFE
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c121e584-4e56-421a-600c-08d81907dd00
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:01:23.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L/IFmZS/pqmUyRn4ZIIVNquIztWr3YIqwl4I3abq2kAxFMjzmkCRg2fULV+yJApXwZPoJ3gaasxoWe3X4zADl4/xP50cLMQvJOu+1MQmqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------68FF6FA0462ADDE904ED54B0"
Content-Language: en-US

--------------68FF6FA0462ADDE904ED54B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 8.4.0:
>
> - New itertools:
>    :func:`mark_ends`
>    :func:`is_sorted`
> - Changes to existing itertools:
>    :func:`islice_extended` can now be used with real slices
>    The implementations for :func:`filter_except` and
>    :func:`map_except` were improved
> - Other changes:
>    Automated tests now enforce code style (using black)
>    The various signatures of :func:`islice_extended` and
>    :func:`numeric_range` now appear in the docs
>    The test configuration for mypy was updated
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ore-itertools_8.3.0.bb => python3-more-itertools_8.4.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-more-itertools_8.3.0.bb => python3-more-itertools_8.4.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
> index 97393d050..f040b1a97 100644
> --- a/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
>   
> -SRC_URI[md5sum] = "03dbc82ec1c4e814733d84abf79f43f0"
> -SRC_URI[sha256sum] = "558bb897a2232f5e4f8e2399089e35aecb746e1f9191b6584a151647e89267be"
> +SRC_URI[md5sum] = "0912041c05148ed079984cff69af2e99"
> +SRC_URI[sha256sum] = "68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------68FF6FA0462ADDE904ED54B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 8.4.0:

- New itertools:
  :func:`mark_ends`
  :func:`is_sorted`
- Changes to existing itertools:
  :func:`islice_extended` can now be used with real slices
  The implementations for :func:`filter_except` and
  :func:`map_except` were improved
- Other changes:
  Automated tests now enforce code style (using black)
  The various signatures of :func:`islice_extended` and
  :func:`numeric_range` now appear in the docs
  The test configuration for mypy was updated

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ore-itertools_8.3.0.bb =&gt; python3-more-itertools_8.4.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-more-itertools_8.3.0.bb =&gt; python3-more-itertools_8.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
rename to meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
index 97393d050..f040b1a97 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/erikrose/more-itertools">&quot;https://github.com/erikrose/more-itertools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5">&quot;file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;03dbc82ec1c4e814733d84abf79f43f0&quot;
-SRC_URI[sha256sum] = &quot;558bb897a2232f5e4f8e2399089e35aecb746e1f9191b6584a151647e89267be&quot;
&#43;SRC_URI[md5sum] = &quot;0912041c05148ed079984cff69af2e99&quot;
&#43;SRC_URI[sha256sum] = &quot;68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------68FF6FA0462ADDE904ED54B0--
