Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.79])
 by mx.groups.io with SMTP id smtpd.web10.22524.1600263421905051708
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Fw+qMsW1;
 spf=pass (domain: windriver.com, ip: 40.107.75.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXExUhjTr46OaYaVnE38aRWG3Hh+o5RF/ew1axuex0GEQ6UDB9g2+QsO/WWfNJXEPO4yysLHwIxfsb8oawLHafqiYsJu6XD0AHwk6qUMkIAIsCyagfoxgwXnXb0HSv3brLt/CQ73ZOiL0sPb86jr2Gp431g0fHdkJ4giKDUSkKJyrvrlG9Yp0stGuLpr5SLgcmKdrPVW3pJIhRm/ukTT9xrSRcEbonb1uCyW3EEQVwgXhzxORczXUgHiBA1Eb2zubmEP2L1+tdpfogEjho0bYd9c1WPbq1YMaj4oTereCtObm7V8lmIFN1KcWSCcFGP0yXdFA22175WsIz8C4587yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPO+6TsTD/b7ZBeBrUJXBrX1euJe+ghJHz7ihOMeke0=;
 b=EdtCNHfnGmcnOQw40Oe7UeRbbVEbD82hPdhyy97TrvVhc+oay8Y6Io9hIu91Q5Di1c3khxOksnhjZDxT01wNkhO10HBn3tghKJYmsCnL+kA2ulghoODUJJgzqjeMorI09AnvhrP9rxTe+5/oxiM0KRLAqx31XElTlo6oftJVPiubGroy3RxIl9qyjJVjQ3+CrNM/l/5/EwM9pfuNXCW20yXYKQlJtLH5PkQcjxKeiwxbA/xOJ41601RoI1/Wxt7x6DXck3ReX60rL8kiXke/xbqAGdhtqo7mOSOGrle3oaxZehbny4yQvTV4KYWNEKNqiasht+nAAj5BxVV3iuX+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPO+6TsTD/b7ZBeBrUJXBrX1euJe+ghJHz7ihOMeke0=;
 b=Fw+qMsW1T0d8NlA+AowNPcSzMwWLt4d27R3NL3GqN+amBe0NXNih5rMy6eAt/nvfvMIVk6SQcjdIiP3dBnP0ZJ4bHcRuA3XPFY+VwXQBR7id3CH2POBjW6QXXFLvQXp1sY+pD6V8NDQQ0xtrhYZm87RWI6sXLtPfwrGiBwW5fWo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:36:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:36:59 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-nocaselist: Upgrade 1.0.1 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a4d69908-5ade-6703-f250-4b5076c7ed97@windriver.com>
Date: Wed, 16 Sep 2020 09:36:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 13:36:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11ed4feb-35f6-47b4-3df2-08d85a459614
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4306F3496BDD174C37AA8B7C9F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B0dUhYPvPs3fWCvnxPVi9k+pXZXCt/iL2BJROXN5JRYpnM2/suyQIWIYBf/zEJ4ljlunDivvjMkVCY35xdIbg46OezEhxSGbcNXMVUdHqFjiDvnYmcqYilmObculI1r+ln0tIXnK13sz57qx46cyrtuwfAgTySd5iuczOCRpmM9RH4L/vojZhPY0u3HEAW+eVj2pLX1GwXHh0SyrcBrxom74PztmneFNeY1bcRcgftRbOI2h0JyY7TUPBTvuhbWDt/umnj1sR4G7bCxrPob7JDtcMQLg+72nKhohJa6JRTNx0QU7W+dedrixRVC5fq1mC2Fe0jRl1VVzDKRUfyoLRQ+pzlNApbrxOp5p/ACrqgDpmXhfZp1fZqvn2EC7Wfp1cg9fV04avRSivRyoSJbLzy/8driWjEavgdObl4EEEcQfESBrboJH2PPp2lVI+ZUhhn638DKGMXFvyRUKBl9cdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(478600001)(6666004)(26005)(44832011)(166002)(8936002)(316002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HAIaTlYVbj1DNGr7aWxtxS71zorcSM7fDU4qfMlv6bfOAmtayuw7ODCczlplBNVuFHt3+HcAKouXXiTMGc9EA47UU3OHmr9EfrIcJwBNxH6CK83J94ICpqoxkGKjdgdiZ+qE8p/XH7vsJPYP9YCQkVudmlSgDnfieJmdxIl2gWtB1aCVyovANim1VqMmtXsJmOSG3t5q4NWf5WJWRsUiHS4BHwW18PGOPXuKgzxnn3OFvcvNB6gpj+rOU4Csn3JSoW/bP0au22+RSEQFJ0crqDk0bkX1oLtEkoF1wbtD06mlV0i5lsQhD8hA50T15SrR+g0pYGq0CZeGQdAYu0IsMg+bGZd6VjQDGICBL4KwPtd1+DHw/YNSESc4Zv4J9QfHMYiFf/P0jeZtK7AFCanL2NeU2btZRqSmGbLiR4zRl3DC/ZsixjDvKcTyqgF/YYJAn2UyoF0o0QKIhofy4TiQtcBNS3dYEnNchXydwns8lDpO1VnEm6lm7whyMtPLtIoCzWcSeEtQFDOpAVx9Zt7uwIk4C4ozmgxfKSIQIJ1TYau9uM2JpmN7krGnPc/qyiimEwJDX9tVFgyr1PowWav4dcz3A2nRxDWXsdFcfF/J+Io9mNthtzz0pOc9JngjvPa675qEQ+d2FTlr24AyX6WHHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ed4feb-35f6-47b4-3df2-08d85a459614
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:36:59.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c/h6gnSeb9Ru537E3vxo0YhYyqa9mBtMWve7/29XS7cAFNMcNkEOG5AfX+bhJKPUS+QKCpSR/bzHUPu9SUJRK2pbreOP2hiF6r2zD11UtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------12FA0E766F7924335D346478"
Content-Language: en-US

--------------12FA0E766F7924335D346478
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:02 AM, Leon Anavi wrote:
> Upgrade to release 1.0.2:
>
> - Fixed an AttributeError during unpickling.
> - Optimized pickling a NocaseList object by serializing only the
>    original list, but not the second lower-cased list. This
>    optimization is only implemented for Python 3.
> - Added tests for pickling and unpickling.
> - Suppressed new Pylint issue 'super-with-arguments', because
>    this package still supports Python 2.7.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-nocaselist_1.0.1.bb => python3-nocaselist_1.0.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.1.bb => python3-nocaselist_1.0.2.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
> index 9a6b24e75..8509cd0c9 100644
> --- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> -SRC_URI[md5sum] = "a2654766ee683906ba6c77ac1e89f556"
> -SRC_URI[sha256sum] = "87dc37f97cf52f6e10e1e4a82f56359067462a713222b52976045bf227a40eda"
> +SRC_URI[md5sum] = "10e58542c1225aff3f057e89e9ae4394"
> +SRC_URI[sha256sum] = "3cfe964c436991cd6bd9f2cf23375c484ec7cf0c7488471381eff13a4fdac902"
>   
>   inherit pypi setuptools3
>
> 

--------------12FA0E766F7924335D346478
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.2:

- Fixed an AttributeError during unpickling.
- Optimized pickling a NocaseList object by serializing only the
  original list, but not the second lower-cased list. This
  optimization is only implemented for Python 3.
- Added tests for pickling and unpickling.
- Suppressed new Pylint issue 'super-with-arguments', because
  this package still supports Python 2.7.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-nocaselist_1.0.1.bb =&gt; python3-nocaselist_1.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.1.bb =&gt; python3-nocaselist_1.0.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
index 9a6b24e75..8509cd0c9 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://nocaselist.readthedocs.io/en/latest/">&quot;https://nocaselist.readthedocs.io/en/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>
 
-SRC_URI[md5sum] = &quot;a2654766ee683906ba6c77ac1e89f556&quot;
-SRC_URI[sha256sum] = &quot;87dc37f97cf52f6e10e1e4a82f56359067462a713222b52976045bf227a40eda&quot;
+SRC_URI[md5sum] = &quot;10e58542c1225aff3f057e89e9ae4394&quot;
+SRC_URI[sha256sum] = &quot;3cfe964c436991cd6bd9f2cf23375c484ec7cf0c7488471381eff13a4fdac902&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------12FA0E766F7924335D346478--
