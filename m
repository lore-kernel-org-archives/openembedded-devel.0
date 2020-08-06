Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.60])
 by mx.groups.io with SMTP id smtpd.web12.5682.1596718805739956976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lWbhFNa1;
 spf=pass (domain: windriver.com, ip: 40.107.93.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvYxJz49qvwrBg6ZJbwIgSH3biSl2VoO/fuZ0hLZLXo8LlYItR4pWihBUBThSvV5QdCe9u/dO5WM1vZJySaXV0yKrvw5FN+SXOLEZ46OBnV3eTQdtZrZo3Cnr8FNFGljzLJPxk8h19hd5oa/l2ZHScIGRm7/cON+pi2DbfsfmFnruGC8dtWjm4J9tluUWg1xEue319cGov74lXyJHNnemA9MkqDM++ErCpFs9TBIs79863Jg695kedA6VyTpka0YXVJS5FNIh2fmzJ4iOF4w40aJVmN6AM4jZhPs7Ajee9Ehv5LSsQx++pEOy4oVO4Ey4v3mLTayTyuKZisKrXmZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkdsLRdXGF3s/RoJZu0qko+FqLsiDejO4Y4bFGntoQk=;
 b=KuUaohj+2sqDg2vG67jZjc8VdjT1/skDQMBxVvahVHXsibh/JN/CvZCCOTOUDhw/stTlldMD4JOD9ojA8CA70Qpz8mfLreianP22M9XG14vn9lKFwyw/J5f9/9pQTUfU1/zA21FebxsITZbPjP17YeuToOUYSl2+nhi/2359Z7K/Wj4c8AAYurhaslNsGGg+Vrry14xH99vlPvBYNmclSqlVdnH1uhW8EnadP14ny0vIIP6bz2StIcZMO8JyzFUQegln88DZF2jeY5SILxK8xjbbm5iSAzt6b5F8DyDDVebiQVrkgU5f4kVTYbhRMDZaTMSVUxpEoJEErCvKL0bTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkdsLRdXGF3s/RoJZu0qko+FqLsiDejO4Y4bFGntoQk=;
 b=lWbhFNa1XlDuwlO/gNF9EieBSR3t3k6972hV/YvGtqhby4FzvY3QjDZS0duC9qvbewYr+teKbGkQ/o4E+8cpzvM+Bs3+jPB/0a319RmK6x+gFNK94QEbciIFqrKc/mxNuCuOizLK/Fp3omIm8g7aWs1gEeAVnKNEdizKHrylPFU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:00:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:00:04 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pyalsaaudio: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
 <20200803095759.9591-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4fa52a42-1a37-5dd1-8a74-4e40c3a74aa4@windriver.com>
Date: Thu, 6 Aug 2020 09:00:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803095759.9591-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:00:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1626a302-35a4-47ac-81df-08d83a08a331
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430503F60AFD45CF2EC6ED699F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jhSFA3mw2RhZDk0MlTmmZQoCQsH6ZI6J8Gl+4ukpNzmppLAmHtjHxKqPPudQlncg81/XOrC527JS9hmRMNtznt0+HuFDQOKYSKfDlItp4b9Ejo629FsJJBZxyFXMSkJm3q/nhE8Es5iNVxb4eZcsak/1RA3giCM3gHjr2xTID82rwzCibkSnOn7j14fVvVJI1VAzdCzBAgXzYXlTTx1tyN0OPYiNdgOVcl7L4TSiabCMnVtTxn6cTCZmvhuzwshYnRZ/tpar9PdHz2JoxUmYyWFwIZ/KgxksY1P2RPuhu77Eke28QryDVxMgaoJXNSonKPXE/9QUZI3/cXc00QTQJ6ksveVL/PNdNFbi9MJHHqhxhhRtfbQ1mzosAOLOc324M/Gt4cZrq1Alv1YUGoAuK8YUTKOW1X9B+Lwro3qZsaPOPn/+xit6LgVNB+PintjnS1dyuctogGj/rGSPvA3RBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(6666004)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ucdyX1Pj6TASkEnN39MewGZGlgWFJa9pShUtCl1VjCECYvPns7SOTuRlUOq6zvVsRZUhXaYQ7X6hMW2ylUjuIHPWkNmPDowUEwHKMAlpMNxjH1UEFBlfbWEn4xl9vVQwBei8AgKSCSTdzkwy3LFCzLy6QwE+bMnZemQTRgZO1AuwxYourUus4GD6YdT1vjQoWuWS/TFxKnViUFopVre0j5M34vLkbavt10z8/JtmYdZAk1/xC5Ewl8K8UDVtvWxzTeVJK7XOqDT8jXMAZhoJSF07SiAaSRqGan4ZZhS1xedrYOgroip2B7MPH4Y5R0nBWSytLnX1geAXWMJKaQn7WF03R6A0wppYdDbieKqLjw8RosDty1OcStB9NtpPl930xEMsXudi348s14a7A4TpLox30NDBLpc5zjyxNI5CaAykW0301Xiji4ofsfoSCBBKeCytwnFfVLaBq/9xAwgnu1yyKPrUpjpSo+Y42/4L4onpqZAe2kjxkKOkWKSt+0BOTOzYJ21ZIF0scn8ENe4YtpoLpZ3i++irp0jUmq/dls9FOb59qruu1gg64yB/lsFMxbDv1F/jyxqNVG5M0rVnknjHbhSrWVyZFydnuqNfUk9ZT7xCfvuWcJOaNujlGVBDNuIE5A1WIFy8XdrZSaBWug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1626a302-35a4-47ac-81df-08d83a08a331
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:00:04.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUqGE31JqIpx2xYBaGOBZ61bJi23RJfX99c5UJqy+2bipZARYa+ygi3g6JaUXr7ZxQbFkJWzKpNiQO2VWnLpoqMevT0764xyWOJG3wqdfg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------47A6E96B9022079D7A67EAC4"
Content-Language: en-US

--------------47A6E96B9022079D7A67EAC4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 5:57 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pyalsaaudio.inc  | 11 -----------
>   .../python/python3-pyalsaaudio_0.8.4.bb             | 13 ++++++++++++-
>   2 files changed, 12 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc b/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
> deleted file mode 100644
> index d150409a2..000000000
> --- a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
> -SECTION = "devel/python"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
> -
> -SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
> -SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
> -
> -DEPENDS += "alsa-lib"
> -
> -RDEPENDS_${PN} += "libasound"
> diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
> index b7da1a43d..987010a14 100644
> --- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
> @@ -1,2 +1,13 @@
> -require python-pyalsaaudio.inc
> +SUMMARY = "ALSA bindings"
> +SECTION = "devel/python"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
> +
>   inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
> +SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
> +
> +DEPENDS += "alsa-lib"
> +
> +RDEPENDS_${PN} += "libasound"
>
> 

--------------47A6E96B9022079D7A67EAC4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 5:57 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803095759.9591-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803095759.9591-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pyalsaaudio.inc  | 11 -----------
 .../python/python3-pyalsaaudio_0.8.4.bb             | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio.inc

diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc b/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
deleted file mode 100644
index d150409a2..000000000
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = &quot;Support for the Linux 2.6.x ALSA Sound System&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d">&quot;file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d&quot;</a>
-
-SRC_URI[md5sum] = &quot;b46f69561bc85fc52e698b2440ca251e&quot;
-SRC_URI[sha256sum] = &quot;84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085&quot;
-
-DEPENDS += &quot;alsa-lib&quot;
-
-RDEPENDS_${PN} += &quot;libasound<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bbb/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bbindexb7da1a43d..987010a14100644---a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb+++b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb@@-1,2+1,13@@-requirepython-pyalsaaudio.inc+SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
index b7da1a43d..987010a14 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
@@ -1,2 +1,13 @@
-require python-pyalsaaudio.inc
+SUMMARY = &quot;</a>ALSA bindings&quot;
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;PSF&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d">&quot;file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d&quot;</a>
+
 inherit pypi setuptools3
+
+SRC_URI[md5sum] = &quot;b46f69561bc85fc52e698b2440ca251e&quot;
+SRC_URI[sha256sum] = &quot;84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085&quot;
+
+DEPENDS += &quot;alsa-lib&quot;
+
+RDEPENDS_${PN} += &quot;libasound&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------47A6E96B9022079D7A67EAC4--
