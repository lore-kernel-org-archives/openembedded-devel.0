Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.53])
 by mx.groups.io with SMTP id smtpd.web11.2215.1594578193988678138
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K2I8xzdW;
 spf=pass (domain: windriver.com, ip: 40.107.94.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3Q9mO77AF7jZNQPo+ERX5E8I4m8PeSP2eNjgpExniqMMil4SQfzS7MVKQRZ2tITse2IisIpyg+9FY0bxRKmKntN45ZuAHLGTl46SCbK1hV15+husghQzxQAQlDKUmIzxRkiB4QSXNrvqi99sNPUn/SmXKC2/QDyMEDy0scRFh6K5suy+Q2wH9T0Tm06pOuTQ8QDEJ81kUzuvrToFJNKZuoFaYIcIqRqZCC8SUQ9Wp96R466J+beh9sc8uZHZru9zKH7xDaYG5jWePIc0GLQXt/HZuVfhsYyR5NFLyUBVUTLfRTBHSW/b7lujfvwLeTrVedubs5QfV+9t2oG0aio4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4EQyVR9B/NfOodbR+00t4bE1cHReg76+I6HIiW1o6A=;
 b=BbN4zwmHh7UsmzCM4RVQPDU4BQuMvkW8zxduDrolZUigwydXgqjWTSoHMX4X9dfPbJEit1ZqIAWAHoUP+nNK0rMq6zVF0lO72iRkamt9WsMn2H7kDOB800rAUMv4MPQyS3EoTqVW8RLFgS2Oy62uKxC+sIDnKcrSmyTyxsOtxeeyq3asWVMRFoXCbBTT+vUUoFWe8Q3LWdL0FYOvLPGBa9em8SXWiwPYsSgINNF3+S+UxCgDM3mRr7LfOWi4ZHv0fl45Eqbejk/w/OHrdW6NUJSv4GPRG4Yg4oHXmgha5Nx05EgsEHe/NZBcRe+dwZ4uCJDKFbohEbbfOg73MAF8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4EQyVR9B/NfOodbR+00t4bE1cHReg76+I6HIiW1o6A=;
 b=K2I8xzdW8uAhQJ4bIPGI1BEeNGCKl8XOhFtuAWbh1wJZnVKNlGpGDmT4PMfHVeKBKwIjbVMckKGoeTZiMsQg9/4x09h6HON0IMkcsocxXYb6KHcZFWKplOKnSV4o2womfKmlNI1Y3Qo6XNN+5KCqhCLI6CyGb2Z2c2YBwoR9+oQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2844.namprd11.prod.outlook.com (2603:10b6:5:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:23:12 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:23:12 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-pep8: add recipe for v1.7.1
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
 <20200710181555.29809-3-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <79bcb7bd-9312-6e21-b97a-8237007575c3@windriver.com>
Date: Sun, 12 Jul 2020 14:23:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710181555.29809-3-sakib.sajal@windriver.com>
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sun, 12 Jul 2020 18:23:11 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94ba0899-8f07-4074-c388-08d82690a2c6
X-MS-TrafficTypeDiagnostic: DM6PR11MB2844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2844603390975D0D9CD956759F630@DM6PR11MB2844.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aix8kYvv5iMRqxeO0w/sb1Xh1GUtfQwRRYr7bYVqENpSeu+kVRMkRZXco8K9CYhTEmipb2WkTjvJhGfs7caNHe6+ChlZTYZDKXXITStISdVvnfZUXNOv7sHAt/CdhjupQA36pRZpVaehOzeGFjzQcwcw88grDN0qm4Wuc7U/dIXUV6vM1rl6DwBZJROrsF4cdAIHyhxuxU+ztfgqw3yLbU+EQUL1uNYg3WFjr4CijDQSDgWMrHNKguijhadR86SV+fAiLdPY0UG6MiqlcOx1E/sFR2aAvc+ym0bpYwVo+rTaW1yNH7BI9qrK/++26wXk60ZpecUiemWIw9vtFbHSozEY4sIzhVlHfXFIClGfc1KpU/V1EnThuiWG3gidu9WuNv3ox2CFKTYQzoW2qr8KJke9mg5AroLzNMSCzbd0ETYd0dmg4qKkuqUbNiODSCZuyPBlTp0Giplx/641lch9jg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(86362001)(31696002)(31686004)(66946007)(52116002)(66476007)(5660300002)(16576012)(66556008)(26005)(498600001)(966005)(33964004)(53546011)(8676002)(8936002)(6486002)(36756003)(2616005)(44832011)(956004)(83380400001)(16526019)(186003)(2906002)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QqU0E5fL1Z8bkeYMRHzAj4uAj8GqxdbZg4WSF1U4N5LHB9wiN5lgY2Tcpy55NIlzY6ItZ/ZU40ve3esjmCbjfkGMsW3CJIHcZf9Fi95zLzywIRdxJ7svlLkjZJlWFSatuyKE/f79jVz6uh9llTx2hwHfuaCYVy7y9tsV9x3Te+Y2cKlcVMBIoa9Vj4wv49k3W1reSzlibdqBfFJaEo+PZdDJ9TXXfAHOmnpSv8VNp0FzqQRQnDZCPAxb5idwH8FQKrtLhxHrGncw0aMghhq+d2yCEF4NSaPcf5rho1+9e+Xc2Pw+IiaevVJJJIDmHgLOZ98K5Wkh5YKw2cmeZCLaoe+E64raLkjIBwwPlSXGYG7x1y8eT8GMyAxuFGUT/Q82LJ5cDmXnsdCsu/ZihzglRJulmYTS9KQ0i6N8fLb8E/sMpJ9h7PpN76rnpAq2GWV9Pxsi16047bzChM07HHTgZL2TYfMIfKv545AVaYq0ex0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ba0899-8f07-4074-c388-08d82690a2c6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:23:12.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zlLZyTqqgHir4rprb2+8gTNevqaO6M3GNiVERg1vd3VOMLUw4C9M7IIaVz0Kf4onEof8q7V5xtzETnGIoE/X/FTKzrKJVtNRajllN44eT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2844
Content-Type: multipart/alternative;
 boundary="------------D38503E708F528DF94AB8E17"
Content-Language: en-US

--------------D38503E708F528DF94AB8E17
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 2:15 PM, Sakib Sajal wrote:
> Recipe is brought in from meta-cloud-services
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pep8_1.7.1.bb                | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> new file mode 100644
> index 000000000..8291281ca
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Python style guide checker"
> +HOMEPAGE = "https://github.com/dreamhost/cliff"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
> +
> +SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
> +SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
> +            ${PYTHON_PN}-cmd2 \
> +            ${PYTHON_PN}-pyparsing"
> +
> +SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
> +SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
>
> 

--------------D38503E708F528DF94AB8E17
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
    <blockquote type="cite" cite="mid:20200710181555.29809-3-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Recipe is brought in from meta-cloud-services

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710181555.29809-3-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pep8_1.7.1.bb                | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 17 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
new file mode 100644
index 000000000..8291281ca
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -0,0 &#43;1,17 @@
&#43;DESCRIPTION = &quot;Python style guide checker&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e">&quot;file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;a03bb494859e87b42601b61b1b043a0c&quot;
&#43;SRC_URI[sha256sum] = &quot;603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-prettytable \
&#43;            ${PYTHON_PN}-cmd2 \
&#43;            ${PYTHON_PN}-pyparsing&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;603821d06db945c71d811b5a8d78423c&quot;
&#43;SRC_URI[sha256sum] = &quot;fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D38503E708F528DF94AB8E17--
