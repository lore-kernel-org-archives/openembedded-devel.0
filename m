Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.85])
 by mx.groups.io with SMTP id smtpd.web11.8433.1612533811108496151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kux9VSk1;
 spf=pass (domain: windriver.com, ip: 40.107.75.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwpZh7EpkBnO4fSIYGHqsFsUXFCc63PIjMEZLfRPYmF1fcTg6gYepxXPPYGoMSW8s5fZn/R616FrBa1x7z2/dAfHBpwkruX9al0TxZQmDHMOg+JRZyuPZRsyKtubZoOpg//jNxJmHV75Y/2JjPJuuBQkY25HUydczfT+Gir4qbbPPO5iw84t/USpOZyXRiClzwekz/Sq1mT5gyFPRl2KPhNxQv1wFtldgykVhFjcYhQXm6zKZSjXbChSLwvJZxMeRKsitawastNSwW/2Qozgs5s8FO6nsQvSnMDkUUmjVgC5z8dNadz/Meh0IsrGF2PyFDkxMEhk3L1Xjzq3KYHz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NELchAv0Ic66A3iO4wOUe90yr5l4LRz9PblXg4l4zAg=;
 b=kvKgW41ASxYQtCBubHkSdl7kTeXFFUr85X4/T9GZomgO0M7oV+Kljs+Yr5bUt7YowIQBIKaVh/akG55vMV7XI+g9wO75dpIuRfr5QqHnwEmtqwEn92rKXB127VqXDbh9fIcXP0xGxrciRUAGu88jw3DLY98OQ2MxN+JVgJ87xWo4va7iPfSm+nIdfK2tTu9jk8sgJDifbA3y77wVOH7fPU3wAVRNdVza27U0/OxcR4t68xc0bzXa0aJlK5YTxZOlVl3GQc4/E21DgzbbVZ5xjwhP0r5+8Sp8E1waajHvayon0G2NVB8kSDLDt2WI5iXyF/K36F8VK3iS5ZtCKCI/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NELchAv0Ic66A3iO4wOUe90yr5l4LRz9PblXg4l4zAg=;
 b=kux9VSk1sB+3j8+W2jHURF7MkDS9BQT+L0GzVM/201pZpA/zp0CIH1QCy8+PUYeeDo5leRPsQpdiyw2FdlvaGUUVFsJ7MelynTKBUgfpjeLZcKQ+T/xhjWoYR0VpqcFgtjfVz2f0SloVXvyaiNc5szGPWs7neYaPYu2pfbVi/qM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:03:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:03:29 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-graphviz: Upgrade 0.14.2 -> 0.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7a0ce463-f0fe-78cd-0ded-8ec2c20d0843@windriver.com>
Date: Fri, 5 Feb 2021 09:03:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203153822.25077-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0556.namprd03.prod.outlook.com
 (2603:10b6:408:138::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0556.namprd03.prod.outlook.com (2603:10b6:408:138::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23 via Frontend Transport; Fri, 5 Feb 2021 14:03:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25c921c9-3c52-4e39-7e50-08d8c9ded0cf
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48308D6EFF0F37297AD27CFA9FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+xJhDix19EqAy9zOcRObvE2wMtqAbCw6NKVB3n6bqK/s/ieOb3WJ3QEJbTwccOo6nVINq1KUZOAvS7FoNLT5+JlidZ/TkMlnr4DGFVsgo7u3alQrwvAxYizRX9t4EzrPlvReq3fip7Go3crfFCWhmx+Gn0xm5CqSZ3SZRTJDv9YEq7qIEDsZsvdn6Pc+kyb0N27GSV7Vdkup4hOObUS6gS5Hdd3aVB4mIhzV+zB5b76p87EokOMPD06yAAXfYKE8w4U0f5Vpgpq7mOtpDFEO+S1FHXMnHT45DsJbDJYXSVRJ35BAvLPMamHL95s2nHtf3kIkpOD1PJjlvOa8iWByniwzKrFFK1+gbwiAFwC08XAg0+tGXoBnUrfQifT+jyDusLF7rO4isCd5Qn6JlxGumNv705qxWMYE0SsDJFP1GJWcabn0ybeGExVrdLB5eqm3fDUHOSXtBk3eat5tkAvyK4rmPlOjfsftmTFnQD+tsb8A4JOaXzro6O9WvthxOfZqzx4l8fK5ndka5L4VpP1YGZobB4vz/E8v470qr5sEAe6QH918CeD01S5WP3FAJhpKeD+QjaGrJFbdK9cQzGqsS99TbX9fRdUOJbvBqz0TWuyn1OOHP3P2rpijhVFy2IlWrcRGOkZssciJD1AMq8r/m/PEwgrczROrfQffo/jnubpoOvJtieNZsoAQLYGIf/uC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(83380400001)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VC9MZHV6U3NTRVUwK2c2RlVaMFgrY2ZGMjNJa2g2SVVqODBRK0xEdWRnd3cr?=
 =?utf-8?B?UFovQ3d6NnBNVjZVMHJsdnpRSlZzYWJVamN3NVBxVGt0alJHRFZNbEJSTWY5?=
 =?utf-8?B?Skw5Z2owK0FTR0ozMGZiUEJmVWJyV3VHd3l5WVhVYU1mc0M0M1lXTnRDNlFR?=
 =?utf-8?B?bzA3ZHUxQzMzRmdpYm5HYi9sY3VhYldyT2liSFJPcVpER2pVMWs0dDVFanJi?=
 =?utf-8?B?bEQrWTR0VGVwOUw5YS9DZXM0N2s3NjVBSGhVZG5Da2c2NUNxV2xjOTl3RlAv?=
 =?utf-8?B?cWNrSjZweGFZMzJVcUs4Y0dyd0hiT0dUM3Uyc2E0OENvL3BhVnhmbVp5RTFZ?=
 =?utf-8?B?WjIrOUJqbUJvR3RDMmdQc1hBc1NrZXZVdmlYYkY3OTd4VS9EVWVxVnAwdHU5?=
 =?utf-8?B?U3hoWGJ0UGRBd2hiNzYrSitpTnpMNWxtRDFCeVJhNVJ3SlJ2bmUvTTA5MUs1?=
 =?utf-8?B?NnVMWWN5RVJ4NFZvSXNHRDJYQVlGYmxxbVpBOG0vSE5UYUJrbThkakswbENW?=
 =?utf-8?B?SEdvVWtUa3VtdlVPMWV0VVU1YmFxMi9MS05QZmJEUVpkMmtpTEZrbVNrck4x?=
 =?utf-8?B?RThRei9kUTR0QUxvamgxa01Ra1U1Szl6Q05RQVpVYlM3NndON05YSE4rTGN6?=
 =?utf-8?B?ZW0yVVB5WWdQQVR5Y2NxL0hzVWlUQzdCOTEwaEtzU2ZkYlFCSVRBMC9pY2pV?=
 =?utf-8?B?d2pnckdRYnBrYWcydVFtL0FJZG5mSUFZZ3F0bFVvb2RKUGhaZ09JcnVyZDVD?=
 =?utf-8?B?WnRiOWt5WkorYVRiUG5aMTFjQnU1Y2RYT1JYdW0rTWFEcDI3UUliT1RCcUtS?=
 =?utf-8?B?enA1TDY0SEhOc2FEMzdtTTZVUUVsdEtOT3dvUGROclBDTWtFRnBENnBDMEdM?=
 =?utf-8?B?NUIyUmU3ZUFWMU9EUVNUVmxPRnd6dHlKbTNodEgyUTU2bS9xRUxLby9sVk1z?=
 =?utf-8?B?STdNcytEV21CMHNQai9nRVVweWxMSjNINHdFS2pxb0hJUTJuNllYZWhNb3I4?=
 =?utf-8?B?STd6TUQ1dFVnelVvcHZkMFd1VkZ4KzVVZ21GNStoRHp2cWJWS3hQS0gwQjdo?=
 =?utf-8?B?NzlnT3ROUFpueU5uUFJDSnhRMk1hR2ZwblZzVTlIeUR0b3RndDFneFNNamZT?=
 =?utf-8?B?eXZqd29wYUxIZ1BTdFlEY3hzWVhhMFhlTC9YU2dMR0Q1U21VSWgvSEM4NWhu?=
 =?utf-8?B?WlFKbHlkMk96MGIwU3dsTDl3MjJTbE9LZmFIbkxzNnN0QjNJbVJTMGptMll5?=
 =?utf-8?B?R003NkRFV3hNZTN2aStNd1lHNHg3U2ZNVHZXNzM5WUNyVThTVTEyV0JBbVA2?=
 =?utf-8?B?OHovbTh4TnpCSDVGUjRFc2E2TnY4QTNoMTdQbkNEZFpXSG5hV00zQUllWThQ?=
 =?utf-8?B?UWY2R2tlMlRGbkpKZytyd2htWUVQc3crREpQYWNWQ1RPSUY3TGh3Z2t3WGFx?=
 =?utf-8?B?NVp0VnVWNCt3VlZnQklHQTV4bWhpQnNTbWdBUWpkN2srRUtoR3JWRDJIUnAw?=
 =?utf-8?B?VDZCeTc1U05hbXQwSFB6cTU5VmlBdFQzV3FHZkMxL3daVlA5UUJJUkpFR2Rn?=
 =?utf-8?B?ZGR3T2gyZVlnZzVqQ01SWW5qMjhNYXVDWis2WFBOK1pGaGdJRTBwYlpGcGdG?=
 =?utf-8?B?Q1E1SWU3NitPcVlDeW53UlV1Kzh1aEtKdEU3NTZOTXBlZ1VMTlFsSE83TGpX?=
 =?utf-8?B?ZFYwNzZ6MGZNTndwTW4xN2JpcmZvTG1KMnRnaEhmM0l0UFpBU09wcHI2d2Zm?=
 =?utf-8?Q?66r6xMrXK8vVDSG8Oty7Y77U7PK6uQb/MoIllao?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c921c9-3c52-4e39-7e50-08d8c9ded0cf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:03:29.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztMSEfz48giQGwefu0tXr98ZGRz+w5nO3/lJcGEIh4uQfOo9y6VoguvHIj2HOnd1TFXwRDD84WAc5+2kjbL55dqbYOSDa6aJA4w+Y3BDCVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------82361722D248F0ED8CF508C5"
Content-Language: en-US

--------------82361722D248F0ED8CF508C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-03 10:38 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.16:
>
> - Add ``.unflatten()`` method to ``Graph``, ``Digraph``, and
>    ``Source``. Add standalone ``unflatten()``.
> - Make ``Source.__str__()`` return the ``.source`` instead of the
>    ``repr()`` (like ``Graph`` and ``Digraph``).
> - Render with ``dot -K<engine> ...`` instead of ``<engine> ...``
>    internally.
> - Add documentation hint to archived upstream version for Windows.
> - Re-render most documentation graphs with Graphviz 2.44.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-graphviz_0.14.2.bb => python3-graphviz_0.16.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-graphviz_0.14.2.bb => python3-graphviz_0.16.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
> rename to meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
> index 0de4c8f40..1af657098 100644
> --- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
>
> -SRC_URI[md5sum] = "7123efabb68270f579525df74bf8b0c9"
> -SRC_URI[sha256sum] = "92b7637ece63c77e3d39221ae1f4df98e9256cb449e9860c598335b34496d195"
> +SRC_URI[sha256sum] = "d2d25af1c199cad567ce4806f0449cb74eb30cf451fd7597251e1da099ac6e57"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------82361722D248F0ED8CF508C5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-03 10:38 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210203153822.25077-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.16:

- Add ``.unflatten()`` method to ``Graph``, ``Digraph``, and
  ``Source``. Add standalone ``unflatten()``.
- Make ``Source.__str__()`` return the ``.source`` instead of the
  ``repr()`` (like ``Graph`` and ``Digraph``).
- Render with ``dot -K&lt;engine&gt; ...`` instead of ``&lt;engine&gt; ...``
  internally.
- Add documentation hint to archived upstream version for Windows.
- Re-render most documentation graphs with Graphviz 2.44.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210203153822.25077-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-graphviz_0.14.2.bb =&gt; python3-graphviz_0.16.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.14.2.bb =&gt; python3-graphviz_0.16.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
index 0de4c8f40..1af657098 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://graphviz.readthedocs.io/en/stable/">&quot;https://graphviz.readthedocs.io/en/stable/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f">&quot;file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f&quot;</a>

-SRC_URI[md5sum] = &quot;7123efabb68270f579525df74bf8b0c9&quot;
-SRC_URI[sha256sum] = &quot;92b7637ece63c77e3d39221ae1f4df98e9256cb449e9860c598335b34496d195&quot;
+SRC_URI[sha256sum] = &quot;d2d25af1c199cad567ce4806f0449cb74eb30cf451fd7597251e1da099ac6e57&quot;

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

--------------82361722D248F0ED8CF508C5--
