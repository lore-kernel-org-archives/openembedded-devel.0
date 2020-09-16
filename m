Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.62])
 by mx.groups.io with SMTP id smtpd.web11.22454.1600263509920827743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hxiQuFQR;
 spf=pass (domain: windriver.com, ip: 40.107.94.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FedKJKJlnS15cH3htCXettN7/78pSLwjt1LIsZ8HBTY8CtE1yi5hupcW16zDEm5VvD35teACBjI1wIGTHx8vsGtR4fJS2MRkQNvSZje5bmB5MFJ4DS7/2g+b+SmW8+onlLqg9nV926XQU1gJ2DewZRJ4IruoZztuMzHaie7K+LQV1DR6msHHWKfYiE/zY2azJmgYJ4Bq3aIf8w4K8Pouul8j8f/e2shgB1QlhKEMlqUy4l4ne24X7YlULXWFnR+0r9Gd22nZ8AaH/4WURi2QYbTOJdj0DsxMbXd0dPDs6OIMVe19i5nlvL+eEPYlPPW/krhWQuQCCzjoS1ADGLT2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzaTTIgZr/Gz0+1sI3RansH5ooskHT3PAyIc0ynYSNg=;
 b=OZfkukNIaiAVrycS+nhkIsebkE1H5d836ISGwqh5/FMucBk2yETya/jJisacbo6swRhT7owt8wHjDnsY5cDPYo5Ph/umj1ai7Qimon3JJkvgEExKjrCPdSdGNevv5jxhrRgMecSqaSwQa5e+hmIggr69TpR3muNzruplpcpXLuZ5AadmIdczMBeq9w8KnEalY1HdK8Uewvkl1QPSVyVM/GRo4jbAJxsQ0Q1zUbVQIBZrLBiAtrW9vtWawcY13nNB+TMDXW44nJ7/WRUde70eJAAuQ3mj5f5aAaZaHEmegGps5+BqG39Q6n06EzL71i7KJLWTF3iAlBDD4yNPdvNrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzaTTIgZr/Gz0+1sI3RansH5ooskHT3PAyIc0ynYSNg=;
 b=hxiQuFQRGBon+VUhJ4iGoPGHuQo++J/xybEG4CRWg8MdtOz3DpHTtsL3yzdnDNpMXZlu76dyjbX3weYi7QPRY9iJoj6KaaHi5KOxXfX/DDOEDq/F+xubvs1+1su4D/X4FmNVmgy7zsK06Xsdyy3iz1D1w+4dutD5ALIdnQiUqe0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 13:38:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:38:29 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-msk: Upgrade 0.3.15 -> 0.3.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915125447.14197-1-leon.anavi@konsulko.com>
 <20200915125447.14197-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c6400df2-ee5a-7c84-0bc4-0c373a4d50f4@windriver.com>
Date: Wed, 16 Sep 2020 09:38:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915125447.14197-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 13:38:28 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c60dcf-3b85-43e9-c34c-08d85a45cb80
X-MS-TrafficTypeDiagnostic: BYAPR11MB2679:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB267972063E9C2ACCF3E047BE9F210@BYAPR11MB2679.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SE7RroTnCTJvNU+2Nq8QbtY1r3F8FBAl925QyaABNfBQRgZ1piTOhrq5SSE8suX7WMNZBS6MAobW+uGj57IYafOmJGXRXG7z7WGuvJUWxekdPBrEIH13mNzz6LQJL6LQpy7XW7/Jkj6VL6XfD88BDOPKWoKi6Y566J4xCRh6vXTysitZUFYJCRFP7r9id45fmewUh0Lvtu64A1i0tBVJ9i0pwuhC/G5UbtdmPGyk+JAG2lnme4oloHA0Na/8RRGJva3GFKYTev2GNafu8Jo6HJtz2eMryzJoSwlYAedvrB84YUNoccweZOl4ecxVWWBySubxSKynFMprHvrvDTVRY6vcPHcnfjr/w1LwW/DfqkUcNxygZ1YNo0Tb1er7NbzTb8E/L7zyOC6efPQELtXiPWWFs920glRhHIVPG/uCaYppxLTk5OMYmZFI/PT641i1XylG8oIAlyn717UrKWXL9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(66476007)(66946007)(52116002)(478600001)(66556008)(966005)(33964004)(53546011)(316002)(44832011)(16576012)(2616005)(16526019)(26005)(186003)(5660300002)(956004)(36756003)(83380400001)(31686004)(2906002)(8936002)(8676002)(166002)(31696002)(86362001)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1Kcx/NtHJQ9/qmfYEpv2z5l6+K11DdE9n/9P3EMC6nMI+In4FprbtB9BIWtxlN+xdMm/fAQvl4evWOV2gDiCF5v8oZRGr9seiozqRSBTE8s+XfKoEy9quyUKCTHHcb50F24L8yKvC9BDmQ7VJURe210YI/g8J+LIh4BA4JJnnue7tg4TudiVahbV2bbZL74QJadGLhXXwV3r6LUge1iJHQ3lSsxwk0KAi8RJ1QcmyajPApI7vb+qd7+vs/ylBy8Wgo7qJ45hG3g+Kh2DPoeNqGoRT8UII6ssoSF50wgcHupmkLeV8y5n6WvznD6t3p2B5mh8Dch/3qCWjl7KB+Lwx5zI4i/33TogvgIngW2hCMT5A+TzLyVAd7kwMPt3NUI30Y5+kQJtIqd2GRKH5GWt0QUTDxGyKt8xgc6wFaynP0a7nXRGFWZD/LvpuCpECWZMDEhjanNtL8F3FgYPaOAHMgZBlp2AU1FSQ1RmvJS2+4aNV7YjSBYTSR82LnT/3yYfDj2Gl2VL/MFOLx33GjBNeK5A2JUTo0UTmboJxqE0SOfBS3vuXqe8RcTBOSSdbMhMoSc5V+1Q/PWPO7w5mxzFdQ2hJuCfoGSsUUDU4ovzMIhwYiBGznLuGP9W20SLbayUbeRlXmXIFofP2C2F4jdNqw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c60dcf-3b85-43e9-c34c-08d85a45cb80
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:38:28.9260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vxZZWzEj9WWZafjnXiVsU6oCYgO15By2UyIrWdfvCEClQHD7hP9QxwHaSKGKIdl0wwDj/u3/yl8EnnRSQPUL/qBaOfVw/QiPMIUXmiPJOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
Content-Type: multipart/alternative;
 boundary="------------6D294F6A00AD5BD1E694DAD0"
Content-Language: en-US

--------------6D294F6A00AD5BD1E694DAD0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 8:54 AM, Leon Anavi wrote:
> Upgrade to release 0.3.16:
>
> - Ensure local HEAD matches remote during upgrade
> - Remove typing dependency - only required for Python <= 3.4
> - Include license file in sdist package
> - Add default icon and color during Skill creation
> - Improved category selection and display
> - Improve PyPI listing info
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-msk_0.3.15.bb => python3-msk_0.3.16.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-msk_0.3.15.bb => python3-msk_0.3.16.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
> rename to meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
> index af011ccf8..a3206f79b 100644
> --- a/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-kit"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.md;md5=2f90e43663eddf1c33087419fbb35e28"
>   
> -SRC_URI[md5sum] = "dcb286c489d24d8b0fb8413835f7478a"
> -SRC_URI[sha256sum] = "56d3557889ee2ceebc72284f979aa6ddd4c7fbe2af31142eb6f51404f14516d5"
> +SRC_URI[md5sum] = "8a4fc92a074544f81f482da2c21ef989"
> +SRC_URI[sha256sum] = "c6a717fc068f7c69ddc8cb21dbeeda7cfa97a4e9f41690459c9fbec68b16ee87"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------6D294F6A00AD5BD1E694DAD0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 8:54 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915125447.14197-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.16:

- Ensure local HEAD matches remote during upgrade
- Remove typing dependency - only required for Python &lt;= 3.4
- Include license file in sdist package
- Add default icon and color during Skill creation
- Improved category selection and display
- Improve PyPI listing info

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915125447.14197-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-msk_0.3.15.bb =&gt; python3-msk_0.3.16.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msk_0.3.15.bb =&gt; python3-msk_0.3.16.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
rename to meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
index af011ccf8..a3206f79b 100644
--- a/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
+++ b/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/mycroft-skills-kit">&quot;https://github.com/MycroftAI/mycroft-skills-kit&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=2f90e43663eddf1c33087419fbb35e28">&quot;file://README.md;md5=2f90e43663eddf1c33087419fbb35e28&quot;</a>
 
-SRC_URI[md5sum] = &quot;dcb286c489d24d8b0fb8413835f7478a&quot;
-SRC_URI[sha256sum] = &quot;56d3557889ee2ceebc72284f979aa6ddd4c7fbe2af31142eb6f51404f14516d5&quot;
+SRC_URI[md5sum] = &quot;8a4fc92a074544f81f482da2c21ef989&quot;
+SRC_URI[sha256sum] = &quot;c6a717fc068f7c69ddc8cb21dbeeda7cfa97a4e9f41690459c9fbec68b16ee87&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6D294F6A00AD5BD1E694DAD0--
