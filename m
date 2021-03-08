Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.64])
 by mx.groups.io with SMTP id smtpd.web10.35771.1615212313741422446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ljk7p8jA;
 spf=pass (domain: windriver.com, ip: 40.107.237.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToUtxNtaXIabsYa+2NThphyXsSb20ENZdsGw7KQAUO0wCru3MUplz0e6Ie/VcwG3FdwLwfTkhk2MMFMbHUM0/2BKVgifTa4AVnvnsVGvU+ZxUdlnw5igDRgMS7TwvEBKjeK99217DCSn8Ev9etYg701ogxllCPVow1tLe3rwBHc66a8XqgKrPJkOs1A4k89F3OKsMrVgCp7O0rdrrO1wICrfPHJZoqAk+WV+5vzef3G54E2tjUrtB9eOzkmHx2cKpeGO+kQ6TlmMZ3Hf5MAHiZztpweq2x6JDZgHKW7hxdrZ1bUYkA0yjALtgxc1w9wYH4SO+qF/97BTyUOPP8TuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDlbh2WUuCm5G8O1RIJ5Nal1ymLzVR3t9Z3aRdvuQyg=;
 b=WGz8y1q8p0GYHRQQ4riiX5YMGoNi+CNXWTO+1U4hsHtErpYcliLBnrpuSCXLhTng0LMR8L6/f6R3sIi5yfT921ULX59D2UrM2MVtK2GIvCmDCRKbpDb4ntdojPawIq5zP/5Z4pYPKhhLAHgBLwRYjZd7G5GJ6PLjDodX+0tJJB91rkIOIl4Lky4WNCfzw6mQrody/DfnxQRhZUC2yJsiNRbLDtoD+PDuzWlhCQtRbBWjJvPV/HQ38nL5ibtsQTLkfuEK2QZiPc0xIExQNwtK7iTn1et0NDT6bsVnFQQDtH3jo5nLtdUHLyybWO6ggRQFckezBTb/3c9kJ4qRaVvFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDlbh2WUuCm5G8O1RIJ5Nal1ymLzVR3t9Z3aRdvuQyg=;
 b=Ljk7p8jACErSW2WvuO/eg0KJkXaqjvWT+ckCcrZ2qhWR+dKvgM1gxdIMH4UrhgPlDVxqtukT4gvNcAMr9fbl3i28v50Vi4iruljDHndp7LYb0EEjr1J1dD1kpZt4oUA65G4Wtq3NgO+GbjDeW4fviWiGrlrQmQ++bgpjdCdT7Wg=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:05:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:05:12 +0000
Subject: Re: [oe] [meta-python][PATCH v3 3/6] python3-aiohue: Integrate the hue control python module
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
 <20210305160256.3333334-3-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6352b5f4-eb70-5714-385c-01618eae8593@windriver.com>
Date: Mon, 8 Mar 2021 09:05:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305160256.3333334-3-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0735.namprd03.prod.outlook.com
 (2603:10b6:408:110::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0735.namprd03.prod.outlook.com (2603:10b6:408:110::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:05:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ddfdf36-af98-4ce4-fe16-08d8e23b3086
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32565F67FA38C205BA78C7949F939@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+xQh+dFQWXYB7FEPSbi70XncwdIFFHQRYk1fAMlFS/1vhXAhIX5BwJk3jV3N0kJKFUQUlBor1qQ8f5QgDd5h2roFoSM4Gc0QyAux5le6Zb81/3Csx9ISefdahGXelRwqYx5c29pCK6DI58dzetJgn4xsSu3+2bgYIR7ydS6u6Likalt4JeVzv3PTxl31QAY+wrxB4CK3I0b5kONmb8DB7gISZ52HDWhRnaw8IfHJAlBsuYATtqDrHZ/cV7H0gQu7Kxp3HK+9Z0w01bZ6G7fuAcFvZW8fBbRocis7A+ByhwdF6pGqutBusri3JbZ9eHmy+gxew2fWFutWj3sFC6WjMgI5Xlf6NmB4C0w9Ph9PHoPbnl7TejUIPNYZRQTnP4jYUEUE9w+ixZKsuyU0YL5K8HmVtkVcYZ5swcdk6e0/G0EDP+oDIAm+/CUJtZIHGg264v9+iXUISNZ3yTGRQtO0dPEtaAX4fgJY662Ejdm7xv8wiebtVIndKvLZFfoJHDXV9rJbe3lfZLMWOh/7H0EZgf449+FjiYZjvjr2+RfoG4naHYAX7wmfquabUvu2WkYWB6bz4yyDmWOtBnDmyYsfD90gE9MTSwTt8bry25raie7T7KnPGmkwYfdKYZROUWKg7xLCHxSPh5X7OopXtmzIliZaW/EvYAs/YyNLi/Ki5BPS1XytBVUlgne4GCx1zPeI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(83380400001)(66946007)(2906002)(66476007)(66556008)(966005)(166002)(6486002)(53546011)(16576012)(31686004)(5660300002)(316002)(16526019)(478600001)(186003)(33964004)(36756003)(8936002)(86362001)(8676002)(44832011)(26005)(956004)(2616005)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OEdPbTl6TXorVWprcUd6OUJBRVRqUUxsUDdsZTVldzVEU25KTmFlNFZTcVlP?=
 =?utf-8?B?RXZ3TkNId01VVmJPQ3pnOFVDQnNQcWUzcTFhMTRjUmVIQ1N3RWl4cVFPUXo2?=
 =?utf-8?B?TDR1b1dVT1pCS3F3L1c3by95ODE3SHYzeVQ1MHpLWWY0cHhqbkh2bEJxaGYy?=
 =?utf-8?B?TktMZW5Ebmh3N09uaTkrZXBka1dIemFBam1FQW9SQ1hReXpUZkk5OWdHWG1D?=
 =?utf-8?B?aEJuWE44QksybUpCRHloMktLRTBGdXVxdEpLeDlqbEVQMFBDMHA5S3N5WGZK?=
 =?utf-8?B?OGZOZkRwbW5WdHptbzRXOHlEaWR5UlVIaW1OUFhLODNTa1NwWGwrNmNBL1hH?=
 =?utf-8?B?c1RFRHpZR28zWElTZTJzcU1jb1p1Nkl1M3VPMjZiTUIyUktvdFhkRGQyZHR6?=
 =?utf-8?B?cGhjd3dvSFJ2UWNDb3hNTVRvckl2VHJ4bk9NeGdibGNIWU1OenhJai9mQm5u?=
 =?utf-8?B?Zm1oSHpSNUZoaDZKUFhzT0RkRVpicGxGSkpZRHhYeHREZG5WaGhZaGhEREl0?=
 =?utf-8?B?RXZnWk1SMzBINWNnT3lobjl5VUgyaEhDSWdnM01wOFFnVHJEamJDNGllUVVa?=
 =?utf-8?B?R1FTS0VDU3lheTRrM0RkKzhocHlFV2dpajFPdGpZTUhyRFdMZXJTNnNpN1BF?=
 =?utf-8?B?Z1pQL0crbEx0eTZQeEF6VGMxOUxITVovYktSS3l0MWVpbFhjRXJTS0toSkd2?=
 =?utf-8?B?RHNOWGtqV0lqZk1LSlhDVmdVc2YwdW1LOXZBU1phKzdaM0RGdzVhbVMzeDBK?=
 =?utf-8?B?U2tBMzRRa25pc0hYaC9CcG4vL2lSUlNHcHg3NzYwNVd1bUlTaHVwRmtZYkJt?=
 =?utf-8?B?UWdMekRQdVVmNlBYKy9GMEo5dFBUWVkxRGczTTh1amFoTXVwclNubFlBMkx2?=
 =?utf-8?B?WDhiQWdMVkRnaHNkS0VDalhvazhsVUt3UXZvVzdOSVFqVStnOTFQTXpIR1J6?=
 =?utf-8?B?ZkpOaTNvNms4WXdjZS9WWVNpUGk1a0FodkFuVkZnYlMwZXdMLzhNWWJBMjc5?=
 =?utf-8?B?YVYyUTFmakpzUXkxa2wrVWNpZ0dIV0VnRGRMZlZDL2RadzVoc0pkK2UzVUhl?=
 =?utf-8?B?ODZBMExOUXJXY09IOU5EOXpWMFF6NU1md01QcHQ0RVhtckNONURiVGdhbTRR?=
 =?utf-8?B?NWlzcDZyOXlTTW85eDhJRzhIb0Y2WkFRVHRVMDR3ZldlTGExcWREM3ZNd3Rj?=
 =?utf-8?B?ODlDV3ZGNmNWTzJZMy9CTHlhK1dCV2tPdEwyOXB0RzdacjlOa1BFc1hJWXc2?=
 =?utf-8?B?RmtQK3p0UTA0Z2lRTHh0d3dxa05RQXp2Tms3b0tsOWZyVlRzelFCL24vTTlE?=
 =?utf-8?B?SW5mQWN5QWEzL2tSSnZmeVN0QmdBd0RnMFZ3QXo3MlV4OTJraGJSRldQcGg4?=
 =?utf-8?B?Q3l2NGlIcU1SNU93ZTdKVmtqRDd2cG5SVVRHWEZKdHJFQkhwYXpXZ3V2N0Rz?=
 =?utf-8?B?TEVNV0lONEszRjZoRVUyKzVpQ1RJMjZFYzR1OTBzSXh0bmh0RWJmdTUyTk9Y?=
 =?utf-8?B?RnQ5R3JqM1J2NzJlLzJrajh1bnBHc2YvSndGL2tOU2cvZml4czVCYjY0aSt3?=
 =?utf-8?B?QjJzMHFtVnBEMVIvNlVPS3lIYUxWMGh2RkxXOXlPamo1SlkvVUF3MGpqWjhi?=
 =?utf-8?B?ZkJPRnpRejg0RDQ3bkFuVWZiaVJTWUdSWHUwcVVqV2gxNVdNT3dzdHV3VEFG?=
 =?utf-8?B?V1czT2Y2UHozVjlVd3pBdXl4aUR5a0s4c05XTVhxVVNIT1JMMS8zSDdLOElz?=
 =?utf-8?Q?OqENPHgLwag8rxxvl+lE7tjGIoQekf3CD0oVn2k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddfdf36-af98-4ce4-fe16-08d8e23b3086
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:05:12.0364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWtS9OSclgpXPHvWn1rXrY+AlBfLBfFKm+Lgt0msM6zwx7+jztUj/AI8I61eT76aaJ/v8UvT9lp7Ayg1UCo28XaR1xUB5ndT5XqV8MrXKlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------64E0DC369637E7BC73E875DC"
Content-Language: en-US

--------------64E0DC369637E7BC73E875DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-05 11:02 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-aiohue_2.2.0.bb  | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
> new file mode 100644
> index 000000000..a2a7363f6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Asynchronous library to control Philips Hue"
> +HOMEPAGE = "https://pypi.org/project/aiohue/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +# No license file available but the license is specified in PKG-INFO and setup.py.
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
> +
> +SRC_URI[sha256sum] = "35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
> --
> 2.30.1
>
>
> 
>

--------------64E0DC369637E7BC73E875DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-05 11:02 a.m., Andrei
      Gherzan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210305160256.3333334-3-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a>

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210305160256.3333334-3-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-aiohue_2.2.0.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
new file mode 100644
index 000000000..a2a7363f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = &quot;Asynchronous library to control Philips Hue&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/aiohue/">&quot;https://pypi.org/project/aiohue/&quot;</a>
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;Apache-2.0&quot;
+# No license file available but the license is specified in PKG-INFO and setup.py.
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515">&quot;file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515&quot;</a>
+
+SRC_URI[sha256sum] = &quot;35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += &quot;${PYTHON_PN}-aiohttp&quot;
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------64E0DC369637E7BC73E875DC--
