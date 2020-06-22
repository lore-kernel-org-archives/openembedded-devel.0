Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web11.17884.1592833652438537680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UcuWP3Po;
 spf=pass (domain: windriver.com, ip: 40.107.93.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmgcrpctdwhjHxPLyP51+KDluiomNVmsUCOjVJuimf5/EpY0DT/wz1nb+ax4F6q9FD2BZ1Wky1tNBdgEmDlz1kt92sWYPFux31zg+9xGoqjtSL1Ly71vRhLjKkwiqACgiHFU3lBC4dHA9u3kAl9z04SOKMZMj5JOZcTeVKSRrISeaqfYOmyjKPWpjrazc66qG2u7v25cCiC6Mp0woWx5saAeS4bdCIViLiWnIPBoRmQY8Bb82Bh6gdlCcQhFKRn05rPrddtwehmthfFV2keWImCw45JgRKQPVfl5Zy3fqWD7c2ZLFsFODiNtUS+PPAEPLK5rMD/DALrZlUlj/m+Bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBOKe0kEvkAWnUwqNFskNPisimTjUnyI76VyTzmPFHI=;
 b=jlzGP0WmkVw7hmzpqn9meroMHSIk+PZH2wei3IdwJciypIVKrF5MDob1oteinTradc2f+QoacGxn1pH7I6WckJWOHkEJtI9zP7EEgiReFOrFe+/o75w6ngWysXkAcZcYGb6V+3ZMjbb3KaBB9xGcx9R1xgssv3PN36nLjDNuCUflB2NfCSG2Hn8nHxg2nt7sGB75XTs+VLWh/6zM/Du6O2/5aDsj1otibS1g7NTeW9FZ29UMzHp02UUw5B3pNfs9WEXXTrfYEMQG0X1MzEEP7GF4qNY57YA4w/LMeujzwRM03jHdikabGDBX11stFUEAwEtQUy7Y4WyfobqKZeIRUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBOKe0kEvkAWnUwqNFskNPisimTjUnyI76VyTzmPFHI=;
 b=UcuWP3PoaEe0I4tOreWX95SYohFtMSepCgD1E6ui6lHWeQYriLTGlPcwCQGvsHU7uKBefwCjvRYilhI+ThtZeXh93RWILWv5A9OkKIFFFKBjdTANsWfzBVr3OTu5RlhKCHfPj00Nuz4AWow3i3/+NGKZ8kEDLca2HgisRWI2r5c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:47:31 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:47:31 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-msgpack: Upgrade 0.6.2 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619094638.7116-1-leon.anavi@konsulko.com>
 <20200619094638.7116-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f262dfd3-cc98-ba25-6394-3e60bbbd2b64@windriver.com>
Date: Mon, 22 Jun 2020 09:47:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619094638.7116-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:47:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a4ef1e1-fc6d-426b-b6e1-08d816b2cf48
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546CB504A2453AD5A0457F49F970@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RSHWaIeNFsEYYiyDOL7Np3Qw0qfUI0BJhDShZLTmXMyNiGoz7YBEqaP2mRpI7Be3Exedmi62UqaS2Rt5EzWjZY7QRlGMSaPDpeA4AyNRwWRpz3rdVVWpDB6xzNFE1elYEvhk88Bjhb9aGN4wqWJIWdF66RQ2tkt1DNwje0DdV0rGltuphUa62uxYYBSZMIjZ6obP4GXt8+Mc94IaNxCYG8boman41VAKHl677DkGNTHRUz9sgllZq5+LXMF8p2XdPVKnSgaKsP97Dw782+O/HvTOD/mYVQQbUU/OzSJIK7uJIp1FIbw0AgAo01K7C03H1tbH80c5jczPS3UYufizNPiRsW/eBgT22Yj/J4UJzaXqtU22cutKqH8nQwvtTnL4TqOKWUzg44bHRDGE2/maiZmo76O1WGjLZO/vkkdDS9GOlyXvhIoP0tnVDsxc0EpTJ2S52DMFT5tL743DZPomnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(39850400004)(396003)(376002)(66556008)(36756003)(2906002)(53546011)(186003)(6486002)(166002)(16526019)(52116002)(31686004)(26005)(83380400001)(31696002)(5660300002)(86362001)(33964004)(16576012)(44832011)(316002)(66946007)(66476007)(8936002)(2616005)(956004)(478600001)(966005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nY4CW9tSCFm87pea3oQLZxPChtp8pHBo7JGETx3RGpQf2Gdiog3D86B5hWqvboW4cRvH6PFT09cW+7QJOBk7DqVNGAyWNXUYgSfP3SFBgCMreHgfNU8+gCzECFZDnujnh2J5mkJQ5yX1QEDmjbPZvK2iVrGoURczZniGLAPPu5tsKmY4fJanvpnYUukkEU9AYBTGMXEZJaYvgAfr/r4rawyGyJJCMxoyoz90Cq1L1imPaGyneRFNctr+HZEGGn0dt8we1AJ1prJccWTDxWnK1oOALpLAcV7EkYbKy8D5cpIlUoXOAQvJ8J+nT/eL8hTERE3Do53ftBJU1HlWDdy4d3jAEA2/dWtSS4uE2z5sQWE6TlTS3jSdIAdMt48Lgc9HWw/oI82BCSu7veslvX9iIoUCd4uDKFvNldmRskmwCM5iCmxUTJmPb2jW34ZIk8wA5DK+dO7pXOijkuIpb1Ux1ZN+c0doBvURpkoqynST38I=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4ef1e1-fc6d-426b-b6e1-08d816b2cf48
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:47:31.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KkeuFPp6UtoxMnVq6CTmSBkTESb10JpqFO2JEWJoINZ7G86M9LC30MQuOVm22fSsWRnbVuDlQq7jDP0k+kd+Xl5Rub4vMc1A5eiTFuFJng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Type: multipart/alternative;
 boundary="------------7D336D168A9D78BC9B0C9C3D"
Content-Language: en-US

--------------7D336D168A9D78BC9B0C9C3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 1.0.0:
>
> - Remove Python 2 support from the msgpack/_cmsgpack.
>    msgpack/fallback still supports Python 2.
> - Remove encoding option from the Packer and Unpacker.
> - Unpacker: The default value of max_buffer_type is changed to
>    100MiB.
> - Unpacker: strict_map_key is True by default now.
> - Unpacker: String map keys are interned.
> - Drop old buffer protocol support.
> - Support Timestamp type.
> - Support serializing and decerializing datetime object with
>    tzinfo.
> - Unpacker: Fix Unpacker.read_bytes() in fallback implementation.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-msgpack_0.6.2.bb => python3-msgpack_1.0.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-msgpack_0.6.2.bb => python3-msgpack_1.0.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
> index 6d7e7a0dc..d744738a2 100644
> --- a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
>   PYPI_PACKAGE = "msgpack"
>   inherit pypi setuptools3 ptest
>   
> -SRC_URI[md5sum] = "ba46fdee995565f40e332bd7eea882f1"
> -SRC_URI[sha256sum] = "ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830"
> +SRC_URI[md5sum] = "c35ee8f991dad3969884e9585e56ebba"
> +SRC_URI[sha256sum] = "9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0"
>   
>   RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-io \
>
> 

--------------7D336D168A9D78BC9B0C9C3D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619094638.7116-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.0:

- Remove Python 2 support from the msgpack/_cmsgpack.
  msgpack/fallback still supports Python 2.
- Remove encoding option from the Packer and Unpacker.
- Unpacker: The default value of max_buffer_type is changed to
  100MiB.
- Unpacker: strict_map_key is True by default now.
- Unpacker: String map keys are interned.
- Drop old buffer protocol support.
- Support Timestamp type.
- Support serializing and decerializing datetime object with
  tzinfo.
- Unpacker: Fix Unpacker.read_bytes() in fallback implementation.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619094638.7116-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-msgpack_0.6.2.bb =&gt; python3-msgpack_1.0.0.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.6.2.bb =&gt; python3-msgpack_1.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
index 6d7e7a0dc..d744738a2 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
@@ -5,8 &#43;5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751">&quot;file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751&quot;</a>
 PYPI_PACKAGE = &quot;msgpack&quot;
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = &quot;ba46fdee995565f40e332bd7eea882f1&quot;
-SRC_URI[sha256sum] = &quot;ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830&quot;
&#43;SRC_URI[md5sum] = &quot;c35ee8f991dad3969884e9585e56ebba&quot;
&#43;SRC_URI[sha256sum] = &quot;9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0&quot;
 
 RDEPENDS_${PN}_class-target &#43;= &quot;\
     ${PYTHON_PN}-io \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7D336D168A9D78BC9B0C9C3D--
