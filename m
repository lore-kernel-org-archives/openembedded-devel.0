Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.81])
 by mx.groups.io with SMTP id smtpd.web09.24336.1611839286576489045
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MlFvZ575;
 spf=pass (domain: windriver.com, ip: 40.107.70.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBmEtMxjxzrzndR3wzy5XIL2I7sBmy0wc4DHZ4hK+InBxN3q0Djghc3D+bCuaGJ+/lDO7j1ah1jUImFRVTuDy6qYSXkooYrOercVAPZiFtchS1INN4YtEwnLHyu1faplN6RAaHoiRdXVUAB3qvX8F1J8ROevmhW5gUlwE0khjz0VFJgRVrnb/Rrb71WktJ1E9ozia8ZaR6FzkGh8lME62rcVbzhwXWB5z2wuiTmG/hs7rWXo1nlUAJKISO4PI5YIMyM4wmBnegvhM7eGxe5kdIg1Irluon8k688qjxppEuIIzl3x4wXcJ8qA65T4GfSAO1w3x9Pn6xEgHabSYs3fsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfVtKZF+nF9JVsBb898OEI5vH8AOx8cUCfHKU1BI7j0=;
 b=IJ+P60FF4zZpt1bZB9qI/wD6d55fLba7g1VVMT1aXq4SHRUPL954k+6haiU0iww0L/Ag7YZOTkSyShCOQSiBgsuj1Zd8iauUV//YnQcKtpvSHbu3WN1aGm0XgivAfes1+jQdV/AyxrilEbbeCgY9sCJk+RBELN9jNzrHZwGebCNDwnQ40he+b4H1HgyIq6RmqYVYwqHcRWxP3ZhjISRYOliuo3/wo20OBT6FiEEopnR/n5eW33ySzJHK+aLJS12v8nDnaXaPvGmEJlHfvgrTiMjmOK8GSbwKFEVadjG01WWn3kPo8FKeVZ1XrYTvglPRx7MeDuDHK0Sl9nAMOsVgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfVtKZF+nF9JVsBb898OEI5vH8AOx8cUCfHKU1BI7j0=;
 b=MlFvZ575Ua1SkjqMQPiZJAFKNUAbenZSNm+kfHIO9a037w9vZh+WbtAAIK6e1RmZUFZH6bYcfyZO/MiFY5+yxuskrjtyMVTzcx5bo1/xy2D3VJ1os1lgxdnyL5m16BJUgyrwL/dcBDBP/8mMg/4E894Kf85rIyKeOzDwZq/cUGw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 13:08:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:08:05 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-diskcache: Upgrade 5.1.0 -> 5.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
 <20210126125003.27620-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e87860b9-04ad-29b2-aa74-6d882b89b257@windriver.com>
Date: Thu, 28 Jan 2021 08:08:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210126125003.27620-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0054.prod.exchangelabs.com (2603:10b6:208:23f::23)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0054.prod.exchangelabs.com (2603:10b6:208:23f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 13:08:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2031ad93-0245-4fa8-c96b-08d8c38dbff2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4184B63AB44C645D33A8F6C39FBA9@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D6xi8kaJn7luqyCNu+5KepYuwHUyVDALRcuQ3/xlsqQG4KIIclnpg6RiEEPbydoShY4rbpW/xokn9eTVe3ZjSB6Qcz+I49O0jU8tNkmnEhyCXn1FShDI7RanTAweODT00FGv61Q0OnroPpYErBaOdOYs/eS146VxtD1Jj3aaE3Z33/yEbj9xqqxgTYnFjZpY1KUxJEp4gaajEbQxz32LuPKz5b8OIddHrKKbUrqN7615P+eXLhR8hprUVNZwTVeaFg2zeRTKw3tnvI5cUfakBgusxlDi/s9Qwir5BhKdQMyxEPXTb3bm3gaHXMxYdTMztpa+GQBzY3D0rPZ4+2hDiZ0S7Xv0lTflio+cAZJM3pcG4hLjCWNE7kmdeMWJZizNfjXsPIu0B8LVj8GnoIEhI8/lgjjxNo6rIlkbSgmFTIjl632iIO7U7jxOdFbAgwzTHMpnRbIjp4UpWM2B90YxYNIQp3V6+nHb3XrmBRX11gIHR4pUmHSny9sNXIeNRrefTTiosCOsCXRGJvLZSl6dkC3rUNZMmtAyo7lpNH7F73WMA7BouP5Z/mAClVC9PBdAElgmpXSKjGq5WuMgeMsgn8HZS8aYi+VhhJ+Tu8xZQQjBK6nWxyayc5f3PCKO5vkqA8lSGVugZ/uVT6t+c/a4EA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(2616005)(66946007)(966005)(53546011)(6486002)(2906002)(66476007)(33964004)(8936002)(166002)(478600001)(52116002)(5660300002)(44832011)(83380400001)(26005)(31696002)(16526019)(86362001)(8676002)(186003)(31686004)(36756003)(16576012)(316002)(956004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WDY5TmswbFJvd2Y4c0RKTWptRWVydUpvOGZreFpSRzI4K0dYYmVvdWplSzVY?=
 =?utf-8?B?Z1NtMlA4d0p1b3ArZVlqM2tweGQyUndBSCt5L1BLVWdrcG82aHAyOWxqSUkx?=
 =?utf-8?B?WmNOVWRDNEJyck9FK2VPNG1QZmdmUnB3aGtwZ2h0amdoK3Y2UVpQSmVEY3U0?=
 =?utf-8?B?UGVkaGc0aFl0SlA0aCtVU2NUS3ZqWjNBNEc5MmxadlBzSlluT3poWGhkRmFT?=
 =?utf-8?B?UEZOTjBvRUhBS0ZvNFBwRnVjcy9JbTlnUFJ3em51WXFXUG9xWGdVc2VLUWpZ?=
 =?utf-8?B?eUMrSEt4Rmg4K1dsZHVGNHB4cnZ0MnpXUzh5bldsNGNFVVNkRGVWQWtxNTho?=
 =?utf-8?B?NDNRMUd2dlB5WG5mb3Z4TEdZYzFsTFJBbDFhTmZ5LzUyZytZSjdPc3A1Rlcx?=
 =?utf-8?B?TDg5N2lQUEkwYmQzM0FxKytTMG5KemNkejZGM25IZDQ5Nk5MUGJPNE8zaWRO?=
 =?utf-8?B?eDBHaUlCZjM4ekxvaFI1UXdBQWcrL1R0MU5BcXFzbTZMZFFVeFpFc1VZUC8y?=
 =?utf-8?B?WkVlTmQyZTN1dzBua1RFSVd3NWFkZkJyN3N1MVNUS1dHL3QzQStGSmt5Q3pU?=
 =?utf-8?B?M1V2Y2dNTVVLOHRxZVd3NnBJMG1XZnpaeStaSlNTZGhjN0VQSGJ5ak85N0Y3?=
 =?utf-8?B?MzMrZFdMMkgrOXpEY1lHdnBiR1NuUERMVFB5SDZkUGl3SjV3RUN0bVB6bVlv?=
 =?utf-8?B?WkhFQUwyZENhRWtMbjVxb1hrTlhqd1QraWNSOU9aNzhPSEU4eDlFYmJXTTJt?=
 =?utf-8?B?aDJNeFAvam9rMVhaMTBnRS9xcnJmVHVOUkxxcVFmY0dlSm5KTW5ESEN0QVpk?=
 =?utf-8?B?amt1bGxkM0RzbkZYbFVPUXpPcitSdVYyQXpwL3lJaithY3JRNzFBZEhKNEhh?=
 =?utf-8?B?NlBWL2ZJenlDNzM4d1VEbW1tL3d5SlB0ZnVsckNydlBZa0ZDdm5Ma1RRa2VN?=
 =?utf-8?B?a05jN3pwaUdDcnJXTHFTODZlOVhpRGtzc2tweC9XNTRpZWNXY0RIdndObWl6?=
 =?utf-8?B?MSt0Q2gyejYvbEhDQXlQeklVWUZDQnNPcDdBd1A4OXlSc09BNU1vTHBvaktR?=
 =?utf-8?B?WjlQaUhkMG4xTFJ1WXB5VngrYUVJc0EybUlUZmlCTWo1RG5aK0pwclVoU0RS?=
 =?utf-8?B?NHd0SDNaS3hxejkyUEZ5WitGcVVGRFRjWFFKU3pJY2R1OHI4TG5PZVNEbjVv?=
 =?utf-8?B?N2hDMkN3VXlWVEpwbFY4NklyQ3FNa0JoZEh0SkpxZzZTUi9rZWJHbTNCS2pi?=
 =?utf-8?B?WkJEUiszVFYzZGlGMFM3Nk00TFlldy96YVRSaTY1cTJtZ2pQWE9CZ0RxaTNU?=
 =?utf-8?B?enR5QlBHM1ZxblkweXFlWExRVVUwRndtRUJFR0EwWTBHV2VGeDI5U2JONmhL?=
 =?utf-8?B?b0NiOUFmbDFKVEorekNPVDJNbVJjT3BtQkpUQytSNDgrQUNwMlBBOTlZKzJ3?=
 =?utf-8?Q?y3X769tE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2031ad93-0245-4fa8-c96b-08d8c38dbff2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:08:05.2878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovb26otIdGTqdtHua+7uuXelNduwRTtkNumdwS95vRXLq0zbdYILsiFdQDKARPsyGpL5xdY3pF6YDTi/Kl/y5eL22Dv0j0lnbaCnK4Oezko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Content-Type: multipart/alternative;
 boundary="------------1ED7E7A532237BAFA0AD3DCE"
Content-Language: en-US

--------------1ED7E7A532237BAFA0AD3DCE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-26 7:50 a.m., Leon Anavi wrote:
> - Install libmemcached-dev for release GitHub action
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-diskcache_5.1.0.bb => python3-diskcache_5.2.1.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-diskcache_5.1.0.bb => python3-diskcache_5.2.1.bb} (50%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
> similarity index 50%
> rename from meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
> index 9aaf71403..4a028d769 100644
> --- a/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
> @@ -1,10 +1,9 @@
>   DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
>   HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d"
>   
> -SRC_URI[md5sum] = "9ce87661369752c9ead63243b07eaf19"
> -SRC_URI[sha256sum] = "bc7928df986dbc8a8d6e34c33b0da89d668cfa65e7fcc91298a6959a35076993"
> +SRC_URI[sha256sum] = "1805acd5868ac10ad547208951a1190a0ab7bbff4e70f9a07cde4dbdfaa69f64"
>   
>   PYPI_PACKAGE = "diskcache"
>   
>
> 
>

--------------1ED7E7A532237BAFA0AD3DCE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-26 7:50 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210126125003.27620-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Install libmemcached-dev for release GitHub action

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210126125003.27620-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-diskcache_5.1.0.bb =&gt; python3-diskcache_5.2.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.1.0.bb =&gt; python3-diskcache_5.2.1.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
index 9aaf71403..4a028d769 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = &quot;Disk Cache -- Disk and file backed persistent cache.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/diskcache/">&quot;http://www.grantjenks.com/docs/diskcache/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68">&quot;file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d">&quot;file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d&quot;</a>
 
-SRC_URI[md5sum] = &quot;9ce87661369752c9ead63243b07eaf19&quot;
-SRC_URI[sha256sum] = &quot;bc7928df986dbc8a8d6e34c33b0da89d668cfa65e7fcc91298a6959a35076993&quot;
+SRC_URI[sha256sum] = &quot;1805acd5868ac10ad547208951a1190a0ab7bbff4e70f9a07cde4dbdfaa69f64&quot;
 
 PYPI_PACKAGE = &quot;diskcache&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1ED7E7A532237BAFA0AD3DCE--
