Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.47])
 by mx.groups.io with SMTP id smtpd.web09.11437.1610468155233171252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pPhAxyzs;
 spf=pass (domain: windriver.com, ip: 40.107.220.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tgq91cYx6RGiEmfUpfo7/NHTaWIl/4n/5MyMvPj+V0pFhKHB+mLBZ7FdcB4vrBRv4D3cludBqdksBC3ktMxxupaU/gcVNQ/GxjaVrKDxBOCuVpbhOXvO9ahbJ1H7ZvjcWfz1orIOPwwuXbPujjsObKD8slwgjHmiy4TrbqkWI1fSJQ/EQaTnjd2HttlUSQo37F95XnU1G0Xni6FOEwP1QT0AoosptNdz98HBJE4Tz7+RjuXvpWVXEDucTRalXnaYc6qNIlfQQ+rmD8DjzoLaAMgBY/8+aeh1yo7MBlnsSkiMhN/BtqlvphNBUP9wWOfxKWYT8igCObZueMWjUdiu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ93APIkoh267cKYxLePP38eyLKbVsUlze8v0N/agJQ=;
 b=nOYBADxqcVaD6WPVCqK3A4vad+x8ytTqxzduAf6gQoZxMkbPYF0nsqQQjl4PyrzrClEoVQQ7wS9LFRsGx/UZJuA3NNhStNKvipWb/PJEt8yL9uEjFa0EMcnvKp7BiViFTVpiilwxD9dNN8WCvlZgkYxD9M4YOpf4XGNuUL60EEk2ttzv0kXM+U4oUmLI3+Fssy0C5pATKyXROIX5+vHinPAJGksZQZ/htZg8AK+o+0LHUPedqvGP87RWPkNZiAcfWyD6yPm1kcMQTj+IyLZYlZEUGPZMxT1WtIF1fzwB6AgRBxeWcEUIy6psCXKZjI6o4hmeQNeDD+LkukhDK2N7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ93APIkoh267cKYxLePP38eyLKbVsUlze8v0N/agJQ=;
 b=pPhAxyzsT5jhH5ATz97a/frpk7HLqu4/TDkugiLHV3FzVsJ2YhZXDWGp0VOeJVUQGKFZYzRwXZNlhyH42wr+ts8Jaxj15uMJ0P41KkLuy7e1XPs5AImsYPgRlhqUDcreGwAFDzE/UdyY5Z/inDANYAaQdfi8Ux6Vjmj38yF9xa8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10; Tue, 12 Jan
 2021 16:15:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:15:54 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-jedi: Upgrade 0.17.2 -> 0.18.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7255ebad-54fc-eefc-62cc-8e29d5067e1f@windriver.com>
Date: Tue, 12 Jan 2021 11:15:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:208:c0::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:208:c0::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:15:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30468abb-ae61-4145-b918-08d8b7155649
X-MS-TrafficTypeDiagnostic: BYAPR11MB3719:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3719E07CC35813477E48AB039FAA0@BYAPR11MB3719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nVDob0RwlUqgQDoSqVad92SyHu+V+M6bsf2L37MaQPKwHftE8PPh5msRg8Wkzzz9Bk8ycNQSFZJYUyZq3+w+vYbCVHWF2/Ht3/UqloO0pGFnZfibe62bfjcly6Bgav80XAvWhMME7+3LdMUhI5GI1hn+VwFTFD7KiW+uRymc2MzgsPvkUh2TN613qLbiAjdDhIEVcCccWIn7t3h4JRhn4cY5784ecriEKLB2OLi2WFOgvst6NgDLsBI46T2a9tN5tqv6VD9NEzI1o9R1neLvYjGLf9lc/vQuAgTGD1AOM3r8u2Prf3Ot61uk1c0qBknkeSV9satTv4E1YTIwz8MOILnxDxdAA1GQIprL6VlxHVt0D+73dKRHC8uQ9qyiMfjlt0j6N1DPZDn7NdIC9Z8g/Nt+KSxL0tZfp3g8UMIb43U5ewaKxbx/6jg9ALKvh7CWBQf1g5ADzP6TpC+8+VAV2i4uAiw2gVOzrubGjR3Wdl3LuBCHasDmtqsOWzBNs+foS/kzG4WtwHEDDgNzfTdrZlKWBZ9Lq5VL26f5zqtEIyEWDbil8/mBPR0MIAjez6Ks
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(31696002)(26005)(2906002)(316002)(8676002)(6486002)(66476007)(16576012)(83380400001)(52116002)(44832011)(966005)(478600001)(53546011)(166002)(8936002)(36756003)(86362001)(16526019)(33964004)(66946007)(5660300002)(31686004)(186003)(2616005)(66556008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?U3FKZlBRVlovamYyWWNZVXY5dlpMbUVpUFgzZGQ5SE0rWWlVeCsyVjdJNnoy?=
 =?utf-8?B?Skc1ejUwdmwyL3NrUTYrbUs3Vmt1RnBtVS80eEdoSkJsUGt4a1RTMTg3VDZT?=
 =?utf-8?B?QU5zcGk3UFMxRkFVZVFYYStvUU5td2g3ZGlUUXRaaks2bEt5NGlRTjBXSlBB?=
 =?utf-8?B?Z1d0T0NDWmZJZ1R3Sml6RnNOTFlYL0NmUnlOOXZ1SW0zaTVCSDZSMUQwZ1dO?=
 =?utf-8?B?eVoxMkhVWUNJYWtpdmZBKzFNZlBhNWhKb2ZKTlMwVGViWTZwY3V1Q2M2bThl?=
 =?utf-8?B?TnFZazJXcEpqWWt1MWk0UndkWUNiL1dyQnpMTFozRVdBemExSnVQeGxSNWRD?=
 =?utf-8?B?czc4SmxWd1RaMFhBbnhjdHJmdmdjUWRKVENCY09JL21RMGt6eFptTTVlNkxZ?=
 =?utf-8?B?RkhwZWx3VnpmTCttVHFzRjJuYm1TbkNHbXB5ajNsTUwxR2lIWlFMRittTkMz?=
 =?utf-8?B?RjhuamRsMzI4d1lpYVhtQlQ3M0kzY1Y5NlFoMzdhQkEvck9YdkNTR2FFOFZS?=
 =?utf-8?B?dzlwZWtWU2RjMk9xWmkrOW00c2p6cFlKZ1BTcXVOeDF0S3ZoYVlML09NQ3dZ?=
 =?utf-8?B?VlM2NDZHNDFzd1YxUWQ4TjJJYm1FZ05KK3NqL1JoMzFlaEJPb0I5d1dvQWFx?=
 =?utf-8?B?c0ROVmlPcEVnelFXQ0kwMVVJMTBVQUxKSnZjUk8wSG5PSUtyS0hNQ3ZNcS90?=
 =?utf-8?B?cHBuNE9vTm11U3ByK1F3YU0ycWlOMEc3b0gwOXc4N1U2dDhpaWFHeXg2ajYy?=
 =?utf-8?B?aXA0MGtJMTZUZEVPQi9wVnN6cndFTStrcXEwOWRXeWVWSDFIOVdxSEtoMFZB?=
 =?utf-8?B?bTg5d2dYNDdlbk51UUlpb2V4SjFmTGJiZllTRHVSZE1UQXJ3S1ZNMlJvaFJH?=
 =?utf-8?B?a0ZpZzRBLy9tUmVjVDRBb1dUZnFoZFo4SHdNamtGUnN1Sm9sYStDNXNRT0Yw?=
 =?utf-8?B?cjRSVEhNOU9LOWszcDJ0aDlTcG5Ud0I2RzFEdmduMkhiRlBpcnEzbzFUZ3NO?=
 =?utf-8?B?UkJUVmRhbFc1Z2FOak1hOWtidDZmOTNiakRJaks1cHFEdGtpTk93VkZJTTAw?=
 =?utf-8?B?VWxNaGcrK2VOVUZVb0VVWDFKamRRSTRIWVpTWlh5NTV4TlY0NnNGdXgwVXl1?=
 =?utf-8?B?ZmRNeGVWc0p3aGQ0NmozZ3Y4N2Ivek93azMySjUyeC9JelR0UUhTMlVaZmhl?=
 =?utf-8?B?d1RDQkwyZGhEaFlHR3ZMc3pLeGg2cjR4dXhDSGdabG01OVdaT0l1RnZjOG1O?=
 =?utf-8?B?Ky9EVG9NOCtYN1JsZStoeW4weE16QWdBMlY2eFEyV3V0bkxFNHEwcGJWVjJy?=
 =?utf-8?Q?2F6zRSxA912B45AcPL4+88WKWEMbH7/sNV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:15:54.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 30468abb-ae61-4145-b918-08d8b7155649
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kKTklczD/JmLRAbwO+5iPqGO9EVS+2euI3v0wr2eK2hT2ScCzeWiMeECJfiQkxOmG709KG9757siwLj99Bc/RvmfKStcQki3+1ECLMnSeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Content-Type: multipart/alternative;
 boundary="------------F8E3962740E05A4DF5342842"
Content-Language: en-US

--------------F8E3962740E05A4DF5342842
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Dropped Python 2 and Python 3.5
> - Using pathlib.Path() as an output instead of str in most places:
>    - Project.path - Script.path - Definition.module_path
>    - Refactoring.get_renames - Refactoring.get_changed_files
> - Functions with @property now return property instead of function
>    in Name().type
> - Started using annotations
> - Better support for the walrus operator
> - Project attributes are now read accessible
> - Removed all deprecations
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-jedi_0.17.2.bb => python3-jedi_0.18.0.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-jedi_0.17.2.bb => python3-jedi_0.18.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
> rename to meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
> index aa5e69874..6c857f09e 100644
> --- a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
>   
>   PYPI_PACKAGE = "jedi"
>   
> -SRC_URI[md5sum] = "f012668907d76cebe9c4766f3b806fcf"
> -SRC_URI[sha256sum] = "86ed7d9b750603e4ba582ea8edc678657fb4007894a12bcf6f4bb97892f31d20"
> +SRC_URI[sha256sum] = "92550a404bad8afed881a137ec9a461fed49eca661414be45059329614ed0707"
>   
>   RDEPENDS_${PN} = "${PYTHON_PN}-parso"
>   
>
> 
>

--------------F8E3962740E05A4DF5342842
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Dropped Python 2 and Python 3.5
- Using pathlib.Path() as an output instead of str in most places:
  - Project.path - Script.path - Definition.module_path
  - Refactoring.get_renames - Refactoring.get_changed_files
- Functions with @property now return property instead of function
  in Name().type
- Started using annotations
- Better support for the walrus operator
- Project attributes are now read accessible
- Removed all deprecations

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-jedi_0.17.2.bb =&gt; python3-jedi_0.18.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.17.2.bb =&gt; python3-jedi_0.18.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
index aa5e69874..6c857f09e 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4">&quot;file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4&quot;</a>
 
 PYPI_PACKAGE = &quot;jedi&quot;
 
-SRC_URI[md5sum] = &quot;f012668907d76cebe9c4766f3b806fcf&quot;
-SRC_URI[sha256sum] = &quot;86ed7d9b750603e4ba582ea8edc678657fb4007894a12bcf6f4bb97892f31d20&quot;
+SRC_URI[sha256sum] = &quot;92550a404bad8afed881a137ec9a461fed49eca661414be45059329614ed0707&quot;
 
 RDEPENDS_${PN} = &quot;${PYTHON_PN}-parso&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F8E3962740E05A4DF5342842--
