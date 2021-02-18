Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.87])
 by mx.groups.io with SMTP id smtpd.web12.7408.1613657806451138969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 06:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JOpZMe50;
 spf=pass (domain: windriver.com, ip: 40.107.244.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjmblQm5kUULNLwxTEhZzYIVGcesYZWbT1smILYlpdTnXHpY+oZ/blEIrcZpVCI60T0SdGkelWb3DHydkw/ceUiQZwnwmbzxWDlArzks/uzdPMo6LvU5qrEH0YiRrrULUJKEk1A/XNBIsTUTDtbCDxiGxPTrSHESjpwFJc+j0Z4HFxVCX6CbcW6hu8NVF0DogqihTcbEbZ7OyXaeTUBfEAvGrSMRGhnDaCuewPwBU6cx5p7NO7Ots1Cp7060ezVInskJrzonh0wAQ3B0kCgyKi8iQCmR1cGx1uEHmquY0srINGo9SUXWdHtjZmCv8th48No/iS963w0V+VGV00EeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6zlTcv2+Br9kwATF9MXDEeyZgQTFNQQrIFSuCy5B9o=;
 b=NBhI3hgVUkMtZwBNsj/SQ9tzbktEh0RtSgbupo3HXdMMAuwQ1VWJ6oMh+0oK0aGWnt4dfzJfJMrYsZ1H5mLOccxjivImwbRKR/gPvYMjXs1Xb6024/DSyhblsxVLa/Nc+OIIExvXacL3aanW9bgYif63XPrAzUAR0oIxQK6SWX7QgDdF1HObqXm/fylPOqiMjervk4yPQAzHSgz5VBe0yHCbBPgzLYbz1TAhxweSF6VlKEELC63p8TvAmEHGYqsXFaNNNWDbBOCIZ0UbL/oNEyPZeS85R36KaUtYuvRY/MfFWYHRRK3Guwe3SCY3fwd7pj6aDV6rbLjZZ8cPn8w5BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6zlTcv2+Br9kwATF9MXDEeyZgQTFNQQrIFSuCy5B9o=;
 b=JOpZMe50PosSOhkpymyBzz7a3eRapcpWUbG70y8M73nBEyH1jiqz1pzmi9dYG+FhZtYmIqq/+XCfUQNYbKGHVl1K41mOINH/T+6crRlcIBi2KpDDrF8xUgat+yMGkRwx1IIYVsziOBh5J9oL9ay7y6kvgHwq0S5kVo2J08pWhAo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 14:16:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 14:16:44 +0000
Subject: Re: [oe] [PATCH][meta-python v2] python3-intelhex: add recipe for the intelhex package
To: Ross Burton <ross@burtonini.com>,
 openembedded-devel@lists.openembedded.org
References: <20210217113053.1690364-1-ross.burton@arm.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <087ee7a9-98c6-5abf-b987-d7a80c36dcaa@windriver.com>
Date: Thu, 18 Feb 2021 09:16:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210217113053.1690364-1-ross.burton@arm.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 14:16:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a364803-1d46-4df3-c9d0-08d8d417d1a2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4353:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4353C388963AC2DA155D6CF69F859@BY5PR11MB4353.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c3XuwKpx6Up5hkPKbl4L8gZBAUA1k71dGJk6f0PlJrkBE+XGahZb24as9//oJuvGdp838htLOE+fwHbjzLUh7ryZBYfpjBP3Myn09BIRjoz6Nc7vxBk9hhQTw6g9MU4rpvPyJNIavWfSlxTbImIlWa73AHQ52JVakfQVcRrLl1v0zk5yAgsuh8k8JGWag0HegtufEtWHkKfZgQ230BbfIgPGbeVhzbgEgdXRAKvWW42AY0BySiw38naLu/ixTWStiK89nPclHtkddo9DYKf+amdu1liSk9jmwrC/zJdkQZ1f7vlYT1aH4pOWzuZDF+pLBUoNnvp6oOvwe4JuBW6TALe4hZ7R0Chm+j9tCCqje5DMb2TI2PgjTxZYzn0/fG8n5PaC5sJC84Iw5iljRUNb7y7qovoX66sEFETh8spgNs4WOmwE1FbKgxCNRi30yp5fMa6a1UgIAhgBS8GI1mYsZK0budo/0hIJE8FCPgQJHKPTt9IznM10NA/RH826AXWctaQHQMlNtj7GxnuMz3fgh2Q61nLxXx58XY3T5Z7cd7dUahH6fq6IeyDehFr1V5qdGy7jU7xqd+yOgVxRlTAXYWHNkd78DGMg9R0p8tDdnMb+AmgFalg5vDSfmf9/+d0jsIh4vf9IO1qxMb38vYAKtMdXNxpk/O+iaHoezXv17iHfQSPrABsX/N8wwTZpkOJN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(5660300002)(66476007)(956004)(2616005)(316002)(166002)(83380400001)(16526019)(186003)(66946007)(66556008)(44832011)(6486002)(86362001)(966005)(26005)(478600001)(8936002)(52116002)(31696002)(33964004)(36756003)(2906002)(31686004)(16576012)(53546011)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aTZnWU9oYWdvOW0rajNUTGpKd1B5NUJKMUthZlk0a2pXaXdYTXZVRmF4MGxv?=
 =?utf-8?B?M0pOMzVkR3UxNTB4N3EyRW9XaUsxbzdDZkZWSWxheFlmd0RvSjRCNXhGbm5N?=
 =?utf-8?B?U1cyeWdWeXcrOUxxRFNtOUpTRlFtL1IzaTJWWjUyQmlJUUw0WHRkTWtXdmxa?=
 =?utf-8?B?VFNGVWs1K2JuVTg4Z1VLL29jekViTkwvUHRBMkRveUNGUjdOZWxMTU1ZU08z?=
 =?utf-8?B?ZURxbCs3MXJ0MmNZSEIvcU1HSHVoeEx5cUZWN3l0bFdTRDJrT294by9yMlFP?=
 =?utf-8?B?N0tFVjlpdDJhNTA1MFpxOU5WR3NvcWwyUGdXNDFEQjgwcTB5ZWRIcXFJSHRa?=
 =?utf-8?B?alcwYTFyWVFqZnJVTnRrKzFpaGRMODlPMXpVaEsxUUlqRzJaV2MxNjlZQXF1?=
 =?utf-8?B?UEpPVEcxd0wzNmcxVUpMRjBHM0lvYVZlRVErSzJOdkgwSEVrbXhKUS93ckl1?=
 =?utf-8?B?NWRjSUxnNUg5ZnVKaE10UTdQM0k2c3p2UlNrZUN0VjMrZHF6Ui9xVjRzajh1?=
 =?utf-8?B?aUUxTTBGdklTS0JkN0tLYVVBaTFKTHRGaHgxMFY5SGxkaWgyUlJMUEZIbmtq?=
 =?utf-8?B?OVJsYUZLWFBDdXFMOHkwK0I2TjNRSGtJUHFLS0pjdk9NTEVEbVEyU1B2eEFy?=
 =?utf-8?B?SVBkczMxbnhmQnIzeHgyN05XcTJxWXBER1F3bkx2Y1U1S3F6WFNqNFFiRHo2?=
 =?utf-8?B?bWY5WVd6WUg2UEt3T215Wm0wUlNFaVlVTVhpckwyQmF1MVB0T0ptK2ZnUHFW?=
 =?utf-8?B?cmNibStYeEZWUk02cytqY0tQdGdjUlRrMWJSaWFOOU5JUXFmNVIrUFJucEE3?=
 =?utf-8?B?WTlaS3I5ZVFadmd6M0t6N3RFUENZUlUzTFZyZFdwWkFyRkk4VXpEdmh6Yyta?=
 =?utf-8?B?N1IxczVtN0daUFkzdURDRDBQMWVhL3dIckIwRjNMN3p6YVJwUDEvWkVWSG1T?=
 =?utf-8?B?QkR6aDlrK1VxektJbnY3ZkdNYXp0SC81aHFZSG1BQTl1WThDVmVVK1VUSVZr?=
 =?utf-8?B?VVZvczRNY0lGNFNPLzFLcVgxMjR1WHViVmlzOGllN3hwMUpiYmp2UnlkUlh0?=
 =?utf-8?B?QTZTOXIrSk5mdXcyTUs3K1M3VmFUOFkrSXA3VW9HMnZhZmI5YlFqMkFnTjNu?=
 =?utf-8?B?czljWHE4ZFJKTlpmVHkyZ3JJdkF6R2QzSmlXb0JueTl3dHFPOVZLTUdCdTNT?=
 =?utf-8?B?cEExU2dUcDA4QndVdm40MTVvSElzWmM5WEZvL1l3aTk4bVowSUlNcnc3Q2dx?=
 =?utf-8?B?YXJUcllRT21UNDRacXM3c2pnNXdULytqR0kzZnZyMTZyNHFlSnNOaTY4YjVK?=
 =?utf-8?B?bjM2dG5veHNJakROd2ltQi9LeHVaN2JRcnhKZ0ZSQmRJNzNvZ1poV3VJZVVp?=
 =?utf-8?B?RnlXYS8zNVZGbVlkdGFCUzk0UlZYUmg1WjI1UjdKMi9Kbnd3dkxTVWw0VFlI?=
 =?utf-8?B?b3BXbUpBNWZPS2g0NWprajkxNlZUUVFaTERzekRQaDBxQi8rQjl6bG1EV00v?=
 =?utf-8?B?U29za2w0cHNNVEcyMWJ1a0tudXhKaXp2OGdkY0RUNEJZeStjeEppYUNxclZY?=
 =?utf-8?B?L2RMaHU4Qi93RVZaZDViM3VXRE43WlVoUlF2YUxVTnNVWXZ4NVhiU1pnZUJK?=
 =?utf-8?B?RHk4M0kyWmNSK1NmNllEUzMwWWdKWmxlMkVyclpJdVNIZC92ZklMTDVnZGNs?=
 =?utf-8?B?cTN6TkZLNlBSUnNEWExyUTdEeUNKbHRqVzk4Mk50NGtIZFNWQkR3OFFGTzB3?=
 =?utf-8?Q?Rbe1K6kgmYFpLQdFDVQyl99VcOtjQbjeHIS4Z6h?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a364803-1d46-4df3-c9d0-08d8d417d1a2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 14:16:44.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wl51Pg98wG5gw6PDIUdcBNFe5amrEYLh/YPkU5FjUWc9hr3nArvcPZ8tSObUzlbokSowqFf3vmpm66SOvD3kl1d7lpzS83sshT4xXgo0UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
Content-Type: multipart/alternative;
 boundary="------------8B22D1A732603CBB708463DC"
Content-Language: en-US

--------------8B22D1A732603CBB708463DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-17 6:30 a.m., Ross Burton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb          |  1 +
>   .../recipes-devtools/python/python3-intelhex_2.3.0.bb  | 10 ++++++++++
>   2 files changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index e31b0b8b40..635dee1942 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -170,6 +170,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-imageio \
>       python3-incremental \
>       python3-inflection \
> +    python3-intelhex \
>       python3-intervals \
>       python3-ipaddress \
>       python3-ipy \
> diff --git a/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
> new file mode 100644
> index 0000000000..befcb34780
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Python library for Intel HEX files manipulations"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4eba844696655c3eae07aca8e3a94772"
> +
> +SRC_URI[sha256sum] = "892b7361a719f4945237da8ccf754e9513db32f5628852785aea108dcd250093"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> --
> 2.25.1
>
>
> 
>

--------------8B22D1A732603CBB708463DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-17 6:30 a.m., Ross Burton
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210217113053.1690364-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210217113053.1690364-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb          |  1 +
 .../recipes-devtools/python/python3-intelhex_2.3.0.bb  | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e31b0b8b40..635dee1942 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -170,6 +170,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-imageio \
     python3-incremental \
     python3-inflection \
+    python3-intelhex \
     python3-intervals \
     python3-ipaddress \
     python3-ipy \
diff --git a/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
new file mode 100644
index 0000000000..befcb34780
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = &quot;Python library for Intel HEX files manipulations&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=4eba844696655c3eae07aca8e3a94772">&quot;file://LICENSE.txt;md5=4eba844696655c3eae07aca8e3a94772&quot;</a>
+
+SRC_URI[sha256sum] = &quot;892b7361a719f4945237da8ccf754e9513db32f5628852785aea108dcd250093&quot;
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
+
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8B22D1A732603CBB708463DC--
