Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.85])
 by mx.groups.io with SMTP id smtpd.web10.9587.1593183703869308910
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QlZNoKNx;
 spf=pass (domain: windriver.com, ip: 40.107.93.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEaWn9NSMQSuNiCTDuTF5+1JqsRD78HyfFHUasyASGejWTufEECu8Phz9sLzxrMfXazN3V3sSadV/tGi+D5r38VTx5gqNnGO6+GLuv/m/4wuydkHQRlv1YqxOHl7YRYWBhuOiQbNMYUSZ52agA6zr/hAN6HXaYuXsQ/rYjF1qV7XVSJVmU73ZagXWrtdUowxXMCtjotCxlnTGA+JVob7G3HYJvJM+M7kOunhJUWaN6m1kKmFVsnnlJiOF+Keztw9IFO1HxC5XbkQzFQw7OxDldtTEXp+/nlqn8PoSi0Bzmj4w33cEvXnMLPxlZq92Tm/cCvyCABQVLm0a97HsuFoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQdzzCKrRKwEsGgQhpNKbdL8I3nooS4/ojXn2v9AQw4=;
 b=e8XFwQe0oNDAwhto1DaZ4avBbKJXMyRpq2YsIZqsNfn2Q2M0LOSGoCYmlRLOV0gD1auVriWaUjNkkf2A6yVF6u9z1n6TI3wP1yWCW4ybMRC3YsZkaxT5fwVrLrxJ/IFAs9AJtJl3/9bTpI9Ya24UAnPOw0F5ZmzqY3Ihh2NX8tbbOh+5x2FRR2+bvlobIUAeambCMN1H6JXPl8JxtmwkDaqhvfnK7KAeMF4e1dxDk+qBFFw1Vd+WCi8z2q5u+RQJfZQEiAkRYoCDSoW3uQd4sFkHv9zfrT7u0/Pw91KvcVNyXe3Apsav9qVdtuhS1i9PuAn1mHJ7ej41ydwMI1w7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQdzzCKrRKwEsGgQhpNKbdL8I3nooS4/ojXn2v9AQw4=;
 b=QlZNoKNxJWLwj0Iqx8QWVK/zs3/b6EpGeEAhJRsiezGPuMIIz6LKYB1ZAJYcLTIKAdGaP6NyW2ldIIyPSQKV//t2/a5LdOA9Q4OXDA8xM9gmGh23vGJ1X7XXCGo7cQXIK0MGVwHJK4SGisNFpv6lI9LXKO9D3RoS4sm4ljfKGSA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:01:42 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:01:42 +0000
Subject: Re: [oe] [meta-python][PATCH 07/12] python3-ruamel-yaml: Upgrade 0.16.5 0> 0.16.10
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <35236321-4ff5-4721-0bde-a014ad8a2518@windriver.com>
Date: Fri, 26 Jun 2020 11:01:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::18) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:01:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b82c5568-a2de-4c1f-1601-08d819e1d635
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1604B8162021FA6B6AEA05929F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kTrGNEjI95C8Lo+rhc700yAEVT7j60QdD0dOq4UDm7hjHGVSMzj+vKiM90lEBOswS9VHaP96WCuejeHLvO2X5rDah/dL6OYVhoMZyqsDtSqDpDdmsc4nUgcIU1oahMRe3aw/Qam6EoZJw2UWFh8SquegVmLm2TTaL8eM/lE5eINEHVvhIkw4BODOA+nQkjkE63MECza6omd7t1uV809tLSPD9cVqJsbF7t/KHz5YznUSDMyMfMl4u9BFikrqb9tigmx+HfzsWY/U4xU/ilYTFKO7mqnPZ64mSV8FJenr1hJsGGBKysnZ2sbHwRlwCwBzVdk/YdLe+GvssyZR8YvBuPepxzN7yvLfk5z7KoOEXqveFX1h5cN47gyjAou7x0K8NzNC1qNOFz964/IQ4KBf3LDmBlEaSBpMmz4/vw+oGX8Phqt70F5F5gZsECgtWVuYyJd8cSb7K+tU1LZxGBVYAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SFHgngHElhBhVYQuAr8Imme+F6e+rCq53tDWDPKi1gUId3nT5j2NZVFpjluhXZuLBWTLIwztQB/FB49oBxLGwW8nQqF4/8YseLpkhEOglBlMOEL7VoI/yq7x7kX+M/uoA3i5X5snjgDqlRm4AwDgOgmlZSvpBxNB1WoNRTa7pkD0pEAhYFEqAPoBlwC3bua1UFPCZYUMvyFCygN03ztRcqo/MzonYCiEnXglAE+8ZQb7mLzZPx+fS/CDxsegseMAnGJYbHEj9Cpd/fIlwWT06iVta21LOx9Jp4h7bBiIMccQC1MA5n4tVYj/9QNe8X90N+akmXKrFE3I81CDxYqgQo+BPZwdEVGk+TgLG/zKdPmPQjMOnsOG0F/KQUTOnl5F/w2eqSJGzN2oGATfhFFNZGvcTFZfLXL5usjOKgagdYZ5uGEyqQRII57oXago8AgTSN6DYu6T/wtDZJeVy+ZiVmwjKygFywVXbCzQNBheXt4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82c5568-a2de-4c1f-1601-08d819e1d635
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:01:42.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUmsqZDCL/lbuz6Sh1NLdCXE1PuNLPl4VDE+NEGbLkp/EGPDHl7Cgt9vgQF/kpWKqhsXHTW7TdXBhHmy3IEFAQJ15Rh72OHA5CdpWlhm5pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------8428CA90AC55AD77AF07D9F2"
Content-Language: en-US

--------------8428CA90AC55AD77AF07D9F2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 0.16.10:
>
> - updated image references in README to sourceforge
> - update requirements so that ruamel.yaml.clib is installed for
>    3.8, as it has become available
> - fix typchecking issue on TaggedScalar
> - fix error in dumping literal scalar in sequence with comments
>    before element
> - fix empty string mapping key roundtripping with preservation
>    of quotes as `? ''`
> - fix incorrect state setting in class constructor
> - adjust deprecation warning test for Hashable, as that no
>    longer warns
>
> The year in LICENSE has been updated and LIC_FILES_CHKSUM changed.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ruamel-yaml_0.16.5.bb => python3-ruamel-yaml_0.16.10.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.5.bb => python3-ruamel-yaml_0.16.10.bb} (57%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
> similarity index 57%
> rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
> rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
> index ba095648f..076721a09 100644
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
> @@ -2,14 +2,14 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
>   AUTHOR = "Anthon van der Neut"
>   
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=caf8bd842440b537c044e131785a4666"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022"
>   
>   PYPI_PACKAGE = "ruamel.yaml"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "7d5a5b0a7621a1247b081cc8e4978354"
> -SRC_URI[sha256sum] = "412a6f5cfdc0525dee6a27c08f5415c7fd832a7afcb7a0ed7319628aed23d408"
> +SRC_URI[md5sum] = "02774e7ed3273b3d8eee6c08326b91c4"
> +SRC_URI[sha256sum] = "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
>   
>   do_install_prepend() {
>       export RUAMEL_NO_PIP_INSTALL_CHECK=1
>
> 

--------------8428CA90AC55AD77AF07D9F2
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
    <blockquote type="cite" cite="mid:20200625090719.16068-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.10:

- updated image references in README to sourceforge
- update requirements so that ruamel.yaml.clib is installed for
  3.8, as it has become available
- fix typchecking issue on TaggedScalar
- fix error in dumping literal scalar in sequence with comments
  before element
- fix empty string mapping key roundtripping with preservation
  of quotes as `? ''`
- fix incorrect state setting in class constructor
- adjust deprecation warning test for Hashable, as that no
  longer warns

The year in LICENSE has been updated and LIC_FILES_CHKSUM changed.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200625090719.16068-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ruamel-yaml_0.16.5.bb =&gt; python3-ruamel-yaml_0.16.10.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.5.bb =&gt; python3-ruamel-yaml_0.16.10.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
index ba095648f..076721a09 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
@@ -2,14 &#43;2,14 @@ SUMMARY = &quot;YAML parser/emitter that supports roundtrip preservation of comments,
 AUTHOR = &quot;Anthon van der Neut&quot;
 
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=caf8bd842440b537c044e131785a4666">&quot;file://LICENSE;md5=caf8bd842440b537c044e131785a4666&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022">&quot;file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022&quot;</a>
 
 PYPI_PACKAGE = &quot;ruamel.yaml&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;7d5a5b0a7621a1247b081cc8e4978354&quot;
-SRC_URI[sha256sum] = &quot;412a6f5cfdc0525dee6a27c08f5415c7fd832a7afcb7a0ed7319628aed23d408&quot;
&#43;SRC_URI[md5sum] = &quot;02774e7ed3273b3d8eee6c08326b91c4&quot;
&#43;SRC_URI[sha256sum] = &quot;099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954&quot;
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8428CA90AC55AD77AF07D9F2--
