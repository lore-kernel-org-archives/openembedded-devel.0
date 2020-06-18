Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.43])
 by mx.groups.io with SMTP id smtpd.web11.1839.1592508680955640912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 12:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VWFxUjLe;
 spf=pass (domain: windriver.com, ip: 40.107.94.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igZ99Ly86eVDx1oki1TPFcsVn4R8wgy/Ikn01tzAKF+4YsYsqS3Xt6jPsX7XK3TvkjwOKXShtkrKrKvFZQyUztWX9B2Mzm0HGYarF/7TkKh2Xh8ib7VDGmdAG/KszNE76vExhf9/t8UxPceA0sftmfCJj0Is67GS/k03J432UNf+FNE7FZSQX679Gbg3iXxWa+3r9Wj8wW+4gvinVRGVhNE8CEB+ucd8pOrX3JAT/bwklA/L4pQYlIlWJTPVHMh8RJIRWVkHWT9MUuW5AxomR6UeQNkMZMasiuBE2lXGAW/UetIoxq4JLsc8OVix48F8tWVA+zjPPNNDrp5KLGG6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpzpMvuj+qbHC5F3nCMZDk1vMVlfkoUrbeyGay59Xs0=;
 b=YpLH9v2Zx+kbjBfcaiFqyYICmilXRgGKLcNLIffQtGIz0lO06g4cbrwA9eY+P70fRCi7O3w/MttxxQzmxlcE3hGlxtsWg9PYtqy+MBhunA5it3YIyAVeEnOjTq0UfJy8D92pLrKlbhe3zcq2XHhycRa3zVsL2t8lfX3HR/HqmwBKTWRs+G+IkPoPbcJf09UZKfqxKjuCB3IZRZ00rmHuoX0QBlP9CVw8C+yNnaxWr+PTAixeBA4bCvTxwcns5qQcHn6ps4UQ+gVj696dXvn3uHf4C/TvUEvA5x8ilKNRZ0UJVPGTVwk8VcOB+I6h/L2MhfbOrjcigmeyfqsNOffNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpzpMvuj+qbHC5F3nCMZDk1vMVlfkoUrbeyGay59Xs0=;
 b=VWFxUjLeZ7n2a+QflRp0AQexA8gNqUu+B5NmCknR4nk6+Q1Zxm5EBGEi0Jrxkj3AafHRurE3Tb4NaAF8uy4Gv/SZD9jgNNDUcT4uRIfp04UJ8qPVlVxJijsIaovF6K2bTJKGTN7v3DMb+xI/3pQ2R8aSnjSk25lsWdgDF1WqGY4=
Authentication-Results: xevo.com; dkim=none (message not signed)
 header.d=none;xevo.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 19:31:19 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 19:31:19 +0000
Subject: Re: [oe] [meta-python][PATCH v2 2/2] add python3-argexec
To: Ryan Rowe <rrowe@xevo.com>, openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com, mkelly@xevo.com
References: <20200617191551.49812-1-rrowe@xevo.com>
 <20200617191551.49812-2-rrowe@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8b6a9a95-7076-a02c-e4e9-37c0a4712a29@windriver.com>
Date: Thu, 18 Jun 2020 15:31:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200617191551.49812-2-rrowe@xevo.com>
X-ClientProxiedBy: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 19:31:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dac57e7-5b03-4024-fc9e-08d813be2d38
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB2050A01A64E03B7B24789F529F9B0@BN6PR11MB2050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ld8fUgXpIJ6JpxoPOYcuKdV2FpgYvSqUVv72S+k1fJfV2RZsOoXCcklwiGXJOVkS9TnQhP9ldgDzY1cl3mP4QbDmQptKmBS2H4rCxnTIdIlxzVDXNAKkoWCtJMh1xUNkZX+By3aJCK6IY8wloKxNbZmvBdBoDGcAJMziTQjCrmbt9txJ+uYfbE9QsxuxJCuYciz3Jf1gn5dpftn7i79sMcQB+wEIPbxT/vPfL+I2bKsF8eihTH5Shc+QmmxwLOHZnyLkvZtdiMghWGsV8Z+d9cjhvmVX/MbB0x4efC2t7gAXUn7RW+aqORdRYMltb8nrCiMmdMB4+LpsUbRRKrY/wVATvuqTD0ZqVJEwXgLGj76p8KPLlopkXMVBM/x+5BzatXMTOwzmIa8Hl8Vh5kHW7waPkaBprXGgYttUVB9WcCqHS/YiNlpS1VaVdk8PEJX2o6OaKxJ1fZTnJVVwhoZ00w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(39850400004)(376002)(366004)(44832011)(6486002)(33964004)(956004)(166002)(83380400001)(2616005)(36756003)(478600001)(86362001)(31696002)(53546011)(31686004)(8676002)(8936002)(16526019)(26005)(966005)(2906002)(316002)(66476007)(66556008)(4326008)(5660300002)(16576012)(52116002)(186003)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mstrvz9M9/U+59yZVDDzRs6+xpCVcNo4ChmORefY9j5rKxUKYxT22W5W7MGaShkFJoA5HNvd3ZdUiukNf/2yF0JNIoGuktHdwma2a7ASQUMcpdz+Dz0SEMLt+Fu+fE4HzAerI+ESbDOtX64upu1Xt4qyAvRFu60Kk3N4TWHeCqgHlhzmvHIlznuu71WxDBOHtCVxfpo4DtGKeQHXvOHV/omDo7iU40whv/ZXw0xJEWENHAiW2I3fWonPghJsRHCPSipXcYnGo5ujfiFfj/olRYk0qaJoOKtgis/xUGvd1ilNLbVUaAveh3a7e+djaROVVnhAUemWa+1lRwcpo/9AnN4N5a+TyzGqE8WHSn0y/2Wmk+dXemfPTFoW4PJrdvmvL6yKXunuB0xPe9+vPdmL9c9dtIskuD/tRDndreIylBlDMGOj19RPrO+YwBOeSqfyrPsDSr3HEqC6pEPbesNWzXkZt8P/0+tZXQSkLM7vmIspUOlun0cwoiH6kRKVu0HS
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dac57e7-5b03-4024-fc9e-08d813be2d38
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 19:31:19.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jC6AFyGnBqp9cNyPAMZD6A95QnmdtCTqzEu+wXTgEMo+JPp3i9p7SxTRrEl5O1EsexhbF0MTw+9gUupeUr5wFl2Q05VNQeWFJjRnUJqu3rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
Content-Type: multipart/alternative;
 boundary="------------5180AD961F59AE6B517B226A"
Content-Language: en-US

--------------5180AD961F59AE6B517B226A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/17/20 3:15 PM, Ryan Rowe wrote:
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-argexec_1.0.2.bb             | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
> new file mode 100644
> index 000000000..179e07127
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Expose your Python functions to the command line with one easy step!"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "9fac09884c54db79e57ab80f0c423794"
> +SRC_URI[sha256sum] = "e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f"
> +
> +DEPENDS += "python3-setuptools-scm-native"
> +RDEPENDS_${PN} += "\
> +  python3-typing \
> +  python3-dynamic-dispatch \
> +  python3-typeguard \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------5180AD961F59AE6B517B226A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/17/20 3:15 PM, Ryan Rowe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200617191551.49812-2-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Ryan Rowe <a class="moz-txt-link-rfc2396E" href="mailto:rrowe@xevo.com">&lt;rrowe@xevo.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200617191551.49812-2-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-argexec_1.0.2.bb             | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 17 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
new file mode 100644
index 000000000..179e07127
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
@@ -0,0 &#43;1,17 @@
&#43;SUMMARY = &quot;Expose your Python functions to the command line with one easy step!&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face">&quot;file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;9fac09884c54db79e57ab80f0c423794&quot;
&#43;SRC_URI[sha256sum] = &quot;e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f&quot;
&#43;
&#43;DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;  python3-typing \
&#43;  python3-dynamic-dispatch \
&#43;  python3-typeguard \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5180AD961F59AE6B517B226A--
