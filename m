Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.76])
 by mx.groups.io with SMTP id smtpd.web10.20544.1593442337080812433
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qSMZLbKB;
 spf=pass (domain: windriver.com, ip: 40.107.92.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1gSyLbKIW9j47eZs83ivhp98sLvLE/IoVLMRf5RQXhYnsvR52M3BzFBWen6ey86r2OdcMQpm+8L4EOnIBcWtNHkDGNpXs6ra51MeHOKm5E+FoLXHveq9fWPGaH6EARZbxsssDhanTU85JeQUnXpQi+QWaXPhedGf0TSfOk6eP1n6zzw9OMeeYxlNS9CzuImwbX0LYMXB1GqQeCKGTFQgWwTBGUy4FF8113WO9gHkC8gsAM1dHZBrkTETjeXZNo3zKEicK6YQd+tXkY5jdeCUZSL4FFcay3+s0k/sWvUBud19VLWAIJ6sqLvynrmY+t6bBQGodbJnE+GQRTNFSoWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aol650fA+XH78b9pqY9ERZg6mb239zyd1woT27fM7gs=;
 b=IRii7vTEqOsCjRtNpjcjc9IWdbnSfnQWW8l9VKvJM8Gl0f5tMIWPg0s7w4EXT0LREFHaoPue+XNluszqa6DHTjaWlXzcBbs7fQR08g6QcsAq6T4uxthIOtNKnB1sEfyg532/NAbmDgDbcOPJgOJcGu/M43EQjDLapElGZBtC5EevKCC+9pER/0MNnYhIYlavXv5B2KP45VgkZLesuhjL0/+mfhtsX9BN/3ZCgB4e7krfAbTv8HalIJLlRoqPeF8CRyO9LP6ayiN0QCB2MzkfHp0044fhHMZVABSrgChAu73JARf+aObaAyLtMFxXg1lxZ/S18EE3+ZlVVu2pAL6O6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aol650fA+XH78b9pqY9ERZg6mb239zyd1woT27fM7gs=;
 b=qSMZLbKBLuaNRn0ScnAYOPvPZ/wt0hR4ywESVXEcEuRJpsVR5vY/FJkVexCKn0wP224cXDmz0kLj07RnU1bOuyp6jEDJWN3+k6M+OCCrOOvzw9ANa7aDs3sEanA5wWKxP06lYpIWk9gVMPWlgVaR58WIPgkBDn9Y4GJjeNdxplo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:52:16 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:52:16 +0000
Subject: Re: [oe] [meta-python][PATCH 09/12] python3-msm: Upgrade 0.8.3 -> 0.8.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <09ea388b-7bbe-db19-cde8-bf129b7b7ff9@windriver.com>
Date: Mon, 29 Jun 2020 10:52:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:52:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abde9e0d-933e-4034-2a67-08d81c3c0397
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988685E93C4DDCA127F6DD69F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mcYFpfoFHOgBopz3PQqy0xYvfwJbxTUWUq5fx3LnmE0UMhWlaH4hEVho0KkrdJUz9Uod5p9etSaGhzeKSm5FPQPxEgr87mj4gTA8/Qhf8ICdO1VYZ1Iudh9Q8/d7H7SfMGBQkCiWSQkw6YaXNvo0rm846EjIFolJOdsh/sQ5nbCefNUtaRyLqkiGw41gshimGn85h+kx/9Mm/1AEwEeyONr3bClAGIwlV/BK/3IjupDFnBCb2G6/f78yTEVmp4IyCWcJQmZNrmTYsSOPietJ1AQleAPSkE6pgkyKg3O+OZg1QgZEy2v9pKHldPxibmmcZ7tyRAdHF4DmJiiRJtt2hMT+an+E44n1kVUa6D8MkDNIj9A7b9pT1qD0u3eW+u6u5CoTFxbz7zoQwXya4omcXm64DKCYDHo7fvMAYuSH22AY3aCTgNaTeTtO/2+fGuGSSU0Ty4XDH+drJg3AmEvX0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NGvoWr9Iwp7S03QulMtw+v4/SHnc0G3HPy87PdVmhmeiYNM36Yj9kw9RnOt7ecvDn3R0kZww5o5sl3x97CH2b7pstdf5BJodren248tum3R1qDXUBp0xPz9n/i7CQX6C4MUEVBnogCkQdqLLVyS1pd0QyPqmnqgLMmcOdOAX2bEdrXQ1ZOL15yK2xhdLRgEjtpjbJGPLIQ3Sec2Wl3cO9E6ToTlBhnSLc6221+pNlLFacQXjYXk4Xvipp/Gz+6PT3HqYY2NysT4lnhdOfpRV3ArkVFMlHZGOyfiDcLTDIuWh2DruFEUzH+mSpXZI+jRJg7ZJOtmf2ro6CT/Dg3jC8VBDd8o0JEVDLmrEFZ9Ld5iMcFkICpfWoNDWwcER3DAoFA0lbcOOxEOfBHlXC+75Q/u6MzUZu1LBCaLbbBpAWcETqjDrGMQfaMRIUxuYpp2bEHmNR8q4qfZkz8RtOqoV/rxNolcQ1QvKFk6azpnBrAw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abde9e0d-933e-4034-2a67-08d81c3c0397
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:52:15.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS5IqhYlHn9GMJHQWxSc5bjOkcegAdkJlxy+VI+fkKaPiTrILCdIkyk9sfjhUoSVCn4RWFBw5RDxLNhILY/5layrXzc6Nduw6mb1wcC7Wn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------044584BA6665FCCD9E93073E"
Content-Language: en-US

--------------044584BA6665FCCD9E93073E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 0.8.7:
>
> - Handle git:// urls more gracefully
> - Add final rstrip
> - Add another rstrip for checking if it is Github url
> - Convert Paths to str for python 3.5 compatibility
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-msm_0.8.3.bb => python3-msm_0.8.7.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-msm_0.8.3.bb => python3-msm_0.8.7.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
> rename to meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
> index 24e1ccb3b..de930f934 100644
> --- a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "d5f580c58389b337f5577cb92f36e788"
> -SRC_URI[sha256sum] = "c201785997f3b766ec376a89bbb3367889ac542183ca26733ffe002bb94917b4"
> +SRC_URI[md5sum] = "16f755ea554c332cdb666dfc1109f7f2"
> +SRC_URI[sha256sum] = "9878eecbf7255d4907637700ecfeeacb9fe586409ee3ae05d406683ad18d7e5e"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------044584BA6665FCCD9E93073E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.8.7:

- Handle git:// urls more gracefully
- Add final rstrip
- Add another rstrip for checking if it is Github url
- Convert Paths to str for python 3.5 compatibility

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-msm_0.8.3.bb =&gt; python3-msm_0.8.7.bb}     | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.3.bb =&gt; python3-msm_0.8.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
index 24e1ccb3b..de930f934 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/mycroft-skills-manager">&quot;https://github.com/MycroftAI/mycroft-skills-manager&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;d5f580c58389b337f5577cb92f36e788&quot;
-SRC_URI[sha256sum] = &quot;c201785997f3b766ec376a89bbb3367889ac542183ca26733ffe002bb94917b4&quot;
&#43;SRC_URI[md5sum] = &quot;16f755ea554c332cdb666dfc1109f7f2&quot;
&#43;SRC_URI[sha256sum] = &quot;9878eecbf7255d4907637700ecfeeacb9fe586409ee3ae05d406683ad18d7e5e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------044584BA6665FCCD9E93073E--
