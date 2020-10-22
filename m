Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.41])
 by mx.groups.io with SMTP id smtpd.web09.1358.1603410282602065623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MSEDJ/va;
 spf=pass (domain: windriver.com, ip: 40.107.77.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0MvG2s6wSEXcm0qwDqULmAqtXdiSFkRh0uNktr1pAlF/8SyKNdq4e1/8U2UulALfCbWGn/Auzk3iQeoXVeEPxk8GcU0v3Rb9rXYd7KcBMer4nBMr7o/zjQwUk0XOs1oBgNuN4CzjC+QoLMH8CGKTQ0I1HbGDhc13zlU3Y89NYYZ9XJu3zKVyAN7Ml8CRtyM/5xkC17ronfYZAmKdZcXUaDL6NIsiNHWfgeQhmn59Zz543UMFjxIgGtU25gDkBUk48q5tdYh/ij0jfvIMR/1RUqji5RdltZsdyE0Lirpz9MjAa4k+AJ4u/qfl5B2nxzdCWCO/uZ5iAP8oLvdVbN0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAlVAflr1OH/tadofr9raccgRzqn8ZJKG9Wf//yA0I4=;
 b=IcZYT71j1bmfcd9R+4lj3djbfYPfRjXuqsaVIno1Xm5ZmD7q5iDgxZUfIORqw1sFeaG0YWh6N6skVdK6aWlhXlL8tGGHnIESNDmARu9XzCC01dI97o69J3bxiBsHyy4SYEXsexBWd9pEs9F6rpfSRM2TqGpEXu5K//Mnmhhl1t7dwG86X4pEV0xiRvibVvq6ps62mZZgZDrOVWMSFJ7p2r9Sm8UblawC//8roZBy6rBmlg2U1moTptJZIzfWygAyKj4Me/psOJOILTfrXPVhAhX9a4vzzwU2pZSmWWf3aq+/Q/z7e+QMJDSSUGXuDNFknUfHK7+gySv+XcXHijCMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAlVAflr1OH/tadofr9raccgRzqn8ZJKG9Wf//yA0I4=;
 b=MSEDJ/vaIRJCGFyOjzD1iZSMv8f9M9bD3dPj6Cs87Xlc0E3UCllvqc2LNzZ+fQ3Ip4owRyUs9CW0SMRbZzBN1eC3wD/iaVsUlsbzKfaAtPyK5dXwWlZMMnzMb95OMHuQl3oyTp/djt13B8elZYpF+c5hPHOJeXseL6w/11KH8GU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:44:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:44:41 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-urllib3: Upgrade 1.25.10 -> 1.25.11
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
 <20201021111609.28237-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0546a696-e315-496f-540e-82984ffb02fc@windriver.com>
Date: Thu, 22 Oct 2020 19:44:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0035.namprd04.prod.outlook.com (2603:10b6:a03:40::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:44:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80aeca3-bc34-4aff-79fb-08d876e47217
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896F2581A41D2C3AC8CBD3C9F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EVj/bsrlmaOgbIkKD6nVL2r+XFMYfsOxIh+A6i3ZtBp9AuvImChQZdwbax/v6MfcA7ZiqJaBSKDPF0qNZgRfh2mpGkhFgn/aLRbDvrL5J3qfbCOmruIVkHgeWHH9aVV1IfqTJwa+osRVcTBedYhehCDEEpKNO/Xw52tl8dysCz1pV8RRrGlHwmb9kctV5OOrF3acBM0uxkXRofMQw9R8rvBnIa9grJMaiIa/VbDExQe2tBC2yVMA6WMegJwnIEJrwNFMZwvbhBqT21mjVZ/aQh/qCzrRxDd0/tQroAOcuANNIJKF45qU/TRj+86+yt1OsxMJjurse6wyd0SY6DACX7NO0aaVOztTQMwbgyTcqRepyLETHBuHSR5vSkIZl9mAdgugSS3Xk2W5k2xL8rLu8Q4V0HfyzIPeOaOgxCYXoLIbOQTAh8nzRjiny7ZXcS6B+X1PSGF7bqk0l7T8HMCYww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8Vff0orvX83oomalLjInPxb9BGt63G3CMFr6t8DsNdP4Upo5zDl/5h+0/hqvHLWuWtr1s+aEjtvoOHoy3EUck6Y/bVvsMsdEaMmhcpy8PUS+rTk0V9jEewtFLbvkWRjkFIG3ZulyaFYvVRijdmmKM6T5olNEDGNNVQPHtI87rf38yt2U+MJsRU9BhYzBf/dqq1dEjIFOUWdBHlNxWkPXnlJ1/3EmMsiLpCn/7I9gm8kRvIlfcBVqzeNUhC//6Ycw+GcTMQl6VmNOkaH+dtyOGA9I4q+k8PJDHlEYANrWl/2zv30UbursvqMPuJz2F9TP5zAgI1wmPghkvOxfycPBM33yC1akkzUHuxe4as5htGh1nfQmSvNpt066V6fUwjRcG3V3MsXd1hHDaJMIXL8/BkO5KDVZQgMZHlU/uBS3vd2UDl8KfcYEMYrHO4enl0W614mny2vD9Ro0aDMAETftkePqjUrnybpZxLAOUdlnRu/xy3xUKwYXKapi1s2904xIhxBHBRG1jSMV3OvgYxi48sj6j74JmjlzedQQaespxpF7aVvDcWnSRokdzqth5hadvQrzX9AeKUJrFKqG/Y6dc7+DWdZJx/v+nKDH8B/WEr/kt2MxKvPFxw9PG892hDwPeecAAcmF+uheoHZeuj20vA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80aeca3-bc34-4aff-79fb-08d876e47217
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:44:41.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCMGvVYTmoLbx8M9qHYuGINUWJn55V03Zqx4wjfpeGXXZ9ThVl+r3bbGb4BjARYSdN2i7gMdnlACnP2hHp2hsTIMsrkkxep6uHi5+VqYTv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------36A8F8564A7451A9E052420E"
Content-Language: en-US

--------------36A8F8564A7451A9E052420E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - Fix retry backoff time parsed from Retry-After header when given
>    in the HTTP date format. The HTTP date was parsed as the local
>    timezone rather than accounting for the timezone in the HTTP
>    date (typically UTC)
> - Fix issue where an error would be raised when the SSLKEYLOGFILE
>    environment variable was set to the empty string. Now
>    SSLContext.keylog_file is not set in this situation
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-urllib3_1.25.10.bb => python3-urllib3_1.25.11.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.10.bb => python3-urllib3_1.25.11.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
> index db985a2ff4..980f4c53d2 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
>   
> -SRC_URI[md5sum] = "94e3d4d472a14e788d4bd1a903fd102b"
> -SRC_URI[sha256sum] = "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
> +SRC_URI[md5sum] = "d47dd21a6e66a03c3633cac468ffd010"
> +SRC_URI[sha256sum] = "8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------36A8F8564A7451A9E052420E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix retry backoff time parsed from Retry-After header when given
  in the HTTP date format. The HTTP date was parsed as the local
  timezone rather than accounting for the timezone in the HTTP
  date (typically UTC)
- Fix issue where an error would be raised when the SSLKEYLOGFILE
  environment variable was set to the empty string. Now
  SSLContext.keylog_file is not set in this situation

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021111609.28237-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-urllib3_1.25.10.bb =&gt; python3-urllib3_1.25.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.10.bb =&gt; python3-urllib3_1.25.11.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
index db985a2ff4..980f4c53d2 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/shazow/urllib3">&quot;https://github.com/shazow/urllib3&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e">&quot;file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e&quot;</a>
 
-SRC_URI[md5sum] = &quot;94e3d4d472a14e788d4bd1a903fd102b&quot;
-SRC_URI[sha256sum] = &quot;91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a&quot;
+SRC_URI[md5sum] = &quot;d47dd21a6e66a03c3633cac468ffd010&quot;
+SRC_URI[sha256sum] = &quot;8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------36A8F8564A7451A9E052420E--
