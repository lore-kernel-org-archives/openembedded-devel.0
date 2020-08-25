Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.48])
 by mx.groups.io with SMTP id smtpd.web10.12734.1598359332344975023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hh1ewYuL;
 spf=pass (domain: windriver.com, ip: 40.107.237.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZSBUwIfRSdoeTmYgA6FQo+tRMKBLvrpxmyohANedAcSGc+0ob7VpPp7aEHvNQ2fKx/ScXhs2QG8t2GpcA24SgZQF/3xljtCdmRtjrhjvlqzkth3mo0NpIMCmKowgZTZAqowYSF5jA4gj6GgCOc2THxXgVe8nqeo9aQZVxmvncvOFqDBE4qYKBg9o6Fzli5cdBeqyp55KK8Z7EsY06bCy5vnXZvYQaIphF4HkpyySbNxNeiOD+sdntx7Gz/MNeVAahz5lzyI0KzWs5vV6WDipgvybsYb9Q78d0SMRDfgOntg8Wd2OU2WascVTKfGSrvndHxbEpzwMT+GQSMEBSmvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkL42C5SAHx8tCTUeT+HSZGMxeDc205z/NY8uH/k8w4=;
 b=BxVbiY/NhrQ8le84mg3Y8xfQ841gZRlsqpL3SkfFBzqb3iq5dGnhFNunYWS9Crd9Ml58OWaW1BB3JiGLvcjsIp3qj86isWhsFtn3yNzeZp1YCCb7SWdIboYgksHDki0a6/Gijmw2CY8snGGtbJmg6n5CZTW6wefIJdCAL4Tp6KunMVlje+pnppRlUW7Ev97SHRAaP+Iat51GNd7OY2KksQkHZams4yOQhIeheQLsiNcUumvqes0NCMzK3u9ciK6Z0HZKQu4KqGjzGWlbseoS2PyQ6378UCUWqAImCbLdqMwiIcieXe7UynMzVeXx4O8Cqw7aD02HRGyZN0xI7Cxi0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkL42C5SAHx8tCTUeT+HSZGMxeDc205z/NY8uH/k8w4=;
 b=hh1ewYuLsStPzwTKDU2ijvLQ74JGQxsK9Ijh9dY1KrHl3OlPx3Z4JRaIRq4/hF60rIhn9TVICq3/p2sot8eUFiB+whBuEk2+sleQA1ZY+cEH7mGWPNokSvmYeazLGn0uUR6OFNaK6D/4WvkGzUOM6mmu450HAryWcWp11E+3xYQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:42:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:42:11 +0000
Subject: Re: [oe] [meta-python][PATCH 07/11] python3-nocasedict: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <df223842-f59f-9ebf-4018-55ee518ac103@windriver.com>
Date: Tue, 25 Aug 2020 08:42:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:42:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b4fd2c5-db5d-4f75-8c27-08d848f44908
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376621C617AFB5FA19AF15F99F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZIwIE9Mh/IzYtAcWg5L/J6Aspf/ximHOgFc+APJ7AuZaE4MusV+w5EuONnYsg/CuoBnt6MjsuEhn6dhJWFdHH0rypMNyy5D5Kkk7yRGwHrIjkFD9/Kp8/IjXU1wuImQXjyDiFbbITycDF2NFVM0qoET7Om+7SV7BE6LeiFLKJPbmYLPD2mYeStM+6tI5SEbocyl4t+TrVaxsjCHe5s0yk+46K5J4QS+0Tc//WmJjxjWyXzgYbf1iqRCo3L9Sd48e9Bv/JkR4iPmxBzNPWBN1qSEmLLkoHC63fU4/JO3mkb2Z0OtAzcdrnjSnL7ozDFE6HOtoJeGY85CGMvKEPe57+WeErLHGVT00slThpw3wLqZejBTOsSriZhLBF7spipvbr68ZXG+LY8sAs6HyuTzd1u9Kl7wRrkcELE5V76r6aWyY3inixoTxUevzL53w0b/4BCkdBXVGCbgINun84Sf2Yw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(6666004)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	O+S78vcEbssUpKMaPXXC05kI/fkoRkjU4hvtq59Iz82AgNauD61ZSnWaZh5ZFT3mzViTkpA3vprxx/yYoVrNWWiJSV7biLU08HGaKJOd5YB9l9CQhHV7srPdDChsA+E/Eb/+fT8Tf2jFwjw93C7y5ZYbfa4jZcaUYrBWIIp+RxcL90+ScsybLoEypULeh2N9D60l+p4pDxb2AiDeAeO4OMkKiNC9lWnrtwPhH6ANn0xRxvnpxoe205eX9q3AgK9MYxRt/chb4LMTc156N2nCR/NyQTZdZ/hTa6dhEUyeizKXw2vg6/CKqVdRSIV6EPeytAZU3kc7l7AAis6wjB/vA/YmHTF4M/WX9u503Nsqu6u5huk6Yrf17zvrqWpYNTtVprbLXBpujmzJvaQRvbTfxPI5x4KKkc930+OLRvGsWK8zDaRdeqmPmtrLUpy64vlIOllXl1oZ/GN3ZbzGBVUXmUOl0XNNchkVArw1gIG3FL/ztHhVALRcxnsuClQmOm4/Muf85IvBX1RVYKErX3xOFciwumd6vrWCb02OFCeG+lNG7E4DXKocJX+Dom25P/mgPVJdIhX7t1wdboYGTbBwlRZLl+C8Gcm5qHOnFOZt1vRhikvHFKUC71OJh4mmvEMmYGQSiFKmvcNr/4j+RfAufg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4fd2c5-db5d-4f75-8c27-08d848f44908
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:42:10.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+9z/G25TogVMzzU6k7yiesCcN4YcTIqb+GiMSZQh50Q+tGSamk7T1Ud4gN3ZLWFzuiV2OHZTcl3d4Aq6EChQ2e66Nr/Kv/rqwhC5vWd0j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------365D09B17878FCA56EB70A83"
Content-Language: en-US

--------------365D09B17878FCA56EB70A83
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:45 PM, Leon Anavi wrote:
> Add recipe for nocasedict, a case-insensitive ordered dictionary
> for Python.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-nocasedict_0.5.0.bb  | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
> new file mode 100644
> index 000000000..440cf5109
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "A case-insensitive ordered dictionary for Python"
> +HOMEPAGE = "https://github.com/pywbem/nocasedict"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
> +
> +SRC_URI[md5sum] = "b1037d65f1f73322c3c2d76681195bb3"
> +SRC_URI[sha256sum] = "ed74b83c7b81505ccaf4b09b0581477fdd5c1099c929098a6a170a91ec26fd33"
> +
> +inherit pypi setuptools3
>
> 

--------------365D09B17878FCA56EB70A83
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:45 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for nocasedict, a case-insensitive ordered dictionary
for Python.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-nocasedict_0.5.0.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
new file mode 100644
index 000000000..440cf5109
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;A case-insensitive ordered dictionary for Python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pywbem/nocasedict">&quot;https://github.com/pywbem/nocasedict&quot;</a>
+LICENSE = &quot;LGPLv2.1&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742">&quot;file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742&quot;</a>
+
+SRC_URI[md5sum] = &quot;b1037d65f1f73322c3c2d76681195bb3&quot;
+SRC_URI[sha256sum] = &quot;ed74b83c7b81505ccaf4b09b0581477fdd5c1099c929098a6a170a91ec26fd33&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------365D09B17878FCA56EB70A83--
