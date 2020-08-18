Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.42])
 by mx.groups.io with SMTP id smtpd.web11.67097.1597759685088368509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eXiK2LnH;
 spf=pass (domain: windriver.com, ip: 40.107.243.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXAOLo6MFdE6y1z4wquX+LH13zej5dGqDDD/xRY6aEMMYn3/q9lY+D1JPvRKzPrVthmzUxq5ASvBDscftjPW/7wN84fUeNnNO6/b05YQi+k6gfrb5RyLuOzDwhzlDG9XEl5syYfteA4ywcQoelR5pwIgGP1ZMaxZ/KbbslFXp3l6pwbI/j4gw3Jr/dRfMTsxSqFE+2HfGUJqIiipdkh8kOBe8OruDPxBgRHo9hn+2x9xp/qSVf9+bYJoG53Ac/qwhgxYNHZXdhS5xII1YMlIAaI46u82zDX6kabBApVsPNMyb5TkpkvyqC56knX7VaSrcfQjz67ZAu/pbu4gni+vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CayPzTNXB4ffWzHvJPmxtSAk9ECCk9RNcawwWrt5whc=;
 b=ZlchuHGVRrOFdQqWH7svdZ2gMD2q2Yp0FUMuhW90k+12lUJIx43OHqspe2ObDWye2IubsR+Zkbhp0jEVHONTmfNQACsXVxUxR+g0ytGDmvNpjVORzwgiDzlcy3wx/gZ7/iHA+rPdSEsQY/7JTpggozjSMQS20clSkF4RF8o66xknCUbDbNr9AaYYKErtZ/qyzIWwjTABJqw2A7BZJd84lEAcZFm/4LRae3Hg/75iKzl7oJXo40/pC8CWb11TtIcqb1dAp+RrwXHI11ZUmQydDsxcJ/5uh8ImExOmhHiY3C3kb/D2XX4CTqgLxwhXNxDgeGckNkSHR2g+k1BHf4LOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CayPzTNXB4ffWzHvJPmxtSAk9ECCk9RNcawwWrt5whc=;
 b=eXiK2LnHSOy1goTugVHbVJn/yl9fEAAKvqUBhCN+waA9dEQq/jOEh4Sna0KdqxQBXSzYyh69XN644G98I3cQejVx3sz6LLkd4Yfyby/odWD+QrqTqjSAgMrRgX2EA64soak19fa+FlXvFVeNnD/Q/9C5gxd1B6H3KGtdd7mfegI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:08:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:08:03 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-xlsxwriter: Upgrade 1.3.2 -> 1.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a0d0a39c-6f51-3bcc-76b7-65f1945db61b@windriver.com>
Date: Tue, 18 Aug 2020 10:08:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 18 Aug 2020 14:08:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0557be8f-9a1e-448f-b968-08d843801f1f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398757E3AA9C64D98E4DC909F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lRAKRkJGScoYKQDXIsbol4q5u+j7q2WU246v+1dWlwa1ZG03P72LGWAjgdMqcSyq8RUwex3xzTZSanXZLnmbH6dg9LaFabe/HUlDLAR4z3Wqlrlj0eCjAVsCglkWlCQVbawdc+j2s6YOFQl8EGkQQBYSWEFiBzDvdOQfP209KuRIcPWHktYW8afIA6Pc2/YuJRy5xM8r1ctdR1s/+aOuPzzZNVXjnN/2E6qwsX01HTcALrmWd+bPWOKVGIuYEbFO48qRFR4e9w8IGXTpm38CuVLSoArJXeIdAhwmedzCJPrnMmXT9yP8SfL2NgbdK9fYOMts/3H1gj63xt6q0vyA5wkIGBUrL9IhsVDY4iJFkGl1FyCwkLJ7hEYr7BMiX8eLvp2XZX6ywlOuch7ynU2pL/xdpNt1fjfZ9cmsvsjXclTC685iRBn0geCKtTAt4fIMvZbicy3GR+dnW6/0ouq3xQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LnMl94YqGu/WEi5BVkxt0chGSW5X7Joh82g/RkOHwVDRkwcOGBPWLgiwuiZYtU7tT5DvqjzZv4J/D8p58UpnVCtKCJZqHjeshjRm/ZC/Sa0LOPnwlfhB7lpSG4pY6aUfdJB48CKSLuNomCkD6LZDNUzB0fZsdr7Ld0eqFJlT70Cfhpd+hsSFqsTK4AA5lDGzGdAfz/+q4V33aFnWtLUJAMlyZR8iCfwUSZWCTlSaZmqsXVFe4LF+pWobIOiQn6PmmEvzrwTyKNNkdIrMrUqhIle4wgceaE/4q4yvN24lBDY9brrCHGCdntHu4NTBP9CAYXmeMxoLbVTE5fseXFv/zd5EUBjq21ukSlO4ROXN1tV9dRhjHF/eZDht3LtidYfVC9IJqqFw0bbq8mYgnDWiQr308nc2mHzk3S+8rZvwuuzvZsPxjOaCYpXpsgvdMs01JWaImT2m/O7cBMyvWFU8Grp43F/w1ucbisRriZo1+Y6OaUykLQ2pzgopGGHZLiQAZMVbEhi9vuhqPcAN1yfBiO07fCEYDk0Rv6GiS+I5sldklmW+WOve7dm8bbberLB3K+ya57DkcUgnanCJTclTsXDTNe6TwcTQlH0j/ril0ysgUkOTubUERVI7xsVtr35aA5SEtznoCfszBHwTtdWMhQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0557be8f-9a1e-448f-b968-08d843801f1f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:08:03.2771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BaSXFE+0XdL0Izm2kpa1xUSuSpwvGJExZ29qcQh/uZ3uBuk47FMd5psa43HUIMe0J8wjyL519bN3JLBvFWOJufauTpcWys3YrJI4UpLYn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------615D2E6B23173B011FBFC6D0"
Content-Language: en-US

--------------615D2E6B23173B011FBFC6D0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 1.3.3:
>
> - Added :func:`ignore_errors()` worksheet method to to allow Excel
>    worksheet errors/warnings to be ignored in user defined ranges.
>    See also :ref:`ex_ignore_errors`.
> - Added warning when closing a file more than once via
>    :func:`close()` to help avoid errors where a file is closed
>    within a loop or at the wrong scope level.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.3.2.bb => python3-xlsxwriter_1.3.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.2.bb => python3-xlsxwriter_1.3.3.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
> index 76f5d1622..e2a304437 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "78fccd0e056f3c1c474e13eec54ce30d"
> -SRC_URI[sha256sum] = "3ba4655713c8c84b428b529c8e353ac028626ec57f348094da4f66fdc573b0fb"
> +SRC_URI[md5sum] = "7c7191afe3149e41dca0e17d535421fb"
> +SRC_URI[sha256sum] = "830cad0a88f0f95e5a8945ee082182aa68ab89e7d9725d0c32c196207634244b"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------615D2E6B23173B011FBFC6D0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.3:

- Added :func:`ignore_errors()` worksheet method to to allow Excel
  worksheet errors/warnings to be ignored in user defined ranges.
  See also :ref:`ex_ignore_errors`.
- Added warning when closing a file more than once via
  :func:`close()` to help avoid errors where a file is closed
  within a loop or at the wrong scope level.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.3.2.bb =&gt; python3-xlsxwriter_1.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.2.bb =&gt; python3-xlsxwriter_1.3.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
index 76f5d1622..e2a304437 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;78fccd0e056f3c1c474e13eec54ce30d&quot;
-SRC_URI[sha256sum] = &quot;3ba4655713c8c84b428b529c8e353ac028626ec57f348094da4f66fdc573b0fb&quot;
+SRC_URI[md5sum] = &quot;7c7191afe3149e41dca0e17d535421fb&quot;
+SRC_URI[sha256sum] = &quot;830cad0a88f0f95e5a8945ee082182aa68ab89e7d9725d0c32c196207634244b&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------615D2E6B23173B011FBFC6D0--
