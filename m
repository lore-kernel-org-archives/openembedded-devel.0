Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.50])
 by mx.groups.io with SMTP id smtpd.web08.2905.1608571029294968115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lW5XKDmT;
 spf=pass (domain: windriver.com, ip: 40.107.68.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cduz5Fw6Ojf8sQLxIBza+oDQFKtX5+BLfHAOHUK6L4ccClqBJOP4NoIz2h3aKmPS1FmQeXQ+/yORHmjM+A+GgtXs+jjeBkRgxhMQTe9SWW6nGFNC97m59vhI0QjOmXDdVhMDU24+5kbv3c3MJJY0nJTd+F1g3Pc7/H6e380373mPr3Melp2ktIesmWRJiReZAAXSpcr3W931yviPMurGX0RsO0QAUdFHnNzwZhDB7bwX5Lr1jE90esP1LcnFupjNhsu01KawLcFSnQ12ylyVmr+lH8vVxemE65k5Qc4n0vrvJT/x2mtjoJeR2VC7TJTk3QPW31G+UwlXwadLsI9M0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFRAAEf6WnQcqez3hBXUnbXoCMokayQ5gHt5sjnBkG8=;
 b=TlLT3CkaaHewJ1Fa39r5hKrlaEcS6ANWz1dU0fSJ9leZm4yh3+oycF4TUcCH6PltHbOE4HJJZ7txfgOonwrq/M0h6rGOupCXdDgjQbXztREghzSg45TPzs593w8B21tgm/A/DmbYG+NcpoOBDTU0KP2FPG6+RdoOhQpPBE1UwcJylRTGdt/kNglaxkrORIbP+YwEWak/9wKnlBzDY9qc2joR5kLuR7iaGqUWAn6LFWP9E+xFC/AAE1xrmoElQ8LUReSgRIAV4g7og99ca7alH8QfDLK378P4yAfF2/AJ2xettyA31bpu3ckoA9/BdDhzA386jmfTpmFVIQt5myrBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFRAAEf6WnQcqez3hBXUnbXoCMokayQ5gHt5sjnBkG8=;
 b=lW5XKDmTGNynp0rcx6pjTn7eS1JrVryqT5D9UwAurORVTi9P4wOJe2ZiLdXsZ0p4QzMzofDL8gfCeF1GyMh/ngyfwgt6zYCmcUSVljnBmClxPh0l5pUrt1n7VY59zjWu7iL1cG/N1fsiVymhzsVe3yb4f4xqWDVmSJKfSkCNbMg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2917.namprd11.prod.outlook.com (2603:10b6:a03:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 17:17:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.033; Mon, 21 Dec 2020
 17:17:06 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-wrapt: add native support
To: hongxu <hongxu.jia@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20201216080324.14442-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <20e6768b-d677-ae32-269c-e1f532719dac@windriver.com>
Date: Mon, 21 Dec 2020 12:17:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201216080324.14442-1-hongxu.jia@windriver.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0036.namprd16.prod.outlook.com
 (2603:10b6:208:134::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0036.namprd16.prod.outlook.com (2603:10b6:208:134::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend Transport; Mon, 21 Dec 2020 17:17:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef2dd098-eb43-406d-50ac-08d8a5d43e4d
X-MS-TrafficTypeDiagnostic: BYAPR11MB2917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2917E65566D8382AD3BE01DE9FC00@BYAPR11MB2917.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NUsA9Seoz899uCbWzDsB3HphBKxE22f87NF6P7iPNLdeeg1YBGLI2QefBIMaGlu/xPX2jVyFt3x68UF2CveBJr3H/TQsfnoDCVAuJULV2TBNJvFt355Jvy3hit0oPPdgrukDrjHXMgzLJMBBJrX5qqFNruj1JgFuMSvECnnatV/UiPrXzOA7ozwAZPSIM5Gr7I5N6lGJjzR6J5nuL20uEz7cah7ZTGHYESo7aAqKDsu8+KfP/0ieDs73ReTJtIT/299BUscufDEHwmGXBLY/mkA6hY3EGvpVqsH8B2wxNESR3cAaK2LmwBatHSpUZz90TtSetkQ+oCkg9DLjoMU08VcJ8uQsKGzEiknDPjS7y9W1ffHIFCrWNrnm2pB8fpNOzhBC7hovWbNI6uyKLWl6RRzOSH56+fWDU3UxYfBHhStss+SkcFFg18tbvtLqTA3FXwHqR8m2O586yt0X0QKzPTh8NgKZnfsEQMROVNpEfP5kj0D5d2mMOhnIomCrcg69+nmi3OaXlQmTPYFRsuUIA/KZMn+jGV5UshFYibH5KNTqWWyODYb4C9Edd9j3J1Hn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(16576012)(478600001)(52116002)(31686004)(966005)(16526019)(4326008)(316002)(36756003)(4001150100001)(2616005)(66476007)(66946007)(83380400001)(66556008)(8936002)(6486002)(44832011)(166002)(26005)(53546011)(8676002)(2906002)(86362001)(956004)(31696002)(33964004)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MHZRL2xiYy84N3p1SUl6aEVqcjF6dTFvc2wvdHJvdCtpSjFqNUpRWWVRVGZs?=
 =?utf-8?B?YTNQNDg4UlNOMG1YaXNnZnF0L3hIUUVoM25ObGFaRG1oSlVud09EcEVUeEJk?=
 =?utf-8?B?UlhLTkQ3c1ppTnVQR2hwMk0vN1pXbGdHcHdMRjlMZHh0V2p2dGlOQXBFQTdz?=
 =?utf-8?B?dVNFTnB0eUJGRTgzUkttNWVxdTR2MjZKUVpkUlUxaS9mK2s4ZG9QeTVwWlA0?=
 =?utf-8?B?L3hFQ3FsRkdVazFGUjBSNVpLNVFOTFIzNVh4bytrRCtmNnVWbnlzUHlUdlZ1?=
 =?utf-8?B?QzFWcEJXeFVpNmNQNE9uYmZ2dWQ2M3A4V2VsdlFKaDUrdDVoWTFLeFZFMDRG?=
 =?utf-8?B?Y2UxYWRQMHMwaUlKWHF3dmNZMTJQWlRhSmRPT2M4R1lXcHBpd3RFcWY1eDJM?=
 =?utf-8?B?NlVxcWNVQ1NZSmUrNjZFd1UrQzhqdXljQ2NvQmQrZVNIZDAyTlpteWFJeE94?=
 =?utf-8?B?RG1FUXkwV2c4R3dYRWFjRWtIVTAzN1JKT2d5eVRnNjRyaWlKblREVUQ0VElv?=
 =?utf-8?B?WmRhM1FFTnVQSHQ2WGpvVmt4MlkzUkpiVFBJT3h4TVpJalZMbzBxcyszYkZO?=
 =?utf-8?B?enpSdlpFSFBjYS9seWFBYTQ4MGozWDVoelFRQXFyQUd4cFBzbjA4SGFuckh0?=
 =?utf-8?B?b1FIeHMwNzU0R3BZRG8xd29oNVVmVllYZVZ2S0lTQ1VFeEtaWklYaGtFdlBz?=
 =?utf-8?B?enJySUtYWEZ4N3R2NjlQN2ZEVk9ia1RNREpnZVF6SFNDd0lISGZrZkRkbHZC?=
 =?utf-8?B?SHg2WlhPajJ0YVdjb3NTTlZPWHhMMFBvbVBhakJ3TS91Mjl0WmkvMysyemxF?=
 =?utf-8?B?MDZUdlZpSXp0WDBDNVlhNCtEdy9aUDQ5cnZyYm9QbnNMVzY3SkY0ekEzdE8r?=
 =?utf-8?B?V2lWdkVkdVlOK0ZYVmhWZ0dOSDdtclhkTWpwS3FWSjZyNGNDaXRQa2MyaURs?=
 =?utf-8?B?V2tUSjdNOEpabHJkbmdPVkJYNi9PSllONDhFT2dKck9PbG0yNkxuTVgvZmRZ?=
 =?utf-8?B?RDU4bUJGcnpJRWp4QUdXZ3NUY1RDSUtoUkFYL1hyN21SbkZXMGlaa3BZYkhv?=
 =?utf-8?B?RE1uU1Q2MlpxVG5ES01Gbk9URytYSmFsL1BrNDgzV1BlTjBiUGQ3Z2svTXR1?=
 =?utf-8?B?ckpGbTVFdFo2Uy9WUWo3Nyt2VGxzUlJ2alB4ZmswZlZoSGhwanYxak5XRXNm?=
 =?utf-8?B?bWJXUUtsTm0xNEIyaTJVcGpJQS9YemNqaGlDMXBYRGh0aURWZm5NeWE5VUhL?=
 =?utf-8?B?YUtRMGFNRnB4MmtjQkx1RDAwcmV4V1QrOW1VYTlha2pwKytmZXY2VE5pZTM4?=
 =?utf-8?Q?gyGLcj/LeldTQNyP6cU1tU6Ky7ZTa/ZRDa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 17:17:06.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2dd098-eb43-406d-50ac-08d8a5d43e4d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnhhLxST5zSjHmcZWbXQ8MFRs/5P8j+atwf8kYFfxMeQkmgnBGxlll9UIa3I3B2pVPiwSgSA8aMtLJ/Dyn60Ken7qLG4ZuyFtdK+lIjP62A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2917
Content-Type: multipart/alternative;
 boundary="------------F95F4772F433A3ED3F66EF26"
Content-Language: en-US

--------------F95F4772F433A3ED3F66EF26
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-16 3:03 a.m., hongxu wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
> index 49fde1003..bb9b95201 100644
> --- a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
> @@ -13,3 +13,5 @@ RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-stringold \
>       ${PYTHON_PN}-threading \
>   "
> +
> +BBCLASSEXTEND = "native"
>
> 
>

--------------F95F4772F433A3ED3F66EF26
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-16 3:03 a.m., hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201216080324.14442-1-hongxu.jia@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201216080324.14442-1-hongxu.jia@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
index 49fde1003..bb9b95201 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN}_class-target += &quot;\
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-threading \
 &quot;
+
+BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F95F4772F433A3ED3F66EF26--
