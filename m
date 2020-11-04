Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.56])
 by mx.groups.io with SMTP id smtpd.web09.13903.1604501302681982277
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cm+bD4Ep;
 spf=pass (domain: windriver.com, ip: 40.107.94.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxCrxNvj7QRkwdIXMEzkH8jZtZEIjOXiwjntV+wDLisj+ryL1glOvjQSd1dTX/n2B6IiPwLSh7JPWgR6mo+ry5hRek0MEcjO8lhNXjvgeIQ+KRPNhPwdnrdHv+qASVO+aHrP2H002MS1W+GsmSujz14hEaGOcTDkApvjO7FSN2kdJGZwzZeIiVfORdKUt72582cDa38xongAJTpE+0mbh9hNkOf2oMKNZoXPBDQCD5B1ItJJ33/wzTrEotJCCZc3UaEbVyPkuvV4XIFu2YmtTUMQ+O7rYmJH0d2UyHMYEOqlaDyic3abAwXpefBCLfnEzwMLl/HYQIGvczXZwX0snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N48p8tnbzY3wWIuJc5smU8KlvaArOyCUVeC+47sEU3s=;
 b=eJuXdvCJ7uDrRssrEDIhwUn+BThXW7xNBDBbYz3MjXy7Vp6wh5exS9VXpECMjRrZvG4T31m7AZw8tkaiAYA/qMfPpfCZGeQY3RAyHd2Wna3PDr9tTRkGiOilpRBb7o94BjJnp56qOfClquFEDlEvL4OEQTU834Za+kxvUAOOEDTn7L/dUAA0mAAsrf9IcyN23u8P898TooX38OFczNhGepaaXve5Ex1nMbdFd3oLxLW3wDbakOThy+FQOzVE1by+wjwuyuOFm3d6isBYiytlTn5p0l10ivJehtOM1mKn2AFAT+p2rlmhal/EizcYlLO9Py4rSxFUpp2ZX0rcqksaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N48p8tnbzY3wWIuJc5smU8KlvaArOyCUVeC+47sEU3s=;
 b=cm+bD4EppMxUDSfMFPn2OcA+qV91fHNA4QryU8qRDKzZWycD72iY7CQkN+8NBn7TltSR99D+4gN9AXU4MkGEUOuGen866+5hocYwabClZiDV8FX8lqj6tbPDmpMnpUGFyoOer54EGfFFUmRJNnbi/gy+PXG1ZvfMNRuQSm+yUp0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:48:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:48:20 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-ipython: Upgrade 7.18.1 -> 7.19.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201102100303.2377-1-leon.anavi@konsulko.com>
 <20201102100303.2377-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c34fe066-f4ca-87d7-7865-503d2e3de8b8@windriver.com>
Date: Wed, 4 Nov 2020 09:48:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201102100303.2377-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:a03:2ef::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 14:48:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ff09db1-ef23-45af-dea9-08d880d0abe2
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50854F45CB0CE99FEA599F1D9FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y436aDir+RvnADt+TRmruTErHnrYkPhLiNqyfscvboPy+qJTDWP3TKZFGjbAstYtyhJYbCaqiMZ5RarRi1/4YKyLzLr9SyZpEtlXO035G0PFhdW01hC8kvoGFyMBhJTOQfPwzH8+mltbqNfxlXjfL1Nf3iSDVDZ1eRkOiVCxBwReqSTSe8p1plb2+Fj8m3ug2R90XJm9rHXDr63FlNfZxJReayEG8287mpr6CCjgxG53MWdNLsGh9la98dLWHB7wq5hGM4H8sdQZS/sfRRPfLUAlXeIOtioqrIPFlRZG1BEyGcfZufxgAmQyxamgqSi+tUtY3oIMyAHLEPhUjiTjB1h/QL5noDPGMosNe0NSTujDzuvuZkIMF+oavx6BQ9nuLnrZMC0VIzbHGUB/k2LhLQw3Pn+ntw73y8A50makfrEiR41w5a3H4qTcceYATruHnr3OoEjF/ve+E5ypForAvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	94QTvhfzKRESiHvXFpA3bNnNAi/gaNJBHHCn0mO2YdVStZiMypLpNY9NZigU3pVdFSQMM2Mb68ahjVhrVj3yl0eRlSYi/FU86rNmnBBoMJWeEFUaPN7p59uZ1Rd//ikfrBvbHPZksR+v/UuxxnVws0j36R+Y8oTSAi68LxMN5KmDGRR8JKoaBvj21+QzfdnEXWOK01O+CKFKFJHpFQ0IhrrY1nJs+m0yGlJMIQ77sHXifw1vGxeYaBIIbPwOlwsTyrOdRbyzjZEg8giC0BiDMmb+j53DLRu1Z9Nzhn2QskolbX7/imSVgXB2+myXPZrXDrBslR6FM5ATXlPaE1k8XbR0d3qh5VlO7cAaBollTKH32fISRZIhholaVtlr3cFYMoxL0WJYmcaGopukcqZFXnbegD9yzDNu6MOhoMn5zfUOHOuN3vq2A3BKilKVceSFnm+OsyMglVRZfM3YQc31YG7swTwiOc+dnrUdkjkh9rydjWlLwUq2Q3BjgCsetF9MuiL272I3pOQAnuK090r5c+8ZkO8To+u/8VgY0UgxcsNV1JI5fLR9kD6LLTfwO/nhSl0LKc39jZKDdQOzb40na3MPAP+X+v3s4lGolHxGeHAfh+WSNwPw1hpGa4glcAxM2Hc19G9Ej5Ae770JFnatCw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff09db1-ef23-45af-dea9-08d880d0abe2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:48:20.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls+yGS59Tg+2VT+WA7bzqbarTpwBElnp/buna8VrA80sIEY3MBLFynZAZ48JLmWhqq3aFJ32o8cJu1Uin27Q3L9Kp3J5/CDKgN8BfQQ/n0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------02B51AF107042765C916238E"
Content-Language: en-US

--------------02B51AF107042765C916238E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/2/20 5:03 AM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 7.19.0:
>
> - Fix to restore the ability to specify more than one extension
>    using command line flags when using traitlets 5.0
> - Docs docs formatting that make the install commands work on zsh
> - Always display the last frame in tracebacks even if hidden with
>    __traceback_hide__
> - Avoid an issue where a callback can be registered multiple times.
> - Avoid an issue in debugger mode where frames changes could be
>    lost.
> - Never hide the frames that invoke a debugger, even if marked as
>    hidden by __traceback_hide__
> - Fix calling the debugger in a recursive manner
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ipython_7.18.1.bb => python3-ipython_7.19.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ipython_7.18.1.bb => python3-ipython_7.19.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb b/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
> rename to meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
> index 8ee92167d7..d3ce9f5ff4 100644
> --- a/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
>
>   PYPI_PACKAGE = "ipython"
>
> -SRC_URI[md5sum] = "f2db1158dc40d70a31b6bbef86e74789"
> -SRC_URI[sha256sum] = "a331e78086001931de9424940699691ad49dfb457cea31f5471eae7b78222d5e"
> +SRC_URI[md5sum] = "33bdc8287c827aae23699751b0ed3f7a"
> +SRC_URI[sha256sum] = "cbb2ef3d5961d44e6a963b9817d4ea4e1fa2eb589c371a470fed14d8d40cbd6a"
>
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-setuptools \
> --
> 2.17.1
>
>
> 
>

--------------02B51AF107042765C916238E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/2/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201102100303.2377-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 7.19.0:

- Fix to restore the ability to specify more than one extension
  using command line flags when using traitlets 5.0
- Docs docs formatting that make the install commands work on zsh
- Always display the last frame in tracebacks even if hidden with
  __traceback_hide__
- Avoid an issue where a callback can be registered multiple times.
- Avoid an issue in debugger mode where frames changes could be
  lost.
- Never hide the frames that invoke a debugger, even if marked as
  hidden by __traceback_hide__
- Fix calling the debugger in a recursive manner

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201102100303.2377-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ipython_7.18.1.bb =&gt; python3-ipython_7.19.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.18.1.bb =&gt; python3-ipython_7.19.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb b/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
index 8ee92167d7..d3ce9f5ff4 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f">&quot;file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f&quot;</a>

 PYPI_PACKAGE = &quot;ipython&quot;

-SRC_URI[md5sum] = &quot;f2db1158dc40d70a31b6bbef86e74789&quot;
-SRC_URI[sha256sum] = &quot;a331e78086001931de9424940699691ad49dfb457cea31f5471eae7b78222d5e&quot;
+SRC_URI[md5sum] = &quot;33bdc8287c827aae23699751b0ed3f7a&quot;
+SRC_URI[sha256sum] = &quot;cbb2ef3d5961d44e6a963b9817d4ea4e1fa2eb589c371a470fed14d8d40cbd6a&quot;

 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-setuptools \
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------02B51AF107042765C916238E--
