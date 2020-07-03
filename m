Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.71])
 by mx.groups.io with SMTP id smtpd.web10.10889.1593785100745740789
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qwm4GHJs;
 spf=pass (domain: windriver.com, ip: 40.107.92.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SflyKzvz2aUmTOVDMkb6Mc/doo+7Pezw93Z0bg/zxcXn6ly0EFktmjvJ4CwazGgiJdYnYv4MFcLnE9XOgmpTCFIVsiq2vSV8u7iDqNu2uRu8JIgh/xDIA0hjWrc+vxJN51NsGsiK1jU4wLnGN/3Id4oyiQM/HceE4/is4hknrgoV7fRZz6e+6ZZ338qZqt2nC09f2ebwC2KQp0Yz+qtizNtN4rpBljjPNA8mxaE6wjIjOqHtgSdSC2y2myXSNUSXcyV4MoWodeCh0Zh44diEB9wIXKDg7Gnn10D0n6YhGzGmaEu8poX/SMVkXnsESBkb9fMGEqVbCi2HO7xYzw3uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dsu2mAPa4XP0o8finHg2wHAc0LlLVDHyfnOqGqGJKqM=;
 b=ICOkWogqhr1c8iBgLyALxHBWuSTgBrcJ2JFJuIFaTGBBxvwJsDzPGt6vc0UDrPLK2f4V1cwsDXF/gX16tVAHstryuibpT/sTkD+5hvgUCvRoH6K+JVLWpH+gp1Z3dhS2dOtZUNpeGstqjdKRFQisEIFlIDvjYzLKTPnltweK+XhyNzYJUBBFAJQGOsTRfasjmxmU5vyvKgQeaIX7Sga8HAHlpf6R2wuN4LZW2y2c2uwZFapGs5fqUtBTE+p/EDwBtxSzqToODuh/7xBJNHxUpneSnK/cAHWFdnGF0SejD8eJAg2NzQa/+iInNdfHxBjUWpWu4bYWPEpcHennQaxbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dsu2mAPa4XP0o8finHg2wHAc0LlLVDHyfnOqGqGJKqM=;
 b=Qwm4GHJsMt2coMNOBbJEFLuUD5hg2H8WfNU5lN/1HYen2PkwcQoHWEhmod+rujDq9MbwnfDT7ctu2tOf6/TAjG2NGoTnpNI2/VUQb64dZwt0llF7lQVVcO+zQWi2Txi4oTdWnMKBbm4W/++lf5e8th+swyej7sn+0U2d8B8Xjvc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:04:59 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:04:59 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-cassandra-driver: Upgrade 3.14.0 -> 3.24.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <30b0b0df-b460-de4f-3a69-a339a46a2944@windriver.com>
Date: Fri, 3 Jul 2020 10:04:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 14:04:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e06f23ce-4bab-432d-f179-08d81f5a1249
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628F0486E19D4E6A54E07B59F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gz+l98zDmLl4XqE7uxgb1AObKRq3KNk0XPj6r6SOYjrm/8ixw7zmHV7GKqK+5j11dilsLBtSuq/uLKwTm/3vQNHGqwLakCtNRC3pVo/xuXvovuLttrNs+GJeHcusSsCaDNvxp7n27G1eD55mU5lEJWqPNdyhRumA8J+380t0n7Ef/SLo0NrA1lfvW8tULPfRKrEkXh0JzCvtAOyN6rtu6vsIpC2PkVtvmGhYCftpMmL0bMyw7XZJ76i6XGhlgwXK76YDo6pYhYRwMcap5ShHmyBks3i9Mwb/9OYlfbGimM6qDQc6LiccOUZmEoNDLB8ERDtTadE5VuttTYb818vmLueMs+sa+vNYvwI8noZA4unFOa44DK3m2nkgYMgy2VbzH2oY0m0cvdMKp1Xasfv56dDzm4q/rRrCn3lvgg2yoC18yR6XHaUNadXJKIiQd4ZpIzUJXmJ7LWLZDL6zL3U7xQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Bw1kygyqLCEzGSS9luG9x8shZh39J5lQQw88zkd60tBnML/jStGQiAN7nK8SBpkQMX0CWvxmTnMDUGuZCEoyjjLk+JSJ5Pli5GVq7vh0BaZ3qazocvjMUEXvaqZAT8w2tKhCM26wulmG/dhRfr9xqLl1lj9hihc4cWiEdfki5K426nzkE0uTRyuAKvlSyigoYGU4gB/MtbdjJZ3R8KgChT6t9BPas12+pTXNPVtiZSbGozwickt2iHsC/bluEeFVLWvvYkAtRawIPsgWmSnFJCMNomP4EQzSs3G5n7nhw9GbefgsgloW+HT0jsgCB4y+vQykEv6zKHOiBdCEOtIqhKhqSubNSJ+FCCc4XFc4OrfOGgw90zQPZPYboVLj5xY8QVirXPYfupGuvKZT5VChXnlbt9BO0ghaalW9jgeFxbOVVi0To9Hx6pwcS3GArizomlD5qvsqdGTibvroHjZU/5DFNsn1V13iP7AY91aOJLzToxMP1EB113NUTku/iGFY
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06f23ce-4bab-432d-f179-08d81f5a1249
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:04:58.9597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIyfnJJH7jMbFKE1/5y5PCKP2oWSTbSF6S4derz/85ExSa2FlwmFd9aXxTYuXgtLwhM21uA0fLmOafwRl4x+xD9U9r8hhzDfQ6nzCegqNMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------F6F7AE8AB4725EFA6E59C9CF"
Content-Language: en-US

--------------F6F7AE8AB4725EFA6E59C9CF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Upgrade to release 3.24.0:
>
> Features
> - Make geomet an optional dependency at runtime (PYTHON-1237)
> - Add use_default_tempdir cloud config options (PYTHON-1245)
> - Tcp flow control for libevreactor (PYTHON-1248)
>
> Bug Fixes
> - Unable to connect to a cloud cluster using Ubuntu 20.04
>    (PYTHON-1238)
> - PlainTextAuthProvider fails with unicode chars and Python3
>    (PYTHON-1241)
> - [GRAPH] Graph execution profiles consistency level are not set
>    to LOCAL_QUORUM with a cloud cluster (PYTHON-1240)
> - [GRAPH] Can't write data in a Boolean field using the Fluent API
>    (PYTHON-1239)
> - [GRAPH] Fix elementMap() result deserialization (PYTHON-1233)
>
> Others
> - Bump geomet dependency version to 0.2 (PYTHON-1243)
> - Bump gremlinpython dependency version to 3.4.6 (PYTHON-1212)
> - Improve fluent graph documentation for core graphs (PYTHON-1244)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ra-driver_3.14.0.bb => python3-cassandra-driver_3.24.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.14.0.bb => python3-cassandra-driver_3.24.0.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
> rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
> index 768e557b9..562829028 100644
> --- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
> @@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>   SRCNAME = "cassandra-driver"
>   
> -SRC_URI[md5sum] = "c5bed026bf48c821424c1f6296193908"
> -SRC_URI[sha256sum] = "b65218e2582277f5b77d1436e420db8616f63e3437a9e839cdcd7172d760e861"
> +SRC_URI[md5sum] = "c31bc29989d8b0c7524a38b0e38c8bfb"
> +SRC_URI[sha256sum] = "83ec8d9a5827ee44bb1c0601a63696a8a9086beaf0151c8255556299246081bd"
>   
>   DISTUTILS_BUILD_ARGS += " \
>       --no-libev \
>
> 

--------------F6F7AE8AB4725EFA6E59C9CF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.24.0:

Features
- Make geomet an optional dependency at runtime (PYTHON-1237)
- Add use_default_tempdir cloud config options (PYTHON-1245)
- Tcp flow control for libevreactor (PYTHON-1248)

Bug Fixes
- Unable to connect to a cloud cluster using Ubuntu 20.04
  (PYTHON-1238)
- PlainTextAuthProvider fails with unicode chars and Python3
  (PYTHON-1241)
- [GRAPH] Graph execution profiles consistency level are not set
  to LOCAL_QUORUM with a cloud cluster (PYTHON-1240)
- [GRAPH] Can't write data in a Boolean field using the Fluent API
  (PYTHON-1239)
- [GRAPH] Fix elementMap() result deserialization (PYTHON-1233)

Others
- Bump geomet dependency version to 0.2 (PYTHON-1243)
- Bump gremlinpython dependency version to 3.4.6 (PYTHON-1212)
- Improve fluent graph documentation for core graphs (PYTHON-1244)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ra-driver_3.14.0.bb =&gt; python3-cassandra-driver_3.24.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.14.0.bb =&gt; python3-cassandra-driver_3.24.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
index 768e557b9..562829028 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
@@ -8,8 &#43;8,8 @@ LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 SRCNAME = &quot;cassandra-driver&quot;
 
-SRC_URI[md5sum] = &quot;c5bed026bf48c821424c1f6296193908&quot;
-SRC_URI[sha256sum] = &quot;b65218e2582277f5b77d1436e420db8616f63e3437a9e839cdcd7172d760e861&quot;
&#43;SRC_URI[md5sum] = &quot;c31bc29989d8b0c7524a38b0e38c8bfb&quot;
&#43;SRC_URI[sha256sum] = &quot;83ec8d9a5827ee44bb1c0601a63696a8a9086beaf0151c8255556299246081bd&quot;
 
 DISTUTILS_BUILD_ARGS &#43;= &quot; \
     --no-libev \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F6F7AE8AB4725EFA6E59C9CF--
