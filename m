Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.44])
 by mx.groups.io with SMTP id smtpd.web11.240.1615993269111376765
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 08:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ciWMTyLd;
 spf=pass (domain: windriver.com, ip: 40.107.220.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNzSy1aCej5R0IZNIY5ByIk8is9yKoQClw3xlBWbsOIoB6o4SmSlo7EPLG//94AJWqE9dWZugAuaCPfVR60tlGWWbX5tom44yb3xJ52A9/SnjH9q6GDc83x3enN1PM5CoYJmWMr9I50S1jK4BW7zC3CbbZc6qkGjX17IQ8Ez8OwOgmiy1cZBg/SJ3Ef+lWQ6m/jE6Z+aXqgEx6ZTVf3N7H9qwG/OUlHhH2ssQrMKFiMTUyVKrdThG9bnIWEUd5kem6QvBkVWuhxkm9NhVVRH6uTpJRawmBuAuvvkR7oZl/dOaIJfN9GRsoO150Db1P/wv9rFaoHkbd+5UGhQAglQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nomayeLX7IgVoUkLB/FZ37iBONfFBbojGaXm7ux+JF4=;
 b=Yzd2L38BVHv4Jz2Tm5u2Fhq3o5G5+WPP+BOg79UvJSimG+TmQnQRyFHh6Q4dYKNbmPpMRS/5xtxyMjOXWiYOXx3aH49Lb51T1eVPqwg28BhC36SwzAjUa2ZkNDuusLH762M4sRsyH85/34WBR4eY807UO7zLtym7oanEsnoPf2EcGy5XJaWc1LGC/NqStI35W65wh2mvSbfOsDwo0wm3+EAP2+zdlCSZ6TnA6vCj1aBhoEbJstWp6Z1BpTfoG83bWI9G3DV+Hwvf+FFuhjog4cZXRYWeA2nwOcCb/exAvsxNpel45V0JfADv8M7WCwY1ZlYt/nUtFfOCCRQDaMoyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nomayeLX7IgVoUkLB/FZ37iBONfFBbojGaXm7ux+JF4=;
 b=ciWMTyLd04sbWRFY4CehfnmvSM762+woXZSTCd1rWfQ2ALpmlKZ6mmHe+r7rBElLNkQxuKJ6M4xS2vPfmpxt/LP7m9Qt3oaKPz8BfWPn0rE0T8lWkI/TyUv1PXScuMJ9encro5JudMmKF+JTMRnkjvQntlQCii58RbyF8fX2aSg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 15:01:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:01:07 +0000
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-pastedeploy: Upgrade 2.0.1 -> 2.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
 <20210316083744.17558-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d7a4c4a7-f553-be4a-d41a-8bd1990f403a@windriver.com>
Date: Wed, 17 Mar 2021 11:01:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316083744.17558-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN1PR14CA0030.namprd14.prod.outlook.com
 (2603:10b6:408:e3::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN1PR14CA0030.namprd14.prod.outlook.com (2603:10b6:408:e3::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:01:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ced9b6e7-15ee-4cd2-0006-08d8e9557e74
X-MS-TrafficTypeDiagnostic: BYAPR11MB3253:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32538A344E7AF9237F538C4A9F6A9@BYAPR11MB3253.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n3RC8DqR9VgyrmOoS+BBpaCEM2T3VceH4gbN0rvrqRdQSCOFYHH5brbGHRJpDuCYgOUxbFZ7GpQ4RbwHJJ1WOlBOQ4aBauMrCqIyAQ7bhFs3ykBzUb/GctDmPpJpD88RCMVYaTdkTkpPuOY+k6mwB2nolP2GBUXSiHehbT3lLsLJz08sdY3fyPwrwedz5FquJgzmjFArRY3950TD+ZtPGd/1lBmfYo20/gkKwkfTW/kfRB0NsUpL64QhqOBhZCO+9i0THx8ZcfPs93ce1ODdodd9GWC1Uc0DtbDDbEmJRm+yygmsBp/wnq/FpkoTLtfxeyObD8rhEUvrFJHR8wAPICGPc0/D+0Cx11OyeTcLjilDTPsjoCO0l6Ml0kqxXAFQu3QMpv1Y/0EUWKGNrBVas6/FANPvkysVqGyOX2y2pYxba+LJ+LsqhemQidApgkZnxZgVufCErNJFfh7kpIjVvXnUTNywYZqhY3y34WiDKv+mV8jo7IWhcyCI9cPcAS/u5P78Kbduw1SoBXdCt/79s44NxtblT8M1uEHUIy3iGTBxenYz4KwTPewrv0v3hnT1/NVhXJKfdpeR6T7z2pDRCKqY9wxiwpcqKnvLwplLSzOQX3okpiOIx+90YnJpfXkRRSdyZS1HA0wHsz9ZzBGD5HGuz+18TL87wIO+T5UT/aLLRSdbVGhk1ZmF8QCaVLAbzeJd/NQSWBHjlnabvN1ccNbCCZ7NjC2hEeFYNgPUTFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(6486002)(956004)(86362001)(44832011)(2616005)(186003)(16526019)(26005)(36756003)(966005)(478600001)(31696002)(53546011)(33964004)(66556008)(66476007)(5660300002)(66946007)(8936002)(166002)(31686004)(8676002)(2906002)(83380400001)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WnpmR3A3NjBHY3FHSUVrbE11ZHVkYXh1NGs4OUZVTHRGRUpwSlNGblA1R2tL?=
 =?utf-8?B?SlZ4Q1NldEtoL0ljVnNuQVVLaVFPOFJjNnRjcWZReGlvVjRjSXNDc0d5Zndu?=
 =?utf-8?B?V29GOVh5UWQwQWRjSGdCdzc1S1FFakFzUUhTZ0QyK25Ea0xaOWlKWmdSUGxn?=
 =?utf-8?B?NWlPZTBFR3pHMVNyK3U4Y3lXdWhxclY4U2ZRSjhUeWRSYnNoWSszNlg4eVlE?=
 =?utf-8?B?dTNWMjlxaE5adlB3eURtZS91S0I0U1kxL09xZTNCeWtINjVUVVJJbG5xWW05?=
 =?utf-8?B?SE1VbWhaV1NzYVZOTWE0Um5IcVVGVFF2RVEycTNRV0pqMm9seHVNMGVHY3Zw?=
 =?utf-8?B?Q3o3bGc1eWhscjQzZE5RTlJIeGZjWk1KVGZ1MmpUVzJraTF6b25RM2h2bTdX?=
 =?utf-8?B?R1lhNXgwL0ZHZmhRb3Z5N3BmM1c2Y0dDWlNGdUpRQ2o5L0hScnBpeDZXWXpr?=
 =?utf-8?B?UmJRWnBsd1dhWEZTTldrZ3BacnpTeHJJa3Q2K1ltaXAxREt2QkR3ZFpxMHAy?=
 =?utf-8?B?OHlycFQwOXRuU3hoZXcvU0U1RmlhK0kxblp0RDhLbjNQZ1h6MWozTmh3YjdX?=
 =?utf-8?B?cHI1S3NDYVZFQW95QkVkVEtVd1Zpbk5DZnVLUWJBRFlJL0s5NW8xRkx3RG5k?=
 =?utf-8?B?dUhadk9iWExSRlFpdEpEWGVrZTE3eVBaWGFWNnlHVmVHYnVSaW5HK205cnBJ?=
 =?utf-8?B?SE80d3hQZEw2eGVWZmxNL0haWE9pbDR0ZklwSUNoY1Z1OHhWSERzOFIzRFZ0?=
 =?utf-8?B?V3RwRHZlRVQzSG1Sc21CeHkyV0Y3cnA2RWlqVm1XSlFkSHVEcjFKcHB4WUEy?=
 =?utf-8?B?VDluVWpab2phSjFWdEJRU0lhSnhySjVIWXBWQmVRdVhtWUFuY2w1WjRLaHhZ?=
 =?utf-8?B?YWVRYkhtV3Q2aWcwdFVRem9XTUNZMVI5MUV6R3hranVLWit6WWxOeXdBRWxh?=
 =?utf-8?B?YnY4Uk9XY3JmQnBDNkNSNzNLQ3Roc0QwNlNzbVpXMFdyY01kNllNQy9kVXps?=
 =?utf-8?B?VlJZdGFiNEh1OUFqTElCcWhrQVJWWmlCT3ZYVmhZeW5sVE0vaGhvVUFBczFs?=
 =?utf-8?B?UmpOSlg0Qm8xKzdkRFFrM0h0MDN0Zk5GTU8zN3grRDdESTF1c1dOVkI5WXNB?=
 =?utf-8?B?d2RvalpsUVZNSjU4ajkzT3d2azdrdXJ0SzRZQnVIYjMwdzNLUUlQMUZWbWFq?=
 =?utf-8?B?eVAzMUlLb3Zpa2E1d3h4Z0xiaU10MXpZUFJ1MGtNQVRZeGRuME96VUFISUZv?=
 =?utf-8?B?b0Nwb3RBbGZPT21lT1NhbkxJMnhOS0lhWnB4M2tyMzVEV3BhdHJOT3NHWVg5?=
 =?utf-8?B?VStIN251a1dWaE0wMlhsajVnL0JLbVQ4V3RteitzbVloN2tFU2VZYW1GNnh5?=
 =?utf-8?B?SHlRcnBVVUM3US9UbHRkb01EdXlUNGdJeVA4RkJEMlF4NzZ5bVQ5STRHMXFI?=
 =?utf-8?B?V2ZjRnVrNHlQZkUwbGwyalR6WTRZY1o5cjYxbTg3QlhaZXd2WjRaU2hnTENq?=
 =?utf-8?B?cVZaRFRNcWhQWXQ5QTJyT0gzMFFHQjd1ZHFndnkyUDBkNXNZRjJkQnUxeDBR?=
 =?utf-8?B?Ui8vQ1NOMjBHZlB2U1pqZ0xybzE4d1liWUtCRmtrOE8rU1NQQ3AvVTZXUG8y?=
 =?utf-8?B?czl3a1Z6bFhob3I5dzdGblJ3M1orRUNVbS9wSFZoYXBiTW92emI2T0FXdTRQ?=
 =?utf-8?B?NC9pTVVVdXFxZ1g5Y3JldGZESWpOeUNzL2ExVDdiK29GN04vSmZNNmdzNk54?=
 =?utf-8?Q?my5Fkw2w/Q/aU6UISfN+ltj+moPsH3Tu8jUKNL4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced9b6e7-15ee-4cd2-0006-08d8e9557e74
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:01:07.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXUMuxlHyCyaseN4XgulK7mJchBsTsV9WOcbOikgjPpWqLDj6Hkra7kA3AwxiHqxujCVW3J/MqzGs9JhdE32eXHJ+t48Hwky/4mikNH/cWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
Content-Type: multipart/alternative;
 boundary="------------63B89F54D4BD9518BF2400A6"
Content-Language: en-US

--------------63B89F54D4BD9518BF2400A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-16 4:37 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.1.1:
>
> - Added setuptools as an explicit dependency. This has always been
>    required but now that more environments are becoming capable of
>    operating without it being installed, we now need to ensure it's
>    available.
> - pytest-runner removed, use tox to run tests.
>
> License-Update: Use license file from PyPI tarball.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...tedeploy_2.0.1.bb => python3-pastedeploy_2.1.1.bb} | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pastedeploy_2.0.1.bb => python3-pastedeploy_2.1.1.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
> index b7c8c61d2..0b82d6bbd 100644
> --- a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
> @@ -1,13 +1,12 @@
>   SUMMARY = "Load, configure, and compose WSGI applications and servers"
>   HOMEPAGE = "https://pylonsproject.org/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/PasteDeploy-license.txt;md5=1798f29d55080c60365e6283cb49779c"
>
>   inherit pypi
>   PYPI_PACKAGE = "PasteDeploy"
> -SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
> -SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
> -SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
> +
> +SRC_URI[sha256sum] = "6dead6ab9823a85d585ef27f878bc647f787edb9ca8da0716aa9f1261b464817"
>
>   S = "${WORKDIR}/PasteDeploy-${PV}"
>
> @@ -20,7 +19,3 @@ PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
>
>   DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
>   RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
> -
> -# PyPI tarball is missing license.txt
> -# We will need to keep retrieving this from the online repository until version 2.1.0
> -SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
> \ No newline at end of file
> --
> 2.17.1
>
>
> 
>

--------------63B89F54D4BD9518BF2400A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-16 4:37 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210316083744.17558-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.1.1:

- Added setuptools as an explicit dependency. This has always been
  required but now that more environments are becoming capable of
  operating without it being installed, we now need to ensure it's
  available.
- pytest-runner removed, use tox to run tests.

License-Update: Use license file from PyPI tarball.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210316083744.17558-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...tedeploy_2.0.1.bb =&gt; python3-pastedeploy_2.1.1.bb} | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pastedeploy_2.0.1.bb =&gt; python3-pastedeploy_2.1.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
index b7c8c61d2..0b82d6bbd 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
@@ -1,13 +1,12 @@
 SUMMARY = &quot;Load, configure, and compose WSGI applications and servers&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pylonsproject.org/">&quot;https://pylonsproject.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c">&quot;file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${WORKDIR}/PasteDeploy-license.txt;md5=1798f29d55080c60365e6283cb49779c">&quot;file://${WORKDIR}/PasteDeploy-license.txt;md5=1798f29d55080c60365e6283cb49779c&quot;</a>

 inherit pypi
 PYPI_PACKAGE = &quot;PasteDeploy&quot;
-SRC_URI[md5sum] = &quot;6193afccc0982abedb9b7711d0d6adb0&quot;
-SRC_URI[sha256sum] = &quot;d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a&quot;
-SRC_URI[PasteDeploy-license.txt.md5sum] = &quot;1798f29d55080c60365e6283cb49779c&quot;
+
+SRC_URI[sha256sum] = &quot;6dead6ab9823a85d585ef27f878bc647f787edb9ca8da0716aa9f1261b464817&quot;

 S = &quot;${WORKDIR}/PasteDeploy-${PV}&quot;

@@ -20,7 +19,3 @@ PACKAGECONFIG[docs] = &quot;,,,python3-sphinx python3-pylons-sphinx-themes&quot;

 DEPENDS= &quot;python3 python3-setuptools-scm-native python3-pytest-runner-native&quot;
 RDEPENDS_${PN} += &quot;python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core&quot;
-
-# PyPI tarball is missing license.txt
-# We will need to keep retrieving this from the online repository until version 2.1.0
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt">&quot;https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt&quot;</a>
\ No newline at end of file
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

--------------63B89F54D4BD9518BF2400A6--
