Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.62])
 by mx.groups.io with SMTP id smtpd.web12.2162.1591114372754774022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 09:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cpvocJZA;
 spf=pass (domain: windriver.com, ip: 40.107.93.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEHdV49S1pqTaexLuotY10uiGooGpXJhSR23zrPZgrmJXXYmaZUGeyJuKZVCBjmKW8xAiLIh6n3JY/MLCzTO7pCDsU/0/tlpFHpvOfE0CPHRFRbqKfJXD0nnN8dSE8Lk1ZL8OT8wSrqWNoX414C7CVBQMvMn7L/dY0ZgBH5GHtEGeDz8BHzVySKNxJhs//ktp9ORJBpF1pSF9e9//O/1PsCEwpUz6Xcl+hZ2CainP5hOAjtlQ+pkS1dhEeeK8VAWmf84NewP2t9HgDn+G4b6FIDmNatsLtSsLN4nPv1t77ek9b7835qbjPbSko9Q7v+oG0+0c+FgR0F8gTsEnxS/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow0YOMsj+0WaGdBQgSrmJcfPdxaKpl1CammKOihEY7k=;
 b=kmpAjLUaixbx2igsKnhzhIAZ0GwMUZosyjnzgxaUDPfLrsyBPIV6Q6SsGsh3IerAF8AVYIvcLsz94m+SC51M3fLmA/ecrmT835okuHQrjL+bAD/cNosUVUl1yQeRDpwnJiKBI9eebCgagOMDmMKA6lTp7ncbGXqbu6dbDL05lmpGe3X6tawVVeczsFGlBbAY19p0C+Uop/gpuij1gx/C1qVGbRzL+670GYDoBzQmQjUAYavXUp3jWwRo/zHVp2F2E7cSVC6ZFfjeJahYYvA6oPzqWyrdP7SaEiSTuYg52GZrbsdXU+Xn0fnz2GDY+FW5ob/gLilDg0GxTEwRUIogcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow0YOMsj+0WaGdBQgSrmJcfPdxaKpl1CammKOihEY7k=;
 b=cpvocJZA9avh/7xYbB1EPRxJqFe93LupMjlMhbsi/ch6CRnz7EYZJbQ4f+ZTdP0dLwYU4uR1pfOR5oE5CpGve1TMw/swm5XlTgniyL0/WjuJ57ahL4SQ8G4NHfRFTeGrAutMVNvv2Ckc1jfYFyjixDnicxv3Bhf//33m/Tb9kjQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1491.namprd11.prod.outlook.com (2603:10b6:405:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 16:12:51 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:12:51 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-tzlocal: Upgrade 2.0.0 -> 2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200601120419.13396-1-leon.anavi@konsulko.com>
 <20200601120419.13396-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <97da0748-10fe-2f08-79c2-006220de5368@windriver.com>
Date: Tue, 2 Jun 2020 12:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200601120419.13396-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Tue, 2 Jun 2020 16:12:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbfe2e8a-33fb-4820-cadf-08d8070fcca3
X-MS-TrafficTypeDiagnostic: BN6PR11MB1491:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB14916F99501C9B5BFFC483F29F8B0@BN6PR11MB1491.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k4sRIdEHOF+WvnFdkz/WcYoi7E7+gbD015mRoorKFKTe4EjVp5rgtx1Gk+hRY1YIpzUoPhsGOcQzf/X8JjD2gNx4/ZOD6zi80fka3c8ParYnglLc8PPNafIYU3VIWhDltDHohTwmtIH6Xu9YYVIU+vfR0+PPNlPc83y0Bgn+NsNBKLH6l/P5Wp0vEF6OAQxHUJ9qrVLSwY843ZPRBtpXRqxX85KfM9QkacRTg/L3xZG3vMwR7REcmZYmqkMFgeiQKtDU5iUXmCe9tiBu2Y4J6W9l0M9AchLpqYDIthaGyllqVQ4/BcM/lkwosZeftx4MhP99H+MsfiMCUTNYeFuRmapn/Qc8f7EymoT738oKPF7opYysUf64cZMorJRbtdTj0lz74i7DWcnEtVj/6mlbwmUfxDJoNdDXJrjINRFuZFg2caum1dod65de21BaBnSh6o2gkZxL6kczmBxoHgB/mQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(396003)(39850400004)(136003)(366004)(186003)(16526019)(53546011)(33964004)(6486002)(966005)(52116002)(36756003)(66556008)(86362001)(26005)(31696002)(66476007)(2616005)(956004)(66946007)(8936002)(44832011)(5660300002)(478600001)(316002)(31686004)(8676002)(83380400001)(2906002)(16576012)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cD4p2AkxQ++1iXkpuTa4Ftm1GpsFEMfBOr5nkhKIiUpCB4k5XFjziX57xmqY1UYWnJAaz60P8DnWZPgou8QYHOebeSfryASuHvhfyBl4a2vob9S1hXYKzv9Dis1wLuF95/xH9TXhkGexhicrY8czu9EMm4uoG19TENEmt+cbAoEu2/dX6rZ/QhPfaGpjvtytdywwl7tvoQ6aEyju4MvI7jU541fIWmceGqKHq0Fn6zt7+8Smck3gDwSMVLssmWIrVS8FLN/9icZesBHgNgpIIIZXm/ZydYrUV/fqY1XgVwIm/NbAuO5ognyQ7FChmYD1KiF0vQwFa2ZOcdNY5kL8qvUKrGqh4EvlireOiIZWF046cGWsDMQQ//S9kCayzlHLG3uBZ5lsJhAG7J7zLouc1s9zKuXMG3OyKZ7TSXkqqeeLRs3wvau2pjyqqXd+jityMdNzZOj2PRwV7ESfn1M86faac0x3uss5iqpqh/NJCr4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfe2e8a-33fb-4820-cadf-08d8070fcca3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:12:51.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oSzdykxnNO9c/I5DX7+LZXPEF02t9Q9fIc0Wk6O+B15g00yyo8BYPeyflXaAI5SoLOZcgiWHLFtmyfbVEMecCdq3kq/Ne4/9AYBnxROsdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1491
Content-Type: multipart/alternative;
 boundary="------------AC328611DEC849133D657E50"
Content-Language: en-US

--------------AC328611DEC849133D657E50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/20 8:04 AM, Leon Anavi wrote:
> Upgrade to release 2.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-tzlocal_2.0.0.bb => python3-tzlocal_2.1.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tzlocal_2.0.0.bb => python3-tzlocal_2.1.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb b/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
> index 3573b29f0..56a8fc06f 100644
> --- a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
>   
> -SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"
> -SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590"
> +SRC_URI[md5sum] = "c0877603ff9de71cd8ca6ee2b50d2ebd"
> +SRC_URI[sha256sum] = "643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44"
>   
>   inherit pypi setuptools3
>
> 

--------------AC328611DEC849133D657E50
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/20 8:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200601120419.13396-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200601120419.13396-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-tzlocal_2.0.0.bb =&gt; python3-tzlocal_2.1.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_2.0.0.bb =&gt; python3-tzlocal_2.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb b/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
index 3573b29f0..56a8fc06f 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
@@ -3,7 &#43;3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/tzlocal/">&quot;https://pypi.org/project/tzlocal/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10">&quot;file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10&quot;</a>
 
-SRC_URI[md5sum] = &quot;b14262cecca16ec9220ca8dff2ca7c5d&quot;
-SRC_URI[sha256sum] = &quot;949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590&quot;
&#43;SRC_URI[md5sum] = &quot;c0877603ff9de71cd8ca6ee2b50d2ebd&quot;
&#43;SRC_URI[sha256sum] = &quot;643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AC328611DEC849133D657E50--
