Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.42])
 by mx.groups.io with SMTP id smtpd.web08.7862.1614178007547175018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Aodk8tGE;
 spf=pass (domain: windriver.com, ip: 40.107.236.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWFkQ2gE59HGUtWjiY1wObHNcBML6nQGoxAB187K9QMAuGWPr2LwtgqX+csq+5w3A9UeiZRCoRx/QR1RHLrhWXCjCj44NAuN0RaYPxnqCf7zlg6oV/C+c37lstDQL4/gfGbI8KIyKvESFIcXSuYIVW/XBdHjPnwRgCpINfpQ3/hn+PgoQSBQ3M3boxKARFxtl4SvxhdsSoQ4Mf9mvn/3l2+vAThMd/SWSju5dZQWMd3YUPYtPnFZ6Gw0LSXeJaMcURpvtKz4ZmV+lZ0sSy7sJH+HDdbOuISCvTfpuSuJVRB198MM9DwKLOd+LivfTrIXZAvbVB9w9PMOARzaoIQjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFPf5Z+u7bKkG5rN7THF9Bf+V8if/oP2bd21f8segas=;
 b=akI6uj/3xEx8RSi2Rk3cgNMKoONxtlWYgy/h7V9IzEnM6wMaixESZsg5yIugSzCUiYsihEi4XURvsFc+ac6gz/gmtyQHohIhKj7N60fiv1yYoEl2rNE9g/NHvIod/kRsLIGDPLZuH5gDjSHv3v5AXGhy03524X/IkP1sGXRsyoXW8lfbjJnP+hFVR6OcsZbyO+I/mu5DeC2OPMmHbpWGCgmA5HCxG/OePTR1f5dx4fFqOVkLj3utUqKqHxuwg6LC3FBctTiy8VSnHX3ZWU4H3TtfyTlz6uW2EuU81TtMKk1Hu9ncxAWFz1oqRf/reNtnHGHL6z2nxLD2ItgnQFVW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFPf5Z+u7bKkG5rN7THF9Bf+V8if/oP2bd21f8segas=;
 b=Aodk8tGEDE/6EfculGWu/F9r+WZHv3HBSucBavu/KMlhi1qkH+5rAHiMXjOv/RWRscM6t1cg01rsIuZklLX+8vPdBBHXhyPNSkTKMFZdTOToG7cd3wgYQOWgZWFv+dRd0fh5IV9QQtDZmmIguJo1poerlzBNnke+9Ze2CkaxyLo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 24 Feb
 2021 14:46:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:46:45 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-autobahn: Upgrade 20.12.3 -> 21.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6481f682-458c-2a81-2499-67fdce502cdc@windriver.com>
Date: Wed, 24 Feb 2021 09:46:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0296.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0296.namprd13.prod.outlook.com (2603:10b6:208:2bc::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.12 via Frontend Transport; Wed, 24 Feb 2021 14:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28bbd0d3-f4ae-4e74-8e04-08d8d8d30195
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4928:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB492805B8AD25CE280331757C9F9F9@SJ0PR11MB4928.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j5RXX7vCC0xKSSVLP/NQMxAZ7AAL6Cg33j+27TEKJNOVHmY/pZGgAlD4dQ920DjmFxgcroXvplYwsw06CWhyMwXdvuEcut8rdgII5QKunxjyiUHlwXmni2HMPeWW8I2pm3uWsxoFS7Yq5PmU9N0C7ZIhKIRJ/XxnOIjm941O8TRsnPMW/FimZAPu3vHJohHjE7rSttVFk1/4Bbt5tRJA5hB9TNjHeqL0NII3b96eJ58ZGhm/pOrcnPU1UJY/TX7FvRrWlayNw7plADYQTNNTG1xWotw2Fy2p3zzJBHKoFUtFrZp1j86VACOj1sEk8aau4ky3h9TOiVuV9mBTKxiT3UwhJUq3ch/s1N/Hxn6RLuD0igwVUXkuPrRH2NkYATRlE43cF6PRNthj6USjtaom3TYnUXGQTN02yLX4rmueXCFeSD1cmMGaK+aGZfcvAAzL2fFFjhPevbmgjGlAkxRfe2Z4Kfww8wE574OyM/EkTKDQE+VIhnq+RfS5I53oA5pNmWSoshbd/4ZVBTPSFFHedNzfLPHJ/9weJb906y7dTSod3ED4Fzv2yw4WPmE65G1mlpR682Ak2LTP6adw4tNHCsx+246+hqNJzg8vQf/F27OdDucP9eGxYtZbo+iuMbT6cQEgaDFCXs20D5If+YgATDDBFxgYYBRv4rE4wFVq1EhebfcHU1lA9zAwTrdmMbxc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39830400003)(186003)(33964004)(8676002)(16526019)(16576012)(316002)(8936002)(53546011)(83380400001)(166002)(5660300002)(66574015)(31696002)(26005)(6486002)(66946007)(956004)(66556008)(66476007)(36756003)(2616005)(44832011)(2906002)(478600001)(31686004)(86362001)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OGlxWlBDem96MnU4K0RORG8rcTlPdk9DR2ZTYmt6MUlxTnB5aFFEYjFYa1R0?=
 =?utf-8?B?WTRtc25EU0JDeVcvL0RpS0pzSVdNSVZBR0Z4dG5lMkRmZ0Z2YitzSDJHQVVU?=
 =?utf-8?B?U2lWQTlKUEJPdnRZUThxY1BaVDI3bFRaNVVkU0JCVkViZHZYT0Fkem80RTFo?=
 =?utf-8?B?Q1RGZ3FaN0gxU2xYNmFjUmEzRXVqMjloaFlWYkFhclBSVmM3WitIa1NHVGRx?=
 =?utf-8?B?K08rNVdJWDlOMEM2V0dDMVh4bldrWThwaVNsRGxuYmFHeGUyNUIvdHdJZ0k3?=
 =?utf-8?B?c3VCekxubHp4cTk4UmN2QldyQzBOYlRPZUZBZUthQUt3UFo4VWZUVFNna0g3?=
 =?utf-8?B?bGZ0SmEwWGJEdUU2SGtaMFRibk5ERVhiTHpuRzB3bUNzKzVUY1RxWGFjdVFw?=
 =?utf-8?B?Mi9HNXNYUnk0NE8xSGROVlFJMmVyaDJRZDlIanlnTXNWaHBsSlRDcUJJNEdu?=
 =?utf-8?B?TmtwcW9iaDFwbGdSSUUvMEw4QVhoUUNCcE1zeEtNS3krUDlWMlNNSlpTNFJE?=
 =?utf-8?B?NWhsSWJTY3pBSVhPcnRnNFNRZ1haSXFFaVVDNzF1WFBhci9QMGx0N3Zra2Mw?=
 =?utf-8?B?MHQ5WHRLTXFSYVU1bDN5NnJRSEtVa1hKVm1XRWI5dEQ1WmZ0RWRIbEE4L0VI?=
 =?utf-8?B?Y3V3bFVubTlOOTZjS1l1ek1MTlhXQ2hDMzlvRW53elVwa3FJelVGNWx2V0ND?=
 =?utf-8?B?Y2F1MXVWdVFQWitPQVozNm1GNTgrODZnTkZVaFpOYlc5dDlKY3NvcnZBMFBn?=
 =?utf-8?B?Y2RHRGpBbWNEVUdHajRxRkhzQkNaWXlRbDlWOElsZWdhQXJGb1RVaGd2QlJz?=
 =?utf-8?B?RGo0dm9xRlAzUnM4ZjJDVDNKY2s1aWc4YWprRWsySlhldlhTNWwyRXRmQlBa?=
 =?utf-8?B?REhHbENSd2tEdG15ZSthRkRJNnFIRit1YjhxaEJZaHdVRjZ0Q05pcmgyc1Nq?=
 =?utf-8?B?eDVabVdDc0E1MTIyTnBPSFlaQ3AvT0dKK0VvQmJqeXRTL25hd3hFVHNrbTFB?=
 =?utf-8?B?SDU4OURqclo2OGZLeWtYZEIvckxURFl6RS9ObzlUY3NSeVlIMzdhSXlxajVO?=
 =?utf-8?B?ZytaWlFxVUJJOXo3TWRUSy9pcTRHQjJLdXVtSU5iZTM1RGRRUERjOXp1blpK?=
 =?utf-8?B?LzgzOU4wM3FKT2w2UmdGZWtaSGthR2ZKSlJwUmFMdW00SGIrUmszd3dMalIx?=
 =?utf-8?B?dUE4c1RaRHNUNzVXOS9aWS9wR0l0UGFvUmMyZDRBMDRaMURMYTlXd0R1WVVz?=
 =?utf-8?B?YVYwMFdNNEdKQ2NJa0dEVnVMTGQ0YmpDcUVuaW8rWDNkVDJMSTF2QUVJRm5V?=
 =?utf-8?B?UmtkZk1RbEdXTi8xNXY1N01rclBiRk15R0ZSR2ZyNzgyTk0zNWNDN1Vxcm1y?=
 =?utf-8?B?QTFpVFRnVFBNTWJKT3J1ZEhLUEtSdTZpeHdCZkZsZmE2TDNTbGZaN2E0b282?=
 =?utf-8?B?QVdFOXNMMUZaMzhDeUVQVkUvcjNRYVlGNUI3blBTV0JHZEplQXUwaTYzT3dx?=
 =?utf-8?B?eENsSlpVUWVsUStiQlhQUmtvKzB4cDBBV3dQVkJZNVlIQlNyYVd3Zktibjlz?=
 =?utf-8?B?UmNISWhDcHRrUDhQTmxnaEI1MlVpT1NFc1JsNXpQejJuczkyV0xvdlI1RmMw?=
 =?utf-8?B?SndwakxTc21BZ1pMMEJTTWNNcVlPclpITWZzQ0JVSjJvYlJ6VDB4Q2dxQkdy?=
 =?utf-8?B?Zndzc295U2d1R2hhQWkzWk00ak8wVVZQRk9HWXZjNzVQMmlWeElEY2FsUjZC?=
 =?utf-8?Q?t3UN1e7clYXTAeJV5daZcuRtDnSvT4MFaiGEtXj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bbd0d3-f4ae-4e74-8e04-08d8d8d30195
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:46:45.0372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOLk/+Q9Dwt/6MRkXQtykWcIrpQty2/bIeTCyZOp26MOEMYBbQCEGTOsflsmixWtwIOVv+MP5LYNtvRSYaU48wZgBQiLWAFTaLzCVTJmqU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
Content-Type: multipart/alternative;
 boundary="------------40EE8F2DAD326CAA25AA88F4"
Content-Language: en-US

--------------40EE8F2DAD326CAA25AA88F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.2.1:
>
> - new: callback user component function "check_config" on
>    container/router components
> - fix: support Docker images for ARM (32 bit and 64 bit)
> - fix: bake Docker multi-arch images
> - fix: PyPy3 CI
> - new: enable autobahn client unit tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-autobahn_20.12.3.bb => python3-autobahn_21.2.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-autobahn_20.12.3.bb => python3-autobahn_21.2.1.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
> rename to meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
> index 90958dff53..3af81d1dab 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>
> -SRC_URI[md5sum] = "0a465e218d904f63537092b155489468"
> -SRC_URI[sha256sum] = "410a93e0e29882c8b5d5ab05d220b07609b886ef5f23c0b8d39153254ffd6895"
> +SRC_URI[sha256sum] = "7e6b1bf95196b733978bab2d54a7ab8899c16ce11be369dc58422c07b7eea726"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------40EE8F2DAD326CAA25AA88F4
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
    <blockquote type="cite" cite="mid:20210223152219.32129-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.2.1:

- new: callback user component function &quot;check_config&quot; on
  container/router components
- fix: support Docker images for ARM (32 bit and 64 bit)
- fix: bake Docker multi-arch images
- fix: PyPy3 CI
- new: enable autobahn client unit tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-autobahn_20.12.3.bb =&gt; python3-autobahn_21.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.12.3.bb =&gt; python3-autobahn_21.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
index 90958dff53..3af81d1dab 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://crossbar.io/autobahn">&quot;http://crossbar.io/autobahn&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>

-SRC_URI[md5sum] = &quot;0a465e218d904f63537092b155489468&quot;
-SRC_URI[sha256sum] = &quot;410a93e0e29882c8b5d5ab05d220b07609b886ef5f23c0b8d39153254ffd6895&quot;
+SRC_URI[sha256sum] = &quot;7e6b1bf95196b733978bab2d54a7ab8899c16ce11be369dc58422c07b7eea726&quot;

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

--------------40EE8F2DAD326CAA25AA88F4--
