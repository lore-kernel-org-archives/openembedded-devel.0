Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web12.11890.1603110609400733345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GLOG3o39;
 spf=pass (domain: windriver.com, ip: 40.107.243.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0QJAy6UmUUmFx9H59n6MNB6/OBfLzLdiCRHl05zgUGw9i986gZqeRQo83EHimPPV4tdvxCh5f+bLzkydBNVHRxDgfm6Q7XWCfZBjzReL3f7kd5yBaNo/fYTkv6+GTKz98FkMvALIZC745DuN4U8v4qjl8HWcLNPdUF9zhQbc+xmHUplQnXBOwnwZ2J7itDHP7dVVTHICJkhdhLkcQ7wEdCL1/Qjrg2Zzlfn+YnB1iVOdg9zp2W4DyPSCxmOEah90aLPeOQrPVOE2BRov8V1MbpyrciBGDjW/pWDpWbeJkoaWWX+KYNnp999UBPZHZOHPHR1gmhUHjd6atggUdLrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xG8I2benFGWw/TUi4qgvLmUv6YXSFE9l+bkl0HyQ8Ew=;
 b=GsNVZVwt9h6T6VRGaSVvk6nN5u37z7ZoLju7Jwf/cGWqeNemZHW3p4vY7bapkzgwvh6T5lm5knBfTryJHe+2TsjVVGyM9agnxf9TLLAF01BrXfTdN8vYpD77MyZ8hLYcwzpqeVprxo38pEEdvO5QwR9ztjC2gMldI5X1I3FXwB1TaFWarinfJ/jg3DoD7pHNImLBU1hiS0IGNgog1kCybW29IwLSfjSYOwn0VBS87ZJ43RLW9dvq57wVObOiNkvpnV1a3T5+wZd5+g+gvcNZ9n50GIjpQRuFeiTR6AzI7Ly+FkOXPEBw+8iLsJJTXSrT6Eh9t5xk7FhFOVaE3hQhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xG8I2benFGWw/TUi4qgvLmUv6YXSFE9l+bkl0HyQ8Ew=;
 b=GLOG3o39Oc+ou2aRJrg1ZeW93xNS9wGFdRiz317OdLBf4M9/XnccrYl0ONKJ+O1qC/bBFrB5TZBZLyZ+rhh2ibaY3OxoSFxhjG19S5COXx9vN0ziOvsSnfHfontOwn0xn3IMuyoP0oJn6rFbdDgTouZY5hdS4G5vN96TjG9zhU0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:30:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:30:07 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pywbemtools: Upgrade 0.7.3 -> 0.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
 <20201014073256.9605-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <66dbba61-870b-43e2-3bad-65f9fa0ba5fc@windriver.com>
Date: Mon, 19 Oct 2020 08:30:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201014073256.9605-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0028.namprd08.prod.outlook.com (2603:10b6:a03:100::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 12:30:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c547f1b-aec4-4378-9ce9-08d8742ab68e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4323B9B8C7AC583AEC990CA29F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xTv2ZRw7rnhDbcvyPVuN5dnxqGz3htBw9Yp/845FqRILYGd/EGgGOqbd4Hl8RWEFtR+TYOsGm/cc4mlwTZE24P0JtvxIyFehaSz54w3ki9QRnsdfpdLiY+Y99caMwofuMCRElSmiUtiR6YE3wbZgJU2l6I6UCtnSjLvPeltmZCpwE6eSPAtMtSRr3jyPIIwbGgm/Y9ap1njTX1sd7LYfWi36bTDhAerb7e7U8zFz52mTil4jMNxl50hIQzFxMr7wjc1Za6H4uaxk/Go7helXt/P1xMtY3v/asV3RJBFPVyA2HhDOXStc3hrAk2IvOhJsQvf04s8Kgp93ks/w3MuJgs79E0wUQ9wQWqfDMDrn2d0R3k/4DwqCLLRMUx4E3bVMA2Us2WGCbeVacf3nf6zGQChuEBRWQu/SVILG0qyHPvzSKy5b6yp8RK8AfqOhbViLKmt/XetQ5Ye06PdBvDgAzw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eTEaC3HbjzMylsUnnMfvUFMo5tgBP91e43QCS9PV0mndQ4rDDlRlCpeOLyPrpO1EzlJhG+/yTqFaEczBxjkpWMu/aqPG+r5y6QIP2yEPI14V0dZ9BisBOBSBgBksWGnjBKmIYTztmcZfecwURJiccPWnGhKqC2lxvrF4K8CNf4oc/3ENhrfYCsixt9YMui7VtJQP6IpZgUB/VTPCHfTj5LVZpd5+zv3Rt3z0YIvoei2YM3z3W5+DkG5N+VYwc5pQmt3eMMatrMRluIkkO3DtrdnngU/nX70VbA1DNdE+iHXLhOQgSXlhcB57Mr1sGlfOX5A6gr1JBgjXuipU0P2BUYqCJknUjS9YOt8qSmW3xw6nDxusuuepTjL7XOlruN9wqzkOPhKUwBX2owVsJrPXtZeCR2FUrVH8lwRoN1A7CckH0fiAX8LRVvVx2euS8p8GKtj6Wn03xcMeGJpn+YAKn3HhrMn12E12TFwOT3OqhtVDknXVsUjCSuctESDe6YRzMkzHqYW/nvda0mGOgroF87nbhAbv8voduHJU+dE0u5r9sf5BIo6FngpYtzQGGvAcbTb3GUyAFVf+IzGDUc742HGkmJ+kFaM/CkIQw0hsdYs2ncAsz/YvbFgQq7Rh/6iUeomsckjRNQIqWn3wqST/BQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c547f1b-aec4-4378-9ce9-08d8742ab68e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:30:07.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i83BHNpP763eDtus0Q0YRg75rFt6sDVdFaQRRf1fjVqiTOjg3gXOG3lGHwvpaE6Vgay+4JQbkllVv7i2vqfqbTn+VdOcn3iJt3vXvrmZppA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------80936736C0023F661691DE85"
Content-Language: en-US

--------------80936736C0023F661691DE85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/14/20 3:32 AM, Leon Anavi wrote:
> Upgrade to release 0.8.0:
>
> - Moving the commands “server profiles” and “serve
>    centralinsts” to the new group profiles with the commmand
>    names “profile list” and “profile centralinsts” added a
>    command group and removed 2 commands from the server
>    command group.
> - The –deprecation-warnings / –no-deprecation-warnings
>    general option has been remamed to –warn / –no-warn, and
>    it now controls the display of all Python warnings.
> - Order display of instance names when the .? is used to pick
>    an instance name so the same order of instance names is
>    displayed for all versions of Python.
> - Pinned prompt-toolkit to <3.0 on Python 3.8 on Windows to
>    avoid WinError 995.
> - Fixed exception when command entered in interactive mode,
>    on Python 2.
> - Test: Default connection file does not get restored in some
>    cases during test.
> - AssociationShrub produces instancename slightly different table
>    output in some cases for pywbem 1 vs previous
>    versions(inclusion of “/:” prefix).
> - Test: Fixed attempt in test_class_cmds.py to invoke a non-static
>    method on a class object.
> - Fix help message for “–deprecated” to be unicode so python 2.7
>    help does not fail.
> - Upgraded nocasedict and nocaselist packages to pick up fixes.
> - Error in test defintion for qualdecl Indication causes failure
>    with pywbem i.1.0 where mocker validates qualifiers scopes.
> - Test: Preventive fix for potential issue with virtualenv raising
>    AttributeError during installtest on Python 3.4.
> - Test: Added checking for no expected warning.
> - Fixed incorrect property order in instance table output, where
>    key properties were not ordered before non-key properties but
>    ordered along with them.
> - Docs/Test: Fixed failing install of Jinja2 on Python 3.4 by
>    adding it to dev-requirements.txt and pinning it to <2.11 for
>    Python 3.4.
> - Test: Aligned qualifier definitions in test MOF with CIM Schema.
> - Upgraded pywbem to 1.1.1 to pick up fixes and enhancements.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pywbemtools_0.7.3.bb => python3-pywbemtools_0.8.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.3.bb => python3-pywbemtools_0.8.0.bb} (87%)
>
> diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
> similarity index 87%
> rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
> rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
> index 8620057f59..03caec539f 100644
> --- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
> +++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "e3f8cadb8d1253b1b51afabcce4c3461"
> -SRC_URI[sha256sum] = "b475da4389ac77901191c886f4348660f3c0fd59365feb18ede47a086442efff"
> +SRC_URI[md5sum] = "e41ef654a0af0461d6c164752963fdfb"
> +SRC_URI[sha256sum] = "b869bb217613cdfee1e97e8afc28fe3f9bf3b88f8fc99e588d03c4be0922c319"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------80936736C0023F661691DE85
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/14/20 3:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201014073256.9605-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.8.0:

- Moving the commands “server profiles” and “serve
  centralinsts” to the new group profiles with the commmand
  names “profile list” and “profile centralinsts” added a
  command group and removed 2 commands from the server
  command group.
- The –deprecation-warnings / –no-deprecation-warnings
  general option has been remamed to –warn / –no-warn, and
  it now controls the display of all Python warnings.
- Order display of instance names when the .? is used to pick
  an instance name so the same order of instance names is
  displayed for all versions of Python.
- Pinned prompt-toolkit to &lt;3.0 on Python 3.8 on Windows to
  avoid WinError 995.
- Fixed exception when command entered in interactive mode,
  on Python 2.
- Test: Default connection file does not get restored in some
  cases during test.
- AssociationShrub produces instancename slightly different table
  output in some cases for pywbem 1 vs previous
  versions(inclusion of “/:” prefix).
- Test: Fixed attempt in test_class_cmds.py to invoke a non-static
  method on a class object.
- Fix help message for “–deprecated” to be unicode so python 2.7
  help does not fail.
- Upgraded nocasedict and nocaselist packages to pick up fixes.
- Error in test defintion for qualdecl Indication causes failure
  with pywbem i.1.0 where mocker validates qualifiers scopes.
- Test: Preventive fix for potential issue with virtualenv raising
  AttributeError during installtest on Python 3.4.
- Test: Added checking for no expected warning.
- Fixed incorrect property order in instance table output, where
  key properties were not ordered before non-key properties but
  ordered along with them.
- Docs/Test: Fixed failing install of Jinja2 on Python 3.4 by
  adding it to dev-requirements.txt and pinning it to &lt;2.11 for
  Python 3.4.
- Test: Aligned qualifier definitions in test MOF with CIM Schema.
- Upgraded pywbem to 1.1.1 to pick up fixes and enhancements.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201014073256.9605-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pywbemtools_0.7.3.bb =&gt; python3-pywbemtools_0.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.3.bb =&gt; python3-pywbemtools_0.8.0.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
index 8620057f59..03caec539f 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pywbemtools.readthedocs.io/en/stable/">&quot;https://pywbemtools.readthedocs.io/en/stable/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;e3f8cadb8d1253b1b51afabcce4c3461&quot;
-SRC_URI[sha256sum] = &quot;b475da4389ac77901191c886f4348660f3c0fd59365feb18ede47a086442efff&quot;
+SRC_URI[md5sum] = &quot;e41ef654a0af0461d6c164752963fdfb&quot;
+SRC_URI[sha256sum] = &quot;b869bb217613cdfee1e97e8afc28fe3f9bf3b88f8fc99e588d03c4be0922c319&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------80936736C0023F661691DE85--
