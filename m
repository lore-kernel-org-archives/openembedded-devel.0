Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.76])
 by mx.groups.io with SMTP id smtpd.web12.13066.1597334096177573429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WPq4vHSR;
 spf=pass (domain: windriver.com, ip: 40.107.70.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrsMejVe/ahixAMCksxx4v97tyO5gfyhXiBYAX8D3qYhuyX+hS0zzNzKC4YuxbnktbgHYNX0CzLtaS1/ptkjZhxJ5RX5Yp7QnpNg+DoEzxo6VFttVldGmCiXvCJkpX+xRKlJU41opC7HpbdLugPWSpELt6tzFdQ0Y4OvrXZ1u8BdilO4PYetIRqbgVisrVIOp83AZmoX8C+T9ecOTeP+yrf01auLiw/Hb1nkpRcJhBuEfAlE2XqEX32U2pj+aYwn8yojUayw/9cPqkQZ65Mkcu4hl5Lze1ZSjxmPBZtcqHDv6lAd3TpK1h8XoJao09oYhM74c819lykjl8Pul/1leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feiiDLn5GZG8rWces9RfGLs/+0yDcBcpAkrG39uGs7k=;
 b=a1jgMKTP/d9fehiih3W8HhXCKqNYDUbXqZdbL4HwrGxj9zC+SZgR6Jf0XUAoZGpy44//rVvYoz4EL69mBSYGIDU7BB84AX2quV0rV0/bLxnD/V5k3Jw5PfxHvXPEEXpBmmAa19IvhZ8vKija/H8KYjj0rkwl0pqDY1YMXrj1zOS0qK0gkPrVqh6yivp4vvDLY5YXpYuURvIl4haxy+9sJRBt82ft9tingbDIx7O5CkWkZaQNg+2t5dt2UQVaCz9jcBOmJn9kbEi4Z2v4l/vKoUrohpYpArnYeCTRrf3c4L2qfkS5FeeS5KTTbCd4ck9hAANDuaWUOpT53Ez9hgoYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feiiDLn5GZG8rWces9RfGLs/+0yDcBcpAkrG39uGs7k=;
 b=WPq4vHSRoKRIrqVs8opH+oQKj9TTS+FrxEDb9+8EjHJD56jHvYqvTqrxO4pPg3XheIAJyIYEoDVd70fzs6iPpYyhvghaTymtURUMzoPEU1fN/1EejLKHkfFIVk4mBCIm5vnJSBxecQirTG+UL4/fDr32Yxl7HeKJEdVSd2Gqka0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:54:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:54:55 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-parse: Upgrade 1.15.0 -> 1.16.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <42c6b965-4328-9e0b-1505-d5fe7bd46610@windriver.com>
Date: Thu, 13 Aug 2020 11:54:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 15:54:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29558bbf-cfb4-43b0-752b-08d83fa1388e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381451C83C9DF34FA5160C019F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JkB8gV1IdR380ZP77JtXoOZ1d68CXFlmxsvvelABQfU0DkLTB3y3WJOLHuGJnWYEhtVJXI3b9tYPYdq6OnOrSSUMkwfwpNEVXDFcOm3sxUy8kfqMPeU4dAbHHzAPQ9nS18AwWUx9bHb7WC/agZNFvQGVO6fD6MuX2NV7XJ7axljPlyU7W8umH1wJ00YBpiGaJZntFlaf7DPHN8IXUTkUrrTXPZzx18N+JKu3oYu0Lj0Ai6t/V4e0wtUZabIvPcypxMfJCKHBQphyKQF4J6rY72/AGzmAGecUbvqswPOas/JLWmD1tgBfNmKPz0OdMEj5yLrUp+jQMh/qn0xBud7NCaSbbxpvM8v59ZGYuhGxYVgxPKKc79myuo5GL6fdDN9fSjkAoUkKmyeW5rhawGUAAbzGB9MO1vq4uVdK2FeEPPKfgP3FujPw8WF1do7mFyQMQDEjZiHPKZtIUqnEg+8YQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nxdF+Dz+ja7ovsCC3qSFR364IhS8QRjiRDSP20mraoY0ChxA+IhorjcBA7WI4spbgpezmsfhqBOzu/BFcnFPXTMiNij9CjaiGyhU2OZiM0rlnc0s9xG+uB8cWB3K9ksyFBx8Lh2jDfZhh0r/hgE79GycXWeLvmJl7L1WZQltwKKVAwrU55eyMJxhjeI0wDBR0Tb7LK0Hfj6K0UIylhly9THBSgI/lCGRBLWXpMbwhNWF2o5k47eKv3eggdUmcaX0q+HonLKn/7OuhfK5LiIyeM40KvJXVNVC9+2femZbzfigzbk09PDdCQqK9Xnd/ZTaO8S6nB/exjvYfej92XB+p03Xqr4rvtp7l2PCiGWwCuau6T/Xru6qLsZfL0heOqoAnaiIfQ3jhicDDe400UTB4Esm90qllXM0gudaYVjYDyZ6aMLyGZEetaZTftWh0QtjIgPFMEvQG3Af5HwKfsgO94Hfq3OyNATKr3AE/caOb2XvcLTfFZ4nJS9JR2t3GLkfIF1Ig35QqwW5+oin7IY3UK2bu08BpmbGlnPv/OQNf8LXDM2he9q6sZBNNn57fwhifGbWJCQITB5am7pafrfmPHgtR0v/N+XVol486MGSQkjMAKhGER2rCuSTkeNnwdXmigJBw+xmwE+zTSjzr1gB/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29558bbf-cfb4-43b0-752b-08d83fa1388e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:54:54.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhCDnqNkrqLl/4z3fPFqvXseAC6YVTVwBcB3kCRX6/vaonRF4H+0X+q2xBoJfQ+wP2s78ybqhjQPxlSmr5frL1KBz9tB+i/WTQ8TCODbPO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------D5774592CB1FF621BCE8BA3F"
Content-Language: en-US

--------------D5774592CB1FF621BCE8BA3F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 1.16.0:
>
> Make compiled parse objects pickleable
>
> License-Update: Use file LICENSE.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-parse_1.15.0.bb => python3-parse_1.16.0.bb}    | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parse_1.15.0.bb => python3-parse_1.16.0.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
> rename to meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
> index bff41449c..a1e945276 100644
> --- a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
> @@ -1,10 +1,10 @@
>   SUMMARY = "Parse strings using a specification based on the Python format() syntax"
>   HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
>   
> -SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
> -SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
> +SRC_URI[md5sum] = "ba263b3143e9528ae960bbba4d56bf25"
> +SRC_URI[sha256sum] = "cd89e57aed38dcf3e0ff8253f53121a3b23e6181758993323658bffc048a5c19"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------D5774592CB1FF621BCE8BA3F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.16.0:

Make compiled parse objects pickleable

License-Update: Use file LICENSE.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-parse_1.15.0.bb =&gt; python3-parse_1.16.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.15.0.bb =&gt; python3-parse_1.16.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
index bff41449c..a1e945276 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = &quot;Parse strings using a specification based on the Python format() syntax&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/r1chardj0n3s/parse">&quot;https://github.com/r1chardj0n3s/parse&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9">&quot;file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05">&quot;file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05&quot;</a>
 
-SRC_URI[md5sum] = &quot;a5aa82b2b8b4d733d227e3c99d7d01b4&quot;
-SRC_URI[sha256sum] = &quot;a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0&quot;
+SRC_URI[md5sum] = &quot;ba263b3143e9528ae960bbba4d56bf25&quot;
+SRC_URI[sha256sum] = &quot;cd89e57aed38dcf3e0ff8253f53121a3b23e6181758993323658bffc048a5c19&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D5774592CB1FF621BCE8BA3F--
