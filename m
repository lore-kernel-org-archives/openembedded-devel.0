Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.40])
 by mx.groups.io with SMTP id smtpd.web10.34881.1610983064389359866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 07:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bp/uDyS7;
 spf=pass (domain: windriver.com, ip: 40.107.237.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxsiO34dzEDwW7fHKECRk955rMSxdcFDqCBjpUU5pF2ep/rFAEL79Tm5yvke8NhjWVCFBowJj4ubO8l/SrvxZ3jfVyCF2oDtRgRlWBvWHZ5jxTCCKklrqDcqtcT/D7WOU6Isk+hVIl0cQwjsmEBTj6hRPRX7qEYyNr/p9o/ybv2Ve0WsshGQpt15Ob5GdrUd0NgqYqSuscWnN5o2+Gk1AooE4scFQOWwFw2QRi1/oMldcHz0nAqTqGWSHCY9Kjjb59965G7jY2v2gg5C8X7V6PZcv6yBcpqPSmcz5K/rSn+4xbhZBH2etp6yFo3EkOQI+k6Srd5KiwG/R+ZvUwGDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsOtGKhn2nw+GPyVpzR448KJkaWDXREjTpj0tGy7jsc=;
 b=jWP6+JcGR6/IaroWG/Fi5q3eCSISalj0PXhGOZ31U5riG6HGgI0mafrsBjoV5iNICdzP6uz6hwrk8KEol/Y+2Sf9Tm06/3mkp0PznWvBqG6aNrtnXFkBfasHjGQoktTYzMx3rXOm+LM18F9OUYpcWqqXasJ9KXFb7/OOoKkDaI+Lm6noAIiJjLBPb7PkJOgi6sEkR1A8RFNyDyymbTtclE8WzGJFdEo4b4/B+LHymMu4apJmEy5y90VzfKpry9GJZbtAqewldzeYVU3/srIsZdDjrlFK3weT2YC7/FCXS32hFsZddhYK/w6EocH6pCGMpb/QCGpG8AwBq5zeToSfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsOtGKhn2nw+GPyVpzR448KJkaWDXREjTpj0tGy7jsc=;
 b=bp/uDyS7WaubKJDi6tKxcRmfCDIQrdQzGMq+KQgavzlNF7FQkfHQ5Rgbl7FQiXojNWhxmv5oZf3dRpmstwfZ7jis+JtbAubjR1HeV1B5suagflxrHvUjzrGOPA/AA3MMjuVim8GeNMkihxMnKxILEmIIHZ8edf1yps4Wta4fz1Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Mon, 18 Jan
 2021 15:17:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 15:17:42 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-sh: remove python3-tests from RDEPENDS
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20210115170346.117081-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c18a942a-92ab-c440-a925-4d327585a341@windriver.com>
Date: Mon, 18 Jan 2021 10:17:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210115170346.117081-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:610:38::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR05CA0045.namprd05.prod.outlook.com (2603:10b6:610:38::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.5 via Frontend Transport; Mon, 18 Jan 2021 15:17:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd2ace16-6df0-4db6-5c5c-08d8bbc43318
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4942:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4942E331D5A61D813C13522D9FA40@SJ0PR11MB4942.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l/nee0jm8Rv5GdKXnv0VGHEYA5cnN1mahOMbdqV11m+m6hPhvxzavuCix2uPWLYvPL5SMLJv9rlVoXWIR7LdycN3UOmOZbrbRLP8jhNZVB0jNYKn5gEwQM/OLr46RcwG7Hh0Onk792BmRnpfg4JKkYjWNgrYy55QaTfkGjKXo9gvHhS2lPILC29umRxuuRL7v3sZTWMDAfzMpMUwiUp3HAfBQcoIFwNzpNO1h5M7LaiO129oMv3ZVAHcgAKx4CPfyg8gIwtDSZt3XLpjSrYcWuwtqUSmCRbtioSuEhL+Xh6WGtUetxhqp/cBd9SxOEwLKbRfv9jNkb53/wWP5sioUdevsWHaf011MKn+yMRXhtPpg2l/WarKS6ZXxmI6pSlFQy0GDDMQlI9PFVNXa5dlicUPQIUXLRe42xt1Ihiyh3Vc6wi/oDeJ0qyz6jLdIwNA7rgD+8W3v59nG7umMlo1VLBNZ62DVhTi24GynGP1+uGSf0FNYZcONmRddiikrMqxxt63/EFrj0XCKI/TZzPTLReJ0X+1bb3xAMUwUb98V6kJG7X6sVzNhl8KhnM7FzAZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(396003)(366004)(376002)(8936002)(66556008)(186003)(66476007)(66946007)(956004)(31686004)(2616005)(8676002)(33964004)(166002)(52116002)(16526019)(44832011)(26005)(53546011)(86362001)(31696002)(6486002)(83380400001)(4326008)(966005)(2906002)(478600001)(5660300002)(36756003)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?KzVDNHZTWWlRNThuSXhrU1NEaXArNzBrVklEMmJvRTg3TXIwVHdSTGFrM3lz?=
 =?utf-8?B?Rk5MaHljSVplTHQrdWVjMmY5elZMOHZmcWI0bTljcldad290a3ArdldNM1BG?=
 =?utf-8?B?cUtrVWtiMktoVEtmdjZNTkNRbnNtMjZEeE9TTENwK1R2VmFtdExEM3EzUTBy?=
 =?utf-8?B?T3dXbzlDeFN6VU1QZlJ2a2xvV25BSkJmUHArNHhSVjVLeVlqc0kya3c4WnVY?=
 =?utf-8?B?Q25jUmhvYnVLWnk5SS9YdDlGTlloalBmYmgrRTNQaDMwR0VRR3dxUG1leGFa?=
 =?utf-8?B?OWdhemFyTE9oUUN1V1BzVlFQL2xYS0tKWVVZWHpCNDh3TnpqQmgxajVob2sv?=
 =?utf-8?B?dnZFTG9lYUd1V083dnFNWllwVWZWUnZEa1dzSGRXU3NLcHpXTkZ2R1VVK3ph?=
 =?utf-8?B?Q3M2NmNnSkMvbkNVSnVkZUFHN24rWEdWZ2VpcU9qb01qb2RHLyswN1pRVkRM?=
 =?utf-8?B?NGxLdkJNcE9zbXV5bjAweWlhODBVQ3JaZkRNSFJCdXpYKzd6Y3Vhd2RiUUl4?=
 =?utf-8?B?Z3A0c3hKZTBOWmtHeFpWdXF6NDRDaGduQnFGckJFMkNvZERNc2VLU29wR2Nw?=
 =?utf-8?B?d2hEL2ZTSkJiTTRzMHRHbEx6TnJpbU5qSVV5dUYrTXZWSExma3FoWllVYVNs?=
 =?utf-8?B?YVJ4RjZMb3V3eG9YcTV1UWc0cDBHS2RQeStXa2hJTzZOZ0x3ckhhS2wrdTBE?=
 =?utf-8?B?MnI2M2xpZmpNRitPRWVZVEpwSjFBWGxNZ1N5VGRmUWpPb043cmpXN01JTlBS?=
 =?utf-8?B?cE1ibkZ2QnpLRG1EZHFXeGFzWXhvUUI1M1RLeTRpOGVRNkdPQUF0UGJGZ1FI?=
 =?utf-8?B?aFFyRkxGd29hbzBsZWwrV2ZaR3gyVW9raVhIeitJMGZ2OEFJb25pckx3MlVJ?=
 =?utf-8?B?TmR1VWg3a2huTzdjd1NqT094ZWQrVXVScEZQdFp1Z1JQQnZ4aTBIQWpESlRZ?=
 =?utf-8?B?UnFGSXJjZlpUcUxMc0V3WE44bUs0eXVUd1F6RFMvY1VNM3hqNGJkZk5ZUG02?=
 =?utf-8?B?OGEwbjNPR0F3YXVka2FydUVsbndMUEJvczkxMmZtcExKaFBiemtNNFUzNkxR?=
 =?utf-8?B?bWpFdWdtRmFPZnpuZmxJWWZTUTZHUTAwd1hnMktGWit5bTduTHRQY2RxdFQ5?=
 =?utf-8?B?dXhHRm44WlZGeklKc0crU09jWUdJdldIMWtJR0w1Qk9FbzZPUFlmR0c5M09P?=
 =?utf-8?B?dVFSQUptTzhkZVo2bVZIUm16bDhEdkNUMGMvdlZncmt1dTRDRFhmcStPVVNV?=
 =?utf-8?B?NGhMRmZxK1RKeXF2VUJBRjNKN2dNOS93a2xXYlpWKy8wMW1nYk44UmFkbFZj?=
 =?utf-8?Q?lr5QewWWgqKJz1pyJR+769HekGSzCzbm7d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2ace16-6df0-4db6-5c5c-08d8bbc43318
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:17:41.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5vy9gw8OGuxVaIekdBfoRaUPQbjg5Jrp1/78F5yJqjqgJZCJdjnUrI9T8EaLKjwuAv6uLcEqau+RKoIYjl4h7CaOzSOOb4/paKwh/oyg3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
Content-Type: multipart/alternative;
 boundary="------------8EE4DA0271FAF3B763035DC8"
Content-Language: en-US

--------------8EE4DA0271FAF3B763035DC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-15 12:03 p.m., Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> python3-tests installs the unit tests of python
> as well as stuff that no one should care about
> in its rootfs. Thus, it is not a runtime dependency
> of python3-sh.
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-sh_1.14.1.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
> index c7b50c21a4..89d5008e98 100644
> --- a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
> @@ -18,7 +18,6 @@ RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-resource \
>       ${PYTHON_PN}-shell \
>       ${PYTHON_PN}-terminal \
> -    ${PYTHON_PN}-tests \
>       ${PYTHON_PN}-threading \
>       ${PYTHON_PN}-unixadmin \
>   "
>
> 
>

--------------8EE4DA0271FAF3B763035DC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-15 12:03 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210115170346.117081-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

python3-tests installs the unit tests of python
as well as stuff that no one should care about
in its rootfs. Thus, it is not a runtime dependency
of python3-sh.

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210115170346.117081-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-sh_1.14.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
index c7b50c21a4..89d5008e98 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
@@ -18,7 +18,6 @@ RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-resource \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-tests \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
 &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8EE4DA0271FAF3B763035DC8--
