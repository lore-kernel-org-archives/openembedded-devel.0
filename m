Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.67])
 by mx.groups.io with SMTP id smtpd.web11.11245.1610467804110896657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZULMNYwT;
 spf=pass (domain: windriver.com, ip: 40.107.243.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUwVPoLH5dAGDtez2WZTbxXjoZQO8ujkEf5wrZE75DouDAXB5J0fPh/mQk6kfzhMVqvlwa3qTzNx4OsT/vTR59Rr4OclbQvDdD+EOEdg2//m594CfBslHD7H4h0xseroS6j2MXZu2mvrFvgUgQHCrlDm6cUBVoOjlNyWQ0gegHvlBsG0nyczSQtESB+vcy++ebHtDEi9t1fWvHP+F3oVODq+ckHodL1v3RM3y6+1cxS08CV5k6fKECm7eq+LV0tiCEt548i7d2WBrq3r1BxEwTCoaKKFMolhl+RaYthHdUgWYEaK0j449pMaLaDTyhj3kyT9hl1o735DFhXqy8zdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiUyoCBpTd/2w8SIhzteWWxn9/yUi+ygSfFAVEA/0Uc=;
 b=LsvDLMRP+moEFrRPhuL5b6CWNII/Yh8D120bK2lq5zsJO7FIuzguen9DTb5cC5zcjSOIlRci3MrvB1Jj9UoK0y1jpFUrieJTq6bwj9xqg+uxAEu6yCV/bP+sBSdRZ4vJo3fC+gqwswvqe3SKH3j85jPDzdVrZIKeMegfKwD7UjoFG9ePbWe/I/j6GYK8TBuaDz+FL3AKZimVwbz/W21bzQEF5DIawrKikouZ3hYscwp8M7tEkkyCo7TEdS4/rEslZuSC1Nbt5bpbblbH72AoElcZTddGjXejVN2RAjtNyYFOGz5iloMw/7PIsIB2IEbNLj6l+RHsco/a04ciGdJNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiUyoCBpTd/2w8SIhzteWWxn9/yUi+ygSfFAVEA/0Uc=;
 b=ZULMNYwTu0bczA97JcJMT5K8GyhTIUR0ZOcxSeeTOY+KiRItpp7FsKnYySh8NFq4Fthmtz/ABVm+RRsWIrSQ7u9cJHM++C6TOT/PBlGHh3zy0fN1pLB4qV7yxtkJTYTkSYCVlW1+yOwMb4kVCx39aLc4EvkZZyDzKZQCzl8Lpho=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:10:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:10:02 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-parso: Upgrade 0.8.0 -> 0.8.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
 <20210108102814.9560-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <12a27207-ce67-b619-eb04-6b974c9a5439@windriver.com>
Date: Tue, 12 Jan 2021 11:09:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210108102814.9560-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:23a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41e9d718-28b9-4aa3-546a-08d8b71484df
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807CA1FD6F0103DDB12EBEE9FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xT7n8/1WYs75XCnU+l6Mo5RXMTw5Z+u8MqgJpQRsnImTHFzJ7L/ny/5NVcP5ZGUnvZJ0pNvN5jkO4+HgCpZXEz+HqIEIfOekWakdFUrFEB0EaJ7taU9xGgeTLR6gPlOkrltebWLVMFwLREkld6G7pmfDCO/tqmzJyHCp53o5dwjOegC7ull+slvN2YB3js7QUFflZueYp8FYMYEuIotUQofz6fyRPmpAlOTWaRWrs+O1p9ws9JMR1C0ZUWZbzHP2dGSkWtix18eLCfJlbSZ2GlUIrt0wcHfjfe8nRfLycMml7ln7FYRlLRWn7oD7Be2e9cnO19WbP5vHiZPOZ/ZTVWyH5+7Qn8dQE/XUp0Nr2DpPIA1xTUcFRnQopPmdtm8c2pbMGVhQkbLkqX1TzXIh02vVbteHV+yGLdkcD058XPst4u6CK3pEXhgqQ/XPQbZmwPxGBg/0proDEi+QO+9uSSPJdmDNmmxWcEKTsBE6Ul7YqHJilHql412/qUqKXKSlL2LpRbQaTcXRexCBfWr6QUJnq2WEtvtRfqxl2m3UUkU2AvDlg2Fl2VKS2X2SlLHN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(396003)(376002)(366004)(86362001)(31696002)(166002)(26005)(6666004)(31686004)(5660300002)(44832011)(36756003)(53546011)(66476007)(478600001)(33964004)(16526019)(66946007)(83380400001)(6486002)(66556008)(16576012)(316002)(966005)(8676002)(2616005)(8936002)(2906002)(52116002)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eFdhRVJ4MnRVQ0NYUHRaNjJUWHJxcGVIM0dEUHczRVlDWG1JUG9rd1UyN2Nn?=
 =?utf-8?B?WW9pNVFMeGR4OHRtb2ZDNTIrMTF2YkZoVVd6VktsQ0tBWkNDd3BCS1Vyc3BF?=
 =?utf-8?B?YnZZWXZ2MHlPR1dpck9jZ0FxV0txbks4NEppWktqV0JuRjBJYytySUlPYzhR?=
 =?utf-8?B?SGJoYVZISXJ5S3JsbVZ2eDd4RzlGVWlGUDR6NXdvTkpmSC92eDdwYXZFNEZi?=
 =?utf-8?B?M2pWMkorWHZaUTBCMm51bkF2R0ZMTmxyRUo4YjdSQ05udHBLdlRCN3lndmlp?=
 =?utf-8?B?YnZ2cCtOMllnczBVbmMyTWhiUXpLcTNFRGgreGF5TmxrcGlSaFVVUVVWT1Vh?=
 =?utf-8?B?K3RsS2lFQ0dUdXRHNC9uOTVjTGd3R2svTVFiMUVXSlFjRTQvelY0YWdLV1My?=
 =?utf-8?B?Y2Q4OFBTRjhYTytWMnpmWG10NWZmVk5kTHpBODhwUzRYRzZWVkpxb3JsZ1hW?=
 =?utf-8?B?a3h6RDlNbkowYWVXQkFyWS9SSEpUaFhOMlo0RVhSUC8rbWFYV0dCd1ZEbUMx?=
 =?utf-8?B?N2Y4Z2J2M1c3OTAxeUp2eEw4b1NRMWllbS9rb2wxdG9USUlsYWZnY21Ga0hX?=
 =?utf-8?B?RTl2c0xET1BQRzBHcGE2L0g4M3lSZW04b0gxSjNkYTVoRksxazNNYUw4dFVx?=
 =?utf-8?B?RVBDYTdvYmxtWmV0TlR5azV0Q2RpU3V4QXFnRlBId2llYnpnYVhuT1FjbXdX?=
 =?utf-8?B?RFhrRTIxbnI2bnlVNFpOUlcvMmt3TmpRdVloQmlPaUt5YnI1WjBPVXp4QVJ2?=
 =?utf-8?B?S1g3MGJIZ3Q2NmIybGxVWC95OSt3c1llYUN3M0haRTRFY3gxOUY3V29DY3ZH?=
 =?utf-8?B?d0JmSldhTkRxZS8rbEhmUjhmdldNdi82amhwRzFyNVR2b3VZeVFNQk9xbEU2?=
 =?utf-8?B?Zmx4MVd6KzVNMlZEOERvYjdIU1pqTDZ6ZTRhQ1hFNDhKYnJwbXVmY3RSaXNn?=
 =?utf-8?B?c3hKWXFRQjVzeE94dGZIUWR0cFlvSVc4d2VNMVRBN1B1akRKeXIyODRLWjdk?=
 =?utf-8?B?TURMVVdtVXpRZVRjNE1qWnMyUko4dGpibWlzb0pKaWV1WVFmcE8rSHNXRHM0?=
 =?utf-8?B?VGdZRUdOeHA2aElQdWwyaEtrdTgzY2VvNWw5d2R3dCtPWFI3RnhhTU9kamxI?=
 =?utf-8?B?T0hIejNxTFdZUnNyaUhDR2lYZ1I4MHF6QW1mQ1NlTG5GUDhCeXd6aFErOFVG?=
 =?utf-8?B?YkJzcjR1OXdXbHQ5VlArWDlwalowL3BXb2ZQOFN2am45bnZLVlJuQkZUb1VN?=
 =?utf-8?B?bVBkT3VzakhJVXVDVTRDeXJsd0NjN3AvTVZuTEt0NmxMclhZVU1PMTJYVUQ4?=
 =?utf-8?Q?0xSITZ8myvBzqe52PZ9MfO69oer/emyuJb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:10:02.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e9d718-28b9-4aa3-546a-08d8b71484df
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRu3O9QlUZB2bGcblbuwxDMc/eWyhuSDDIyvzjvwX4kdHNYW+BaaA+YVeQhHovgM/xGq0aUEfaZGfpPY5bmV8vdUaCMkXRQKdtK2cefhA1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------A9EC5459EE01FF2E4E540D49"
Content-Language: en-US

--------------A9EC5459EE01FF2E4E540D49
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-08 5:28 a.m., Leon Anavi wrote:
> - Various small bugfixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-parso_0.8.0.bb => python3-parso_0.8.1.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parso_0.8.0.bb => python3-parso_0.8.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
> index 507087909..9e4ede529 100644
> --- a/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
>   
>   PYPI_PACKAGE = "parso"
>   
> -SRC_URI[md5sum] = "ee3592994bfc0d0843790544c1b2b702"
> -SRC_URI[sha256sum] = "2b6db14759c528d857eeb9eac559c2166b2554548af39f5198bdfb976f72aa64"
> +SRC_URI[sha256sum] = "8519430ad07087d4c997fda3a7918f7cfa27cb58972a8c89c2a0295a1c940e9e"
>   
>   inherit setuptools3 pypi
>
> 
>

--------------A9EC5459EE01FF2E4E540D49
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-08 5:28 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210108102814.9560-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Various small bugfixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210108102814.9560-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-parso_0.8.0.bb =&gt; python3-parso_0.8.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.0.bb =&gt; python3-parso_0.8.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
index 507087909..9e4ede529 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f">&quot;file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f&quot;</a>
 
 PYPI_PACKAGE = &quot;parso&quot;
 
-SRC_URI[md5sum] = &quot;ee3592994bfc0d0843790544c1b2b702&quot;
-SRC_URI[sha256sum] = &quot;2b6db14759c528d857eeb9eac559c2166b2554548af39f5198bdfb976f72aa64&quot;
+SRC_URI[sha256sum] = &quot;8519430ad07087d4c997fda3a7918f7cfa27cb58972a8c89c2a0295a1c940e9e&quot;
 
 inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A9EC5459EE01FF2E4E540D49--
