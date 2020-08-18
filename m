Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web11.67088.1597759672075589980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fr1PPj0x;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZxK6hjvhILP28G49dgeJWgkY7PFY8E6fEv/9lnGH+URYkKwVC13avuPhgX2dJEtL8gaEL7V5O37KvHokk7up47GDBJQe/sakvSAmZ6ULSE/jPjE3K74v9MH79Ybg6SBmfJbRQoVMEhHY99hgq82oaYgkZn1qZmaKuM5Y1Wd4zVzYRwoyQIgLEmwzs78c3j1KEDCKgSu/4tws8K5FAGQppZLFe8TnNLf6JSuBSmLKgcs7be4n9Wb3dEyEmDR42EGGcLC3+fC9dfJoqwsIoVq1Ff4ufRwFBfTinAOXah+3PRLXpij+OGRVl2LMZB098eCbqoH11P6qA3ebAnb3x0J7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7ukFii8qQ9a1VyUKfHKhbFb4fEY/U4Mk/2df4+mgZg=;
 b=i20f4EDpI6QYrjrxZlbCHhjsIOHWLCz11+bwQMpX+ixz3axrxuYSl5pWVyjZm37eAqEd8qLgMrlZhCi2lEyIinMZtqmyHD0wExKj8C1+5nwbCTC2Iv6wDCDTfaPJ4SIoVNMIQJimabAOE12AbvhraMBS6HrdouHVln5k9woMkWvB77Hkd++jaqUcROr8wWqjxRe5iBPFd1zhMgMryVFDEAr3kxMR6wPrsv4Xz5anROzAC+93KBLuJr4lB6Eb9Igh2n83ihwXWLYw9SZjyyizv/NpPBJOxw0OssS7yUX4J7ztKHwy+gI2ClcGDUkK1+Z5WeGggiaKyp8K9eGrzDA5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7ukFii8qQ9a1VyUKfHKhbFb4fEY/U4Mk/2df4+mgZg=;
 b=fr1PPj0xDKH3MvyuldrA34mLFqowkMnX+vX53+GwMOoMu51VYZ5IOUYxkZwzm1dOk7qMdVfOmlt7sgA57wWoLnGoHIAW9SQyq6fEtElZ00RAetKRha6WouxmJj73rliZ01cNvp2s6gzpQloRZe6J8W8yFwWsliFzqumT57GCK2Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:07:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:07:50 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-bitarray: Upgrade 1.5.1 -> 1.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1be13dbc-b594-7284-1b6e-a3f9c607a50d@windriver.com>
Date: Tue, 18 Aug 2020 10:07:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 14:07:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ae65a2-d4f8-49db-9297-08d8438017b3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33984E75B704190D485AF33D9F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TH6l3yLGDqmHMyWShrhdtSzlA13Mb/2QZea1CMROplljkuPZDDRGMgjS3UteoZXE8ktDnl+LHwTDJ6n3bvWdxdyUNNncELzo/yt4ybjsPkNywbgm8zsb5yMDbTZmhm4DjYnErggorQjfpJ8c1Ef2eUxVxLRCMyIwSkNi09tGCgg9/7ZhjUHb35esH5OOAgm5oauZjMFQFgUUoIsBsEN0xJ5AwugvRrQ6gjvmjP2wRqu+Del2U01WYX+Yy79W9e0G7aSBOLwB6rYHLr2kclQeKn7wiJCI5Vt8KR8CPMR2wwsETTSXisQC41ErnxqZXepR0q2Voq8SZX2obRO8UAk5kXrS1ajoXwLfl2jaBF+6hJ07ORNE2JUsajwxy2ZezL8uqSpdC3ZvdmLu1aOwvLdzfn+bONCwlynmqjiGotWE6F3pNyyAPKQiALkRjYe2ky+8XV+yTVze4cdjlmOmwOF+VQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vxRkP6dWtlcgX4A8Tu5+qPOarQ7AkhRtgGX18puMnMJ7QXj4tcigSCByLL4Zvc29fW2a++0aqMSoqptbQIkEiIo8OgcCxRAHtmZlgfDzzQxVzrDX/X0eM13yD0LwXEXqyu9DihX/Ns+ywI4p4QTjVdpGSpmUsKBu/tUHTzXRN21/MEHSq20Sf8ThOiUQA+la8qrsXs2DWH1MxnRirPGmf1jSvhapKrWKKIKI00M/5EVOpz+N2W4g0+K4ccokZOypcVz62j7anebhHgF1oXvSWMTULSIomEKbcpJ09ccVl9FHvEhU7Q3nLBtnuGY8mxNrhfXDFNM7Cn6mbiPGnXulXzlPioZ5lIAzF4cw8CWnuiaAPX9Lq99dbPg0xMAMlaNW4Y+iRq1tOVOIo+2LpFk0Amll8gs/FqrjZyohEmqIwOxL22rNCqZ8BvOitqVtgQpg2LNQtYfmX80PCQrz7GB51rjzCrkY0vdyEFZtCMqrqv060cD1b7r88U934KCPos22jLNLNPDT287mCdGki8bIF9PbqObpL7hmSLF9561xPCruC9gFWvOZq60LAyO89CmEgo9mjNcVKhsasPDLgFC6OwjgSqrD8XEe2/VtKams1s+oFRVBqeC0gxoTSt1zfnKTIihBmY5nHwzxhQk2Sgc8Dg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ae65a2-d4f8-49db-9297-08d8438017b3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:07:50.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frEPHmSMj9oxzqDDWUNGrSLTS0XDa7RBPXutAMEa1focg34RgGQ/SHqxpjHQeudcAYNSEejx/pWiIX0WgUQyeN4XDeKBGul/8tjU3/1gk+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------796D8DFB07B155FCCA5FF49C"
Content-Language: en-US

--------------796D8DFB07B155FCCA5FF49C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 1.5.2:
>
> - add PyType_Ready usage, issue #66
> - speedup search() for bitarrays with length 1 in sparse bitarrays
> - add tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.5.1.bb => python3-bitarray_1.5.2.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.1.bb => python3-bitarray_1.5.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
> index 70804ad18..15393001a 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>   
> -SRC_URI[md5sum] = "7005b90013838954facbaa231d7cccd9"
> -SRC_URI[sha256sum] = "45bba08bc142781ec7e18a847735219390808f9b6279c356252edddaee1f5fcd"
> +SRC_URI[md5sum] = "ccd872c5effef77bf4028c67c0619f6c"
> +SRC_URI[sha256sum] = "38fe66d5f7720835703a07fe8d0a4b5eda87f692f3cf4fb01543407b79857edf"
>   
>   inherit setuptools3 pypi
>   
>
> 

--------------796D8DFB07B155FCCA5FF49C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.2:

- add PyType_Ready usage, issue #66
- speedup search() for bitarrays with length 1 in sparse bitarrays
- add tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.5.1.bb =&gt; python3-bitarray_1.5.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.1.bb =&gt; python3-bitarray_1.5.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
index 70804ad18..15393001a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
 
-SRC_URI[md5sum] = &quot;7005b90013838954facbaa231d7cccd9&quot;
-SRC_URI[sha256sum] = &quot;45bba08bc142781ec7e18a847735219390808f9b6279c356252edddaee1f5fcd&quot;
+SRC_URI[md5sum] = &quot;ccd872c5effef77bf4028c67c0619f6c&quot;
+SRC_URI[sha256sum] = &quot;38fe66d5f7720835703a07fe8d0a4b5eda87f692f3cf4fb01543407b79857edf&quot;
 
 inherit setuptools3 pypi
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------796D8DFB07B155FCCA5FF49C--
