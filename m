Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.47])
 by mx.groups.io with SMTP id smtpd.web08.1975.1610121903162249330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aA0WFJMC;
 spf=pass (domain: windriver.com, ip: 40.107.243.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky2jLV5f0leANXXEcT277B5oI/T1udANdUpdK35UDxZFnCzSjrgKIZ+9I1MAi3SG8VsODY4otNnvLuIhH2j8lJKbk5o95ngf7Jh8FmZdEnl7ZNn00VSUVJkPCoi5dM88YcdOjrp1ruxGR2N5FYyuOEKv0+YJOD0swBXTvXX/+i6Xkof3Xf5LrHGq6OZrkKZl+aJonXSzIFeEgslswPe3bu8jPZPIZOzP8oIhg4yxkhwLLctj1g1gFwpNQAKdLMaPXbzfKvIi+n051E6LeWsxPK8iZkIPXS1oxk0NROxsh+PBYbGLgzdSQLDSUdW45AyTBLLtaqxOyQudODaUBmoXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETX8ltsICvLhKsBK0/dOOrrPLzm/lcUEOchPINc7AsM=;
 b=S9CfHMPdl999OiPtQLNzVaBEpc0C7ao+Xglpou+h0NA2QhiBupGkUQq9UQ32mb1NsM3ORgIx9mTAhnNlrHLgXtapb2V2k9NYPJVKUh6oF86uWC6KoADiKO4CdilieZkTw5FD1NQ5JlnO/FamlcEKT0Z+q4b30Thj5aKAcrDkBtlkdxmfP6MIz+HVcxqzFxoRMjROcKwXzKYT+SXJQVZGPs4fSUoKQA4gyXGJmXXe2b/GqEHSL0GxoyMDntxAx5gAB79gks4JT/6L8KsofhHrG3OgeBSPIoeNIv68W3uvbSZ+K751H1dFllV+3c6v/Hk9+ZakGP6ZPY7D8uEjg5jJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETX8ltsICvLhKsBK0/dOOrrPLzm/lcUEOchPINc7AsM=;
 b=aA0WFJMCLei0qZ5V2Pingpnq5ZIAMBbbpOGfiyd6FsH/p87/ksu1zOYYcMywuvDGTdRuwZ7mp80ing+nneFumNqnfXq1OELRsekilx7eA55zeBmIdXj0AA4OrRUmYDCdEbwiwKoHtcFGG9jWpYitqvwoZGwVwZuE4pI4KeusKNM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:05:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:05:02 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-pandas: Upgrade 1.1.4 -> 1.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <083e8644-6245-044e-5cfd-3fad602e5c96@windriver.com>
Date: Fri, 8 Jan 2021 11:04:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0001.prod.exchangelabs.com
 (2603:10b6:207:18::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0001.prod.exchangelabs.com (2603:10b6:207:18::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:05:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10c917a-6b1c-4049-c528-08d8b3ef27f3
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896ADAD149CCF6C382464219FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZEO9wLO2c01R3p1Xd7W1Ze/jWJGMFkqkxBZlaMisB8MUKi+LPo++h0tuCc68SuzQ5g5BgZcDaHePAcViWPLZnmeWWkQAggnocCkRMaHbAL/3KIHSq0nVR2k+bq1xQzskoIzahE8ILwtHJcnOF8qeXLJ1sRbWNLed71jLi9tXYw26ylQvZ95JV0K4viwSzjsDUKw7CIg9orIQBm33wUTCV6W07WGs/88SShMGQyDK20g/GK9mzCtJyXtzsc2S3XOaoy5jzP5Iecl1sPbqGvThkww0WeIojpbJLBGH5KWoYOYxpArw2l12LQxXosBWwPAIb6dfhlXGf1eQr6phholi/OampROI3kvjiH4ndtBGx47Hx/Ja1YO3mzYM7Gc3Rv4cB0kYvvaTX+t+nKwBOaggjWy2HdkQke1iMj+orhM7Vv6Vjn2LijXdJBQ8HmgUm5EHEEUedoTpjBAdEWwcjc4+xVaFIZGxcubWSLKaKAqzxW6G8LUqtN1mA+yUgp0LiEBChw9jldKiOBromnKWOyyQ6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ekxSandrQ3p3bHFtMzVmMjJ2S0RNNEV5ZlNkakFyZS85T0sva0FRcmNxWjZE?=
 =?utf-8?B?NTRXaSsrbjZGV21ydW1mRWNNTnlyVjBON0JYR3Y1QUJHVXA4UVBSRnVQWnkw?=
 =?utf-8?B?ZE1hRzR2TE15T1FvRktrY2txc2twSGpXUnFkTWgzNVhteTZWUzNVb3BoN3Uv?=
 =?utf-8?B?SHlrM2lTMHpVVHZ0Qmc2VWNGa2d3MGE0VXp5M3RydFViWmlXMnAzRnV2U3Rz?=
 =?utf-8?B?WWhIak5mMGx5UXRxbVRuaHFaQ01YdTdEY3JLVm16MUtLSWMzNVNpbWNDRFJD?=
 =?utf-8?B?MFlTdHN2N0NlT2c4V2F5TXNRbE04dXpZenRMS1RsQkUzUnRGNlpsaFZ3Qi9p?=
 =?utf-8?B?ZFlnNjM5UXFQdjZkZkVOWkVLaTR4akdmM0F0cE0xdTdud1owbEEzQW4xZzZn?=
 =?utf-8?B?YVAvUGt1RlQ4L2J0cWZiTnFXcnpQMmlWLzlITzlhc2QySVZLUWxwNUVITFZs?=
 =?utf-8?B?UHc2ZlNoMnY2aXl6M2o3NW9zTDlLSllETGxucVdadmRTVmR4dXRCeDdMRHBu?=
 =?utf-8?B?NVFMRmpJdG5uWE5DY3E2d2p3M2k0QTkrNnVmUGR4Rkk4T0hjV1hDbi9jUHMx?=
 =?utf-8?B?MGY0RS9XUUtPZkwxTjNxaHIvTVlBaFA2OUcrOXdUM0pQQ0ltWCsxeWszWEhF?=
 =?utf-8?B?a0F5VlNkOS9QOUdibzI1VzhNVUlPcTQ3MDVqVEloUjJrVkgxWXlPNWM5R0Nt?=
 =?utf-8?B?RWpkTGJWZk81WW5QdmQrWmEvVTdBWkVQL0tqZUhRV0luaTdSemZOTXhpS1p6?=
 =?utf-8?B?c01sbWh1QWswRmNIZnpWRlpIQmVDdUxVU0VsRVhuTUZvQXp2UWlzVW85cFZs?=
 =?utf-8?B?WGx2VEJ1Mk1ZTHE4bUlIeEhjYzYxbDd4V1NjWVJLSmFZd3F1dTJxc09wUzhN?=
 =?utf-8?B?R2ZzL1BNZWRBNzhVazJxczJDVktxNXk1V1NoeHF0ZnJTa21zclpYNHhPc0VP?=
 =?utf-8?B?N2I2WG82WGxOTDV4RVQxYnBBenlTeTFyb0VRQjRhN29nOEpwdFF1a2h6RlVW?=
 =?utf-8?B?Q0ZmeTlvRjh2ejR5VlBFaTZFb1V1Y3kwYXlLN2hINkdBdEF4dHFjWlJqTUxS?=
 =?utf-8?B?ZlJSOGVtb29Uc3dOYllNbFZhaWJGWGV5eG1QeXU4ckh3dDJkRWpocFl3UlZS?=
 =?utf-8?B?eHI0cFc1YkVjcVlEdkhkODhEUGZKa0lzSEVWMlpwNEttTWtOeUVNRmZZRXRJ?=
 =?utf-8?B?bWMxZ0tPcXlBd1IvZEdtYVJ4L1phendVY25yd1hBeXJmb0Z4MlFOOUF5b2sw?=
 =?utf-8?B?aHl3eDBpVGJDdzVrN20xY3U0dERzSUZ0YW0xOTRxSitxM1NNSnlzTUc4WTc1?=
 =?utf-8?Q?ilqKcqZsS1AivCpURNm2u6ORhNffAft+qp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:05:02.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a10c917a-6b1c-4049-c528-08d8b3ef27f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f7qREvjiAVE8G5ZJ/Hb9MnDt0JUXtAgZginLy3BGWPnX4O8CV3/5JgWTuaJyD1PAKa31l9xFc3G632CnkkoV/HfPIqgM10zU2yaRWkcP4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------B0CF4B1DA5606A31B22746AD"
Content-Language: en-US

--------------B0CF4B1DA5606A31B22746AD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Optionally disallow duplicate labels
> - Passing arguments to fsspec backends
> - Support for binary file handles in to_csv
> - Support for short caption and table position in to_latex
> - Change in default floating precision for read_csv and read_table
> - Experimental nullable data types for float data
> - Index/column name preservation when aggregating
> - GroupBy supports EWM operations directly
> - Various bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.1.4.bb => python3-pandas_1.2.0.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.1.4.bb => python3-pandas_1.2.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
> index 78730b46af..0cb631990c 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
> @@ -6,8 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>   
> -SRC_URI[md5sum] = "594e6a429f297c77470e37d3510cccbb"
> -SRC_URI[sha256sum] = "a979d0404b135c63954dea79e6246c45dd45371a88631cdbb4877d844e6de3b6"
> +SRC_URI[sha256sum] = "e03386615b970b8b41da6a68afe717626741bb2431cec993640685614c0680e4"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------B0CF4B1DA5606A31B22746AD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Optionally disallow duplicate labels
- Passing arguments to fsspec backends
- Support for binary file handles in to_csv
- Support for short caption and table position in to_latex
- Change in default floating precision for read_csv and read_table
- Experimental nullable data types for float data
- Index/column name preservation when aggregating
- GroupBy supports EWM operations directly
- Various bug fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.1.4.bb =&gt; python3-pandas_1.2.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.4.bb =&gt; python3-pandas_1.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
index 78730b46af..0cb631990c 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
@@ -6,8 +6,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>
 
-SRC_URI[md5sum] = &quot;594e6a429f297c77470e37d3510cccbb&quot;
-SRC_URI[sha256sum] = &quot;a979d0404b135c63954dea79e6246c45dd45371a88631cdbb4877d844e6de3b6&quot;
+SRC_URI[sha256sum] = &quot;e03386615b970b8b41da6a68afe717626741bb2431cec993640685614c0680e4&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B0CF4B1DA5606A31B22746AD--
