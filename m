Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web11.8415.1612533755601033744
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e6qViqqU;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huuYcZHh20YKTf8H8/xcMcNamQmyLkX2oA2srZCiwAw0JUVTFGnLv/BlEmI2WVtodAjBEaFPE+Bmuzbp8tB/6hEGQt7gj9CeSwyAM6Y5mIOnwQ0SA4SvdPWBq+mdQzERTlkIEgviPQq66RguLsB+c+lfmdgY8UASFFw9iN2p16N4s8yoHnoqQJddOz4Ebk5FUdC9JPw5LQDshdOKJzJPA9PpfG6w/gzhPLYyWDmMBjNuwTMvTT57O5G+snDAt+CIxyhUswZl7FcxTVzhMLPMqq5cFp13O1Fapjbc0v7AnT6nkaqXG85jHPbuLMTprNa0F8YaalAXrX4zK/zV/cZJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfb5vUJ49Xl28M6nHWAwfc2Df1NZPmNW3+XXXktBRkE=;
 b=a4b6fbGWx22df5i7N67e7m2OpZljCfT4o/KElMtANbWK1tX1Q0EBX0OqbXzrPBoykk9NbgNepWOb4ixXyo3zvN9I0Je1ewAFHDs0bNDELH+muW7qKBh5cKlOPvihD+HpbjwBj4bQ8Mm2JxSnSrK9gUilbSCovOeE3vyEymD9uM6BHarypgDnM+/metAuEfYr49beDyAsBN3xdt7tXigtj4HR9OoHURJESBnkxQ/QUHliVPeibjM/XVvK7SalOR/LlABrMpa2hFezy4Aeny5lDnqcOsFGvg8vz+NQcdD3sqdx1tQu6W/XBdGjMCekHgPvzS6cDjsd5NkQFxd14P39uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfb5vUJ49Xl28M6nHWAwfc2Df1NZPmNW3+XXXktBRkE=;
 b=e6qViqqUSxsKdZW+46NUsY0wFBeog5ielHLFAgf5ZMOGA+h0GJQRVkJG68GOgf/VBwsFT3ZxJTNEOv3Ao3KC8qX6x7OCQ0yP9Xii1Ps/1dj3KKj4hOnsUn7xcAv03AHXDAdgmLlBKxKTHbMtrnO6iL1wtD4VlXlIKURfTrmX2jU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:02:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:02:34 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-matplotlib: upgrade 3.3.2 -> 3.3.4
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1612320586-3432-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cf7bffaa-c8fa-9f34-5dc7-050001cd978f@windriver.com>
Date: Fri, 5 Feb 2021 09:02:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <1612320586-3432-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:208:23a::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0017.namprd03.prod.outlook.com (2603:10b6:208:23a::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 14:02:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b620034a-a0b7-42d8-26e2-08d8c9deafab
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3894D784E0595DA30AFCDF4E9FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P8DkQ+CX7PdzBuC9gvsnuPGLsKAlDAysHtpCzvRNUX+7VQPGtyEqk8uRtjpPNs3W/iABikVwivH6U/6U5d1LYMjyeBLjOo3wTqDGb4FPnt0fzUZAFG0F0eBXEEDj7xRqe2vmMveFSbANshHBu89yLFIJVTt1V3ZRnMLsYDI4/6C0oktHCextLLxwtEYDJg9POIIMIAqNNt2iOo8TihQ/qRHY3S5aso9Aey9naP14nyEssUOgJxRHM7rHpD1pb0nuY6uDw6Dqt4hb5l3h+p7pigAmxnhaHzRMEtwUvQL0amrVidEMcA0C8U/eQ4ln/GHk6cEJu44ebjLPLc4w/PGTRY8+Bcs1zxIgFnuhrtLA4WwmSw12pZMWR3a7DSUTS4lYE+zMqsl8FuX6H7ZTo8o+zb/Srw8vuwoSvqnH9OVG261d4tz0VrryCTcPXwRdawuaijvU/c6HKqYSTjF2Yk3a0oaC1HcJrwONESvkf6v9clJ1z/MO6fj+f32BASsS657uG9h8L+8ABqx4mAt3Osbgj0iHzBtwuty1vM6Ly0DAgm2EeFbyU087RB+wWDhI4TzwlrKBp4pMwAj8XZKOIdZ2ERVloiLu4YwGQPD/bS2sVqGqk/FnHwbUDhMAuu3nvtgR7jeiuYdiikDYITwMKZN+tNZTx60DN/u2esXgIGUtEk9BRvARBNp4By6Fk7Z80Fad
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RVViY0FYNmphL3hhT0xFSFdJTkdWRkgxV2htMVhVaVRkUWUvZTVwYlRqY2Z6?=
 =?utf-8?B?MVB4SVpHei9uamV6WVB0NXc1MUJHYnQ2bzM1Y0Y2Q0d1ZEtOUEg0eDF2cklq?=
 =?utf-8?B?NEFvTlcvdUJNZDNNcVBhZkxEbzhMc0NFcGloaXJDVGV6YmxETTFJalZBUnZl?=
 =?utf-8?B?ckphTVREdTJrUVNkczdRcU1Vb1AydGZjbThOQ2E2WEhUbXFsN2dRSzY5aWRX?=
 =?utf-8?B?cm4yRU4yS25DamczVmJybDVqZVJkNUVzU2hiNHhZVU5RVkI1UEdHUTcyWjNX?=
 =?utf-8?B?NGVEVjVCc2s5S3NFQW5MaVZYUlJTSlRBUW5IVEM1OGV4S2NyR1FpM3RMNURL?=
 =?utf-8?B?MC9MelovNmNtNDBCaldaMVpNOGxnbzZaZnVWZEVoeEtZbjdlaXFaT0pDS0ps?=
 =?utf-8?B?WDRqd2ovTXBPcjNqYjVQVHVCSnVneWpvWkFHWGp3UjZIU0JUbG5FUGxpTkxz?=
 =?utf-8?B?bUxaOHNzbjUwUkxkQW5BL1pqNmpJYi81NTI2S0dRNi9xOE9PNkVoUXd6TERR?=
 =?utf-8?B?ZXR5Y0tpWGtrcExRY2JqY1RsdFRURmNIZUc5VStkbVVrTmlObmpyRDEwdHc0?=
 =?utf-8?B?MWlSeitGUUFBb2Ryc2NMV3FGdytpWGtBZ0c0WnZjd0tVVHNNNW03S2hQbmlC?=
 =?utf-8?B?ZFZOY2dWRDdEcmdSQUJNZ01oY0NuVzd1UWtXU2szdlNQYjVLQ1BMakZnbTly?=
 =?utf-8?B?WGlCbkhjM3Y5WDNDRm5VRUhjSVFjZzNpZFpzc2VQcEhodmJGb1lQUEsyUDRp?=
 =?utf-8?B?QUZaYnEzcjg4UmNhakpUTktQOHQ1NGZXQVpWTEc4ZGdGcyt0V3l5QnZqOC9J?=
 =?utf-8?B?RHM4M0ZMRnZCVU5aaDF2S3h2YWZ1Tk1zQlcxWEkwOVh4MkdzSUcyYXY3SHpZ?=
 =?utf-8?B?Y0VmbUM5RmNBWE03dnBjZzI2bU1MeDBJK0lHOUo5K1RYbWJxWGtNVkRhekFR?=
 =?utf-8?B?aWJwY29ubVJWTHFhclRxS1Zzb1JOekpCZjBCK2FBV25WMndNWE1NdHYxZ2ZR?=
 =?utf-8?B?TWhqcVlzcmZlOUs1RlpKQnJ1endkNjhpQnRqdE1sT05rdTRYeEhOVEx2NDdE?=
 =?utf-8?B?VWVTMDJKb05Kcm0ybWwrLzJMeTg3R1d4K0tzK3pKTjVUUkxTdGhyZU1MdWlS?=
 =?utf-8?B?KzRiK3Z0QXVIazBmZG9IK1lqenB6Q3VhclhuaWc2OFZyMENDeVRVOXFLVi9a?=
 =?utf-8?B?bVh2bmMwcFJzWkZMSEkybzhpeUxXUU8zQWVQUkY3UmE0VHBpSyt2eXpONlJB?=
 =?utf-8?B?MFRGRzE5aGRPS2Y2dS81NzZqczE3ZE1IbmpkS3FvVWp2cHU3ZS9EY1BGbmtG?=
 =?utf-8?B?bjJNd0NycWRVZndSSGp2YzJyTWRndHBjQUZteXMrUk9Ea29UdjdVWC9ERy9n?=
 =?utf-8?B?Nmg3cmcwdnQyU1phOWtuVjFBTm0xd1Vpajc2RDBPbCt2STJUR2pDZUxLajZu?=
 =?utf-8?B?c0FmazJ2cHFnMzRhclRiOXhFSExSV0I3cXN1bVgyRUI2UER3bXp3Q2p2My9X?=
 =?utf-8?B?V3IxMVg1eTAvNDNJdW1VRmFOb3N3UUh6YmpyNlBmdXhVYXBCQ2RkT1hwVkpC?=
 =?utf-8?B?SUErR2xkeStwdjNLdnA2a0JJNG05N2JmZW1UVDRkakJsQ1krdW5sWmxYd3lB?=
 =?utf-8?B?TDR2eWx1YzAvbEFFNGNpMkczQk9zM011SWQ2RzNjaWFHYURjYkVmUnBudzVu?=
 =?utf-8?B?WlNZWlpBdEE2RTZiQ0gxSExmb216aDIyQmV2L1d5U1Z3UlRWc0dZNWp5WnJM?=
 =?utf-8?Q?x9Ggm7S+7Zpnnu/vKPUc/qPqChAgBexhS9C8CeU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b620034a-a0b7-42d8-26e2-08d8c9deafab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:02:34.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtgkUEGWxbTg/rbyLJpitTcjgp/1N8hxhqYvsYoIzjrfuY8aqQQlcO5vo6iomvaRl24+HLJoTOVwRRrm4XlXFrHgho1GbbwW3ZkUbsgZuXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------70E77B91A7F6080D9CD7FD19"
Content-Language: en-US

--------------70E77B91A7F6080D9CD7FD19
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 9:49 p.m., zangrc wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-matplotlib_3.3.2.bb => python3-matplotlib_3.3.4.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.2.bb => python3-matplotlib_3.3.4.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
> index 25709a117..a4df9a6fe 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>   SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "\
> -    file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353 \
> +    file://setup.py;beginline=273;endline=273;md5=e0ef37de7122ce842bcd1fb54482b353 \
>       file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
>   "
>   DEPENDS = "\
> @@ -19,8 +19,8 @@ DEPENDS = "\
>       python3-certifi-native \
>   "
>
> -SRC_URI[md5sum] = "a85791908e78818bd425ba9ab38500fa"
> -SRC_URI[sha256sum] = "3d2edbf59367f03cd9daf42939ca06383a7d7803e3993eb5ff1bee8e8a3fbb6b"
> +SRC_URI[md5sum] = "0b48f34ec623e765a1bda15924ce0b56"
> +SRC_URI[sha256sum] = "3e477db76c22929e4c6876c44f88d790aacdf3c3f8f3a90cb1975c0bf37825b0"
>
>   inherit pypi setuptools3 pkgconfig
>
> --
> 2.25.1
>
>
>
>
> 
>

--------------70E77B91A7F6080D9CD7FD19
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 9:49 p.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1612320586-3432-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1612320586-3432-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-matplotlib_3.3.2.bb =&gt; python3-matplotlib_3.3.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.2.bb =&gt; python3-matplotlib_3.3.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
index 25709a117..a4df9a6fe 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/matplotlib/matplotlib">&quot;https://github.com/matplotlib/matplotlib&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = &quot;\
-    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353">file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353</a> \
+    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=273;endline=273;md5=e0ef37de7122ce842bcd1fb54482b353">file://setup.py;beginline=273;endline=273;md5=e0ef37de7122ce842bcd1fb54482b353</a> \
     <a class="moz-txt-link-freetext" href="file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74">file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74</a> \
 &quot;
 DEPENDS = &quot;\
@@ -19,8 +19,8 @@ DEPENDS = &quot;\
     python3-certifi-native \
 &quot;

-SRC_URI[md5sum] = &quot;a85791908e78818bd425ba9ab38500fa&quot;
-SRC_URI[sha256sum] = &quot;3d2edbf59367f03cd9daf42939ca06383a7d7803e3993eb5ff1bee8e8a3fbb6b&quot;
+SRC_URI[md5sum] = &quot;0b48f34ec623e765a1bda15924ce0b56&quot;
+SRC_URI[sha256sum] = &quot;3e477db76c22929e4c6876c44f88d790aacdf3c3f8f3a90cb1975c0bf37825b0&quot;

 inherit pypi setuptools3 pkgconfig

--
2.25.1



</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------70E77B91A7F6080D9CD7FD19--
