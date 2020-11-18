Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.89])
 by mx.groups.io with SMTP id smtpd.web11.26409.1605714729240318366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RhYg0t9f;
 spf=pass (domain: windriver.com, ip: 40.107.236.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGCao6UGY+/qtKPFAvF9hcHr2tG+FPsReqyhsK4ARa950VNK/YacaXBGu2aJEW2/8wKL3Be6JOfTaY6uXDBMRMITwaCp3IaWXWnrpKQSmOi2AK9IXu53eJ6vDiDGjmJWwAguGNowBG6EB+gb5VEezUMZayDqBhHY/++y4ZO9S76Bg7bZW7RNEoV6Htr+1CAQM1+MtrkBtkeLp26um9nR4kDKxu0fncQNhYhiEPjY23rf6YatmhlQKDWj/i3Rd5/J/TpPrQ9surcDQEHCnCes/mI9lsQoStJHbSbLrA3UG+Pd27P0jOUD1HIZQxVNX+NwsCguK77j9pYS76vcQhO/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ak+EuSPjltPO2sDwAjfOeuu8iNgY2vHkLvNouLXiok=;
 b=VmrqCGJ6kKTtulUrIXlDo9VgY5b1u6Ol9JAHO2dnronmlaDRMO5JK4iqaMrd7jwZUn1NP32spoggRPKucODQ3pN+HjIa+FWEAbLxjKazvZWQI987mLKzafe+HDVItXMrHu0C5I1GV3xXu0a9Z3udiQyQtT6qEL0sXu3rLRGDBC3eMjVZ13GtkMTamkluIS0aVT+5Bt1vtJI3sigl7BpjhlfSsRTLjMK46aaqvIijDeYF3u17dKfVkobRg/pXb8exE8si9WSiH9g6dxwmZFs1gbhCG3wcljfsUk8+XZVqBK8rLxF7CMBuacsflq8PNzi9jqbXSJgBducZTlQd3xaACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ak+EuSPjltPO2sDwAjfOeuu8iNgY2vHkLvNouLXiok=;
 b=RhYg0t9fWIRHLXm2nKs17YS9vKVsNVn1uxZ+GvbycAd4/lz4a3N/UlID1hKuIUFPRhKCuzm8+e7/GdA823n/xdwLrhGHTLWD+41kq2xT5Yue/nekjcgRRJoXoxUcZgBFYOBi5Bi94WqWPfZFnwyHpxTSDy1WGz1Uxm2Ah93zsNw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:52:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:52:08 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-dill: Upgrade 0.3.2 -> 0.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
 <20201112105618.23773-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3e09a616-442e-0d1f-d9aa-87f5f5719519@windriver.com>
Date: Wed, 18 Nov 2020 10:52:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201112105618.23773-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:52:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1093e65-b822-43af-ee7a-08d88bd9e746
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26322A1E4BAA643403DF4A009FE10@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OL14YWGZ1cbTEYCU7EbPFmbbn2Yvuqb4Kwbf+3lorYFitFzK27D+x6QbU4RJrpS5cPuosdRrqEhGj198UzpmqRx8cTVsHCCMfDvMx5xMdxj2TgrlDp94l2x+hLnuNCRbicsxDzuZ/2vwxqWGkDevpQ9aw5/L54n3I0Jt8Ew+0AdjL6+Rn2Ugb7xq/jhtjIV/lzMsKh9c/kVUQKF+Pr6CGJopQrNtE3PTQKW3HvSQiqXFlaB4aD7S+Rhj7zxWP/M5+gcGu/LIFgT7fW3eVrozpw+69yMWVqJS0gNgTf4wEQQOqN1ST8sJXv3V+q9L4fe+/4YbLVvBQFRoH3e1XroZq0UTvkIjRJRFJ1P4lbmzT88OBPPun/4CAm5qXzfvT1oy85Vln5yieP8WqznmfROfwVZkPKNOQFIlxENXTSgTenI6qxr4O4kzwn4TJTpQZpec0cNM11agtx84077MnQg3VQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(39850400004)(346002)(53546011)(44832011)(86362001)(478600001)(966005)(33964004)(16576012)(31686004)(52116002)(316002)(83380400001)(2906002)(36756003)(16526019)(186003)(66946007)(4001150100001)(66556008)(66476007)(166002)(26005)(2616005)(6486002)(8676002)(956004)(31696002)(8936002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hnjq1CBGGX+a8TNgI3u0Ggfqt+dcnCvskdA43o3OkmT1eD9xi3671/l/gL3NKEv4G91FqATvZh1xkQ4so9zc1Hkh/CBykDxFD4pzmA2/eP6B16/7NpetdxW7BXzrkFZZDwQH4ahzzG4iPm38gM+9r7xKQTUV9m84FSCWLBvy/gkB2Ofc1Hq1F6ESer2O9FIgkYxH6dl0jyKaWF+s8+Oh0H7EfBXRHqhZ/ANRjRptHLSs4Adcj2Jhm7HB6j52yClAanjc897t6/QGGE9nG7PQU34pFo0ZnmeF+Qov9x7ZD/gXNbIYku7e4UuPyMJAYjOzqdqHUrff//BtbaCCB8K1esz+Vw7VYMHE08cKqc/gnNjd/Wf6qAFExTwHIOgfH6UoWMc+OfrqlhNOsBQQ/mSvFcsHFHfsZZRKHOWTEryfZ1McKXEYnTv5jozYHyXJELijOJ1oOzyu7AAfpZSun6DaBpWoFXuCej6oZq5GcSU9PVRusgOBBfPXisJVzJbeoqURmkyVxby8qvu7BMQ+aJCGrh0xeJ+cizHj45CtCAXeRwA9ZMbV/PQXGoMs2JKNfaOojRIVzaCPsjer4Gpi9JVT6dHItGUWI7bKf7c6HQcIjK7RgTiTreaQZ6Q/PzLyzDk/XxyLscP1wZbOyJPRMS0mcQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1093e65-b822-43af-ee7a-08d88bd9e746
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:52:07.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLaAl1iavxIi52cqvDsKbPdvpQYs4/pfsp0sSSqy3lfrzAwOh7WfJLsA16vF+XFLeBGUn/iL94M7vSezqrkGE5BDeFeE3J646ZcJDfoZyjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: multipart/alternative;
 boundary="------------6F29B28FD008E144FA0B441C"
Content-Language: en-US

--------------6F29B28FD008E144FA0B441C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-12 5:56 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.3.3:
>
> - Treat extension modules as built-in
> - Fix typo in README.md
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-dill_0.3.2.bb     |  9 ---------
>   .../recipes-devtools/python/python3-dill_0.3.3.bb     | 11 +++++++++++
>   2 files changed, 11 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
> deleted file mode 100644
> index b03e032669..0000000000
> --- a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -inherit pypi setuptools3
> -
> -SUMMARY = "Serialize all of python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip"
> -SRC_URI[md5sum] = "543607e0a419f154dca65265e87e4812"
> -SRC_URI[sha256sum] = "6e12da0d8e49c220e8d6e97ee8882002e624f1160289ce85ec2cc0a5246b3a2e"
> diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
> new file mode 100644
> index 0000000000..bf26ba30b5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Serialize all of python"
> +HOMEPAGE = "https://pypi.org/project/dill/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
> +
> +SRC_URI[md5sum] = "99c878e2e4e924f3234c0efcbcff6abf"
> +SRC_URI[sha256sum] = "efb7f6cb65dba7087c1e111bb5390291ba3616741f96840bfc75792a1a9b5ded"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE_EXT = "zip"
> --
> 2.17.1
>
>
> 
>

--------------6F29B28FD008E144FA0B441C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-12 5:56 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201112105618.23773-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.3.3:

- Treat extension modules as built-in
- Fix typo in README.md

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201112105618.23773-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-dill_0.3.2.bb     |  9 ---------
 .../recipes-devtools/python/python3-dill_0.3.3.bb     | 11 +++++++++++
 2 files changed, 11 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
deleted file mode 100644
index b03e032669..0000000000
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit pypi setuptools3
-
-SUMMARY = &quot;Serialize all of python&quot;
-LICENSE = &quot;BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de">&quot;file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de&quot;</a>
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip">&quot;https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip&quot;</a>
-SRC_URI[md5sum] = &quot;543607e0a419f154dca65265e87e4812&quot;
-SRC_URI[sha256sum] = &quot;6e12da0d8e49c220e8d6e97ee8882002e624f1160289ce85ec2cc0a5246b3a2e&quot;
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
new file mode 100644
index 0000000000..bf26ba30b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = &quot;Serialize all of python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/dill/">&quot;https://pypi.org/project/dill/&quot;</a>
+LICENSE = &quot;BSD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de">&quot;file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de&quot;</a>
+
+SRC_URI[md5sum] = &quot;99c878e2e4e924f3234c0efcbcff6abf&quot;
+SRC_URI[sha256sum] = &quot;efb7f6cb65dba7087c1e111bb5390291ba3616741f96840bfc75792a1a9b5ded&quot;
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = &quot;zip&quot;
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

--------------6F29B28FD008E144FA0B441C--
