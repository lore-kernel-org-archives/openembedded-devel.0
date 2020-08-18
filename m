Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.41])
 by mx.groups.io with SMTP id smtpd.web11.67036.1597759550121896296
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=X7vVj91C;
 spf=pass (domain: windriver.com, ip: 40.107.223.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LffF9TkNlEWka5gwNAnYoFWVWwk5wPOf9W3BViOQG1Nz8czBzw+PDb4qssrJNkFqFs2waSJjcoJCXds1Iq+S21l16AK6TH4wLxhNuW22tFN2MFSj8+ydrKzXZ5ozhrxyhKjiHRD9W4ScodudtON+QiKuJPNY9b+PyudUYn0Am/7qlmQ+7uVGbbamddMxjZ1iBbtmsgo93M74DRzljLufE5Q3GiNYvE7wA/Ip97lH+wtqmP6Pm4UFEbGaYP097Kb6GYHZb/5U6b0h3w9WNkLL2DXFzGyedOT8Kz1+tEKCSMHxJpXKIGlq1SILHiaXeAzubohxQFUk0A9/HQkAgdsU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UIuWhTMZ+ZYEaIcjNNee3coxltkddt5AJeK74MmMH8=;
 b=IdfBTsMh+Ao3fVDfffr4Ycqu1eQeTrgY1712VJvepfr/QmfTqz5UFaThFZD5LJDLaAQRqK3FwCNhx/EsBfz2ESLzV0qNpMtZutFYZPdnZiCnbGszmtlNnnZNSrDswRB1AI0FuCfXt0CpZaJ7VSMneBUVNQhdsqe1om9dT1/I1XzM8woAy6v2kdkVLXG/HTXTRnXmdF90rNmmPsnFC2Te2Z2ZYJ+Kpvjh3lBH1NBl2G4cJSNOooHqW7Suk3ZTFrZ76tewgqp32sGogu9BcNM57U+Phiul2RbAkQ/qKehmCJqRqCfCD186eZyJ8HgNwmE9CIAMAAnNaK51inHDddTy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UIuWhTMZ+ZYEaIcjNNee3coxltkddt5AJeK74MmMH8=;
 b=X7vVj91Cu1Se9ttPYM4tklIEFf+Q0Ncxrg4VjjemtQ+5u178Ghnc/HknOhfsIdr4kgK41ElbvNyz7oy9jxdF0KRyaZZ5bkvGDKlwTlP3zrXChz0zPD/DH5C6PUaeH1dhalGBZ7yslH5GD654xriY1WjaR+L0uTe/BnflkadZrZE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 14:05:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:05:46 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pybind11-json: Add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200816071300.1407768-1-raj.khem@gmail.com>
 <20200816071300.1407768-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <825b422e-2eb7-8c5a-eae1-4593a5eeba47@windriver.com>
Date: Tue, 18 Aug 2020 10:05:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200816071300.1407768-2-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 14:05:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f62525e-3014-4801-78d8-08d8437fcd41
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726557ACD153B097990BDAC9F5C0@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d5IrJQPiU2SiM2HjdS77qQrlIlZGWuqsqhJflxgM5daNY8LN+ZWKIy5z/5iebCPu3eGWyZVMdJxKghfdOkTRge1ecOp9jvIFJVo/B4/6aw3t1wmhhzpayZqdx3CbS122HLjQ64L7y3HX7JcJJVlKnGxBAzbgxUr4/UViP6ojIEM6CaYTRuSdv8yQSv3kEMVjmHjzxrmr9KjP7oNrvxFPHFfQDZ+s03MobQRZsgQ4ZEJ5Nb68v/ozb9fwIyVjPWoiE/ZZUake6fBIO+8ZgWJ8rL1MhthtAKFxgJWe7ZLTzUYSKCDykhRoGosXFp7jk0FmjSOzi9qJscLXpqPeixrAPN1I6JzA+A2to9UPQho24HM++FODqPGixxrEokvNWn+y4TSb7hlUanlNJIpEzf7CqiOssTL9jNbrM2pqwqe3kiPWKlY/N6/UOAr6lSi5gIupMzMjPvkGpUihlgRGStgi2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(346002)(366004)(396003)(376002)(31686004)(2616005)(26005)(6486002)(966005)(86362001)(4326008)(956004)(186003)(16526019)(166002)(83380400001)(36756003)(66946007)(66476007)(66556008)(5660300002)(31696002)(478600001)(44832011)(6666004)(16576012)(52116002)(8676002)(53546011)(2906002)(316002)(8936002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OA6Yfd8SkpB+QQGQQxqPNKrIeKXX+4PwKikXlZ2+7cUSCp5d2P/SLEZWJV7R/itLFrexATHFmO6afb1QG5aFeaLKeMofzIaMPZaSemb5at0Oe/g+JIGJxuPDQcfNYOmWZvQvqQtC+SpDozkgU43tTTBjaTGJr3EQzdVk1TeJOXIUJxMKTxFn6hd63QB06A4vjShp2coFFK71UR0Zvj1i/eWkz4uvBEQ33RYd0U3z8xb1JhAwx64FzTvo3d599QilRxU1JBW3al01EwpHW3YELdedEz8sEcFnsvAhxa1ZtPGBr2FGVW7bIrTLW/OTZmbKf6fefIOZ3Azz89GGvwCJ367/9VE0N3MyyvzRBh7iE+iAWBi+wmgNnktRSjaVCrPF8DvAnZLfbYr9r2IRH+qCQ26huZLeRUM8pspC9F4oVa4UlMOIUJNzDhkhqhjzasasgR/dm5UyOG1U0kGE6Z9FrxJhPlcC6/GFYQ49lIWtgWPyMcSobY4vsyhxS0H8zI7js21tTsSCjNQymBhcV6i0DL3od7DeOCN/4/Y7R6jxZSbszCyv1svJtPmu/oN0Hmg+UghLDAU/IP02UFZov/HthvtZv/HyeE0MOjHza4fXPb4QTOyhvB16v6mi2KEnyaCE+BOD65oShnQvZJjnpg5MlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f62525e-3014-4801-78d8-08d8437fcd41
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:05:46.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkhuie4qdmwjj76kWgb4dkq1LvCjbgVAlQOcgdMMHZoNbbrvCSRbvv+eWaxYErtFE3ThUb5+MycwChnovyHqonZhILVZKWXp9Ej1StiBhbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------3D6B432AD364BB6C37BE5AB3"
Content-Language: en-US

--------------3D6B432AD364BB6C37BE5AB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/16/20 3:13 AM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pybind11-json_0.2.6.bb            | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
> new file mode 100644
> index 0000000000..c56c70ad37
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Using nlohmann::json with pybind11"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
> +
> +SRCREV = "d1d00888bc0eb7c50dde6cff1a5eb4586e620b65"
> +SRC_URI = "git://github.com/pybind/pybind11_json"
> +
> +DEPENDS += "nlohmann-json python3-pybind11"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
>
> 

--------------3D6B432AD364BB6C37BE5AB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/16/20 3:13 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200816071300.1407768-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200816071300.1407768-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pybind11-json_0.2.6.bb            | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
new file mode 100644
index 0000000000..c56c70ad37
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;Using nlohmann::json with pybind11&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98">&quot;file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98&quot;</a>
+
+SRCREV = &quot;d1d00888bc0eb7c50dde6cff1a5eb4586e620b65&quot;
+SRC_URI = &quot;git://github.com/pybind/pybind11_json&quot;
+
+DEPENDS += &quot;nlohmann-json python3-pybind11&quot;
+
+S = &quot;${WORKDIR}/git&quot;
+
+inherit cmake
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3D6B432AD364BB6C37BE5AB3--
