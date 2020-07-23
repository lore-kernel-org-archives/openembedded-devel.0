Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.56])
 by mx.groups.io with SMTP id smtpd.web12.2373.1595522880345438487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hHBNm5Qw;
 spf=pass (domain: windriver.com, ip: 40.107.93.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG1phPUMh5sLWlWMlVgR/NEn0xYBAQYAFNqxZ5CTN1Hmqp4Aldue/sFBimK45M8kh39fdiWHitdozOYvgdZNX62wcGD+syz+ian3n8mJgGm45/3t3h0tqV2M15LLSzXRM7m8XXx1d1aAHyzDD/XQpoRDsxWbvPNvqmGrVsKbNDD7ftW++FYYq3+9gvI1Y9tfS9d2lHP7vIxCIyUJNNu8o0Hew8R9vtJ8foUJGVhoSeyfi+no0JSi11hrgDS/Gtwc9lUNKc/bdtwbcQxQX8WgtrdK4ZjXVymNaplfymvK1sd4bcC+jcsxvHlE5+1tPjvuxakiWCbKx1tZ5nW/ocnrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYuQTYoueB7sRQDV27B5CsORO5/IhGvUAS6o0dBzGuk=;
 b=izDB7gdKvzpajccFvRknJGBA6gl6Xkf/FB/OxpTeksZpzhZILEjEP3AaZ53LUkFt6XueW8ISqUdPa1QfyqCA8g2HIRlpBrA+LqhQDpGp8lQZfGa65txHfHrDxnLk2LWMfa7BGIfDAQORPQmQjwjTqV5KAcY6LDTNE7TGe6C2vTM6STo3mMEHah5Yr2J2+OWSOO7D0QnTwX1tGxk0dtu5XIXRnruyZ4H9TzjU4fS4zxrGzozjqKPQyLu6mSA7Qogb7BoxgCcmdibx7PI0hLhRF5rrBU3gdRI5gncY5YQaMTXW9ZzVf9zMQfKPqMITJUD2yGbDSXKaPRLM7qdW92dWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYuQTYoueB7sRQDV27B5CsORO5/IhGvUAS6o0dBzGuk=;
 b=hHBNm5QwcqoPclKozav5GqHVoZ/PgwJmNE4JYwCwZKGFSOLs0xIt3FiSRqlU9B9HxPts/yaS5SiGwwW3VbNs/5fbm0dd6yMh2yVfB7+fM3MFrXjOS9CUdtkqoj54zcygGpG1894mHQakcFsM8xxube8CLcfOnfibX1cnD0x+UKU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:47:59 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:47:59 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-mock: Upgrade 4.0.1 -> 4.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
 <20200722104905.15499-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cf890c42-6e22-6285-5464-c55bbc0fe137@windriver.com>
Date: Thu, 23 Jul 2020 12:47:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Thu, 23 Jul 2020 16:47:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b5d5da7-efc5-4841-3b52-08d82f2827e9
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41310DE883EEA840521CA06B9F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xYLSujJIVBMBYNcB9gU8YGF/pAeS/Ltk/6pFPYNleHPgqkCyaVkfE3TcCInfddzUfDAUZK0rENfV3VPO0ECP06bJq10xH6khB9BTnOpQSThX3F/YhC45mdJmIefPYNecUylbEn3m3xWlbMEmH5EIEDzy60P34Nr9ZEbGAhObC8xFqIlQzmmQm9CuLzJLzBY+7dIvvsgSgFehd7Vdusm9GHfdBrXOgiSH/SCABywaujvV6fm1da6V6AEljezukbgLY0ecDb2HCNuTnXI4n6OYtiPzX596L+u9CzuGvwzb9wZHAideP+9lSB6uEOTLYTSTaSAGHfxd5r3ackLHcvEi7jtsOPIv0ye8bsbURkpJOhATvFFr/dmWbmOnKrdTH2IeDQug2A0klkXZ45Hyrj0gW6C+nuDV22y+thP+rKaC2TY4WsFlM7sMI1uFk5bcgkgeDXiAcVO1DmUxR8ZUbRBrOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(66476007)(31696002)(86362001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6drd+L+IXP3j+T5cWPbZKI/xKEvFdRrewV5Oxm4K/7Y1Ze/1D9OChfPOQ//ug5lbG2yKzBaQpzpGDqX23MzVEf7oCEwFZSNYkEZQxNLS5WUAsAZS8ZfbXCh4K63MBEylFjbjOASXzUSSkopy6IamADuh+fJR734dG2gmqmCi23PTaZtNuU2jKSHlqmTEG53zx/nEPtVWwR3gz/r0S8VPPWkx8tmmJvorV88RVIimRAv1qNDYq6df8m2WD61adYurlk6TddUCOW9a1i8m3+yGfYMTCug+a+qzr5xyF8ifL4YaKGApGiV7BF8MixA86d6R8UZsHW9S0lEs5IptXTWrgdA6vNXuYLnzj2fIS6fTm+H/ZpYNWz58drZo8AdFAHi/n5iX42EaD2u71yjF7VQ/e51XhYOfmP/CWa7/7DfOClgXfY7m+bAvaJQir/ETymGXgcQQVGCur4W2cPKEQrwgl7NYNSnDCqrTrD9X1A7FWaI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5d5da7-efc5-4841-3b52-08d82f2827e9
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:47:59.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjNB73IBDhOx8wtk/G/TwEhEl9AGWXPAK1NgNUhLwtziD2+GiBqHGeLfDWsvYeEPFG7VH8xsipVk9Nj1wxSPOMExW6Z+k6d13cBMGkMrqIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------7F4E679812192634BC706F02"
Content-Language: en-US

--------------7F4E679812192634BC706F02
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:49 AM, Leon Anavi wrote:
> Upgrade 4.0.2:
>
> - Issue #39915: Ensure unittest.mock.AsyncMock.await_args_list has
>    call objects in the order of awaited arguments instead of using
>    unittest.mock.Mock.call_args which has the last value of the
>    call. Patch by Karthikeyan Singaravelan.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> index eebfcdade..39ab6d01f 100644
> --- a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> @@ -13,5 +13,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
>               ${PYTHON_PN}-pep8 \
>               ${PYTHON_PN}-pyflakes"
>   
> -SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
> -SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
> +SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
> +SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
>
> 

--------------7F4E679812192634BC706F02
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722104905.15499-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade 4.0.2:

- Issue #39915: Ensure unittest.mock.AsyncMock.await_args_list has
  call objects in the order of awaited arguments instead of using
  unittest.mock.Mock.call_args which has the last value of the
  call. Patch by Karthikeyan Singaravelan.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722104905.15499-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-mock_4.0.1.bb =&gt; python3-mock_4.0.2.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mock_4.0.1.bb =&gt; python3-mock_4.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
index eebfcdade..39ab6d01f 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
@@ -13,5 &#43;13,5 @@ RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes&quot;
 
-SRC_URI[md5sum] = &quot;8f48ba3fd059e7cfad92f8354064adfd&quot;
-SRC_URI[sha256sum] = &quot;2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3&quot;
&#43;SRC_URI[md5sum] = &quot;6466619b89c2969dc57722ad73f85676&quot;
&#43;SRC_URI[sha256sum] = &quot;dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7F4E679812192634BC706F02--
