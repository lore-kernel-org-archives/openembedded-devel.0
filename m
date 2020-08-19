Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.62])
 by mx.groups.io with SMTP id smtpd.web10.94328.1597860351669208925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p9RrItZE;
 spf=pass (domain: windriver.com, ip: 40.107.220.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC1BvKhCfbZngYx5ZMCFH+0453ZgQz24lY/FL7SFsnc+ftdMweqvbr6O37BxigwXkLozYBhQA3ICbeKFdL5YJSqY7CmtM4schWkhlJ/78ZbezBoDtpVwQx26vrvsyRx4TRIZfrZn6RBZzbLrWA3bpZjv/IGUOeyvW4kGUkkQBEJyo2d0PhJtOfRvm49TRk9zOgNj6IRt/Mw3ejgHS5E5jrODyEhXiPIIaVzoppaBkZtHlPzm1lezlEWmHd3pNl+4UcGMit6/4OCAJzSpF7rLBdukQk95NHRXUp099fhYLtSEWgEbbPHpHBmcLMr492vJYOrVP4UlGUfk833V6BuB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wirAsltFPM62LwWp77ot/cRL2LQuHV6nme0zEemF0k=;
 b=MSYDW80MYyr5MOd+lhE2JmiPadaQ8tr1A2cG687Jti9tHDaAdhxaoyzRxZdtUmo7JQ3nUmiejsW29PPzgbdyVu7TKFnCrQVZk2FatX7K+1eli5DzlaiFg5/a89Gi4iCzMUQa0XYnp+Mfmroy4Xze2TzhL5hbahKG/7lEjJB5p4LwEZKjh5XrV/5Nz/swju+1uEQAiscgd7GwQm53y6VeYLdJGU7rFATJyArA9F9+P5PNFlZ0uBdnTWdOwzVHYwW9RjSXXsqM+GR9Gux6Qv2+Yhepm+045nc+SMBArTcFDNm0aX0GvN/kILe/vbYR/l5HldMAzEpJyA4P9BAQfCh57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wirAsltFPM62LwWp77ot/cRL2LQuHV6nme0zEemF0k=;
 b=p9RrItZEL5JD+BoVKifbfyQZMuocrEpVZ1I3I/FhkYoUtywkcvwTo/N1JoTgsrwX2KVrXtqELIE6/lz2KTW8i5Se94kqca5+g2vUcTLO0J+n3WK/NE8sW0Z3qRGlXLauOJGBDcAzjkq44lAblSQX2hSNF/gzP+ZZaFWjghCgoLI=
Authentication-Results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB1468.namprd11.prod.outlook.com (2603:10b6:4:4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Wed, 19 Aug 2020 18:05:49 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:05:49 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pybind11: install both python wheel and cmake build
To: Jack Mitchell <ml@embed.me.uk>, openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>,
 Leon Anavi <leon.anavi@konsulko.com>
References: <20200818085215.538731-1-ml@embed.me.uk>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <576058d9-25f0-f552-ae8d-d877f6163f63@windriver.com>
Date: Wed, 19 Aug 2020 14:05:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818085215.538731-1-ml@embed.me.uk>
X-ClientProxiedBy: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 18:05:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48cb5ac4-77ba-46b9-b5f3-08d8446a80c6
X-MS-TrafficTypeDiagnostic: DM5PR11MB1468:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1468FADE8EC02528260C5CC89F5D0@DM5PR11MB1468.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vXmHqgS/XgU3cLVSO2wOnghANyI5Q4UypxqzrkKF8cwAN/3mkoJA0kMgJhDyvfRMkRCDQDk3twwnhlwmEx4kXVLKfwrWh7DXIdMXsw9PRuS3ZmPdsHOaszJf6CMN8RZksoOcfI/j1U9LcPTFr5uRkUQjrwAUhqdd32kwMwqpn1kz+7K4V7b56O8yclH4KC52QEbtUJwto73wcrGGlvLLbMRaPxaTxQEDLqrO4COfOIWCEeJZI1V6MVHo0BN+DxVY1NlyzUbjhaa3kjhbjOSlVVRngNqdWTxXE9Oc3nNAyEEvzlJWCsi8jGnNu/Q2b6/Qz7WvAg6YhYQicVUruHKt2772P6RvqCpYLXAWmeMg6RHHv9qDIw6zzeFB8FsrcWfMpgPy9j8GGdpyrWfucl44Ub+YOkeEVqamcOb0V5dRNN65kDIfC3oSFsPoT9TCPsteVpdOb7Rg7ukQXIer3VVhwbZxeBxlIZjwr92NjzCuyBI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39850400004)(2906002)(8676002)(186003)(54906003)(33964004)(316002)(16576012)(26005)(83380400001)(166002)(110011004)(53546011)(31696002)(44832011)(52116002)(2616005)(8936002)(956004)(478600001)(86362001)(4326008)(36756003)(5660300002)(66556008)(66476007)(31686004)(66946007)(6486002)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NryouEouj4WrZf0QLjwucju1NzFcJQlBb4OsYOJ/BdPsmORkdvOmtORCFU2fAwTHxOIfmJYFke7mBlBs9a4jrjg2RcoMw3m5WBFc1bHpHhJaKuFeZVpz+R5Nc90FNFzGURSot/85K2l5VKgTP+VBEj+GpPWzZfqglyj/eij+yLJiicy1Dzugc0lJg4wbYQxyQDtg1S0KEZiqf7isoBnun9I6LB3RJArp/xAhM+SxUYnLMk6Kz1RGO0G9BC5dU9J3CEEI5ef+8E3W3HNp2kBNVODGZUWhs14icE056lmJPYaFjs5JX61pW9Bc5rI6rXoI7IyZn9elQR4Pwz3baX77K1qV77c5uqPGTNaZvM4EFgZBwf123pvzu6BdoXmYzGNO+po32S/q237EEM8pjvIHEw6Fv5afEB5cpkOZ+Fg1ytsgwNzHxllHh8Xj6x4iMJTaoIcz9VHcbJ95ZxDDrLBiNHgknL13lKu3rKPl753aTwjZOjfIFjiFemuS43jUU0Dl+BqZ/fImy5QHSxvHAoBqM02RuPOjfz3OgfHAZWwqv5uaetwokLw4GsNWU28KaGwt8jxLwhAgqrsvS4WDmwIy1yvnDPjTFtARxDR9tKp2e+qee+vJ4s8PFKpEbJ7PDcc/4Iol7omzsUJGqKnZufauGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cb5ac4-77ba-46b9-b5f3-08d8446a80c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:05:49.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wa5p1dlf6x8OMgZWyk9LBpe2TGVLQDzQb7lU3RMoMosyaUUYqZkQM5rAMDlEGvxrOXVQg+NUPueOaTpgag/VCCkK4OwzqF07jD0b1Alcuek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1468
Content-Type: multipart/alternative;
 boundary="------------66B1E091D756C3502EEDB940"
Content-Language: en-US

--------------66B1E091D756C3502EEDB940
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/20 4:52 AM, Jack Mitchell wrote:
> The wheel for this module doesn't install the required cmake
> files, yet the cmake build doesn't install the required
> python module files. Therefore use manual calls to the cmake
> and distutils classes in order to get both into the final
> package. This method is also what other popular distros use
> such as Archlinux.
>
> Signed-off-by: Jack Mitchell <ml@embed.me.uk>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pybind11_2.5.0.bb             | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> index 46bba8d8d..9674ec093 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> @@ -17,4 +17,18 @@ BBCLASSEXTEND = "native"
>   
>   EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
>   
> -inherit cmake python3native
> +inherit cmake setuptools3 python3native
> +
> +do_configure() {
> +	cmake_do_configure
> +}
> +
> +do_compile() {
> +	distutils3_do_compile
> +	cmake_do_compile
> +}
> +
> +do_install() {
> +	distutils3_do_install
> +	cmake_do_install
> +}
>
> 

--------------66B1E091D756C3502EEDB940
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 4:52 AM, Jack Mitchell
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818085215.538731-1-ml@embed.me.uk">
      <pre class="moz-quote-pre" wrap="">The wheel for this module doesn't install the required cmake
files, yet the cmake build doesn't install the required
python module files. Therefore use manual calls to the cmake
and distutils classes in order to get both into the final
package. This method is also what other popular distros use
such as Archlinux.

Signed-off-by: Jack Mitchell <a class="moz-txt-link-rfc2396E" href="mailto:ml@embed.me.uk">&lt;ml@embed.me.uk&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200818085215.538731-1-ml@embed.me.uk">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pybind11_2.5.0.bb             | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 46bba8d8d..9674ec093 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -17,4 +17,18 @@ BBCLASSEXTEND = &quot;native&quot;
 
 EXTRA_OECMAKE =  &quot;-DPYBIND11_TEST=OFF&quot;
 
-inherit cmake python3native
+inherit cmake setuptools3 python3native
+
+do_configure() {
+	cmake_do_configure
+}
+
+do_compile() {
+	distutils3_do_compile
+	cmake_do_compile
+}
+
+do_install() {
+	distutils3_do_install
+	cmake_do_install
+}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------66B1E091D756C3502EEDB940--
