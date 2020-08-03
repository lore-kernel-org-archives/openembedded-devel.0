Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.56])
 by mx.groups.io with SMTP id smtpd.web11.6656.1596490892969045491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YvnQoK6L;
 spf=pass (domain: windriver.com, ip: 40.107.220.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwdO99w50Hsa4La4Kt0ZttbasgUU62WVo3x5fsv6jAYlelqM6KbJY5ExmXbqAScahGwpPimnX4jFUwEtQuXX+4B6JYB65q1kuAmLZvLw470aHNCPqVehY4BaKggbjZwjqL2ywMiT6BGn6wSTPS1rAHWEDZ3bHmSmx5EoCFzV1sq2pleGXOJfHv7jjxwXUdI7iiaiCR5mBC43yx5z0pZBZeDF2h9CVw6KDYPFsjyE07EegmFOVdJc0HtDdzrligHLNsnn8xeOB2QcmAJG7Z1iCgOxsTgxz9c+XBxrTFTI7CbP8p45XES3/BLbe58SGRc2NGSFEU4csXNvi2YUNW+5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpBLiljvAjhDG9DmiPbHlM+ixVs2wy1eL+DUtdcZYM8=;
 b=abT0AsBG3PvDf8+w3+kEsH7nZTrcV78PQqyaFX5j7YiQgHPegyQfcmKyHUA82JebfwQw0Bus0DPSb1+A0qiOrne5WUxqanJ4NiwE4QlCl/LY+9JPkkE5je8uedBJfunVx+q21kJfUG4uhs9qriUJvF2fB5xcsuScaPcKznWQOP0RCu0QZyu4UdadEZoSn9Hl/8tyHl8Go7kNzkZ5g3osLNgb13zHXu/RpXsMCglDN42mO5ZPrc4lfEDjDZDJ+xLOwvhPOKX2/3ObKmgMTY5a7kqC215uAkRXYAZG6kaeYBPyKN0LjFp8NWMNG1NIpN6xOfqNFxEjKmA+Ve/ocXCFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpBLiljvAjhDG9DmiPbHlM+ixVs2wy1eL+DUtdcZYM8=;
 b=YvnQoK6LTnBAIOtMDd8NfJfpvm/40/YDcB5VFYhSHtDBT1nGKqrTRA1gzIriTrHE+TJzyS46VORhpDbeB0BKvCeArSGrV2+pMkNlRc0rH8BrmzmCnftcf/UyeX7UCHfYfKKUzsh+Ez6ZzHLggDK5MFyzX7cCWNK/pk16LDimfNc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2677.namprd11.prod.outlook.com (2603:10b6:a02:cd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Mon, 3 Aug
 2020 21:41:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:41:30 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-paramiko: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200731201848.484776-1-raj.khem@gmail.com>
 <20200731201848.484776-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4953baa3-9a80-6ebf-0dea-9aff6c5d781c@windriver.com>
Date: Mon, 3 Aug 2020 17:41:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731201848.484776-2-raj.khem@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 21:41:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b89160-782b-4112-197f-08d837f5fbce
X-MS-TrafficTypeDiagnostic: BYAPR11MB2677:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB267702B236453AE78CC468119F4D0@BYAPR11MB2677.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SmKeOGV1nQ5vUCV3shTeb20Kakzh0An3QysKdr37RXNVLV/D3LbWCTCnXPidNuij/W+dNAeRZwy+SUEMUwBA3WWZyeZjjkaLoGIDqaXAObe61ypGkBN7mgppTTvDQOm938wquhIU1pnxN+wUr3JzEAvqLNOSW9FPQocbYgIiImTkhF8R2RX3acu/D8L0DUjlNcxvO55RFvS/yhM5gzYyvPzpZ9IsYA0m5CkElqGJUp/xrxtbPtaH9mAb4p8p4cqkVN2eVZkzPkb4CZ5Kcx384mj4fgUeU8RPjXBeUYo/vT3Ws340L8oTdTlot1TTR/Jv7Bhz+/ZJwdVJQ9y7EgVTsxXyKV6cFWZhD0EHp/JrUWiTKtAA0NhM/vGxAQv0ATkQRju3Kwlb5329t4VZNDU6t+jtnXEwvdnOPWIbL7ekA12E24nnmIKLlXIBerjfsWi2IiWQkg/zQegjJxusJQ63CQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(16576012)(316002)(44832011)(83380400001)(8936002)(2616005)(956004)(8676002)(966005)(86362001)(31686004)(4326008)(16526019)(186003)(6486002)(36756003)(166002)(478600001)(31696002)(26005)(33964004)(2906002)(66476007)(66556008)(53546011)(66946007)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5naYscuQ4XoiTaHDcSN1/v/AWM76Sgq7UH/uYVYUe5COq1oyBbtsuPz2A2m/bO/JsJvevJwUHp+EFK3nsyLmgCyPTQs2X30h6MZRFuPL1Ol2tpZTJ5YiwDivvIT1rtlUaDb8YkWCRvSOlLeVyx/6JtfiNkUZEz2Sl79cjOLgqCumltj0ofBujlVmIiL779z+FnErdJBCQf45YwcZxbKZ/CmSOqRwEjcMX1y60M80c69cu4wlkUXEzUQyY5sZrcX16OvcDgOd/PrG1bpUjdCYq96ipGQvrQSqmTxzk84Dxf7Q4tQ9S+ZvxkQimxjqgCWZnDSz2HqXLyxpZhZJVnKARbb5hHF3V8XdEJEa4GMtE2soqdo3+00OTDJWsrNE+00XSjhFSEesShGCf7dnJr5JKPlnQtn93hJDjfDr6PBp9euaF/spru64sR6xUiQPItrLyXPyvGU8+YGIwQekeFix9Cs7xa1w33O5J5Zcr8PfefTkFm9BwKolGOzTwU7ewQG1DoXkykSy5nGSxW/vz3zeY9OodZHdtlIrfbiufvBU5QwjnilhZxa8tA72E2rOM9HkTUupNkLv2lvHE7D+byFX9TSdVT2x/m48WJ7dYHuu1eLug/KtIpFeOveAHDMjwykfSKzPeFinatJuDAy7mOhRsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b89160-782b-4112-197f-08d837f5fbce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:41:30.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VzEeSeDsH6gowpQ/rDFJTjLFA2W/N0RU/T1XBNH/vDl6BSbXrAfr3zbWJTwDqjlGu1EJNjGMI464uBh827w/vNHa5vmxAyXD0i2pLL1CHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2677
Content-Type: multipart/alternative;
 boundary="------------4ADEBA18AF8727BA596BFD7A"
Content-Language: en-US

--------------4ADEBA18AF8727BA596BFD7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 4:18 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Created Python3 recipe for paramiko.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../python/python3-paramiko_2.7.1.bb               | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
> new file mode 100644
> index 0000000000..0ead23608a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "The leading native Python SSHv2 protocol library."
> +HOMEPAGE = "https://github.com/paramiko/paramiko/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
> +
> +SRC_URI[md5sum] = "bf8239dc820ca86dd3c3226f4281c35f"
> +SRC_URI[sha256sum] = "920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f"
> +
> +PYPI_PACKAGE = "paramiko"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
>
> 

--------------4ADEBA18AF8727BA596BFD7A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 4:18 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731201848.484776-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200731201848.484776-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Created Python3 recipe for paramiko.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 .../python/python3-paramiko_2.7.1.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
new file mode 100644
index 0000000000..0ead23608a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = &quot;The leading native Python SSHv2 protocol library.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/paramiko/paramiko/">&quot;https://github.com/paramiko/paramiko/&quot;</a>
+LICENSE = &quot;LGPL-2.1&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5">&quot;file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5&quot;</a>
+
+SRC_URI[md5sum] = &quot;bf8239dc820ca86dd3c3226f4281c35f&quot;
+SRC_URI[sha256sum] = &quot;920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f&quot;
+
+PYPI_PACKAGE = &quot;paramiko&quot;
+
+inherit pypi setuptools3
+
+CLEANBROKEN = &quot;1&quot;
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4ADEBA18AF8727BA596BFD7A--
