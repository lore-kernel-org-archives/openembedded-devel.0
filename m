Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.40])
 by mx.groups.io with SMTP id smtpd.web11.12031.1615394788026016009
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bX7t66vq;
 spf=pass (domain: windriver.com, ip: 40.107.77.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8wCmjpbm6vBPs8kP44JYc9W8QTmBpexGqLihiZyue3T7hiiAKcJmMaMJx5WZmCeebAmI8O1VYlZxnb9XTxW5Ft0EieqXz01vKP8yEWOYaZJE/BpeC3vQ5uvjIH7pfNGAVHlvRigNGi379KN+5gBFbrjgxXDvqeiqnsLrneFxjSYGJtjOlYmrK6X12toqxtHfoAtq045603S5Q8xwwb1Y+WlI+aKW8ktnX/a/u4YMfz/paM4s1aaD+eN54X0eqXRL2ZRes0UCzbULRaVrn8NgOplkIkVug2rjxdmMvl4ahkIHxiZn26P1dHKRa+Iu899IIDopMrW3NnxPEa+L8KyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tefIeZm2HRNfmTEBA75ChbfkU5Z+FSAja5K9rhUwjk=;
 b=ImZOrioKHzPd318kWrZZoVts8tiS7n3OqR1O8wB2H60ssCSwMe8+3K1pZ/gFk4ATQTBvtxfKNkwl2lRWt9ztfNdQ54USv3kFobQrmoPUkm2l0NW646mXYjFXaZfBj4mOb+b6BWgpFTANb+uv6ahGu6sFfr/XLC4VpQI0IwaEB2q5wmjCkEDjgmMuQtsx27rg3ad2Wuhqa+4nQZVPAhdFb9oNSYUUp96yRgfia0tdHCim/h55PT4RV215EaSfeS82MIAoPM1aafoB6BF8qLcLWuZMNf8rYWk+d5aChCVBn9rvMYL2zLX4gYN5m4dBOy9JO/ZizoRw8aYPkcECPQn7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tefIeZm2HRNfmTEBA75ChbfkU5Z+FSAja5K9rhUwjk=;
 b=bX7t66vq8HQSbVbVIEm1jXt0eM+XeUGBsA29XB3gbSpuujsYThv1ALsQ/er8uLz+hZGD6byeMmR7ALu2hL+o5PbsRVsvJQsUaatmjgv8R9sVdJ+/Cgs8lz82K40JM5uVilFaRLKJcKi07/z93gHUn2R55esiEOHbhlpYkUBpopk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Wed, 10 Mar
 2021 16:46:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 16:46:26 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-prettytable: Upgrade 2.0.0 -> 2.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
 <20210308161810.21582-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <56e1da5c-352d-ca6f-bb3e-edd9e11a24f9@windriver.com>
Date: Wed, 10 Mar 2021 11:46:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210308161810.21582-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1701CA0017.namprd17.prod.outlook.com
 (2603:10b6:405:15::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1701CA0017.namprd17.prod.outlook.com (2603:10b6:405:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 16:46:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab76baab-eec9-415f-a739-08d8e3e40bc5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5008F6E2A8F7820CF9AC97019F919@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oaqbdog6ZxKdbmay5XNEckeH9QR08VgWtSfpqjBLyROnpGWszLEjYzqqcuaJiVXCYr07dBNt140eVBgNFLbOrV2OFYZhr3OxlIctd2SL9PGB8sMaXx+YR0Wq9MiiwlMsMeiJBiCSkoL4AWHoU02J7qDeAam2CCC0qxLdCkJd8vDg77VebH+khgdIIJjz8AoXQSta/IyyNGDkHwjUNsvFiZExq1mELvV00EaVvBaEdqzWBEUTDmgrCIKYm5ng0AGU5IpCUoS3r7zgs6sukQHFeCs9yjPsD8Z2vJU9Gxprwzf5KIlVrKK5rWW6hVl3VtTSf9p2oS2vZqFTNx9KjRq2pHruXanqdDDbOoFFw8kKt4KLQb4o3lHhJyVqzkifkpEAfz+Hkvm1fQuasYzDb832Xgo8DrX7zaSfI2316ViV/sACVtVrKlULxC3dqC515tbZtsd/VGyR5n41ZnL0UqREgzM3qWLuSaDBFp8D2zCuUQoKR7nDR/iaA4TKFgeWTuCWUDQQVdrthn6n1/UlvV7lELDfy8Y/0KegYZVi4Ie3AZsHW8mB8c3es5D4shfbjqFTVA3W8NHc/6jpXpF6z8RexDYQqu7c0Sp0FmwKYxtues8ckEjIWqK+rZbR2TWwGqQThzEOIpAZsKnku4jhrP11zpxEKBPx6z88NNMHYVsapfXYH6K13QiDCuDZLMYm6PjX4wiY0CNpreoHjyDqMe1WoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(366004)(136003)(16576012)(53546011)(2616005)(33964004)(19273905006)(5660300002)(966005)(316002)(83380400001)(8676002)(44832011)(8936002)(16526019)(31696002)(186003)(36756003)(26005)(478600001)(2906002)(166002)(956004)(31686004)(6486002)(86362001)(66556008)(66476007)(66946007)(45980500001)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TW1MNTFWb0sxck5VbmxWV2NMSnAvOExEVlcyVzBXd1YrVHA4Sm9qRDFmSDdw?=
 =?utf-8?B?RWtJZDB0YUxiTVhyUHlTQzVOS0NCMGo5SmExaXl6NGNYM2ZpTlpFeGltV1hH?=
 =?utf-8?B?VEhKalQxUldPVFVpNzU0YmdXVDVwYUhTRE1sWGZ3OXVBNTdpalpZRDdHTTN6?=
 =?utf-8?B?ejJzb3d1VUpVLzM4bWUxUGJDWWdmb0NOWVlPa1pSVGs4N1FYd2lZZXpUUHpB?=
 =?utf-8?B?UVRhbzZadlQ0UlZaRWtaSGdGUHRJSTlaS0dhTGI2V3NBQk1LVnlqeml2eUpR?=
 =?utf-8?B?cHU0c1haT0Y5dUpOZjFiOW12cm9IWXlCb0JYVnZQeDhPSFFOM0JJTExuS1dV?=
 =?utf-8?B?RWtZaWxNem1aVFBvVFFrWWlFRWR3SXFiSVgrOVRxVWJLSXEzTE5uTEVWZDBl?=
 =?utf-8?B?V3U2NzAvcjR6VVFaYVYrZVN6NkZrKy93WElVZHZjTjFOZG5qN0x3TlRjVnJ3?=
 =?utf-8?B?U01hVE9YL3JvU1VDa0pvSjBBeHhlMDlrWVVmYnY4STQ4MkNWVEM3SnNuVHJm?=
 =?utf-8?B?bVhPYldid2cwSTN5ZnlWRUxwUjlaMElDU0xQK0pZR1k2azdLQjZhYUY2VkVi?=
 =?utf-8?B?SzdqS01FbmF1SGpEWXFWMWQ4UlJLL0RhMHZadTVZRjBweGhlbzRHLzNHc2hZ?=
 =?utf-8?B?aFJRSUptWEQxT3gxNDNDeXN5c0dwSlM1Zlpscmwzc2ZUV1pWYUVqVXE0NEt5?=
 =?utf-8?B?YzVzTlJHRUtsbjRrTktJUnBNcVZzV2dVc0YrRjZOY2ozYWJmWS9HMXVQdkI5?=
 =?utf-8?B?YnRONEVrQmJNSnljdXluSTR0UlA2Vi9ldXFnN0Y0aDJQV2lTVXN4TWVBMEJz?=
 =?utf-8?B?NmxSVStFa2ovVjdVeGkyTGJiUHoxRjRGYlhNTWJWUlQrcHRSRFZVaUtuR3gy?=
 =?utf-8?B?SzdBclNhZ1FxWko2bCthVkpJV1JoVm5QeW40VStrdW9zcEZTSEtTdUg5RDl3?=
 =?utf-8?B?QkxCVmlUc2ZQL21kM1ZaWFl0T2o3cFdqMTA5OXZvK1BJcElSZHJZZ3p2WUhU?=
 =?utf-8?B?TXptOWZ6S3JTNW1KS0RiZXNOQUxUUnZ0aWZqTUN2R1RaZGR2b0c5aG5nTXor?=
 =?utf-8?B?N044T1VjeHQvWjdNMzBxY21nL252ZWZkcjNKWnM5UFpWdENuZzBPR1BEQXhX?=
 =?utf-8?B?R2xQVDU2UjA2ZnI0cUhibS8yTkEzMUQ3UDBoTzJKREFnTWM3RE5WY2lWY2Q0?=
 =?utf-8?B?T0doQ2ZEUmlSVWVIOVY3Tk11ZmJlYTk3OEtERzZ0S1dvRkRFRE4xTGYzYjh4?=
 =?utf-8?B?U1ducEs5aENqMFNra2k4MUEzc3VOUnZhT01DaUtRZ3dxQm01bG85SWYwYll5?=
 =?utf-8?B?STRwM1hVOGZ4VkFwamN5QXRrS1BpOEpJT0RtQ3VicVVHQm5zc0pKQWVqV1J3?=
 =?utf-8?B?eXJlbGdYQlJBRDhUbG12N3RYZEtjTnRjdlpybVhEaXJMZ1IyU0pSK0xIemcz?=
 =?utf-8?B?bEQ3UUF3MGRtZ3JQYitIVWdNbWJiYkExcklGb3NLSTJ0SnNiZEJjTUZ4M2ps?=
 =?utf-8?B?eEwzSHltcTRaVWZHdEhnVWwrTXozcjJPZHVBZll4SVNtTXhaa3VKSzR3UXNS?=
 =?utf-8?B?WnpXQVlIU2s5THdnckNCU0hRTVFEVFVkSkhZN2o4a0wvTGZCRFljcXlnSkJk?=
 =?utf-8?B?L2prYk9NRzdJTGtzNy96THpSNmxxM25RUFlEY3JlWHhJVjlxTy90T0Y2cWh2?=
 =?utf-8?B?RVZtczdWNjlTMUFGQTVwbitjVTJFM1FJcVFzWEVlZm5qNGRERFltL2E0Z3Vu?=
 =?utf-8?Q?icaG5zEvvIHFd0pKmHpkvVAPLVW3ccF/tSjOFj4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab76baab-eec9-415f-a739-08d8e3e40bc5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:46:26.5594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t8P1M++GrOnthaYG7KzgbHdL3U/uTzeb7rRYwruqOYn9NZ4uO9xel0Q/OocnHOc2MhRuOpLY6F5YBa3Xy7szxQXFlz4AyQccTdNH3+8Cok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------A01749E69CDFA59CE8F1FC75"
Content-Language: en-US

--------------A01749E69CDFA59CE8F1FC75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-08 11:18 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.1.0:
>
> - Support formatting options in get_json_string()
> - Replace setuptools/pkg_resources with importlib.metadata for
>    getting version
> - Docs: Add documentation for align, max_width, etc.
> - Docs: Remove reference to Python 2.x print statement in README
> - Docs: Update get_html_string with thead and tbody tags
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-prettytable_2.0.0.bb => python3-prettytable_2.1.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-prettytable_2.0.0.bb => python3-prettytable_2.1.0.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
> index 3563bfa11..fe7206255 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
>
> -SRC_URI[sha256sum] = "e37acd91976fe6119172771520e58d1742c8479703489321dc1d9c85e7259922"
> +SRC_URI[sha256sum] = "5882ed9092b391bb8f6e91f59bcdbd748924ff556bb7c634089d5519be87baa0"
>
>   do_install_append() {
>       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
> --
> 2.17.1
>
>
> 
>

--------------A01749E69CDFA59CE8F1FC75
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-08 11:18 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210308161810.21582-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.1.0:

- Support formatting options in get_json_string()
- Replace setuptools/pkg_resources with importlib.metadata for
  getting version
- Docs: Add documentation for align, max_width, etc.
- Docs: Remove reference to Python 2.x print statement in README
- Docs: Update get_html_string with thead and tbody tags

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210308161810.21582-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-prettytable_2.0.0.bb =&gt; python3-prettytable_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_2.0.0.bb =&gt; python3-prettytable_2.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
index 3563bfa11..fe7206255 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/prettytable">&quot;http://code.google.com/p/prettytable&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=c9a6829fcd174d9535b46211917c7671">&quot;file://COPYING;md5=c9a6829fcd174d9535b46211917c7671&quot;</a>

-SRC_URI[sha256sum] = &quot;e37acd91976fe6119172771520e58d1742c8479703489321dc1d9c85e7259922&quot;
+SRC_URI[sha256sum] = &quot;5882ed9092b391bb8f6e91f59bcdbd748924ff556bb7c634089d5519be87baa0&quot;

 do_install_append() {
     perm_files=`find &quot;${D}${PYTHON_SITEPACKAGES_DIR}/&quot; -name &quot;*.txt&quot; -o -name &quot;PKG-INFO&quot;`
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A01749E69CDFA59CE8F1FC75--
