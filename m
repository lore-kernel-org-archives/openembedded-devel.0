Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.45])
 by mx.groups.io with SMTP id smtpd.web12.1533.1594487921301350356
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2020 10:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Md7D82ew;
 spf=pass (domain: windriver.com, ip: 40.107.77.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUtY8CfO4z46RgzNXdgnbFe+35APAaTYhcx0kY3jby8cE0nAEQBG90Hye5dqOSZ9U8uhrcrEC93stPI8fpjtP8A9+Ce21PidqFTxB/x3MywpkojlCJNyNLFzZpDb7tMj6cNAI7qpM5vxsRbfHVL3X3OA/a6vfees+56PnD7RSKxNp2BpSnxWTBoamdVwVze7D1yofW/lP37fzMa9/UwH/BT2m/DACQrQpTwElzZvGcY2kF/4eXwkitnjN7hPFXvSauBehfZ9iq2iJ7PGjbCDVi5pAIWRw4PXvAn5hPsFPut/CuweXtIwo5fsCWDKTShlRGoR3KxkkHLJ+hEymUnXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iWLHsQjjn9Ct6XsSRhhY5prJUnKrrhVLxJ9QZaovHc=;
 b=k0IrgFNCKO/nLcHztwGrpixbNj3B9dcikjWZdpWkgoglvibxbckoU2tIPtMExRtq+PvSxNBUgeh+5FquSdZkQLEFYD+wuMNnTDa1X+hawXK751PkV02nEDcZfCaBnvPNvMVK7K90IEd6CHR6y49KV0hcz+bBoEHpObZ6rKKO/2mYK6AbfFrR1AxwwugygLua5BeSGFAzJ8lE8iaJv6t0qDnbecKo8tzbu/ExtaZXslbfG4CsTHGJodcuw0mMmOdajDP5N8FOb1TZI+midpq05l2iQxNahgZh/xI89jgtST52Ir3rALZdCCL52yFKBEI0WG8Q+IF8mgC8K2C+g6NNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iWLHsQjjn9Ct6XsSRhhY5prJUnKrrhVLxJ9QZaovHc=;
 b=Md7D82ew2OSKtO8sYssxmrPHWypUmvZ8/4OsepItI4SXFr76N6GNeuVHrpEeaF6kzndSPuOVWvTa0ZrlSzsKf/ivXhX4zSyhmz4JeSUh0tXxRM3nq88iSnZhfYdhoHO9f3t7dgnIhNf5zcu1BwuRAabSzUaKRRjdja8tTVDdt+o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2843.namprd11.prod.outlook.com (2603:10b6:5:c7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Sat, 11 Jul 2020 17:18:39 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Sat, 11 Jul 2020
 17:18:39 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-fastnumbers: Add new package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200710040109.22600-1-akuster808@gmail.com>
 <20200710040109.22600-2-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <593176c9-14de-41fe-0556-eb297f81d59f@windriver.com>
Date: Sat, 11 Jul 2020 13:18:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710040109.22600-2-akuster808@gmail.com>
X-ClientProxiedBy: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sat, 11 Jul 2020 17:18:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5373a769-b1de-4707-16b7-08d825be73b5
X-MS-TrafficTypeDiagnostic: DM6PR11MB2843:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2843DAE4F61AE20CCB90D3769F620@DM6PR11MB2843.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qgOiiMAiiuZWik2/lJ2l99whvtLBSMFJj+OTHTb9JgHUyW+2Bye0ERbLjF+ydzT8GGSsj8Q2F6YkCPxlBLx2k4xpmMkOze7xsqBlPY7AMuWeidK2IX2u8G3gGsXtZJCetq1eeg7IoLMD2rlU4AQCdLTkR3E2ijUvvYrxnWKRQlr/k6lRrZNgVnGkolt88VNAxK7JJpCbyfyrNVvS4MNkUpSV+yJdnHhhqSTNQoqKyCENAAyCkDBkQ5zhopCIRmYsXlHkp22fWoK0TUf8uly5TlOo16h02QOJTW48/rm5I1UX4eptU8GUTafHd64IGNOwl4yssKv5cMEfcE/GwILXbcF9f1arnXHvR31Z51KK5YemUPqN/yAAsiRSSI1D2018ovE0+ddMgBUK0Sj22T7IO3kPrb1ovKD/UCesiKrDvb9t/Z9wERiU4UtgZEXc71Oe8D/4uhlXyyTyM+Xxo09mWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39840400004)(346002)(376002)(136003)(396003)(26005)(66946007)(36756003)(31696002)(478600001)(86362001)(966005)(186003)(2906002)(53546011)(66476007)(66556008)(6486002)(31686004)(16526019)(5660300002)(33964004)(16576012)(52116002)(2616005)(8936002)(956004)(316002)(44832011)(166002)(8676002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DTmCiJKYbC2eUJc5z5YaJ2QOByTmao40+Ogr0/ge87E5HmRuA0MshNU+UYc8gSRqk3Ae6RIN+ioUhaxEpPi8vFUO+ulcdQ2UKrRvrw6e/dQidhWlDik7IVwWpEPzt/Iw7k16gzg1j9e37E3xzfpQZ157+r3DgIpLbU9TmrhU4GrxgpJLTn+W8T8BZZ0F+HN94QILIASkYNQ+Qoc+LuruTzVZQzkd0yoiJZsQepmbaK9P/e4HRd40E3eayPtdQKHz+TXKAipwycchAk/NnlHcltbB7Rsq6oroaxE+k3nE5qF7FojjU3GDRYmssh3FOrcNZReQTKmglwVzQlpkfMeZqqppWgYmt3xQzChVxRNg+nuzTYtIcQzymbm59ZOKk2InVUSegaoj2+gIFjEDCCVTC97Up6QTzOkZBw/7nwCNfIyROql3g0yWFh69W/tfXbClwncG/X/+H/1XmSv/BZ/k6QHw/b0BO39Id6YHIsly9T0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5373a769-b1de-4707-16b7-08d825be73b5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 17:18:39.0295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pb4dMY+2rOGPnmfbVldAL9e8TYeBtfiIbHWJOQhEBQ9HHqZeqjhS3ngVWsBWYsjTrQ3gXQDel5Wc3ftyDCeRAvyejFnpnr8vuc/9rabwiGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2843
Content-Type: multipart/alternative;
 boundary="------------75BB77A7B09E8592AEE0F3E7"
Content-Language: en-US

--------------75BB77A7B09E8592AEE0F3E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 12:01 AM, akuster wrote:
> rdep for natsort which is an rdep of croniter
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-fastnumbers_3.0.0.bb | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
> new file mode 100644
> index 0000000000..b0ecb9d560
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Super-fast and clean conversions to numbers."
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55"
> +
> +PYPI_PACKAGE = "fastnumbers"
> +SRC_URI[sha256sum] = "93ce2f9516fbf2bbf46c85e4abef783cc569e5fbbc665352efb9cdddbae517ec"
> +
> +inherit pypi setuptools3
>
> 

--------------75BB77A7B09E8592AEE0F3E7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 12:01 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710040109.22600-2-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">rdep for natsort which is an rdep of croniter

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200710040109.22600-2-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-fastnumbers_3.0.0.bb | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 9 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
new file mode 100644
index 0000000000..b0ecb9d560
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;Super-fast and clean conversions to numbers.&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55">&quot;file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;fastnumbers&quot;
&#43;SRC_URI[sha256sum] = &quot;93ce2f9516fbf2bbf46c85e4abef783cc569e5fbbc665352efb9cdddbae517ec&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------75BB77A7B09E8592AEE0F3E7--
