Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.84])
 by mx.groups.io with SMTP id smtpd.web12.2150.1594578202809750954
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UOlXBDWM;
 spf=pass (domain: windriver.com, ip: 40.107.94.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbGjpD3aITHxyTfu/++GEUNiDvk1gKLnPjiFpEYFIQBWoq9w9sSmpXTH3/zwqSxiliEOkOchdYEgEMKtufsOC6LWHy1XVEfdB7KkiamXUCHv7uC5HtGSW4ziphNRvXjYr8yN2JPRLBUxhT/DCpMctBMU50PIpbFLUUhhDDmDKMZ3yiKOoFHx/bsQbYOhIxCzoHQy2YaN6v6KVypcylq1NNdnHRTHjE5iuJ+OkafDL7qaMia4uFQJxmtDoHmwFKHVY6167hgJ3iv6e8LWhamBwt1+VjX1IkpxMIHZ3Djefzs/jYdetZvGdXM+UBg2tG09vGnUIVTHJqAed9bO//9/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYG5OFcpxRMRxPvSU6MUg83GglMQI9uQQzAPzc4L9ZE=;
 b=WuWZOkQg2VrfKURIdjb0xeeO6RQDe3YkumewzJHguj0IJ6nOxeM7K5Ef5nmp/hu12qDHIKOTxrJ0lJgs0k7s74UNbfxckwyesz8sfrDhtFiMvBkxGQgEyGiYqXf8VZTG2adu45btIVCWsxWT+TdIJkV8okZb113sykOjvFgHw/rDmwe3X2Ns3QGYAVGFCCP4UAbrrdFzUl+1egl4MR1fS8UDDfJi/zvmSbugcGeqfs8qJDRxPQ57i7ap2rtKBiJgSykOVp35FFSwkCc/1ejEdaiQgGn68nHfeZPm2TFYTAM6l03TqvQATTiy2P/JOhsKoaDHJbV+d2ecmofqn3UPMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYG5OFcpxRMRxPvSU6MUg83GglMQI9uQQzAPzc4L9ZE=;
 b=UOlXBDWMrkzLYq7m/caFST48pn3gRt+Tn0yfah94t3EeTVTa2Ith/istIj/oKHpYSp1948baGdqJ+mjjbcMYO72TzKQ18LHWWE8awg8TbNxWHaDZymfq8GS3JWHRcsbi4ooXVuLmpcsnDVGLJFxeHU1CQDATg1mO14he+JQV91g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2844.namprd11.prod.outlook.com (2603:10b6:5:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:23:22 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:23:22 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-mccabe: add recipe for v0.2.1
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
 <20200710181555.29809-4-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <12808ba6-be96-6839-0511-498726514392@windriver.com>
Date: Sun, 12 Jul 2020 14:23:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710181555.29809-4-sakib.sajal@windriver.com>
X-ClientProxiedBy: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Sun, 12 Jul 2020 18:23:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61aa9923-0095-4102-bbc5-08d82690a87c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB284453DF8F94DA8EE5BB55AF9F630@DM6PR11MB2844.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6VgqePwkQaEGaweSMDMl1NLhi8u5EOxRfJJ24U5Xc2eJckvmp5k2aU5FNOKs2IsOZKxXkcK4iwri1WZCrJN6B6BMZ8p7nQtyHhJlvSp/2OcuWOlviYp8RM1+b14b4hYZldoGWpqVDSQqZhkB9QtFFo2p3M44D3/oJ1PwHIAJ6mojgjX5JqMO6nDpYGmbUQChsBA6GaPuMMTAOfUZcUSRP2PtBGAikdlLUnIqAZYPBZRO1S5ICLrQ/JdBHGNg42hHvY/A9yrjN4469iKEl9WIRGyQi381CGghdZJIWhqMN0OjwsLNy1CbQ0DsWObfWnDX6DxYiUQN8GohAqi7cOPmkM6RmfzWsje8lOsbZdxO5cp4p3x1PS76TRaSOMyxppFpGfVvl4/K5svuONZyXDImOzwCak0+DHXlmARJNIUpnF21uHOkd83VgntO7tudllZnOZdOWeSUXbo4t+EK23Sahg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(39830400003)(376002)(346002)(396003)(86362001)(31696002)(31686004)(66946007)(52116002)(66476007)(5660300002)(16576012)(316002)(66556008)(26005)(966005)(478600001)(33964004)(53546011)(8676002)(8936002)(6486002)(36756003)(2616005)(44832011)(956004)(83380400001)(16526019)(186003)(2906002)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/S6tlqyU2VX1I5hDxFnYtzIaSTN3roVSuMf69vQAFviQS5tdFQD5Y2y23Ulm12CMYUYrBaJViCplb71sQ8HSX+iey7fvCJtCbyTkV6ZDrKkAO116GJ2bbS5lE11cg3B62S6yiKWfSA/r+7IZx4328HnsPNHIpvrsjP/w9+Yekw2xQtcE2w6uFt5339cD2SuD/p6P9CyESdKm2LbeAR2Oh7dUbPmrVan8xP0eil9nuXeS92cqF89YqP6Le6eQ6KrPJHnmcqbKjt2bdQ6gamcBi7YVWDJYxXVXKrTzJT8QgbL6qarLbwerRkGi2CkMXHeeZL88RfGDsJqll9H+3HO7zcJtJMrNKhmSGpJGQIVAzuveJAso87IN0cLmP+ZeFrzrXsCF9GWTfQzTVgVduNBaq2JEb7mh7FGA7RhQ7CJOl8HH3RzPXnZ1kidSKNbgvmIr9uYGuJKwsET/UwYFj6xS5vTuYlDS8+Ilmbr/yeEc+GQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aa9923-0095-4102-bbc5-08d82690a87c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:23:21.9053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhHxe3r0Bg9joC6pkaQgiOlWcUg0J4vnCyWF4DK0dBUbj7oyM/8P1m9V7/wbVwH7bUURT0Rh2k0/kvUzrZj93mhZqJ4r7hS7ggiuhgm559I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2844
Content-Type: multipart/alternative;
 boundary="------------BCB8B0FB877E1BBE8A7932E7"
Content-Language: en-US

--------------BCB8B0FB877E1BBE8A7932E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 2:15 PM, Sakib Sajal wrote:
> Recipe is brought in from meta-cloud-services
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-mccabe_0.2.1.bb                | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
> new file mode 100644
> index 000000000..d3a9971e4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "McCabe checker, plugin for flake8"
> +HOMEPAGE = "https://github.com/dreamhost/cliff"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
> +
> +SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
> +SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
> +            ${PYTHON_PN}-cmd2 \
> +            ${PYTHON_PN}-pyparsing \
> +           "
>
> 

--------------BCB8B0FB877E1BBE8A7932E7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 2:15 PM, Sakib Sajal wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710181555.29809-4-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Recipe is brought in from meta-cloud-services

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710181555.29809-4-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-mccabe_0.2.1.bb                | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 15 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
new file mode 100644
index 000000000..d3a9971e4
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
@@ -0,0 &#43;1,15 @@
&#43;DESCRIPTION = &quot;McCabe checker, plugin for flake8&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4">&quot;file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;5a3f3fa6a4bad126c88aaaa7dab682f5&quot;
&#43;SRC_URI[sha256sum] = &quot;5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-prettytable \
&#43;            ${PYTHON_PN}-cmd2 \
&#43;            ${PYTHON_PN}-pyparsing \
&#43;           &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BCB8B0FB877E1BBE8A7932E7--
