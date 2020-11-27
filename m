Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.87])
 by mx.groups.io with SMTP id smtpd.web11.19069.1606484909945735230
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iAHwyfu3;
 spf=pass (domain: windriver.com, ip: 40.107.92.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWoMVeB1cGrnEOycg+r9m0FcWdDwIewdgOLpfSvvCW8W9kdslnM1OIQ1L2Og6e8yvEybHIWnyjO8h9rJeCL+DZY1xyA1b7TkuNrK744LjRKs4lo4JvKgTmvX24U2CfyAKKS9Gw7fVnHIh4GguQ9EJzo6zrT8HTrpjbcBS8YtHLbp1RcjKYh9pXpxx6QiCYqt6SVXGeYYt7V7J1o3jJ63KAQ6CTPXprWVYdUk3c7n3Z4nAFVRQTmgnzhTni7amuc1RoCfXQYVur1nFtcjJfej0wr3FlloyqjkiSAKocHNnEXMPushK6D2VucTEVRjIdfSLbMYXq0cQ6+huIVDZNfiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbHuUaneE1UHVSgxZoeJOOkLjiNU+h2ZVTIWOBvgUdw=;
 b=eh+2aTRGJTu7IUTbqv/pt81hEkVD5v/D2jPMpBaLQ2n2uovsYXXtRNSZ3jXw0iNRT01dyPQNhdet/SicNCRtC6STI9kyWIlN2iXlulkkqHoGyju6JSDKcHOinJEtX//Sr1IAxvrkM6n6f1lD3mztY8PYh5kJToktHBj57hCV34FN0ehCiGm4WQQUtKOwduaZlUiG31EzYkadsRg9tzNe4RrWk0+wfTmLaRolncKPGDMQibV+OAe/owV4ucg+NliaiTyqv383qRjyI5AvgPrOcQe3AVDdJLRIxWdAaTErv5J2Je9bSuTqKVDKU4u/LpR4SweQSCdQbSP84D0oic1KqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbHuUaneE1UHVSgxZoeJOOkLjiNU+h2ZVTIWOBvgUdw=;
 b=iAHwyfu3s/RL4OtNuaF3k1dDhcQjMhYbHY/0+Gyuvwp+w5ioxgPrH4Sj5KKDejzDCgksQ66ZACrNqafvhK30Pf1K/tYxlr9ZVkPLmUbVo/dk/QzfyYv07Zqq/QVUiP1ZFKmg7aPtoJYS6Schb28+bQ+2wigzFoXZDGVxjZlDMe8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:48:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:48:28 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-ansi2html: Upgrade 1.5.2 -> 1.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
 <20201126112215.11451-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <47456be6-74f3-e68f-a1f1-b30c7ae00f35@windriver.com>
Date: Fri, 27 Nov 2020 08:48:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:48:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23688eb5-bf7a-4c86-7eba-08d892db1e8e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25982A015F5CB5258FFE57F79FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w0F3985XSlYAR+v3n0TAYFTy+yTHL4Br1zACPlao/wjKSVsOfbxkk/DtUbYkzB8GwJ+1FPO8b866jeiExXt2UXxo/4C2T+aO+4hwOyuWI+bfZfWAcC9L0vsKFiR0ZEwVz7crXIeSsJdtGH97qWs5A44AAWhXuYPdlq3A9Ba2jysv0NlWlTpt+gujS9WWqQPMVkP4F4jvwodE5+A4SnpbFKalKJhL8GjCbBeCQyHN8YKQW4KOFgkDfT2mJq7lfZ9v2RvMtd5R1Q9hMJ/eg7iC4UwO4jEOjojUJqz3DCrDqyeVz56DpuuKHH2eKawclMgPiWyHw8kye8XzbW/4ry+JUHFAkAaLJQhfsVd+dt2hP+XhwPKWAuzMQORuf2V/X5ID7xDQovm3AOaZqdYpZYFFnkXTnhxvr8Fih/LA9sb7PKAqEynUzozrovgLuGqkKk9257GqL9JTfSZVAZRDmg+rYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Qnk1M1RtOTVsdGg2ckR2UzZkTEp3WEwrNXdhaFlhR3QyYW5TelVURUhDcnJP?=
 =?utf-8?B?L09xNFVZS2xtdEVTTVZrRDFRZlZCQ3dYdHdvYlRxeGRUNktWemk3SFc3SFFJ?=
 =?utf-8?B?Rm5yeEFlcVBNYW5mU1d3U3BVL2ZDcDVPQWMrUU1yT09IT2t2dXVQWEp0NmpQ?=
 =?utf-8?B?aTJHV0RNOXM4NDU5aFNCaFdFMzhWR29hT3dCY2RDd1pyWXQyV1krVzkvVGt6?=
 =?utf-8?B?cEdqY3dvRm1aWnF3NEhZQ2pMQU9OWkdnU1dxVmpRWWVERXRrSENmc082a1ZG?=
 =?utf-8?B?clU4WlkzdlhXdmRBaE9DQXdBV3orSWpmRUdKamVBaW4vU1NOUmQ5c3k0eHh5?=
 =?utf-8?B?b1FtS01MVW1pZHBoMDlLQk5heTFyMy9nOEhrNFhHSzFWK0tZU1BNc0hpL2Ix?=
 =?utf-8?B?N2xrb3dXQU5YeVFMREhKT3RHK0J5SUFMUVRRVDlNU1NYS2d4alFxK1g1MFdu?=
 =?utf-8?B?T3hJUFdzK3lXR2t4QnpITVVhUDlOUGFBbzVVamp5NXAybm9odjljSkx4UUp2?=
 =?utf-8?B?Mjdiak9pL0grU3J3eXhta0lIcEkzajB2ZVJoMjN3ZWVKeDNXTUJwa08wM1Nl?=
 =?utf-8?B?NFJiUFJEOEMwVlZrNHpDNkRFUUs2ZHFCWkF1VDd0UVF6R3IxUkRTQ2FiL3Zr?=
 =?utf-8?B?Rmh1R00rSHJQRDA1aDA2MVhRamRvV3dheUJxbmZTVkJqc25ZczRtelc1UjE1?=
 =?utf-8?B?MnZSNHpPT0lCYVNBcFlMcldMdjd6cGVESThEdGZEZ3UyWUloMjVjT2orYkVT?=
 =?utf-8?B?WHhSdUhIUGV5dzJMa0lzRldFZHZLd0dQcGV6eHQyUTl6ejFwb1R5dXBBVGRq?=
 =?utf-8?B?Sk9qSmQ4ckVhZXZ3YVZ3S1E0SXNMY2UyWGdXLzhKY0FUTTg4blNad0U2aHNh?=
 =?utf-8?B?dThZd09Jems2WEhaTjErWjdWKys1WjJyWXlxSVdHYVJENFZ3Szl6RzJza2xK?=
 =?utf-8?B?blBFdnhmOVNwYkhuL0N4VlowY3J4UEZ3M0JuaUczUmdhZXlrMXBvZFpuU3RK?=
 =?utf-8?B?M1JkS0VlZlRTN3FESE9UamREaGV1Wnc4VzdabVNrcFk0emJGODE4eDZnU3Mv?=
 =?utf-8?B?ejQ5NzR4T0lFS3krNWJqbEtFQWJLWW9wVjQ0R28xQ1FsRktMa2o2M05GcHlK?=
 =?utf-8?B?MWlYZzBEaWIyOFJEYzNHSkx3VDVRRTQ5UWZZdGkvcXhwa0QrUlB2NDN4OUx5?=
 =?utf-8?B?OXROOWhydmtaNmZyY05rMGhaQmhhQndRbHdJek9sMGRtUzVsYjl0a3JETmVZ?=
 =?utf-8?B?L25aVWlTYzhTakxTWDEvRC81N1hpQWJkZnlHK2NsSU9lcSsxWkNDS3dSRDJ2?=
 =?utf-8?Q?Jy7quNsTXTMu3U/wiSDfScJ0BHoFfJMEur?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23688eb5-bf7a-4c86-7eba-08d892db1e8e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:48:28.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDGh49aWEpgiSbz8/y+c7e3H7o9FhJuzRAJOzSN88A7Arh2cOuLRFGdVVMyFCxFF/V1DatJVo5IAp3XrH2Mm1FpV158HREZLX09EQnB11Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------FDE913AB299C65423A6AF8DB"
Content-Language: en-US

--------------FDE913AB299C65423A6AF8DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Add native setuptools-scm and toml to the dependencies. Upgrade
> to release 1.6.0:
>
> - Add support for vt100 box drawing mode and high-intensity
>    ansi codes
> - Fix undefined behavior with linkify when same url is repeated
>    in same line
> - Prune CSS classes from output that are not used
> - Update style.py
> - Give more useful TaskWarrior example
> - Fix handling cursor move up with unique and empty lines
> - enable python 3 input decoding
> - Fix missing color CSS definitions
> - Prevent IndexError while handling CursorMoveUp
> - added setup.cfg
> - fix long lines
> - Started to implement LaTeX support
> - add option --title for filling in the title
> - add empty title element to head section in html output
> - added 2 color-schemes (solarized, osx). improved optparse
>    handling schemes.
> - added support to select a color-scheme. added schemes 'xterm'
>    and 'xterm...
> - Improve Makefile
> - Add and ship AsciiDoc manpage, improve --help, add --version
> - Fix README example to not produce unwanted spaces
> - Add missing license headers
> - Fix line handling
> - Add support for previously unhandled ANSI codes, improve
>    approach on handling color state
> - Fix italic to be font-style (rather than font-weight)
> - Stop adding unwanted spaces
> - Fix writing to sys.stdout.buffer
> - Add convenience Makefile
> - Fix some bugs
> - add --inline style
> - Fix UnicodeDecodeError exception when Unicode characters appear
>    in input
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-ansi2html_1.5.2.bb => python3-ansi2html_1.6.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ansi2html_1.5.2.bb => python3-ansi2html_1.6.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
> index 8e586ea3e8..d31448d6a8 100644
> --- a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
> @@ -5,9 +5,9 @@ LICENSE = "GPLv3"
>
>   PYPI_PACKAGE = "ansi2html"
>
> -SRC_URI[md5sum] = "52d6085ad1c5970082ea5305a26af981"
> -SRC_URI[sha256sum] = "96ae85ae7b26b7da674d87de2870ba4d1964bca733ae4614587080b6358c3ba9"
> +SRC_URI[sha256sum] = "0f124ea7efcf3f24f1f9398e527e688c9ae6eab26b0b84e1299ef7f94d92c596"
>
>   inherit pypi setuptools3
>
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
>   RDEPENDS_${PN} = "${PYTHON_PN}-six"
> --
> 2.17.1
>
>
> 
>

--------------FDE913AB299C65423A6AF8DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 6:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126112215.11451-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Add native setuptools-scm and toml to the dependencies. Upgrade
to release 1.6.0:

- Add support for vt100 box drawing mode and high-intensity
  ansi codes
- Fix undefined behavior with linkify when same url is repeated
  in same line
- Prune CSS classes from output that are not used
- Update style.py
- Give more useful TaskWarrior example
- Fix handling cursor move up with unique and empty lines
- enable python 3 input decoding
- Fix missing color CSS definitions
- Prevent IndexError while handling CursorMoveUp
- added setup.cfg
- fix long lines
- Started to implement LaTeX support
- add option --title for filling in the title
- add empty title element to head section in html output
- added 2 color-schemes (solarized, osx). improved optparse
  handling schemes.
- added support to select a color-scheme. added schemes 'xterm'
  and 'xterm...
- Improve Makefile
- Add and ship AsciiDoc manpage, improve --help, add --version
- Fix README example to not produce unwanted spaces
- Add missing license headers
- Fix line handling
- Add support for previously unhandled ANSI codes, improve
  approach on handling color state
- Fix italic to be font-style (rather than font-weight)
- Stop adding unwanted spaces
- Fix writing to sys.stdout.buffer
- Add convenience Makefile
- Fix some bugs
- add --inline style
- Fix UnicodeDecodeError exception when Unicode characters appear
  in input

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126112215.11451-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-ansi2html_1.5.2.bb =&gt; python3-ansi2html_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.5.2.bb =&gt; python3-ansi2html_1.6.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
index 8e586ea3e8..d31448d6a8 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
@@ -5,9 +5,9 @@ LICENSE = &quot;GPLv3&quot;

 PYPI_PACKAGE = &quot;ansi2html&quot;

-SRC_URI[md5sum] = &quot;52d6085ad1c5970082ea5305a26af981&quot;
-SRC_URI[sha256sum] = &quot;96ae85ae7b26b7da674d87de2870ba4d1964bca733ae4614587080b6358c3ba9&quot;
+SRC_URI[sha256sum] = &quot;0f124ea7efcf3f24f1f9398e527e688c9ae6eab26b0b84e1299ef7f94d92c596&quot;

 inherit pypi setuptools3

+DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native&quot;
 RDEPENDS_${PN} = &quot;${PYTHON_PN}-six&quot;
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

--------------FDE913AB299C65423A6AF8DB--
