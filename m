Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.60])
 by mx.groups.io with SMTP id smtpd.web11.10173.1605211208011874785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gWAGXS53;
 spf=pass (domain: windriver.com, ip: 40.107.236.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKxvqkMmxXOCsQmCNVRXpQpQQV7l2vgBb4Fq1sxwuCFqgX267SiPyXtD0wjYym+c00NtJxbPk9fbUjEzjOwb1oLXr0VR3Y5sRQE9gLyGpMWtRI47xhKqaraP2e4BP6wuWcpHTGkcVHi5UpV4ZH+Rz//iz1a4O4z27VWyN2Sx7xSaeeaIJO+r41BJiUfBZeKjVLGLxxiGUlRXFYbFUI8U6d2WKaTnVObik34RYmjpDja7CvDV6h1b6PICquLmhUu6O56mHU4BVGjB6BPPGVKoI0yQHz4216xIkffim64J4deozO296qvVKB2Iz1cO7IPqWfpBXupqZDqA45vTofZgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTiFpUAbDG3kMRh69BRQlcp9wUTKikycaIgbqCSkOlo=;
 b=BtrKHUHfxVu+VrD57r2qVtEU8kc9zT1ZyTn0PX/BTXwib9ndM7FwizYKrUp9ekdnt2+m4krCm5BV5newhYQWs5XRI9AS+7wA4TbojjCRjD8iS6jEDq8m2UU177feksYzkSaCxWA5YB7yvOMZGVC/6ngw/bY1enEi7q7TGzzG9srvPKivXlwq6r4JZ2eJmwVFp3yeAkb2Ra4BJRtrpU76ds9DtYJ7FhrmWoWbBf21bjX3RG6OzZSOhCrYsEgG6QPDnl1hwecT55mL8q0DlvpFf1pB8kbmtJyEko3eEkoVDwAVy/KppwppZ6ph4+23nP3XPhJFqk0YHETeRKUoBFImuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTiFpUAbDG3kMRh69BRQlcp9wUTKikycaIgbqCSkOlo=;
 b=gWAGXS53NB8FsaccXQm0ICY6rrxCYnDcj7jzIUvo4srWS//VwipB/rqqSMlCwWSXtnpUYLHCc7yMYSKxioBWYoiQFmjZWRFrglVQfaVKK9z4LiqNEYd5nobbS6S+ZqU/4myxoun1HVdNa7+m/kzE+Pm0XRmlh8gyDElG2BFi69g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:00:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:00:05 +0000
Subject: Re: [oe] [meta-python][PATCH v3] Add python3-cvxopt
To: Gregory Anders <greg@gpanders.com>,
 openembedded-devel@lists.openembedded.org
References: <20201109190048.26694-1-greg@gpanders.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d810bd94-3812-683c-ed2c-1e81c91dc723@windriver.com>
Date: Thu, 12 Nov 2020 15:00:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201109190048.26694-1-greg@gpanders.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:00:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1d529d3-45ac-4370-cabf-08d887458ca1
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4960:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB49604EFF7C6F47617E0763E49FE70@SJ0PR11MB4960.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iHH8/4X9KeopJwJEEocq7O8EvIv5k78Z89OArUH0MY+y+dR3N6mVI4opRh5nTTLGIJ3vWgMktTrjJW9oFXK3QXDr/Cvk23SDM/0HWW40v7/FM9E/YdR/uBb3yDEYnk5MxDRkEZGzhdCI66klZ+aSkzuY2rrE8WEF+Dgd24vOEzDdpHmyyw1ddIfPz+FqC+HsuzeOG0RNVk+edEr+wSWv/V327lwHZxO5uCyCa/9uZxnYRWtuy9jWw85pcLMqpH2+on189xQcS7w4jwDAVju31oNFvmnFBt2PEzVHruldKZ2EFhkrEoQ5TAs1spcjZLK5p+D23Aczk0y9zmNNRV3H3KkI8GA1HfoeohuCuUQQDHAAAch64f4+9fWO4GnEPLMoCnugfWOLN2RiJRrA1zO1/271ZioM0UKrA0xfk4E6eEQzuSqpKLX95RUKlZ40QmaWNP28cNfEzPu53TyHPUVhWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(86362001)(16576012)(166002)(31696002)(53546011)(6486002)(8676002)(26005)(2906002)(66946007)(966005)(44832011)(186003)(16526019)(316002)(8936002)(31686004)(956004)(66556008)(478600001)(2616005)(52116002)(83380400001)(33964004)(36756003)(66476007)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gkRVEL/NPJLruHxLRNCcIkJoGmuBzA5kUrSMm8Lq2JrSNDdonp/8elB9ZOj3/K2sA3WX9Fcq2/X/USyCn97PgbGOBVOn5Dz3aHxZaCvpQS2T1jjgil2OAzWhgtESHImYRP9nuQyWDe/7hJtHcSQuRpqspP8YkmKFFk+o3LXxyttVs7FUleL97VdBFTxyv8i8Hp3rIJC2aA4t0WFPPbqICChj76FwmpyAw+byLCadrc+1axmwqJroDP7pQ78u/dUL5QLZonG/2CSxEPU+PwEp5USrGTNHAQauvo+67pcQ69AkOZPfjAtT1yvbDt3JgeLc/B61aZDWxhfwIIt+Q9tmoSQOrP/KAXvNJZKkTcq2v+Uyi5wyf9i6KUQ7oApRzmdHXYseMONgrCaeBEPiBMJG/GcGn5I8AXTgaQzNc6en83aB254ZpCgtaL+NW0aeNRIk0eaPRHKAO/Ofmb7SY55jvW4zBIl/UmB1XASMBqM8eep014XTs9FP/EBoqYBoG0+R9rNpjNbTCqhc1O7s1usciiQptIwNEoeSAb9aDi/P7f65OpyH268JlEHysSp8ibgK96ljjWw2MGgYmjAPBcmvspnAO/455OgtPTrjdXdAMN2XSF0w6Qh7yHYP2LLYE/5bgbu6NoR+XgvBxhVLUoTjyw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d529d3-45ac-4370-cabf-08d887458ca1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:00:05.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7AuFaGp4Cu5m+J3Nh4tDLpIyKX22AyPDwDlBzygxGsoUoOFaFHj7i03lzQZMQ+Op7Hhn7im9jygDN+VrQtBu45a5z/i8Y1tGyQJHjUZ7gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
Content-Type: multipart/alternative;
 boundary="------------4C25DEEEBAB114FD18CA7850"
Content-Language: en-US

--------------4C25DEEEBAB114FD18CA7850
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/20 2:00 PM, Gregory Anders wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> ---
> * Remove superfluous PV definition (not needed when version is in the
>    recipe name)
> * Use actual git revision instead of tag name for SRCREV

This patch appears to be good, but there's no sign-off here. Can you 
re-submit with your sign-off added?

For example, mine would be "Signed-off-by: Trevor Gamblin 
<trevor.gamblin@windriver.com>"

You should be able to generate it automatically with git using the -s 
option when you create or amend the commit.

>
>   .../packagegroups/packagegroup-meta-python.bb |  1 +
>   .../python/python3-cvxopt_1.2.5.bb            | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 6a3061986..0120fb873 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-pycurl \
>       gyp \
>       python3-jsonref \
> +    python3-cvxopt \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> new file mode 100644
> index 000000000..b440d62bd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Convex optimization package"
> +HOMEPAGE = "http://cvxopt.org"
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
> +
> +SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
> +
> +SRCREV = "5b59d87007bf6fdea464e14875543b35255b84b2"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "lapack suitesparse"
> +DEPENDS += "lapack suitesparse"
> +
> +inherit setuptools3
> +
> +export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
> --
> 2.29.2
>
>
> 
>

--------------4C25DEEEBAB114FD18CA7850
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/9/20 2:00 PM, Gregory Anders
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201109190048.26694-1-greg@gpanders.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

---
* Remove superfluous PV definition (not needed when version is in the
  recipe name)
* Use actual git revision instead of tag name for SRCREV</pre>
    </blockquote>
    <p>This patch appears to be good, but there's no sign-off here. Can
      you re-submit with your sign-off added?</p>
    <p>For example, mine would be &quot;Signed-off-by: Trevor Gamblin
      <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>&quot;</p>
    <p>You should be able to generate it automatically with git using
      the -s option when you create or amend the commit.<br>
    </p>
    <blockquote type="cite" cite="mid:20201109190048.26694-1-greg@gpanders.com">
      <pre class="moz-quote-pre" wrap="">

 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-cvxopt_1.2.5.bb            | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6a3061986..0120fb873 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-pycurl \
     gyp \
     python3-jsonref \
+    python3-cvxopt \
 &quot;

 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
new file mode 100644
index 000000000..b440d62bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
@@ -0,0 +1,19 @@
+SUMMARY = &quot;Convex optimization package&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://cvxopt.org">&quot;http://cvxopt.org&quot;</a>
+LICENSE = &quot;GPL-3.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21">&quot;file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21&quot;</a>
+
+SRC_URI = &quot;git://github.com/cvxopt/cvxopt;protocol=https&quot;
+
+SRCREV = &quot;5b59d87007bf6fdea464e14875543b35255b84b2&quot;
+
+S = &quot;${WORKDIR}/git&quot;
+
+RDEPENDS_${PN} += &quot;lapack suitesparse&quot;
+DEPENDS += &quot;lapack suitesparse&quot;
+
+inherit setuptools3
+
+export CVXOPT_BLAS_LIB_DIR = &quot;${STAGING_LIBDIR}&quot;
+export CVXOPT_SUITESPARSE_LIB_DIR = &quot;${STAGING_LIBDIR}&quot;
+export CVXOPT_SUITESPARSE_INC_DIR = &quot;${STAGING_INCDIR}&quot;
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

--------------4C25DEEEBAB114FD18CA7850--
