Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.73])
 by mx.groups.io with SMTP id smtpd.web10.7708.1614177708234203391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AtE96HJV;
 spf=pass (domain: windriver.com, ip: 40.107.236.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXSWWNZuOf9vmRKGrWw4c0PasVqdK+WFIxtPmrJKE5EjkN53+5KJ+RXvSmakbmhwEamKlx9b665tLr/K1G94je6in2qsXnT1jQ4uT5mj8aCzUoU8Nj8htgDKa23sOPSxfaDHS80qvxejHwF0K35+umVvM2nLusqkmW91gLveuLNndc67FSS9afawS1UsgyHwBEoMdU2lgBxXeSNPU7Hdpl9cN2LtF3AgwNUEjzYpUMwiE1Gn9411BmYlz6iJpuepvMAqQCj5d23dPsqgjYjLROPdye0RYzjUS/eKASD8EG6v+TtzPC0L8aO4yt+fiwt/7FfGQBacX+3F2k2oB8oS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3TvvunWzPS0gtiHoh6DeredtZi/4gS1DIgrKMeEcTM=;
 b=hT9ynrMKkCSEKrDc7i4NJ+qbwNGoClcXj+rERC4SWkfSt6AQZ2m9z8Lx0Qp5PlXBy5WU9HaOPw1+HLSRR5Qs/EMw1LtJ0dfw9x2kha3QcwD0Vvrl3rBuGtMW2ZOdf6DH6MUM4ARMth+QbOYX82pnE+Gsid9CUG54eMJFPuCIOveo8ofBrVqqMOVtArlVMg1z1w2qTRHmtg7I0RnoB3g5k/CblAvDZzswoARDWcrqutietVDt0rK71Cj5pIS/05WcOzS1aPpz+gFJaHoNFDrHE8PJWDL9/X/tUxAESU8BdiruWNK4vB2gVV7nkeWDm7a5yNTht2CQn04QcTJU07UM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3TvvunWzPS0gtiHoh6DeredtZi/4gS1DIgrKMeEcTM=;
 b=AtE96HJV+LNVcTATxCD0suW3FYRzw5VOt7reWtCRDNYSgWF/zEFbRYGRnP6321ZQkIK95b+Jk3di4P3SZ1i8DaGy826kDwS82ZSnFeJgpWn2y1gMvQnwi15b4s33wpR0nJcJMj8C0m+7RSfgfZCVtTPgeTikmZHz4Usn3kO0UPk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 14:41:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:41:45 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-prompt-toolkit: Upgrade 3.0.14 -> 3.0.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <84ff6305-e4d9-3e58-c43c-fffab94612b0@windriver.com>
Date: Wed, 24 Feb 2021 09:41:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:208:23b::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR11CA0023.namprd11.prod.outlook.com (2603:10b6:208:23b::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 14:41:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5460c3e1-2fb5-427d-6f30-08d8d8d24f2e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4829:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4829D842A4E0A6A53D0D4F679F9F9@SJ0PR11MB4829.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	22p4sYeVrPoig3XI1frQdRA3SQ3kzUX/1j6mwINnRXpBsWeVPCMYeeqF5ZUcmdKIe2MM2F2+9EvBy6rTcVxKkYF3+MiZLQin18RHSNCPmu8Hw3lowfUd52Ow9vflfWrh9Ybeuh4yylrRluknN5kUcjJZtb5jX7gKAE3pnWy/Enw6XYFktNrRgWNnTMZGXjLhc/AtOw1neRIcvDazPyGU755oxydbCKaY+PFz7PtEXqwHF/TJ7bwfEWxkG3+P1kGLLDrzRmmUGhJNnybi5xtcCS9hs4aHxw/s6qMb6hOm75yvXYwHr7Ud5yT8ideAzMoa6XfpGBiJwNGZ9GnyTEc0br3bXkUuvAeghtJlw/L9dLSlo1hcCaAmygw2qWYhlpoluEVpyLFyHLVW9P+ldG9jCM9qw9mrgBDcpLAX2wXEtNVPRBmHMeIk3eSB+akMO4puaarpTCpgBTDZonhN6uBizst8YudrNwWVtXa6dZj1p1v3tycc0AH8aQvgHOINhQMgtYv0oVwPNnWj8g7eMACHjU4KOD/a7QeHyWeN5lrkL2onic/pDXh/GTaw9+S//MvUUzZPYGRRfTHxcy52Kfl/1yVHWTGzQW/fnkDWm4m518WktyFmskO2F/4sEtt8pFuZU+XLRQGLiXMCpzkD4Xpv5DjZ6stFaHJ1khMyZDgwdUrZwdGUldFxFkN8GsvLAmaP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39830400003)(6486002)(86362001)(478600001)(186003)(44832011)(31696002)(16526019)(316002)(16576012)(66556008)(966005)(83380400001)(66946007)(2906002)(8676002)(66476007)(2616005)(26005)(31686004)(166002)(53546011)(5660300002)(33964004)(956004)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dzlhR1JCc2JkclNkMzUyRzhPeStZL2pCbUk4dnM1ZFFCNWFUTTBQSk9KdWox?=
 =?utf-8?B?UkFjcGtrT09PN0tmT21LM2xVM1lkSFFTU0tpV1czejNqbGtjcE82RzZOTDMy?=
 =?utf-8?B?NXl1Z095ejVKWHlRNjJ3VWp1TXFwTDVrZFBHUUJKMUw4Y1VEZ0lxWGJhbHVa?=
 =?utf-8?B?NTNsMHEwN1VBUEM2TTVNK2p3eWlEbHdmZEMwZ1hoblR6V0dJYjBLM2FRRmhU?=
 =?utf-8?B?VGI4d3JRU1k0SmV4YzFHR2RQeHlJVXluTE14aTlVWEV2M2dFSDN3L0U0RHJG?=
 =?utf-8?B?NU9McFZmZHEram0zK2JsV0dVeDNmUHJReW5GUWwyWFBaWGdhN0hwdmZWQlN0?=
 =?utf-8?B?QjBpdXN5ejlUTXI3SkZuODQ1VW1LQmR1MlVTNk15eGJKbFcvdmpHellGZzEv?=
 =?utf-8?B?TTdhVU5WUS9JSUZiYmk2ME54bHNJakJLbTMzV0tJYno2SFZZUmFRUlZ6Tzhv?=
 =?utf-8?B?ZVlPaDFkSkg1LzMxVkhoMUtWOExqM1ZoNndmYUswZEdKd1Bxbmt4b20rY0t3?=
 =?utf-8?B?S1hYNjBsZi9BQWlVSWtkQ2lyMUV2WjlyRmc3S2hQVGtpdHpnS3dkYURDZmp5?=
 =?utf-8?B?bVV0VUVHY2RIUU9YajhqNHBYeDUwR2lucWNkQmtnMUtRM3BWaWlhb0ZmMGNl?=
 =?utf-8?B?RnBNUjEyeGlWWjhkK1dmc0NCMXM5Rit4dEhOaGY2NVhGZFh2SXhtQkNCQjBn?=
 =?utf-8?B?cTE0Y2c1NThEWjd2Q2R4aCs4dmtPK0JKOHNxV0NNQ1plMzJZWk1VcVVoWVVk?=
 =?utf-8?B?MmZzaVY4L1E1dmpmVHM0c21VdSsyTkZaS1FzN2ZIakpXT0lCL1BlMUlWMVZz?=
 =?utf-8?B?R1JyZW8rRmZPR0dLVFpFS0doNkhoQXo3eFdUTFE0S2dmbzRnQ1VEV1Z3bnZZ?=
 =?utf-8?B?QmhJWUhXUnlqOU10RDRPZWFXeGc5TUh4cDZPdVVidFhlcEZiMUdTNDR1Slc0?=
 =?utf-8?B?UHdDM1FVcHRacEUyVmJ0V0xtYkVSZWt1RVdwNUdrZDljTlp3cWxDSEFkUWMy?=
 =?utf-8?B?Vk81MGtPeGdzL09DV2RoOUxMdExvYzd3S1pwVmc0MkVUR3UrTHE1Vm5JM0Rn?=
 =?utf-8?B?RkxHMTRDeGw0bkdzbkkrdi9RekJYQkRUTzJmUkRaNi9mMnhVanNjSzRzT2F4?=
 =?utf-8?B?cUZBVEc3Y25xRkErSDVLUWpWLzBPd0UwT1VmQlhubXZiNXJXbW90VE5xYzU4?=
 =?utf-8?B?MC9pbmFqa2dIaTFGSG1UcmNwZ3Z0dkx4TlIyN1NIUFZhS1MzZDh1aENrRjlE?=
 =?utf-8?B?YnRGZEdMS0kvUy9JRmJ1LytHNERMQkRJTGRBSHdrUzlzdDVnWDd5bmNXNWY5?=
 =?utf-8?B?dlBRNzZBZU11WUFXamEvMXhocUlaTlM2S3hQd2c1aEFWZC8zNlBHVi9SUW5K?=
 =?utf-8?B?ZUhqbEx2cUtIcXdham5DT3BETDdlM25VOEo5UCtPWG1VU1dXR2V1eW45SnYr?=
 =?utf-8?B?ZDkxWUpDWC9aUEYxdTZwbk9ReHl3dVdhMTBibWduamZzQTFxa2s1bzUweHE2?=
 =?utf-8?B?MHV1NjgvT2VJcjgxVmEzYmE5SStjd0FHVUYvRVBKRFRpRExxNFh5SDdsanpH?=
 =?utf-8?B?QkpsWm9rYk11UzdxRzdkOW1acGR3aU5pcllzYlFjUCtpNGJ2dHhSdzdoSDl5?=
 =?utf-8?B?b09PaDJsMXpzbnRVeFB6RVJmR05zSXEyeDhzZ1FWMUVoOHBMdGZsbm5iakJj?=
 =?utf-8?B?MWxINWdBREEzSnZabUppUkMvVWx5QmlneW9QaUw3bUhBQmpvZ1VSZk9CT1NZ?=
 =?utf-8?Q?S8FjacR1J0sQTQuERk/JQOa5S4HKZSMO8jT/jHU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5460c3e1-2fb5-427d-6f30-08d8d8d24f2e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:41:45.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eGWYeniZ+xhD5RSRBYmhWLrDJIQfMpgYO9FmOc+nv8TNJIhxQfqM7sMDuWW6E7CsNqPfzGyQybjIILiskts7nAbm7DH0yf7CtjXvUkE1WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
Content-Type: multipart/alternative;
 boundary="------------AA69333B3FCDD62D5D72714F"
Content-Language: en-US

--------------AA69333B3FCDD62D5D72714F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.0.16:
>
> - Added ScrollablePane: a scrollable layout container.
>    This allows applications to build a layout, larger than the
>    terminal, with a vertical scroll bar. The vertical scrolling
>    will be done automatically when certain widgets receive the
>    focus.
> - Added DeduplicateCompleter and ConditionalCompleter.
> - Added deduplicate argument to merge_completers.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.14.bb => python3-prompt-toolkit_3.0.16.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.14.bb => python3-prompt-toolkit_3.0.16.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
> index e5ad069d3c..2a377d6e64 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>
> -SRC_URI[sha256sum] = "7e966747c18ececaec785699626b771c1ba8344c8d31759a1915d6b12fad6525"
> +SRC_URI[sha256sum] = "0fa02fa80363844a4ab4b8d6891f62dd0645ba672723130423ca4037b80c1974"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------AA69333B3FCDD62D5D72714F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.0.16:

- Added ScrollablePane: a scrollable layout container.
  This allows applications to build a layout, larger than the
  terminal, with a vertical scroll bar. The vertical scrolling
  will be done automatically when certain widgets receive the
  focus.
- Added DeduplicateCompleter and ConditionalCompleter.
- Added deduplicate argument to merge_completers.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.14.bb =&gt; python3-prompt-toolkit_3.0.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.14.bb =&gt; python3-prompt-toolkit_3.0.16.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
index e5ad069d3c..2a377d6e64 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>

-SRC_URI[sha256sum] = &quot;7e966747c18ececaec785699626b771c1ba8344c8d31759a1915d6b12fad6525&quot;
+SRC_URI[sha256sum] = &quot;0fa02fa80363844a4ab4b8d6891f62dd0645ba672723130423ca4037b80c1974&quot;

 inherit pypi setuptools3

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

--------------AA69333B3FCDD62D5D72714F--
