Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.45])
 by mx.groups.io with SMTP id smtpd.web11.8810.1591916807620855761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 16:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XFMej7kg;
 spf=pass (domain: windriver.com, ip: 40.107.243.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9Khogi113wk6jyZGJLc4PUAdrGjpd5U8/ZzTvBzLbsVpW/jk4gvr1ZbEZWxAqK7WmCjKY4/1Pa9seRJ9NjOo91H+kn6vl/gR0agG6H4Ob3oK3Be2RwbLOFfE7ZjpPaIt1/VfCvkaYEoscxhk91FGPH7PWNNgzQarOjISGGYA7+RymcEuRplQMrRqn9e4a5lOCg2TDHzH1bYd/5yLYU7Ba4AVfuihEJqh4ajl0Z8nqKaPTkQtdH6uZDiYvfc0QpuFTpsKalPe7i9Jh+CIMo8qtJdf8mBscl6ylCI4nBrYv37iPFlxTIwOMpauB4sez7s3Qrm2mhkrD35iFUFaIuNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XPtGxZgUsNB3CKCTSK7zhO7mqj8ydNHm2tJyovcw/Q=;
 b=FLewJdmHHmYQdlYO7a+TxKci0VAAyhznQYI6ZdSEL/jqI6ydNieFmjdKgvsYI+yQ+8IPszq0SXzW5ChFPkiOsLF4u2sOSXV02/abWrhxdPY9+11USmceOGtPCH32D11BclyWMUNx8mqqjC9096xggcdpn3PjJ/PgWTxiVU0M4mwnbxJzUIi5XAL9P5ckrNwK2FMLVGDj5EuXsB0W6OSNghfAy3HRjbUnFPVhz5X8bClJ/+8y8U5csBXb5gGkvIBAPtrq+XPnL7G6wJglyySQvRijM2USNfRqjKtDtHUNZgds2TWEV9hozI2KHJNM4AOPw11T1vW3NwW9XvIC3ZmGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XPtGxZgUsNB3CKCTSK7zhO7mqj8ydNHm2tJyovcw/Q=;
 b=XFMej7kg0IVCCvVw8hoB0rkejo++8+fNzrLvaoAvFf4A2+Lou7ADLzoUFiseJ6Qaaq01Gm9w4bo8wN/4MHqdU4oL/eYLSKtT+s0AZciz57mihbWfFLbjl48biqDCFNSSzJVECqo+MLasPLiTKOsQP1qpMSLZ/25Cv0kAUrbMR9M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3955.namprd11.prod.outlook.com (2603:10b6:405:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 23:06:46 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:06:46 +0000
Subject: Re: [oe][meta-python][PATCH V2] python-django: set CVE_PRODUCT to be django
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20200611060741.24132-1-Qi.Chen@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <590bb41b-42b2-ccf2-92d5-f6c732cb8fc1@windriver.com>
Date: Thu, 11 Jun 2020 19:06:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611060741.24132-1-Qi.Chen@windriver.com>
X-ClientProxiedBy: YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::27) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 23:06:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce53132c-90bc-49f3-6aa2-08d80e5c1d3d
X-MS-TrafficTypeDiagnostic: BN6PR11MB3955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3955022BB088B9F5E73A30009F800@BN6PR11MB3955.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H24zF42WryI/rVJ2PNwkjiD/mYs1A+kv0/fGGx4XaeDiXiJKWqn+EZmwJcvQoBAfxJKz+Mt/evgoiXgnbwAbAShcAQa9Ha5um0Tlz51UuR0UKiOAdPAY/yOWoJPpVoEklJa1W+/xWu1Vv3tL1H1tIVqvtmkMSh6qKMHm3zWn03JwPz802gVUFGnJEFQgGQ8Xo8LSgbFQGIWsp3pp9hzqDQXLy1d5x2z0jOubRgjTutKoTP17NY4CN9j+xH9bKCW9qjwEGF8PeS7KTMQBphqF5XlqM2HMz2Lkgt9lMOv2w98j6M8jptYueRypyAlYvBXC7BvbagAYYbGzMQh+rgm0iCZl8y0UGNF/4yN9YrlmH/lmzyqriFHtL9iSXya5CcZjAxCvtmJXj3Y5I47Kn5oRGOH7qOfgDQgK3JxwbLorLr4y/8TyEy1ntWs8cJQ7SmBhw8Y/HAoIzKEsCjw4OFVJqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(39850400004)(376002)(346002)(366004)(66946007)(2616005)(36756003)(66556008)(66476007)(44832011)(956004)(316002)(83380400001)(31696002)(166002)(16526019)(5660300002)(26005)(52116002)(2906002)(16576012)(33964004)(186003)(53546011)(86362001)(966005)(8676002)(8936002)(31686004)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QiiKILRZYDlpaOAvH0FegYV54oH+xMC4HOsNOUSeiL3sHwAYV6Et1DvocsQIqxpGHAWwQpi6SG2jg4HSA4bqLRplkjCrvNBbWnIQJZPFZG6RXeQasio331+fEu9iBM5FHCrgNfu1/uoPu3ER6mihB6tEOqhGgALZ7hpQE4Wr12B0tOYmlwkvE8wXLXg9GYCFbWRiaUO5JvVwvNIAHtDHVq4GINSu2Ph5VeZyOI2KVgIpat5mdmaIZA4R+7bavMi8Bmv2tGc3PsYrmbSyjkTDZxETCzOVbfUYY2Fpf6SSBUjv0Ro2ZBJKjOUfkhCMG5Wkf8HySTquHhzFkfXNfsgzqILXeEKTMyJurkqUWtqqkBvWVH+IDhR4iXuf+/k/6nkxoxqXKtuO4D+IUtBW0NnPGu1S87Nwz4wMfHcDIJ7dz8MePPdhdOIVYaX4SfGBsxTDPFoHgk1Khvbdc1zNzVuhq0pTYEtClKM22axv+Mw9Pszf+6XYjFXpcum3tYv9NruG
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce53132c-90bc-49f3-6aa2-08d80e5c1d3d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:06:46.5318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8otfQjrN+6Tlv6epAeRz+2UPTZWO7+bxZ1nn/77eF26XRN7xQt1/rkEZcWJH3fp7AmDaS/dRY0qOjZTi0ySXfJtoWVWgCycCnAADJd4lOao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3955
Content-Type: multipart/alternative;
 boundary="------------A76154E659F7CFFF63734B3B"
Content-Language: en-US

--------------A76154E659F7CFFF63734B3B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 2:07 AM, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-django.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
> index 73b7ac99f..c02b3fa52 100644
> --- a/meta-python/recipes-devtools/python/python-django.inc
> +++ b/meta-python/recipes-devtools/python/python-django.inc
> @@ -30,3 +30,5 @@ RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-xml \
>       ${PYTHON_PN}-distutils \
>   "
> +
> +CVE_PRODUCT = "django"
>
> 

--------------A76154E659F7CFFF63734B3B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 2:07 AM, Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611060741.24132-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200611060741.24132-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-django.inc | 2 &#43;&#43;
 1 file changed, 2 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 73b7ac99f..c02b3fa52 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-django.inc
@@ -30,3 &#43;30,5 @@ RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-xml \
     ${PYTHON_PN}-distutils \
 &quot;
&#43;
&#43;CVE_PRODUCT = &quot;django&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A76154E659F7CFFF63734B3B--
