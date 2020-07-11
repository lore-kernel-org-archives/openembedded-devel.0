Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.49])
 by mx.groups.io with SMTP id smtpd.web10.1609.1594487937844896332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2020 10:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NF6Pl7FR;
 spf=pass (domain: windriver.com, ip: 40.107.77.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeTiqT89Dy9+ppN6LTR/HzmSQfw90dv+QQlMyzGeOloHXN18c9KJ/0i4PMT+fRXFKmvvrPQRRjd2krnqz3tiqPZ3nAMu03p0aXd/N2qEHL8FpT1nO/mmNRWzhRBDeG2FBJ6lYkdPVIdrqKLemgFP45JFvggZLOEvx14fRkS39qudVMeav59H8N5Op/2vwfqMhy9K/6IwwJNNc78q0ktqmfA+zTSWorLZfNruRfZq+4tFVdDziy6yos7CxJ2kzQZba/Jf5yrvSEtxQar8p6alA0rXLOGL01l1iNHKAdby+XcV0sVh0Qsm6XbYd+cvdaTkn5KnfpXrdolBYX2rc1qjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgqcA28XZ/C6WxuNNLv5tKSyWSq0aqMr7awkLXDlNuY=;
 b=a1UutSmwJBc9g+PlE/E9IC86B1XfchJxx67oGPU1T41B/YAHq74HVuXxdVMivhvh3SvDfvR77pENNkFCV/2TPIU0feQkEA5Tl9O2lEZq4U8q36jeTuqfDdhh0PRDTPV0lILdN+J4LN4t8hOzirT9xwhwC04rbxYnGQa44JnN751TGzkL1waWeIkbXo04MYZNJmHRg2l9ZHbMSjkZQeCEr44H18YYWfBAyKzu9ADn/eKt5ZNOeB49S4ahZNz/9r8NnB3d8Ab2VltjLW82WTWyngI9PYOTIpXezrDJUcvA94KBZgMGjGORSJhxETwIpHoOj8WUvtWyPgA3wILYRg2n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgqcA28XZ/C6WxuNNLv5tKSyWSq0aqMr7awkLXDlNuY=;
 b=NF6Pl7FRIsXHRqgca9njXxIw3lTryBef6farQBqFXyBo5xW5HGUwr9jw/T5SKhIEsj09ij4jr9SxaqUKn0cxdajH9QyRykygkKKlz9pD8fCPP0ET/FPNX7lZnE43uC/ILG5f8AeMB2g+2+44OJ795VRC747RO+6uC/nu0akz9s8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2843.namprd11.prod.outlook.com (2603:10b6:5:c7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Sat, 11 Jul 2020 17:18:56 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Sat, 11 Jul 2020
 17:18:56 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-natsort: add new package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200710040109.22600-1-akuster808@gmail.com>
 <20200710040109.22600-4-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f22daf2e-c1d6-5921-3e16-5ffaa73b05a9@windriver.com>
Date: Sat, 11 Jul 2020 13:18:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710040109.22600-4-akuster808@gmail.com>
X-ClientProxiedBy: YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::43) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Sat, 11 Jul 2020 17:18:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 462c4350-618a-418a-228c-08d825be7e39
X-MS-TrafficTypeDiagnostic: DM6PR11MB2843:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2843483C5771AC30B566C4AF9F620@DM6PR11MB2843.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a7saJgcfxynLTR3VsfUCP8P1LEud759MKxGnY2Q7VCEVFwV4T0moLE5ANtHK8N3elC2s+mLUCXhgh06Sr+6GgZ1H9FT5LfHH06tlhGnvK5km+dPg4xhH1PCSB+MUlPVxpVPvaqhrsWnXzLDxe1uy+9sph7f4wlJvSKEACfevhxl5guaT5bjIIGw+YQ5w+7fCo4IB0rA4noOAi18V2dt4gU+ZHY5XFjH5Ggmlem2TjH4M2dgzIAieMXuygLhn6TxjNlT96Hny0CgJ6AudpTZYgCJVtNTshE2mgp0gS1gaql8O4GyireMBQnZsBUpGNm2Bs7adF+pACvvY+PYy7FeSZkB9SNjlcWhp0O5yz9C7JmWPmf0L33UtVxlL+6vCmbJbohuk5CRd9t8u+d2+fjXSAp4yjeClutv1VvWLQEveWa3xN6moFH4SGR5zzsqb8bc0RJp30rbihOMm0Y3i4bZb/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39840400004)(346002)(376002)(136003)(396003)(26005)(66946007)(36756003)(31696002)(478600001)(86362001)(966005)(186003)(2906002)(53546011)(66476007)(66556008)(6486002)(31686004)(16526019)(5660300002)(33964004)(16576012)(52116002)(2616005)(8936002)(956004)(316002)(44832011)(166002)(8676002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zhnZy7LXSp7SsCgJ4GgBun0wxpGOSIzX+OrZjEx3Po6r5jpmmz8HiCpZPM8e2kGXkH03UjeMzaCCWm8RJtZYnKrmtNOy3sCHiqFov5ZHc0gYKYWw7O3myuSImikxRRP4i+C6AEVr6iF9zHE4ogWwsOWuLaFybggEg14aKxRjnlKnGSufsrr9tiyBiSGpnw1+s0AGb6cS7JA3phjapnP1L+z74BXR7rizd4f8F1tDv2p3WQil5iVrNQBBNENCPgX1dF+FEnPuVB1khEzSOE3/JYxfm4yWOVzijwBc4y/zjlVjLQvCgjVzMrOsAp/vOoF7srF1PlDDlp/7yvxGOZpTDPvRFQoHqFHzM1F64578r+emH0OPLSgTL9Q7MRaPY0IaLKfYb33GPt50tChFinvd1uWlI1m9rPRp3RZ7VI5ZOUtmNV++uU58BB/qocv2sceATTGHj8nQ3FTHdovJ8L1QplJHxODBMUco3cH0Kr75Bf0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462c4350-618a-418a-228c-08d825be7e39
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 17:18:56.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI5pEsjGo5zvowJSXAEjqzr3z+CaLU7nLekRmqMLEAFUCtN8iU7wlvxc61QMXHj1gN/BzBXmcGcA8vChacxD0mcnIzKQ5VHwXu2kIcICJ4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2843
Content-Type: multipart/alternative;
 boundary="------------EDE4EE3977445F5A17D617A5"
Content-Language: en-US

--------------EDE4EE3977445F5A17D617A5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 12:01 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-natsort_7.0.1.bb  | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb b/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
> new file mode 100644
> index 0000000000..e20cdf0fa3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Simple yet flexible natural sorting in Python."
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
> +
> +PYPI_PACKAGE = "natsort"
> +SRC_URI[sha256sum] = "a633464dc3a22b305df0f27abcb3e83515898aa1fd0ed2f9726c3571a27258cf"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} = "python3-fastnumbers python3-icu"
>
> 

--------------EDE4EE3977445F5A17D617A5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 12:01 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710040109.22600-4-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710040109.22600-4-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-natsort_7.0.1.bb  | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 11 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb b/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
new file mode 100644
index 0000000000..e20cdf0fa3
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;Simple yet flexible natural sorting in Python.&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517">&quot;file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;natsort&quot;
&#43;SRC_URI[sha256sum] = &quot;a633464dc3a22b305df0f27abcb3e83515898aa1fd0ed2f9726c3571a27258cf&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} = &quot;python3-fastnumbers python3-icu&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EDE4EE3977445F5A17D617A5--
