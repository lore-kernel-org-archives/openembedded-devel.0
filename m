Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.53])
 by mx.groups.io with SMTP id smtpd.web12.7795.1590591300115873736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 07:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P2POr2p0;
 spf=pass (domain: windriver.com, ip: 40.107.237.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9YFrBgnuzcm964HUuclcbzPkxYK5xQ2GpCzVvQOWdHeLqC/Q3v623HRLkTFwv1PLsqt09B9xcg0KEsAFUvQgUVB//La5AK2GG3pF3B7TivX/mVvBQdRK31jOVQBHuwVrsqp1lsj78661uWbg4SMJh5msM3NiyCdEye1nwyB4+BWtxlMosu03c094waPpTN0wHXpILDDZFY4xUz6onzo59KbmFDIa1/rsyFUZcDT6YZ0iwxVa7J5VIcZwIXWVSihj+PeJdGF26WpUb8AchUqR9mKbtYT2vz/FwHhY7saxXD8jJzjuSBPVRnc4RvS33WqCwXwNSUPEWKsEZX3EAjTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvZHu3nQfnjqHxMkQ/Rkr3lCrE4xaoIyQ79TLAiEoC4=;
 b=NruKQxws8+GAOxO3WcikVia7DTi27wvmZtTxq35OMKINJgMtd8tJhfSGq6RAwgmDiRz5f1CSlDWHjwJl3h1nIk5qKXDSe2efH5Kuwn6vLrFdT6UnzdQBMRJm6UtkGiCPZLzDpuQgqvObvqKtGkAs/nKjHYnIekki5JgD9NV1MddFxz5j9FjhZy+TkPDZXhdIy+ObC4O/r9bX6yZjl3ctWxM5l5OtX++44qbeG/7m1WAoLbgqJ1E3zBMZb3w6aB1qSfJ53yGnC/kteQktZZtiLExuQ5pBCDJarKoXV3AAAhFMWHCZbGx7DOXU1oA7UUZ6Is/3kt0i9dBcJgdzR3AKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvZHu3nQfnjqHxMkQ/Rkr3lCrE4xaoIyQ79TLAiEoC4=;
 b=P2POr2p0VJpirXvEpn2rzRvZZxGkJ0KsCnSsbKQjbJa+vrWz5/Odgwpgak+zdLxXfumogGBTR9uj/APWrJTDQU8lCrrHxmmbxjV2LXuRA/oWKt/+8+b9cNzF5ZQuiW/B+LtggkE5nNzY3hSI6WIy4UJhSaxHzkxrbJ5XxR6BH1M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4065.namprd11.prod.outlook.com (2603:10b6:405:7f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 14:54:58 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 14:54:57 +0000
Subject: Re: [oe] [meta-oe][PATCH 1/4] python3-pytest: Update 5.3.5 -> 5.4.2
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <63953736-2d04-9472-0982-7f46e7688048@windriver.com>
Date: Wed, 27 May 2020 10:54:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 14:54:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fb21413-4c3a-4b46-9cd0-08d8024debba
X-MS-TrafficTypeDiagnostic: BN6PR11MB4065:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB40650F970A1B06058C702EA89FB10@BN6PR11MB4065.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6rEqgmQq3spLHhTWJ3z4dj1CaTHFZPkcAXnQfaDZt94J6aEXf6fv7IjB+bztuH9U91CJ3bVsR/aa7xMZ2xCOlkk7V0MXHH3a6AqknobeqbRmDOXTwc6t2ZNuDRUuJHYqVD1cWh4LzYYsNEEhi9oLyOHsB9W3PbB2DVNF2SuLcTHCH4YZB85b+70R+khBH0crcATOqQ0KpsTX2x3IrcEjbcpiFNM3MjuF/hgvEHymQ0E8dOb/s3fEPR5cDwT9aYkObdJmCMJ/4P6VpWFeTLC7bukMmMt/aPH6HAdhRjq5elEPtHe98o+XmYbRNUm+59UgSrU4nYgHVzr9F+RDL1YqViwzLE/nkiWnz68Ta6E3Rpp4hEXe9keyXvE8DfFHFJfWGQ2FY40/2jIGrn8u4CcbZgJJwN9A1xyd9ndr2MAngMUlJwujsrIRqGscEKuq/YX8MSXbrNkusLQEB8ta3zjWWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(136003)(39850400004)(396003)(26005)(16576012)(52116002)(33964004)(66556008)(66476007)(66946007)(31696002)(86362001)(316002)(166002)(83380400001)(5660300002)(44832011)(2616005)(956004)(186003)(31686004)(36756003)(53546011)(16526019)(8676002)(966005)(6486002)(2906002)(8936002)(15650500001)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9wcUp2q92iRzIKKzETnq17uSV6uTk57oWCqG4EMLTw/Zxyqm3uCdXkSC4msYo7MSuTOwAI+y9CWShjVfkdYnx+FWGHoDZdrnA3xZALaeo/X4hy/+TPUeQf8s9dM+/CR7MTtzTlHvW/3pfsjMy7OPS/VUCasOtFzgfTviBgpopXk0/I4fi50DWCbwlXoCRvLvDfsdMSDN52kJ2aXBXcn0d/ifmRSv+PpsWArcjlEtbp7CnSD1CEav8CKKJuynBJbYrYBhBa2mhBm90RLLO7XBlPlfMEBEsnI9SivVU8S7IdGNYH5rteqTvSQNjFT20QEP1uUw0QdWCK31Qx/nhyWVeOIWGtRiQd77l7lLyOMszXCsl4eAqjZyaC99CgCC1zErkaiJdTUQ59GCHqtQsdd/a1HXOWhqozsTsxiWkFa+R8LL5o4po/NRR3nRNNcTdPW5EB2F63RSXu3kxEncRA3W311Ywnl2OU49WaaWHKxUpyvfwW5hBmC3cyZsQYs9o2yn
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb21413-4c3a-4b46-9cd0-08d8024debba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 14:54:57.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0M9/fmBrs/Hi5V2EuxdlGZawCL4EE9nDqFLp4Bg6vXlUBFXC+Ozl39dKcZBKt/Ni1D2wsypn0PPqAMCNSkZrBVYrchw/Oid8ei8HnGVDcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4065
Content-Type: multipart/alternative;
 boundary="------------03F3EBEADCD97F59B0C54BFE"
Content-Language: en-US

--------------03F3EBEADCD97F59B0C54BFE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/20 3:20 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pytest_5.3.5.bb => python3-pytest_5.4.2.bb}     | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest_5.3.5.bb => python3-pytest_5.4.2.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb b/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
> index 8dad13a9e..9258c21ca 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
> @@ -1,10 +1,9 @@
>   SUMMARY = "Simple powerful testing with python"
> -HOMEPAGE = "http://pytest.org"
> +
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
>   
> -SRC_URI[md5sum] = "d5ef453f723be46d93e0795f3be86c88"
> -SRC_URI[sha256sum] = "0d5fe9189a148acc3c3eb2ac8e1ac0742cb7618c084f3d228baaec0c254b318d"
> +SRC_URI[sha256sum] = "eb2b5e935f6a019317e455b6da83dd8650ac9ffd2ee73a7b657a30873d67a698"
>   
>   SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
>   
>
> 

--------------03F3EBEADCD97F59B0C54BFE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/20 3:20 PM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200526192011.17024-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200526192011.17024-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pytest_5.3.5.bb =&gt; python3-pytest_5.4.2.bb}     | 5 &#43;&#43;---
 1 file changed, 2 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.3.5.bb =&gt; python3-pytest_5.4.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb b/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
index 8dad13a9e..9258c21ca 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
@@ -1,10 &#43;1,9 @@
 SUMMARY = &quot;Simple powerful testing with python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pytest.org">&quot;http://pytest.org&quot;</a>
&#43;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b">&quot;file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b&quot;</a>
 
-SRC_URI[md5sum] = &quot;d5ef453f723be46d93e0795f3be86c88&quot;
-SRC_URI[sha256sum] = &quot;0d5fe9189a148acc3c3eb2ac8e1ac0742cb7618c084f3d228baaec0c254b318d&quot;
&#43;SRC_URI[sha256sum] = &quot;eb2b5e935f6a019317e455b6da83dd8650ac9ffd2ee73a7b657a30873d67a698&quot;
 
 SRC_URI_append = <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch">&quot; file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch &quot;</a>
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------03F3EBEADCD97F59B0C54BFE--
