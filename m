Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web11.52691.1598879459507345301
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZqfJpVqo;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8/0w+8Vaiv6NFp/bDIg6sK0INb2O/kTyqXMp7/X3/Hk+efGbmHBAcgfbh8qa1HxJ6wNrm995dtD4Kt1VhmjEtrXGN+C52Zo1BPcokOQ/KYePc3Jn+Z8EITwRqYi18l+TGiwiZzRBiAhQBUnDHWHjeJrtE/jscAkMjFTBZ3JIIqCDoMLwXWba0S2MBV77di/znWh0M3VlF/GvIL6Y0VhkXHC/F+Q9AY6+/gP3Hsauby0YAwA5RxKaV/BvwJMTEZ8SuzOOyIzmPpV95yXDzmM5fnPiZnE0Zg/bp2LRHL0ZsQGbfnYKEJIrqw5OEzKE+hafmLyiD+Wdxocc9OcbDjZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU+E20Kke4e0a7yLT1wlUxGsDWbqfnOfrqKRmQ6RPTM=;
 b=WyRst2OxrRxfTJ9bJqJ6PcQFNGydaqRbevMJvKUi71G4zZ8EDED+vmKTO3FK+WZUqa/ihMIbpeHBXItQex/4GHOwVb9pGOU46W25gk1PIf5cJEKMu2BKlvHFpGree2xNEgMO7b0fvSamQv/TdyLKl6whT3oWyVrIoWINXG3ASC5k6yrqlfUuGSjM4Fj+4N98T6/3ThWVLO1k9/Za90pMNRiZsIdJWgsta6lkkGlIBg1SFiZVn8j01RlP/pGv2QgaExw7NeILXiTvrhjaNcWrIN+f6UzGveMpVaNKJNw1+xA/t++H/5p03I3ESZuulxuJDa8N3cxtFqp1h3FUgUmanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU+E20Kke4e0a7yLT1wlUxGsDWbqfnOfrqKRmQ6RPTM=;
 b=ZqfJpVqoJZSS6uTCWzpXdLSagagVwNgt85u1jmdfdNmbgqlY+1hCt+6BGmRuuDy+KctQ0QGKHedYOEFCfJpK0fqWrR3GZx/q2V3SkY3WzO/GlMQk/QfEzyErm7LJX3+1KkOTuvxqpt+uEluI9YAI18dpjcLwMKR4LExoGTyDkaI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:10:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:10:58 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-twitter: Upgrade 3.8.0 -> 3.9.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827092951.15749-1-leon.anavi@konsulko.com>
 <20200827092951.15749-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8457b801-afc4-e7e4-8ece-0167f3ba78cc@windriver.com>
Date: Mon, 31 Aug 2020 09:10:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827092951.15749-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:10:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14440aee-554b-462c-9487-08d84daf4ce5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807C21A928C1BD3A73880039F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K81vYks8gQUvQHpWAHm8seXoM3daafdXT6vN3rOX+MpOCUTIHsoB+znmddFCjmxrhKDplrbyCylMnSR9IC5Rx0do0OqcPc4GcY7TBh4RKKiG9PD1fguCoWhBDwUm4V+zY1hyv1C/ytiM+k5hVcz+oPN/Rt27b3TLy6L9mVLNVFeMRuexw+txvzPkES/ZL1KTOD5e94sDyi33FeYDXMT9UA23VB99ue+xoUBS53Taf7r0K5Ph4kB7Ytshbmj+UvWNMdkZ+K9a5PfDVCLIagsdoqSf2Fgpn8MEqeBk1oRyWT/EV+F2L0wWykul5oZxEl70mnzD77ES0ERDxJ47PSwIDP0lufW9JeXsV/+qw78lF5F5Y5BDaUwto5QIRoIgKT1QuJfNg80z9zvykwSnv2KPZzoG4FCg71yMFspgDknArQhU0dQDngynUzCQUfKr5AxVrPt61PUHnKNko6i6VJQPPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(316002)(2906002)(53546011)(33964004)(66556008)(166002)(478600001)(26005)(186003)(6486002)(36756003)(956004)(83380400001)(8676002)(31696002)(8936002)(66476007)(966005)(31686004)(66946007)(86362001)(2616005)(5660300002)(52116002)(16576012)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	n+eROP22algHpoQhDK3ojDkgjWJa2/2401PjaOmZ9TL4CGPQ+qIYRF4JLwDhSCqEkFijDeb7fH/aQs6n4k/xKjpFIvOTO33kyC6cnXUY5ZoInAlqoV6rNSYdiezfNXnnuASzpExLZXCQZqrI/bm4jxP2pYAT8D5n3lAGDR9uQiEVZfuyq5P/shioa+Kr82yHUSdfUxzUxfriAA9kVOxM5UdM4ElH3Rzg1NI5aJu46RMoAoTwPnDn9BTZF/tKYDmTH7eeN1xn0cr1KqhYwWCX9QZqqkinpMir8XsIIYy16Q0tMW13J0q3f1kqYFjR65LdpynL658mL8KltQkDd0FCdhTUnZoIw2v9iWsj2zslOM0gncJjP8C0dwmG2t1FMFxPNpatN3RpNRt4suD/u8o44dAUyPkcihhu7iz9Ti9HTut/7MvRzx2hROnPfPYC7CFqVCkJgvWT5G4yIGz93lcyt0hAntuY/C3/O2nqLAd0NoBs0mywCBtH5Jdnf2lWMUXUMEYZjlD3u9azsaRl90RU9Fjrj0rS6lcPcg+98qnmcplVLUaQnGCnJtcqt+oeyuvFdMGZc7Fpkfo4bqnQyPdjl75HV633jgZqtBEkJCEwtOrCM9HoeAMDItlrWUVGK3AFDQhTQVPyZOJ3TzT+Lp+Pwg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14440aee-554b-462c-9487-08d84daf4ce5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:10:58.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQrUc0vM8IGMOtRHxA192j+3C0Hbm8koQ0YOCNP0+4VNpGZmj/ToKNXrP7Vt22pCNyiuv0zORi0W4Uw3jIQg9B7kH03xjLZJBzozwKNJ+90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------A6329E76A87163DA024E3599"
Content-Language: en-US

--------------A6329E76A87163DA024E3599
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 5:29 AM, Leon Anavi wrote:
> Upgrade tweepy to release 3.9.0:
>
> - Add API.create_media_metadata
> - Update allowed parameters for API.update_status
> - Add allowed parameters to API.get_status
> - Add allowed parameters to API.statuses_lookup
> - Improve API.lookup_users
> - Improve and optimize API.statuses_lookup,
>    API.create_media_metadata, API.update_status
> - Add reverse as allowed parameter for API.lists_all
> - Add count as allowed parameter for API.lists_memberships
> - Add count as allowed parameter for API.lists_subscriptions
> - Add include_entities as allowed parameter for API.list_timeline
> - Add allowed parameters to API.list_subscribers
> - Add support for Python 3.8
> - Update and improve setup.py
> - Use requests socks extra instead of requiring PySocks directly
> - Allow uploading of images with file names without extensions
> - Support uploading WebP images
> - Add missing attributes to Relationship model
> - Update max allowed size for uploaded GIFs
> - Add _json attribute to DirectMessage model
> - Update and improve tests
> - Add documentation for extended Tweets
> - Document API.lookup_users
> - Add documentation for running tests
> - Add Korean translation of documentation
> - Add Polish translation of documentation
> - Document API.lookup_friendships
> - Update and improve various documentation
> - Fix handling of invalid credentials for API.verify_credentials
> - Handle boolean value for API.verify_credentials include_email
>    parameter
> - Allow Cursor to be used with API.list_direct_messages by adding
>    DMCursorIterator
>
> License-Update: Use the exact line from PKG-INFO.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-twitter_3.8.0.bb => python3-twitter_3.9.0.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-twitter_3.8.0.bb => python3-twitter_3.9.0.bb} (53%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
> similarity index 53%
> rename from meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
> index 78f66a443..01bbf831a 100644
> --- a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
> @@ -2,10 +2,10 @@ SUMMARY = "Twitter for Python"
>   DESCRIPTION = "Python module to support twitter API"
>   
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "8aeff278b7cefcd384c65929bc921e2c"
> -SRC_URI[sha256sum] = "8abd828ba51a85a2b5bb7373715d6d3bb32d18ac624e3a4db02e4ef8ab48316b"
> +SRC_URI[md5sum] = "b5bc640fa9f6baff6471c127aba1fec0"
> +SRC_URI[sha256sum] = "bfd19a5c11f35f7f199c795f99d9cbf8a52eb33f0ecfb6c91ee10b601180f604"
>   
>   PYPI_PACKAGE = "tweepy"
>   
>
> 

--------------A6329E76A87163DA024E3599
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 5:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827092951.15749-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade tweepy to release 3.9.0:

- Add API.create_media_metadata
- Update allowed parameters for API.update_status
- Add allowed parameters to API.get_status
- Add allowed parameters to API.statuses_lookup
- Improve API.lookup_users
- Improve and optimize API.statuses_lookup,
  API.create_media_metadata, API.update_status
- Add reverse as allowed parameter for API.lists_all
- Add count as allowed parameter for API.lists_memberships
- Add count as allowed parameter for API.lists_subscriptions
- Add include_entities as allowed parameter for API.list_timeline
- Add allowed parameters to API.list_subscribers
- Add support for Python 3.8
- Update and improve setup.py
- Use requests socks extra instead of requiring PySocks directly
- Allow uploading of images with file names without extensions
- Support uploading WebP images
- Add missing attributes to Relationship model
- Update max allowed size for uploaded GIFs
- Add _json attribute to DirectMessage model
- Update and improve tests
- Add documentation for extended Tweets
- Document API.lookup_users
- Add documentation for running tests
- Add Korean translation of documentation
- Add Polish translation of documentation
- Document API.lookup_friendships
- Update and improve various documentation
- Fix handling of invalid credentials for API.verify_credentials
- Handle boolean value for API.verify_credentials include_email
  parameter
- Allow Cursor to be used with API.list_direct_messages by adding
  DMCursorIterator

License-Update: Use the exact line from PKG-INFO.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827092951.15749-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-twitter_3.8.0.bb =&gt; python3-twitter_3.9.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_3.8.0.bb =&gt; python3-twitter_3.9.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
index 78f66a443..01bbf831a 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
@@ -2,10 +2,10 @@ SUMMARY = &quot;Twitter for Python&quot;
 DESCRIPTION = &quot;Python module to support twitter API&quot;
 
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8">&quot;file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;8aeff278b7cefcd384c65929bc921e2c&quot;
-SRC_URI[sha256sum] = &quot;8abd828ba51a85a2b5bb7373715d6d3bb32d18ac624e3a4db02e4ef8ab48316b&quot;
+SRC_URI[md5sum] = &quot;b5bc640fa9f6baff6471c127aba1fec0&quot;
+SRC_URI[sha256sum] = &quot;bfd19a5c11f35f7f199c795f99d9cbf8a52eb33f0ecfb6c91ee10b601180f604&quot;
 
 PYPI_PACKAGE = &quot;tweepy&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A6329E76A87163DA024E3599--
