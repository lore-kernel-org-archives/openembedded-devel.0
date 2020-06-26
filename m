Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.40])
 by mx.groups.io with SMTP id smtpd.web10.9556.1593183640967956894
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PNmZS1ED;
 spf=pass (domain: windriver.com, ip: 40.107.223.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIbvb+pnveSe1mWk5y7cQH8arzSMOYdxqHrzntecSngwqvA5JizwXVka3hCQtoiOMTKbQ1zYg2K4C+HxlJ8lag8qWGnHP5UPuU7esaPjiWmSxEZ1RN2ejAuY8y6S/EkHq0CLRHP37hAn4ald1HLlUGgcifc21GNHhnDlNoCMM1vKEuSrRnuWICJbTxUHjCvWakeJatPt4mnaPJ8hMoOE8rP+7ce/yDKAf640GnenZl6gt/XUUCPgC/RUvHmtLlLvU0ruIbsPOqqY1kp+HxIrlsC47twlTcRfCKbE4hg5iuohpe6PU//qGg5oF7BfDrBUzguMPFDrRWvg4BAL4XQHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rs13CgMJcsVn83zSHk55PL1iARdG5y03LRT+JXHPO8=;
 b=MJlNo5LnhNMBCbdCTBG/DVdpuOgVrWywoPP5RTG7Id1iDVSrJvrzWcFcT1If7pGA9iz0iQqDiTeHJcpfIMCTaf6jRmRx7U/OFloUetLfkcy141iZV574jrurB1RDjZoBflb7YbU0s2TIcUgfXjJ+6aJG2cSF+WjhMUHxgYGcIXricPiOajemJuY/j5LV/Nv/QUSLzCOiq4dbYFkD1+Nlbx2JnL9oCQohQQEVx9VYCXCu587ZdpI3j5uVGKypI9X7Gglc+K91vGtmnUzDbQzCFTd5SheJfg1ofa7xsD23XZ2P7AjBscnZNPLeHsY0GUEOpxsMKCpVyBcBYTSvY55HHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rs13CgMJcsVn83zSHk55PL1iARdG5y03LRT+JXHPO8=;
 b=PNmZS1EDKFehPS7L85wYEe2CZxQ2mvJvgdGuQFmFvqn8cromOM5AL1Kd7In8wdAVP3J9D5nIRd/bi4eSJQG7Mr14B3A8w+OGm4DwUChgU+ilsOBxF3sAUjywt06PWWwGVlwTh/m+dM3uZYimubiCRWYqtZ6NdivTnqLZvtMEX/Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 15:00:39 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:00:39 +0000
Subject: Re: [oe] [meta-python][PATCH 01/12] python3-pytun: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d71a6603-60b5-4802-a733-fedfbe9cb531@windriver.com>
Date: Fri, 26 Jun 2020 11:00:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:00:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b80baa66-666a-444b-4825-08d819e1b053
X-MS-TrafficTypeDiagnostic: BN6PR11MB1873:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1873D70D5727DC946B788B6A9F930@BN6PR11MB1873.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Xq+GO3WMWM0myCVOLp+sy7izF3NVuFrh2pExBJK4+vV2O5Rw1ncZ7ZU9IPklGrqloI82xIxdxqYQtpO2vVD+X8UKzqrO/bDjRMpqv631OjDmYoh4wFotMKEI1s0P5O7cRNCLukhYZbpXNT7yE0QRhVyihIFySO/pi5x0QUsU0cKj+KwWeYhxW0x2Q5Th9vMeFiFXUP1lQL/Oer3LZYog4j9DAqA8bldn/vrmVOH44m3O319AmaD+l074857sb8is7Rvf9FNKUWOCb7LME/aj5PuMuIRiz7CzstV2ceJDMRH61a0YtkhdXaSiwYozblAi2jnFzDRKxZs/HZopMZ0/Gibi+TZ3jx1tVpvgUDLlz++vnZA813ZZwFuKWMIjuUv9d/et6idTs3uJT1v0mBF38ofM+Ne3QqxRoUNsruCgU0Z5ifhrCqv8FcR9spHu/M+amgCJFfonTslvajslGOk+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(136003)(346002)(396003)(39850400004)(31686004)(8676002)(478600001)(8936002)(44832011)(66946007)(6486002)(966005)(31696002)(5660300002)(2906002)(956004)(186003)(86362001)(66556008)(66476007)(2616005)(33964004)(166002)(316002)(53546011)(16576012)(36756003)(26005)(83380400001)(52116002)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QlAgReB97C9S6sO0/NeDiIItf0j4SG1JXSXeFXYWzM2yhsEoDk05g17WFkwKrTXeSI/+yohvCO3GeowlL1zCXNBX20+DtVLdJmBJDAek9BNIah2EjZlNjnuBkfUaf/dcttA+yvuXxNd150cjBeo89gl+FzqNFvfrgarZXNktxpHTbIMx0Uj9M1+8ObM1diQOqLQsBUgbznoG5sQ5kLHdB2RVCBfIEihB2B8e8fChLorq7D8oy+qj3ncSjuIKcoIeXeYONBM6bw5E1TFboZ/0LZ5cdb5rUpfv8lHl2qFKMK3t8uolhjMJxyecmisZ4nMQ/IR3jWjcEgzMsrmrqLCw8sO6O27dk1rcDQHLOr9GIUhkaLGFTQOK5vca2B10Dq3Adhrzt9KTG7iAeWtmXkFwt8mMMiZoOfjRErXGCYvyMuqiPCzaxhJKbkFS96xrr7vCGPNOsd4Ts1UE8iFTQX3qfXEg8Yt6jkwjhbsmlNMl4GE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80baa66-666a-444b-4825-08d819e1b053
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:00:39.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwAo3vPOBLtNDHrbVyq0vCEBK+myTyQszfqclXw92wQ3J6FO5cYIgp8WTFhXp2ctz+tcs1m9dDnFZ6C1fujXOmDEpYHSVIFS4vViDT7m7Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1873
Content-Type: multipart/alternative;
 boundary="------------80E6870F943F25C6478972DC"
Content-Language: en-US

--------------80E6870F943F25C6478972DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb    | 2 --
>   .../python-pytun.inc => python3-pytun/python3-pytun_2.3.0.bb}   | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
>   rename meta-python/recipes-connectivity/{python-pytun/python-pytun.inc => python3-pytun/python3-pytun_2.3.0.bb} (92%)
>
> diff --git a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
> deleted file mode 100644
> index 938d9d739..000000000
> --- a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-pytun.inc
> -inherit setuptools3
> diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
> similarity index 92%
> rename from meta-python/recipes-connectivity/python-pytun/python-pytun.inc
> rename to meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
> index 3991a830f..bc11d705f 100644
> --- a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
> +++ b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
> @@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "5ead86b3391acef239535ebcabeb04d2cdc6b40ab14580d28c6da193c2
>   
>   PYPI_PACKAGE = "python-pytun"
>   
> -inherit pypi
> +inherit pypi setuptools3
>
> 

--------------80E6870F943F25C6478972DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200625090719.16068-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb    | 2 --
 .../python-pytun.inc =&gt; python3-pytun/python3-pytun_2.3.0.bb}   | 2 &#43;-
 2 files changed, 1 insertion(&#43;), 3 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
 rename meta-python/recipes-connectivity/{python-pytun/python-pytun.inc =&gt; python3-pytun/python3-pytun_2.3.0.bb} (92%)

diff --git a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
deleted file mode 100644
index 938d9d739..000000000
--- a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-require python-pytun.inc
-inherit setuptools3
diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
similarity index 92%
rename from meta-python/recipes-connectivity/python-pytun/python-pytun.inc
rename to meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
index 3991a830f..bc11d705f 100644
--- a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
&#43;&#43;&#43; b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
@@ -7,4 &#43;7,4 @@ SRC_URI[sha256sum] = &quot;5ead86b3391acef239535ebcabeb04d2cdc6b40ab14580d28c6da193c2
 
 PYPI_PACKAGE = &quot;python-pytun&quot;
 
-inherit pypi 
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------80E6870F943F25C6478972DC--
