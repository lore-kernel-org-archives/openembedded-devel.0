Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.71])
 by mx.groups.io with SMTP id smtpd.web10.2292.1591139748499947310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 16:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gTP78vrm;
 spf=pass (domain: windriver.com, ip: 40.107.237.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AP5OvAI45GRMXz7ZuFfg3TaaJfY2UcXiJGxVlmmhHTl1e9s6gzSY6rTrxgW2EHh7P/nEVvEEJoU80K9OyWMfbAKMaE9Vbs7LloPrQTSf7yB8Aq1KUTcsTVlXvjovm61F4hs7zUF3OXVJlLRoZ3vw830OnPMKTFZGNnQb6C0JBKDtC/wGivBaJ+wZsJH5smMNBcZbl+MwF97HIG/0AIZHlSUTEMB7pF9wvWDZAFGuoLzHsxdspz6MWnQ1KsiuDHeHognsFlFgvdudsIcrKnCETU3xJyE5tfP4B7bfTkSB22YUehJkWU2sMrUa77fMyzpKAIokNw9Vo0WQvobhBssGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3gpojkRhyXtnS/EHIw9IFaVDDFroX9gY5CPaY5VPpQ=;
 b=bBua6beFECftzySphJfg8LkPu4q234qgAVvvu+sLj56cTFnVTFYGgIiKJnixUgfjGghGeLd5oDt/5qCqDcuOsw8mPhkHW+sP0HZN2/vy5TrYgg6ScbS6X8mEBNnT3qK3tbnyscQCTqiRJR29vnmbhAea7BUWFUstvxCR3wD6gMIPqjaTSa8xy0QbWc6eKoSZ2uwbaLztHpg64HoIipUib/EDPrIju4irg5Jd1AL8v/rLYh4eXeTntAzNzPMRtaMUB9vhS159/7x5Xx+Cg1YZ8AKBqi2FhOss+KIljRr6YFJrBZzJ7ABDBtcaLsgS0kB3IrR5zyXe42L5xUuqge9cBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3gpojkRhyXtnS/EHIw9IFaVDDFroX9gY5CPaY5VPpQ=;
 b=gTP78vrmIqmmG1/dZ+heHJ+D1K/E/9u4UtDZxR01ZcH0HNqNVhBynL60SOF8GKnO4DWURl2xRxdQrwikkFpS8zVz1y8z2h0v8eAiK8LECCe51NpTq/N5Tk1aQfMElk/WZncQYvvPHvJRnPdX0E8KNOhafY9r26x/ddvFG0Xfn84=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4099.namprd11.prod.outlook.com (2603:10b6:405:82::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 23:15:47 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 23:15:47 +0000
Subject: Re: [oe] [meta-python][PATCHv3] python3-humanize: Upgrade 0.5.1 -> 2.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200602103815.21809-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <27a6170d-1b33-faed-3bc9-a89b0d253878@windriver.com>
Date: Tue, 2 Jun 2020 19:15:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200602103815.21809-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by BY3PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:254::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.7 via Frontend Transport; Tue, 2 Jun 2020 23:15:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e74e897a-c53a-4b50-a101-08d8074ae1a7
X-MS-TrafficTypeDiagnostic: BN6PR11MB4099:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4099DBEE829294A6572932509F8B0@BN6PR11MB4099.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nfGLb7JlrDm6NRP6iy/vF+UIX96eksBmIKITk/IQcVkn7wKZXxPHombOX/Q67WNC3UTqd2R1GQ8GAx85hIcrgM9aQ2jKlAP54cbsU6aTwLeKDtWMms1FVSU/bjYyWwkkd8N5upvVgxdrfcJeeTuv8IjRCqsnVUkjkTjhVxSGYqahrBKk01Xe4TGXKR7f3B7ADhPeM5/0ROZSRjt+uziAn38kn9wD/zPgfE/jyqw/tODPIZXCqUb8yb3iYzTtNTP23U9TMaajUzWVyALmr7+z11sU8Roo7XySCj7i0npGQZn+NxpZkzzQZWk0YmYwwNqJx5nR2fXLTWNm5Q2urmnpTw0fyioYArYrCOPNJjEsuJ7Culz0XS0eIoEn7d3bbfHrG0XZJlsjx9pDBFdjRBiBcakt1Iy6HoaeffrAWyPBrUZf007TXi0eIU5qEJpCGVYxjfSuJ3YzzBSQ+FLdmTNyn/SjvSJuNFX/RKrbSn2Cucg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(136003)(39850400004)(396003)(26005)(16576012)(956004)(2616005)(6486002)(53546011)(31686004)(6666004)(31696002)(316002)(166002)(83380400001)(8676002)(36756003)(33964004)(44832011)(8936002)(52116002)(86362001)(186003)(2906002)(966005)(66476007)(478600001)(5660300002)(19273905006)(66946007)(16526019)(66556008)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zttzPHChIMLP39B7I24muXmAcpBvBhrcImAVByQZeebzuEUYAKDkI96PWH2tmfsNefgV2aFVSwcXY+jRhSJF0PwcbuKYiyghMeXNoLn8Wrnbw4m9eBu2/pa0O/IvCix01RQxv9YZjIw9cag/sI13sQL8VyCZAZEeOqFmR1u6IdT3nNJP3yNJPqK6CqjrlZj5tv87sHuB3ulLu7ogvXBFv9x8CLQfD/GjmJ3fnVrlHbD5xfSJv8r+cIsGtTMLdu4rfkdYUJPQeDsV+MI6zqurmYTsKTJLM6SrwuksARGgPVfiZ/jgqk9sGCTxegn0mttg0K8bnxe3YIDBWltZtGAfJ1gvxA/uswf9IybVPIDnjnvSxEfjWsGjrq8eO6J/lVpwnGvfD3zDzPVu+Z1dwNcYgFbBiVSWzqTIOrqDVaujXkcsOPgZI4P7MmZl7qbasJRQGY08LDfI62HNmVSNXroRSrPl8ZQsi6fToEPPZO4lV9yzU7pSrQMmT/Su0rEeYz19
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74e897a-c53a-4b50-a101-08d8074ae1a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 23:15:47.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U00qYzFhFYcJjxPgKpXwRqdoILyUCfZGwFaxan+x+QTrUq+E1HHOfwpK+SOtbpewchJAmm4MPXLNKCdbVGDmS2Pce3J63/GSDJGX52rCT8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4099
Content-Type: multipart/alternative;
 boundary="------------BC6635BE745BC70A642FE00C"
Content-Language: en-US

--------------BC6635BE745BC70A642FE00C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/2/20 6:38 AM, Leon Anavi wrote:
> Upgrade to release 2.4.0 and consolidate into a single file.
> The year in file LICENCE has been recently updated therefore the
> checksum has been changed but it still remains a MIT License.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-humanize.inc                | 14 -------------
>   .../python/python3-humanize_0.5.1.bb          |  2 --
>   .../python/python3-humanize_2.4.0.bb          | 20 +++++++++++++++++++
>   3 files changed, 20 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-humanize.inc
>   delete mode 100644 meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-humanize.inc b/meta-python/recipes-devtools/python/python-humanize.inc
> deleted file mode 100644
> index 17a3449e7..000000000
> --- a/meta-python/recipes-devtools/python/python-humanize.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "Python humanize utilities"
> -HOMEPAGE = "http://github.com/jmoiron/humanize"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"
> -
> -SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"
> -SRC_URI[sha256sum] = "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
> deleted file mode 100644
> index 04464ac59..000000000
> --- a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-humanize.inc
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> new file mode 100644
> index 000000000..6bb6946ff
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Python humanize utilities"
> +HOMEPAGE = "http://github.com/jmoiron/humanize"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
> +
> +SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"
> +SRC_URI[sha256sum] = "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-setuptools-scm-native \
> +"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------BC6635BE745BC70A642FE00C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/2/20 6:38 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200602103815.21809-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.0 and consolidate into a single file.
The year in file LICENCE has been recently updated therefore the
checksum has been changed but it still remains a MIT License.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200602103815.21809-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-humanize.inc                | 14 -------------
 .../python/python3-humanize_0.5.1.bb          |  2 --
 .../python/python3-humanize_2.4.0.bb          | 20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 3 files changed, 20 insertions(&#43;), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-humanize.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-humanize.inc b/meta-python/recipes-devtools/python/python-humanize.inc
deleted file mode 100644
index 17a3449e7..000000000
--- a/meta-python/recipes-devtools/python/python-humanize.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-SUMMARY = &quot;Python humanize utilities&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e">&quot;file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e&quot;</a>
-
-SRC_URI[md5sum] = &quot;e8473d9dc1b220911cac2edd53b1d973&quot;
-SRC_URI[sha256sum] = &quot;a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19&quot;
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
deleted file mode 100644
index 04464ac59..000000000
--- a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit pypi setuptools3
-require python-humanize.inc
diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
new file mode 100644
index 000000000..6bb6946ff
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
@@ -0,0 &#43;1,20 @@
&#43;SUMMARY = &quot;Python humanize utilities&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
&#43;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;010e86a4196ed6030112e7bc681e7353&quot;
&#43;SRC_URI[sha256sum] = &quot;42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;DEPENDS &#43;= &quot;\
&#43;    ${PYTHON_PN}-setuptools-scm-native \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BC6635BE745BC70A642FE00C--
