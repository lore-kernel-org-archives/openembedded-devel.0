Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.77])
 by mx.groups.io with SMTP id smtpd.web10.12718.1598359289807095930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wmmw7DVp;
 spf=pass (domain: windriver.com, ip: 40.107.223.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzUrPJTAh8R0D0aIP3o3Grbw5YjzTXd+oNoFJTio0m0Oo3b/EBRqZ3Ra65TydCQKXheAPmR9rrscEjtK7HUFrHvk+ITNolcSixoRtEmmHBIa7LW99kioVcW0WjzGg/tFy7hjUATUEffbKfm7QIAed96cSn9/mmPrDl8Sivvf8tkBLMmzbaIGsLxyr60V2+z+421D4Y/x4HLBwP8OOSsJZgdEukYnaDKGcfW8jG+EW9ApMxQ0jIZlVKXDEknPHyKqdNYEeA5ZPPgoQQz49dFmg0gJ1WBV2EyNLgAtZVrvKrwU5ph7ecHn1i4NFCYiUVjHc3R0UYud95YlNQ2k8sPaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWz70cYXXQje96PJpJaJ3HjgD6iwrDhusGJ4j2SshbQ=;
 b=iHLxmPrJxqj7tjOuyOdYryC+W01Voz2K26QWHE8bpDfjDMd7rdo/t0XIeCfYiq53OHlltVCNgJJF8KuXzCl+1MSHZXZUhHqWSG29YYgz4Bt4V4G1yx3B4R9Uaaso1Ze/DUxh+s03z2R3EtE5kFlqNyFmeQYThsqkPk8Q9OYml7H88dsC+GyUlMKJ7sdMawp8DcXCgadI38AfZuklVZgUGwVxx0er+JyIiRAkGN1zzMsxjemLotzmhUR0QHIHTejSvNhGAi/SOhOQXD5ofDjHotMk5H0caCCIACfTohMSKklXIZuG0zeN2wF5LqK7M8+PlSp/OuPl8PAgvJBObdq4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWz70cYXXQje96PJpJaJ3HjgD6iwrDhusGJ4j2SshbQ=;
 b=Wmmw7DVpejPdpkpouq12aPHS5L+ahh3QvjJXQVVzmZL8ZoXdBOwQWR+xefuMG8jrvsw7hlCAuTV4i4xFHDjCixWqxxXoUkn2nvPrkNTq2/ziQo0ILTqnuw7dU950BzHklL6GvKDht7uk3lfaXA4V9kT6AT4Dj0iDTwcaa0Ub5W4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:41:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:41:28 +0000
Subject: Re: [oe] [meta-python][PATCH 05/11] python3-asciitree: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <752ca7f6-7d00-2d0b-09b8-db0da4ef0d20@windriver.com>
Date: Tue, 25 Aug 2020 08:41:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:41:28 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bcc70c6-b7ca-4970-9bd3-08d848f42fe0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260A9499121A4FB1921E9549F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UGL9UvzgtjTi9z2TDCe6Xbnh9GdkWUXdCu3egqx3JiK0Ud4teCC5tqHuvMq0bPVtNtCtcEU61xMwYKmoWoGwkAXXIi15MvzD6F/nrj7fjZ63DVGpr62kAsqF8ERd1pwSGURe95xDLW8G0zlEk6jCQUeHNuEOxy9t/TY9fPr5ivr8NXLoDiH5d5hlxlnupiM8hSBCBnNwRJ4oX2mDV03iTzC7O6V/cdytU22FPjXs8k7nDCxKawl8jsSUIBzM64vPLNkL+yOxVx5WcxRcXvdTeB83CSyn0k+2ZoYax/qCIXuhnYephGzERcEQ7G5Y+teNXxZ1Lux7UGSb1gELnOVudgikMRHr+TZZbo9ww8nGg6iuo3V2+tToJ56ae81xIxLB/iNew6lJeYby79Zweq1b6Qf2erb+0CxhPP4gTx8n1S2yVCmtfds4lALGGgpmMuocvyr0AXUKfQjM1wrQ/0rKLAR7DL/u4eeaWtnGbqpuPwI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(19273905006)(2906002)(8936002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Hma3/wy1yiiTwBAe9OWB4nFfjA8SgKZbg8mBCeYyhXI85PNkRvGTyO+bYIUIvSNFCTjocFS7u16GaE1RcjCfew8vEHprhMTsWGeKmFg5G+WyaKmWjszl5oSTL61yVwuYh9wrOuerysbkJpNfwddSTNgUOqVNCZ0IEZTLYJYVySp4yPJW1Wt/IrSJkIRrWY9lJNzkNkDX0PuMo4hxRWcqQ9mQvItQpypq8cUxQ1fZhbXd1/ynp8Njxa2cVMBLRRAeJvr1en0pMVU0sTPuphEoxBWDlXesFQP35RI+h73liKkCcVTAZICqDC6Y/Z0kJbqF/ObMnvUWT97n/vwp6OlZagHeloXO2lK4ENQ2E9Du4dm0EhcqUw+NYPbJGyu08qxsunuB8k7pIebLad1v+OzlYrJX+KLPc4M13yhEdwejwEmeU/O+YffoSncLwfyo/MVozS3wJrpJlwid3jUHgSLdjDURe0VqaWz2fCB3f+lm0mWmZjzMtYM1BZGfb26lZPTKoGbXelcqo2pm1x0QT/yjgDSZaUaCI2uua8/9aENdpDV4gKJLUDMGltbzmwUYc9lcr9Ezehp7oyOqkGKoC02CB5YujjaG9ATgy6iRCbCU7qGPdpnBdcgvTVpfJI9tsLY5OAflCJIBYsrAvnkyrFJb+g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcc70c6-b7ca-4970-9bd3-08d848f42fe0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:41:28.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bxlncj5b7Ip2ZRuNuBgUgqeF2HA74KYWpuguBUJDaJPOjIShBGgcZkA86+wos5Em+rUMxtArbUksAdBPk2TPqosNyy5lAJlCsr7cQeXsLwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------5B947522A7D031811928399C"
Content-Language: en-US

--------------5B947522A7D031811928399C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:44 PM, Leon Anavi wrote:
> Add recipe for asciitree that draws ASCII trees.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-asciitree_0.3.3.bb   | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
> new file mode 100644
> index 000000000..833732bd4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Draws ASCII trees."
> +HOMEPAGE = "http://github.com/mbr/asciitree"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73"
> +
> +SRC_URI[md5sum] = "2570b31e563b69da1aff54509db8ac6a"
> +SRC_URI[sha256sum] = "4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e"
> +
> +inherit pypi setuptools3
>
> 

--------------5B947522A7D031811928399C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:44 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for asciitree that draws ASCII trees.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-asciitree_0.3.3.bb   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
new file mode 100644
index 000000000..833732bd4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;Draws ASCII trees.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mbr/asciitree">&quot;http://github.com/mbr/asciitree&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73">&quot;file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73&quot;</a>
+
+SRC_URI[md5sum] = &quot;2570b31e563b69da1aff54509db8ac6a&quot;
+SRC_URI[sha256sum] = &quot;4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e&quot;
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

--------------5B947522A7D031811928399C--
