Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.83])
 by mx.groups.io with SMTP id smtpd.web10.5894.1596718912050511621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kzfRNitK;
 spf=pass (domain: windriver.com, ip: 40.107.223.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmVtt/36coYc0jUSzBWPz++N384ABqvxMYFU7ew9KK22OTA/xf8nh9FyvJ5Og+ICg8I3w5qCZhtlZkBOIrhtr5FbpvAdIIIE99Ge9Fh/7A9wICXQc5tDI00KNWdK9yIDjF6U14zR1gkwOVkrxo4CDW+gbVTDkvKbgmqt7J6/wIQIBsuWMqna/qpnfEgr4wMH46gedEukSCNkzp7MoUw1V6P3i7Ub8x/p1PPzsUr9vPhna5TDqB0UyGt2rBwjoEhDct9Lp93lTK2NREoEmjFeBx3WSJ81gCyf7b+o9++R84UMwp94QlIGanCNteOn/GPhfE+9FA6UYXchx1lQdM+UFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8UwSaiLyaj8qp2cVf/wHGI9mj7UssmMUeZ4eQROGaw=;
 b=jHWgSpAWd9BrWxGyQ7OXhBbK2/FrMnIe2wGpKw1KYuLurQlGV/qE0ODQ8CeLs4QrXw+3PVzRBwpViS6F+4DbVyeoUifb4Y4cJNFbUFzinBrLOdFJdK944xkIH0pfR10uKWKJKOcZvGwsY9UJNnmvpjE8Uo8xVgd3kjoa5u7J/n6HNreDPoYXdCXKQb3sbIupBW21hE/AzvsvbN8X0Ok11UOG5mYOZyS52Gxn8wmss07f6eqfP5Uj0Xz1fEguvyxj4fykhn3ey7fuIUiLjWdjBg+Cvk28gFOtl4Xiu6R73al8cLyagZSvLW0sYmrJBjOo4+j//pBe4rrY1pCkKASDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8UwSaiLyaj8qp2cVf/wHGI9mj7UssmMUeZ4eQROGaw=;
 b=kzfRNitKOf/H9Vhmv1DJpV0udL6w1PXXtW0oxFH7Tllhi6tcVUuLGQu+X2TtrbitLyLPJoTkZM510WjT7XgSev30MbqpyDRZUp51CCNZfSALcCda5gGMRRUBw4I+S9w2iPkazIMACMYnM6ZBthHJUBPN3u0Q8PDRTibO/rv+0Vk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:01:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:01:49 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-openpyxl: Upgrade 3.0.3 -> 3.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
 <20200803140520.23250-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8e1b11a3-c1ac-8574-74fd-7c9428a5d22f@windriver.com>
Date: Thu, 6 Aug 2020 09:01:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:01:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e2a9d8-db90-44fa-c348-08d83a08e1ac
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430510521DB019C4BFBA83489F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d1ulpbrX2elVdfYKXAlijq+TW9nU5+RCiSjlzhKy+NAou4oF9e7Cq1AOJvSIOSMaa2K/yxQggiswdYy2I1FdkAX/Pp+x5X1h60DeaW8n4z8j7rxFPtBDl19l6EI/XkYXxjuTVl7hkVjBcYQ4JQHSRrtIb3urBheCfH0kHzt6/F+q62NdoSnr0CyA1kG+a7YU5ieBdsSyjrvkXL4lEazNXkId7Eo8gnX5cTSDM8i/30P/rqRpXws6sUqmz89Rg+kUvVLxJkY9AIoOIfHIRhibo2yzHIM/gTghIKiWFGZCH8erR7cmikvGrUBo7XxhVj50KoNDO+trkyuDwm5HmqGk6JJsKQ4HNzzXfacx8mow5zHiIec1IrQgbaRVgYo9LILrONMC+Zl4Vhyr7SpHvhxoGJgmXn4+59NFRv9Pjp61JwVGJzQuRHpyh34akBTdvk0nom70eSuZc3oYp+w7JpVu0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QqgCeLEc36EtGTx50wjhQ3/VK7U3dvsPf8so7bZ8vDC3Qt7cvkFuGRRxM9S/DRJWKpbWSZZAenwlGu1n6oy2nUZkcCszAt47aQFexzcFiBRxCnjYmF+zuxp7QaDWEylwmHgP2BIVG0ddJKhM3hsH0AGi4YqqUs589w+uwRVlcXVu/Rdn74+IlSgB+z18YLfmWDKVS29AhY8whBuVWUhqFVmugVI1C4IAlNhybKte/UY9VAl+BC1fNZzyYjsejqD4rrVkZbjkHgwC6IOeV6R/uGQkExEe08JVXgh5KqnFCM0/B7+bQ0MZOZD9gThR/OrKSB+8rk0qsY7t47faS7ObLeY+i3g6bsB9X0G1eyxlhTPZ3dJd2gIPxep2fJ69QH3GqTWOnfv9sbvYnOohVma5r+bcU1aPYUYHF7G9JPRaQu++soX2HBldKjJ03rc398/f/lvL2+Cv6zNMkWoF+1oE3Hbg0OR5zmsqgBwSivmxak+ICCQbrvkcXtbX5gSiU5HV8S9PLZ3XR8gFg+QBWGoTCjAj5DwjBoZygDZfpGlAc2WlikJVomO2jeFAebKGE0YEmxyGIhK01rKn6tpJYA7TrZuRmXPB57RviWh6Exwg9/L4gUDHyp9o/RJWj4dgKfLdOL9x4pg2i+AK9wUhZVZscA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e2a9d8-db90-44fa-c348-08d83a08e1ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:01:49.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRLMR3NdTFbVh7Ut4h5Lb/A5zYc8CU8vEUDcjDYXf4A3/fAckf5nbSBHNoUcUArA01OqcYgaHFq2XNVYnhPFAqM16FJ30bcXUm0qrNvduH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------EF588941F8B6E24B7B8EB8EF"
Content-Language: en-US

--------------EF588941F8B6E24B7B8EB8EF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 3.0.4:
>
> - Find tables by name.
> - Worksheet protection missing in existing files.
> - Exception when reading files with external images.
> - Reading lots of merged cells is very slow.
> - Read support for Bubble Charts.
> - Preserve any indexed colours.
> - Reading many thousand of merged cells is really slow.
> - Adding tables in write-only mode raises an exception.
> - Add support for finding tables by name or range.
>
> License-Update: Use the exact line from PKG-INFO for the
> checksum of the license. The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-openpyxl_3.0.3.bb => python3-openpyxl_3.0.4.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.3.bb => python3-openpyxl_3.0.4.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
> index 018c4abe2..d0946e49a 100644
> --- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
> @@ -5,11 +5,11 @@ was initially based on PHPExcel."
>   
>   HOMEPAGE = "http://www.python-excel.org/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "9583cea56b9d4441d96eb63a8a5c92a4"
> -SRC_URI[sha256sum] = "547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64"
> +SRC_URI[md5sum] = "8491219f6bd83ca6ad8334bf77435cf5"
> +SRC_URI[sha256sum] = "d88dd1480668019684c66cfff3e52a5de4ed41e9df5dd52e008cbf27af0dbf87"
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
>
> 

--------------EF588941F8B6E24B7B8EB8EF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.4:

- Find tables by name.
- Worksheet protection missing in existing files.
- Exception when reading files with external images.
- Reading lots of merged cells is very slow.
- Read support for Bubble Charts.
- Preserve any indexed colours.
- Reading many thousand of merged cells is really slow.
- Adding tables in write-only mode raises an exception.
- Add support for finding tables by name or range.

License-Update: Use the exact line from PKG-INFO for the
checksum of the license. The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-openpyxl_3.0.3.bb =&gt; python3-openpyxl_3.0.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.3.bb =&gt; python3-openpyxl_3.0.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
index 018c4abe2..d0946e49a 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
@@ -5,11 +5,11 @@ was initially based on PHPExcel.&quot;
 
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.python-excel.org/">&quot;http://www.python-excel.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623">&quot;file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;9583cea56b9d4441d96eb63a8a5c92a4&quot;
-SRC_URI[sha256sum] = &quot;547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64&quot;
+SRC_URI[md5sum] = &quot;8491219f6bd83ca6ad8334bf77435cf5&quot;
+SRC_URI[sha256sum] = &quot;d88dd1480668019684c66cfff3e52a5de4ed41e9df5dd52e008cbf27af0dbf87&quot;
 
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EF588941F8B6E24B7B8EB8EF--
