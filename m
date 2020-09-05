Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.51])
 by mx.groups.io with SMTP id smtpd.web10.5574.1599332507179672850
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dwdpfP3A;
 spf=pass (domain: windriver.com, ip: 40.107.223.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzPXnnB5Ue14Sx0BVe4v7Ll0BLnIZweGBo1vACQy57PfHhzKxyQqPzeDrU1FL/re0QmRa+9pcrYZRyXXG+zH6ONh/6YfSu3EwenjQqtXYYLNCOztmyarFD+7Gv1ytJqGn7Bif5K1j//GKiQYwcwShqJ9/SsTirvRNLRQaZ5EAOUypOPASVI8wNAfdErkvp6coPP5YS1aPe8mYpi5HqpFuUf31AcLk5Vy6nW27fHI+/SbepYN+/b0KfCi3pUefQpASXyrpQBVFbS8Q7C0OSUML7dwsk6PM7cBQTtGHXoIXQ0gd0MKK9LJZRfA6jNni4pi0fFVJEew5RRAO5MHq1t4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xeTEp/zFhJEq346n0NL78KDzfyG/345ez0ZaE4Qmu4=;
 b=HDAAz61IeSqPni54oZI+66/j2vYO1y243uCEWH0INLL5oPTqrcla9M+ybyV08c5gIPMn5zrCjyT1dPU1T0xoY0oJ90N5b3mvn8T4EnK2ggfuRlxwAjEK6tLiWNXJJKjJYGVHoKScXQJ/6AN0w+oBbLu2CadOhMj9k9mzMKR0WxWnM7kK5ZM3DEXyHbiIPchQ6Y73dmdn3l/yNrFGO3qWze/Pr4WNADGLruIglRAPChLK52COYfaEgWxwnIBxVOSCt5+IR5VaQabPZf68Ey+Hua/QNQ3bDvNhEt4U314ctQw60GmZj1VUHAw/sOz1LuGI0j/0zHijebmqmkIn1hVPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xeTEp/zFhJEq346n0NL78KDzfyG/345ez0ZaE4Qmu4=;
 b=dwdpfP3AGYA5UKbeofAIeQYyg7n8gdYSMZJ4G4ElPeM1NXyoAK/Grb5GN7KY1aD0K3VVmL6IiiiHO7l04x7Yf0gAdpbq5iLsQLh9cIGNUIWEA6wTI5eJJ9H9KTdfEb+JJ95uuD9l02d/cvDOezTXrrML/dN9T9hPctbCddwREHk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:01:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:01:45 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pycurl: Upgrade 7.43.0.5 -> 7.43.0.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
 <20200902083342.22101-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <79308be5-5cb7-2ca7-b2c3-a1d9ede1af9b@windriver.com>
Date: Sat, 5 Sep 2020 15:01:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902083342.22101-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Sat, 5 Sep 2020 19:01:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c3ecc5f-3af3-4510-a2ec-08d851ce21e3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952FACE86A3C23800DA3B8E9F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zosQqr0IgPDza/cC70ipahyeQ436LJIf3p1MQNgQkM98udgzVyOnjXnIOI8e2a27eB4DvsF+dT5V9rexO+0mUMJaBKbT8xrpG1tE11nNzPuJQGLyv2wtFj58N7wzSaxZZf9t9jCHO6Xv1OfMNBRBlYSHlBH4+136VeX1Ay3gwKvNQcPBOc/uuvgk+egKNcXAvWlpyq5X0+shmau0mHgJ8+QlTaMdIFYDMfrm/MJq+O/tNtT+jLPMX4EH0ORj6zLU7GRSwn+EDdmAJNIx1ZQYMaYIYGmGBICWU9pusE7nupocXKWStfnUZ8GCZaO00MmCeUH8F1IonggMcAGUqqev5WMAS2V+IqMFmOIlupP4kHZ+JdwMLHMiBo+LXeGw+FmJtoqIr7xcl06TnspT0tX9ogzPmPbbWurXrlcyKYuHDmdog1pra3O02vpkKNFXdVHonjDXYwDAA/4xD5iusEvpUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ltWlhUvnECjZtuxGf2NeT3UizWW2aWG9933FdL9qdRHZDGBiAIpfoO3KmFzR0MThpt6Kx9Ot3OHNQIunY198FTchgUT2/N4iMS20smHONk9A68uUAEet4T9rWI9Xdj5JZDj42lUjBUzE7W9PX43TmK5Yh29GPgPHZfMAg+XCuXaHsgRZ8q+7iB6XrMU6WoNqBkcfXKlU0vcIKtM1NuL/OebLrOwLPufIGeEly5mb7qAnmaCgIXnf7FXd/0pw4t0AvcV4sM/3LPip/EFEvWdjSMGP1OwVbU0hAnvXfGgJ9FEjLsgx0eU5taPFHzT+IWelEvZt34dYYn7XIVBdxJ4FtXWC2ZNkbSOyWcV5/jehm/+I6ppMUlSYLoyUrmHX51lgom7hgwu2ApeGKqnYrAVOOTHAXLfDYBBm8tMyznEyVRcLg0u7gvDbpdTkH5o4gG5bTWyt9UApVuGh3RBd+IzIuBRQIeQzPGhm0aZ4vn/dYmpqVxHNLfnud+CUq1aGyTuXib6Ae3KcZOLfaU8Iw6/8JSP9r1+st/w6X3iLDY968TYT6f8euA5eSnBRxBgcP8G25fiZcdXR1Tmo7GSnGMYAdq7JYPsfuubX2lCKyMoS/U6bgbKmFpOROQjGjsbLvzYzdb6InigSt0Xf+8IutE3yQQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3ecc5f-3af3-4510-a2ec-08d851ce21e3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:01:44.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0qIqMoUx8GMPB0Kf5q+cYMJVVGgZLHfZSfL5+CmOJtJRxvjB4EEoSFgoRaizJ9bKvt1Hn2dtZayDFPW+DszeJD+n2TQgj87K7a6tif9z/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------EDF2D5E00C0873D6214B891A"
Content-Language: en-US

--------------EDF2D5E00C0873D6214B891A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 4:33 AM, Leon Anavi wrote:
> Upgrade to release 7.43.0.6:
>
> - Improve SSL backend detection on various systems
> - Add support for libcurl's multiple SSL backend functionality
> - Add support for several libcurl options
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pycurl_7.43.0.5.bb => python3-pycurl_7.43.0.6.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pycurl_7.43.0.5.bb => python3-pycurl_7.43.0.6.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
> index 5a1c1797a..0437a6cc9 100644
> --- a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
>                       file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6 \
>                       "
>   
> -SRC_URI[md5sum] = "0b387d4609ed20c88baede8579a4d425"
> -SRC_URI[sha256sum] = "ec7dd291545842295b7b56c12c90ffad2976cc7070c98d7b1517b7b6cd5994b3"
> +SRC_URI[md5sum] = "3e121d895101022c30619e1bbf97eb97"
> +SRC_URI[sha256sum] = "8301518689daefa53726b59ded6b48f33751c383cf987b0ccfbbc4ed40281325"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------EDF2D5E00C0873D6214B891A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 4:33 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902083342.22101-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.43.0.6:

- Improve SSL backend detection on various systems
- Add support for libcurl's multiple SSL backend functionality
- Add support for several libcurl options

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902083342.22101-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pycurl_7.43.0.5.bb =&gt; python3-pycurl_7.43.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.43.0.5.bb =&gt; python3-pycurl_7.43.0.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
index 5a1c1797a..0437a6cc9 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c\file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6\">&quot;file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6 \
                     &quot;</a>
 
-SRC_URI[md5sum] = &quot;0b387d4609ed20c88baede8579a4d425&quot;
-SRC_URI[sha256sum] = &quot;ec7dd291545842295b7b56c12c90ffad2976cc7070c98d7b1517b7b6cd5994b3&quot;
+SRC_URI[md5sum] = &quot;3e121d895101022c30619e1bbf97eb97&quot;
+SRC_URI[sha256sum] = &quot;8301518689daefa53726b59ded6b48f33751c383cf987b0ccfbbc4ed40281325&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EDF2D5E00C0873D6214B891A--
