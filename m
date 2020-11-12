Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.54])
 by mx.groups.io with SMTP id smtpd.web11.10187.1605211276347948578
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nFMYxxWt;
 spf=pass (domain: windriver.com, ip: 40.107.244.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VML4NQICi1hStK5I5wHbOUc1nqsrAikEhle0/iSLTao/XgsqrVt5XKgTgxhO517T6e7dDcCP4yGrlJwZhaRJCJ5XT8YHDgpACKy8ueY/5DRlffvlwdGaEvDIKXIqQz6AV7cAIrSdh2oWRL8eqEyD+1BWmgE59hvckUZxkKsXRwYi8RX72+nZG7HwZpa12tMbTBsU94QJWTGYOeAXbKO6NF9XPE2+pKUXWP6NM2vawauv8YdcdjZQkMO5Ze0adyILkCVQQufa0+TcqYTLaxYw7BzbOsq5sJ5vlIl3lsmzRCzb/0ha9G+sUGa8wfv014IWckT+hWyRLA4NjPiAsZld7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTgLA/VzEtle+XiqQLGxdSFzt7wcfPmai25WGVwFuig=;
 b=PekOOfJr30ZEitqZgYC/SGPZmUGvDXIO+Nc+YPEd8KZvDYXt5VvEo+hgs3BPPcz4uDy3raYLGSPtGUvI606iXnDaYHYT2PPfqN06DDgsJ4e8NpM7zMHUszMbb4xXGRAA2H8YiNjjn/Pwpi3O0YyM/ojAIeUDN6ST8Bq5dP57sFnS89gBbmiZjd36epAs7TAavH4YL5p6LsVa094C28XfeCi8q9TzKG7xLDfRMm1s5oY8Av468OIMXmFphxVWonYyJlPA1nPDah8ZN3Q38XPr9B62DcrMPkpJkDOhmfXxCV+axW0m6P2zMNukCs4RBh6L8J8n9WmbV1MLv5M9weIrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTgLA/VzEtle+XiqQLGxdSFzt7wcfPmai25WGVwFuig=;
 b=nFMYxxWtA3QG5cZQQJNLWw1O1F09RsrZna0his6kOxQrNJhzI9QIqpBwdHOCA8YR9VWBX6FDx7dT7jRYbnmHRbnZp7QOFeyzqAhuSSjRWut2Ae2GjTsG2jICiYxf8VDNEmb9V8uVXjgFWmc1ae9rTROskHNB2l6qQkK8GaXWqrY=
Authentication-Results: gpanders.com; dkim=none (message not signed)
 header.d=none;gpanders.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:01:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:01:15 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] Add python3-transitions
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
References: <20201109192143.3739442-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <037afdd3-46d8-9153-2657-44ae41172909@windriver.com>
Date: Thu, 12 Nov 2020 15:01:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201109192143.3739442-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend Transport; Thu, 12 Nov 2020 20:01:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c11242ac-e342-4f14-3f93-08d88745b604
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4813:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4813FBF5AFC89CD1608ACC089FE70@SJ0PR11MB4813.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ZcUCg+NUpkAGzen5UkcyYOGhM5lCeHOQ5HGTNEe2gshEvzuU3JHjYW6X/a0LB5R4y4V2t77+WwoKE5VnRei2vmyHOInde6bmk51L/ErcTjlszoYVUBN2CE10Cdlj2l1A3gJny5ajCYh8wWrpm4F14kwJyvgDnDM4wkpP9u3MLv6zIHwB3mPKjg5TQBFfggjgK7ddnT0ciIE/2tjCqfsmtjyczm1/ZgZ3On0HwtPN3I1UGZyv3nXJtoOB5q8cSqK+1FPq0tzdZqDMUSg27+u7W6aE9YHv7sozcwFsuxSl70Of3v3/EYvTE1q2HCmQnMVSnLVkKob1nvIkKGPoFNe9dytmWMpAThwsvu5ZflyD59iBQ0X4Y9XpWCkJ6Z48P+F8Z6FKnOnA6Ehh6UPxlCN9fLoHyhiET/y9VqtFZR5v1BXDmraNblPEEJ4QMRmdDV3DKStpBIkav4Pb/+DQYETPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(2906002)(4326008)(44832011)(186003)(2616005)(16526019)(66476007)(5660300002)(66556008)(316002)(16576012)(52116002)(166002)(83380400001)(966005)(6486002)(478600001)(26005)(8936002)(31696002)(956004)(36756003)(66946007)(33964004)(8676002)(53546011)(86362001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7L8gbANX7rRYEVqoZRClwOd/TulI6JtvNzerfAyq7EhRKpJkmlTihOE7Q4kHSi/STE1SKaM7Z8mksE22xTH6pfHbHvaAElbiUC+eL2uubjyQwG2IZseyejZRJ8OiWGWzkwZPooCbNmQgIpl33gbXObicsLFVOvNDMF1faE8m3Zecro1n2ugjPSBC4s4q0fKThaI8Vupw8kmB9pqpalvFPNJWLwE2uZ8X3Q/yFHtdb32KTnYw52N4qOcjmL55iYBZXfoP5unQ94KFIo7Jk2zyWK1AwxCnVRD4sFSwy0+I458birSA7NBLXeRM56Sb8wXedzrR+3avNuVUg0clgHZHM4hQcwXZT8ERY9LbxeT5fI0ghuRSUMqUaryjbJjILOTSr64qkyXM/Rb6rJPAfbO/vMRUoGybovrhtk9pUUwd93eGz6PrPqcxBioST1h5IKjMemhQ2Q/T3JEz9piz8K7PAJ9S0P4Eqok8OgALb0KvSOfOmxsI92hjb4tAIlSyyvFND9htAo4vBlngoxkuZWxubqRZQI75egAEim4YfusttT18mpLWrj4xrgohkf32rLE/uuSNkhEE2dKMDbAQVIw/ss/HZiprkW7xZbdndh/EprrfA5v+La3LA0hOIYSrBYd94Xz18SqojDobVUtm4IEEGQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11242ac-e342-4f14-3f93-08d88745b604
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:01:15.1168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MyT0Jwh7XwNAO9euKGu5ZJW+2MCG6o2k83cSxPj5rWBhw2YtYf8AB3V4LJXkUjwumXsi7pW63DNJ94YBlt+zoEdiOAmVMB8G2yCtgNWdTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
Content-Type: multipart/alternative;
 boundary="------------622B8DAF158B2D8C7C41F311"
Content-Language: en-US

--------------622B8DAF158B2D8C7C41F311
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/20 2:21 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Gregory Anders <greg@gpanders.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb         |  1 +
>   .../python/python3-transitions_0.8.4.bb               | 11 +++++++++++
>   2 files changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 6a30619866..248abaff7b 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-pycurl \
>       gyp \
>       python3-jsonref \
> +    python3-transitions \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
> new file mode 100644
> index 0000000000..3da97ef95e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
> @@ -0,0 +1,11 @@
> +inherit pypi setuptools3
> +
> +SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
> +
> +SRC_URI = "https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ef07ea90015a296653a4b095837b0354"
> +SRC_URI[sha256sum] = "9a2841b24789dfd345267cb92e26b79da75fd03f6021d1a5222c71b5c9ae3c16"
> +
> +RDEPENDS_${PN} += "python3-six"
> --
> 2.29.2
>
>
> 
>

--------------622B8DAF158B2D8C7C41F311
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/9/20 2:21 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201109192143.3739442-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Gregory Anders <a class="moz-txt-link-rfc2396E" href="mailto:greg@gpanders.com">&lt;greg@gpanders.com&gt;</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201109192143.3739442-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../python/python3-transitions_0.8.4.bb               | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6a30619866..248abaff7b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-pycurl \
     gyp \
     python3-jsonref \
+    python3-transitions \
 &quot;

 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
new file mode 100644
index 0000000000..3da97ef95e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
@@ -0,0 +1,11 @@
+inherit pypi setuptools3
+
+SUMMARY = &quot;A lightweight, object-oriented Python state machine implementation with many extensions.&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39">&quot;file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz&quot;</a>
+SRC_URI[md5sum] = &quot;ef07ea90015a296653a4b095837b0354&quot;
+SRC_URI[sha256sum] = &quot;9a2841b24789dfd345267cb92e26b79da75fd03f6021d1a5222c71b5c9ae3c16&quot;
+
+RDEPENDS_${PN} += &quot;python3-six&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------622B8DAF158B2D8C7C41F311--
