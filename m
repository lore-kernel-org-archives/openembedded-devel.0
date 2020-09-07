Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.81])
 by mx.groups.io with SMTP id smtpd.web11.555.1599494991929472306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XNHr9/ZB;
 spf=pass (domain: windriver.com, ip: 40.107.76.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ7YAajL7zFAQMy1RH3DASz0wTjsy8tsOpR39vy2jHexichblL80zoCtVw8anqpa9oiCpxQzapDv2DKVUTLtHM9MFaLV8bsYZnpslsp3pfgnp26Nl/Qo6y3cD2GG1ZA1xle/8LUa8KkTTeRZnxkb7xC6p6xFTzRk59DTDgwiutAB04o9z8WrYhJPGTM2/TN8hrR3AvUKfsuIRfV5aGuK4MUde5PrsIuGS3ngd9aM86JW67JDfTNAm+eLHxTS2BySgby6TYUAz/+ve+++begxTGuQcwB0F0t+CcyaouRNBA6w4cA7y3xmto837LNzJ2/IUj7x14N83iAAX41qiN2tBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuQdy3w2OKb3hjaDXfDMSoOExLzUw3IRdKpa0dVmjgE=;
 b=H3v7YfoSr99lDOQZJRRAKtT2bDXvB06PDRQ6KVW9RgaXv0hcIYEA7HskK7petgJhhzsVclEwLa3AUh6+3ajK+RVOPzvF1hegt/50W+fA25uK17WX0WyibIX8VSOxFyROg3duEv2GpMrGSQLSz9Bu+0HK5I0oIITHi+QBBTa+CcpiaoCEL/7L/fzfy47GPwKHs3BoR5sLU0P4yqAe6l0zSl108PsZKaC4rPkwh45IyDqHimSouXXuJs8QkskCOEF2p+M1E7CtiUX1zRxVczJ/LL/iOqFio1wKBhna8DpcHBrD57DmbTMr9oieQy0Ja3aoGTPfvppr1eUBDnWYRYirKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuQdy3w2OKb3hjaDXfDMSoOExLzUw3IRdKpa0dVmjgE=;
 b=XNHr9/ZBiPDrgHkmDJejRNL0SwgF1riddOwLmT64HYbSQOlQeU6TcsCvgd5bQkZMdZmPtDLoHDUJhj8MvnhkZnFiCCoi1dp4TmCchzqV2povtwgIDkUlHa4WFCrt42ldmXGo+DvdtgF1L4VF/QVLZb6GFXYSa0HbMTkxd1CZNv8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:09:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:09:51 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-cmd2: Upgrade 1.3.8 -> 1.3.9
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c538d4f3-77fb-4c08-7beb-8b7d3d707669@windriver.com>
Date: Mon, 7 Sep 2020 12:09:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 7 Sep 2020 16:09:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a8de0e-9421-407b-ada6-08d853487329
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36716D6693AC11B61A017EB49F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eYGhdZ9/IMHeTSEDfOTOsZSD54oxUE87Y+dUvRS2jV9SkufFEk3dxaOB4yB7sd5U/lbnkOHutPPlEcgCNDWap6udCuYKzKJKFjC1oNjQEmntmB/30WJcXM9KMoJTlUY8K6BGIKksuN+nX9Jm9YCxVhTyFfmxQpc2OX0rvThsj9sF0XVWOiEfhj6H0n1428KgAg1ehvIsEmwMTSWHS3UmkRIY2jX253MFAVuSprxQ2Hi0zHRQxSSPEQOdn4npUIx34RYM86sYD/fICHocmxZ4hi4U2DnJqOhGDkZy7K2u0Dug34+3tHeVbGlWvYgxH4TtwDEAxbvzVVE/MRzL1WHtWEwIKRSWp1XCOcC/aZ7Y8NQUYtJtNsaNJ8leNLjZqxJ2RH4PCH76nJw1/czxQcJRZB+1Mb1oaDbEi4sOqPfl+zRXw83qHGQgOHqrfMqXGWo1guFArIDb9+r5fxd40NknKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Qozbea/9nx962SD/F4BcUKOiP1Y9NGQHr+i0Om04KdA/pOVeNVI+uZAD7TEb7J2m7VtB6ZrdyDv4Xn2sF2SCzycUp1wdTw5jIMO8+IyqGmgB7A+aQy4orsX4eHC/y2mNDC4e09mX1DfFY5pDczc0ozYvBksD8WlpJtAijiTCx3Exl4bJuFGG4+5/YLu2IiXF994tZ3TtDPJeZRe21St41kFn9bXIqFkjNLLd6D4GzgLc2zm20lzelxnukf1PqSKtO/DdFeCt+YNa79AR/QfdfArfu7udq5TCranR1b9EdXrSsBjNipjmY0/hn8xrGlCZn0ucD8Lc4eq+3I89Trz0se7FKfXPCBcFSzLb/QEjcxhSDCYGKYUQqp2SkC3rsooc7E/ua9qNxMoTtPEEun+Zo6bFPPWU+ZWkNOCXfXn86LwwlCP6wf/UPZLDWIo1HMokp0iwGSP8p7xx7LnW111zsKvhnpXOC4+0uESw+XXR4FXwUlhrAn6qYRFY/s88azUaCC7Qb7SSYuHN94kWeeI85y1o19ZKT39loC0W5Q2ie85RpNwQDBZCE9lhaTp3oiT869foxsPwHmHD2qqDwN7crLp+k+stS8A64NDE+I81dJJWOlBboWm1sODE0wtsn8bD+8K8W2UAnraZtpcyV8JJhg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a8de0e-9421-407b-ada6-08d853487329
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:09:50.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5umpJdegzv1AGrWfgt4ODXp52Fq58QNDI3O0pYS4iFEoF0iqtP+Du5ExmL+iDzgZTpGEat+vkRUS39ElKbOTK7kYAg0zmG4GuaDHPEZXxJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------EEC54C1A30B45D87AF5F6562"
Content-Language: en-US

--------------EEC54C1A30B45D87AF5F6562
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Upgrade to release 1.3.9:
>
> Breaking Changes:
> - CommandSet.on_unregister() is now called as first step in
>    unregistering a CommandSet and not the last.
>    CommandSet.on_unregistered() is now the last step.
>
> Enhancements:
> - Added CommandSet.on_registered(). This is called by cmd2.Cmd
>    after a CommandSet is registered and all its commands have been
>    added to the CLI.
> - Added CommandSet.on_unregistered(). This is called by cmd2.Cmd
>    after a CommandSet is unregistered and all its commands have
>    been removed from the CLI.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.8.bb => python3-cmd2_1.3.9.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.8.bb => python3-cmd2_1.3.9.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
> index 9fc7b95e2..e677a6962 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "255ba85d8aaa9f00d84917be38b11a86"
> -SRC_URI[sha256sum] = "b6f6254def8ba479088702f97bca1b999c12e0c38ac5d82dc50a44db93c7108c"
> +SRC_URI[md5sum] = "f5fbd528e7b5977ad71466947af61f99"
> +SRC_URI[sha256sum] = "7f8035faafda15d26098bf2ffe16aaba1c78511ce13e0815d2efe58ba392b501"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------EEC54C1A30B45D87AF5F6562
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.9:

Breaking Changes:
- CommandSet.on_unregister() is now called as first step in
  unregistering a CommandSet and not the last.
  CommandSet.on_unregistered() is now the last step.

Enhancements:
- Added CommandSet.on_registered(). This is called by cmd2.Cmd
  after a CommandSet is registered and all its commands have been
  added to the CLI.
- Added CommandSet.on_unregistered(). This is called by cmd2.Cmd
  after a CommandSet is unregistered and all its commands have
  been removed from the CLI.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.8.bb =&gt; python3-cmd2_1.3.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.8.bb =&gt; python3-cmd2_1.3.9.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
index 9fc7b95e2..e677a6962 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;255ba85d8aaa9f00d84917be38b11a86&quot;
-SRC_URI[sha256sum] = &quot;b6f6254def8ba479088702f97bca1b999c12e0c38ac5d82dc50a44db93c7108c&quot;
+SRC_URI[md5sum] = &quot;f5fbd528e7b5977ad71466947af61f99&quot;
+SRC_URI[sha256sum] = &quot;7f8035faafda15d26098bf2ffe16aaba1c78511ce13e0815d2efe58ba392b501&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EEC54C1A30B45D87AF5F6562--
