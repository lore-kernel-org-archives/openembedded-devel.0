Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.62])
 by mx.groups.io with SMTP id smtpd.web10.44584.1597065150255356056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KXLxDTHq;
 spf=pass (domain: windriver.com, ip: 40.107.237.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/2CRld8tzrTozk7TmUqvrtqrOgD0GbarvAvzo5/pgTh1B3C8ybpY0sc510dRE8nAZuhKgxD8WXFeIt0KPLdhRYCPFM8izDyWS3z+FsPEEpacjDo/ij43DfAqr6x+3Ccf588K2gl7pdsFg0Fa4VPpPgTDxZ3tcIZcAwI1Thtcn753eWF/7ZY8VQX5oBKjXadg1QguLzVoHG0m7jvPIPAFnVZiHg93dCcQoSsgu9HCirC7S+sciFg2F6s2p4P2/OdM5OpdwbKKdmfrKIjyK/TurfyDUt06En8h0Cny3v+sAS1/T4fvGqWtsZexmIw9OzJTnHjH3Y+PN6aSgEccNqpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0AYaaQnFOfVRJ+q9BpZxriazWwWskBEfXw+QMvgbU=;
 b=OEJVeXdZ7gI1xEdzTePjY+84bCa0xgK0v8nPiRadQ8NVA2HSOoQdBGLskLqtDsb6+PePnbdxm9CcB6QT48Hf6UZ0W66yxSCBrnbxlBJM2wvlDUMaXk8Krm+oGs7P1ft6CqWtxLUZtVLbcmfMuk7eaPsR0V7CXNmNsp9ZHctseUQIKDE4ZWqzotEO48ciai+lS1juam3uecWVygiS8JpJG2IWTeigVtJ5WNMsApiS+SmT/DJjvyHEVJbKJuBoWIBT48+Uz369bR0t+BGadEqHOBp3mwOeKiAzSh+y0sYHRJ4WLJWHGEjFOpB7aHmusBse729b6xqN75k24EvBxtzoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0AYaaQnFOfVRJ+q9BpZxriazWwWskBEfXw+QMvgbU=;
 b=KXLxDTHqbpJhaBH8MEqZvJlfaZnSApApT1sBuS4IqVaxsxsHBmSDHtQHMD7yC9/3q/5GCEuyqJn3fYLE8Fb40ah8UKL32CdL9bsbzPIHf5eGLniaXlJHhZQNKpQv6RH4pBMfKuhvVp+dJNh35D+UjMb4EfTIejEleXNJyv3zn7c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:12:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:12:29 +0000
Subject: Re: [oe] [meta-python][ 8/9] python3-parso: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-8-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a081de31-0770-e93c-b7c7-a0fa518204cf@windriver.com>
Date: Mon, 10 Aug 2020 09:12:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-8-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:12:28 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d07500-93a9-4818-723e-08d83d2f086a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42266A695D75401447CA121A9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tbAd1qbO0KU8enFzxQAdJaqQBPJKhzpQjCFk9Zc+aG9O+MKLlDPPRGyRE9T69XuIm3XftfkpH3wliJbD1KpOWy2MMyj9ZRycO7LDtCh/1X6nvaARUJgN3IZyCFAoWFTlCUiEDYHhqxk16Hdeh6a4Y2oNqkYA1APeNcFr/IUPg8sW9XxhE9jGaVrIusnnIg8PLvT0Ikf2qRypXp4Il6VhWwZGCDJV8iexvjx6ml5wDVpFx62mGmSYetxSjPgUUagSvBCSH2S/mYCoeN4RYitwnPObdkTRkLKAI2Y5120ubM3MBfH2N2Ie/vCLYWwG02fLlBKbBXiu9Rh4SQ3szEyQhMs9EdyDz9Mn8/2pjYUHhAu4s2rrQbJk6NmVSodqIauglh3hz0wZJqXRJWdbIJePknMfgUWh6dhojsHRRh68OvAw1qF7/pC9n4m6FZIf0rjORX+LgXYM8UO1Nm65Ieusrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(6666004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ELErtovRptZgrvzgx5luCXPTlRI6jSfbBH91bRFB9Kz43FdMWB5kzEzVp00B/pTSVwNmGVx8UuHwq/NYC4qhc4RLG0SxMo9fUzV+bJ55Z6KCl8wtG12h9ct2Hs/xBtE2SBZ4foWiLNGS8X+R2Roi3xFY/zfvDteg8vIO6n/Ft8/aP7lAh8Uqk40kR8N8H4aDyQd4Y5s/LeWpdYY2oWVcCpfPJpJlbNF1oVceUwvWpSbQnXy5w+NFZc60VnP5Oll67rh38Y8FyIHHeP+2H1/MmXKeTzhSUQxKkrU5xex76ACyHVHHnuehcQZ70cE8HSeS0++fKiIp0PHFk2nLlg/l/463vsjbzB3Yc4wNrtVXmB/1NUQJhhCKR7EfX9yV3ZKf8aRkK8lrDBL6k1T88Y+BM6ix9Pwl1X+btb0E3IZLD9j1gEpeJbh3sf79o2Y0CsSArLhZQTEGXB5iRlMLwcrTNsDBZwWQO2Zyrfl4Hm6PD4wvFDKbuKDcnSK1074Wn4CZjy7hpCdPANRtjkwd4hc+pwwkBkeDt9NtUGIq+BFhYbjaru6nRV631vajPKEaIaFxKoDuR3t4vdnnLOanq70SKpdFiVi+DhS+xNRnUjIjMbdMA/XPLP4xGkA3/oYNiYIPNkjGbMYwtQG1Rt+7dqIRNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d07500-93a9-4818-723e-08d83d2f086a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:12:29.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcxyHhwt8gjY8lI2eC4Aq61XNg4upeaOdSVnodn65wxbOpvqTmKyL48C7F+J7aV3YxL2Emc1sozhjf7neBs/x4Q2Bj7BEzbpLekjc6vwtFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------1E52AA57C64D842312D7A09C"
Content-Language: en-US

--------------1E52AA57C64D842312D7A09C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-parso_0.7.1.bb   | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
> new file mode 100644
> index 0000000000..6d775227c5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "A Python Parser"
> +HOMEPAGE = "https://github.com/davidhalter/parso"
> +AUTHOR = "David Halter <davidhalter88@gmail.com>"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
> +
> +PYPI_PACKAGE = "parso"
> +
> +SRC_URI[md5sum] = "eac40cda515ee71e3bb008c404ca3ac1"
> +SRC_URI[sha256sum] = "caba44724b994a8a5e086460bb212abc5a8bc46951bf4a9a1210745953622eb9"
> +
> +inherit setuptools3 pypi
>
> 

--------------1E52AA57C64D842312D7A09C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/20 1:04 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200808170407.2326879-8-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-8-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-parso_0.7.1.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-parso_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
new file mode 100644
index 0000000000..6d775227c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;A Python Parser&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/davidhalter/parso">&quot;https://github.com/davidhalter/parso&quot;</a>
+AUTHOR = &quot;David Halter <a class="moz-txt-link-rfc2396E" href="mailto:davidhalter88@gmail.com">&lt;davidhalter88@gmail.com&gt;</a>&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f">&quot;file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f&quot;</a>
+
+PYPI_PACKAGE = &quot;parso&quot;
+
+SRC_URI[md5sum] = &quot;eac40cda515ee71e3bb008c404ca3ac1&quot;
+SRC_URI[sha256sum] = &quot;caba44724b994a8a5e086460bb212abc5a8bc46951bf4a9a1210745953622eb9&quot;
+
+inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1E52AA57C64D842312D7A09C--
