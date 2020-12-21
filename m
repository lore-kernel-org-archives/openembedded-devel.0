Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.80])
 by mx.groups.io with SMTP id smtpd.web10.2912.1608571060424194185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E2GIuFjV;
 spf=pass (domain: windriver.com, ip: 40.107.244.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5b0HmX+0Chx+N/A2V7Tq/GmhHUbpucXgC+I4BMiEC26U9PdBpvFl0BZQdVjH1MorPcVbP/mryDq+CiC2EZ8n6CUXYbW9jf4q7F4xqBqO8aFTJ6YuH0f4nsY/4zji5DJROY5kLfYtJYlsQObEljErzHDfkYt2w6zp5kNHutBLESUy3d9sUH32fiK5ASc3c1glAsJ2PiCm8i3Ge+STRwQ6nh4p7AS2QPb7EF4PBCVWr1vDXRUMZWOO+9P1V2d82fexs/o1HUC0nf2RGNBKEGK48fTnDU5Xk/OHp9w829SU8nkqSoinxZbZSPDPj/u2pbS+7DUfKXAaIaGaCKIGdIq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aa/nx0pvPf+zI0KmPIVRLn7SjyA8sWweg6ww8L0lZ0=;
 b=DekzSY5MvwqXGccOo+94PUU1VDdVhY5RFWGBSXwyXdg0bmKylvLMMcjsPlHCVYxIF8C4Qt64rn2XNfy4Ar/9BIc18fk9D6QzC9da+CGe4vXg7X9yxh1+xsngh+itsw460Z/sgfNfVxYmL1sPMKun09Rak2whEiVsM+Bnlc+OSsPfF2eLBEzM+dBupomJzfIdEolY7M2Auytoquqy4pbAzdKlxUTkj8dl0vmo9HaD6YVG00lHofALERH/QFQZy+pxa4RrSLu/UKOvq1dFKy1IG7V90HJj9MC2dflRfvIJ7xZc9UNhZwRtF9uoghqfY+sztSEwQAuAhKrxDqEnDRQPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aa/nx0pvPf+zI0KmPIVRLn7SjyA8sWweg6ww8L0lZ0=;
 b=E2GIuFjVFdpzHlVaDtHg2deYLn2r3uEQvAs30pfrByY3zmMo6KjjlK2SxmeJ16HaHfs2V6t43FxIdx3pfLxsymUIvJsBOsNWJV++GUW+hJf9vFARgnkxAwtLr+JlDuIVCioVIcuOCksxFmWX3oSWNIyZKH6XPsvkRjetaCfZLeE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Mon, 21 Dec
 2020 17:17:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.033; Mon, 21 Dec 2020
 17:17:37 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-humanize: Upgrade 3.1.0 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
 <20201218214748.14563-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5f75ecbe-4ea0-5cbf-3c59-78f37f70acd8@windriver.com>
Date: Mon, 21 Dec 2020 12:17:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201218214748.14563-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0010.namprd16.prod.outlook.com
 (2603:10b6:208:134::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0010.namprd16.prod.outlook.com (2603:10b6:208:134::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 17:17:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd8a11d-5a40-4f33-07b2-08d8a5d450b4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4782:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4782629A1C767BC74DA82A979FC00@SJ0PR11MB4782.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6uafl9y6f55Jx8F87IEXQw2fOK7v2JMcWn7VV+bVGvA+xlploMraHTHV5VmoPnMk5vfLggEmC1lUGYkPEQL05w7VfNkfGnz/7I69PTD+k/BqZYap6H4ktSOR382KSWHUrcksFJ1NmlgnsLYvra/wOdMGf+ajc27DsDUTEDXPpOkJXSBGH14BbqsnA+knGgvmSznZMaU5I1KEzs1fZduztB70Z7J2GEpVavo6xtTQWAYHUMlY7Stb8Q7ELyxs0UiOtrfNW6zg2uQ25hDopK/7pNv1ljrQLu1A/EDeUOGgDinka7AEk5z60fe0t2u9HVqw7IDaZhQMoKdYQWGCxT/qHw11UPZbtu3CkZNaPSwzpE8NtzYx9mfmxJpYdv416URNm/KK7WX5mTL5XC5va5q1vNpSY2JPoNFNiJU1R1vfc4ZxvcvChwS0G+nNSAiZSP16zKUck39rdrL0Mx3pqHjT4/XLSUSuNwNqMcbwRA+th9wGfsyyjYLMOOxlDGGHOdYMfXmbJ4gpdZvFviqANbATjpj9N8Iyp13+ZPDEzJe6ypbmPaUdtLroYgbCm2F3GtnqrGrH+o9PAwL3STK38OiohA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(2616005)(6486002)(956004)(52116002)(53546011)(16576012)(4001150100001)(316002)(5660300002)(8676002)(44832011)(186003)(83380400001)(16526019)(31686004)(8936002)(26005)(19273905006)(478600001)(33964004)(966005)(31696002)(66946007)(66476007)(86362001)(36756003)(166002)(2906002)(66556008)(43740500002)(45980500001)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aENza3BSMHVFaFNOL0tVWFNuQmRDT2x3aEtoZFZOK2xndEhtaU1zN1BralY4?=
 =?utf-8?B?dE9iL1BBQ1JzMUNhaWhKSnBYcEhSdVNYTFB2dWkrMU94Q2ppcmlMR3FEeUNh?=
 =?utf-8?B?ZmVobnpCaytyL1F0MWMwaS9VdWVFQTJrWjlocUk4RUkxa0lMdktYc2J6d1lS?=
 =?utf-8?B?RmE4cndid1N2eTIwdURyVkFNMXFZQWcvUTk3dHE3UkcyOUphSzZrN2NVK2NB?=
 =?utf-8?B?a0J6N1ZnSmExT2EycWVVWUNxdUxNYm9PeE9HZXVGYXdieXVIdGlhSUcvMGxk?=
 =?utf-8?B?VGNuc3RuU0t1bmtuUW8zdy96ZzlSTzhSVnpMcEEwM2xLMEQrVnlET01vOHBQ?=
 =?utf-8?B?TThBVDE2TkZQVkh5bTh6TFMyVmNzY0lWVmd1Zy9pMkdUOGZaZGFBTWVuS1F5?=
 =?utf-8?B?enBNYnJqakVQbHpETEFKamZZSDBhby9MQWxDUStUTWVkbVB3U0dhanNzbnFE?=
 =?utf-8?B?VlFXaDdXNXA2MVlvUmxLSkVwN2ZZN3ZaTkk0RCt0blQyM3RYdHBwSUNqZlg2?=
 =?utf-8?B?cTBLS1o1WVR2MWFZSDhFOS96MmdpNXNHaHN0enppaDh2R05xOW9WbVY3RjhB?=
 =?utf-8?B?dU5FNmNjSHZFaHFxYitLRDYvVmRXUVdyVTYwVmJZMjFWbFQ3V2pRaWE1bWFG?=
 =?utf-8?B?aU5LaTZNM295a1hzYitzd1FpY0JxSE8wOHAydmQ2SnZPV0E5Y0R0bjNMYS9O?=
 =?utf-8?B?Q0FudUNOQnAzUlV5UEo5T0x4eDNDUzJkdzJiV2t6WDRORDhtSmhGeDNJa3Q2?=
 =?utf-8?B?dWdvWk5STm1zQ2lKSkZsdTNpQ0F0bGVwNExQMVhnaEJQL2FnckJYcE5JeG1l?=
 =?utf-8?B?Wm00eDV4WThvWTRXVGI4RlkvWXlxUHR2REJjdy9HcmFiWGQ0YzNtNUxhK0c2?=
 =?utf-8?B?YzVvUWZoR1hPSnZaSFRXMHdhYnJnL1lJQzY2cnVjTFBQbURPZGdiN012OGJB?=
 =?utf-8?B?ODVySFBGeEdjSnlhSU9oanRIcWFPUnZXcW9VejBuSUtEc1NkdlNMMUlDSDdG?=
 =?utf-8?B?RVVZKzh6R1IyQkdHZGxydWhueDB5Mitpa3VHc0k3eG1STTRuVXpOZVkrNDhj?=
 =?utf-8?B?MHJyUDlGYXl2SHJtNHBlSlU4THl6YmJHcndYVUZLUHVuZHI1d0ZUaWVxMk5G?=
 =?utf-8?B?Vnowdlp2RHhtWXRRT1B1L0RpczMrWWxvTXNWOUx3VllJL1Nta3NnZEo5czhO?=
 =?utf-8?B?NVQ4SE1qU2swemsyeUxCVzNkQ1JBSG5JM3RpSWNqcUtYdEx4d3pDOVNJcTlh?=
 =?utf-8?B?MUllS3pBU0QrWkx1UVM2bUhnYXVXRTM5TWNJU1ZWbFJPNk1JWkJsOEpxeTY2?=
 =?utf-8?Q?SfzyDqa+Bp5BFtD0ZEhbFPUyFp1S1KlumY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 17:17:37.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd8a11d-5a40-4f33-07b2-08d8a5d450b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twYxkBmhGob3Mlu9ltbjMPjbi04dXS5XCTx9ktAVyl52Qd8RREfPVXqtTE6GuVh5Hj4CjXg948LMsqLErF8dEEkcwFQGX8mvz3OkMGRnMQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
Content-Type: multipart/alternative;
 boundary="------------33AE250B141A15B6A365BC89"
Content-Language: en-US

--------------33AE250B141A15B6A365BC89
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-18 4:47 p.m., Leon Anavi wrote:
> - Internationalise intcomma and add fr_FR
> - Apply setup-py-upgrade
> - Test Python 3.9 final on Travis CI
> - Fix grammar mistake in the Dutch translations
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_3.1.0.bb => python3-humanize_3.2.0.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_3.1.0.bb => python3-humanize_3.2.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
> index 43b882cb84..646e20f7d8 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "bde0a033cf200f2874e6e3fc860bed48"
> -SRC_URI[sha256sum] = "fd3eb915310335c63a54d4507289ecc7b3a7454cd2c22ac5086d061a3cbfd592"
> +SRC_URI[sha256sum] = "ab69004895689951b79f2ae4fdd6b8127ff0c180aff107856d5d98119a33f026"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------33AE250B141A15B6A365BC89
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-18 4:47 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201218214748.14563-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Internationalise intcomma and add fr_FR
- Apply setup-py-upgrade
- Test Python 3.9 final on Travis CI
- Fix grammar mistake in the Dutch translations

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201218214748.14563-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_3.1.0.bb =&gt; python3-humanize_3.2.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.1.0.bb =&gt; python3-humanize_3.2.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
index 43b882cb84..646e20f7d8 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;bde0a033cf200f2874e6e3fc860bed48&quot;
-SRC_URI[sha256sum] = &quot;fd3eb915310335c63a54d4507289ecc7b3a7454cd2c22ac5086d061a3cbfd592&quot;
+SRC_URI[sha256sum] = &quot;ab69004895689951b79f2ae4fdd6b8127ff0c180aff107856d5d98119a33f026&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------33AE250B141A15B6A365BC89--
