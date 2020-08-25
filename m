Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.46])
 by mx.groups.io with SMTP id smtpd.web11.12695.1598359598704354284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GnmJ/1QC;
 spf=pass (domain: windriver.com, ip: 40.107.100.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrRlMCX+hwwEEl58bBpZdFjspV3fQvAL1L8t/MQqAG4TeQbBn65PdYQbUlS9wC9RVExiSAyoHMlRhU2yh7jSjuX9PyWIdXxdSxtsfNwku9LcyTQzkMzIrVlrCkcWLgcTyK4RkyivJtl4Z+HZv7sRAwFzIPSPbZOGWrgA5YK7NYMzCfP6dAyOrXcXGs/31UqCOGDJ2BDZqicR4fJIrgYcTzw84C8WMUqVo+++DQPab8RSsEQuu0Z+MlafBRShstTxPIvu4FVgjxpD+ETIc8gptqAGZlGtJy3B/CoOUK/mmk+2Zre+bBnXmgCymxRxDljHUds8kloisHqYIPVw6PfrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GI9Sa20YkqMYuYSXVXlHRQxDxqyhmh64psu20yDytc=;
 b=DR/Lj67tjEEXzSRYX0HcNQwCakPI5Grn+BpbPxV49rHuKh8OVZXsL3W/udeFnUd32k6miBlTIUj8bPRBjiPvzsRfuGLVaBzgXg38W/V/p1CVciOGztYhbo3YWzCiKULQ5JEgMoiyZ9TRLQC6+d8IKSNy1LstQI2gHxzqyntUvBFcER9yCJ0PoOvq+FdykoRw/d/Ic5BaFV1OhLeZlZ+h/+GUh5rN07CbQ9TI42LwRnpb0Dw09KqL4bLJnJVhyi3FJjgnG1f6f6TzcSCZCfjowa2xnxNEwxWc/9L8oW+oC6oIHvBNXOZsR8cUxSodJFqZxUbEnacYBMXQzM3Bzli6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GI9Sa20YkqMYuYSXVXlHRQxDxqyhmh64psu20yDytc=;
 b=GnmJ/1QCTflWFBOqe94cIytitRLYdMbc63ruiBclXGazwjpyXfHhLZ+H0j2tCf2s8NBP//azUvc6dIHHK4OQpLuCuHm19XZkV5oK8zUHUhR8Wy0Xjm9a3N2JdEN2GfAzfJNRpXdLy1BBhOEHSVgYTe5aG5myZ4mQ9hKs3Iq18Es=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 12:46:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:46:37 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-msm: Upgrade 0.8.7 -> 0.8.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
 <20200824145004.12568-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d1d44843-eb75-4bb9-bbe8-724255497bbd@windriver.com>
Date: Tue, 25 Aug 2020 08:46:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:46:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca4d858d-5ea1-411c-b035-08d848f4e7d3
X-MS-TrafficTypeDiagnostic: BY5PR11MB3976:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3976F4E74DECEFEBEF9B5B649F570@BY5PR11MB3976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	48m+/igiro9w3nc9nUYUviwU4PsiR2AZK8/syjdqflxWHkmJIEoCtOjRlq36Jw3Bo/Z8OvdVGASzT8QPMxkyvjA5Hb6qmNzy/4P26jjJSa5DNnaXo2SbyB/NsjO16UbOYc5wkRFaaTxNBntUApa4/vLR0U4KOdugB83pe89k8usrM4iRIKO+Zqzox4Mw85IHl1xxbFn3wV2J36cnCrt45zvy9G1S6RCo4Sp3X50IaEj18U1u/hqIBBmVmDMKlPlelOg7rku+iwYKu4Xm+in/8ig6ILnSoxUFz9TR9enJWKXuZTWU9ECyODRDcI1Mv06yJZGxTLQTzCStguMdHJ/L4X/YyAIP0j+pwYxIaJOMOgQwlwqlQti2MzFWrrEanwdqfpOHCIR6K6oOcrovvqX9e13xKLf50nT8LydgTh8cf7WTU4n8jK9MaAyHoRrlzuQOg6NN1GKG5XLN0WsZ2iy5XA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(376002)(366004)(136003)(66946007)(66556008)(478600001)(26005)(186003)(5660300002)(31696002)(2906002)(83380400001)(31686004)(166002)(8676002)(36756003)(316002)(8936002)(66476007)(966005)(16576012)(86362001)(2616005)(52116002)(33964004)(53546011)(6486002)(44832011)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fUCS0ZTVobDMFtBRx0lUpOdL8nKQQxQQSI5kcVBk153jLlYfh2fdwWmFl44UVHM99civ5sDt81HdOtkgoEgZ1R6BLNcz0rkLGt87dFO2NHK2DszI6HUQFGt6doPa/Dh9QAcVU5Nh96shehxmha44Evs96ekTkIlnbsZEmf61+iYfAjMCixfdgIT/lqsPqiAWpZWN6/uJEqaxvm8zHvTmWhbA8eC/Z+btx+5frJGONc571S/6jNwn+qE8MevHFdSRIdVOAkcRWxQxUKz5xci7y3of7pSbcpWi0zuN7kPNiKHzYGuTTO+UI1mjf+XMw6Enx/ogqWCO82PjOwjjsW9vD7khF7OO+ZIiT+HXnf1xmUm5/cgZwYie34SKghjIoggpCG6fqYgQCHETlXvfZBuLpu4bP/vt4nmHD5sfT9gpq6TSlO6ZiWwfw6oph6f+AJEcGEh/eTWfVBPIz3ycxf/MIJtkrb3x/Vm1zb1MQBtmI/XXVN5l5f5+PCcvc0kkoPweSQ91NdzDGgwpTyx6AfPdUtQrob9fBlha8dWBdo8G4G5+Nwcr5RnYeBVwhoorzN8ld8Xun4PCZOyUJpxmZoC7jf7R0jmPZL/P96cD0EbmiBKHGvAJQDnbBIfWXeiWMDAoESR2LYMn8FwBY3GN9/pXQg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4d858d-5ea1-411c-b035-08d848f4e7d3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:46:37.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAuNOtjoe/Pl17P13Bl5+uzO58G87ggUFp7M/vS8/oqhMJxTeKvlo3RidmySI007jfMVg39abntrUgPZws3CqxmARlEm9EKDYgC1huUfiOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3976
Content-Type: multipart/alternative;
 boundary="------------2F21B488B2DC0019B9DC2C2C"
Content-Language: en-US

--------------2F21B488B2DC0019B9DC2C2C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:50 AM, Leon Anavi wrote:
> Upgrade to release 0.8.8:
>
> - increment mycroft-skills repo branch
> - Make sure readme is included in pip package
> - Add license to MANIFEST.in
> - Remove exec flag from LICENSE
> - Handle PermissionsError when creating skills repo
> - Concatenate list and not a string
> - Install Python packages in the exact order as specified
>    in the manifest file
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-msm_0.8.7.bb => python3-msm_0.8.8.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-msm_0.8.7.bb => python3-msm_0.8.8.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
> rename to meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
> index de930f934..f5e3f59cd 100644
> --- a/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "16f755ea554c332cdb666dfc1109f7f2"
> -SRC_URI[sha256sum] = "9878eecbf7255d4907637700ecfeeacb9fe586409ee3ae05d406683ad18d7e5e"
> +SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
> +SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2F21B488B2DC0019B9DC2C2C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.8.8:

- increment mycroft-skills repo branch
- Make sure readme is included in pip package
- Add license to MANIFEST.in
- Remove exec flag from LICENSE
- Handle PermissionsError when creating skills repo
- Concatenate list and not a string
- Install Python packages in the exact order as specified
  in the manifest file

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-msm_0.8.7.bb =&gt; python3-msm_0.8.8.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.7.bb =&gt; python3-msm_0.8.8.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
index de930f934..f5e3f59cd 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/mycroft-skills-manager">&quot;https://github.com/MycroftAI/mycroft-skills-manager&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;16f755ea554c332cdb666dfc1109f7f2&quot;
-SRC_URI[sha256sum] = &quot;9878eecbf7255d4907637700ecfeeacb9fe586409ee3ae05d406683ad18d7e5e&quot;
+SRC_URI[md5sum] = &quot;cf1fc0d1d86af68003cae53c71ec6288&quot;
+SRC_URI[sha256sum] = &quot;a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2F21B488B2DC0019B9DC2C2C--
