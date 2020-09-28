Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web12.36046.1601297918108628124
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PCP2XQkG;
 spf=pass (domain: windriver.com, ip: 40.107.92.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bypRelM5yOPLbgNaifkayU772kXQVYBtvsWMBC9S5CbTpInNqybuGaFliKHaq17PWvhbg9B+yrviI57JAH/8gWMAjIw3cOPLuDhloB9NBE11x6NbwkGoeg38G9lqqnyaG3RaZi03GNn2A/ZqH0G/eQWXEUkqQ382rB9y62j51Nniq0RqOQPNTRXDCd0SUkmM5UtoBU7ivmu/LQV0GECMlcPHadgJb4mC2qHRVGNRgAG5pFPIMD7M1g88hq3LRH5TwI/iRH69bEJ8Prza+TVUtPfJVmBqAy/41WyNVHjE65/Qj/xn3yqYCTQi+JJrdGvdYec9bZFCcnBd9r1yN4bOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CEjvyxKYd9dSVAhJCwT/Am/N5nHT453Z0mjqoZPSUc=;
 b=X8dtxA3ag4t7GxWfSYwkzrZm3vmNifHkQqY0UcyhHz/IFBdixYHq3YBBDRK+wKtXq2sa/rmqRi8oinyknAwOaXVvhvmaP5OB1dBnA6aggC0nTlXbW6x1vpQ19ZkeipiWirCpa684nHJuSHpv0EgVc4+b26o73GK/BzcxBpeHiDZO0NgksjOORI+Wh0gfIiw6SL0PP9yoxcFuWPMUWz/plsPp4+8EHECnWrXNLmADbu3BHSWO0YdfakqR+T26MJ3Ryjewj/Ir42jTheroxV0bo8W5zcEFUKBC48pOUeggtI01NgozuZtYRGU5BOV/GM5CVRfs2WIVvBUinNnOub9BzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CEjvyxKYd9dSVAhJCwT/Am/N5nHT453Z0mjqoZPSUc=;
 b=PCP2XQkGp5lJg77dJfW9N/Y+kvuXdX2mJ8Lz4o/1aMBOZXXSWVOrW2FvwZMoF3Nc78Qc5liOXHzrEsdTcXoS9SmCngyB43r/xC83w6bziS4enoHTJ6eSsED/Re1zeGsvXgxdI4fxLxNdvbxYiev/1Ci3njgzwcfKth0/6YLqyWI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4435.namprd11.prod.outlook.com (2603:10b6:a03:1ce::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 12:58:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:58:36 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-xlsxwriter: Upgrade 1.3.5 -> 1.3.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <17336218-c076-493d-8564-a42a9a0a6730@windriver.com>
Date: Mon, 28 Sep 2020 08:58:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924132122.30697-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 28 Sep 2020 12:58:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a241922d-3f8e-4f2b-8e06-08d863ae36a6
X-MS-TrafficTypeDiagnostic: BY5PR11MB4435:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4435524AEC159A588B02F7F99F350@BY5PR11MB4435.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	no+uspXD89crBWRcxZncsjG2LgNRKsL5ENsi+r/0M09QikJwSC5e/pRGnR/LdfmQ22IYS57QU3bHcYijBflvY0wgyR9W5BFtf2GqI/BiWXjt9umkAX7o8BdA4LwOHspUIa3H8cZfcJEcmNMoD2xN/lzUWTcwNX+CIORVxAMRiHj6gU2XBLjuoli1J9x52JuJ4q0so0dM/TGhmz8K83Idkz8BJqxkHdDb5l8ldkWwBpWGMwtJRpdxt7MLNogVc3g+dw9usStNdRvP12OdeHf2d5LQaMwlff/v3g+xBprxUpW1B3Y7J2YBK/EAJYEtiS8mjbahM3Xp05wQWxzPtGV7jbTdtJrJoanKjbx4sbRbvDuG4fl9nDwGV/heEREwqcvvGgZybBZ+ndu5YXZ8JM4/ixCGU9DD3i+/Ojy1S05Hk8Q7nDDOAST1jrSUXeIK42yrGC09CsWXXU3pQnTeko2hLxChmq0+9BQBG5JRW7B3oU1F/tdohSDbNJtnJh/VU8Kw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(166002)(86362001)(36756003)(31686004)(956004)(83380400001)(2616005)(16526019)(186003)(6486002)(8936002)(33964004)(8676002)(66476007)(66556008)(66946007)(316002)(16576012)(31696002)(53546011)(26005)(44832011)(2906002)(478600001)(966005)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PBjEYm5M+JAVByclxMbNW7WQQjxb1Jn4QqL2dv0sH0yzqkRa2JLgPYESkUM7yRyK4g9Lh9lCThM1bjOQA8AxkO0E0bo6JlIednn9Vrhu4mN6kgFN3pAjXrjuPsKIUVa7Xj7SkzYqW6AAnUy9aCQkSbk/Edyk7beza3KP/Zk3oL+LZEtnBuFFJIUX6mNpLIAMMtVE0JaALi7JLmaUQVkYWFAjmpWoIsLx9SaRyc7izk5HQ9zjovoXu7AdFcfaQ6+QTUjUp/TXCNkSXTCYm5uXuxm02v1B3sZtj2k9tGVcbhMQiPlypqe/neGSbfnNiulZdoja6S1hddqNkIEdqcj1ntVgoVgo31pDGLJx89vTow7zY/iRLX6OK83Q3P6uicST8S4UEJPP4h463rDTWsIIfyVyh7FcGJRFDBRFZDk2sOzmHvIV+53cSirqQUPR+zUDPVkO8yOCvJZqSRnsQpwswEFJ4HHweaQViMWddFGAafyjmCgpGiDKJTxZD6xLTnn+AQ4L/CKsbhpuCQG1yk95W+CCGTEEQ93PJnYJ2rO4vvzHVF+5crSTEO3YqiiBJIMndVX+9wvEP607zMFnz1l1Ctba+msKODf1Ykq0seaUoJAAzDYtdASA891PIsyYJn4WHeFQjvz92RmfNDeN2hz3fg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a241922d-3f8e-4f2b-8e06-08d863ae36a6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:58:36.8107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7BpvhgwkkGzprTIL1Ntwlwkv4yfYYjagTMlOAMWOywZKvsKq5HhOZjMzO/zEWLpXNQCBsvP9wnj8SBpsqU/FnPTIoDE4TlRUzZm0AFYet4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4435
Content-Type: multipart/alternative;
 boundary="------------726659FE450289A06E28B60F"
Content-Language: en-US

--------------726659FE450289A06E28B60F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/20 9:21 AM, Leon Anavi wrote:
> Upgrade to release 1.3.6:
>
> - Added the worksheet :func:`unprotect_range()` method to allow
>    ranges within a protected worksheet to be unprotected.
> - There are now over 1500 test cases in the test suite, including
>    900 tests that compare the output from XlsxWriter, byte for
>    byte, against test files created in Excel. This is to ensure the
>    maximum possible compatibility with Excel.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.3.5.bb => python3-xlsxwriter_1.3.6.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.5.bb => python3-xlsxwriter_1.3.6.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
> index b4b0e2eb2e..f3314037f2 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "0b65976905bf3841bc6cae3f8c47295b"
> -SRC_URI[sha256sum] = "de54547f3aa1a611453e32a8ae46380edb5556e823c6803f8673b4b770e50b3b"
> +SRC_URI[md5sum] = "378642a3754fb233e418e3869cf051bb"
> +SRC_URI[sha256sum] = "b89002dea57bb3d4c8207f3e28ef8244bfd9e936b85d74e7dd1f97e11bb70313"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------726659FE450289A06E28B60F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/20 9:21 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200924132122.30697-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.6:

- Added the worksheet :func:`unprotect_range()` method to allow
  ranges within a protected worksheet to be unprotected.
- There are now over 1500 test cases in the test suite, including
  900 tests that compare the output from XlsxWriter, byte for
  byte, against test files created in Excel. This is to ensure the
  maximum possible compatibility with Excel.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200924132122.30697-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.3.5.bb =&gt; python3-xlsxwriter_1.3.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.5.bb =&gt; python3-xlsxwriter_1.3.6.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
index b4b0e2eb2e..f3314037f2 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;0b65976905bf3841bc6cae3f8c47295b&quot;
-SRC_URI[sha256sum] = &quot;de54547f3aa1a611453e32a8ae46380edb5556e823c6803f8673b4b770e50b3b&quot;
+SRC_URI[md5sum] = &quot;378642a3754fb233e418e3869cf051bb&quot;
+SRC_URI[sha256sum] = &quot;b89002dea57bb3d4c8207f3e28ef8244bfd9e936b85d74e7dd1f97e11bb70313&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------726659FE450289A06E28B60F--
