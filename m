Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.85])
 by mx.groups.io with SMTP id smtpd.web09.12434.1614954091409794095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B8GkeOkT;
 spf=pass (domain: windriver.com, ip: 40.107.69.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHLR/YInqGW5uJyWmMyFs4XBT6G7E+zqi7/y1wnyueNtTjiFOE3jFqDfT6gFM6EyY3a/fPEFtFjtgOzoQ1dc4mDR+F8h7ktkZf3vmw5Wd7hQH0ybIKrYcb1nywZcMjQzNK+VwfaMpIO8IPUXvNr0RWPeHJnOYHfHjIK2qtEOA+1+WVllHOA1hQMUYDkRLET7yYR4G/kZjoaW8mXNiNocN8y4lRg4a2PN65z2INOA/vFzBO1jaT3fW7EDW9/bbOhu1vgV5m2/CJes7d6u9ua8pxWcLWfY50yqv1H7p0sWJzNp4IaYjsp3rhfcp63SzHVqDmuyNf1ggW5F61DhiThrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkf6wDp0vDTOEqH+zsCEIwjV1Y1UocNwhol8Hramz+M=;
 b=aW11jO8r2+1SmrXKnIe+e0GaW6vYwFwRdRL1G+ZAOGS5Wx/+m4FzVpfUcFeotYvNQ9iIX2VcsEt8OAg3jsUvLSBAqvZtH1dzUJdwMrx9sM+NQg7bm9Yd3UxK5KyFFmDCunCGKFuyug51eJJsMiez0Dluty/Y3bu6bF1TLQitIlGLibCFH//1RgaNxF19Ru3HGbnrrv+qwEXQLgRiKPmPXppjLPZdMmmzjL03iUC3ArbaI/fcNnjWhcU2i2XvpnVrbcKq5E5D3OCyXNA5mxNfRpqLd6ANwdyq2Zu86lfVjFTzrIiZKtPDOLJnFi4R6uxBgoSPG6pnMtuqpye5V9HrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkf6wDp0vDTOEqH+zsCEIwjV1Y1UocNwhol8Hramz+M=;
 b=B8GkeOkTPUNEUXPR0n9UhtpROs62KAVyD5EjlJ4+nMjS1rLWqOYLnKfz0AxlmsC+F0bKhw1foNJxyf+Uz2q8A6iHNJITORuWKHruxdqwKW11iQivBvyIKLGBBI6dBpxZYbW3yj8/Uz+ruTQHKHu40BFv8ZAPNabtlWkmJq3/L24=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 14:21:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 14:21:25 +0000
Subject: Re: [oe] [meta-python][PATCH v2 3/6] python3-aiohue: Integrate the hue control python module
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
 <20210303133241.29781-3-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <074a21a4-17bf-6024-d3a7-d9d44c43cc95@windriver.com>
Date: Fri, 5 Mar 2021 09:21:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210303133241.29781-3-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0027.namprd22.prod.outlook.com (2603:10b6:208:238::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 14:21:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf121614-1154-4cdb-6082-08d8dfe1f575
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4814:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB481411DABD1880652950091D9F969@SJ0PR11MB4814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IIiKuhLggxUSB+XcBhU4uaKacFrYbn/QwptfaLb48l0cBplywwGlB0RaaI5yAk/vhu+qLNjigRbARyjEatY49Pszgo8xFbEj254fLw4ibPzV0Xyd39P09/VByfVf1C1O4vpvINCtKRYVlW1GOeMkPqhxJUElFu5yliaC2oY6v/Adff5Vu7YVpGxiocMYF5fTAGUbs5xT4Ra9y+ZlD95DHJdXSvxs67uPuUimHdHYClFgAYPPiHH7Pb5FQF3ZOA8vqIA40jzeU+ivV6koA2zHl+06xWqDnvqj+rhxRVbMU0CZRzuU/BVvCPklrGXwjHgOt+QKUmbYxpiqtD53FBfOP0p8TXuTNJZPbpk6EUedBBnVLGXEIRt6otq/CkqZiD5N7aWDc0uRaHUw7G2drQj5xpJ75AjNsiUubzm8jxoKXhouBKKAeJ8NZv+GFsLc1uiwtjnU5gcoOcohbBHD7tGK+A39HtBM1oYmjcSFkR3E2HuZUwaht32YuP9yGc9UQ9u/OW8cHGbdzQBVbLcyq0eWng4u+lSy+YElKmduoVcpssb5W7rkGbNvN/+u7+lMreT0jEu5bwL3CBLMu2SNTM+EDi0uHlFRbXqrf0+XFRoZWP+TnDbjhVhYBykWPuDh+E0rfFVg2Jt0gmEL3Vw2eP0wgbOE/cQCb9XJKknTUVbTDuywHvylouqW5yZJcCbzGoDB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(44832011)(66946007)(36756003)(186003)(316002)(16526019)(5660300002)(26005)(66556008)(966005)(8676002)(4326008)(478600001)(86362001)(66476007)(2906002)(53546011)(31686004)(16576012)(956004)(166002)(2616005)(83380400001)(8936002)(31696002)(33964004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bFMrdVRZa3FqKzBvU1VIeW9vZ3A4clhHZUR2eFR5UnpBVlRBSjZmSmpsVDU3?=
 =?utf-8?B?VUZibDBERHhlTXR1cDQwcWp5bTN4OWJEeXdCQVJuUG12WVhweStncjZZYWpO?=
 =?utf-8?B?MjhaQWR3dVlXQ1pMWUUySjVUa2VQSytLNTlYTld5QUFBeTIzOGZNWExlM2dh?=
 =?utf-8?B?cFdYOEJ4TzBUR1VTb0w2ZXVOZkVpOEFDYTFUNmpSNFc4TjA5L1VaVVpmaVgz?=
 =?utf-8?B?V3BJeHk1Uk94TFNGZ3JhT2M5SHhPdGZHN1FUQTdlSXQ1bmsrTWlCaWZNWXh5?=
 =?utf-8?B?NkZVYitRMEpINWpIcjVacnQyQWREVys2aGo1dzhWWHc0amNSWUw2U3BzeWlw?=
 =?utf-8?B?OUxoRzMrbnE5ZHRKdmJTUHBzTG1PelMzY3k0K0JGVkZGWHRqK1padFRSSXlv?=
 =?utf-8?B?dytrRW5NTkZXbXR2YVB6enpuUXR6dlJ2SUZHdXVzMlNFMzBwTlNwckdJZlZQ?=
 =?utf-8?B?VWNEcnQ0Q2d1VE1odExOME42U2dFM0tjcENUdHpKMGVISlVYV2t2Z1p4cFZH?=
 =?utf-8?B?RjgveDc4Z2ozdktzeWh3VUZUVU40NmpPRHc1L21mOXVHM1hpVkd5TGNTL2sw?=
 =?utf-8?B?ZURnRCtOKzRPWEt1c0cwcjRUVEhqc2REaVZkSEw1dmZGYlMwdjNDWHNwM0tO?=
 =?utf-8?B?TEFBUENxTk9YUWlZMHAvZ2VDMXZRdXlFbVVrZVByVkNyRC9HbmpkTFBzUkZG?=
 =?utf-8?B?S0JsQmNiWGJSaDRqK3pZUW0rWGJ4R1ZBQTNDVmVZWmljZ3lEcFNGYmsxblhv?=
 =?utf-8?B?QTJkd0lsclZoN2hmeUdaOEtSSC9Ta3RGWDI2eFk5b0NEaW5Xd1h5dHlEZ2ta?=
 =?utf-8?B?Rm04d0thekFQVkRXWGRHa08vUi9WSGx1aU12dWdGQWlROFM0SURjUUVGQk5Z?=
 =?utf-8?B?bG44Uk53eE5CdEUxb3p3QmVUU0FvUlJyZEcvaSt2Z3ZuNXVVZERnRDdwU3JN?=
 =?utf-8?B?eTNYQkNFYnZjejc1UG5FVUlxUVdLWnorUTV3SDZCVlp2QkNoSDE3RkNhd0xP?=
 =?utf-8?B?NHU0bWNxSmhZeUJKRHJiVnJLMUE5ZGdPYk40dTFsbk5TWWR5dUlzcXpyUG41?=
 =?utf-8?B?TGhLWUhPeWxvZlZSd3lLWGY1NlpDbVlIdXRZQXA5SXdwazA3akQzVmVvZG5E?=
 =?utf-8?B?Nkd5amNYQW1nMllMMnBhcld6bmpVM2NYT3lJTGs5bmpEUlVlSHN5dnlsem5K?=
 =?utf-8?B?aUQvY21HbWU4c2t3b3h3QWk2L0Q3bWhjNzhoQi9oMC9YSFFEUmg3SVVzTVdO?=
 =?utf-8?B?aHRxYXdCdC9sWUFXdVFERFZCWlB1SzFVREdxWlU0SjlEcnIyQ2o5T0Q0WmhR?=
 =?utf-8?B?SEU2K0ZiSndvQkdnUG5XTkl6OHArSEEzL01qVXNGUnlwRzA4VWNFQ3VESTBz?=
 =?utf-8?B?RUh5NmtiMlp3VjBBWkRwbEY3SW51WXZvdXNiT1ZZellicmlmQlEvTXI3Z3J3?=
 =?utf-8?B?YlF5eEJkU1A4MTJqTEhxR1pyNjhHTmxScHBZRitiMCtNSXhjRWp2TDNweFN2?=
 =?utf-8?B?ZUNVa01MdFU0K3dmdEtpOGdNeVZiYVBWWllnN1NONFNZYW1Ua05WM0lwd0Ju?=
 =?utf-8?B?WWt1TmJIdTZsWThQZkU5dVpwWjNmQmg3Qk9CN3QzZTB1T2l0V1BZWTdHU28w?=
 =?utf-8?B?MjRSWnhLcDJ5K1JGVXRRTlNJUnJsSzNkaEZXNkZYOC9MbVI3NnJ4dTJtcG5F?=
 =?utf-8?B?aVdpcHk2WTNVTXgwUE9MVjBSdDBPc1NLc0NuV05SVDQ0WjNrUXpGZnZHR1hu?=
 =?utf-8?Q?ieygHztN8Tsc7dTbZsWjUQidcdoOWBlsCPqovRB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf121614-1154-4cdb-6082-08d8dfe1f575
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 14:21:25.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbA21CdzJsC+n4l8eBdukiK11ULsDP2Ht36UjT7dKbkmnU9ncSZ76XH6hKvScEA27awdvfva6xXgmwNNZr+Xz1KR1CIUC5DK4WNxWWVRCNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
Content-Type: multipart/alternative;
 boundary="------------E6A8031D0A6796D3ED86641E"
Content-Language: en-US

--------------E6A8031D0A6796D3ED86641E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-03 8:32 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>

The path here looks off. The recipe is at 
recipes-devtools/python/python3-aiohue_2.2.0.bb when it should be at 
meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb. Can you 
submit a v3 with the path fixed? Please check any other recipes you have 
added.

Trevor

> ---
>   recipes-devtools/python/python3-aiohue_2.2.0.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 recipes-devtools/python/python3-aiohue_2.2.0.bb
>
> diff --git a/recipes-devtools/python/python3-aiohue_2.2.0.bb b/recipes-devtools/python/python3-aiohue_2.2.0.bb
> new file mode 100644
> index 000000000..a2a7363f6
> --- /dev/null
> +++ b/recipes-devtools/python/python3-aiohue_2.2.0.bb
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

--------------E6A8031D0A6796D3ED86641E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-03 8:32 a.m., Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210303133241.29781-3-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a>

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a></pre>
    </blockquote>
    <p>The path here looks off. The recipe is at
      recipes-devtools/python/python3-aiohue_2.2.0.bb when it should be
      at meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb.
      Can you submit a v3 with the path fixed? Please check any other
      recipes you have added.</p>
    <p>Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:20210303133241.29781-3-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 recipes-devtools/python/python3-aiohue_2.2.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-devtools/python/python3-aiohue_2.2.0.bb

diff --git a/recipes-devtools/python/python3-aiohue_2.2.0.bb b/recipes-devtools/python/python3-aiohue_2.2.0.bb
new file mode 100644
index 000000000..a2a7363f6
--- /dev/null
+++ b/recipes-devtools/python/python3-aiohue_2.2.0.bb
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

--------------E6A8031D0A6796D3ED86641E--
